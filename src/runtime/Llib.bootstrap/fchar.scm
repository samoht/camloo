;; Le module 
(module
  __caml_fchar
  (import
    __caml_arg
    __caml_baltree
    __caml_char
    __caml_eq
    __caml_exc
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
  (export (char_for_read_215@fchar x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (char_for_read_215@fchar x1)
  (labels
    ((staticfail1000
       ()
       (if (is_printable x1)
         (2-208-make_string_7@fstring 1 x1)
         (let ((x2 (int_of_char x1)))
           (let ((x3 (create_string 4)))
             (begin
               (string-set! x3 0 #\\)
               (begin
                 (string-set!
                   x3
                   1
                   (char_of_int (+fx 48 (/fx x2 100))))
                 (begin
                   (string-set!
                     x3
                     2
                     (char_of_int (+fx 48 (modulo (/fx x2 10) 10))))
                   (begin
                     (string-set!
                       x3
                       3
                       (char_of_int (+fx 48 (modulo x2 10))))
                     x3)))))))))
    (case x1
      ((#\`) "\\`")
      ((#\\) "\\\\")
      ((#\newline) "\\n")
      ((#\tab) "\\t")
      (else (staticfail1000)))))


