// SYNTAX TEST "source.js.jsx"

// ISSUE: 164
const foo = function foo(a /* : string*/) /* {[key: string]: string} */ {
// <- storage.type.js
 // <- storage.type.js
//^^^                                                                      storage.type.js
//    ^^^ ^ ^^^^^^^^ ^^^^^ ^^ ^ ^^^^^^^^^ ^^ ^^^^^^ ^^^^^^^^ ^^^^^^^ ^^    meta.function.js
//    ^^^            ^^^                                                   entity.name.function.js
//        ^                                                                keyword.operator.assignment.js
//          ^^^^^^^^                                                       storage.type.function.js
//                      ^                                                  punctuation.definition.parameters.begin.js
//                       ^                                                 variable.other.readwrite.js
//                         ^^ ^ ^^^^^^^^  ^^ ^^^^^^ ^^^^^^^^ ^^^^^^^ ^^    comment.block.js
//                         ^^         ^^  ^^                         ^^    punctuation.definition.comment.js
//                                      ^                                  punctuation.definition.parameters.end.js
//                                                                      ^  meta.brace.curly.js
  return {
//^^^^^^    keyword.control.flow.js
//       ^  meta.brace.curly.js
    bar
//  ^^^  variable.other.readwrite.js
  }
//^  meta.brace.curly.js
}
// <- meta.brace.curly.js

module.exports = exports = foo
// <- support.type.object.module.js keyword.operator.accessor.js
 // <- support.type.object.module.js keyword.operator.accessor.js
//^^^^^^^^^^^^   ^^^^^^^        support.type.object.module.js
//^^^^^^^^^^^^   ^^^^^^^        keyword.operator.accessor.js
//             ^         ^      keyword.operator.assignment.js
//                         ^^^  variable.other.readwrite.js

// ISSUE: 166
export default {
// <- keyword.control.module.js
 // <- keyword.control.module.js
//^^^^ ^^^^^^^    keyword.control.module.js
//             ^  meta.brace.curly.js
  async get() { return 1 },
//^^^^^ ^^^^^                meta.function.method.js
//^^^^^                      storage.type.js
//      ^^^                  entity.name.function.method.js
//         ^                 punctuation.definition.parameters.begin.js
//          ^                punctuation.definition.parameters.end.js
//            ^          ^   meta.brace.curly.js
//              ^^^^^^       keyword.control.flow.js
//                     ^     constant.numeric.js
//                        ^  meta.delimiter.comma.js
  get a() { return this._a },
//^^^ ^^^                      meta.accessor.js
//^^^                          storage.type.accessor.js
//    ^                        entity.name.accessor.js
//     ^                       punctuation.definition.parameters.begin.js
//      ^                      punctuation.definition.parameters.end.js
//        ^                ^   meta.brace.curly.js
//          ^^^^^^             keyword.control.flow.js
//                 ^^^^        variable.language.this.js
//                     ^       keyword.operator.accessor.js
//                      ^^     meta.property.object.js
//                      ^^     variable.other.property.js
//                          ^  meta.delimiter.comma.js
  set a(v) { this._a = v },
//^^^ ^^^^                   meta.accessor.js
//^^^                        storage.type.accessor.js
//    ^                      entity.name.accessor.js
//     ^                     punctuation.definition.parameters.begin.js
//      ^              ^     variable.other.readwrite.js
//       ^                   punctuation.definition.parameters.end.js
//         ^             ^   meta.brace.curly.js
//           ^^^^            variable.language.this.js
//               ^           keyword.operator.accessor.js
//                ^^         meta.property.object.js
//                ^^         variable.other.property.js
//                   ^       keyword.operator.assignment.js
//                        ^  meta.delimiter.comma.js
}// <- meta.brace.curly.js
// <- meta.brace.curly.js
 // <- comment.line.double-slash.js punctuation.definition.comment.js
//^ ^^ ^^^^^^^^^^^^^^^^^^^  comment.line.double-slash.js
//^                         punctuation.definition.comment.js
