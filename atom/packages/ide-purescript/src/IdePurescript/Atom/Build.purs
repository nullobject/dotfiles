module IdePurescript.Atom.Build where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Ref (REF)
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import IdePurescript.Build (BuildResult, Command(..), build)
import IdePurescript.PscErrors (Position, PscError(PscError))
import Node.ChildProcess (CHILD_PROCESS)

-- This is really the same type but I'm using different fields
type AtomLintTraceMessage =
  { "type" :: String
  , html :: String
  }

type AtomLintMessage =
  { "type" :: String
  , text :: String
  , filePath :: String
  , range :: Array (Array Int)
  , multiline :: Boolean
  , trace :: Array AtomLintTraceMessage
  , suggestion :: { hasSuggestion :: Boolean, replacement :: String, range :: Array (Array Int) } -- not a linter field
  , errorCode :: String -- not a linter field
  }

data Result = Errors | Success

resultToString :: Result -> String
resultToString Errors = "errors"
resultToString Success = "success"

fixPosition :: Position -> Position
fixPosition = id

type LintResult =
  { result :: String
  , messages :: Array AtomLintMessage
  }

linterBuild :: forall eff. { command :: String, args :: Array String, directory :: String } ->
  Aff (cp :: CHILD_PROCESS, console :: CONSOLE, ref :: REF | eff) BuildResult
linterBuild { command, args, directory } =
  build { command: Command command args, directory }


double :: Int -> Int
double x = x * x

toLintResult :: BuildResult -> LintResult
toLintResult res =
  let warnings = result "Warning" <$> res.errors.warnings
      errors = result "Error" <$> res.errors.errors
  in {
    messages: errors ++ warnings
  , result: resultToString $ if res.success then Success else Errors
  }
  where
  range :: Maybe Position -> Array (Array Int)
  range Nothing = []
  range (Just {startLine, startColumn, endLine, endColumn}) =
    [[startLine-1, startColumn-1], [endLine-1, endColumn-1]]

  result errorType (PscError {message,filename,position,errorLink,errorCode,suggestion}) =
    {
      "type": errorType
    , text: message

    , suggestion: replace suggestion
    , filePath: fromMaybe "" filename
    , range: range $ fixPosition <$> position
    , multiline: true -- /\n/.test(err.message)
    , errorCode
    , trace: [
      {
        type: "Link"
      , html: "<a href=\"" ++ errorLink ++ "\">More info (wiki)</a>"
      }
    ]}
    where
    replace (Just { replacement, replaceRange }) =
      { replacement
      , hasSuggestion: true
      , range: range $ maybe (fixPosition <$> position) Just replaceRange
      }
    replace Nothing = { replacement: "", hasSuggestion: false, range: range Nothing }
