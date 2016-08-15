{include, makeGrammar} = require './syntax-tools'
_ = require 'underscore-plus'

makeGrammar "grammars/haskell.cson",
  name: 'Haskell'
  fileTypes: [ 'hs' ]
  firstLineMatch: '^\\#\\!.*\\brunhaskell\\b'
  scopeName: 'source.haskell'

  macros: include 'macros'
  repository: include 'repository'
  patterns: include 'haskell-patterns'

makeGrammar "grammars/haskell autocompletion hint.cson",
  # name: 'Haskell Autocompletion Hint'
  fileTypes: []
  scopeName: 'hint.haskell'

  macros: include 'macros'
  patterns: [
      {include: '#function_type_declaration'}
      {include: '#ctor_type_declaration'}
  ]
  repository: include 'repository'

makeGrammar "grammars/haskell type hint.cson",
  # name: 'Haskell Type Hint'
  fileTypes: []
  scopeName: 'hint.type.haskell'

  macros: include 'macros'
  patterns: [
      include: '#type_signature'
  ]
  repository: include 'repository'

makeGrammar "grammars/haskell message hint.cson",
  # name: 'Haskell Message Hint'
  fileTypes: []
  scopeName: 'hint.message.haskell'

  macros: include 'macros'
  patterns: [
      match: /^[^:]*:(.+)$/
      captures:
        1:
          patterns: [
            include: 'source.haskell'
          ]
    ,
      begin: /^[^:]*:$/
      end: /^(?=\S)/
      patterns: [
        include: 'source.haskell'
      ]
    ,
      begin: /‘/
      end: /’/
      patterns: [
        include: 'source.haskell'
      ]
  ]
  repository: include 'repository'

makeGrammar "grammars/literate haskell.cson",
  name: 'Literate Haskell'
  fileTypes: [ 'lhs' ]
  scopeName: 'text.tex.latex.haskell'

  macros: _.extend (require 'clone')(include('macros')),
    maybeBirdTrack: /^(?:>|<) /
    indentBlockEnd:
      /^(?!(?:>|<) \1{indentChar}|(?:>|<) {indentChar}*$)|^(?!(?:>|<) )/
    operatorChar: /[\p{S}\p{P}&&[^(),;\[\]`{}_"'\|]]/
  patterns: include 'lhs-patterns'
  repository: include 'repository'
