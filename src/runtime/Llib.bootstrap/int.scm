;; Le module 
(module
  __caml_int
  (import
    __caml_arg
    __caml_baltree
    __caml_char
    __caml_eq
    __caml_exc
    __caml_fchar
    __caml_filename
    __caml_float
    __caml_fstring
    __caml_fvect
    __caml_genlex
    __caml_hashtbl
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
    (min_84@int x1)
    (2-156-min_84@int x1 x2)
    (max_25@int x1)
    (2-211-max_25@int x1 x2)
    (abs_186@int x1)
    (lnot_59@int x1)
    string_of_int_188@int))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (min_84@int x1)
    (lambda (x2) (2-156-min_84@int x1 x2)))
 (define (2-156-min_84@int x1 x2)
    (if (<=fx x1 x2) x1 x2))
)

(begin
  (define (max_25@int x1)
    (lambda (x2) (2-211-max_25@int x1 x2)))
 (define (2-211-max_25@int x1 x2)
    (if (>=fx x1 x2) x1 x2))
)

(define (abs_186@int x1)
  (if (<fx x1 0) (negfx x1) x1))


(define (lnot_59@int x1) (bit-xor x1 -1))

(define string_of_int_188@int
  ((lambda (x1) (lambda (x2) (format_int x1 x2)))
   "%ld"))


