;; Le module 
(module
  __caml_types
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_globals
    __caml_builtins
    __caml_modules)
  (export
    (same_type_constr_63@types x1)
    (2-180-same_type_constr_63@types x1 x2)
    (type_repr_76@types x1)
    current_level_49@types
    (reset_type_var_223@types x1)
    (push_type_level_50@types x1)
    (pop_type_level_152@types x1)
    (new_type_var_196@types x1)
    (type_var_list_201@types x1)
    (2-17-type_var_list_201@types x1 x2)
    (new_type_var_list_212@types x1)
    (free_type_vars_143@types x1)
    (dangerous_vars_81@types x1)
    (gen_type_196@types x1)
    (gen_type_list_212@types x1)
    (2-182-gen_type_196@types x1 x2)
    (2-86-gen_type_list_212@types x1 x2)
    (generalize_type_47@types x1)
    (generalize_type_constr_9@types x1)
    (copy_type_139@types x1)
    (cleanup_type_135@types x1)
    (type_instance_208@types x1)
    (type_pair_instance_141@types x1)
    (bind_variable_178@types x1)
    (2-55-bind_variable_178@types x1 x2)
    (expand_abbrev_242@types x1)
    (3-140-expand_abbrev_242@types x1 x2 x3)
    (occur_check_55@types x1)
    (3-212-occur_check_55@types x1 x2 a1002)
    (unify_210@types x1)
    (unify_expand_248@types x1)
    (unify_list_205@types x1)
    (2-182-unify_expand_248@types x1 x2)
    (filter_arrow_178@types x1)
    (filter_product_179@types x1)
    (2-131-filter_product_179@types x1 x2)
    (filter_45@types x1)
    (filter_expand_93@types x1)
    (filter_list_174@types x1)
    (2-249-filter_expand_93@types x1 x2)
    (arity_247@types x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (same_type_constr_63@types x1)
    (lambda (x2)
       (2-180-same_type_constr_63@types x1 x2)))
 (define (2-180-same_type_constr_63@types x1 x2)
    (and (eq? (caml-constr-get-field
                (caml-constr-get-field x1 1)
                0)
              (caml-constr-get-field
                (caml-constr-get-field x2 1)
                0))
         (tree_equal
           (caml-constr-get-field
             (caml-constr-get-field x1 0)
             0)
           (caml-constr-get-field
             (caml-constr-get-field x2 0)
             0))))
)

(define (type_repr_76@types x1)
  (let ((x2 (caml-constr-get-field x1 0)))
    (labels
      ((staticfail1000 () x1))
      (case (if (caml-constant-constr? x2)
              -1
              (caml-regular-constr-tag x2))
        ((1)
         (let ((g1023 (caml-constr-get-field x2 0)))
           (cond ((eq? g1023 #f) x1)
                 (else
                  (let ((x3 (caml-constr-get-field x2 0))
                        (x4 (caml-constr-get-field
                              (caml-constr-get-field x2 0)
                              0)))
                    (let ((x5 (type_repr_76@types x4)))
                      (begin
                        (caml-constr-set-field!
                          x2
                          0
                          (caml-make-regular-1 #t x5))
                        x5)))))))
        (else (staticfail1000))))))


(define current_level_49@types (make-cell 0))

(begin
  (define (reset_type_var_223@types x1)
    (begin (cell-set! current_level_49@types 0) #f))
 (begin
    (define (push_type_level_50@types x1)
      (begin
        (cell-set!
          current_level_49@types
          (+fx (cell-ref current_level_49@types) 1))
        #f))
   (define (pop_type_level_152@types x1)
      (begin
        (cell-set!
          current_level_49@types
          (-fx (cell-ref current_level_49@types) 1))
        #f))
))

(define (new_type_var_196@types x1)
  (caml-make-regular-2
    #f
    (caml-make-regular-1 #f #f)
    (cell-ref current_level_49@types)))


(begin
  (define (type_var_list_201@types x1)
    (lambda (x2)
       (2-17-type_var_list_201@types x1 x2)))
 (define (2-17-type_var_list_201@types x1 x2)
    (if (<=fx x1 0)
      '()
      (cons (caml-make-regular-2
              #f
              (caml-make-regular-1 #f #f)
              x2)
            (2-17-type_var_list_201@types (-fx x1 1) x2))))
)

(define (new_type_var_list_212@types x1)
  (2-17-type_var_list_201@types
    x1
    (cell-ref current_level_49@types)))


(define (free_type_vars_143@types x1)
  (let ((x2 (type_repr_76@types x1)))
    (let ((x3 (caml-constr-get-field x2 0)))
      (case (caml-regular-constr-tag x3)
        ((1)
         (if (eq? (caml-constr-get-field x2 1)
                  generic_255@globals)
           '()
           (cons x2 '())))
        ((2)
         ((@_176@list
            (free_type_vars_143@types
              (caml-constr-get-field x3 0)))
          (free_type_vars_143@types
            (caml-constr-get-field x3 1))))
        ((3)
         ((flat_map_45@list free_type_vars_143@types)
          (caml-constr-get-field x3 0)))
        (else
         ((flat_map_45@list free_type_vars_143@types)
          (caml-constr-get-field x3 1)))))))


(define (dangerous_vars_81@types x1)
  (let ((x2 (type_repr_76@types x1)))
    (let ((x3 (caml-constr-get-field x2 0)))
      (case (caml-regular-constr-tag x3)
        ((2 1) '())
        ((3)
         ((flat_map_45@list dangerous_vars_81@types)
          (caml-constr-get-field x3 0)))
        (else
         (if (caml-constr-get-field
               (caml-constr-get-field
                 (caml-constr-get-field x3 0)
                 1)
               1)
           (free_type_vars_143@types x2)
           ((flat_map_45@list dangerous_vars_81@types)
            (caml-constr-get-field x3 1))))))))


(begin
  (begin
    (define (gen_type_196@types x1)
      (lambda (x2) (2-182-gen_type_196@types x1 x2)))
   (define (2-182-gen_type_196@types x1 x2)
      (let ((x3 (type_repr_76@types x2)))
        (begin
          (let ((x4 (caml-constr-get-field x3 0)))
            (case (caml-regular-constr-tag x4)
              ((1)
               (if (>fx (caml-constr-get-field x3 1)
                        (cell-ref current_level_49@types))
                 (caml-constr-set-field!
                   x3
                   1
                   (if (eq? x1 #unspecified)
                     (cell-ref current_level_49@types)
                     generic_255@globals))
                 #f))
              ((2)
               (let ((x5 (if (eq? x1 #unspecified) #unspecified #t)))
                 (caml-constr-set-field!
                   x3
                   1
                   ((min_84@int
                      (2-182-gen_type_196@types
                        x5
                        (caml-constr-get-field x4 0)))
                    (2-182-gen_type_196@types
                      x5
                      (caml-constr-get-field x4 1))))))
              ((3)
               (caml-constr-set-field!
                 x3
                 1
                 ((gen_type_list_212@types x1)
                  (caml-constr-get-field x4 0))))
              (else
               (caml-constr-set-field!
                 x3
                 1
                 ((gen_type_list_212@types
                    (if ((lambda (x y) (not (eq? x y))) x1 #f)
                      x1
                      (if (caml-constr-get-field
                            (caml-constr-get-field
                              (caml-constr-get-field x4 0)
                              1)
                            1)
                        #unspecified
                        #f)))
                  (caml-constr-get-field x4 1))))))
          (caml-constr-get-field x3 1))))
)(begin
    (define (gen_type_list_212@types x1)
      (lambda (x2)
         (2-86-gen_type_list_212@types x1 x2)))
   (define (2-86-gen_type_list_212@types x1 x2)
      (if (null? x2)
        notgeneric_227@globals
        ((min_84@int
           (2-182-gen_type_196@types x1 (car x2)))
         (2-86-gen_type_list_212@types x1 (cdr x2)))))
))

(begin
  (define (generalize_type_47@types x1)
    (let ((x2 (2-182-gen_type_196@types #f x1))) #f))
 (define (generalize_type_constr_9@types x1)
    (let ((x2 (2-182-gen_type_196@types #t x1))) #f))
)

(define (copy_type_139@types x1)
  (case (caml-regular-constr-tag
          (caml-constr-get-field x1 0))
    ((1)
     (let ((g1024 (caml-constr-get-field
                    (caml-constr-get-field x1 0)
                    0)))
       (cond ((eq? g1024 #f)
              (let ((x2 (caml-constr-get-field
                          (caml-constr-get-field x1 0)
                          0))
                    (x3 (caml-constr-get-field x1 1)))
                (if (eq? x3 generic_255@globals)
                  (let ((x4 (new_type_var_196@types #f)))
                    (begin
                      (caml-constr-set-field!
                        (caml-constr-get-field x1 0)
                        0
                        (caml-make-regular-1 #t x4))
                      x4))
                  x1)))
             (else
              (let ((x2 (caml-constr-get-field
                          (caml-constr-get-field
                            (caml-constr-get-field x1 0)
                            0)
                          0))
                    (x3 (caml-constr-get-field x1 1)))
                (if (eq? x3 generic_255@globals)
                  x2
                  (copy_type_139@types x2)))))))
    ((2)
     (let ((x2 (caml-constr-get-field x1 1)))
       (if (eq? x2 generic_255@globals)
         (caml-make-regular-2
           #f
           (caml-make-regular-2
             #t
             (copy_type_139@types
               (caml-constr-get-field
                 (caml-constr-get-field x1 0)
                 0))
             (copy_type_139@types
               (caml-constr-get-field
                 (caml-constr-get-field x1 0)
                 1)))
           notgeneric_227@globals)
         x1)))
    ((3)
     (let ((x2 (caml-constr-get-field x1 1)))
       (if (eq? x2 generic_255@globals)
         (caml-make-regular-2
           #f
           (caml-make-regular-1
             #unspecified
             ((map_118@list copy_type_139@types)
              (caml-constr-get-field
                (caml-constr-get-field x1 0)
                0)))
           notgeneric_227@globals)
         x1)))
    (else
     (let ((x2 (caml-constr-get-field x1 1)))
       (if (eq? x2 generic_255@globals)
         (caml-make-regular-2
           #f
           (caml-make-regular-2
             #u0000
             (caml-constr-get-field
               (caml-constr-get-field x1 0)
               0)
             ((map_118@list copy_type_139@types)
              (caml-constr-get-field
                (caml-constr-get-field x1 0)
                1)))
           notgeneric_227@globals)
         x1)))))


(define (cleanup_type_135@types x1)
  (case (caml-regular-constr-tag
          (caml-constr-get-field x1 0))
    ((1)
     (let ((g1025 (caml-constr-get-field
                    (caml-constr-get-field x1 0)
                    0)))
       (cond ((eq? g1025 #f)
              (let ((x2 (caml-constr-get-field x1 1))) #f))
             (else
              (let ((x2 (caml-constr-get-field
                          (caml-constr-get-field x1 0)
                          0))
                    (x3 (caml-constr-get-field
                          (caml-constr-get-field
                            (caml-constr-get-field x1 0)
                            0)
                          0))
                    (x4 (caml-constr-get-field x1 1)))
                (if (eq? x4 generic_255@globals)
                  (caml-constr-set-field!
                    (caml-constr-get-field x1 0)
                    0
                    #f)
                  (cleanup_type_135@types x3)))))))
    ((2)
     (let ((x2 (caml-constr-get-field x1 1)))
       (if (eq? x2 generic_255@globals)
         (begin
           (cleanup_type_135@types
             (caml-constr-get-field
               (caml-constr-get-field x1 0)
               0))
           (cleanup_type_135@types
             (caml-constr-get-field
               (caml-constr-get-field x1 0)
               1)))
         #f)))
    ((3)
     (let ((x2 (caml-constr-get-field x1 1)))
       (if (eq? x2 generic_255@globals)
         ((do_list_18@list cleanup_type_135@types)
          (caml-constr-get-field
            (caml-constr-get-field x1 0)
            0))
         #f)))
    (else
     (let ((x2 (caml-constr-get-field x1 1)))
       (if (eq? x2 generic_255@globals)
         ((do_list_18@list cleanup_type_135@types)
          (caml-constr-get-field
            (caml-constr-get-field x1 0)
            1))
         #f)))))


(begin
  (define (type_instance_208@types x1)
    (let ((x2 (copy_type_139@types x1)))
      (begin (cleanup_type_135@types x1) x2)))
 (define (type_pair_instance_141@types x1)
    (let ((x2 (copy_type_139@types
                (caml-constr-get-field x1 0)))
          (x3 (copy_type_139@types
                (caml-constr-get-field x1 1))))
      (begin
        (cleanup_type_135@types
          (caml-constr-get-field x1 0))
        (begin
          (cleanup_type_135@types
            (caml-constr-get-field x1 1))
          (caml-make-regular-2 #f x2 x3)))))
)

(begin
  (define (bind_variable_178@types x1)
    (lambda (x2)
       (2-55-bind_variable_178@types x1 x2)))
 (define (2-55-bind_variable_178@types x1 x2)
    (let ((x3 (caml-constr-get-field x1 0)))
      (labels
        ((staticfail1001
           ()
           (fatal_error_193@misc "bind_variable")))
        (case (if (caml-constant-constr? x3)
                -1
                (caml-regular-constr-tag x3))
          ((1)
           (let ((g1026 (caml-constr-get-field x3 0)))
             (cond ((eq? g1026 #f)
                    (let ((x4 (caml-constr-get-field x3 0)))
                      (caml-constr-set-field!
                        x3
                        0
                        (caml-make-regular-1 #t x2))))
                   (else (staticfail1001)))))
          (else (staticfail1001))))))
)

(begin
  (define (expand_abbrev_242@types x1)
    (lambda (x2)
       (lambda (x3)
          (3-140-expand_abbrev_242@types x1 x2 x3))))
 (define (3-140-expand_abbrev_242@types x1 x2 x3)
    (let ((x4 ((map_118@list copy_type_139@types) x1))
          (x5 (copy_type_139@types x2)))
      (begin
        ((do_list_18@list cleanup_type_135@types) x1)
        (begin
          (cleanup_type_135@types x2)
          (begin
            (((do_list2_49@list bind_variable_178@types) x4)
             x3)
            x5)))))
)

(begin
  (define (occur_check_55@types x1)
    (lambda (x2)
       (lambda (a1002)
          (3-212-occur_check_55@types x1 x2 a1002))))
 (define (3-212-occur_check_55@types x1 x2 a1002)
    (letrec ((x3 (lambda (x4)
                    (let ((x5 (type_repr_76@types x4)))
                      (case (caml-regular-constr-tag
                              (caml-constr-get-field x5 0))
                        ((1)
                         (let ((x6 (caml-constr-get-field x5 1)))
                           (if (eq? x5 x2)
                             (caml-raise 'Unify_1@types)
                             (if (>fx x6 x1)
                               (caml-constr-set-field! x5 1 x1)
                               #f))))
                        ((2)
                         (begin
                           (x3 (caml-constr-get-field
                                 (caml-constr-get-field x5 0)
                                 0))
                           (x3 (caml-constr-get-field
                                 (caml-constr-get-field x5 0)
                                 1))))
                        ((3)
                         ((do_list_18@list x3)
                          (caml-constr-get-field
                            (caml-constr-get-field x5 0)
                            0)))
                        (else
                         ((do_list_18@list x3)
                          (caml-constr-get-field
                            (caml-constr-get-field x5 0)
                            1))))))))
      (x3 a1002)))
)

(begin
  (define (unify_210@types x1)
    (if (eq? (caml-constr-get-field x1 0)
             (caml-constr-get-field x1 1))
      #f
      (let ((x2 (type_repr_76@types (caml-constr-get-field x1 0)))
            (x3 (type_repr_76@types (caml-constr-get-field x1 1))))
        (if (eq? x2 x3)
          #f
          (let ((x4 (caml-make-regular-2
                      #f
                      (caml-constr-get-field x2 0)
                      (caml-constr-get-field x3 0))))
            (labels
              ((staticfail1003
                 ()
                 (labels
                   ((staticfail1004
                      ()
                      (labels
                        ((staticfail1005
                           ()
                           ((unify_expand_248@types x2) x3)))
                        (case (if (caml-constant-constr?
                                    (caml-constr-get-field x4 0))
                                -1
                                (caml-regular-constr-tag
                                  (caml-constr-get-field x4 0)))
                          ((2)
                           (case (if (caml-constant-constr?
                                       (caml-constr-get-field x4 1))
                                   -1
                                   (caml-regular-constr-tag
                                     (caml-constr-get-field x4 1)))
                             ((2)
                              (begin
                                (unify_210@types
                                  (caml-make-regular-2
                                    #f
                                    (caml-constr-get-field
                                      (caml-constr-get-field x4 0)
                                      0)
                                    (caml-constr-get-field
                                      (caml-constr-get-field x4 1)
                                      0)))
                                (unify_210@types
                                  (caml-make-regular-2
                                    #f
                                    (caml-constr-get-field
                                      (caml-constr-get-field x4 0)
                                      1)
                                    (caml-constr-get-field
                                      (caml-constr-get-field x4 1)
                                      1)))))
                             (else (staticfail1005))))
                          ((3)
                           (case (if (caml-constant-constr?
                                       (caml-constr-get-field x4 1))
                                   -1
                                   (caml-regular-constr-tag
                                     (caml-constr-get-field x4 1)))
                             ((3)
                              (unify_list_205@types
                                (caml-make-regular-2
                                  #f
                                  (caml-constr-get-field
                                    (caml-constr-get-field x4 0)
                                    0)
                                  (caml-constr-get-field
                                    (caml-constr-get-field x4 1)
                                    0))))
                             (else (staticfail1005))))
                          ((4)
                           (case (if (caml-constant-constr?
                                       (caml-constr-get-field x4 1))
                                   -1
                                   (caml-regular-constr-tag
                                     (caml-constr-get-field x4 1)))
                             ((4)
                              (if (and (eq? (caml-constr-get-field
                                              (caml-constr-get-field
                                                (caml-constr-get-field
                                                  (caml-constr-get-field x4 0)
                                                  0)
                                                1)
                                              0)
                                            (caml-constr-get-field
                                              (caml-constr-get-field
                                                (caml-constr-get-field
                                                  (caml-constr-get-field x4 1)
                                                  0)
                                                1)
                                              0))
                                       (tree_equal
                                         (caml-constr-get-field
                                           (caml-constr-get-field
                                             (caml-constr-get-field
                                               (caml-constr-get-field x4 0)
                                               0)
                                             0)
                                           0)
                                         (caml-constr-get-field
                                           (caml-constr-get-field
                                             (caml-constr-get-field
                                               (caml-constr-get-field x4 1)
                                               0)
                                             0)
                                           0)))
                                (unify_list_205@types
                                  (caml-make-regular-2
                                    #f
                                    (caml-constr-get-field
                                      (caml-constr-get-field x4 0)
                                      1)
                                    (caml-constr-get-field
                                      (caml-constr-get-field x4 1)
                                      1)))
                                ((unify_expand_248@types x2) x3)))
                             (else (staticfail1005))))
                          (else (staticfail1005))))))
                   (case (if (caml-constant-constr?
                               (caml-constr-get-field x4 1))
                           -1
                           (caml-regular-constr-tag
                             (caml-constr-get-field x4 1)))
                     ((1)
                      (let ((x5 (caml-constr-get-field
                                  (caml-constr-get-field x4 1)
                                  0)))
                        (begin
                          (3-212-occur_check_55@types
                            (caml-constr-get-field x3 1)
                            x3
                            x2)
                          (caml-constr-set-field!
                            (caml-constr-get-field x4 1)
                            0
                            (caml-make-regular-1 #t x2)))))
                     (else (staticfail1004))))))
              (case (if (caml-constant-constr?
                          (caml-constr-get-field x4 0))
                      -1
                      (caml-regular-constr-tag
                        (caml-constr-get-field x4 0)))
                ((1)
                 (labels
                   ((staticfail1006
                      ()
                      (let ((x5 (caml-constr-get-field
                                  (caml-constr-get-field x4 0)
                                  0)))
                        (begin
                          (3-212-occur_check_55@types
                            (caml-constr-get-field x2 1)
                            x2
                            x3)
                          (caml-constr-set-field!
                            (caml-constr-get-field x4 0)
                            0
                            (caml-make-regular-1 #t x3))))))
                   (case (if (caml-constant-constr?
                               (caml-constr-get-field x4 1))
                           -1
                           (caml-regular-constr-tag
                             (caml-constr-get-field x4 1)))
                     ((1)
                      (let ((x5 (caml-constr-get-field
                                  (caml-constr-get-field x4 0)
                                  0))
                            (x6 (caml-constr-get-field
                                  (caml-constr-get-field x4 1)
                                  0)))
                        (if (<fx (caml-constr-get-field x2 1)
                                 (caml-constr-get-field x3 1))
                          (begin
                            (caml-constr-set-field!
                              x3
                              1
                              (caml-constr-get-field x2 1))
                            (caml-constr-set-field!
                              (caml-constr-get-field x4 1)
                              0
                              (caml-make-regular-1 #t x2)))
                          (begin
                            (caml-constr-set-field!
                              x2
                              1
                              (caml-constr-get-field x3 1))
                            (caml-constr-set-field!
                              (caml-constr-get-field x4 0)
                              0
                              (caml-make-regular-1 #t x3))))))
                     (else (staticfail1006)))))
                (else (staticfail1003)))))))))
 (begin
    (define (unify_list_205@types x1)
      (labels
        ((staticfail1007 () (caml-raise 'Unify_1@types)))
        (if (null? (caml-constr-get-field x1 0))
          (if (null? (caml-constr-get-field x1 1))
            #f
            (staticfail1007))
          (if (null? (caml-constr-get-field x1 1))
            (staticfail1007)
            (begin
              (unify_210@types
                (caml-make-regular-2
                  #f
                  (car (caml-constr-get-field x1 0))
                  (car (caml-constr-get-field x1 1))))
              (unify_list_205@types
                (caml-make-regular-2
                  #f
                  (cdr (caml-constr-get-field x1 0))
                  (cdr (caml-constr-get-field x1 1)))))))))
   (begin
      (define (unify_expand_248@types x1)
        (lambda (x2)
           (2-182-unify_expand_248@types x1 x2)))
     (define (2-182-unify_expand_248@types x1 x2)
        (let ((x3 (caml-make-regular-2
                    #f
                    (caml-constr-get-field x1 0)
                    (caml-constr-get-field x2 0))))
          (labels
            ((staticfail1010
               ()
               (labels
                 ((staticfail1011 () (caml-raise 'Unify_1@types)))
                 (case (if (caml-constant-constr?
                             (caml-constr-get-field x3 1))
                         -1
                         (caml-regular-constr-tag
                           (caml-constr-get-field x3 1)))
                   ((4)
                    (case (if (caml-constant-constr?
                                (caml-constr-get-field
                                  (caml-constr-get-field
                                    (caml-constr-get-field
                                      (caml-constr-get-field x3 1)
                                      0)
                                    1)
                                  2))
                            -1
                            (caml-regular-constr-tag
                              (caml-constr-get-field
                                (caml-constr-get-field
                                  (caml-constr-get-field
                                    (caml-constr-get-field x3 1)
                                    0)
                                  1)
                                2)))
                      ((2)
                       (let ((x4 (caml-constr-get-field
                                   (caml-constr-get-field
                                     (caml-constr-get-field
                                       (caml-constr-get-field
                                         (caml-constr-get-field x3 1)
                                         0)
                                       1)
                                     2)
                                   0))
                             (x5 (caml-constr-get-field
                                   (caml-constr-get-field
                                     (caml-constr-get-field
                                       (caml-constr-get-field
                                         (caml-constr-get-field x3 1)
                                         0)
                                       1)
                                     2)
                                   1)))
                         (unify_210@types
                           (caml-make-regular-2
                             #f
                             x1
                             (3-140-expand_abbrev_242@types
                               x4
                               x5
                               (caml-constr-get-field
                                 (caml-constr-get-field x3 1)
                                 1))))))
                      (else (staticfail1011))))
                   (else (staticfail1011))))))
            (case (if (caml-constant-constr?
                        (caml-constr-get-field x3 0))
                    -1
                    (caml-regular-constr-tag
                      (caml-constr-get-field x3 0)))
              ((4)
               (case (if (caml-constant-constr?
                           (caml-constr-get-field
                             (caml-constr-get-field
                               (caml-constr-get-field
                                 (caml-constr-get-field x3 0)
                                 0)
                               1)
                             2))
                       -1
                       (caml-regular-constr-tag
                         (caml-constr-get-field
                           (caml-constr-get-field
                             (caml-constr-get-field
                               (caml-constr-get-field x3 0)
                               0)
                             1)
                           2)))
                 ((2)
                  (let ((x4 (caml-constr-get-field
                              (caml-constr-get-field
                                (caml-constr-get-field
                                  (caml-constr-get-field
                                    (caml-constr-get-field x3 0)
                                    0)
                                  1)
                                2)
                              0))
                        (x5 (caml-constr-get-field
                              (caml-constr-get-field
                                (caml-constr-get-field
                                  (caml-constr-get-field
                                    (caml-constr-get-field x3 0)
                                    0)
                                  1)
                                2)
                              1)))
                    (unify_210@types
                      (caml-make-regular-2
                        #f
                        (3-140-expand_abbrev_242@types
                          x4
                          x5
                          (caml-constr-get-field
                            (caml-constr-get-field x3 0)
                            1))
                        x2))))
                 (else (staticfail1010))))
              (else (staticfail1010))))))
)))

(define (filter_arrow_178@types x1)
  (let ((x2 (type_repr_76@types x1)))
    (labels
      ((staticfail1012 () (caml-raise 'Unify_1@types)))
      (case (if (caml-constant-constr?
                  (caml-constr-get-field x2 0))
              -1
              (caml-regular-constr-tag
                (caml-constr-get-field x2 0)))
        ((1)
         (let ((x3 (caml-constr-get-field
                     (caml-constr-get-field x2 0)
                     0))
               (x4 (caml-constr-get-field x2 1)))
           (let ((x5 (caml-make-regular-2
                       #f
                       (caml-make-regular-1 #f #f)
                       x4))
                 (x6 (caml-make-regular-2
                       #f
                       (caml-make-regular-1 #f #f)
                       x4)))
             (begin
               (caml-constr-set-field!
                 (caml-constr-get-field x2 0)
                 0
                 (caml-make-regular-1
                   #t
                   (caml-make-regular-2
                     #f
                     (caml-make-regular-2 #t x5 x6)
                     notgeneric_227@globals)))
               (caml-make-regular-2 #f x5 x6)))))
        ((2)
         (caml-make-regular-2
           #f
           (caml-constr-get-field
             (caml-constr-get-field x2 0)
             0)
           (caml-constr-get-field
             (caml-constr-get-field x2 0)
             1)))
        ((4)
         (case (if (caml-constant-constr?
                     (caml-constr-get-field
                       (caml-constr-get-field
                         (caml-constr-get-field
                           (caml-constr-get-field x2 0)
                           0)
                         1)
                       2))
                 -1
                 (caml-regular-constr-tag
                   (caml-constr-get-field
                     (caml-constr-get-field
                       (caml-constr-get-field
                         (caml-constr-get-field x2 0)
                         0)
                       1)
                     2)))
           ((2)
            (let ((x3 (caml-constr-get-field
                        (caml-constr-get-field
                          (caml-constr-get-field
                            (caml-constr-get-field
                              (caml-constr-get-field x2 0)
                              0)
                            1)
                          2)
                        0))
                  (x4 (caml-constr-get-field
                        (caml-constr-get-field
                          (caml-constr-get-field
                            (caml-constr-get-field
                              (caml-constr-get-field x2 0)
                              0)
                            1)
                          2)
                        1)))
              (filter_arrow_178@types
                (3-140-expand_abbrev_242@types
                  x3
                  x4
                  (caml-constr-get-field
                    (caml-constr-get-field x2 0)
                    1)))))
           (else (staticfail1012))))
        (else (staticfail1012))))))


(begin
  (define (filter_product_179@types x1)
    (lambda (x2)
       (2-131-filter_product_179@types x1 x2)))
 (define (2-131-filter_product_179@types x1 x2)
    (let ((x3 (type_repr_76@types x2)))
      (labels
        ((staticfail1014 () (caml-raise 'Unify_1@types)))
        (case (if (caml-constant-constr?
                    (caml-constr-get-field x3 0))
                -1
                (caml-regular-constr-tag
                  (caml-constr-get-field x3 0)))
          ((1)
           (let ((x4 (caml-constr-get-field
                       (caml-constr-get-field x3 0)
                       0))
                 (x5 (caml-constr-get-field x3 1)))
             (let ((x6 (2-17-type_var_list_201@types x1 x5)))
               (begin
                 (caml-constr-set-field!
                   (caml-constr-get-field x3 0)
                   0
                   (caml-make-regular-1
                     #t
                     (caml-make-regular-2
                       #f
                       (caml-make-regular-1 #unspecified x6)
                       notgeneric_227@globals)))
                 x6))))
          ((3)
           (if (eq? (list_length_112@list
                      (caml-constr-get-field
                        (caml-constr-get-field x3 0)
                        0))
                    x1)
             (caml-constr-get-field
               (caml-constr-get-field x3 0)
               0)
             (caml-raise 'Unify_1@types)))
          ((4)
           (case (if (caml-constant-constr?
                       (caml-constr-get-field
                         (caml-constr-get-field
                           (caml-constr-get-field
                             (caml-constr-get-field x3 0)
                             0)
                           1)
                         2))
                   -1
                   (caml-regular-constr-tag
                     (caml-constr-get-field
                       (caml-constr-get-field
                         (caml-constr-get-field
                           (caml-constr-get-field x3 0)
                           0)
                         1)
                       2)))
             ((2)
              (let ((x4 (caml-constr-get-field
                          (caml-constr-get-field
                            (caml-constr-get-field
                              (caml-constr-get-field
                                (caml-constr-get-field x3 0)
                                0)
                              1)
                            2)
                          0))
                    (x5 (caml-constr-get-field
                          (caml-constr-get-field
                            (caml-constr-get-field
                              (caml-constr-get-field
                                (caml-constr-get-field x3 0)
                                0)
                              1)
                            2)
                          1)))
                (2-131-filter_product_179@types
                  x1
                  (3-140-expand_abbrev_242@types
                    x4
                    x5
                    (caml-constr-get-field
                      (caml-constr-get-field x3 0)
                      1)))))
             (else (staticfail1014))))
          (else (staticfail1014))))))
)

(begin
  (define (filter_45@types x1)
    (if (eq? (caml-constr-get-field x1 0)
             (caml-constr-get-field x1 1))
      #f
      (let ((x2 (type_repr_76@types (caml-constr-get-field x1 0)))
            (x3 (type_repr_76@types (caml-constr-get-field x1 1))))
        (if (eq? x2 x3)
          #f
          (let ((x4 (caml-make-regular-2
                      #f
                      (caml-constr-get-field x2 0)
                      (caml-constr-get-field x3 0))))
            (labels
              ((staticfail1015
                 ()
                 ((filter_expand_93@types x2) x3)))
              (case (caml-regular-constr-tag
                      (caml-constr-get-field x4 0))
                ((1)
                 (labels
                   ((staticfail1016
                      ()
                      (let ((x5 (caml-constr-get-field
                                  (caml-constr-get-field x4 0)
                                  0)))
                        (begin
                          (if (eq? (caml-constr-get-field x2 1)
                                   generic_255@globals)
                            (caml-raise 'Unify_1@types)
                            #f)
                          (begin
                            (3-212-occur_check_55@types
                              (caml-constr-get-field x2 1)
                              x2
                              x3)
                            (caml-constr-set-field!
                              (caml-constr-get-field x4 0)
                              0
                              (caml-make-regular-1 #t x3)))))))
                   (case (if (caml-constant-constr?
                               (caml-constr-get-field x4 1))
                           -1
                           (caml-regular-constr-tag
                             (caml-constr-get-field x4 1)))
                     ((1)
                      (let ((x5 (caml-constr-get-field
                                  (caml-constr-get-field x4 0)
                                  0))
                            (x6 (caml-constr-get-field
                                  (caml-constr-get-field x4 1)
                                  0)))
                        (begin
                          (if (eq? (caml-constr-get-field x2 1)
                                   generic_255@globals)
                            (caml-raise 'Unify_1@types)
                            #f)
                          (caml-constr-set-field!
                            (caml-constr-get-field x4 0)
                            0
                            (caml-make-regular-1 #t x3)))))
                     (else (staticfail1016)))))
                ((2)
                 (case (if (caml-constant-constr?
                             (caml-constr-get-field x4 1))
                         -1
                         (caml-regular-constr-tag
                           (caml-constr-get-field x4 1)))
                   ((2)
                    (begin
                      (filter_45@types
                        (caml-make-regular-2
                          #f
                          (caml-constr-get-field
                            (caml-constr-get-field x4 0)
                            0)
                          (caml-constr-get-field
                            (caml-constr-get-field x4 1)
                            0)))
                      (filter_45@types
                        (caml-make-regular-2
                          #f
                          (caml-constr-get-field
                            (caml-constr-get-field x4 0)
                            1)
                          (caml-constr-get-field
                            (caml-constr-get-field x4 1)
                            1)))))
                   (else (staticfail1015))))
                ((3)
                 (case (if (caml-constant-constr?
                             (caml-constr-get-field x4 1))
                         -1
                         (caml-regular-constr-tag
                           (caml-constr-get-field x4 1)))
                   ((3)
                    (filter_list_174@types
                      (caml-make-regular-2
                        #f
                        (caml-constr-get-field
                          (caml-constr-get-field x4 0)
                          0)
                        (caml-constr-get-field
                          (caml-constr-get-field x4 1)
                          0))))
                   (else (staticfail1015))))
                (else
                 (case (if (caml-constant-constr?
                             (caml-constr-get-field x4 1))
                         -1
                         (caml-regular-constr-tag
                           (caml-constr-get-field x4 1)))
                   ((4)
                    (if (2-180-same_type_constr_63@types
                          (caml-constr-get-field
                            (caml-constr-get-field x4 0)
                            0)
                          (caml-constr-get-field
                            (caml-constr-get-field x4 1)
                            0))
                      (filter_list_174@types
                        (caml-make-regular-2
                          #f
                          (caml-constr-get-field
                            (caml-constr-get-field x4 0)
                            1)
                          (caml-constr-get-field
                            (caml-constr-get-field x4 1)
                            1)))
                      ((filter_expand_93@types x2) x3)))
                   (else (staticfail1015)))))))))))
 (begin
    (define (filter_list_174@types x1)
      (labels
        ((staticfail1017 () (caml-raise 'Unify_1@types)))
        (if (null? (caml-constr-get-field x1 0))
          (if (null? (caml-constr-get-field x1 1))
            #f
            (staticfail1017))
          (if (null? (caml-constr-get-field x1 1))
            (staticfail1017)
            (begin
              (filter_45@types
                (caml-make-regular-2
                  #f
                  (car (caml-constr-get-field x1 0))
                  (car (caml-constr-get-field x1 1))))
              (filter_list_174@types
                (caml-make-regular-2
                  #f
                  (cdr (caml-constr-get-field x1 0))
                  (cdr (caml-constr-get-field x1 1)))))))))
   (begin
      (define (filter_expand_93@types x1)
        (lambda (x2)
           (2-249-filter_expand_93@types x1 x2)))
     (define (2-249-filter_expand_93@types x1 x2)
        (let ((x3 (caml-make-regular-2
                    #f
                    (caml-constr-get-field x1 0)
                    (caml-constr-get-field x2 0))))
          (labels
            ((staticfail1020
               ()
               (labels
                 ((staticfail1021 () (caml-raise 'Unify_1@types)))
                 (case (if (caml-constant-constr?
                             (caml-constr-get-field x3 1))
                         -1
                         (caml-regular-constr-tag
                           (caml-constr-get-field x3 1)))
                   ((4)
                    (case (if (caml-constant-constr?
                                (caml-constr-get-field
                                  (caml-constr-get-field
                                    (caml-constr-get-field
                                      (caml-constr-get-field x3 1)
                                      0)
                                    1)
                                  2))
                            -1
                            (caml-regular-constr-tag
                              (caml-constr-get-field
                                (caml-constr-get-field
                                  (caml-constr-get-field
                                    (caml-constr-get-field x3 1)
                                    0)
                                  1)
                                2)))
                      ((2)
                       (let ((x4 (caml-constr-get-field
                                   (caml-constr-get-field
                                     (caml-constr-get-field
                                       (caml-constr-get-field
                                         (caml-constr-get-field x3 1)
                                         0)
                                       1)
                                     2)
                                   0))
                             (x5 (caml-constr-get-field
                                   (caml-constr-get-field
                                     (caml-constr-get-field
                                       (caml-constr-get-field
                                         (caml-constr-get-field x3 1)
                                         0)
                                       1)
                                     2)
                                   1)))
                         (filter_45@types
                           (caml-make-regular-2
                             #f
                             x1
                             (3-140-expand_abbrev_242@types
                               x4
                               x5
                               (caml-constr-get-field
                                 (caml-constr-get-field x3 1)
                                 1))))))
                      (else (staticfail1021))))
                   (else (staticfail1021))))))
            (case (if (caml-constant-constr?
                        (caml-constr-get-field x3 0))
                    -1
                    (caml-regular-constr-tag
                      (caml-constr-get-field x3 0)))
              ((4)
               (case (if (caml-constant-constr?
                           (caml-constr-get-field
                             (caml-constr-get-field
                               (caml-constr-get-field
                                 (caml-constr-get-field x3 0)
                                 0)
                               1)
                             2))
                       -1
                       (caml-regular-constr-tag
                         (caml-constr-get-field
                           (caml-constr-get-field
                             (caml-constr-get-field
                               (caml-constr-get-field x3 0)
                               0)
                             1)
                           2)))
                 ((2)
                  (let ((x4 (caml-constr-get-field
                              (caml-constr-get-field
                                (caml-constr-get-field
                                  (caml-constr-get-field
                                    (caml-constr-get-field x3 0)
                                    0)
                                  1)
                                2)
                              0))
                        (x5 (caml-constr-get-field
                              (caml-constr-get-field
                                (caml-constr-get-field
                                  (caml-constr-get-field
                                    (caml-constr-get-field x3 0)
                                    0)
                                  1)
                                2)
                              1)))
                    (filter_45@types
                      (caml-make-regular-2
                        #f
                        (3-140-expand_abbrev_242@types
                          x4
                          x5
                          (caml-constr-get-field
                            (caml-constr-get-field x3 0)
                            1))
                        x2))))
                 (else (staticfail1020))))
              (else (staticfail1020))))))
)))

(define (arity_247@types x1)
  (let ((x2 (caml-constr-get-field x1 0)))
    (labels
      ((staticfail1022 () 0))
      (case (if (caml-constant-constr? x2)
              -1
              (caml-regular-constr-tag x2))
        ((2)
         (+fx 1
              (arity_247@types (caml-constr-get-field x2 1))))
        (else (staticfail1022))))))


