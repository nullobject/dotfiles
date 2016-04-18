module IdePurescript.Atom.Imports where

import Prelude
import IdePurescript.Atom.Completion as C
import Atom.Atom (getAtom)
import Atom.CommandRegistry (COMMAND)
import Atom.Editor (TextEditor, EDITOR, setText, getPath, getText, getBuffer)
import Atom.NotificationManager (NOTIFY, addError)
import Atom.TextBuffer (setTextViaDiff)
import Atom.Workspace (WORKSPACE, getActiveTextEditor)
import Control.Monad.Aff (runAff, Aff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Exception (Error)
import Control.Monad.Eff.Ref (Ref, REF, readRef, writeRef)
import DOM (DOM)
import Data.Maybe (Maybe(Just, Nothing), maybe)
import IdePurescript.Atom.Editor (getLinePosition)
import IdePurescript.Atom.PromptPanel (addPromptPanel)
import IdePurescript.Atom.SelectView (selectListViewStatic)
import IdePurescript.Atom.Tooltips (getToken)
import IdePurescript.Modules (State, ImportResult(AmbiguousImport, UpdatedImports), addModuleImport, addExplicitImport)
import IdePurescript.PscIde (getAvailableModules)
import Node.FS (FS)
import PscIde (NET)
import PscIde.Command (Completion(..))

type AddModuleEff eff = ImportEff (dom :: DOM | eff)
type ImportEff eff = (workspace :: WORKSPACE, ref :: REF,  note :: NOTIFY, net :: NET, editor :: EDITOR, fs :: FS | eff)

-- TODO
launchAffAndRaise :: forall a e. Aff (note :: NOTIFY | e) a -> Eff (note :: NOTIFY | e) Unit
launchAffAndRaise = runAff raiseError (const $ pure unit)
  where
  raiseError :: forall eff. Error -> Eff (note :: NOTIFY | eff) Unit
  raiseError e = do
    atom <- getAtom
    addError atom.notifications (show e)

addModuleImportCmd :: forall eff. Ref State -> Eff (AddModuleEff eff) Unit
addModuleImportCmd modulesState = launchAffAndRaise do
  modules <- getAvailableModules
  liftEffI $ selectListViewStatic view (addImport modulesState) Nothing modules
  where
    view x = "<li>" ++ x ++ "</li>"
    liftEffI :: forall a. Eff (AddModuleEff eff) a -> Aff (AddModuleEff eff) a
    liftEffI = liftEff

addExplicitImportCmd :: forall eff. Ref State -> Eff (AddModuleEff (command :: COMMAND | eff)) Unit
addExplicitImportCmd modulesState = launchAffAndRaise do
  atom <- liftEffM getAtom
  editor <- liftEffM $ getActiveTextEditor atom.workspace
  case editor of
    Just ed -> do
      { line, col, pos, range } <- liftEffM $ getLinePosition ed
      promptText <- liftEffM $ maybe "" _.word <$> getToken ed pos
      res <- addPromptPanel "Identifier" promptText
      maybe (pure unit) (addIdentImport modulesState Nothing) res
    Nothing -> pure unit

addIdentImport :: forall eff. Ref State -> Maybe String -> String -> Aff (AddModuleEff eff) Unit
addIdentImport modulesState moduleName ident = do
  atom <- liftEffM $ getAtom
  editor <- liftEffM $ getActiveTextEditor atom.workspace
  maybe (pure unit) (addIdentImport' modulesState moduleName ident) editor

addIdentImport' :: forall eff. Ref State -> Maybe String -> String -> TextEditor -> Aff (AddModuleEff eff) Unit
addIdentImport' modulesState moduleName ident editor = do
  text <- liftEffM $ getText editor
  path <- liftEffM $ getPath editor
  state <- liftEffM $ readRef modulesState
  case path of
    Just path' -> do
      { state: newState, result: output} <- addExplicitImport state path' text moduleName ident
      liftEffM $ writeRef modulesState newState
      liftEffM $ case output of
        UpdatedImports out -> do
          buf <- getBuffer editor
          void $ setTextViaDiff buf out
        AmbiguousImport opts -> do
          selectListViewStatic view addImp Nothing (runCompletion <$> opts)
        _ -> pure unit
    _ -> pure unit
  where
  runCompletion (Completion obj) = obj
  -- TODO nicer if we can make select view aff-ish
  addImp { identifier, "module'": m } = launchAffAndRaise $ addIdentImport modulesState (Just m) identifier
  view {identifier, "module'": m} = "<li>" ++ m ++ "." ++ identifier ++ "</li>"

addSuggestionImport :: forall r eff. Ref State -> { editor :: TextEditor, suggestion :: C.AtomSuggestion | r } -> Aff (AddModuleEff eff) Unit
addSuggestionImport modulesState { editor, suggestion: { addImport: Just { mod, identifier, qualifier: Nothing } } } =
  addIdentImport' modulesState (Just mod) identifier editor
addSuggestionImport _ _ = pure unit

addImport :: forall eff. Ref State -> String -> Eff (ImportEff eff) Unit
addImport modulesState moduleName = do
  atom <- getAtom
  maybeEditor <- getActiveTextEditor atom.workspace
  state <- readRef modulesState
  case maybeEditor of
    Nothing -> pure unit
    Just editor -> do
      text <- getText editor
      path <- getPath editor
      case path of
        Just path' ->
          launchAffAndRaise $ do
            output <- addModuleImport state path' text moduleName
            liftEff $ maybe (pure unit) (void <<< setText editor <<< _.result) output
        Nothing -> pure unit

liftEffM :: forall a eff. Eff (AddModuleEff eff) a -> Aff (AddModuleEff eff) a
liftEffM = liftEff
