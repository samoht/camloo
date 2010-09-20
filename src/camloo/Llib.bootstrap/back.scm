;; Le module 
(module
  __caml_back
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_lambda
    __caml_prim
    __caml_instruct
    __caml_globals)
  (export
    (is_return_151@back x1)
    label_counter_30@back
    (reset_label_204@back x1)
    (new_label_43@back x1)
    (label_code_151@back x1)
    (make_branch_143@back x1)
    (discard_dead_code_203@back x1)
    (add_switchtable_226@back x1)
    (2-61-add_switchtable_226@back x1 x2)
    (compile_nbranch_88@back x1)
    (2-159-compile_nbranch_88@back x1 x2)
    (switch_contains_extensibles_230@back x1)
    invert_bool_test_95@back
    (test_for_atom_74@back x1)
    still_to_compile_141@back
    (compile_expr_212@back x1)
    (3-162-compile_expr_212@back x1 a1030 a1029)
    (compile_rest_230@back x1)
    (compile_lambda_215@back x1)
    (2-140-compile_lambda_215@back x1 x2)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (is_return_151@back x1)
  (labels
    ((staticfail1000 () #f))
    (if (null? x1)
      (staticfail1000)
      (let ((g1052 (car x1)))
        (cond ((eq? g1052 #<000d>) #t)
              (else (staticfail1000)))))))


(define label_counter_30@back (make-cell 0))

(begin
  (define (reset_label_204@back x1)
    (cell-set! label_counter_30@back 0))
 (define (new_label_43@back x1)
    (begin
      (cell-set!
        label_counter_30@back
        (+fx (cell-ref label_counter_30@back) 1))
      (cell-ref label_counter_30@back)))
)

(define (label_code_151@back x1)
  (labels
    ((staticfail1001
       ()
       (let ((x2 (new_label_43@back #f)))
         (caml-make-regular-2
           #f
           x2
           (cons (caml-make-regular-1 #<0014> x2) x1)))))
    (if (null? x1)
      (staticfail1001)
      (case (if (caml-constant-constr? (car x1))
              -1
              (caml-regular-constr-tag (car x1)))
        ((20 21)
         (caml-make-regular-2
           #f
           (caml-constr-get-field (car x1) 0)
           x1))
        (else (staticfail1001))))))


(define (make_branch_143@back x1)
  (labels
    ((staticfail1002
       ()
       (let ((x2 (new_label_43@back #f)))
         (caml-make-regular-2
           #f
           (caml-make-regular-1 #<0015> x2)
           (cons (caml-make-regular-1 #<0014> x2) x1)))))
    (if (null? x1)
      (staticfail1002)
      (let ((g1053 (car x1)))
        (cond ((eq? g1053 #<000d>)
               (caml-make-regular-2 #f #<000d> x1))
              (else
               (case (if (caml-constant-constr? g1053)
                       -1
                       (caml-regular-constr-tag g1053))
                 ((21) (caml-make-regular-2 #f (car x1) x1))
                 (else (staticfail1002)))))))))


(define (discard_dead_code_203@back x1)
  (if (null? x1)
    '()
    (labels
      ((staticfail1003
         ()
         (discard_dead_code_203@back (cdr x1))))
      (case (if (caml-constant-constr? (car x1))
              -1
              (caml-regular-constr-tag (car x1)))
        ((20) x1)
        (else (staticfail1003))))))


(begin
  (define (add_switchtable_226@back x1)
    (lambda (x2)
       (2-61-add_switchtable_226@back x1 x2)))
 (define (2-61-add_switchtable_226@back x1 x2)
    (with-handler
      (lambda (x3)
         (labels
           ((staticfail1008 () (caml-raise x3)))
           (case (caml-extensible-constr-tag x3)
             ((Exit_5@exc)
              (cons (caml-make-regular-1 #<001c> x1) x2))
             (else (staticfail1008)))))
      (unwind-protect
        (begin
          (push-exception-handler)
          (begin
            (let ((stop1005
                    (-fx (let ((g1054 x1))
                           (if g1054 (vector-length g1054) 0))
                         1)))
              (let for1004 ((i3 1))
                (if (<=fx i3 stop1005)
                  (begin
                    (if ((lambda (x y) (not (eq? x y)))
                         ((vect_item_124@vect x1) i3)
                         ((vect_item_124@vect x1) 0))
                      (caml-raise 'Exit_5@exc)
                      #f)
                    (for1004 (+fx i3 1)))
                  (unspecified))))
            (let ((x3 x2))
              (labels
                ((staticfail1006
                   ()
                   (cons (caml-make-regular-1
                           #<0015>
                           ((vect_item_124@vect x1) 0))
                         x2)))
                (if (null? x3)
                  (staticfail1006)
                  (case (if (caml-constant-constr? (car x3))
                          -1
                          (caml-regular-constr-tag (car x3)))
                    ((20)
                     (if (eq? (caml-constr-get-field (car x3) 0)
                              ((vect_item_124@vect x1) 0))
                       x2
                       (cons (caml-make-regular-1
                               #<0015>
                               ((vect_item_124@vect x1) 0))
                             x2)))
                    (else (staticfail1006))))))))
        (pop-exception-handler))))
)

(begin
  (define (compile_nbranch_88@back x1)
    (lambda (x2)
       (2-159-compile_nbranch_88@back x1 x2)))
 (define (2-159-compile_nbranch_88@back x1 x2)
    (let ((x3 ((map_118@list
                 (lambda (x3)
                    (caml-make-regular-2
                      #f
                      (x1 (caml-constr-get-field x3 0))
                      (caml-constr-get-field x3 1))))
               x2)))
      (let ((x4 ((sort_214@sort
                   (lambda (x4)
                      (lambda (x5)
                         (<=fx (caml-constr-get-field x4 0)
                               (caml-constr-get-field x5 0)))))
                 x3)))
        (let ((x5 (vect_of_list_150@vect
                    ((map_118@list
                       (lambda (x5) (caml-constr-get-field x5 0)))
                     x4)))
              (x6 (vect_of_list_150@vect
                    ((map_118@list
                       (lambda (x6) (caml-constr-get-field x6 1)))
                     x4))))
          (let ((x7 (let ((g1055 x5))
                      (if g1055 (vector-length g1055) 0))))
            (let ((x8 (lambda (x8)
                         (lambda (x9)
                            (let ((x10 ((make_vect_185@vect
                                          (+fx (-fx ((vect_item_124@vect x5) x9)
                                                    ((vect_item_124@vect x5)
                                                     x8))
                                               1))
                                        #<000a>)))
                              (begin
                                (let ((stop1010 x9))
                                  (let for1009 ((i11 x8))
                                    (if (<=fx i11 stop1010)
                                      (begin
                                        (((vect_assign_169@vect x10)
                                          (-fx ((vect_item_124@vect x5) i11)
                                               ((vect_item_124@vect x5) x8)))
                                         ((vect_item_124@vect x6) i11))
                                        (for1009 (+fx i11 1)))
                                      (unspecified))))
                                x10))))))
              (letrec ((x9 (lambda (x10)
                              (if (>=fx x10 x7)
                                '()
                                (let ((x11 (-fx x7 1)))
                                  (begin
                                    (let g1056 ()
                                      (if (or (>=fx (-fx ((vect_item_124@vect
                                                            x5)
                                                          x11)
                                                         ((vect_item_124@vect
                                                            x5)
                                                          x10))
                                                    255)
                                              (>fx (-fx ((vect_item_124@vect x5)
                                                         x11)
                                                        ((vect_item_124@vect x5)
                                                         x10))
                                                   (*fx 4 (-fx x11 x10))))
                                        (begin (set! x11 (-fx x11 1)) (g1056))
                                        '()))
                                    (cons (caml-make-regular-3
                                            #f
                                            ((vect_item_124@vect x5) x10)
                                            ((x8 x10) x11)
                                            ((vect_item_124@vect x5) x11))
                                          (x9 (+fx x11 1)))))))))
                (let ((x10 (vect_of_list_150@vect (x9 0))))
                  (letrec ((x11 (lambda (x12)
                                   (lambda (x13)
                                      (if (>fx x12 x13)
                                        #f
                                        (let ((x14 (/fx (+fx x12 x13) 2)))
                                          (caml-make-regular-3
                                            #t
                                            ((x11 x12) (-fx x14 1))
                                            ((vect_item_124@vect x10) x14)
                                            ((x11 (+fx x14 1)) x13))))))))
                    ((x11 0)
                     (-fx (let ((g1057 x10))
                            (if g1057 (vector-length g1057) 0))
                          1)))))))))))
)

(define (switch_contains_extensibles_230@back x1)
  ((exists_138@list
     (lambda (x2)
        (labels
          ((staticfail1011 () #f))
          (case (if (caml-constant-constr?
                      (caml-constr-get-field x2 0))
                  -1
                  (caml-regular-constr-tag
                    (caml-constr-get-field x2 0)))
            ((1) #t)
            (else (staticfail1011))))))
   x1))


(define invert_bool_test_95@back
  (let ((x1 (lambda (x1)
               (let ((g1058 x1))
                 (cond ((eq? g1058 #f) #t)
                       ((eq? g1058 #t) #f)
                       ((eq? g1058 #u0000) #<0007>)
                       ((eq? g1058 #a000) #<0006>)
                       ((eq? g1058 #<0006>) #a000)
                       ((eq? g1058 #<0007>) #u0000)
                       (else (fatal_error_193@misc "invert_prim_test")))))))
    (lambda (x2)
       (let ((g1059 x2))
         (cond ((eq? g1059 #f) #t)
               ((eq? g1059 #t) #f)
               (else
                (case (caml-regular-constr-tag g1059)
                  ((3)
                   (caml-make-regular-1
                     #unspecified
                     (x1 (caml-constr-get-field x2 0))))
                  ((4)
                   (caml-make-regular-1
                     #u0000
                     (x1 (caml-constr-get-field x2 0))))
                  ((5)
                   (caml-make-regular-1
                     #a000
                     (x1 (caml-constr-get-field x2 0))))
                  (else (fatal_error_193@misc "invert_prim_test2")))))))))


(define (test_for_atom_74@back x1)
  (case (caml-regular-constr-tag x1)
    ((1)
     (caml-make-regular-1
       #unspecified
       (caml-make-regular-1
         #unspecified
         (caml-constr-get-field x1 0))))
    ((4)
     (caml-make-regular-1
       #unspecified
       (caml-make-regular-1
         #unspecified
         (int_of_char (caml-constr-get-field x1 0)))))
    ((2)
     (caml-make-regular-1
       #u0000
       (caml-make-regular-1
         #unspecified
         (caml-constr-get-field x1 0))))
    (else
     (caml-make-regular-1
       #a000
       (caml-make-regular-1
         #unspecified
         (caml-constr-get-field x1 0))))))


(define still_to_compile_141@back
  (new_27@stack #f))


(begin
  (define (compile_expr_212@back x1)
    (lambda (a1049)
       (lambda (a1048)
          (3-162-compile_expr_212@back x1 a1049 a1048))))
 (define (3-162-compile_expr_212@back x1 a1049 a1048)
    (letrec ((x2 (lambda (x9)
                    (lambda (x10)
                       (let ((x11 x9))
                         (let ((g1060 x11))
                           (cond ((eq? g1060 #<000a>)
                                  (cons (caml-make-regular-1 #<0015> x1)
                                        (discard_dead_code_203@back x10)))
                                 (else
                                  (case (caml-regular-constr-tag g1060)
                                    ((1)
                                     (cons (caml-make-regular-1
                                             #u0000
                                             (caml-constr-get-field x11 0))
                                           x10))
                                    ((2)
                                     (let ((x12 x10))
                                       (labels
                                         ((staticfail1031
                                            ()
                                            (cons (caml-make-regular-1
                                                    #f
                                                    (caml-constr-get-field
                                                      x11
                                                      0))
                                                  x10)))
                                         (if (null? x12)
                                           (staticfail1031)
                                           (let ((g1061 (car x12)))
                                             (cond ((eq? g1061 #<0007>) x10)
                                                   (else
                                                    (case (if (caml-constant-constr?
                                                                g1061)
                                                            -1
                                                            (caml-regular-constr-tag
                                                              g1061))
                                                      ((4 2 1) x10)
                                                      (else
                                                       (staticfail1031))))))))))
                                    ((3)
                                     (let ((x12 x10))
                                       (labels
                                         ((staticfail1032
                                            ()
                                            (cons #<0007>
                                                  ((x3 (caml-constr-get-field
                                                         x11
                                                         1))
                                                   (cons #<0006>
                                                         ((x2 (caml-constr-get-field
                                                                x11
                                                                0))
                                                          (cons #<000a>
                                                                x10)))))))
                                         (if (null? x12)
                                           (staticfail1032)
                                           (let ((g1062 (car x12)))
                                             (cond ((eq? g1062 #<000d>)
                                                    ((x3 (caml-constr-get-field
                                                           x11
                                                           1))
                                                     (cons #<0006>
                                                           ((x2 (caml-constr-get-field
                                                                  x11
                                                                  0))
                                                            (cons #<000b>
                                                                  (cdr x12))))))
                                                   (else (staticfail1032))))))))
                                    ((4)
                                     (if (is_return_151@back x10)
                                       (cons #a000
                                             ((x2 (caml-constr-get-field x11 0))
                                              x10))
                                       (let ((x12 (new_label_43@back #f)))
                                         (begin
                                           ((push_151@stack
                                              (caml-make-regular-2
                                                #f
                                                (caml-constr-get-field x11 0)
                                                x12))
                                            still_to_compile_141@back)
                                           (cons (caml-make-regular-1
                                                   #<000e>
                                                   x12)
                                                 x10)))))
                                    ((5)
                                     (let ((x12 (if (is_return_151@back x10)
                                                  x10
                                                  (cons (caml-make-regular-1
                                                          #<0009>
                                                          (list_length_112@list
                                                            (caml-constr-get-field
                                                              x11
                                                              0)))
                                                        x10))))
                                       (letrec ((x13 (lambda (x14)
                                                        (if (null? x14)
                                                          ((x2 (caml-constr-get-field
                                                                 x11
                                                                 1))
                                                           x12)
                                                          ((x2 (car x14))
                                                           (cons #<0008>
                                                                 (x13 (cdr x14))))))))
                                         (x13 (caml-constr-get-field x11 0)))))
                                    ((6)
                                     (labels
                                       ((staticfail1033
                                          ()
                                          (let ((x12 (list_length_112@list
                                                       (caml-constr-get-field
                                                         x11
                                                         0))))
                                            (let ((x13 (if (is_return_151@back
                                                             x10)
                                                         x10
                                                         (cons (caml-make-regular-1
                                                                 #<0009>
                                                                 x12)
                                                               x10))))
                                              (letrec ((x14 (lambda (x15)
                                                               (lambda (x16)
                                                                  (if (null? x16)
                                                                    ((x2 (caml-constr-get-field
                                                                           x11
                                                                           1))
                                                                     x13)
                                                                    ((x2 (caml-constr-get-field
                                                                           (car x16)
                                                                           0))
                                                                     (cons #<0006>
                                                                           (cons (caml-make-regular-1
                                                                                   #u0000
                                                                                   x15)
                                                                                 (cons '#(#a000
                                                                                          #<0011>)
                                                                                       ((x14 (-fx x15
                                                                                                  1))
                                                                                        (cdr x16)))))))))))
                                                (((list_it_96@list
                                                    (lambda (x15)
                                                       (lambda (x16)
                                                          (cons (caml-make-regular-1
                                                                  #<0011>
                                                                  (caml-make-regular-1
                                                                    #u0000
                                                                    (caml-constr-get-field
                                                                      x15
                                                                      1)))
                                                                (cons #<0008>
                                                                      x16)))))
                                                  (caml-constr-get-field x11 0))
                                                 ((x14 (-fx x12 1))
                                                  (caml-constr-get-field
                                                    x11
                                                    0))))))))
                                       (if (null? (caml-constr-get-field x11 0))
                                         (staticfail1033)
                                         (case (if (caml-constant-constr?
                                                     (caml-constr-get-field
                                                       (car (caml-constr-get-field
                                                              x11
                                                              0))
                                                       0))
                                                 -1
                                                 (caml-regular-constr-tag
                                                   (caml-constr-get-field
                                                     (car (caml-constr-get-field
                                                            x11
                                                            0))
                                                     0)))
                                           ((4)
                                            (if (null? (cdr (caml-constr-get-field
                                                              x11
                                                              0)))
                                              (let ((x12 (if (is_return_151@back
                                                               x10)
                                                           x10
                                                           (cons '#(1 #<0009>)
                                                                 x10))))
                                                (let ((x13 (new_label_43@back
                                                             #f)))
                                                  (begin
                                                    ((push_151@stack
                                                       (caml-make-regular-2
                                                         #f
                                                         (caml-constr-get-field
                                                           (caml-constr-get-field
                                                             (car (caml-constr-get-field
                                                                    x11
                                                                    0))
                                                             0)
                                                           0)
                                                         x13))
                                                     still_to_compile_141@back)
                                                    (cons (caml-make-regular-1
                                                            #<000f>
                                                            x13)
                                                          ((x2 (caml-constr-get-field
                                                                 x11
                                                                 1))
                                                           x12)))))
                                              (staticfail1033)))
                                           (else (staticfail1033))))))
                                    ((7)
                                     (labels
                                       ((staticfail1034
                                          ()
                                          ((x3 (caml-constr-get-field x11 1))
                                           (cons (caml-make-regular-1
                                                   #<0011>
                                                   (caml-constr-get-field
                                                     x11
                                                     0))
                                                 x10))))
                                       (let ((g1063 (caml-constr-get-field
                                                      x11
                                                      0)))
                                         (cond ((eq? g1063 #<000d>)
                                                (if (null? (caml-constr-get-field
                                                             x11
                                                             1))
                                                  (staticfail1034)
                                                  (if (null? (cdr (caml-constr-get-field
                                                                    x11
                                                                    1)))
                                                    (let ((x12 x10))
                                                      (labels
                                                        ((staticfail1035
                                                           ()
                                                           ((x2 (car (caml-constr-get-field
                                                                       x11
                                                                       1)))
                                                            (cons '#(#<000d>
                                                                     #<0011>)
                                                                  x10))))
                                                        (if (null? x12)
                                                          (staticfail1035)
                                                          (case (if (caml-constant-constr?
                                                                      (car x12))
                                                                  -1
                                                                  (caml-regular-constr-tag
                                                                    (car x12)))
                                                            ((22)
                                                             ((x2 (car (caml-constr-get-field
                                                                         x11
                                                                         1)))
                                                              (cons (caml-make-regular-1
                                                                      #<0017>
                                                                      (caml-constr-get-field
                                                                        (car x12)
                                                                        0))
                                                                    (cdr x12))))
                                                            ((23)
                                                             ((x2 (car (caml-constr-get-field
                                                                         x11
                                                                         1)))
                                                              (cons (caml-make-regular-1
                                                                      #<0016>
                                                                      (caml-constr-get-field
                                                                        (car x12)
                                                                        0))
                                                                    (cdr x12))))
                                                            (else
                                                             (staticfail1035))))))
                                                    (staticfail1034))))
                                               ((eq? g1063 #<000c>)
                                                ((x3 (caml-constr-get-field
                                                       x11
                                                       1))
                                                 (cons '#(#<000c> #<0011>)
                                                       (discard_dead_code_203@back
                                                         x10))))
                                               (else
                                                (case (if (caml-constant-constr?
                                                            g1063)
                                                        -1
                                                        (caml-regular-constr-tag
                                                          g1063))
                                                  ((2)
                                                   (if (null? (caml-constr-get-field
                                                                x11
                                                                1))
                                                     (cons (caml-make-regular-1
                                                             #t
                                                             (caml-constr-get-field
                                                               (caml-constr-get-field
                                                                 x11
                                                                 0)
                                                               0))
                                                           x10)
                                                     (staticfail1034)))
                                                  ((3)
                                                   (if (null? (caml-constr-get-field
                                                                x11
                                                                1))
                                                     (staticfail1034)
                                                     (if (null? (cdr (caml-constr-get-field
                                                                       x11
                                                                       1)))
                                                       ((x2 (car (caml-constr-get-field
                                                                   x11
                                                                   1)))
                                                        (cons (caml-make-regular-1
                                                                #unspecified
                                                                (caml-constr-get-field
                                                                  (caml-constr-get-field
                                                                    x11
                                                                    0)
                                                                  0))
                                                              x10))
                                                       (staticfail1034))))
                                                  ((7)
                                                   ((x3 (caml-constr-get-field
                                                          x11
                                                          1))
                                                    (cons (caml-make-regular-2
                                                            #<0010>
                                                            (caml-constr-get-field
                                                              (caml-constr-get-field
                                                                x11
                                                                0)
                                                              0)
                                                            (list_length_112@list
                                                              (caml-constr-get-field
                                                                x11
                                                                1)))
                                                          x10)))
                                                  ((6)
                                                   (let ((x12 x10))
                                                     (labels
                                                       ((staticfail1036
                                                          ()
                                                          ((x3 (caml-constr-get-field
                                                                 x11
                                                                 1))
                                                           (cons (caml-make-regular-1
                                                                   #<0011>
                                                                   (caml-constr-get-field
                                                                     x11
                                                                     0))
                                                                 x10))))
                                                       (if (null? x12)
                                                         (staticfail1036)
                                                         (case (if (caml-constant-constr?
                                                                     (car x12))
                                                                 -1
                                                                 (caml-regular-constr-tag
                                                                   (car x12)))
                                                           ((22)
                                                            ((x3 (caml-constr-get-field
                                                                   x11
                                                                   1))
                                                             (cons (caml-make-regular-2
                                                                     #<001a>
                                                                     (caml-constr-get-field
                                                                       (caml-constr-get-field
                                                                         x11
                                                                         0)
                                                                       0)
                                                                     (caml-constr-get-field
                                                                       (car x12)
                                                                       0))
                                                                   (cdr x12))))
                                                           ((23)
                                                            ((x3 (caml-constr-get-field
                                                                   x11
                                                                   1))
                                                             (cons (caml-make-regular-2
                                                                     #<001a>
                                                                     (invert_bool_test_95@back
                                                                       (caml-constr-get-field
                                                                         (caml-constr-get-field
                                                                           x11
                                                                           0)
                                                                         0))
                                                                     (caml-constr-get-field
                                                                       (car x12)
                                                                       0))
                                                                   (cdr x12))))
                                                           (else
                                                            (staticfail1036)))))))
                                                  (else (staticfail1034))))))))
                                    ((11)
                                     (labels
                                       ((staticfail1037
                                          ()
                                          (let ((x12 (make_branch_143@back x10))
                                                (x13 (new_label_43@back #f)))
                                            (3-162-compile_expr_212@back
                                              x13
                                              (caml-constr-get-field x11 0)
                                              (cons (caml-constr-get-field
                                                      x12
                                                      0)
                                                    (cons (caml-make-regular-1
                                                            #<0014>
                                                            x13)
                                                          ((x2 (caml-constr-get-field
                                                                 x11
                                                                 1))
                                                           (caml-constr-get-field
                                                             x12
                                                             1))))))))
                                       (let ((g1064 (caml-constr-get-field
                                                      x11
                                                      1)))
                                         (cond ((eq? g1064 #<000a>)
                                                ((x2 (caml-constr-get-field
                                                       x11
                                                       0))
                                                 x10))
                                               (else (staticfail1037))))))
                                    ((12)
                                     (let ((x12 (make_branch_143@back x10)))
                                       (let ((x13 (new_label_43@back #f)))
                                         (let ((x14 (if (is_return_151@back
                                                          (caml-constr-get-field
                                                            x12
                                                            1))
                                                      (caml-constr-get-field
                                                        x12
                                                        1)
                                                      (cons '#(1 #<0009>)
                                                            (caml-constr-get-field
                                                              x12
                                                              1)))))
                                           (cons (caml-make-regular-1
                                                   #<0012>
                                                   x13)
                                                 ((x2 (caml-constr-get-field
                                                        x11
                                                        0))
                                                  (cons #<0013>
                                                        (cons (caml-constr-get-field
                                                                x12
                                                                0)
                                                              (cons (caml-make-regular-1
                                                                      #<0014>
                                                                      x13)
                                                                    ((x2 (caml-constr-get-field
                                                                           x11
                                                                           1))
                                                                     x14))))))))))
                                    ((13)
                                     ((((x4 (caml-constr-get-field x11 0))
                                        (caml-constr-get-field x11 1))
                                       (caml-constr-get-field x11 2))
                                      x10))
                                    ((14)
                                     ((x2 (caml-constr-get-field x11 0))
                                      ((x2 (caml-constr-get-field x11 1)) x10)))
                                    ((15)
                                     (let ((x12 (new_label_43@back #f))
                                           (x13 (new_label_43@back #f)))
                                       (cons (caml-make-regular-1 #<0015> x12)
                                             (cons (caml-make-regular-1
                                                     #<0014>
                                                     x13)
                                                   (cons #<000c>
                                                         ((x2 (caml-constr-get-field
                                                                x11
                                                                1))
                                                          (cons (caml-make-regular-1
                                                                  #<0014>
                                                                  x12)
                                                                ((x2 (caml-constr-get-field
                                                                       x11
                                                                       0))
                                                                 (cons (caml-make-regular-1
                                                                         #<0016>
                                                                         x13)
                                                                       (cons (caml-make-regular-1
                                                                               #f
                                                                               const_unit_249@const)
                                                                             x10))))))))))
                                    ((16)
                                     (let ((x12 (new_label_43@back #f))
                                           (x13 (new_label_43@back #f)))
                                       ((x2 (caml-constr-get-field x11 0))
                                        (cons '#(#(#("ref" "ref" #f) 0 1 #t)
                                                 1
                                                 #<0010>)
                                              (cons #<0008>
                                                    ((x2 (caml-constr-get-field
                                                           x11
                                                           1))
                                                     (cons #<0008>
                                                           (cons (caml-make-regular-1
                                                                   #<0014>
                                                                   x13)
                                                                 (cons #<000c>
                                                                       (cons '#(1
                                                                                #u0000)
                                                                             (cons '#(#(0
                                                                                        #<0009>)
                                                                                      #<0011>)
                                                                                   (cons #<0006>
                                                                                         (cons '#(0
                                                                                                  #u0000)
                                                                                               (cons (caml-make-regular-2
                                                                                                       #<001a>
                                                                                                       (caml-make-regular-1
                                                                                                         #unspecified
                                                                                                         (if (caml-constr-get-field
                                                                                                               x11
                                                                                                               2)
                                                                                                           #u0000
                                                                                                           #<0006>))
                                                                                                       x12)
                                                                                                     ((x2 (caml-constr-get-field
                                                                                                            x11
                                                                                                            3))
                                                                                                      (cons '#(1
                                                                                                               #u0000)
                                                                                                            (cons (caml-make-regular-1
                                                                                                                    #<0011>
                                                                                                                    (if (caml-constr-get-field
                                                                                                                          x11
                                                                                                                          2)
                                                                                                                      #<001c>
                                                                                                                      #<001d>))
                                                                                                                  (cons (caml-make-regular-1
                                                                                                                          #<0015>
                                                                                                                          x13)
                                                                                                                        (cons (caml-make-regular-1
                                                                                                                                #<0014>
                                                                                                                                x12)
                                                                                                                              (cons '#(2
                                                                                                                                       #<0009>)
                                                                                                                                    (cons (caml-make-regular-1
                                                                                                                                            #f
                                                                                                                                            const_unit_249@const)
                                                                                                                                          x10)))))))))))))))))))))
                                    ((17)
                                     (let ((x12 x10))
                                       (labels
                                         ((staticfail1038
                                            ()
                                            (let ((x13 (new_label_43@back #f)))
                                              ((x2 (caml-constr-get-field
                                                     x11
                                                     0))
                                               (cons (caml-make-regular-1
                                                       #<0019>
                                                       x13)
                                                     ((x2 (caml-constr-get-field
                                                            x11
                                                            1))
                                                      (cons (caml-make-regular-1
                                                              #<0014>
                                                              x13)
                                                            x10)))))))
                                         (if (null? x12)
                                           (staticfail1038)
                                           (case (if (caml-constant-constr?
                                                       (car x12))
                                                   -1
                                                   (caml-regular-constr-tag
                                                     (car x12)))
                                             ((21)
                                              ((x2 (caml-constr-get-field
                                                     x11
                                                     0))
                                               (cons (caml-make-regular-1
                                                       #<0019>
                                                       (caml-constr-get-field
                                                         (car x12)
                                                         0))
                                                     ((x2 (caml-constr-get-field
                                                            x11
                                                            1))
                                                      x10))))
                                             ((23)
                                              ((x2 (caml-constr-get-field
                                                     x11
                                                     0))
                                               (cons (caml-make-regular-1
                                                       #<0017>
                                                       (caml-constr-get-field
                                                         (car x12)
                                                         0))
                                                     ((x2 (caml-constr-get-field
                                                            x11
                                                            1))
                                                      x10))))
                                             ((22)
                                              (let ((x13 (label_code_151@back
                                                           (cdr x12))))
                                                ((x2 (caml-constr-get-field
                                                       x11
                                                       0))
                                                 (cons (caml-make-regular-1
                                                         #<0017>
                                                         (caml-constr-get-field
                                                           x13
                                                           0))
                                                       ((x2 (caml-constr-get-field
                                                              x11
                                                              1))
                                                        (cons (caml-make-regular-1
                                                                #<0016>
                                                                (caml-constr-get-field
                                                                  (car x12)
                                                                  0))
                                                              (caml-constr-get-field
                                                                x13
                                                                1)))))))
                                             (else (staticfail1038)))))))
                                    ((18)
                                     (let ((x12 x10))
                                       (labels
                                         ((staticfail1039
                                            ()
                                            (let ((x13 (new_label_43@back #f)))
                                              ((x2 (caml-constr-get-field
                                                     x11
                                                     0))
                                               (cons (caml-make-regular-1
                                                       #<0018>
                                                       x13)
                                                     ((x2 (caml-constr-get-field
                                                            x11
                                                            1))
                                                      (cons (caml-make-regular-1
                                                              #<0014>
                                                              x13)
                                                            x10)))))))
                                         (if (null? x12)
                                           (staticfail1039)
                                           (case (if (caml-constant-constr?
                                                       (car x12))
                                                   -1
                                                   (caml-regular-constr-tag
                                                     (car x12)))
                                             ((21)
                                              ((x2 (caml-constr-get-field
                                                     x11
                                                     0))
                                               (cons (caml-make-regular-1
                                                       #<0018>
                                                       (caml-constr-get-field
                                                         (car x12)
                                                         0))
                                                     ((x2 (caml-constr-get-field
                                                            x11
                                                            1))
                                                      x10))))
                                             ((22)
                                              ((x2 (caml-constr-get-field
                                                     x11
                                                     0))
                                               (cons (caml-make-regular-1
                                                       #<0016>
                                                       (caml-constr-get-field
                                                         (car x12)
                                                         0))
                                                     ((x2 (caml-constr-get-field
                                                            x11
                                                            1))
                                                      x10))))
                                             ((23)
                                              (let ((x13 (label_code_151@back
                                                           (cdr x12))))
                                                ((x2 (caml-constr-get-field
                                                       x11
                                                       0))
                                                 (cons (caml-make-regular-1
                                                         #<0016>
                                                         (caml-constr-get-field
                                                           x13
                                                           0))
                                                       ((x2 (caml-constr-get-field
                                                              x11
                                                              1))
                                                        (cons (caml-make-regular-1
                                                                #<0017>
                                                                (caml-constr-get-field
                                                                  (car x12)
                                                                  0))
                                                              (caml-constr-get-field
                                                                x13
                                                                1)))))))
                                             (else (staticfail1039)))))))
                                    ((8)
                                     (let ((x12 (if (let ((x12 (caml-constr-get-field
                                                                 x11
                                                                 1)))
                                                      (labels
                                                        ((staticfail1040 () #f))
                                                        (if (null? x12)
                                                          (staticfail1040)
                                                          (case (if (caml-constant-constr?
                                                                      (caml-constr-get-field
                                                                        (car x12)
                                                                        0))
                                                                  -1
                                                                  (caml-regular-constr-tag
                                                                    (caml-constr-get-field
                                                                      (car x12)
                                                                      0)))
                                                            ((4 1) #t)
                                                            (else
                                                             (staticfail1040))))))
                                                  ((x7 (2-159-compile_nbranch_88@back
                                                         int_of_atom_37@const
                                                         (caml-constr-get-field
                                                           x11
                                                           1)))
                                                   x10)
                                                  ((x5 ((map_118@list
                                                          (lambda (x12)
                                                             (caml-make-regular-2
                                                               #f
                                                               (test_for_atom_74@back
                                                                 (caml-constr-get-field
                                                                   x12
                                                                   0))
                                                               (caml-constr-get-field
                                                                 x12
                                                                 1))))
                                                        (caml-constr-get-field
                                                          x11
                                                          1)))
                                                   x10))))
                                       ((x2 (caml-constr-get-field x11 0))
                                        x12)))
                                    ((9)
                                     (let ((x12 ((map_118@list
                                                   (lambda (x12)
                                                      (caml-make-regular-2
                                                        #f
                                                        (caml-constr-get-field
                                                          (caml-constr-get-field
                                                            (caml-constr-get-field
                                                              x12
                                                              0)
                                                            1)
                                                          3)
                                                        (caml-constr-get-field
                                                          x12
                                                          1))))
                                                 (caml-constr-get-field
                                                   x11
                                                   2))))
                                       (let ((x13 (caml-make-regular-3
                                                    #f
                                                    (caml-constr-get-field
                                                      x11
                                                      0)
                                                    (caml-constr-get-field
                                                      x11
                                                      1)
                                                    x12)))
                                         (labels
                                           ((staticfail1041
                                              ()
                                              (let ((x14 (if (switch_contains_extensibles_230@back
                                                               x12)
                                                           ((x5 ((map_118@list
                                                                   (lambda (x14)
                                                                      (caml-make-regular-2
                                                                        #f
                                                                        (caml-make-regular-1
                                                                          #<0006>
                                                                          (caml-constr-get-field
                                                                            x14
                                                                            0))
                                                                        (caml-constr-get-field
                                                                          x14
                                                                          1))))
                                                                 x12))
                                                            x10)
                                                           (if (>=fx (list_length_112@list
                                                                       x12)
                                                                     (-fx (caml-constr-get-field
                                                                            x13
                                                                            0)
                                                                          5))
                                                             (cons '#(#<0008>
                                                                      #<0011>)
                                                                   (((x8 (caml-constr-get-field
                                                                           x13
                                                                           0))
                                                                     x12)
                                                                    x10))
                                                             (cons '#(#<0008>
                                                                      #<0011>)
                                                                   ((x7 (2-159-compile_nbranch_88@back
                                                                          int_of_constr_tag_57@const
                                                                          x12))
                                                                    x10))))))
                                                ((x2 (caml-constr-get-field
                                                       x13
                                                       1))
                                                 x14))))
                                           (let ((g1065 (caml-constr-get-field
                                                          x13
                                                          0)))
                                             (cond ((=fx g1065 1)
                                                    (if (null? (caml-constr-get-field
                                                                 x13
                                                                 2))
                                                      (staticfail1041)
                                                      (case (if (caml-constant-constr?
                                                                  (caml-constr-get-field
                                                                    (car (caml-constr-get-field
                                                                           x13
                                                                           2))
                                                                    0))
                                                              -1
                                                              (caml-regular-constr-tag
                                                                (caml-constr-get-field
                                                                  (car (caml-constr-get-field
                                                                         x13
                                                                         2))
                                                                  0)))
                                                        ((2)
                                                         (if (null? (cdr (caml-constr-get-field
                                                                           x13
                                                                           2)))
                                                           ((x2 (caml-constr-get-field
                                                                  (car (caml-constr-get-field
                                                                         x13
                                                                         2))
                                                                  1))
                                                            x10)
                                                           (staticfail1041)))
                                                        (else
                                                         (staticfail1041)))))
                                                   ((=fx g1065 2)
                                                    (if (null? (caml-constr-get-field
                                                                 x13
                                                                 2))
                                                      (staticfail1041)
                                                      (case (if (caml-constant-constr?
                                                                  (caml-constr-get-field
                                                                    (car (caml-constr-get-field
                                                                           x13
                                                                           2))
                                                                    0))
                                                              -1
                                                              (caml-regular-constr-tag
                                                                (caml-constr-get-field
                                                                  (car (caml-constr-get-field
                                                                         x13
                                                                         2))
                                                                  0)))
                                                        ((2)
                                                         (let ((g1066 (caml-constr-get-field
                                                                        (caml-constr-get-field
                                                                          (car (caml-constr-get-field
                                                                                 x13
                                                                                 2))
                                                                          0)
                                                                        1)))
                                                           (cond ((=fx g1066 0)
                                                                  (if (null? (cdr (caml-constr-get-field
                                                                                    x13
                                                                                    2)))
                                                                    ((x2 (caml-constr-get-field
                                                                           x13
                                                                           1))
                                                                     (cons (caml-make-regular-1
                                                                             #<0016>
                                                                             x1)
                                                                           ((x2 (caml-constr-get-field
                                                                                  (car (caml-constr-get-field
                                                                                         x13
                                                                                         2))
                                                                                  1))
                                                                            x10)))
                                                                    (case (if (caml-constant-constr?
                                                                                (caml-constr-get-field
                                                                                  (car (cdr (caml-constr-get-field
                                                                                              x13
                                                                                              2)))
                                                                                  0))
                                                                            -1
                                                                            (caml-regular-constr-tag
                                                                              (caml-constr-get-field
                                                                                (car (cdr (caml-constr-get-field
                                                                                            x13
                                                                                            2)))
                                                                                0)))
                                                                      ((2)
                                                                       (let ((g1067 (caml-constr-get-field
                                                                                      (caml-constr-get-field
                                                                                        (car (cdr (caml-constr-get-field
                                                                                                    x13
                                                                                                    2)))
                                                                                        0)
                                                                                      1)))
                                                                         (cond ((=fx g1067
                                                                                     1)
                                                                                (if (null? (cdr (cdr (caml-constr-get-field
                                                                                                       x13
                                                                                                       2))))
                                                                                  ((((x4 (caml-constr-get-field
                                                                                           x13
                                                                                           1))
                                                                                     (caml-constr-get-field
                                                                                       (car (cdr (caml-constr-get-field
                                                                                                   x13
                                                                                                   2)))
                                                                                       1))
                                                                                    (caml-constr-get-field
                                                                                      (car (caml-constr-get-field
                                                                                             x13
                                                                                             2))
                                                                                      1))
                                                                                   x10)
                                                                                  (staticfail1041)))
                                                                               (else
                                                                                (staticfail1041)))))
                                                                      (else
                                                                       (staticfail1041)))))
                                                                 ((=fx g1066 1)
                                                                  (if (null? (cdr (caml-constr-get-field
                                                                                    x13
                                                                                    2)))
                                                                    ((x2 (caml-constr-get-field
                                                                           x13
                                                                           1))
                                                                     (cons (caml-make-regular-1
                                                                             #<0017>
                                                                             x1)
                                                                           ((x2 (caml-constr-get-field
                                                                                  (car (caml-constr-get-field
                                                                                         x13
                                                                                         2))
                                                                                  1))
                                                                            x10)))
                                                                    (case (if (caml-constant-constr?
                                                                                (caml-constr-get-field
                                                                                  (car (cdr (caml-constr-get-field
                                                                                              x13
                                                                                              2)))
                                                                                  0))
                                                                            -1
                                                                            (caml-regular-constr-tag
                                                                              (caml-constr-get-field
                                                                                (car (cdr (caml-constr-get-field
                                                                                            x13
                                                                                            2)))
                                                                                0)))
                                                                      ((2)
                                                                       (let ((g1068 (caml-constr-get-field
                                                                                      (caml-constr-get-field
                                                                                        (car (cdr (caml-constr-get-field
                                                                                                    x13
                                                                                                    2)))
                                                                                        0)
                                                                                      1)))
                                                                         (cond ((=fx g1068
                                                                                     0)
                                                                                (if (null? (cdr (cdr (caml-constr-get-field
                                                                                                       x13
                                                                                                       2))))
                                                                                  ((((x4 (caml-constr-get-field
                                                                                           x13
                                                                                           1))
                                                                                     (caml-constr-get-field
                                                                                       (car (caml-constr-get-field
                                                                                              x13
                                                                                              2))
                                                                                       1))
                                                                                    (caml-constr-get-field
                                                                                      (car (cdr (caml-constr-get-field
                                                                                                  x13
                                                                                                  2)))
                                                                                      1))
                                                                                   x10)
                                                                                  (staticfail1041)))
                                                                               (else
                                                                                (staticfail1041)))))
                                                                      (else
                                                                       (staticfail1041)))))
                                                                 (else
                                                                  (staticfail1041)))))
                                                        (else
                                                         (staticfail1041)))))
                                                   (else (staticfail1041))))))))
                                    (else
                                     (if (eq? (cell-ref
                                                (caml-constr-get-field x11 1))
                                              Nolabel_4@instruct)
                                       (let ((x12 (new_label_43@back #f)))
                                         (begin
                                           (cell-set!
                                             (caml-constr-get-field x11 1)
                                             x12)
                                           (cons (caml-make-regular-1
                                                   #<0014>
                                                   x12)
                                                 ((x2 (caml-constr-get-field
                                                        x11
                                                        0))
                                                  x10))))
                                       (cons (caml-make-regular-1
                                               #<0015>
                                               (cell-ref
                                                 (caml-constr-get-field x11 1)))
                                             (discard_dead_code_203@back
                                               x10))))))))))))
             (x3 (lambda (x9)
                    (lambda (x10)
                       (if (null? x9)
                         x10
                         (labels
                           ((staticfail1042
                              ()
                              ((x3 (cdr x9))
                               (cons #<0006> ((x2 (car x9)) x10)))))
                           (if (null? (cdr x9))
                             ((x2 (car x9)) x10)
                             (staticfail1042)))))))
             (x4 (lambda (x9)
                    (lambda (x10)
                       (lambda (x11)
                          (lambda (x12)
                             (let ((x13 (make_branch_143@back x12))
                                   (x14 (new_label_43@back #f)))
                               ((x2 x9)
                                (cons (caml-make-regular-1 #<0017> x14)
                                      ((x2 x10)
                                       (cons (caml-constr-get-field x13 0)
                                             (cons (caml-make-regular-1
                                                     #<0014>
                                                     x14)
                                                   ((x2 x11)
                                                    (caml-constr-get-field
                                                      x13
                                                      1)))))))))))))
             (x5 (lambda (x9)
                    (lambda (x10)
                       (let ((x11 (make_branch_143@back x10)))
                         (letrec ((x12 (lambda (x13)
                                          (if (null? x13)
                                            (fatal_error_193@misc "comp_tests")
                                            (labels
                                              ((staticfail1043
                                                 ()
                                                 (let ((x14 (new_label_43@back
                                                              #f)))
                                                   (cons (caml-make-regular-2
                                                           #<001a>
                                                           (caml-constr-get-field
                                                             (car x13)
                                                             0)
                                                           x14)
                                                         ((x2 (caml-constr-get-field
                                                                (car x13)
                                                                1))
                                                          (cons (caml-constr-get-field
                                                                  x11
                                                                  0)
                                                                (cons (caml-make-regular-1
                                                                        #<0014>
                                                                        x14)
                                                                      (x12 (cdr x13)))))))))
                                              (if (null? (cdr x13))
                                                (cons (caml-make-regular-2
                                                        #<001a>
                                                        (caml-constr-get-field
                                                          (car x13)
                                                          0)
                                                        x1)
                                                      ((x2 (caml-constr-get-field
                                                             (car x13)
                                                             1))
                                                       (caml-constr-get-field
                                                         x11
                                                         1)))
                                                (staticfail1043)))))))
                           (x12 x9))))))
             (x6 (lambda (x9)
                    (lambda (x10)
                       (lambda (x11)
                          (let ((x12 ((make_vect_185@vect
                                        (let ((g1069 x9))
                                          (if g1069 (vector-length g1069) 0)))
                                      x1)))
                            (letrec ((x13 (lambda (x14)
                                             (if (>=fx x14
                                                       (let ((g1070 x9))
                                                         (if g1070
                                                           (vector-length g1070)
                                                           0)))
                                               x11
                                               (let ((x15 (label_code_151@back
                                                            ((x2 ((vect_item_124@vect
                                                                    x9)
                                                                  x14))
                                                             (cons x10
                                                                   (x13 (+fx x14
                                                                             1)))))))
                                                 (begin
                                                   (((vect_assign_169@vect x12)
                                                     x14)
                                                    (caml-constr-get-field
                                                      x15
                                                      0))
                                                   (caml-constr-get-field
                                                     x15
                                                     1)))))))
                              (2-61-add_switchtable_226@back
                                x12
                                (discard_dead_code_203@back (x13 0)))))))))
             (x7 (lambda (x9)
                    (lambda (x10)
                       (let ((x11 (make_branch_143@back x10)))
                         (letrec ((x12 (lambda (x13)
                                          (lambda (x14)
                                             (let ((g1071 x13))
                                               (cond ((eq? g1071 #f)
                                                      (cons (caml-make-regular-1
                                                              #<0015>
                                                              x1)
                                                            (discard_dead_code_203@back
                                                              x14)))
                                                     (else
                                                      (let ((x15 (let ((x15 (caml-constr-get-field
                                                                              x13
                                                                              2)))
                                                                   (labels
                                                                     ((staticfail1044
                                                                        ()
                                                                        (label_code_151@back
                                                                          ((x12 (caml-constr-get-field
                                                                                  x13
                                                                                  2))
                                                                           x14))))
                                                                     (let ((g1072 x15))
                                                                       (cond ((eq? g1072
                                                                                   #f)
                                                                              (caml-make-regular-2
                                                                                #f
                                                                                x1
                                                                                x14))
                                                                             (else
                                                                              (staticfail1044))))))))
                                                        (let ((x16 (let ((x16 (caml-constr-get-field
                                                                                x13
                                                                                0)))
                                                                     (labels
                                                                       ((staticfail1045
                                                                          ()
                                                                          (label_code_151@back
                                                                            ((x12 (caml-constr-get-field
                                                                                    x13
                                                                                    0))
                                                                             (caml-constr-get-field
                                                                               x15
                                                                               1)))))
                                                                       (let ((g1073 x16))
                                                                         (cond ((eq? g1073
                                                                                     #f)
                                                                                (caml-make-regular-2
                                                                                  #f
                                                                                  x1
                                                                                  (caml-constr-get-field
                                                                                    x15
                                                                                    1)))
                                                                               (else
                                                                                (staticfail1045))))))))
                                                          (cons (caml-make-regular-4
                                                                  #<001b>
                                                                  (caml-constr-get-field
                                                                    (caml-constr-get-field
                                                                      x13
                                                                      1)
                                                                    0)
                                                                  (caml-constr-get-field
                                                                    (caml-constr-get-field
                                                                      x13
                                                                      1)
                                                                    2)
                                                                  (caml-constr-get-field
                                                                    x16
                                                                    0)
                                                                  (caml-constr-get-field
                                                                    x15
                                                                    0))
                                                                (let ((x17 (let ((g1074 (caml-constr-get-field
                                                                                          (caml-constr-get-field
                                                                                            x13
                                                                                            1)
                                                                                          1)))
                                                                             (if g1074
                                                                               (vector-length
                                                                                 g1074)
                                                                               0))))
                                                                  (labels
                                                                    ((staticfail1046
                                                                       ()
                                                                       (((x6 (caml-constr-get-field
                                                                               (caml-constr-get-field
                                                                                 x13
                                                                                 1)
                                                                               1))
                                                                         (caml-constr-get-field
                                                                           x11
                                                                           0))
                                                                        (caml-constr-get-field
                                                                          x16
                                                                          1))))
                                                                    (let ((g1075 x17))
                                                                      (cond ((=fx g1075
                                                                                  1)
                                                                             ((x2 ((vect_item_124@vect
                                                                                     (caml-constr-get-field
                                                                                       (caml-constr-get-field
                                                                                         x13
                                                                                         1)
                                                                                       1))
                                                                                   0))
                                                                              (cons (caml-constr-get-field
                                                                                      x11
                                                                                      0)
                                                                                    (caml-constr-get-field
                                                                                      x16
                                                                                      1))))
                                                                            (else
                                                                             (staticfail1046))))))))))))))))
                           ((x12 x9) (caml-constr-get-field x11 1)))))))
             (x8 (lambda (x9)
                    (lambda (x10)
                       (lambda (x11)
                          (let ((x12 (make_branch_143@back x11)))
                            (let ((x13 ((make_vect_185@vect x9) x1)))
                              (letrec ((x14 (lambda (x15)
                                               (if (null? x15)
                                                 (fatal_error_193@misc
                                                   "comp_switch")
                                                 (labels
                                                   ((staticfail1047
                                                      ()
                                                      (let ((x16 (label_code_151@back
                                                                   ((x2 (caml-constr-get-field
                                                                          (car x15)
                                                                          1))
                                                                    (cons (caml-constr-get-field
                                                                            x12
                                                                            0)
                                                                          (x14 (cdr x15)))))))
                                                        (begin
                                                          (((vect_assign_169@vect
                                                              x13)
                                                            (int_of_constr_tag_57@const
                                                              (caml-constr-get-field
                                                                (car x15)
                                                                0)))
                                                           (caml-constr-get-field
                                                             x16
                                                             0))
                                                          (caml-constr-get-field
                                                            x16
                                                            1)))))
                                                   (if (null? (cdr x15))
                                                     (let ((x16 (label_code_151@back
                                                                  ((x2 (caml-constr-get-field
                                                                         (car x15)
                                                                         1))
                                                                   (caml-constr-get-field
                                                                     x12
                                                                     1)))))
                                                       (begin
                                                         (((vect_assign_169@vect
                                                             x13)
                                                           (int_of_constr_tag_57@const
                                                             (caml-constr-get-field
                                                               (car x15)
                                                               0)))
                                                          (caml-constr-get-field
                                                            x16
                                                            0))
                                                         (caml-constr-get-field
                                                           x16
                                                           1)))
                                                     (staticfail1047)))))))
                                (2-61-add_switchtable_226@back
                                  x13
                                  (discard_dead_code_203@back
                                    (x14 x10)))))))))))
      ((x2 a1049) a1048)))
)

(define (compile_rest_230@back x1)
  (with-handler
    (lambda (x2)
       (labels
         ((staticfail1051 () (caml-raise x2)))
         (case (caml-extensible-constr-tag x2)
           ((Empty_1@stack) x1)
           (else (staticfail1051)))))
    (unwind-protect
      (begin
        (push-exception-handler)
        (let ((x2 (pop_15@stack still_to_compile_141@back)))
          (compile_rest_230@back
            (cons (caml-make-regular-1
                    #<0014>
                    (caml-constr-get-field x2 1))
                  (3-162-compile_expr_212@back
                    Nolabel_4@instruct
                    (caml-constr-get-field x2 0)
                    (cons #<000d> x1))))))
      (pop-exception-handler))))


(begin
  (define (compile_lambda_215@back x1)
    (lambda (x2)
       (2-140-compile_lambda_215@back x1 x2)))
 (define (2-140-compile_lambda_215@back x1 x2)
    (begin
      (clear_94@stack still_to_compile_141@back)
      (begin
        (reset_label_204@back #f)
        (let ((x3 (3-162-compile_expr_212@back
                    Nolabel_4@instruct
                    x2
                    '())))
          (let ((x4 (compile_rest_230@back '())))
            (caml-make-regular-3 #f x1 x3 x4))))))
)

