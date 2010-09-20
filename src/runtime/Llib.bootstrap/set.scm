;; Le module 
(module
  __caml_set
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
    (empty_102@set x1)
    (is_empty_204@set x1)
    (mem_169@set x1)
    (2-66-mem_169@set x1 x2)
    (add_6@set x1)
    (2-72-add_6@set x1 x2)
    (remove_141@set x1)
    (2-157-remove_141@set x1 x2)
    (union_3@set x1)
    (2-80-union_3@set x1 x2)
    (inter_153@set x1)
    (2-9-inter_153@set x1 x2)
    (diff_72@set x1)
    (2-173-diff_72@set x1 x2)
    (compare_121@set x1)
    (2-255-compare_121@set x1 x2)
    (equal_60@set x1)
    (2-246-equal_60@set x1 x2)
    (iter_219@set x1)
    (2-173-iter_219@set x1 x2)
    (fold_73@set x1)
    (3-37-fold_73@set x1 x2 x3)
    (elements_188@set x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (empty_102@set x1)
  (caml-make-regular-2 #f #f x1))


(define (is_empty_204@set x1)
  (let ((x2 (caml-constr-get-field x1 0)))
    (labels
      ((staticfail1000 () #f))
      (let ((g1010 x2))
        (cond ((eq? g1010 #f) #t)
              (else (staticfail1000)))))))


(begin
  (define (mem_169@set x1)
    (lambda (x2) (2-66-mem_169@set x1 x2)))
 (define (2-66-mem_169@set x1 x2)
    (2-154-contains_14@baltree
      ((caml-constr-get-field x2 1) x1)
      (caml-constr-get-field x2 0)))
)

(begin
  (define (add_6@set x1)
    (lambda (x2) (2-72-add_6@set x1 x2)))
 (define (2-72-add_6@set x1 x2)
    (caml-make-regular-2
      #f
      (3-97-add_6@baltree
        ((caml-constr-get-field x2 1) x1)
        x1
        (caml-constr-get-field x2 0))
      (caml-constr-get-field x2 1)))
)

(begin
  (define (remove_141@set x1)
    (lambda (x2) (2-157-remove_141@set x1 x2)))
 (define (2-157-remove_141@set x1 x2)
    (caml-make-regular-2
      #f
      (2-174-remove_141@baltree
        ((caml-constr-get-field x2 1) x1)
        (caml-constr-get-field x2 0))
      (caml-constr-get-field x2 1)))
)

(begin
  (define (union_3@set x1)
    (lambda (x2) (2-80-union_3@set x1 x2)))
 (define (2-80-union_3@set x1 x2)
    (letrec ((x3 (lambda (x4)
                    (lambda (x5)
                       (labels
                         ((staticfail1001
                            ()
                            (caml-raise
                              '#("Mlib/set.ml"
                                 560
                                 743
                                 Match_failure_1@builtin
                                 ()))))
                         (labels
                           ((staticfail1002
                              ()
                              (labels
                                ((staticfail1003
                                   ()
                                   (case (if (caml-constant-constr? x4)
                                           -1
                                           (caml-regular-constr-tag x4))
                                     ((2)
                                      (let ((x6 (2-127-split_219@baltree
                                                  ((caml-constr-get-field x1 1)
                                                   (caml-constr-get-field x4 1))
                                                  x5)))
                                        (3-55-join_132@baltree
                                          ((x3 (caml-constr-get-field x4 0))
                                           (caml-constr-get-field x6 0))
                                          (caml-constr-get-field x4 1)
                                          ((x3 (caml-constr-get-field x4 2))
                                           (caml-constr-get-field x6 2)))))
                                     (else (staticfail1001)))))
                                (let ((g1011 x5))
                                  (cond ((eq? g1011 #f) x4)
                                        (else (staticfail1003)))))))
                           (let ((g1012 x4))
                             (cond ((eq? g1012 #f) x5)
                                   (else (staticfail1002))))))))))
      (caml-make-regular-2
        #f
        ((x3 (caml-constr-get-field x1 0))
         (caml-constr-get-field x2 0))
        (caml-constr-get-field x1 1))))
)

(begin
  (define (inter_153@set x1)
    (lambda (x2) (2-9-inter_153@set x1 x2)))
 (define (2-9-inter_153@set x1 x2)
    (letrec ((x3 (lambda (x4)
                    (lambda (x5)
                       (labels
                         ((staticfail1004
                            ()
                            (caml-raise
                              '#("Mlib/set.ml"
                                 839
                                 1138
                                 Match_failure_1@builtin
                                 ()))))
                         (labels
                           ((staticfail1005
                              ()
                              (labels
                                ((staticfail1006
                                   ()
                                   (case (if (caml-constant-constr? x4)
                                           -1
                                           (caml-regular-constr-tag x4))
                                     ((2)
                                      (let ((x6 (2-127-split_219@baltree
                                                  ((caml-constr-get-field x1 1)
                                                   (caml-constr-get-field x4 1))
                                                  x5)))
                                        (let ((g1013 (caml-constr-get-field
                                                       x6
                                                       1)))
                                          (cond ((eq? g1013 #f)
                                                 (2-171-concat_228@baltree
                                                   ((x3 (caml-constr-get-field
                                                          x4
                                                          0))
                                                    (caml-constr-get-field
                                                      x6
                                                      0))
                                                   ((x3 (caml-constr-get-field
                                                          x4
                                                          2))
                                                    (caml-constr-get-field
                                                      x6
                                                      2))))
                                                (else
                                                 (3-55-join_132@baltree
                                                   ((x3 (caml-constr-get-field
                                                          x4
                                                          0))
                                                    (caml-constr-get-field
                                                      x6
                                                      0))
                                                   (caml-constr-get-field x4 1)
                                                   ((x3 (caml-constr-get-field
                                                          x4
                                                          2))
                                                    (caml-constr-get-field
                                                      x6
                                                      2))))))))
                                     (else (staticfail1004)))))
                                (let ((g1014 x5))
                                  (cond ((eq? g1014 #f) #f)
                                        (else (staticfail1006)))))))
                           (let ((g1015 x4))
                             (cond ((eq? g1015 #f) #f)
                                   (else (staticfail1005))))))))))
      (caml-make-regular-2
        #f
        ((x3 (caml-constr-get-field x1 0))
         (caml-constr-get-field x2 0))
        (caml-constr-get-field x1 1))))
)

(begin
  (define (diff_72@set x1)
    (lambda (x2) (2-173-diff_72@set x1 x2)))
 (define (2-173-diff_72@set x1 x2)
    (letrec ((x3 (lambda (x4)
                    (lambda (x5)
                       (labels
                         ((staticfail1007
                            ()
                            (caml-raise
                              '#("Mlib/set.ml"
                                 1232
                                 1524
                                 Match_failure_1@builtin
                                 ()))))
                         (labels
                           ((staticfail1008
                              ()
                              (labels
                                ((staticfail1009
                                   ()
                                   (case (if (caml-constant-constr? x4)
                                           -1
                                           (caml-regular-constr-tag x4))
                                     ((2)
                                      (let ((x6 (2-127-split_219@baltree
                                                  ((caml-constr-get-field x1 1)
                                                   (caml-constr-get-field x4 1))
                                                  x5)))
                                        (let ((g1016 (caml-constr-get-field
                                                       x6
                                                       1)))
                                          (cond ((eq? g1016 #f)
                                                 (3-55-join_132@baltree
                                                   ((x3 (caml-constr-get-field
                                                          x4
                                                          0))
                                                    (caml-constr-get-field
                                                      x6
                                                      0))
                                                   (caml-constr-get-field x4 1)
                                                   ((x3 (caml-constr-get-field
                                                          x4
                                                          2))
                                                    (caml-constr-get-field
                                                      x6
                                                      2))))
                                                (else
                                                 (2-171-concat_228@baltree
                                                   ((x3 (caml-constr-get-field
                                                          x4
                                                          0))
                                                    (caml-constr-get-field
                                                      x6
                                                      0))
                                                   ((x3 (caml-constr-get-field
                                                          x4
                                                          2))
                                                    (caml-constr-get-field
                                                      x6
                                                      2))))))))
                                     (else (staticfail1007)))))
                                (let ((g1017 x5))
                                  (cond ((eq? g1017 #f) x4)
                                        (else (staticfail1009)))))))
                           (let ((g1018 x4))
                             (cond ((eq? g1018 #f) #f)
                                   (else (staticfail1008))))))))))
      (caml-make-regular-2
        #f
        ((x3 (caml-constr-get-field x1 0))
         (caml-constr-get-field x2 0))
        (caml-constr-get-field x1 1))))
)

(begin
  (define (compare_121@set x1)
    (lambda (x2) (2-255-compare_121@set x1 x2)))
 (define (2-255-compare_121@set x1 x2)
    (3-32-compare_121@baltree
      (caml-constr-get-field x1 1)
      (caml-constr-get-field x1 0)
      (caml-constr-get-field x2 0)))
)

(begin
  (define (equal_60@set x1)
    (lambda (x2) (2-246-equal_60@set x1 x2)))
 (define (2-246-equal_60@set x1 x2)
    (eq? (2-255-compare_121@set x1 x2) 0))
)

(begin
  (define (iter_219@set x1)
    (lambda (x2) (2-173-iter_219@set x1 x2)))
 (define (2-173-iter_219@set x1 x2)
    (letrec ((x3 (lambda (x4)
                    (let ((g1019 x4))
                      (cond ((eq? g1019 #f) #f)
                            (else
                             (begin
                               (x3 (caml-constr-get-field x4 0))
                               (begin
                                 (x1 (caml-constr-get-field x4 1))
                                 (x3 (caml-constr-get-field x4 2))))))))))
      (x3 (caml-constr-get-field x2 0))))
)

(begin
  (define (fold_73@set x1)
    (lambda (x2)
       (lambda (x3) (3-37-fold_73@set x1 x2 x3))))
 (define (3-37-fold_73@set x1 x2 x3)
    (letrec ((x4 (lambda (x5)
                    (lambda (x6)
                       (let ((g1020 x6))
                         (cond ((eq? g1020 #f) x5)
                               (else
                                ((x4 ((x1 (caml-constr-get-field x6 1))
                                      ((x4 x5) (caml-constr-get-field x6 2))))
                                 (caml-constr-get-field x6 0)))))))))
      ((x4 x3) (caml-constr-get-field x2 0))))
)

(define (elements_188@set x1)
  (letrec ((x2 (lambda (x3)
                  (lambda (x4)
                     (let ((g1021 x4))
                       (cond ((eq? g1021 #f) x3)
                             (else
                              ((x2 (cons (caml-constr-get-field x4 1)
                                         ((x2 x3)
                                          (caml-constr-get-field x4 2))))
                               (caml-constr-get-field x4 0)))))))))
    ((x2 '()) (caml-constr-get-field x1 0))))


