;; Le module 
(module
  __caml_exc
  (import
    __caml_arg
    __caml_baltree
    __caml_char
    __caml_eq
    __caml_fchar
    __caml_filename
    __caml_float
    __caml_fstring
    __caml_fvect
    __caml_genlex
    __caml_hashtbl
    __caml_int
    __caml_io
    __caml_lexing
    __caml_list
    __caml_map
    __caml_pair
    __caml_parsing
    __caml_printexc
    __caml_printf
    __caml_queue
    __caml_random
    __caml_set
    __caml_sort
    __caml_stack
    __caml_stream
    __caml_string
    __caml_vect
    __caml_constr
    __caml_bfloat
    __caml_bint
    __caml_bio
    __caml_bmisc
    __caml_bstring
    __caml_sys
    __caml_handle
    __caml_intext
    __caml_tag)
  (export
    (failwith_217@exc x1)
    (invalid_arg_209@exc x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (failwith_217@exc x1)
    (caml-raise
      (caml-make-static-extensible-1 'Failure_3@exc x1)))
 (define (invalid_arg_209@exc x1)
    (caml-raise
      (caml-make-static-extensible-1
        'Invalid_argument_2@exc
        x1)))
)

