;; extends

; function/method docstring
(function_definition
  body: (block .
    (expression_statement
      (string
        (string_content) @injection.content (#set! injection.language "rst")
      )
    )
  )
)

; module docstring
(module .
  (expression_statement
    (string
      (string_content) @injection.content (#set! injection.language "rst")
    )
  )
)

; function/method docstring
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
