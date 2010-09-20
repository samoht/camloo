;; Le module 
(module
  __caml_baltree
  (import
    __caml_arg
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
    (size_139@baltree x1)
    (new_27@baltree x1)
    (3-35-new_27@baltree x1 x2 x3)
    (bal_208@baltree x1)
    (3-126-bal_208@baltree x1 x2 x3)
    (join_132@baltree x1)
    (3-55-join_132@baltree x1 x2 x3)
    (merge_129@baltree x1)
    (2-99-merge_129@baltree x1 x2)
    (concat_228@baltree x1)
    (2-171-concat_228@baltree x1 x2)
    (add_6@baltree x1)
    (3-97-add_6@baltree x1 x2 x3)
    (contains_14@baltree x1)
    (2-154-contains_14@baltree x1 x2)
    (find_75@baltree x1)
    (2-56-find_75@baltree x1 x2)
    (remove_141@baltree x1)
    (2-174-remove_141@baltree x1 x2)
    (modify_152@baltree x1)
    (3-126-modify_152@baltree x1 x2 x3)
    (split_219@baltree x1)
    (2-127-split_219@baltree x1 a1018)
    (compare_121@baltree x1)
    (3-32-compare_121@baltree x1 x2 x3)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (size_139@baltree x1)
  (let ((g1025 x1))
    (cond ((eq? g1025 #f) 1)
          (else (caml-constr-get-field x1 3)))))


(begin
  (define (new_27@baltree x1)
    (lambda (x2)
       (lambda (x3) (3-35-new_27@baltree x1 x2 x3))))
 (define (3-35-new_27@baltree x1 x2 x3)
    (let ((x4 (let ((x4 x1))
                (let ((g1026 x4))
                  (cond ((eq? g1026 #f) 0)
                        (else (caml-constr-get-field x4 3)))))))
      (let ((x5 (let ((x5 x3))
                  (let ((g1027 x5))
                    (cond ((eq? g1027 #f) 0)
                          (else (caml-constr-get-field x5 3)))))))
        (caml-make-regular-4
          #t
          x1
          x2
          x3
          (+fx (+fx x4 x5) 1)))))
)

(begin
  (define (bal_208@baltree x1)
    (lambda (x2)
       (lambda (x3) (3-126-bal_208@baltree x1 x2 x3))))
 (define (3-126-bal_208@baltree x1 x2 x3)
    (let ((x4 (let ((x4 x1))
                (let ((g1028 x4))
                  (cond ((eq? g1028 #f) 0)
                        (else (caml-constr-get-field x4 3)))))))
      (let ((x5 (let ((x5 x3))
                  (let ((g1029 x5))
                    (cond ((eq? g1029 #f) 0)
                          (else (caml-constr-get-field x5 3)))))))
        (if (>fx x4 (*fx 3 x5))
          (let ((x6 x1))
            (labels
              ((staticfail1000
                 ()
                 (caml-raise
                   '#("Mlib/baltree.ml"
                      1111
                      1299
                      Match_failure_1@builtin
                      ()))))
              (case (if (caml-constant-constr? x6)
                      -1
                      (caml-regular-constr-tag x6))
                ((2)
                 (if (>=fx (size_139@baltree (caml-constr-get-field x6 0))
                           (size_139@baltree (caml-constr-get-field x6 2)))
                   (3-35-new_27@baltree
                     (caml-constr-get-field x6 0)
                     (caml-constr-get-field x6 1)
                     (3-35-new_27@baltree
                       (caml-constr-get-field x6 2)
                       x2
                       x3))
                   (let ((x7 (caml-constr-get-field x6 2)))
                     (labels
                       ((staticfail1001
                          ()
                          (caml-raise
                            '#("Mlib/baltree.ml"
                               1219
                               1299
                               Match_failure_1@builtin
                               ()))))
                       (case (if (caml-constant-constr? x7)
                               -1
                               (caml-regular-constr-tag x7))
                         ((2)
                          (3-35-new_27@baltree
                            (3-35-new_27@baltree
                              (caml-constr-get-field x6 0)
                              (caml-constr-get-field x6 1)
                              (caml-constr-get-field x7 0))
                            (caml-constr-get-field x7 1)
                            (3-35-new_27@baltree
                              (caml-constr-get-field x7 2)
                              x2
                              x3)))
                         (else (staticfail1001)))))))
                (else (staticfail1000)))))
          (if (>fx x5 (*fx 3 x4))
            (let ((x6 x3))
              (labels
                ((staticfail1002
                   ()
                   (caml-raise
                     '#("Mlib/baltree.ml"
                        1331
                        1519
                        Match_failure_1@builtin
                        ()))))
                (case (if (caml-constant-constr? x6)
                        -1
                        (caml-regular-constr-tag x6))
                  ((2)
                   (if (>=fx (size_139@baltree (caml-constr-get-field x6 2))
                             (size_139@baltree (caml-constr-get-field x6 0)))
                     (3-35-new_27@baltree
                       (3-35-new_27@baltree
                         x1
                         x2
                         (caml-constr-get-field x6 0))
                       (caml-constr-get-field x6 1)
                       (caml-constr-get-field x6 2))
                     (let ((x7 (caml-constr-get-field x6 0)))
                       (labels
                         ((staticfail1003
                            ()
                            (caml-raise
                              '#("Mlib/baltree.ml"
                                 1439
                                 1519
                                 Match_failure_1@builtin
                                 ()))))
                         (case (if (caml-constant-constr? x7)
                                 -1
                                 (caml-regular-constr-tag x7))
                           ((2)
                            (3-35-new_27@baltree
                              (3-35-new_27@baltree
                                x1
                                x2
                                (caml-constr-get-field x7 0))
                              (caml-constr-get-field x7 1)
                              (3-35-new_27@baltree
                                (caml-constr-get-field x7 2)
                                (caml-constr-get-field x6 1)
                                (caml-constr-get-field x6 2))))
                           (else (staticfail1003)))))))
                  (else (staticfail1002)))))
            (caml-make-regular-4
              #t
              x1
              x2
              x3
              (+fx (+fx x4 x5) 1)))))))
)

(begin
  (define (join_132@baltree x1)
    (lambda (x2)
       (lambda (x3) (3-55-join_132@baltree x1 x2 x3))))
 (define (3-55-join_132@baltree x1 x2 x3)
    (let ((x4 (3-126-bal_208@baltree x1 x2 x3)))
      (labels
        ((staticfail1005
           ()
           (caml-raise
             '#("Mlib/baltree.ml"
                1670
                1814
                Match_failure_1@builtin
                ()))))
        (case (if (caml-constant-constr? x4)
                -1
                (caml-regular-constr-tag x4))
          ((2)
           (let ((x5 (size_139@baltree (caml-constr-get-field x4 0)))
                 (x6 (size_139@baltree (caml-constr-get-field x4 2))))
             (if (or (>fx x5 (*fx 3 x6)) (>fx x6 (*fx 3 x5)))
               (3-55-join_132@baltree
                 (caml-constr-get-field x4 0)
                 (caml-constr-get-field x4 1)
                 (caml-constr-get-field x4 2))
               x4)))
          (else (staticfail1005))))))
)

(begin
  (define (merge_129@baltree x1)
    (lambda (x2) (2-99-merge_129@baltree x1 x2)))
 (define (2-99-merge_129@baltree x1 x2)
    (labels
      ((staticfail1009
         ()
         (caml-raise
           '#("Mlib/baltree.ml"
              1975
              2107
              Match_failure_1@builtin
              ()))))
      (labels
        ((staticfail1010
           ()
           (labels
             ((staticfail1011
                ()
                (case (if (caml-constant-constr? x1)
                        -1
                        (caml-regular-constr-tag x1))
                  ((2)
                   (case (if (caml-constant-constr? x2)
                           -1
                           (caml-regular-constr-tag x2))
                     ((2)
                      (3-126-bal_208@baltree
                        (caml-constr-get-field x1 0)
                        (caml-constr-get-field x1 1)
                        (3-126-bal_208@baltree
                          (2-99-merge_129@baltree
                            (caml-constr-get-field x1 2)
                            (caml-constr-get-field x2 0))
                          (caml-constr-get-field x2 1)
                          (caml-constr-get-field x2 2))))
                     (else (staticfail1009))))
                  (else (staticfail1009)))))
             (let ((g1030 x2))
               (cond ((eq? g1030 #f) x1)
                     (else (staticfail1011)))))))
        (let ((g1031 x1))
          (cond ((eq? g1031 #f) x2)
                (else (staticfail1010)))))))
)

(begin
  (define (concat_228@baltree x1)
    (lambda (x2) (2-171-concat_228@baltree x1 x2)))
 (define (2-171-concat_228@baltree x1 x2)
    (labels
      ((staticfail1015
         ()
         (caml-raise
           '#("Mlib/baltree.ml"
              2195
              2330
              Match_failure_1@builtin
              ()))))
      (labels
        ((staticfail1016
           ()
           (labels
             ((staticfail1017
                ()
                (case (if (caml-constant-constr? x1)
                        -1
                        (caml-regular-constr-tag x1))
                  ((2)
                   (case (if (caml-constant-constr? x2)
                           -1
                           (caml-regular-constr-tag x2))
                     ((2)
                      (3-55-join_132@baltree
                        (caml-constr-get-field x1 0)
                        (caml-constr-get-field x1 1)
                        (3-55-join_132@baltree
                          (2-171-concat_228@baltree
                            (caml-constr-get-field x1 2)
                            (caml-constr-get-field x2 0))
                          (caml-constr-get-field x2 1)
                          (caml-constr-get-field x2 2))))
                     (else (staticfail1015))))
                  (else (staticfail1015)))))
             (let ((g1032 x2))
               (cond ((eq? g1032 #f) x1)
                     (else (staticfail1017)))))))
        (let ((g1033 x1))
          (cond ((eq? g1033 #f) x2)
                (else (staticfail1016)))))))
)

(begin
  (define (add_6@baltree x1)
    (lambda (x2)
       (lambda (x3) (3-97-add_6@baltree x1 x2 x3))))
 (define (3-97-add_6@baltree x1 x2 x3)
    (letrec ((x4 (lambda (x5)
                    (let ((g1034 x5))
                      (cond ((eq? g1034 #f)
                             (caml-make-regular-4 #t #f x2 #f 1))
                            (else
                             (let ((x6 (x1 (caml-constr-get-field x5 1))))
                               (if (eq? x6 0)
                                 x5
                                 (if (<fx x6 0)
                                   (3-126-bal_208@baltree
                                     (x4 (caml-constr-get-field x5 0))
                                     (caml-constr-get-field x5 1)
                                     (caml-constr-get-field x5 2))
                                   (3-126-bal_208@baltree
                                     (caml-constr-get-field x5 0)
                                     (caml-constr-get-field x5 1)
                                     (x4 (caml-constr-get-field x5 2))))))))))))
      (x4 x3)))
)

(begin
  (define (contains_14@baltree x1)
    (lambda (x2) (2-154-contains_14@baltree x1 x2)))
 (define (2-154-contains_14@baltree x1 x2)
    (letrec ((x3 (lambda (x4)
                    (let ((g1035 x4))
                      (cond ((eq? g1035 #f) #f)
                            (else
                             (let ((x5 (x1 (caml-constr-get-field x4 1))))
                               (if (eq? x5 0)
                                 #t
                                 (if (<fx x5 0)
                                   (x3 (caml-constr-get-field x4 0))
                                   (x3 (caml-constr-get-field x4 2)))))))))))
      (x3 x2)))
)

(begin
  (define (find_75@baltree x1)
    (lambda (x2) (2-56-find_75@baltree x1 x2)))
 (define (2-56-find_75@baltree x1 x2)
    (letrec ((x3 (lambda (x4)
                    (let ((g1036 x4))
                      (cond ((eq? g1036 #f) (caml-raise 'Not_found_4@exc))
                            (else
                             (let ((x5 (x1 (caml-constr-get-field x4 1))))
                               (if (eq? x5 0)
                                 (caml-constr-get-field x4 1)
                                 (if (<fx x5 0)
                                   (x3 (caml-constr-get-field x4 0))
                                   (x3 (caml-constr-get-field x4 2)))))))))))
      (x3 x2)))
)

(begin
  (define (remove_141@baltree x1)
    (lambda (x2) (2-174-remove_141@baltree x1 x2)))
 (define (2-174-remove_141@baltree x1 x2)
    (letrec ((x3 (lambda (x4)
                    (let ((g1037 x4))
                      (cond ((eq? g1037 #f) #f)
                            (else
                             (let ((x5 (x1 (caml-constr-get-field x4 1))))
                               (if (eq? x5 0)
                                 (2-99-merge_129@baltree
                                   (caml-constr-get-field x4 0)
                                   (caml-constr-get-field x4 2))
                                 (if (<fx x5 0)
                                   (3-126-bal_208@baltree
                                     (x3 (caml-constr-get-field x4 0))
                                     (caml-constr-get-field x4 1)
                                     (caml-constr-get-field x4 2))
                                   (3-126-bal_208@baltree
                                     (caml-constr-get-field x4 0)
                                     (caml-constr-get-field x4 1)
                                     (x3 (caml-constr-get-field x4 2))))))))))))
      (x3 x2)))
)

(begin
  (define (modify_152@baltree x1)
    (lambda (x2)
       (lambda (x3) (3-126-modify_152@baltree x1 x2 x3))))
 (define (3-126-modify_152@baltree x1 x2 x3)
    (letrec ((x4 (lambda (x5)
                    (let ((g1038 x5))
                      (cond ((eq? g1038 #f)
                             (let ((x6 (x2 #f)))
                               (let ((g1039 x6))
                                 (cond ((eq? g1039 #f) #f)
                                       (else
                                        (caml-make-regular-4
                                          #t
                                          #f
                                          (caml-constr-get-field x6 0)
                                          #f
                                          1))))))
                            (else
                             (let ((x6 (x1 (caml-constr-get-field x5 1))))
                               (if (eq? x6 0)
                                 (let ((x7 (x2 (caml-make-regular-1
                                                 #t
                                                 (caml-constr-get-field
                                                   x5
                                                   1)))))
                                   (let ((g1040 x7))
                                     (cond ((eq? g1040 #f)
                                            (2-99-merge_129@baltree
                                              (caml-constr-get-field x5 0)
                                              (caml-constr-get-field x5 2)))
                                           (else
                                            (caml-make-regular-4
                                              #t
                                              (caml-constr-get-field x5 0)
                                              (caml-constr-get-field x7 0)
                                              (caml-constr-get-field x5 2)
                                              (caml-constr-get-field x5 3))))))
                                 (if (<fx x6 0)
                                   (3-126-bal_208@baltree
                                     (x4 (caml-constr-get-field x5 0))
                                     (caml-constr-get-field x5 1)
                                     (caml-constr-get-field x5 2))
                                   (3-126-bal_208@baltree
                                     (caml-constr-get-field x5 0)
                                     (caml-constr-get-field x5 1)
                                     (x4 (caml-constr-get-field x5 2))))))))))))
      (x4 x3)))
)

(begin
  (define (split_219@baltree x1)
    (lambda (a1018)
       (2-127-split_219@baltree x1 a1018)))
 (define (2-127-split_219@baltree x1 a1018)
    (letrec ((x2 (lambda (x3)
                    (let ((g1041 x3))
                      (cond ((eq? g1041 #f) '#(#f #f #f #f))
                            (else
                             (let ((x4 (x1 (caml-constr-get-field x3 1))))
                               (if (eq? x4 0)
                                 (caml-make-regular-3
                                   #f
                                   (caml-constr-get-field x3 0)
                                   (caml-make-regular-1
                                     #t
                                     (caml-constr-get-field x3 1))
                                   (caml-constr-get-field x3 2))
                                 (if (<fx x4 0)
                                   (let ((x5 (x2 (caml-constr-get-field x3 0))))
                                     (caml-make-regular-3
                                       #f
                                       (caml-constr-get-field x5 0)
                                       (caml-constr-get-field x5 1)
                                       (3-55-join_132@baltree
                                         (caml-constr-get-field x5 2)
                                         (caml-constr-get-field x3 1)
                                         (caml-constr-get-field x3 2))))
                                   (let ((x5 (x2 (caml-constr-get-field x3 2))))
                                     (caml-make-regular-3
                                       #f
                                       (3-55-join_132@baltree
                                         (caml-constr-get-field x3 0)
                                         (caml-constr-get-field x3 1)
                                         (caml-constr-get-field x5 0))
                                       (caml-constr-get-field x5 1)
                                       (caml-constr-get-field x5 2))))))))))))
      (x2 a1018)))
)

(begin
  (define (compare_121@baltree x1)
    (lambda (x2)
       (lambda (x3) (3-32-compare_121@baltree x1 x2 x3))))
 (define (3-32-compare_121@baltree x1 x2 x3)
    (letrec ((x4 (lambda (x5)
                    (lambda (x6)
                       (labels
                         ((staticfail1019
                            ()
                            (caml-raise
                              '#("Mlib/baltree.ml"
                                 4371
                                 4821
                                 Match_failure_1@builtin
                                 ()))))
                         (labels
                           ((staticfail1020
                              ()
                              (labels
                                ((staticfail1021
                                   ()
                                   (labels
                                     ((staticfail1022
                                        ()
                                        (if (null? x6)
                                          (staticfail1019)
                                          (case (if (caml-constant-constr?
                                                      (car x6))
                                                  -1
                                                  (caml-regular-constr-tag
                                                    (car x6)))
                                            ((2)
                                             ((x4 x5)
                                              (cons (caml-constr-get-field
                                                      (car x6)
                                                      0)
                                                    (cons (caml-make-regular-4
                                                            #t
                                                            #f
                                                            (caml-constr-get-field
                                                              (car x6)
                                                              1)
                                                            (caml-constr-get-field
                                                              (car x6)
                                                              2)
                                                            0)
                                                          (cdr x6)))))
                                            (else (staticfail1019))))))
                                     (if (null? x5)
                                       (staticfail1022)
                                       (let ((g1042 (car x5)))
                                         (cond ((eq? g1042 #f)
                                                (if (null? x6)
                                                  (staticfail1022)
                                                  (let ((g1043 (car x6)))
                                                    (cond ((eq? g1043 #f)
                                                           ((x4 (cdr x5))
                                                            (cdr x6)))
                                                          (else
                                                           (staticfail1022))))))
                                               (else
                                                (labels
                                                  ((staticfail1023
                                                     ()
                                                     ((x4 (cons (caml-constr-get-field
                                                                  (car x5)
                                                                  0)
                                                                (cons (caml-make-regular-4
                                                                        #t
                                                                        #f
                                                                        (caml-constr-get-field
                                                                          (car x5)
                                                                          1)
                                                                        (caml-constr-get-field
                                                                          (car x5)
                                                                          2)
                                                                        0)
                                                                      (cdr x5))))
                                                      x6)))
                                                  (let ((g1044 (caml-constr-get-field
                                                                 (car x5)
                                                                 0)))
                                                    (cond ((eq? g1044 #f)
                                                           (if (null? x6)
                                                             (staticfail1023)
                                                             (case (if (caml-constant-constr?
                                                                         (car x6))
                                                                     -1
                                                                     (caml-regular-constr-tag
                                                                       (car x6)))
                                                               ((2)
                                                                (let ((g1045 (caml-constr-get-field
                                                                               (car x6)
                                                                               0)))
                                                                  (cond ((eq? g1045
                                                                              #f)
                                                                         (let ((x7 ((x1 (caml-constr-get-field
                                                                                          (car x5)
                                                                                          1))
                                                                                    (caml-constr-get-field
                                                                                      (car x6)
                                                                                      1))))
                                                                           (if ((lambda (x y)
                                                                                   (not (eq? x
                                                                                             y)))
                                                                                x7
                                                                                0)
                                                                             x7
                                                                             ((x4 (cons (caml-constr-get-field
                                                                                          (car x5)
                                                                                          2)
                                                                                        (cdr x5)))
                                                                              (cons (caml-constr-get-field
                                                                                      (car x6)
                                                                                      2)
                                                                                    (cdr x6))))))
                                                                        (else
                                                                         (staticfail1023)))))
                                                               (else
                                                                (staticfail1023)))))
                                                          (else
                                                           (staticfail1023))))))))))))
                                (if (null? x6) 1 (staticfail1021)))))
                           (if (null? x5)
                             (labels
                               ((staticfail1024 () -1))
                               (if (null? x6) 0 (staticfail1024)))
                             (staticfail1020))))))))
      ((x4 (cons x2 '())) (cons x3 '()))))
)

