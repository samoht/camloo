;; Le module 
(module
  __caml_map
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
    (empty_102@map x1)
    (bind_70@map x1)
    (3-213-bind_70@map x1 x2 x3)
    (add_6@map x1)
    (3-57-add_6@map x1 x2 x3)
    (find_75@map x1)
    (2-87-find_75@map x1 x2)
    (unbind_55@map x1)
    (remove_141@map x1)
    (2-166-remove_141@map x1 x2)
    (iter_219@map x1)
    (2-7-iter_219@map x1 x2)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (empty_102@map x1)
  (caml-make-regular-2
    #f
    #f
    (lambda (x2)
       (lambda (x3)
          ((x1 x2) (caml-constr-get-field x3 0))))))


(begin
  (define (bind_70@map x1)
    (lambda (x2)
       (lambda (x3) (3-213-bind_70@map x1 x2 x3))))
 (define (3-213-bind_70@map x1 x2 x3)
    (caml-make-regular-1
      #t
      (caml-make-regular-3
        #f
        x1
        x2
        (let ((x4 x3))
          (let ((g1001 x4))
            (cond ((eq? g1001 #f) '())
                  (else
                   (cons (caml-constr-get-field
                           (caml-constr-get-field x4 0)
                           1)
                         (caml-constr-get-field
                           (caml-constr-get-field x4 0)
                           2)))))))))
)

(begin
  (define (add_6@map x1)
    (lambda (x2)
       (lambda (x3) (3-57-add_6@map x1 x2 x3))))
 (define (3-57-add_6@map x1 x2 x3)
    (caml-make-regular-2
      #f
      (3-126-modify_152@baltree
        ((caml-constr-get-field x3 1) x1)
        ((bind_70@map x1) x2)
        (caml-constr-get-field x3 0))
      (caml-constr-get-field x3 1)))
)

(begin
  (define (find_75@map x1)
    (lambda (x2) (2-87-find_75@map x1 x2)))
 (define (2-87-find_75@map x1 x2)
    (caml-constr-get-field
      (2-56-find_75@baltree
        ((caml-constr-get-field x2 1) x1)
        (caml-constr-get-field x2 0))
      1))
)

(define (unbind_55@map x1)
  (labels
    ((staticfail1000 () #f))
    (case (if (caml-constant-constr? x1)
            -1
            (caml-regular-constr-tag x1))
      ((2)
       (if (null? (caml-constr-get-field
                    (caml-constr-get-field x1 0)
                    2))
         (staticfail1000)
         (caml-make-regular-1
           #t
           (caml-make-regular-3
             #f
             (caml-constr-get-field
               (caml-constr-get-field x1 0)
               0)
             (car (caml-constr-get-field
                    (caml-constr-get-field x1 0)
                    2))
             (cdr (caml-constr-get-field
                    (caml-constr-get-field x1 0)
                    2))))))
      (else (staticfail1000)))))


(begin
  (define (remove_141@map x1)
    (lambda (x2) (2-166-remove_141@map x1 x2)))
 (define (2-166-remove_141@map x1 x2)
    (caml-make-regular-2
      #f
      (3-126-modify_152@baltree
        ((caml-constr-get-field x2 1) x1)
        unbind_55@map
        (caml-constr-get-field x2 0))
      (caml-constr-get-field x2 1)))
)

(begin
  (define (iter_219@map x1)
    (lambda (x2) (2-7-iter_219@map x1 x2)))
 (define (2-7-iter_219@map x1 x2)
    (letrec ((x3 (lambda (x4)
                    (let ((g1002 x4))
                      (cond ((eq? g1002 #f) #f)
                            (else
                             (begin
                               (x3 (caml-constr-get-field x4 0))
                               (begin
                                 ((x1 (caml-constr-get-field
                                        (caml-constr-get-field x4 1)
                                        0))
                                  (caml-constr-get-field
                                    (caml-constr-get-field x4 1)
                                    1))
                                 (begin
                                   (2-1-do_list_18@list
                                     (x1 (caml-constr-get-field
                                           (caml-constr-get-field x4 1)
                                           0))
                                     (caml-constr-get-field
                                       (caml-constr-get-field x4 1)
                                       2))
                                   (x3 (caml-constr-get-field x4 2)))))))))))
      (x3 (caml-constr-get-field x2 0))))
)

