;; Le module 
(module
  __caml_front
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_globals
    __caml_syntax
    __caml_location
    __caml_builtins
    __caml_modules
    __caml_lambda
    __caml_prim
    __caml_match
    __caml_tr_env
    __caml_trstream
    __caml_ty_error)
  (export
    (extract_constant_30@front x1)
    (check_letrec_expr_190@front x1)
    (size_of_expr_51@front x1)
    (partial_fun_13@front x1)
    (2-100-partial_fun_13@front x1 x2)
    (partial_try_216@front x1)
    (translate_expr_56@front x1)
    (translate_let_249@front x1)
    (translate_match_88@front x1)
    (translate_bind_17@front x1)
    (translate_simple_match_49@front x1)
    (2-28-translate_expr_56@front x1 a1020)
    (4-219-translate_match_88@front x1 x2 x3 x4)
    (4-190-translate_simple_match_49@front
      x1
      x2
      x3
      x4)
    (2-61-translate_let_249@front x1 x2)
    (2-150-translate_bind_17@front x1 x2)
    translate_expression_98@front
    (make_sequence_247@front x1)
    (2-56-make_sequence_247@front x1 x2)
    (translate_letdef_153@front x1)
    (2-223-translate_letdef_153@front x1 x2)
    (translate_letdef_rec_253@front x1)
    (2-231-translate_letdef_rec_253@front x1 x2)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (extract_constant_30@front x1)
  (labels
    ((staticfail1000
       ()
       (caml-raise 'Not_constant_1@front)))
    (case (if (caml-constant-constr? x1)
            -1
            (caml-regular-constr-tag x1))
      ((2) (caml-constr-get-field x1 0))
      (else (staticfail1000)))))


(define (check_letrec_expr_190@front x1)
  (let ((x2 (caml-constr-get-field x1 0)))
    (labels
      ((staticfail1001
         ()
         (illegal_letrec_expr_66@ty_error
           (caml-constr-get-field x1 1))))
      (case (if (caml-constant-constr? x2)
              -1
              (caml-regular-constr-tag x2))
        ((22 23 8 4 2 1) #f)
        ((17 3)
         ((do_list_18@list check_letrec_expr_190@front)
          (caml-constr-get-field x2 0)))
        ((5)
         (begin
           (check_letrec_expr_190@front
             (caml-constr-get-field x2 1))
           (let ((x3 (caml-constr-get-field
                       (caml-constr-get-field
                         (caml-constr-get-field x2 0)
                         1)
                       4)))
             (labels
               ((staticfail1002 () #f))
               (case (if (caml-constant-constr? x3)
                       -1
                       (caml-regular-constr-tag x3))
                 ((3)
                  (let ((x4 (caml-constr-get-field x2 1)))
                    (labels
                      ((staticfail1003
                         ()
                         (illegal_letrec_expr_66@ty_error
                           (caml-constr-get-field x1 1))))
                      (case (if (caml-constant-constr?
                                  (caml-constr-get-field x4 0))
                              -1
                              (caml-regular-constr-tag
                                (caml-constr-get-field x4 0)))
                        ((3) #f)
                        (else (staticfail1003))))))
                 (else (staticfail1002)))))))
        ((16)
         (check_letrec_expr_190@front
           (caml-constr-get-field x2 0)))
        ((19)
         ((do_list_18@list
            (lambda (x3)
               (check_letrec_expr_190@front
                 (caml-constr-get-field x3 1))))
          (caml-constr-get-field x2 0)))
        (else (staticfail1001))))))


(define (size_of_expr_51@front x1)
  (let ((x2 (caml-constr-get-field x1 0)))
    (labels
      ((staticfail1004
         ()
         (illegal_letrec_expr_66@ty_error
           (caml-constr-get-field x1 1))))
      (case (if (caml-constant-constr? x2)
              -1
              (caml-regular-constr-tag x2))
        ((3)
         (begin
           ((do_list_18@list check_letrec_expr_190@front)
            (caml-constr-get-field x2 0))
           (caml-make-regular-1
             #f
             (list_length_112@list
               (caml-constr-get-field x2 0)))))
        ((5)
         (begin
           (check_letrec_expr_190@front
             (caml-constr-get-field x2 1))
           (let ((x3 (caml-constr-get-field
                       (caml-constr-get-field
                         (caml-constr-get-field x2 0)
                         1)
                       4)))
             (labels
               ((staticfail1005
                  ()
                  (caml-make-regular-2
                    #t
                    (caml-constr-get-field x2 0)
                    1)))
               (case (if (caml-constant-constr? x3)
                       -1
                       (caml-regular-constr-tag x3))
                 ((3)
                  (caml-make-regular-2
                    #t
                    (caml-constr-get-field x2 0)
                    (caml-constr-get-field x3 0)))
                 (else (staticfail1005)))))))
        ((8) #unspecified)
        ((16)
         (size_of_expr_51@front
           (caml-constr-get-field x2 0)))
        ((17)
         (begin
           ((do_list_18@list check_letrec_expr_190@front)
            (caml-constr-get-field x2 0))
           (caml-make-regular-1
             #u0000
             (list_length_112@list
               (caml-constr-get-field x2 0)))))
        ((19)
         (begin
           ((do_list_18@list
              (lambda (x3)
                 (check_letrec_expr_190@front
                   (caml-constr-get-field x3 1))))
            (caml-constr-get-field x2 0))
           (caml-make-regular-1
             #a000
             (list_length_112@list
               (caml-constr-get-field x2 0)))))
        ((7)
         (begin
           ((do_list_18@list
              (lambda (x3)
                 (check_letrec_expr_190@front
                   (caml-constr-get-field x3 1))))
            (caml-constr-get-field x2 1))
           (size_of_expr_51@front
             (caml-constr-get-field x2 2))))
        ((22) #<0006>)
        ((23) #<0007>)
        (else (staticfail1004))))))


(begin
  (define (partial_fun_13@front x1)
    (lambda (x2) (2-100-partial_fun_13@front x1 x2)))
 (define (2-100-partial_fun_13@front x1 x2)
    (let ((x3 (caml-make-regular-2
                #<0007>
                #<000c>
                (cons (caml-make-regular-1
                        #t
                        (caml-make-regular-2
                          #t
                          match_failure_tag_73@builtins
                          (cons (caml-make-regular-1
                                  #f
                                  (caml-make-regular-1
                                    #unspecified
                                    (cell-ref input_name_202@location)))
                                (cons (caml-make-regular-1
                                        #f
                                        (caml-make-regular-1
                                          #f
                                          (caml-constr-get-field x1 0)))
                                      (cons (caml-make-regular-1
                                              #f
                                              (caml-make-regular-1
                                                #f
                                                (caml-constr-get-field x1 1)))
                                            '())))))
                      '()))))
      (let ((x4 x2))
        (labels
          ((staticfail1006 () x3))
          (let ((g1045 x4))
            (cond ((eq? g1045 #unspecified)
                   (begin
                     (prerr_location_1@location x1)
                     (begin
                       (prerr_begline_213@misc
                         " Warning: pattern matching is not exhaustive")
                       (begin (prerr_endline2_160@misc "") x3))))
                  (else (staticfail1006))))))))
)

(define (partial_try_216@front x1)
  '#(#<000c> (#(0 #f)) #<0007>))


(begin
  (begin
    (define (translate_expr_56@front x1)
      (lambda (a1034)
         (2-28-translate_expr_56@front x1 a1034)))
   (define (2-28-translate_expr_56@front x1 a1034)
      (letrec ((x2 (lambda (x3)
                      (let ((x4 (caml-constr-get-field x3 0)))
                        (case (caml-regular-constr-tag x4)
                          ((1)
                           (case (caml-regular-constr-tag
                                   (cell-ref (caml-constr-get-field x4 0)))
                             ((2)
                              (let ((x5 (caml-constr-get-field
                                          (cell-ref
                                            (caml-constr-get-field x4 0))
                                          0)))
                                (2-26-translate_access_117@tr_env x5 x1)))
                             (else
                              (let ((x5 (caml-constr-get-field
                                          (cell-ref
                                            (caml-constr-get-field x4 0))
                                          0)))
                                (let ((x6 (caml-constr-get-field
                                            (caml-constr-get-field x5 1)
                                            1)))
                                  (let ((g1046 x6))
                                    (cond ((eq? g1046 #f)
                                           (caml-make-regular-2
                                             #<0007>
                                             (caml-make-regular-1
                                               #t
                                               (caml-constr-get-field x5 0))
                                             '()))
                                          (else
                                           (labels
                                             ((staticfail1021
                                                ()
                                                (letrec ((x7 (lambda (x8)
                                                                (lambda (x9)
                                                                   (if (>=fx x9
                                                                             (caml-constr-get-field
                                                                               x6
                                                                               1))
                                                                     (caml-make-regular-2
                                                                       #<0007>
                                                                       (caml-constr-get-field
                                                                         x6
                                                                         2)
                                                                       x8)
                                                                     (caml-make-regular-1
                                                                       #u0000
                                                                       ((x7 (cons (caml-make-regular-1
                                                                                    #f
                                                                                    x9)
                                                                                  x8))
                                                                        (+fx x9
                                                                             1))))))))
                                                  ((x7 '()) 0))))
                                             (let ((g1047 (caml-constr-get-field
                                                            x6
                                                            1)))
                                               (cond ((=fx g1047 0)
                                                      (caml-make-regular-2
                                                        #<0007>
                                                        (caml-make-regular-1
                                                          #t
                                                          (caml-constr-get-field
                                                            x5
                                                            0))
                                                        '()))
                                                     (else
                                                      (staticfail1021)))))))))))))
                          ((2)
                           (caml-make-regular-1
                             #t
                             (caml-constr-get-field x4 0)))
                          ((3)
                           (let ((x5 ((map_118@list x2)
                                      (caml-constr-get-field x4 0))))
                             (with-handler
                               (lambda (x6)
                                  (labels
                                    ((staticfail1023 () (caml-raise x6)))
                                    (case (caml-extensible-constr-tag x6)
                                      ((Not_constant_1@front)
                                       (caml-make-regular-2
                                         #<0007>
                                         '#(#(#("builtin" "tuple" #f) 0 1 #t)
                                            #<0007>)
                                         x5))
                                      (else (staticfail1023)))))
                               (unwind-protect
                                 (begin
                                   (push-exception-handler)
                                   (caml-make-regular-1
                                     #t
                                     (caml-make-regular-2
                                       #t
                                       '#(#("builtin" "tuple" #f) 0 1 #t)
                                       ((map_118@list extract_constant_30@front)
                                        x5))))
                                 (pop-exception-handler)))))
                          ((4)
                           (caml-make-regular-1
                             #t
                             (caml-make-regular-2
                               #t
                               (caml-constr-get-field
                                 (caml-constr-get-field
                                   (caml-constr-get-field x4 0)
                                   1)
                                 3)
                               '())))
                          ((5)
                           (let ((x5 (caml-constr-get-field
                                       (caml-constr-get-field
                                         (caml-constr-get-field x4 0)
                                         1)
                                       4)))
                             (let ((g1048 x5))
                               (cond ((eq? g1048 #f)
                                      (caml-make-regular-2
                                        #<000e>
                                        (x2 (caml-constr-get-field x4 1))
                                        (caml-make-regular-1
                                          #t
                                          (caml-make-regular-2
                                            #t
                                            (caml-constr-get-field
                                              (caml-constr-get-field
                                                (caml-constr-get-field x4 0)
                                                1)
                                              3)
                                            '()))))
                                     ((eq? g1048 #t)
                                      (let ((x6 (x2 (caml-constr-get-field
                                                      x4
                                                      1))))
                                        (let ((x7 (caml-constr-get-field
                                                    (caml-constr-get-field
                                                      (caml-constr-get-field
                                                        x4
                                                        0)
                                                      1)
                                                    2)))
                                          (let ((g1049 x7))
                                            (cond ((eq? g1049 #f)
                                                   (caml-make-regular-2
                                                     #<0007>
                                                     (caml-make-regular-1
                                                       #<0007>
                                                       (caml-constr-get-field
                                                         (caml-constr-get-field
                                                           (caml-constr-get-field
                                                             x4
                                                             0)
                                                           1)
                                                         3))
                                                     (cons x6 '())))
                                                  ((eq? g1049 #t)
                                                   (with-handler
                                                     (lambda (x8)
                                                        (labels
                                                          ((staticfail1025
                                                             ()
                                                             (caml-raise x8)))
                                                          (case (caml-extensible-constr-tag
                                                                  x8)
                                                            ((Not_constant_1@front)
                                                             (caml-make-regular-2
                                                               #<0007>
                                                               (caml-make-regular-1
                                                                 #<0007>
                                                                 (caml-constr-get-field
                                                                   (caml-constr-get-field
                                                                     (caml-constr-get-field
                                                                       x4
                                                                       0)
                                                                     1)
                                                                   3))
                                                               (cons x6 '())))
                                                            (else
                                                             (staticfail1025)))))
                                                     (unwind-protect
                                                       (begin
                                                         (push-exception-handler)
                                                         (caml-make-regular-1
                                                           #t
                                                           (caml-make-regular-2
                                                             #t
                                                             (caml-constr-get-field
                                                               (caml-constr-get-field
                                                                 (caml-constr-get-field
                                                                   x4
                                                                   0)
                                                                 1)
                                                               3)
                                                             (cons (extract_constant_30@front
                                                                     x6)
                                                                   '()))))
                                                       (pop-exception-handler))))
                                                  (else #f))))))
                                     (else
                                      (let ((x6 (caml-constr-get-field x4 1)))
                                        (labels
                                          ((staticfail1026
                                             ()
                                             (letrec ((x7 (lambda (x8)
                                                             (if (>=fx x8
                                                                       (caml-constr-get-field
                                                                         x5
                                                                         0))
                                                               '()
                                                               (cons (caml-make-regular-2
                                                                       #<0007>
                                                                       (caml-make-regular-1
                                                                         #<0009>
                                                                         x8)
                                                                       '(#(0
                                                                           #f)))
                                                                     (x7 (+fx x8
                                                                              1)))))))
                                               (caml-make-regular-2
                                                 #a000
                                                 (cons (x2 (caml-constr-get-field
                                                             x4
                                                             1))
                                                       '())
                                                 (caml-make-regular-2
                                                   #<0007>
                                                   (caml-make-regular-1
                                                     #<0007>
                                                     (caml-constr-get-field
                                                       (caml-constr-get-field
                                                         (caml-constr-get-field
                                                           x4
                                                           0)
                                                         1)
                                                       3))
                                                   (x7 0))))))
                                          (case (if (caml-constant-constr?
                                                      (caml-constr-get-field
                                                        x6
                                                        0))
                                                  -1
                                                  (caml-regular-constr-tag
                                                    (caml-constr-get-field
                                                      x6
                                                      0)))
                                            ((3)
                                             (let ((x7 ((map_118@list x2)
                                                        (caml-constr-get-field
                                                          (caml-constr-get-field
                                                            x6
                                                            0)
                                                          0))))
                                               (with-handler
                                                 (lambda (x8)
                                                    (labels
                                                      ((staticfail1028
                                                         ()
                                                         (caml-raise x8)))
                                                      (case (caml-extensible-constr-tag
                                                              x8)
                                                        ((Not_constant_1@front)
                                                         (caml-make-regular-2
                                                           #<0007>
                                                           (caml-make-regular-1
                                                             #<0007>
                                                             (caml-constr-get-field
                                                               (caml-constr-get-field
                                                                 (caml-constr-get-field
                                                                   x4
                                                                   0)
                                                                 1)
                                                               3))
                                                           x7))
                                                        (else
                                                         (staticfail1028)))))
                                                 (unwind-protect
                                                   (begin
                                                     (push-exception-handler)
                                                     (caml-make-regular-1
                                                       #t
                                                       (caml-make-regular-2
                                                         #t
                                                         (caml-constr-get-field
                                                           (caml-constr-get-field
                                                             (caml-constr-get-field
                                                               x4
                                                               0)
                                                             1)
                                                           3)
                                                         ((map_118@list
                                                            extract_constant_30@front)
                                                          x7))))
                                                   (pop-exception-handler)))))
                                            (else (staticfail1026))))))))))
                          ((6)
                           (labels
                             ((staticfail1029
                                ()
                                (caml-make-regular-2
                                  #unspecified
                                  (x2 (caml-constr-get-field x4 0))
                                  ((map_118@list x2)
                                   (caml-constr-get-field x4 1)))))
                             (case (if (caml-constant-constr?
                                         (caml-constr-get-field
                                           (caml-constr-get-field x4 0)
                                           0))
                                     -1
                                     (caml-regular-constr-tag
                                       (caml-constr-get-field
                                         (caml-constr-get-field x4 0)
                                         0)))
                               ((8)
                                (if (null? (caml-constr-get-field
                                             (caml-constr-get-field
                                               (caml-constr-get-field x4 0)
                                               0)
                                             0))
                                  (staticfail1029)
                                  (if (eq? (list_length_112@list
                                             (caml-constr-get-field
                                               (car (caml-constr-get-field
                                                      (caml-constr-get-field
                                                        (caml-constr-get-field
                                                          x4
                                                          0)
                                                        0)
                                                      0))
                                               0))
                                           (list_length_112@list
                                             (caml-constr-get-field x4 1)))
                                    (caml-make-regular-2
                                      #a000
                                      ((translate_let_249@front x1)
                                       (caml-constr-get-field x4 1))
                                      ((((translate_match_88@front
                                           (caml-constr-get-field x3 1))
                                         x1)
                                        (partial_fun_13@front
                                          (caml-constr-get-field x3 1)))
                                       (caml-constr-get-field
                                         (caml-constr-get-field
                                           (caml-constr-get-field x4 0)
                                           0)
                                         0)))
                                    (caml-make-regular-2
                                      #unspecified
                                      (x2 (caml-constr-get-field x4 0))
                                      ((map_118@list x2)
                                       (caml-constr-get-field x4 1))))))
                               ((1)
                                (case (if (caml-constant-constr?
                                            (cell-ref
                                              (caml-constr-get-field
                                                (caml-constr-get-field
                                                  (caml-constr-get-field x4 0)
                                                  0)
                                                0)))
                                        -1
                                        (caml-regular-constr-tag
                                          (cell-ref
                                            (caml-constr-get-field
                                              (caml-constr-get-field
                                                (caml-constr-get-field x4 0)
                                                0)
                                              0))))
                                  ((1)
                                   (let ((x5 (caml-constr-get-field
                                               (cell-ref
                                                 (caml-constr-get-field
                                                   (caml-constr-get-field
                                                     (caml-constr-get-field
                                                       x4
                                                       0)
                                                     0)
                                                   0))
                                               0)))
                                     (let ((x6 (caml-constr-get-field
                                                 (caml-constr-get-field x5 1)
                                                 1)))
                                       (let ((g1050 x6))
                                         (cond ((eq? g1050 #f)
                                                (caml-make-regular-2
                                                  #unspecified
                                                  (x2 (caml-constr-get-field
                                                        x4
                                                        0))
                                                  ((map_118@list x2)
                                                   (caml-constr-get-field
                                                     x4
                                                     1))))
                                               (else
                                                (if (eq? (caml-constr-get-field
                                                           x6
                                                           1)
                                                         (list_length_112@list
                                                           (caml-constr-get-field
                                                             x4
                                                             1)))
                                                  (caml-make-regular-2
                                                    #<0007>
                                                    (caml-constr-get-field x6 2)
                                                    ((map_118@list x2)
                                                     (caml-constr-get-field
                                                       x4
                                                       1)))
                                                  (caml-make-regular-2
                                                    #unspecified
                                                    (x2 (caml-constr-get-field
                                                          x4
                                                          0))
                                                    ((map_118@list x2)
                                                     (caml-constr-get-field
                                                       x4
                                                       1))))))))))
                                  (else (staticfail1029))))
                               (else (staticfail1029)))))
                          ((7)
                           (let ((g1051 (caml-constr-get-field x4 0)))
                             (cond ((eq? g1051 #f)
                                    (let ((x5 ((map_118@list
                                                 (lambda (x5)
                                                    (caml-constr-get-field
                                                      x5
                                                      0)))
                                               (caml-constr-get-field x4 1))))
                                      (caml-make-regular-2
                                        #a000
                                        ((translate_bind_17@front x1)
                                         (caml-constr-get-field x4 1))
                                        ((((translate_match_88@front
                                             (caml-constr-get-field x3 1))
                                           x1)
                                          (partial_fun_13@front
                                            (caml-constr-get-field x3 1)))
                                         (cons (caml-make-regular-2
                                                 #f
                                                 x5
                                                 (caml-constr-get-field x4 2))
                                               '())))))
                                   ((eq? g1051 #t)
                                    (let ((x5 (2-243-add_let_rec_to_env_158@tr_env
                                                x1
                                                (caml-constr-get-field x4 1))))
                                      (let ((x6 (lambda (x6)
                                                   (labels
                                                     ((staticfail1030
                                                        ()
                                                        (fatal_error_193@misc
                                                          "translate_rec_bind")))
                                                     (case (if (caml-constant-constr?
                                                                 (caml-constr-get-field
                                                                   (caml-constr-get-field
                                                                     x6
                                                                     0)
                                                                   0))
                                                             -1
                                                             (caml-regular-constr-tag
                                                               (caml-constr-get-field
                                                                 (caml-constr-get-field
                                                                   x6
                                                                   0)
                                                                 0)))
                                                       ((2)
                                                        (caml-make-regular-2
                                                          #f
                                                          (2-28-translate_expr_56@front
                                                            x5
                                                            (caml-constr-get-field
                                                              x6
                                                              1))
                                                          (size_of_expr_51@front
                                                            (caml-constr-get-field
                                                              x6
                                                              1))))
                                                       (else
                                                        (staticfail1030)))))))
                                        (caml-make-regular-2
                                          #<0006>
                                          ((map_118@list x6)
                                           (caml-constr-get-field x4 1))
                                          (2-28-translate_expr_56@front
                                            x5
                                            (caml-constr-get-field x4 2))))))
                                   (else #f))))
                          ((8)
                           (if (null? (caml-constr-get-field x4 0))
                             (fatal_error_193@misc
                               "translate_expr: empty fun")
                             (letrec ((x5 (lambda (x6)
                                             (if (null? x6)
                                               ((((translate_match_88@front
                                                    (caml-constr-get-field
                                                      x3
                                                      1))
                                                  x1)
                                                 (partial_fun_13@front
                                                   (caml-constr-get-field
                                                     x3
                                                     1)))
                                                (caml-constr-get-field x4 0))
                                               (caml-make-regular-1
                                                 #u0000
                                                 (x5 (cdr x6)))))))
                               (x5 (caml-constr-get-field
                                     (car (caml-constr-get-field x4 0))
                                     0)))))
                          ((9)
                           (caml-make-regular-2
                             #<000c>
                             (x2 (caml-constr-get-field x4 0))
                             ((((translate_simple_match_49@front
                                  (caml-constr-get-field x3 1))
                                x1)
                               partial_try_216@front)
                              (caml-constr-get-field x4 1))))
                          ((10)
                           (caml-make-regular-2
                             #<000e>
                             (x2 (caml-constr-get-field x4 0))
                             (x2 (caml-constr-get-field x4 1))))
                          ((11)
                           (caml-make-regular-3
                             #<000d>
                             (x2 (caml-constr-get-field x4 0))
                             (x2 (caml-constr-get-field x4 1))
                             (x2 (caml-constr-get-field x4 2))))
                          ((12)
                           (caml-make-regular-2
                             #<000f>
                             (x2 (caml-constr-get-field x4 0))
                             (x2 (caml-constr-get-field x4 1))))
                          ((13)
                           (caml-make-regular-4
                             #<0010>
                             (x2 (caml-constr-get-field x4 1))
                             (2-28-translate_expr_56@front
                               (caml-make-regular-1 #t x1)
                               (caml-constr-get-field x4 2))
                             (caml-constr-get-field x4 3)
                             (2-28-translate_expr_56@front
                               (2-180-add_for_parameter_to_env_127@tr_env
                                 x1
                                 (caml-constr-get-field x4 0))
                               (caml-constr-get-field x4 4))))
                          ((14)
                           (caml-make-regular-2
                             #<0011>
                             (x2 (caml-constr-get-field x4 0))
                             (x2 (caml-constr-get-field x4 1))))
                          ((15)
                           (caml-make-regular-2
                             #<0012>
                             (x2 (caml-constr-get-field x4 0))
                             (x2 (caml-constr-get-field x4 1))))
                          ((16) (x2 (caml-constr-get-field x4 0)))
                          ((17)
                           (labels
                             ((staticfail1031
                                ()
                                (caml-make-regular-2
                                  #<0007>
                                  '#(#(#("builtin" "vector" #f) 0 0 #t) #<0007>)
                                  ((map_118@list x2)
                                   (caml-constr-get-field x4 0)))))
                             (if (null? (caml-constr-get-field x4 0))
                               '#(#(#(#("builtin" "vector" #f) 0 0 #t) () #t)
                                  #t)
                               (staticfail1031))))
                          ((18)
                           (3-114-translate_update_202@tr_env
                             (caml-constr-get-field x4 0)
                             x1
                             (x2 (caml-constr-get-field x4 1))))
                          ((19)
                           (let ((x5 ((make_vect_185@vect
                                        (list_length_112@list
                                          (caml-constr-get-field x4 0)))
                                      #<000a>)))
                             (begin
                               ((do_list_18@list
                                  (lambda (x6)
                                     (((vect_assign_169@vect x5)
                                       (caml-constr-get-field
                                         (caml-constr-get-field
                                           (caml-constr-get-field x6 0)
                                           1)
                                         3))
                                      (x2 (caml-constr-get-field x6 1)))))
                                (caml-constr-get-field x4 0))
                               (with-handler
                                 (lambda (x6)
                                    (labels
                                      ((staticfail1033 () (caml-raise x6)))
                                      (case (caml-extensible-constr-tag x6)
                                        ((Not_constant_1@front)
                                         (caml-make-regular-2
                                           #<0007>
                                           '#(#(#("builtin" "record" #f) 0 0 #t)
                                              #<0007>)
                                           (list_of_vect_3@vect x5)))
                                        (else (staticfail1033)))))
                                 (unwind-protect
                                   (begin
                                     (push-exception-handler)
                                     (if ((for_all_96@list
                                            (lambda (x6)
                                               (eq? (caml-constr-get-field
                                                      (caml-constr-get-field
                                                        (caml-constr-get-field
                                                          x6
                                                          0)
                                                        1)
                                                      2)
                                                    #t)))
                                          (caml-constr-get-field x4 0))
                                       (caml-make-regular-1
                                         #t
                                         (caml-make-regular-2
                                           #t
                                           '#(#("builtin" "record" #f) 0 0 #t)
                                           ((map_vect_list_65@vect
                                              extract_constant_30@front)
                                            x5)))
                                       (caml-raise 'Not_constant_1@front)))
                                   (pop-exception-handler))))))
                          ((20)
                           (caml-make-regular-2
                             #<0007>
                             (caml-make-regular-1
                               #<0009>
                               (caml-constr-get-field
                                 (caml-constr-get-field
                                   (caml-constr-get-field x4 1)
                                   1)
                                 3))
                             (cons (x2 (caml-constr-get-field x4 0)) '())))
                          ((21)
                           (caml-make-regular-2
                             #<0007>
                             (caml-make-regular-1
                               #<000a>
                               (caml-constr-get-field
                                 (caml-constr-get-field
                                   (caml-constr-get-field x4 1)
                                   1)
                                 3))
                             (cons (x2 (caml-constr-get-field x4 0))
                                   (cons (x2 (caml-constr-get-field x4 2))
                                         '()))))
                          ((22)
                           (3-121-translate_stream_2@trstream
                             translate_expr_56@front
                             x1
                             (caml-constr-get-field x4 0)))
                          (else
                           (4-247-translate_parser_248@trstream
                             translate_expr_56@front
                             (caml-constr-get-field x3 1)
                             x1
                             (caml-constr-get-field x4 0))))))))
        (x2 a1034)))
)(begin
    (begin
      (define (translate_match_88@front x1)
        (lambda (x2)
           (lambda (x3)
              (lambda (x4)
                 (4-219-translate_match_88@front x1 x2 x3 x4)))))
     (define (4-219-translate_match_88@front x1 x2 x3 x4)
        (let ((x5 (lambda (x5)
                     (let ((x6 (2-65-add_pat_list_to_env_65@tr_env
                                 x2
                                 (caml-constr-get-field x5 0))))
                       (caml-make-regular-2
                         #f
                         (caml-constr-get-field x5 0)
                         ((caml-constr-get-field x6 1)
                          (2-28-translate_expr_56@front
                            (caml-constr-get-field x6 0)
                            (caml-constr-get-field x5 1))))))))
          (3-10-translate_matching_84@match
            x3
            x1
            ((map_118@list x5) x4))))
)  (begin
      (begin
        (define (translate_simple_match_49@front x1)
          (lambda (x2)
             (lambda (x3)
                (lambda (x4)
                   (4-190-translate_simple_match_49@front
                     x1
                     x2
                     x3
                     x4)))))
       (define (4-190-translate_simple_match_49@front
                 x1
                 x2
                 x3
                 x4)
          (let ((x5 (lambda (x5)
                       (let ((x6 (2-244-add_pat_to_env_200@tr_env
                                   x2
                                   (caml-constr-get-field x5 0))))
                         (caml-make-regular-2
                           #f
                           (cons (caml-constr-get-field x5 0) '())
                           ((caml-constr-get-field x6 1)
                            (2-28-translate_expr_56@front
                              (caml-constr-get-field x6 0)
                              (caml-constr-get-field x5 1))))))))
            (3-10-translate_matching_84@match
              x3
              x1
              ((map_118@list x5) x4))))
)    (begin
        (begin
          (define (translate_let_249@front x1)
            (lambda (x2)
               (2-61-translate_let_249@front x1 x2)))
         (define (2-61-translate_let_249@front x1 x2)
            (if (null? x2)
              '()
              (cons (2-28-translate_expr_56@front x1 (car x2))
                    (2-61-translate_let_249@front
                      (caml-make-regular-1 #t x1)
                      (cdr x2)))))
)      (begin
          (define (translate_bind_17@front x1)
            (lambda (x2)
               (2-150-translate_bind_17@front x1 x2)))
         (define (2-150-translate_bind_17@front x1 x2)
            (if (null? x2)
              '()
              (cons (2-28-translate_expr_56@front
                      x1
                      (caml-constr-get-field (car x2) 1))
                    (2-150-translate_bind_17@front
                      (caml-make-regular-1 #t x1)
                      (cdr x2)))))
)))))

(define translate_expression_98@front
  (translate_expr_56@front #f))


(begin
  (define (make_sequence_247@front x1)
    (lambda (x2)
       (2-56-make_sequence_247@front x1 x2)))
 (define (2-56-make_sequence_247@front x1 x2)
    (if (null? x2)
      '#(#(#(0 #f) #f) #t)
      (labels
        ((staticfail1036
           ()
           (caml-make-regular-2
             #<000e>
             (x1 (car x2))
             (2-56-make_sequence_247@front x1 (cdr x2)))))
        (if (null? (cdr x2))
          (x1 (car x2))
          (staticfail1036)))))
)

(begin
  (define (translate_letdef_153@front x1)
    (lambda (x2)
       (2-223-translate_letdef_153@front x1 x2)))
 (define (2-223-translate_letdef_153@front x1 x2)
    (let ((x3 (caml-constr-get-field
                (cell-ref defined_module_128@modules)
                0)))
      (let ((x4 x2))
        (labels
          ((staticfail1037
             ()
             (let ((x5 ((map_118@list
                          (lambda (x5) (caml-constr-get-field x5 0)))
                        x2)))
               (let ((x6 ((flat_map_45@list free_vars_of_pat_1@syntax) x5)))
                 (let ((x7 (env_for_toplevel_let_34@tr_env x5)))
                   (let ((x8 (lambda (x8)
                                (caml-make-regular-2
                                  #<0007>
                                  (caml-make-regular-1
                                    #unspecified
                                    (caml-make-regular-2 #f x3 x8))
                                  (cons (2-26-translate_access_117@tr_env x8 x7)
                                        '())))))
                     (caml-make-regular-2
                       #a000
                       (2-150-translate_bind_17@front #f x2)
                       (3-10-translate_matching_84@match
                         (partial_fun_13@front x1)
                         x1
                         (cons (caml-make-regular-2
                                 #f
                                 x5
                                 (2-56-make_sequence_247@front x8 x6))
                               '())))))))))
          (if (null? x4)
            (staticfail1037)
            (case (if (caml-constant-constr?
                        (caml-constr-get-field
                          (caml-constr-get-field (car x4) 0)
                          0))
                    -1
                    (caml-regular-constr-tag
                      (caml-constr-get-field
                        (caml-constr-get-field (car x4) 0)
                        0)))
              ((2)
               (if (null? (cdr x4))
                 (caml-make-regular-2
                   #<0007>
                   (caml-make-regular-1
                     #unspecified
                     (caml-make-regular-2
                       #f
                       x3
                       (caml-constr-get-field
                         (caml-constr-get-field
                           (caml-constr-get-field (car x4) 0)
                           0)
                         0)))
                   (cons (translate_expression_98@front
                           (caml-constr-get-field (car x4) 1))
                         '()))
                 (staticfail1037)))
              (else (staticfail1037))))))))
)

(begin
  (define (translate_letdef_rec_253@front x1)
    (lambda (x2)
       (2-231-translate_letdef_rec_253@front x1 x2)))
 (define (2-231-translate_letdef_rec_253@front x1 x2)
    (let ((x3 (caml-constr-get-field
                (cell-ref defined_module_128@modules)
                0)))
      (with-handler
        (lambda (x4)
           (labels
             ((staticfail1042 () (caml-raise x4)))
             (case (caml-extensible-constr-tag x4)
               ((Complicated_definition_2@front)
                (let ((x5 (lambda (x5)
                             (labels
                               ((staticfail1043
                                  ()
                                  (illegal_letrec_pat_53@ty_error
                                    (caml-constr-get-field
                                      (caml-constr-get-field x5 0)
                                      1))))
                               (case (if (caml-constant-constr?
                                           (caml-constr-get-field
                                             (caml-constr-get-field x5 0)
                                             0))
                                       -1
                                       (caml-regular-constr-tag
                                         (caml-constr-get-field
                                           (caml-constr-get-field x5 0)
                                           0)))
                                 ((2)
                                  (caml-make-regular-2
                                    #<0007>
                                    (caml-make-regular-1
                                      #unspecified
                                      (caml-make-regular-2
                                        #f
                                        x3
                                        (caml-constr-get-field
                                          (caml-constr-get-field
                                            (caml-constr-get-field x5 0)
                                            0)
                                          0)))
                                    (cons (caml-make-regular-2
                                            #<0007>
                                            (caml-make-regular-1
                                              #u0000
                                              (size_of_expr_51@front
                                                (caml-constr-get-field x5 1)))
                                            '())
                                          '())))
                                 (else (staticfail1043)))))))
                  (let ((x6 (2-56-make_sequence_247@front x5 x2)))
                    (let ((x7 (lambda (x7)
                                 (labels
                                   ((staticfail1044
                                      ()
                                      (fatal_error_193@misc
                                        "translate_letdef_rec")))
                                   (case (if (caml-constant-constr?
                                               (caml-constr-get-field
                                                 (caml-constr-get-field x7 0)
                                                 0))
                                           -1
                                           (caml-regular-constr-tag
                                             (caml-constr-get-field
                                               (caml-constr-get-field x7 0)
                                               0)))
                                     ((2)
                                      (caml-make-regular-2
                                        #<0007>
                                        #a000
                                        (cons (caml-make-regular-2
                                                #<0007>
                                                (caml-make-regular-1
                                                  #t
                                                  (caml-make-regular-2
                                                    #f
                                                    x3
                                                    (caml-constr-get-field
                                                      (caml-constr-get-field
                                                        (caml-constr-get-field
                                                          x7
                                                          0)
                                                        0)
                                                      0)))
                                                '())
                                              (cons (translate_expression_98@front
                                                      (caml-constr-get-field
                                                        x7
                                                        1))
                                                    '()))))
                                     (else (staticfail1044)))))))
                      (let ((x8 (2-56-make_sequence_247@front x7 x2)))
                        (caml-make-regular-2 #<000e> x6 x8))))))
               (else (staticfail1042)))))
        (unwind-protect
          (begin
            (push-exception-handler)
            (2-56-make_sequence_247@front
              (lambda (x4)
                 (labels
                   ((staticfail1038
                      ()
                      (caml-raise 'Complicated_definition_2@front)))
                   (case (if (caml-constant-constr?
                               (caml-constr-get-field
                                 (caml-constr-get-field x4 0)
                                 0))
                           -1
                           (caml-regular-constr-tag
                             (caml-constr-get-field
                               (caml-constr-get-field x4 0)
                               0)))
                     ((2)
                      (case (if (caml-constant-constr?
                                  (caml-constr-get-field
                                    (caml-constr-get-field x4 1)
                                    0))
                              -1
                              (caml-regular-constr-tag
                                (caml-constr-get-field
                                  (caml-constr-get-field x4 1)
                                  0)))
                        ((8)
                         (caml-make-regular-2
                           #<0007>
                           (caml-make-regular-1
                             #unspecified
                             (caml-make-regular-2
                               #f
                               x3
                               (caml-constr-get-field
                                 (caml-constr-get-field
                                   (caml-constr-get-field x4 0)
                                   0)
                                 0)))
                           (cons (translate_expression_98@front
                                   (caml-constr-get-field x4 1))
                                 '())))
                        (else (staticfail1038))))
                     (else (staticfail1038)))))
              x2))
          (pop-exception-handler)))))
)

