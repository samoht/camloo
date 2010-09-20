;; Le module 
(module
  __caml_pair
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
    (split_219@pair x1)
    (combine_207@pair x1)
    (map_combine_74@pair x1)
    (2-155-map_combine_74@pair x1 a1002)
    (do_list_combine_121@pair x1)
    (2-195-do_list_combine_121@pair x1 a1004)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (split_219@pair x1)
  (if (null? x1)
    '#(() () #f)
    (let ((x2 (split_219@pair (cdr x1))))
      (caml-make-regular-2
        #f
        (cons (caml-constr-get-field (car x1) 0)
              (caml-constr-get-field x2 0))
        (cons (caml-constr-get-field (car x1) 1)
              (caml-constr-get-field x2 1))))))


(define (combine_207@pair x1)
  (labels
    ((staticfail1000
       ()
       (invalid_arg_209@exc "combine")))
    (if (null? (caml-constr-get-field x1 0))
      (if (null? (caml-constr-get-field x1 1))
        '()
        (staticfail1000))
      (if (null? (caml-constr-get-field x1 1))
        (staticfail1000)
        (cons (caml-make-regular-2
                #f
                (car (caml-constr-get-field x1 0))
                (car (caml-constr-get-field x1 1)))
              (combine_207@pair
                (caml-make-regular-2
                  #f
                  (cdr (caml-constr-get-field x1 0))
                  (cdr (caml-constr-get-field x1 1)))))))))


(begin
  (define (map_combine_74@pair x1)
    (lambda (a1002)
       (2-155-map_combine_74@pair x1 a1002)))
 (define (2-155-map_combine_74@pair x1 a1002)
    (letrec ((x2 (lambda (x3)
                    (labels
                      ((staticfail1001
                         ()
                         (invalid_arg_209@exc "map_combine")))
                      (if (null? (caml-constr-get-field x3 0))
                        (if (null? (caml-constr-get-field x3 1))
                          '()
                          (staticfail1001))
                        (if (null? (caml-constr-get-field x3 1))
                          (staticfail1001)
                          (cons (x1 (caml-make-regular-2
                                      #f
                                      (car (caml-constr-get-field x3 0))
                                      (car (caml-constr-get-field x3 1))))
                                (x2 (caml-make-regular-2
                                      #f
                                      (cdr (caml-constr-get-field x3 0))
                                      (cdr (caml-constr-get-field
                                             x3
                                             1)))))))))))
      (x2 a1002)))
)

(begin
  (define (do_list_combine_121@pair x1)
    (lambda (a1004)
       (2-195-do_list_combine_121@pair x1 a1004)))
 (define (2-195-do_list_combine_121@pair x1 a1004)
    (letrec ((x2 (lambda (x3)
                    (labels
                      ((staticfail1003
                         ()
                         (invalid_arg_209@exc "do_list_combine")))
                      (if (null? (caml-constr-get-field x3 0))
                        (if (null? (caml-constr-get-field x3 1))
                          #f
                          (staticfail1003))
                        (if (null? (caml-constr-get-field x3 1))
                          (staticfail1003)
                          (begin
                            (x1 (caml-make-regular-2
                                  #f
                                  (car (caml-constr-get-field x3 0))
                                  (car (caml-constr-get-field x3 1))))
                            (x2 (caml-make-regular-2
                                  #f
                                  (cdr (caml-constr-get-field x3 0))
                                  (cdr (caml-constr-get-field x3 1)))))))))))
      (x2 a1004)))
)

