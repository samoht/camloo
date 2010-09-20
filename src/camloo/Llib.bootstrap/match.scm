;; Le module 
(module
  __caml_match
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_globals
    __caml_syntax
    __caml_location
    __caml_lambda
    __caml_prim
    __caml_instruct)
  (export
    (make_path_74@match x1)
    (2-119-make_path_74@match x1 x2)
    (add_to_match_79@match x1)
    (2-20-add_to_match_79@match x1 x2)
    (make_constant_match_131@match x1)
    (2-25-make_constant_match_131@match x1 x2)
    (make_tuple_match_146@match x1)
    (2-237-make_tuple_match_146@match x1 x2)
    (make_construct_match_34@match x1)
    (3-150-make_construct_match_34@match x1 x2 x3)
    (add_to_division_30@match x1)
    (4-90-add_to_division_30@match x1 x2 x3 x4)
    (simpl_casel_240@match x1)
    (divide_constant_matching_24@match x1)
    (divide_tuple_matching_163@match x1)
    (2-66-divide_tuple_matching_163@match x1 x2)
    (divide_construct_matching_84@match x1)
    (divide_var_matching_6@match x1)
    (divide_record_matching_66@match x1)
    (length_of_matching_177@match x1)
    upper_left_pattern_18@match
    (get_span_of_constr_170@match x1)
    (get_span_of_matching_253@match x1)
    (tristate_or_136@match x1)
    conquer_matching_248@match
    (make_initial_matching_65@match x1)
    (translate_matching_84@match x1)
    (3-10-translate_matching_84@match x1 x2 x3)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (make_path_74@match x1)
    (lambda (x2) (2-119-make_path_74@match x1 x2)))
 (define (2-119-make_path_74@match x1 x2)
    (labels
      ((staticfail1000
         ()
         (caml-raise
           '#("Mlib/match.ml"
              739
              869
              Match_failure_1@builtin
              ()))))
      (if (null? x2)
        (staticfail1000)
        (letrec ((x3 (lambda (x4)
                        (if (>=fx x4 x1)
                          (cdr x2)
                          (cons (caml-make-regular-2
                                  #<0007>
                                  (caml-make-regular-1 #<0009> x4)
                                  (cons (car x2) '()))
                                (x3 (+fx x4 1)))))))
          (x3 0)))))
)

(begin
  (begin
    (define (add_to_match_79@match x1)
      (lambda (x2) (2-20-add_to_match_79@match x1 x2)))
   (define (2-20-add_to_match_79@match x1 x2)
      (caml-make-regular-2
        #f
        (cons x2 (caml-constr-get-field x1 0))
        (caml-constr-get-field x1 1)))
)(begin
    (begin
      (define (make_constant_match_131@match x1)
        (lambda (x2)
           (2-25-make_constant_match_131@match x1 x2)))
     (define (2-25-make_constant_match_131@match x1 x2)
        (labels
          ((staticfail1001
             ()
             (fatal_error_193@misc "make_constant_match")))
          (if (null? x1)
            (staticfail1001)
            (caml-make-regular-2 #f (cons x2 '()) (cdr x1)))))
)  (begin
      (begin
        (define (make_tuple_match_146@match x1)
          (lambda (x2)
             (2-237-make_tuple_match_146@match x1 x2)))
       (define (2-237-make_tuple_match_146@match x1 x2)
          (caml-make-regular-2
            #f
            '()
            (2-119-make_path_74@match x1 x2)))
)    (begin
        (define (make_construct_match_34@match x1)
          (lambda (x2)
             (lambda (x3)
                (3-150-make_construct_match_34@match x1 x2 x3))))
       (define (3-150-make_construct_match_34@match x1 x2 x3)
          (labels
            ((staticfail1002
               ()
               (caml-raise
                 '#("Mlib/match.ml"
                    1158
                    1421
                    Match_failure_1@builtin
                    ()))))
            (if (null? x2)
              (staticfail1002)
              (let ((x4 (caml-constr-get-field
                          (caml-constr-get-field x1 1)
                          4)))
                (labels
                  ((staticfail1003
                     ()
                     (caml-make-regular-2
                       #f
                       (cons x3 '())
                       (cons (caml-make-regular-2
                               #<0007>
                               '#(0 #<0009>)
                               (cons (car x2) '()))
                             (cdr x2)))))
                  (let ((g1026 x4))
                    (cond ((eq? g1026 #f)
                           (caml-make-regular-2 #f (cons x3 '()) (cdr x2)))
                          (else
                           (case (if (caml-constant-constr? g1026)
                                   -1
                                   (caml-regular-constr-tag g1026))
                             ((3) (caml-make-regular-2 #f (cons x3 '()) x2))
                             (else (staticfail1003)))))))))))
))))

(begin
  (define (add_to_division_30@match x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4)
             (4-90-add_to_division_30@match x1 x2 x3 x4)))))
 (define (4-90-add_to_division_30@match x1 x2 x3 x4)
    (with-handler
      (lambda (x5)
         (labels
           ((staticfail1005 () (caml-raise x5)))
           (case (caml-extensible-constr-tag x5)
             ((Not_found_4@exc)
              (cons (caml-make-regular-2 #f x3 (make-cell (x1 x4)))
                    x2))
             (else (staticfail1005)))))
      (unwind-protect
        (begin
          (push-exception-handler)
          (let ((x5 ((assoc_252@list x3) x2)))
            (begin
              (cell-set!
                x5
                (2-20-add_to_match_79@match (cell-ref x5) x4))
              x2)))
        (pop-exception-handler))))
)

(define (simpl_casel_240@match x1)
  (labels
    ((staticfail1006 () x1))
    (if (null? x1)
      (staticfail1006)
      (if (null? (caml-constr-get-field (car x1) 0))
        (staticfail1006)
        (case (if (caml-constant-constr?
                    (caml-constr-get-field
                      (car (caml-constr-get-field (car x1) 0))
                      0))
                -1
                (caml-regular-constr-tag
                  (caml-constr-get-field
                    (car (caml-constr-get-field (car x1) 0))
                    0)))
          ((9 3)
           (simpl_casel_240@match
             (cons (caml-make-regular-2
                     #f
                     (cons (caml-constr-get-field
                             (caml-constr-get-field
                               (car (caml-constr-get-field (car x1) 0))
                               0)
                             0)
                           (cdr (caml-constr-get-field (car x1) 0)))
                     (caml-constr-get-field (car x1) 1))
                   (cdr x1))))
          ((8)
           (simpl_casel_240@match
             (cons (caml-make-regular-2
                     #f
                     (cons (caml-constr-get-field
                             (caml-constr-get-field
                               (car (caml-constr-get-field (car x1) 0))
                               0)
                             0)
                           (cdr (caml-constr-get-field (car x1) 0)))
                     (caml-constr-get-field (car x1) 1))
                   (cons (caml-make-regular-2
                           #f
                           (cons (caml-constr-get-field
                                   (caml-constr-get-field
                                     (car (caml-constr-get-field (car x1) 0))
                                     0)
                                   1)
                                 (cdr (caml-constr-get-field (car x1) 0)))
                           (caml-constr-get-field (car x1) 1))
                         (cdr x1)))))
          (else (staticfail1006)))))))


(define (divide_constant_matching_24@match x1)
  (letrec ((x2 (lambda (x3)
                  (let ((x4 (simpl_casel_240@match x3)))
                    (labels
                      ((staticfail1007
                         ()
                         (caml-make-regular-2
                           #f
                           '()
                           (caml-make-regular-2
                             #f
                             x4
                             (caml-constr-get-field x1 1)))))
                      (if (null? x4)
                        (staticfail1007)
                        (if (null? (caml-constr-get-field (car x4) 0))
                          (staticfail1007)
                          (case (if (caml-constant-constr?
                                      (caml-constr-get-field
                                        (car (caml-constr-get-field (car x4) 0))
                                        0))
                                  -1
                                  (caml-regular-constr-tag
                                    (caml-constr-get-field
                                      (car (caml-constr-get-field (car x4) 0))
                                      0)))
                            ((4)
                             (let ((x5 (x2 (cdr x4))))
                               (caml-make-regular-2
                                 #f
                                 (4-90-add_to_division_30@match
                                   (make_constant_match_131@match
                                     (caml-constr-get-field x1 1))
                                   (caml-constr-get-field x5 0)
                                   (caml-constr-get-field
                                     (caml-constr-get-field
                                       (car (caml-constr-get-field (car x4) 0))
                                       0)
                                     0)
                                   (caml-make-regular-2
                                     #f
                                     (cdr (caml-constr-get-field (car x4) 0))
                                     (caml-constr-get-field (car x4) 1)))
                                 (caml-constr-get-field x5 1))))
                            (else (staticfail1007))))))))))
    (x2 (caml-constr-get-field x1 0))))


(begin
  (define (divide_tuple_matching_163@match x1)
    (lambda (x2)
       (2-66-divide_tuple_matching_163@match x1 x2)))
 (define (2-66-divide_tuple_matching_163@match x1 x2)
    (letrec ((x3 (lambda (x4)
                    (let ((x5 (simpl_casel_240@match x4)))
                      (labels
                        ((staticfail1008
                           ()
                           (fatal_error_193@misc "divide_tuple_matching")))
                        (if (null? x5)
                          (2-237-make_tuple_match_146@match
                            x1
                            (caml-constr-get-field x2 1))
                          (if (null? (caml-constr-get-field (car x5) 0))
                            (staticfail1008)
                            (let ((g1027 (caml-constr-get-field
                                           (car (caml-constr-get-field
                                                  (car x5)
                                                  0))
                                           0)))
                              (cond ((eq? g1027 #f)
                                     (letrec ((x6 (lambda (x7)
                                                     (if (>=fx x7 x1)
                                                       '()
                                                       (cons (caml-make-regular-2
                                                               #f
                                                               #f
                                                               no_location_97@location)
                                                             (x6 (+fx x7
                                                                      1)))))))
                                       (2-20-add_to_match_79@match
                                         (x3 (cdr x5))
                                         (caml-make-regular-2
                                           #f
                                           ((@_176@list (x6 0))
                                            (cdr (caml-constr-get-field
                                                   (car x5)
                                                   0)))
                                           (caml-constr-get-field
                                             (car x5)
                                             1)))))
                                    (else
                                     (case (if (caml-constant-constr? g1027)
                                             -1
                                             (caml-regular-constr-tag g1027))
                                       ((5)
                                        (2-20-add_to_match_79@match
                                          (x3 (cdr x5))
                                          (caml-make-regular-2
                                            #f
                                            ((@_176@list
                                               (caml-constr-get-field
                                                 (caml-constr-get-field
                                                   (car (caml-constr-get-field
                                                          (car x5)
                                                          0))
                                                   0)
                                                 0))
                                             (cdr (caml-constr-get-field
                                                    (car x5)
                                                    0)))
                                            (caml-constr-get-field
                                              (car x5)
                                              1))))
                                       ((2)
                                        (letrec ((x6 (lambda (x7)
                                                        (if (>=fx x7 x1)
                                                          '()
                                                          (cons (caml-make-regular-2
                                                                  #f
                                                                  #f
                                                                  no_location_97@location)
                                                                (x6 (+fx x7
                                                                         1)))))))
                                          (2-20-add_to_match_79@match
                                            (x3 (cdr x5))
                                            (caml-make-regular-2
                                              #f
                                              ((@_176@list (x6 0))
                                               (cdr (caml-constr-get-field
                                                      (car x5)
                                                      0)))
                                              (caml-constr-get-field
                                                (car x5)
                                                1)))))
                                       (else (staticfail1008)))))))))))))
      (x3 (caml-constr-get-field x2 0))))
)

(define (divide_construct_matching_84@match x1)
  (letrec ((x2 (lambda (x3)
                  (let ((x4 (simpl_casel_240@match x3)))
                    (labels
                      ((staticfail1009
                         ()
                         (caml-make-regular-2
                           #f
                           '()
                           (caml-make-regular-2
                             #f
                             x4
                             (caml-constr-get-field x1 1)))))
                      (if (null? x4)
                        (staticfail1009)
                        (if (null? (caml-constr-get-field (car x4) 0))
                          (staticfail1009)
                          (case (if (caml-constant-constr?
                                      (caml-constr-get-field
                                        (car (caml-constr-get-field (car x4) 0))
                                        0))
                                  -1
                                  (caml-regular-constr-tag
                                    (caml-constr-get-field
                                      (car (caml-constr-get-field (car x4) 0))
                                      0)))
                            ((6)
                             (let ((x5 (x2 (cdr x4))))
                               (caml-make-regular-2
                                 #f
                                 (4-90-add_to_division_30@match
                                   ((make_construct_match_34@match
                                      (caml-constr-get-field
                                        (caml-constr-get-field
                                          (car (caml-constr-get-field
                                                 (car x4)
                                                 0))
                                          0)
                                        0))
                                    (caml-constr-get-field x1 1))
                                   (caml-constr-get-field x5 0)
                                   (caml-constr-get-field
                                     (caml-constr-get-field
                                       (car (caml-constr-get-field (car x4) 0))
                                       0)
                                     0)
                                   (caml-make-regular-2
                                     #f
                                     (cdr (caml-constr-get-field (car x4) 0))
                                     (caml-constr-get-field (car x4) 1)))
                                 (caml-constr-get-field x5 1))))
                            ((7)
                             (let ((x5 (let ((x5 (caml-constr-get-field
                                                   (caml-constr-get-field
                                                     (caml-constr-get-field
                                                       (caml-constr-get-field
                                                         (car (caml-constr-get-field
                                                                (car x4)
                                                                0))
                                                         0)
                                                       0)
                                                     1)
                                                   4)))
                                         (labels
                                           ((staticfail1010
                                              ()
                                              (cons (caml-constr-get-field
                                                      (caml-constr-get-field
                                                        (car (caml-constr-get-field
                                                               (car x4)
                                                               0))
                                                        0)
                                                      1)
                                                    (cdr (caml-constr-get-field
                                                           (car x4)
                                                           0)))))
                                           (let ((g1028 x5))
                                             (cond ((eq? g1028 #f)
                                                    (cdr (caml-constr-get-field
                                                           (car x4)
                                                           0)))
                                                   (else (staticfail1010))))))))
                               (let ((x6 (x2 (cdr x4))))
                                 (caml-make-regular-2
                                   #f
                                   (4-90-add_to_division_30@match
                                     ((make_construct_match_34@match
                                        (caml-constr-get-field
                                          (caml-constr-get-field
                                            (car (caml-constr-get-field
                                                   (car x4)
                                                   0))
                                            0)
                                          0))
                                      (caml-constr-get-field x1 1))
                                     (caml-constr-get-field x6 0)
                                     (caml-constr-get-field
                                       (caml-constr-get-field
                                         (car (caml-constr-get-field
                                                (car x4)
                                                0))
                                         0)
                                       0)
                                     (caml-make-regular-2
                                       #f
                                       x5
                                       (caml-constr-get-field (car x4) 1)))
                                   (caml-constr-get-field x6 1)))))
                            (else (staticfail1009))))))))))
    (x2 (caml-constr-get-field x1 0))))


(define (divide_var_matching_6@match x1)
  (labels
    ((staticfail1011
       ()
       (caml-raise
         '#("Mlib/match.ml"
            4055
            4443
            Match_failure_1@builtin
            ()))))
    (if (null? (caml-constr-get-field x1 1))
      (staticfail1011)
      (letrec ((x2 (lambda (x3)
                      (let ((x4 (simpl_casel_240@match x3)))
                        (labels
                          ((staticfail1012
                             ()
                             (caml-make-regular-2
                               #f
                               (caml-make-regular-2
                                 #f
                                 '()
                                 (cdr (caml-constr-get-field x1 1)))
                               (caml-make-regular-2
                                 #f
                                 x4
                                 (caml-constr-get-field x1 1)))))
                          (if (null? x4)
                            (staticfail1012)
                            (if (null? (caml-constr-get-field (car x4) 0))
                              (staticfail1012)
                              (let ((g1029 (caml-constr-get-field
                                             (car (caml-constr-get-field
                                                    (car x4)
                                                    0))
                                             0)))
                                (cond ((eq? g1029 #f)
                                       (let ((x5 (x2 (cdr x4))))
                                         (caml-make-regular-2
                                           #f
                                           (2-20-add_to_match_79@match
                                             (caml-constr-get-field x5 0)
                                             (caml-make-regular-2
                                               #f
                                               (cdr (caml-constr-get-field
                                                      (car x4)
                                                      0))
                                               (caml-constr-get-field
                                                 (car x4)
                                                 1)))
                                           (caml-constr-get-field x5 1))))
                                      (else
                                       (case (if (caml-constant-constr? g1029)
                                               -1
                                               (caml-regular-constr-tag g1029))
                                         ((2)
                                          (let ((x5 (x2 (cdr x4))))
                                            (caml-make-regular-2
                                              #f
                                              (2-20-add_to_match_79@match
                                                (caml-constr-get-field x5 0)
                                                (caml-make-regular-2
                                                  #f
                                                  (cdr (caml-constr-get-field
                                                         (car x4)
                                                         0))
                                                  (caml-constr-get-field
                                                    (car x4)
                                                    1)))
                                              (caml-constr-get-field x5 1))))
                                         (else (staticfail1012)))))))))))))
        (x2 (caml-constr-get-field x1 0))))))


(define (divide_record_matching_66@match x1)
  (let ((x2 0))
    (letrec ((x3 (lambda (x4)
                    (labels
                      ((staticfail1013 () #f))
                      (case (if (caml-constant-constr?
                                  (caml-constr-get-field x4 0))
                              -1
                              (caml-regular-constr-tag
                                (caml-constr-get-field x4 0)))
                        ((9 3)
                         (x3 (caml-constr-get-field
                               (caml-constr-get-field x4 0)
                               0)))
                        ((8)
                         (begin
                           (x3 (caml-constr-get-field
                                 (caml-constr-get-field x4 0)
                                 0))
                           (x3 (caml-constr-get-field
                                 (caml-constr-get-field x4 0)
                                 1))))
                        ((10)
                         ((do_list_18@list
                            (lambda (x5)
                               (if (>fx (caml-constr-get-field
                                          (caml-constr-get-field
                                            (caml-constr-get-field x5 0)
                                            1)
                                          3)
                                        x2)
                                 (begin
                                   (set! x2
                                     (caml-constr-get-field
                                       (caml-constr-get-field
                                         (caml-constr-get-field x5 0)
                                         1)
                                       3))
                                   #f)
                                 #f)))
                          (caml-constr-get-field
                            (caml-constr-get-field x4 0)
                            0)))
                        (else (staticfail1013)))))))
      (begin
        ((do_list_18@list
           (lambda (x4)
              (labels
                ((staticfail1014
                   ()
                   (fatal_error_193@misc "divide_record_matching")))
                (if (null? (caml-constr-get-field x4 0))
                  (staticfail1014)
                  (x3 (car (caml-constr-get-field x4 0)))))))
         (caml-constr-get-field x1 0))
        (letrec ((x4 (lambda (x6)
                        (labels
                          ((staticfail1015
                             ()
                             (fatal_error_193@misc "divide_record_matching")))
                          (if (null? x6)
                            (caml-make-regular-2
                              #f
                              '()
                              (2-119-make_path_74@match
                                (+fx x2 1)
                                (caml-constr-get-field x1 1)))
                            (if (null? (caml-constr-get-field (car x6) 0))
                              (staticfail1015)
                              (let ((g1030 (caml-constr-get-field
                                             (car (caml-constr-get-field
                                                    (car x6)
                                                    0))
                                             0)))
                                (cond ((eq? g1030 #f)
                                       ((((x5 '())
                                          (cdr (caml-constr-get-field
                                                 (car x6)
                                                 0)))
                                         (caml-constr-get-field (car x6) 1))
                                        (cdr x6)))
                                      (else
                                       (case (if (caml-constant-constr? g1030)
                                               -1
                                               (caml-regular-constr-tag g1030))
                                         ((9 3)
                                          (x4 (cons (caml-make-regular-2
                                                      #f
                                                      (cons (caml-constr-get-field
                                                              (caml-constr-get-field
                                                                (car (caml-constr-get-field
                                                                       (car x6)
                                                                       0))
                                                                0)
                                                              0)
                                                            (cdr (caml-constr-get-field
                                                                   (car x6)
                                                                   0)))
                                                      (caml-constr-get-field
                                                        (car x6)
                                                        1))
                                                    (cdr x6))))
                                         ((8)
                                          (x4 (cons (caml-make-regular-2
                                                      #f
                                                      (cons (caml-constr-get-field
                                                              (caml-constr-get-field
                                                                (car (caml-constr-get-field
                                                                       (car x6)
                                                                       0))
                                                                0)
                                                              0)
                                                            (cdr (caml-constr-get-field
                                                                   (car x6)
                                                                   0)))
                                                      (caml-constr-get-field
                                                        (car x6)
                                                        1))
                                                    (cons (caml-make-regular-2
                                                            #f
                                                            (cons (caml-constr-get-field
                                                                    (caml-constr-get-field
                                                                      (car (caml-constr-get-field
                                                                             (car x6)
                                                                             0))
                                                                      0)
                                                                    1)
                                                                  (cdr (caml-constr-get-field
                                                                         (car x6)
                                                                         0)))
                                                            (caml-constr-get-field
                                                              (car x6)
                                                              1))
                                                          (cdr x6)))))
                                         ((10)
                                          ((((x5 (caml-constr-get-field
                                                   (caml-constr-get-field
                                                     (car (caml-constr-get-field
                                                            (car x6)
                                                            0))
                                                     0)
                                                   0))
                                             (cdr (caml-constr-get-field
                                                    (car x6)
                                                    0)))
                                            (caml-constr-get-field (car x6) 1))
                                           (cdr x6)))
                                         ((2)
                                          ((((x5 '())
                                             (cdr (caml-constr-get-field
                                                    (car x6)
                                                    0)))
                                            (caml-constr-get-field (car x6) 1))
                                           (cdr x6)))
                                         (else (staticfail1015)))))))))))
                 (x5 (lambda (x6)
                        (lambda (x7)
                           (lambda (x8)
                              (lambda (x9)
                                 (let ((x10 ((make_vect_185@vect (+fx x2 1))
                                             (caml-make-regular-2
                                               #f
                                               #f
                                               no_location_97@location))))
                                   (begin
                                     ((do_list_18@list
                                        (lambda (x11)
                                           (((vect_assign_169@vect x10)
                                             (caml-constr-get-field
                                               (caml-constr-get-field
                                                 (caml-constr-get-field x11 0)
                                                 1)
                                               3))
                                            (caml-constr-get-field x11 1))))
                                      x6)
                                     (2-20-add_to_match_79@match
                                       (x4 x9)
                                       (caml-make-regular-2
                                         #f
                                         ((@_176@list (list_of_vect_3@vect x10))
                                          x7)
                                         x8))))))))))
          (x4 (caml-constr-get-field x1 0)))))))


(define (length_of_matching_177@match x1)
  (list_length_112@list
    (caml-constr-get-field x1 0)))


(define upper_left_pattern_18@match
  (letrec ((x1 (lambda (x2)
                  (labels
                    ((staticfail1016 () x2))
                    (case (if (caml-constant-constr?
                                (caml-constr-get-field x2 0))
                            -1
                            (caml-regular-constr-tag
                              (caml-constr-get-field x2 0)))
                      ((8 9 3)
                       (x1 (caml-constr-get-field
                             (caml-constr-get-field x2 0)
                             0)))
                      (else (staticfail1016)))))))
    (lambda (x2)
       (labels
         ((staticfail1017
            ()
            (fatal_error_193@misc "upper_left_pattern")))
         (if (null? (caml-constr-get-field x2 0))
           (staticfail1017)
           (if (null? (caml-constr-get-field
                        (car (caml-constr-get-field x2 0))
                        0))
             (staticfail1017)
             (x1 (car (caml-constr-get-field
                        (car (caml-constr-get-field x2 0))
                        0)))))))))


(define (get_span_of_constr_170@match x1)
  (let ((x2 (caml-constr-get-field
              (caml-constr-get-field x1 1)
              3)))
    (case (caml-regular-constr-tag x2)
      ((1) 0)
      (else (caml-constr-get-field x2 2)))))


(define (get_span_of_matching_253@match x1)
  (let ((x2 (upper_left_pattern_18@match x1)))
    (labels
      ((staticfail1018
         ()
         (fatal_error_193@misc "get_span_of_matching")))
      (case (if (caml-constant-constr?
                  (caml-constr-get-field x2 0))
              -1
              (caml-regular-constr-tag
                (caml-constr-get-field x2 0)))
        ((7 6)
         (get_span_of_constr_170@match
           (caml-constr-get-field
             (caml-constr-get-field x2 0)
             0)))
        (else (staticfail1018))))))


(define (tristate_or_136@match x1)
  (labels
    ((staticfail1019
       ()
       (labels
         ((staticfail1020
            ()
            (labels
              ((staticfail1021 () #t))
              (let ((g1031 (caml-constr-get-field x1 0)))
                (cond ((eq? g1031 #f)
                       (let ((g1032 (caml-constr-get-field x1 1)))
                         (cond ((eq? g1032 #f) #f)
                               (else (staticfail1021)))))
                      (else (staticfail1021)))))))
         (let ((g1033 (caml-constr-get-field x1 1)))
           (cond ((eq? g1033 #unspecified) #unspecified)
                 (else (staticfail1020)))))))
    (let ((g1034 (caml-constr-get-field x1 0)))
      (cond ((eq? g1034 #unspecified) #unspecified)
            (else (staticfail1019))))))


(begin
  (define conquer_matching_248@match (unspecified))
  (set! conquer_matching_248@match
    (letrec ((x1 (lambda (x2)
                    (if (null? x2)
                      '#(() #f () #f)
                      (let ((x3 (conquer_matching_248@match
                                  (cell-ref
                                    (caml-constr-get-field (car x2) 1))))
                            (x4 (x1 (cdr x2))))
                        (caml-make-regular-3
                          #f
                          (cons (caml-make-regular-2
                                  #f
                                  (caml-constr-get-field (car x2) 0)
                                  (caml-constr-get-field x3 0))
                                (caml-constr-get-field x4 0))
                          (tristate_or_136@match
                            (caml-make-regular-2
                              #f
                              (caml-constr-get-field x3 1)
                              (caml-constr-get-field x4 1)))
                          ((@_176@list (caml-constr-get-field x3 2))
                           (caml-constr-get-field x4 2))))))))
      (lambda (x2)
         (labels
           ((staticfail1022
              ()
              (fatal_error_193@misc "conquer_matching 1")))
           (labels
             ((staticfail1023
                ()
                (if (null? (caml-constr-get-field x2 1))
                  (staticfail1022)
                  (let ((x3 (upper_left_pattern_18@match x2)))
                    (labels
                      ((staticfail1024
                         ()
                         (fatal_error_193@misc "conquer_matching 2")))
                      (let ((g1035 (caml-constr-get-field x3 0)))
                        (cond ((eq? g1035 #f)
                               (let ((x4 (divide_var_matching_6@match x2)))
                                 (let ((x5 (conquer_matching_248@match
                                             (caml-constr-get-field x4 0)))
                                       (x6 (conquer_matching_248@match
                                             (caml-constr-get-field x4 1))))
                                   (if (eq? (caml-constr-get-field x5 1) #f)
                                     (caml-make-regular-3
                                       #f
                                       (caml-constr-get-field x5 0)
                                       #f
                                       (caml-constr-get-field x5 2))
                                     (caml-make-regular-3
                                       #f
                                       (caml-make-regular-2
                                         #<000b>
                                         (caml-constr-get-field x5 0)
                                         (caml-constr-get-field x6 0))
                                       (if (eq? (caml-constr-get-field x6 1) #f)
                                         #f
                                         #t)
                                       ((@_176@list
                                          (caml-constr-get-field x5 2))
                                        (caml-constr-get-field x6 2)))))))
                              (else
                               (case (if (caml-constant-constr? g1035)
                                       -1
                                       (caml-regular-constr-tag g1035))
                                 ((2)
                                  (let ((x4 (divide_var_matching_6@match x2)))
                                    (let ((x5 (conquer_matching_248@match
                                                (caml-constr-get-field x4 0)))
                                          (x6 (conquer_matching_248@match
                                                (caml-constr-get-field x4 1))))
                                      (if (eq? (caml-constr-get-field x5 1) #f)
                                        (caml-make-regular-3
                                          #f
                                          (caml-constr-get-field x5 0)
                                          #f
                                          (caml-constr-get-field x5 2))
                                        (caml-make-regular-3
                                          #f
                                          (caml-make-regular-2
                                            #<000b>
                                            (caml-constr-get-field x5 0)
                                            (caml-constr-get-field x6 0))
                                          (if (eq? (caml-constr-get-field x6 1)
                                                   #f)
                                            #f
                                            #t)
                                          ((@_176@list
                                             (caml-constr-get-field x5 2))
                                           (caml-constr-get-field x6 2)))))))
                                 ((5)
                                  (conquer_matching_248@match
                                    (2-66-divide_tuple_matching_163@match
                                      (list_length_112@list
                                        (caml-constr-get-field
                                          (caml-constr-get-field x3 0)
                                          0))
                                      x2)))
                                 ((7 6)
                                  (let ((x4 (divide_construct_matching_84@match
                                              x2)))
                                    (let ((x5 (x1 (caml-constr-get-field x4 0)))
                                          (x6 (conquer_matching_248@match
                                                (caml-constr-get-field x4 1))))
                                      (let ((x7 (get_span_of_matching_253@match
                                                  x2))
                                            (x8 (list_length_112@list
                                                  (caml-constr-get-field
                                                    x4
                                                    0))))
                                        (if (and (eq? x8 x7)
                                                 (eq? (caml-constr-get-field
                                                        x5
                                                        1)
                                                      #f))
                                          (caml-make-regular-3
                                            #f
                                            (caml-make-regular-3
                                              #<0009>
                                              x7
                                              (car (caml-constr-get-field x2 1))
                                              (caml-constr-get-field x5 0))
                                            #f
                                            (caml-constr-get-field x5 2))
                                          (caml-make-regular-3
                                            #f
                                            (caml-make-regular-2
                                              #<000b>
                                              (caml-make-regular-3
                                                #<0009>
                                                x7
                                                (car (caml-constr-get-field
                                                       x2
                                                       1))
                                                (caml-constr-get-field x5 0))
                                              (caml-constr-get-field x6 0))
                                            (if (eq? (caml-constr-get-field
                                                       x6
                                                       1)
                                                     #f)
                                              #f
                                              (if (and (<fx x8 x7)
                                                       (eq? (caml-constr-get-field
                                                              x6
                                                              1)
                                                            #unspecified))
                                                #unspecified
                                                #t))
                                            ((@_176@list
                                               (caml-constr-get-field x5 2))
                                             (caml-constr-get-field x6 2))))))))
                                 ((4)
                                  (let ((x4 (divide_constant_matching_24@match
                                              x2)))
                                    (let ((x5 (x1 (caml-constr-get-field x4 0)))
                                          (x6 (conquer_matching_248@match
                                                (caml-constr-get-field x4 1))))
                                      (caml-make-regular-3
                                        #f
                                        (caml-make-regular-2
                                          #<000b>
                                          (caml-make-regular-2
                                            #<0008>
                                            (car (caml-constr-get-field x2 1))
                                            (caml-constr-get-field x5 0))
                                          (caml-constr-get-field x6 0))
                                        (caml-constr-get-field x6 1)
                                        ((@_176@list
                                           (caml-constr-get-field x5 2))
                                         (caml-constr-get-field x6 2))))))
                                 ((10)
                                  (conquer_matching_248@match
                                    (divide_record_matching_66@match x2)))
                                 (else (staticfail1024)))))))))))
             (if (null? (caml-constr-get-field x2 0))
               '#(#<000a> #unspecified () #f)
               (if (null? (caml-constr-get-field
                            (car (caml-constr-get-field x2 0))
                            0))
                 (caml-make-regular-3
                   #f
                   (caml-constr-get-field
                     (car (caml-constr-get-field x2 0))
                     1)
                   #f
                   (cons (caml-constr-get-field
                           (car (caml-constr-get-field x2 0))
                           1)
                         '()))
                 (staticfail1023)))))))))

(define (make_initial_matching_65@match x1)
  (if (null? x1)
    (fatal_error_193@misc
      "make_initial_matching: empty")
    (letrec ((x2 (lambda (x3)
                    (if (<=fx x3 0)
                      '()
                      (cons (caml-make-regular-1 #f (-fx x3 1))
                            (x2 (-fx x3 1)))))))
      (caml-make-regular-2
        #f
        x1
        (x2 (list_length_112@list
              (caml-constr-get-field (car x1) 0)))))))


(begin
  (define (translate_matching_84@match x1)
    (lambda (x2)
       (lambda (x3)
          (3-10-translate_matching_84@match x1 x2 x3))))
 (define (3-10-translate_matching_84@match x1 x2 x3)
    (let ((x4 ((map_118@list
                 (lambda (x4)
                    (caml-make-regular-2
                      #f
                      (caml-constr-get-field x4 0)
                      (share_lambda_40@lambda
                        (caml-constr-get-field x4 1)))))
               x3)))
      (let ((x5 (conquer_matching_248@match
                  (make_initial_matching_65@match x4))))
        (begin
          (if (not ((for_all_96@list
                      (lambda (x6)
                         ((memq_162@list (caml-constr-get-field x6 1))
                          (caml-constr-get-field x5 2))))
                    x4))
            (begin
              (prerr_location_1@location x2)
              (begin
                (prerr_begline_213@misc
                  " Warning: some cases are unused in this matching.")
                (prerr_endline2_160@misc "")))
            #f)
          (let ((x6 (caml-constr-get-field x5 1)))
            (labels
              ((staticfail1025
                 ()
                 (caml-make-regular-2
                   #<000b>
                   (caml-constr-get-field x5 0)
                   (x1 (caml-constr-get-field x5 1)))))
              (let ((g1036 x6))
                (cond ((eq? g1036 #f) (caml-constr-get-field x5 0))
                      (else (staticfail1025))))))))))
)

