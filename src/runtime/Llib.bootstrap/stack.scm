;; Le module 
(module
  __caml_stack
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
    (new_27@stack x1)
    (push_151@stack x1)
    (2-205-push_151@stack x1 x2)
    (pop_15@stack x1)
    (clear_94@stack x1)
    (length_175@stack x1)
    (iter_219@stack x1)
    (2-63-iter_219@stack x1 x2)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (new_27@stack x1)
  (caml-make-regular-1 #f '()))


(begin
  (define (push_151@stack x1)
    (lambda (x2) (2-205-push_151@stack x1 x2)))
 (define (2-205-push_151@stack x1 x2)
    (caml-constr-set-field!
      x2
      0
      (cons x1 (caml-constr-get-field x2 0))))
)

(define (pop_15@stack x1)
  (let ((x2 (caml-constr-get-field x1 0)))
    (if (null? x2)
      (caml-raise 'Empty_1@stack)
      (begin
        (caml-constr-set-field! x1 0 (cdr x2))
        (car x2)))))


(define (clear_94@stack x1)
  (caml-constr-set-field! x1 0 '()))


(define (length_175@stack x1)
  (list_length_112@list
    (caml-constr-get-field x1 0)))


(begin
  (define (iter_219@stack x1)
    (lambda (x2) (2-63-iter_219@stack x1 x2)))
 (define (2-63-iter_219@stack x1 x2)
    (2-1-do_list_18@list
      x1
      (caml-constr-get-field x2 0)))
)

