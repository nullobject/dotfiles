// SYNTAX TEST "source.js.jsx"

// components/EmailInput.jsx

import React from 'react';
// <- keyword.control.module.js
 // <- keyword.control.module.js
//^^^^                      keyword.control.module.js
//     ^^^^^                variable.other.readwrite.js
//           ^^^^           keyword.control.module.reference.js
//                ^^^^^^^   string.quoted.single.js
//                ^         punctuation.definition.string.begin.js
//                      ^   punctuation.definition.string.end.js
//                       ^  punctuation.terminator.statement.js
import { InputsMixin } from './Forms';
// <- keyword.control.module.js
 // <- keyword.control.module.js
//^^^^                                  keyword.control.module.js
//     ^             ^                  meta.brace.curly.js
//       ^^^^^^^^^^^                    variable.other.readwrite.js
//                     ^^^^             keyword.control.module.reference.js
//                          ^^^^^^^^^   string.quoted.single.js
//                          ^           punctuation.definition.string.begin.js
//                                  ^   punctuation.definition.string.end.js
//                                   ^  punctuation.terminator.statement.js

export default <div><span /></div>
// <- keyword.control.module.js
 // <- keyword.control.module.js
//^^^^ ^^^^^^^                      keyword.control.module.js
//             ^^^^^^^^^^ ^^^^^^^^  meta.tag.jsx
//             ^   ^^     ^^^^   ^  punctuation.definition.tag.jsx
//              ^^^  ^^^^           entity.name.tag.open.jsx
//                 ^                JSXStartTagEnd
//                          ^^      JSXEndTagStart
//                            ^^^   entity.name.tag.close.jsx


export default React.createClass({
// <- keyword.control.module.js
 // <- keyword.control.module.js
//^^^^ ^^^^^^^                      keyword.control.module.js
//             ^^^^^^^^^^^^^^^^^    meta.function-call.static.with-arguments.js
//             ^^^^^                variable.other.class.js
//                  ^               keyword.operator.accessor.js
//                   ^^^^^^^^^^^    entity.name.function.js
//                              ^   meta.brace.round.js
//                               ^  meta.brace.curly.js

  mixins: [InputsMixin],
//^^^^^^^                 constant.other.object.key.js
//^^^^^^                  string.unquoted.js
//      ^                 punctuation.separator.key-value.js
//        ^           ^   meta.brace.square.js
//         ^^^^^^^^^^^    variable.other.readwrite.js
//                     ^  meta.delimiter.comma.js

  submit() {
//^^^^^^^^    meta.function-call.without-arguments.js
//^^^^^^      entity.name.function.js
//      ^     punctuation.definition.parameters.begin.js
//       ^    punctuation.definition.parameters.end.js
//         ^  meta.brace.curly.js
    var {email, question} = this.state;
//  ^^^                                  storage.type.js
//      ^               ^                meta.brace.curly.js
//       ^^^^^  ^^^^^^^^                 variable.other.readwrite.js
//            ^                          meta.delimiter.comma.js
//                        ^              keyword.operator.assignment.js
//                          ^^^^         variable.language.this.js
//                              ^        keyword.operator.accessor.js
//                               ^^^^^   meta.property.object.js
//                               ^^^^^   variable.other.property.js
//                                    ^  punctuation.terminator.statement.js
    request
//  ^^^^^^^  variable.other.readwrite.js
      .post(`${API_BASE}/askform`)
//    ^                             keyword.operator.accessor.js
//     ^^^^                         meta.function-call.method.with-arguments.js
//     ^^^^                         entity.name.function.js
//         ^                     ^  meta.brace.round.js
//          ^^^^^^^^^^^^^^^^^^^^^   string.quasi.js
//          ^                       punctuation.definition.quasi.begin.js
//          ^^^^^^^^^^^^^^^^^^^^^   string.quoted.template.js
//           ^^^^^^^^^^^            entity.quasi.element.js
//           ^^                     punctuation.quasi.element.begin.js
//             ^^^^^^^^             variable.other.constant.js
//                     ^            punctuation.quasi.element.end.js
//                              ^   punctuation.definition.quasi.end.js
      .send({email, question})
//    ^                         keyword.operator.accessor.js
//     ^^^^                     meta.function-call.method.with-arguments.js
//     ^^^^                     entity.name.function.js
//         ^                 ^  meta.brace.round.js
//          ^               ^   meta.brace.curly.js
//           ^^^^^  ^^^^^^^^    variable.other.readwrite.js
//                ^             meta.delimiter.comma.js
      .end((err, res) =>
//    ^                   keyword.operator.accessor.js
//     ^^^                meta.function-call.method.with-arguments.js
//     ^^^                entity.name.function.js
//        ^               meta.brace.round.js
//         ^^^^^ ^^^^ ^^  meta.function.arrow.js
//         ^              punctuation.definition.parameters.begin.js
//          ^^^  ^^^      variable.other.readwrite.js
//             ^          meta.delimiter.comma.js
//                  ^     punctuation.definition.parameters.end.js
//                    ^^  storage.type.function.arrow.js
        this.setState({isValid: !err}));
//      ^^^^                              variable.language.this.js
//          ^                             keyword.operator.accessor.js
//           ^^^^^^^^                     meta.function-call.method.with-arguments.js
//           ^^^^^^^^                     entity.name.function.js
//                   ^               ^^   meta.brace.round.js
//                    ^             ^     meta.brace.curly.js
//                     ^^^^^^^^           constant.other.object.key.js
//                     ^^^^^^^            string.unquoted.js
//                            ^           punctuation.separator.key-value.js
//                              ^         keyword.operator.logical.js
//                               ^^^      variable.other.readwrite.js
//                                     ^  punctuation.terminator.statement.js
  },
//^   meta.brace.curly.js
// ^  meta.delimiter.comma.js

  'key//1': function() {},
//^^^^^^^^                  constant.other.object.key.js
//^^^^^^^^                  string.quoted.single.js
//^                         punctuation.definition.string.begin.js
//       ^                  punctuation.definition.string.end.js
//        ^                 punctuation.separator.key-value.js
//          ^^^^^^^^^^      meta.function.js
//          ^^^^^^^^        storage.type.function.js
//                  ^       punctuation.definition.parameters.begin.js
//                   ^      punctuation.definition.parameters.end.js
//                     ^^   meta.brace.curly.js
//                       ^  meta.delimiter.comma.js
  'key/***/1': function() {},
//^^^^^^^^^^^                  constant.other.object.key.js
//^^^^^^^^^^^                  string.quoted.single.js
//^                            punctuation.definition.string.begin.js
//          ^                  punctuation.definition.string.end.js
//           ^                 punctuation.separator.key-value.js
//             ^^^^^^^^^^      meta.function.js
//             ^^^^^^^^        storage.type.function.js
//                     ^       punctuation.definition.parameters.begin.js
//                      ^      punctuation.definition.parameters.end.js
//                        ^^   meta.brace.curly.js
//                          ^  meta.delimiter.comma.js

  render() {
//^^^^^^^^    meta.function-call.without-arguments.js
//^^^^^^      entity.name.function.js
//      ^     punctuation.definition.parameters.begin.js
//       ^    punctuation.definition.parameters.end.js
//         ^  meta.brace.curly.js
    var {email} = this.state;
//  ^^^                        storage.type.js
//      ^     ^                meta.brace.curly.js
//       ^^^^^                 variable.other.readwrite.js
//              ^              keyword.operator.assignment.js
//                ^^^^         variable.language.this.js
//                    ^        keyword.operator.accessor.js
//                     ^^^^^   meta.property.object.js
//                     ^^^^^   variable.other.property.js
//                          ^  punctuation.terminator.statement.js
    var list = this.props.secondary.map(pic => <img src={pic} />)}
//  ^^^                                                             storage.type.js
//      ^^^^                            ^^^              ^^^        variable.other.readwrite.js
//           ^                                                      keyword.operator.assignment.js
//             ^^^^                                                 variable.language.this.js
//                 ^     ^         ^                                keyword.operator.accessor.js
//                  ^^^^^ ^^^^^^^^^                                 meta.property.object.js
//                  ^^^^^ ^^^^^^^^^                                 variable.other.property.js
//                                  ^^^                             meta.function-call.method.with-arguments.js
//                                  ^^^                             entity.name.function.js
//                                     ^                        ^   meta.brace.round.js
//                                      ^^^ ^^                      meta.function.arrow.js
//                                          ^^                      storage.type.function.arrow.js
//                                             ^^^^ ^^^^^^^^^ ^^    meta.tag.jsx
//                                             ^              ^^    punctuation.definition.tag.jsx
//                                              ^^^                 entity.name.tag.open.jsx
//                                                  ^^^             entity.other.attribute-name.jsx
//                                                     ^            keyword.operator.assignment.jsx
//                                                      ^^^^^       meta.embedded.expression.js
//                                                      ^           punctuation.section.embedded.begin.jsx
//                                                          ^       punctuation.section.embedded.end.jsx
//                                                               ^  meta.brace.curly.js
    var multilineAttr = <a desc="ab
//  ^^^                              storage.type.js
//      ^^^^^^^^^^^^^                variable.other.readwrite.js
//                    ^              keyword.operator.assignment.js
//                      ^^ ^^^^^^^^  meta.tag.jsx
//                      ^            punctuation.definition.tag.jsx
//                       ^           entity.name.tag.open.jsx
//                         ^^^^      entity.other.attribute-name.jsx
//                             ^     keyword.operator.assignment.jsx
//                              ^^^  string.quoted.double.js
//                              ^    punctuation.definition.string.begin.jsx
      cdef"></a>
//    ^^^^^^^^^^  meta.tag.jsx
//    ^^^^^       string.quoted.double.js
//        ^       punctuation.definition.string.end.jsx
//         ^^^ ^  punctuation.definition.tag.jsx
//         ^      JSXStartTagEnd
//          ^^    JSXEndTagStart
//            ^   entity.name.tag.close.jsx
    return (
//  ^^^^^^    keyword.control.flow.js
//         ^  meta.brace.round.js
      <div {...this.props} overlay={<div>test</div>}>
//    ^^^^ ^^^^^^^^^^^^^^^ ^^^^^^^^^^^^^^^^^^^^^^^^^^  meta.tag.jsx
//    ^                             ^   ^    ^^   ^ ^  punctuation.definition.tag.jsx
//     ^^^                           ^^^               entity.name.tag.open.jsx
//         ^^^^^^^^^^^^^^^         ^^^^^^^^^^^^^^^^^   meta.embedded.expression.js
//         ^                       ^                   punctuation.section.embedded.begin.jsx
//          ^^^                                        keyword.operator.spread.jsx
//             ^^^^                                    variable.language.this.js
//                 ^                                   keyword.operator.accessor.js
//                  ^^^^^                              meta.property.object.js
//                  ^^^^^                              variable.other.property.js
//                       ^                         ^   punctuation.section.embedded.end.jsx
//                         ^^^^^^^                     entity.other.attribute-name.jsx
//                                ^                    keyword.operator.assignment.jsx
//                                      ^           ^  JSXStartTagEnd
//                                           ^^        JSXEndTagStart
//                                             ^^^     entity.name.tag.close.jsx
        <ns:tag></ns:tag>
//      ^^^^^^^^^^^^^^^^^  meta.tag.jsx
//      ^      ^^^      ^  punctuation.definition.tag.jsx
//       ^^^^^^            entity.name.tag.open.jsx
//             ^           JSXStartTagEnd
//              ^^         JSXEndTagStart
//                ^^^^^^   entity.name.tag.close.jsx
        {list}
//      ^^^^^^  meta.tag.jsx
//      ^^^^^^  meta.embedded.expression.js
//      ^       punctuation.section.embedded.begin.jsx
//       ^^^^   variable.other.readwrite.js
//           ^  punctuation.section.embedded.end.jsx
        {[<span>in an array</span>]}
//      ^^^^^^^^^^ ^^ ^^^^^^^^^^^^^^  meta.tag.jsx
//      ^^^^^^^^^^ ^^ ^^^^^^^^^^^^^^  meta.embedded.expression.js
//      ^                             punctuation.section.embedded.begin.jsx
//       ^                        ^   meta.brace.square.js
//        ^    ^           ^^    ^    punctuation.definition.tag.jsx
//         ^^^^                       entity.name.tag.open.jsx
//             ^                      JSXStartTagEnd
//                         ^^         JSXEndTagStart
//                           ^^^^     entity.name.tag.close.jsx
//                                 ^  punctuation.section.embedded.end.jsx
        <input /*cmt*/
//      ^^^^^^ ^^^^^^^  meta.tag.jsx
//      ^               punctuation.definition.tag.jsx
//       ^^^^^          entity.name.tag.open.jsx
//             ^^^^^^^  comment.block.js
//             ^^   ^^  punctuation.definition.comment.js
          /*cmt*/value/*cmt*/=/*cmt*/{email}/*cmt*/
//        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  meta.tag.jsx
//        ^^^^^^^     ^^^^^^^ ^^^^^^^       ^^^^^^^  comment.block.js
//        ^^   ^^     ^^   ^^ ^^   ^^       ^^   ^^  punctuation.definition.comment.js
//                           ^                       keyword.operator.assignment.jsx
//                                   ^^^^^^^         meta.embedded.expression.js
//                                   ^               punctuation.section.embedded.begin.jsx
//                                    ^^^^^          variable.other.readwrite.js
//                                         ^         punctuation.section.embedded.end.jsx
          onChange={/*cmt*/this.onChange/*cmt*/}
//        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  meta.tag.jsx
//        ^^^^^^^^                                entity.other.attribute-name.jsx
//                ^                               keyword.operator.assignment.jsx
//                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  meta.embedded.expression.js
//                 ^                              punctuation.section.embedded.begin.jsx
//                  ^^^^^^^             ^^^^^^^   comment.block.js
//                  ^^   ^^             ^^   ^^   punctuation.definition.comment.js
//                         ^^^^                   variable.language.this.js
//                             ^                  keyword.operator.accessor.js
//                              ^^^^^^^^          meta.property.object.js
//                              ^^^^^^^^          variable.other.property.js
//                                             ^  punctuation.section.embedded.end.jsx
          onClick={this.onClick}
//        ^^^^^^^^^^^^^^^^^^^^^^  meta.tag.jsx
//        ^^^^^^^                 entity.other.attribute-name.jsx
//               ^                keyword.operator.assignment.jsx
//                ^^^^^^^^^^^^^^  meta.embedded.expression.js
//                ^               punctuation.section.embedded.begin.jsx
//                 ^^^^           variable.language.this.js
//                     ^          keyword.operator.accessor.js
//                      ^^^^^^^   meta.property.object.js
//                      ^^^^^^^   variable.other.property.js
//                             ^  punctuation.section.embedded.end.jsx
          required/*cmt*/ />
//        ^^^^^^^^^^^^^^^ ^^  meta.tag.jsx
//        ^^^^^^^^            entity.other.attribute-name.jsx
//                ^^^^^^^     comment.block.js
//                ^^   ^^     punctuation.definition.comment.js
//                        ^^  punctuation.definition.tag.jsx
      </div>
//    ^^^^^^  meta.tag.jsx
//    ^^   ^  punctuation.definition.tag.jsx
//    ^^      JSXEndTagStart
//      ^^^   entity.name.tag.close.jsx
    );
//  ^   meta.brace.round.js
//   ^  punctuation.terminator.statement.js
  }
//^  meta.brace.curly.js
});
 // <- meta.brace.round.js
//^  punctuation.terminator.statement.js

// >> only:source.js.jsx
