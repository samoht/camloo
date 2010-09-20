;; Le module 
(module
  __caml_config
  (library camloo-runtime)
  (export
    path_library_222@config
    maxint_byte_178@config
    minint_byte_232@config
    maxint_short_71@config
    minint_short_93@config
    default_used_interfaces_171@config
    default_exec_name_19@config
    toplevel_input_prompt_107@config
    toplevel_output_prompt_179@config
    toplevel_error_prompt_60@config
    batch_output_prompt_200@config
    batch_error_prompt_64@config))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define path_library_222@config (make-cell ""))

(begin
  (define maxint_byte_178@config 255)
  (begin
    (define minint_byte_232@config 0)
    (begin
      (define maxint_short_71@config 32767)
      (define minint_short_93@config -32768))))

(define default_used_interfaces_171@config
  '(#("cautious"
      ("io"
       "eq"
       "int"
       "float"
       "ref"
       "pair"
       "list"
       "vect"
       "char"
       "string"
       "bool"
       "exc"
       "stream"
       "builtin")
      #f)
    #("fast"
      ("io"
       "eq"
       "int"
       "float"
       "ref"
       "pair"
       "list"
       "fvect"
       "fchar"
       "fstring"
       "bool"
       "exc"
       "stream"
       "builtin")
      #f)
    #("none" ("builtin") #f)))


(define default_exec_name_19@config "a.out")

(define toplevel_input_prompt_107@config "#")

(define toplevel_output_prompt_179@config "")

(define toplevel_error_prompt_60@config ">")

(define batch_output_prompt_200@config "")

(define batch_error_prompt_64@config "#")

