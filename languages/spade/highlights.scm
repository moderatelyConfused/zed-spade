((identifier) @type
  (#lua-match? @type "[A-Z]"))

((identifier) @constant
 (#lua-match? @constant "^[A-Z][A-Z%d_]*$"))

(self) @variable.builtin

(unit_definition (identifier) @function)

(parameter (identifier) @variable.parameter)

((pipeline_reg_marker) @keyword)

(scoped_identifier
  path: (identifier) @module)
(scoped_identifier
 (scoped_identifier
  name: (identifier) @module))
((scoped_identifier
    name: (identifier) @type)
 (#lua-match? @type "^[A-Z]"))

((builtin_type) @type.builtin)

((identifier) @type.builtin
 (#any-of?
    @type.builtin
    "uint"
    "Option"
    "Memory"))

((identifier) @constant.builtin
 (#any-of? @constant.builtin "Some" "None"))

((pipeline_stage_name) @label)

((stage_reference
    stage: (identifier) @label))

[
    "pipeline"
    "let"
    "set"
    "entity"
    "fn"
    "reg"
    "reset"
    "inst"
    "assert"
    "struct"
    "enum"
    "stage"
    "impl"
    "port"
    "decl"
    "mod"
    "extern"
] @keyword

[
 "use"
] @keyword.import

[
 "gen"
] @keyword.directive

((gen_if_expression ["if" "else"] @preproc))
((naked_gen_if_expression ["if" "else"] @preproc))

;((attribute
;  "#" @punctuation.special
;  "[" @punctuation.bracket
;  (identifier) @function.macro
;  "(" @punctuation.bracket
;  (attribute_argument) @variable
;  (attribute_argument "=") @operator
;  ("," @punctuation.delimiter)
;  ")" @punctuation.bracket
;  "]" @punctuation.bracket
;))

((attribute
   "#" @punctuation.special
   "[" @punctuation.bracket
    ( identifier ) @variable @function.macro
    "(" @punctuation.bracket
    ((attribute_argument
        (identifier) @variable
    ))
    ;"," @punctuation.delimiter
   ")" @punctuation.bracket
   "]" @punctuation.bracket
))

[
  "else"
  "if"
  "match"
] @conditional

(bool_literal) @boolean
(int_literal) @number

[
  "&"
  "inv"
  "-"
  "=>"
  ">"
  "<"
  "="
  "->"
  "~"
  "!"
] @operator


((op_add) @operator)
((op_sub) @operator)
((op_mul) @operator)
((op_equals) @operator)
((op_lt) @operator)
((op_gt) @operator)
((op_le) @operator)
((op_ge) @operator)
((op_lshift) @operator)
((op_rshift) @operator)
((op_bitwise_and) @operator)
((op_bitwise_xor) @operator)
((op_bitwise_or) @operator)
((op_logical_and) @operator)
((op_logical_or) @operator)


[
  (line_comment)
  (doc_comment)
  (block_comment)
] @comment @spell
