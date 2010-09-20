;; Le module 
(module
  __caml_sort
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
    (merge_129@sort x1)
    (3-180-merge_129@sort x1 a1004 a1003)
    (sort_214@sort x1)
    (2-227-sort_214@sort x1 x2)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (merge_129@sort x1)
    (lambda (a1004)
       (lambda (a1003)
          (3-180-merge_129@sort x1 a1004 a1003))))
 (define (3-180-merge_129@sort x1 a1004 a1003)
    (letrec ((x2 (lambda (x3)
                    (lambda (x4)
                       (labels
                         ((staticfail1000
                            ()
                            (caml-raise
                              '#("Mlib/sort.ml"
                                 79
                                 226
                                 Match_failure_1@builtin
                                 ()))))
                         (labels
                           ((staticfail1001
                              ()
                              (labels
                                ((staticfail1002
                                   ()
                                   (if (null? x3)
                                     (staticfail1000)
                                     (if (null? x4)
                                       (staticfail1000)
                                       (if ((x1 (car x3)) (car x4))
                                         (cons (car x3) ((x2 (cdr x3)) x4))
                                         (cons (car x4) ((x2 x3) (cdr x4))))))))
                                (if (null? x4) x3 (staticfail1002)))))
                           (if (null? x3) x4 (staticfail1001))))))))
      ((x2 a1004) a1003)))
)

(begin
  (define (sort_214@sort x1)
    (lambda (x2) (2-227-sort_214@sort x1 x2)))
 (define (2-227-sort_214@sort x1 x2)
    (letrec ((x3 (lambda (x4)
                    (if (null? x4)
                      '()
                      (if (null? (cdr x4))
                        (cons (cons (car x4) '()) '())
                        (cons (if ((x1 (car x4)) (car (cdr x4)))
                                (cons (car x4) (cons (car (cdr x4)) '()))
                                (cons (car (cdr x4)) (cons (car x4) '())))
                              (x3 (cdr (cdr x4)))))))))
      (letrec ((x4 (lambda (x5)
                      (labels
                        ((staticfail1005 () x5))
                        (if (null? x5)
                          (staticfail1005)
                          (if (null? (cdr x5))
                            (staticfail1005)
                            (cons (3-180-merge_129@sort
                                    x1
                                    (car x5)
                                    (car (cdr x5)))
                                  (x4 (cdr (cdr x5))))))))))
        (letrec ((x5 (lambda (x6)
                        (labels
                          ((staticfail1006 () (x5 (x4 x6))))
                          (if (null? x6)
                            '()
                            (if (null? (cdr x6)) (car x6) (staticfail1006)))))))
          (x5 (x3 x2))))))
)

