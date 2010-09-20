;; Le module 
(module
  __caml_char
  (import
    __caml_arg
    __caml_baltree
    __caml_eq
    __caml_exc
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
    (char_of_int_212@char x1)
    char_for_read_215@char))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (char_of_int_212@char x1)
  (if (or (<fx x1 0) (>fx x1 255))
    (invalid_arg_209@exc "char_of_int")
    (char_of_int x1)))


(define char_for_read_215@char
  char_for_read_215@fchar)


