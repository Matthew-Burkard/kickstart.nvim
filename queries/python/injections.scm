;; extends

; Function/method docstring.
(function_definition
  body: (block .
    (expression_statement
      (string
        (string_content) @injection.content (#set! injection.language "rst")
      )
    )
  )
)

; Module docstring.
(module .
  (expression_statement
    (string
      (string_content) @injection.content (#set! injection.language "rst")
    )
  )
)

; Class definition.
(class_definition
  body: (block .
    (expression_statement
      (string
        (string_content) @injection.content (#set! injection.language "rst")
      )
    )
  )
)

; SQL injections.
(assignment
    left: (identifier) @_id
    right: (string (string_content) @injection.content)
    (#match? @_id "sql")
    (#set! injection.language "sql"))
