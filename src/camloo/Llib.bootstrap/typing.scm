;; Le module 
(module
  __caml_typing
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_globals
    __caml_syntax
    __caml_builtins
    __caml_modules
    __caml_types
    __caml_errors
    __caml_ty_error
    __caml_location)
  (export
    type_expr_vars_91@typing
    (reset_type_expression_vars_117@typing x1)
    (bind_type_expression_vars_163@typing x1)
    (type_of_type_expression_43@typing x1)
    (2-128-type_of_type_expression_43@typing x1 x2)
    (type_of_atomic_constant_208@typing x1)
    (type_of_structured_constant_211@typing x1)
    (unify_pat_151@typing x1)
    (3-163-unify_pat_151@typing x1 x2 x3)
    (tpat_93@typing x1)
    (tpat_list_169@typing x1)
    (2-133-tpat_93@typing x1 x2)
    (3-179-tpat_list_169@typing x1 x2 x3)
    type_pattern_171@typing
    type_pattern_list_224@typing
    type_pattern_list2_96@typing
    (unify_expr_226@typing x1)
    (3-167-unify_expr_226@typing x1 x2 x3)
    (type_expr_246@typing x1)
    (type_let_decl_121@typing x1)
    (type_statement_186@typing x1)
    (2-209-type_expr_246@typing x1 a1037)
    (3-190-type_let_decl_121@typing x1 x2 x3)
    (2-185-type_statement_186@typing x1 x2)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define type_expr_vars_91@typing (make-cell '()))

(define (reset_type_expression_vars_117@typing x1)
  (cell-set! type_expr_vars_91@typing '()))


(define (bind_type_expression_vars_163@typing x1)
  (begin
    (cell-set! type_expr_vars_91@typing '())
    ((map_118@list
       (lambda (x2)
          (if ((mem_assoc_189@list x2)
               (cell-ref type_expr_vars_91@typing))
            (failwith_217@exc "bind_type_expression_vars")
            (let ((x3 (new_type_var_196@types #f)))
              (begin
                (cell-set!
                  type_expr_vars_91@typing
                  (cons (caml-make-regular-2 #f x2 x3)
                        (cell-ref type_expr_vars_91@typing)))
                x3)))))
     x1)))


(begin
  (define (type_of_type_expression_43@typing x1)
    (lambda (x2)
       (2-128-type_of_type_expression_43@typing x1 x2)))
 (define (2-128-type_of_type_expression_43@typing x1 x2)
    (letrec ((x3 (lambda (x4)
                    (case (caml-regular-constr-tag
                            (caml-constr-get-field x4 0))
                      ((1)
                       (with-handler
                         (lambda (x5)
                            (labels
                              ((staticfail1001 () (caml-raise x5)))
                              (case (caml-extensible-constr-tag x5)
                                ((Not_found_4@exc)
                                 (if x1
                                   (2-57-unbound_type_var_err_210@ty_error
                                     (caml-constr-get-field
                                       (caml-constr-get-field x4 0)
                                       0)
                                     x2)
                                   (let ((x6 (new_type_var_196@types #f)))
                                     (begin
                                       (cell-set!
                                         type_expr_vars_91@typing
                                         (cons (caml-make-regular-2
                                                 #f
                                                 (caml-constr-get-field
                                                   (caml-constr-get-field x4 0)
                                                   0)
                                                 x6)
                                               (cell-ref
                                                 type_expr_vars_91@typing)))
                                       x6))))
                                (else (staticfail1001)))))
                         (unwind-protect
                           (begin
                             (push-exception-handler)
                             ((assoc_252@list
                                (caml-constr-get-field
                                  (caml-constr-get-field x4 0)
                                  0))
                              (cell-ref type_expr_vars_91@typing)))
                           (pop-exception-handler))))
                      ((2)
                       (type_arrow_66@builtins
                         (caml-make-regular-2
                           #f
                           (x3 (caml-constr-get-field
                                 (caml-constr-get-field x4 0)
                                 0))
                           (x3 (caml-constr-get-field
                                 (caml-constr-get-field x4 0)
                                 1)))))
                      ((3)
                       (type_product_184@builtins
                         ((map_118@list x3)
                          (caml-constr-get-field
                            (caml-constr-get-field x4 0)
                            0))))
                      (else
                       (let ((x5 (with-handler
                                   (lambda (x5)
                                      (labels
                                        ((staticfail1003 () (caml-raise x5)))
                                        (case (caml-extensible-constr-tag x5)
                                          ((Desc_not_found_1@modules)
                                           (3-182-unbound_err_215@errors
                                             "Type constructor"
                                             (caml-constr-get-field
                                               (caml-constr-get-field x4 0)
                                               0)
                                             (caml-constr-get-field x4 1)))
                                          (else (staticfail1003)))))
                                   (unwind-protect
                                     (begin
                                       (push-exception-handler)
                                       (find_type_desc_221@modules
                                         (caml-constr-get-field
                                           (caml-constr-get-field x4 0)
                                           0)))
                                     (pop-exception-handler)))))
                         (begin
                           (if ((lambda (x y) (not (eq? x y)))
                                (list_length_112@list
                                  (caml-constr-get-field
                                    (caml-constr-get-field x4 0)
                                    1))
                                (caml-constr-get-field
                                  (caml-constr-get-field x5 1)
                                  1))
                             (3-205-type_arity_err_104@ty_error
                               x5
                               (caml-constr-get-field
                                 (caml-constr-get-field x4 0)
                                 1)
                               (caml-constr-get-field x4 1))
                             #f)
                           (caml-make-regular-2
                             #f
                             (caml-make-regular-2
                               #u0000
                               (caml-constr-get-field
                                 (caml-constr-get-field x5 1)
                                 0)
                               ((map_118@list x3)
                                (caml-constr-get-field
                                  (caml-constr-get-field x4 0)
                                  1)))
                             notgeneric_227@globals))))))))
      (x3 x2)))
)

(define (type_of_atomic_constant_208@typing x1)
  (case (caml-regular-constr-tag x1)
    ((1) type_int_120@builtins)
    ((2) type_float_74@builtins)
    ((3) type_string_24@builtins)
    (else type_char_168@builtins)))


(define (type_of_structured_constant_211@typing x1)
  (case (caml-regular-constr-tag x1)
    ((1)
     (type_of_atomic_constant_208@typing
       (caml-constr-get-field x1 0)))
    (else
     (fatal_error_193@misc
       "type_of_structured_constant"))))


(begin
  (define (unify_pat_151@typing x1)
    (lambda (x2)
       (lambda (x3)
          (3-163-unify_pat_151@typing x1 x2 x3))))
 (define (3-163-unify_pat_151@typing x1 x2 x3)
    (with-handler
      (lambda (x4)
         (labels
           ((staticfail1005 () (caml-raise x4)))
           (case (caml-extensible-constr-tag x4)
             ((Unify_1@types)
              (((pat_wrong_type_err_97@ty_error x1) x3) x2))
             (else (staticfail1005)))))
      (unwind-protect
        (begin
          (push-exception-handler)
          (unify_210@types (caml-make-regular-2 #f x2 x3)))
        (pop-exception-handler))))
)

(begin
  (begin
    (define (tpat_93@typing x1)
      (lambda (x2) (2-133-tpat_93@typing x1 x2)))
   (define (2-133-tpat_93@typing x1 x2)
      (let ((x3 (caml-constr-get-field
                  (caml-constr-get-field x2 0)
                  0)))
        (let ((g1058 x3))
          (cond ((eq? g1058 #f) x1)
                (else
                 (case (caml-regular-constr-tag g1058)
                   ((2)
                    (if ((mem_assoc_189@list (caml-constr-get-field x3 0))
                         x1)
                      (2-228-non_linear_pattern_err_245@ty_error
                        (caml-constr-get-field x2 0)
                        (caml-constr-get-field x3 0))
                      (cons (caml-make-regular-2
                              #f
                              (caml-constr-get-field x3 0)
                              (caml-make-regular-2
                                #f
                                (caml-constr-get-field x2 1)
                                (caml-constr-get-field x2 2)))
                            x1)))
                   ((3)
                    (if ((mem_assoc_189@list (caml-constr-get-field x3 1))
                         x1)
                      (2-228-non_linear_pattern_err_245@ty_error
                        (caml-constr-get-field x3 0)
                        (caml-constr-get-field x3 1))
                      (2-133-tpat_93@typing
                        (cons (caml-make-regular-2
                                #f
                                (caml-constr-get-field x3 1)
                                (caml-make-regular-2
                                  #f
                                  (caml-constr-get-field x2 1)
                                  (caml-constr-get-field x2 2)))
                              x1)
                        (caml-make-regular-3
                          #f
                          (caml-constr-get-field x3 0)
                          (caml-constr-get-field x2 1)
                          (caml-constr-get-field x2 2)))))
                   ((4)
                    (begin
                      (3-163-unify_pat_151@typing
                        (caml-constr-get-field x2 0)
                        (caml-constr-get-field x2 1)
                        (type_of_atomic_constant_208@typing
                          (caml-constr-get-field x3 0)))
                      x1))
                   ((5)
                    (with-handler
                      (lambda (x4)
                         (labels
                           ((staticfail1012 () (caml-raise x4)))
                           (case (caml-extensible-constr-tag x4)
                             ((Unify_1@types)
                              (((pat_wrong_type_err_97@ty_error
                                  (caml-constr-get-field x2 0))
                                (caml-constr-get-field x2 1))
                               (type_product_184@builtins
                                 (new_type_var_list_212@types
                                   (list_length_112@list
                                     (caml-constr-get-field x3 0))))))
                             (else (staticfail1012)))))
                      (unwind-protect
                        (begin
                          (push-exception-handler)
                          (((tpat_list_169@typing x1)
                            (caml-constr-get-field x3 0))
                           (2-131-filter_product_179@types
                             (list_length_112@list
                               (caml-constr-get-field x3 0))
                             (caml-constr-get-field x2 1))))
                        (pop-exception-handler))))
                   ((6)
                    (let ((x4 (caml-constr-get-field
                                (caml-constr-get-field
                                  (caml-constr-get-field x3 0)
                                  1)
                                4)))
                      (labels
                        ((staticfail1013
                           ()
                           (2-170-non_constant_constr_err_198@ty_error
                             (caml-constr-get-field x3 0)
                             (caml-constr-get-field
                               (caml-constr-get-field x2 0)
                               1))))
                        (let ((g1059 x4))
                          (cond ((eq? g1059 #f)
                                 (begin
                                   (3-163-unify_pat_151@typing
                                     (caml-constr-get-field x2 0)
                                     (caml-constr-get-field x2 1)
                                     (type_instance_208@types
                                       (caml-constr-get-field
                                         (caml-constr-get-field
                                           (caml-constr-get-field x3 0)
                                           1)
                                         0)))
                                   x1))
                                (else (staticfail1013)))))))
                   ((7)
                    (let ((x4 (caml-constr-get-field
                                (caml-constr-get-field
                                  (caml-constr-get-field x3 0)
                                  1)
                                4)))
                      (labels
                        ((staticfail1014
                           ()
                           (let ((x5 (type_pair_instance_141@types
                                       (caml-make-regular-2
                                         #f
                                         (caml-constr-get-field
                                           (caml-constr-get-field
                                             (caml-constr-get-field x3 0)
                                             1)
                                           0)
                                         (caml-constr-get-field
                                           (caml-constr-get-field
                                             (caml-constr-get-field x3 0)
                                             1)
                                           1)))))
                             (begin
                               (3-163-unify_pat_151@typing
                                 (caml-constr-get-field x2 0)
                                 (caml-constr-get-field x2 1)
                                 (caml-constr-get-field x5 0))
                               (2-133-tpat_93@typing
                                 x1
                                 (caml-make-regular-3
                                   #f
                                   (caml-constr-get-field x3 1)
                                   (caml-constr-get-field x5 1)
                                   (caml-constr-get-field
                                     (caml-constr-get-field
                                       (caml-constr-get-field x3 0)
                                       1)
                                     2)))))))
                        (let ((g1060 x4))
                          (cond ((eq? g1060 #f)
                                 (2-7-constant_constr_err_151@ty_error
                                   (caml-constr-get-field x3 0)
                                   (caml-constr-get-field
                                     (caml-constr-get-field x2 0)
                                     1)))
                                (else (staticfail1014)))))))
                   ((8)
                    (let ((x4 (free_vars_of_pat_1@syntax
                                (caml-constr-get-field x2 0))))
                      (labels
                        ((staticfail1015
                           ()
                           (orpat_should_be_closed_err_143@ty_error
                             (caml-constr-get-field x2 0))))
                        (if (null? x4)
                          (2-133-tpat_93@typing
                            (2-133-tpat_93@typing
                              x1
                              (caml-make-regular-3
                                #f
                                (caml-constr-get-field x3 0)
                                (caml-constr-get-field x2 1)
                                (caml-constr-get-field x2 2)))
                            (caml-make-regular-3
                              #f
                              (caml-constr-get-field x3 1)
                              (caml-constr-get-field x2 1)
                              (caml-constr-get-field x2 2)))
                          (staticfail1015)))))
                   ((9)
                    (let ((x4 (2-128-type_of_type_expression_43@typing
                                #f
                                (caml-constr-get-field x3 1))))
                      (let ((x5 (2-133-tpat_93@typing
                                  x1
                                  (caml-make-regular-3
                                    #f
                                    (caml-constr-get-field x3 0)
                                    x4
                                    (caml-constr-get-field x2 2)))))
                        (begin
                          (3-163-unify_pat_151@typing
                            (caml-constr-get-field x3 0)
                            (caml-constr-get-field x2 1)
                            x4)
                          x5))))
                   (else
                    (letrec ((x4 (lambda (x5)
                                    (lambda (x6)
                                       (if (null? x6)
                                         x5
                                         (let ((x7 (type_pair_instance_141@types
                                                     (caml-make-regular-2
                                                       #f
                                                       (caml-constr-get-field
                                                         (caml-constr-get-field
                                                           (caml-constr-get-field
                                                             (car x6)
                                                             0)
                                                           1)
                                                         0)
                                                       (caml-constr-get-field
                                                         (caml-constr-get-field
                                                           (caml-constr-get-field
                                                             (car x6)
                                                             0)
                                                           1)
                                                         1)))))
                                           (begin
                                             (3-163-unify_pat_151@typing
                                               (caml-constr-get-field x2 0)
                                               (caml-constr-get-field x2 1)
                                               (caml-constr-get-field x7 0))
                                             ((x4 (2-133-tpat_93@typing
                                                    x5
                                                    (caml-make-regular-3
                                                      #f
                                                      (caml-constr-get-field
                                                        (car x6)
                                                        1)
                                                      (caml-constr-get-field
                                                        x7
                                                        1)
                                                      (caml-constr-get-field
                                                        (caml-constr-get-field
                                                          (caml-constr-get-field
                                                            (car x6)
                                                            0)
                                                          1)
                                                        2))))
                                              (cdr x6)))))))))
                      ((x4 x1) (caml-constr-get-field x3 0))))))))))
)(begin
    (define (tpat_list_169@typing x1)
      (lambda (x2)
         (lambda (x3)
            (3-179-tpat_list_169@typing x1 x2 x3))))
   (define (3-179-tpat_list_169@typing x1 x2 x3)
      (labels
        ((staticfail1017
           ()
           (fatal_error_193@misc
             "type_pattern: arity error")))
        (if (null? x2)
          (if (null? x3) x1 (staticfail1017))
          (if (null? x3)
            (staticfail1017)
            (3-179-tpat_list_169@typing
              (2-133-tpat_93@typing
                x1
                (caml-make-regular-3 #f (car x2) (car x3) #t))
              (cdr x2)
              (cdr x3))))))
))

(begin
  (define type_pattern_171@typing
    (tpat_93@typing '()))
 (begin
    (define type_pattern_list_224@typing
      (tpat_list_169@typing '()))
   (define type_pattern_list2_96@typing
      ((it_list_7@list tpat_93@typing) '()))
))

(begin
  (define (unify_expr_226@typing x1)
    (lambda (x2)
       (lambda (x3)
          (3-167-unify_expr_226@typing x1 x2 x3))))
 (define (3-167-unify_expr_226@typing x1 x2 x3)
    (with-handler
      (lambda (x4)
         (labels
           ((staticfail1019 () (caml-raise x4)))
           (case (caml-extensible-constr-tag x4)
             ((Unify_1@types)
              (((expr_wrong_type_err_214@ty_error x1) x3) x2))
             (else (staticfail1019)))))
      (unwind-protect
        (begin
          (push-exception-handler)
          (unify_210@types (caml-make-regular-2 #f x2 x3)))
        (pop-exception-handler))))
)

(begin
  (begin
    (define (type_expr_246@typing x1)
      (lambda (a1055)
         (2-209-type_expr_246@typing x1 a1055)))
   (define (2-209-type_expr_246@typing x1 a1055)
      (letrec ((x2 (lambda (x4)
                      (let ((x5 (caml-constr-get-field
                                  (caml-constr-get-field x4 0)
                                  0)))
                        (case (caml-regular-constr-tag x5)
                          ((1)
                           (let ((x6 (let ((x6 (cell-ref
                                                 (caml-constr-get-field x5 0))))
                                       (case (caml-regular-constr-tag x6)
                                         ((1)
                                          (type_instance_208@types
                                            (caml-constr-get-field
                                              (caml-constr-get-field
                                                (caml-constr-get-field x6 0)
                                                1)
                                              0)))
                                         (else
                                          (with-handler
                                            (lambda (x7)
                                               (labels
                                                 ((staticfail1041
                                                    ()
                                                    (caml-raise x7)))
                                                 (case (caml-extensible-constr-tag
                                                         x7)
                                                   ((Not_found_4@exc)
                                                    (with-handler
                                                      (lambda (x8)
                                                         (labels
                                                           ((staticfail1043
                                                              ()
                                                              (caml-raise x8)))
                                                           (case (caml-extensible-constr-tag
                                                                   x8)
                                                             ((Desc_not_found_1@modules)
                                                              (3-182-unbound_err_215@errors
                                                                "Variable"
                                                                (caml-make-regular-1
                                                                  #f
                                                                  (caml-constr-get-field
                                                                    x6
                                                                    0))
                                                                (caml-constr-get-field
                                                                  (caml-constr-get-field
                                                                    x4
                                                                    0)
                                                                  1)))
                                                             (else
                                                              (staticfail1043)))))
                                                      (unwind-protect
                                                        (begin
                                                          (push-exception-handler)
                                                          (let ((x8 (find_value_desc_91@modules
                                                                      (caml-make-regular-1
                                                                        #f
                                                                        (caml-constr-get-field
                                                                          x6
                                                                          0)))))
                                                            (begin
                                                              (cell-set!
                                                                (caml-constr-get-field
                                                                  x5
                                                                  0)
                                                                (caml-make-regular-1
                                                                  #f
                                                                  x8))
                                                              (type_instance_208@types
                                                                (caml-constr-get-field
                                                                  (caml-constr-get-field
                                                                    x8
                                                                    1)
                                                                  0)))))
                                                        (pop-exception-handler))))
                                                   (else (staticfail1041)))))
                                            (unwind-protect
                                              (begin
                                                (push-exception-handler)
                                                (let ((x7 ((assoc_252@list
                                                             (caml-constr-get-field
                                                               x6
                                                               0))
                                                           x1)))
                                                  (type_instance_208@types
                                                    (caml-constr-get-field
                                                      x7
                                                      0))))
                                              (pop-exception-handler))))))))
                             (3-167-unify_expr_226@typing
                               (caml-constr-get-field x4 0)
                               (caml-constr-get-field x4 1)
                               x6)))
                          ((2)
                           (3-167-unify_expr_226@typing
                             (caml-constr-get-field x4 0)
                             (caml-constr-get-field x4 1)
                             (type_of_structured_constant_211@typing
                               (caml-constr-get-field x5 0))))
                          ((3)
                           (with-handler
                             (lambda (x6)
                                (labels
                                  ((staticfail1045 () (caml-raise x6)))
                                  (case (caml-extensible-constr-tag x6)
                                    ((Unify_1@types)
                                     (((expr_wrong_type_err_214@ty_error
                                         (caml-constr-get-field x4 0))
                                       (type_product_184@builtins
                                         (new_type_var_list_212@types
                                           (list_length_112@list
                                             (caml-constr-get-field x5 0)))))
                                      (caml-constr-get-field x4 1)))
                                    (else (staticfail1045)))))
                             (unwind-protect
                               (begin
                                 (push-exception-handler)
                                 (x3 (caml-make-regular-2
                                       #f
                                       (caml-constr-get-field x5 0)
                                       (2-131-filter_product_179@types
                                         (list_length_112@list
                                           (caml-constr-get-field x5 0))
                                         (caml-constr-get-field x4 1)))))
                               (pop-exception-handler))))
                          ((4)
                           (let ((x6 (caml-constr-get-field
                                       (caml-constr-get-field
                                         (caml-constr-get-field x5 0)
                                         1)
                                       4)))
                             (labels
                               ((staticfail1046
                                  ()
                                  (2-170-non_constant_constr_err_198@ty_error
                                    (caml-constr-get-field x5 0)
                                    (caml-constr-get-field
                                      (caml-constr-get-field x4 0)
                                      1))))
                               (let ((g1061 x6))
                                 (cond ((eq? g1061 #f)
                                        (3-167-unify_expr_226@typing
                                          (caml-constr-get-field x4 0)
                                          (caml-constr-get-field x4 1)
                                          (type_instance_208@types
                                            (caml-constr-get-field
                                              (caml-constr-get-field
                                                (caml-constr-get-field x5 0)
                                                1)
                                              0))))
                                       (else (staticfail1046)))))))
                          ((5)
                           (let ((x6 (caml-constr-get-field
                                       (caml-constr-get-field
                                         (caml-constr-get-field x5 0)
                                         1)
                                       4)))
                             (labels
                               ((staticfail1047
                                  ()
                                  (let ((x7 (type_pair_instance_141@types
                                              (caml-make-regular-2
                                                #f
                                                (caml-constr-get-field
                                                  (caml-constr-get-field
                                                    (caml-constr-get-field x5 0)
                                                    1)
                                                  0)
                                                (caml-constr-get-field
                                                  (caml-constr-get-field
                                                    (caml-constr-get-field x5 0)
                                                    1)
                                                  1)))))
                                    (begin
                                      (3-167-unify_expr_226@typing
                                        (caml-constr-get-field x4 0)
                                        (caml-constr-get-field x4 1)
                                        (caml-constr-get-field x7 0))
                                      (x2 (caml-make-regular-2
                                            #f
                                            (caml-constr-get-field x5 1)
                                            (caml-constr-get-field x7 1)))))))
                               (let ((g1062 x6))
                                 (cond ((eq? g1062 #f)
                                        (2-7-constant_constr_err_151@ty_error
                                          (caml-constr-get-field x5 0)
                                          (caml-constr-get-field
                                            (caml-constr-get-field x4 0)
                                            1)))
                                       (else (staticfail1047)))))))
                          ((6)
                           (letrec ((x6 (lambda (x7)
                                           (if (null? x7)
                                             (caml-make-regular-2
                                               #f
                                               '()
                                               (caml-constr-get-field x4 1))
                                             (let ((x8 (new_type_var_196@types
                                                         #f))
                                                   (x9 (x6 (cdr x7))))
                                               (caml-make-regular-2
                                                 #f
                                                 (cons x8
                                                       (caml-constr-get-field
                                                         x9
                                                         0))
                                                 (type_arrow_66@builtins
                                                   (caml-make-regular-2
                                                     #f
                                                     x8
                                                     (caml-constr-get-field
                                                       x9
                                                       1)))))))))
                             (let ((x7 (x6 (caml-constr-get-field x5 1))))
                               (begin
                                 (x2 (caml-make-regular-2
                                       #f
                                       (caml-constr-get-field x5 0)
                                       (caml-constr-get-field x7 1)))
                                 (x3 (caml-make-regular-2
                                       #f
                                       (caml-constr-get-field x5 1)
                                       (caml-constr-get-field x7 0)))))))
                          ((7)
                           (2-209-type_expr_246@typing
                             (((type_let_decl_121@typing x1)
                               (caml-constr-get-field x5 0))
                              (caml-constr-get-field x5 1))
                             (caml-make-regular-2
                               #f
                               (caml-constr-get-field x5 2)
                               (caml-constr-get-field x4 1))))
                          ((8)
                           (if (null? (caml-constr-get-field x5 0))
                             (fatal_error_193@misc
                               "type_expr: empty matching")
                             (letrec ((x6 (lambda (x7)
                                             (lambda (x8)
                                                (if (null? x8)
                                                  (caml-make-regular-2
                                                    #f
                                                    '()
                                                    x7)
                                                  (with-handler
                                                    (lambda (x9)
                                                       (labels
                                                         ((staticfail1049
                                                            ()
                                                            (caml-raise x9)))
                                                         (case (caml-extensible-constr-tag
                                                                 x9)
                                                           ((Unify_1@types)
                                                            (((expr_wrong_type_err_214@ty_error
                                                                (caml-constr-get-field
                                                                  x4
                                                                  0))
                                                              (type_arrow_66@builtins
                                                                (caml-make-regular-2
                                                                  #f
                                                                  (new_type_var_196@types
                                                                    #f)
                                                                  (new_type_var_196@types
                                                                    #f))))
                                                             x7))
                                                           (else
                                                            (staticfail1049)))))
                                                    (unwind-protect
                                                      (begin
                                                        (push-exception-handler)
                                                        (let ((x9 (filter_arrow_178@types
                                                                    x7)))
                                                          (let ((x10 ((x6 (caml-constr-get-field
                                                                            x9
                                                                            1))
                                                                      (cdr x8))))
                                                            (caml-make-regular-2
                                                              #f
                                                              (cons (caml-constr-get-field
                                                                      x9
                                                                      0)
                                                                    (caml-constr-get-field
                                                                      x10
                                                                      0))
                                                              (caml-constr-get-field
                                                                x10
                                                                1)))))
                                                      (pop-exception-handler))))))))
                               (let ((x7 ((x6 (caml-constr-get-field x4 1))
                                          (caml-constr-get-field
                                            (car (caml-constr-get-field x5 0))
                                            0))))
                                 (let ((x8 (lambda (x8)
                                              (begin
                                                (if ((lambda (x y)
                                                        (not (eq? x y)))
                                                     (list_length_112@list
                                                       (caml-constr-get-field
                                                         x8
                                                         0))
                                                     (list_length_112@list
                                                       (caml-constr-get-field
                                                         x7
                                                         0)))
                                                  (ill_shaped_match_err_118@ty_error
                                                    (caml-constr-get-field
                                                      x8
                                                      1))
                                                  #f)
                                                (2-209-type_expr_246@typing
                                                  ((@_176@list
                                                     ((type_pattern_list_224@typing
                                                        (caml-constr-get-field
                                                          x8
                                                          0))
                                                      (caml-constr-get-field
                                                        x7
                                                        0)))
                                                   x1)
                                                  (caml-make-regular-2
                                                    #f
                                                    (caml-constr-get-field x8 1)
                                                    (caml-constr-get-field
                                                      x7
                                                      1)))))))
                                   ((do_list_18@list x8)
                                    (caml-constr-get-field x5 0)))))))
                          ((9)
                           (begin
                             (x2 (caml-make-regular-2
                                   #f
                                   (caml-constr-get-field x5 0)
                                   (caml-constr-get-field x4 1)))
                             ((do_list_18@list
                                (lambda (x6)
                                   (2-209-type_expr_246@typing
                                     ((@_176@list
                                        (type_pattern_171@typing
                                          (caml-make-regular-3
                                            #f
                                            (caml-constr-get-field x6 0)
                                            type_exn_242@builtins
                                            #t)))
                                      x1)
                                     (caml-make-regular-2
                                       #f
                                       (caml-constr-get-field x6 1)
                                       (caml-constr-get-field x4 1)))))
                              (caml-constr-get-field x5 1))))
                          ((10)
                           (begin
                             ((type_statement_186@typing x1)
                              (caml-constr-get-field x5 0))
                             (x2 (caml-make-regular-2
                                   #f
                                   (caml-constr-get-field x5 1)
                                   (caml-constr-get-field x4 1)))))
                          ((11)
                           (begin
                             (x2 (caml-make-regular-2
                                   #f
                                   (caml-constr-get-field x5 0)
                                   type_bool_127@builtins))
                             (begin
                               (x2 (caml-make-regular-2
                                     #f
                                     (caml-constr-get-field x5 2)
                                     (caml-constr-get-field x4 1)))
                               (x2 (caml-make-regular-2
                                     #f
                                     (caml-constr-get-field x5 1)
                                     (caml-constr-get-field x4 1))))))
                          ((12)
                           (begin
                             (x2 (caml-make-regular-2
                                   #f
                                   (caml-constr-get-field x5 0)
                                   type_bool_127@builtins))
                             (begin
                               ((type_statement_186@typing x1)
                                (caml-constr-get-field x5 1))
                               (3-167-unify_expr_226@typing
                                 (caml-constr-get-field x4 0)
                                 (caml-constr-get-field x4 1)
                                 type_unit_26@builtins))))
                          ((13)
                           (begin
                             (x2 (caml-make-regular-2
                                   #f
                                   (caml-constr-get-field x5 1)
                                   type_int_120@builtins))
                             (begin
                               (x2 (caml-make-regular-2
                                     #f
                                     (caml-constr-get-field x5 2)
                                     type_int_120@builtins))
                               (begin
                                 ((type_statement_186@typing
                                    (cons (caml-make-regular-2
                                            #f
                                            (caml-constr-get-field x5 0)
                                            (caml-make-regular-2
                                              #f
                                              type_int_120@builtins
                                              #t))
                                          x1))
                                  (caml-constr-get-field x5 4))
                                 (3-167-unify_expr_226@typing
                                   (caml-constr-get-field x4 0)
                                   (caml-constr-get-field x4 1)
                                   type_unit_26@builtins)))))
                          ((15 14)
                           (begin
                             (x2 (caml-make-regular-2
                                   #f
                                   (caml-constr-get-field x5 0)
                                   type_bool_127@builtins))
                             (begin
                               (x2 (caml-make-regular-2
                                     #f
                                     (caml-constr-get-field x5 1)
                                     type_bool_127@builtins))
                               (3-167-unify_expr_226@typing
                                 (caml-constr-get-field x4 0)
                                 (caml-constr-get-field x4 1)
                                 type_bool_127@builtins))))
                          ((16)
                           (let ((x6 (2-128-type_of_type_expression_43@typing
                                       #f
                                       (caml-constr-get-field x5 1))))
                             (begin
                               (x2 (caml-make-regular-2
                                     #f
                                     (caml-constr-get-field x5 0)
                                     x6))
                               (3-167-unify_expr_226@typing
                                 (caml-constr-get-field x4 0)
                                 (caml-constr-get-field x4 1)
                                 x6))))
                          ((17)
                           (let ((x6 (new_type_var_196@types #f)))
                             (let ((x7 (type_vect_74@builtins x6)))
                               (begin
                                 (3-167-unify_expr_226@typing
                                   (caml-constr-get-field x4 0)
                                   (caml-constr-get-field x4 1)
                                   x7)
                                 ((do_list_18@list
                                    (lambda (x8)
                                       (x2 (caml-make-regular-2 #f x8 x6))))
                                  (caml-constr-get-field x5 0))))))
                          ((18)
                           (with-handler
                             (lambda (x6)
                                (labels
                                  ((staticfail1051 () (caml-raise x6)))
                                  (case (caml-extensible-constr-tag x6)
                                    ((Not_found_4@exc)
                                     (3-182-unbound_err_215@errors
                                       "The local variable"
                                       (caml-make-regular-1
                                         #f
                                         (caml-constr-get-field x5 0))
                                       (caml-constr-get-field
                                         (caml-constr-get-field x4 0)
                                         1)))
                                    (else (staticfail1051)))))
                             (unwind-protect
                               (begin
                                 (push-exception-handler)
                                 (let ((x6 ((assoc_252@list
                                              (caml-constr-get-field x5 0))
                                            x1)))
                                   (let ((g1063 (caml-constr-get-field x6 1)))
                                     (cond ((eq? g1063 #t)
                                            (2-235-not_mutable_err_16@ty_error
                                              (caml-constr-get-field x5 0)
                                              (caml-constr-get-field
                                                (caml-constr-get-field x4 0)
                                                1)))
                                           ((eq? g1063 #f)
                                            (begin
                                              (3-167-unify_expr_226@typing
                                                (caml-constr-get-field x4 0)
                                                (caml-constr-get-field x4 1)
                                                type_unit_26@builtins)
                                              (x2 (caml-make-regular-2
                                                    #f
                                                    (caml-constr-get-field x5 1)
                                                    (type_instance_208@types
                                                      (caml-constr-get-field
                                                        x6
                                                        0))))))
                                           (else #f)))))
                               (pop-exception-handler))))
                          ((19)
                           (begin
                             ((do_list_18@list
                                (lambda (x6)
                                   (let ((x7 (type_pair_instance_141@types
                                               (caml-make-regular-2
                                                 #f
                                                 (caml-constr-get-field
                                                   (caml-constr-get-field
                                                     (caml-constr-get-field
                                                       x6
                                                       0)
                                                     1)
                                                   0)
                                                 (caml-constr-get-field
                                                   (caml-constr-get-field
                                                     (caml-constr-get-field
                                                       x6
                                                       0)
                                                     1)
                                                   1)))))
                                     (begin
                                       (3-167-unify_expr_226@typing
                                         (caml-constr-get-field x4 0)
                                         (caml-constr-get-field x4 1)
                                         (caml-constr-get-field x7 0))
                                       (x2 (caml-make-regular-2
                                             #f
                                             (caml-constr-get-field x6 1)
                                             (caml-constr-get-field x7 1)))))))
                              (caml-constr-get-field x5 0))
                             (let ((x6 (let ((x6 (caml-constr-get-field
                                                   (type_repr_76@types
                                                     (caml-constr-get-field
                                                       x4
                                                       1))
                                                   0)))
                                         (labels
                                           ((staticfail1052
                                              ()
                                              (fatal_error_193@misc
                                                "labels_of_type")))
                                           (case (if (caml-constant-constr? x6)
                                                   -1
                                                   (caml-regular-constr-tag x6))
                                             ((4)
                                              (let ((x7 (caml-constr-get-field
                                                          (caml-constr-get-field
                                                            (type_descr_of_type_constr_139@modules
                                                              (caml-constr-get-field
                                                                x6
                                                                0))
                                                            1)
                                                          2)))
                                                (labels
                                                  ((staticfail1053
                                                     ()
                                                     (fatal_error_193@misc
                                                       "labels_of_type")))
                                                  (case (if (caml-constant-constr?
                                                              x7)
                                                          -1
                                                          (caml-regular-constr-tag
                                                            x7))
                                                    ((3)
                                                     (caml-constr-get-field
                                                       x7
                                                       0))
                                                    (else (staticfail1053))))))
                                             (else (staticfail1052)))))))
                               (let ((x7 ((make_vect_185@vect
                                            (list_length_112@list x6))
                                          #f)))
                                 (begin
                                   ((do_list_18@list
                                      (lambda (x8)
                                         (let ((x9 (caml-constr-get-field
                                                     (caml-constr-get-field
                                                       (caml-constr-get-field
                                                         x8
                                                         0)
                                                       1)
                                                     3)))
                                           (if ((vect_item_124@vect x7) x9)
                                             (3-103-label_err_67@ty_error
                                               " is multiply defined."
                                               (caml-constr-get-field x4 0)
                                               (caml-constr-get-field x8 0))
                                             (((vect_assign_169@vect x7) x9)
                                              #t)))))
                                    (caml-constr-get-field x5 0))
                                   (letrec ((x8 (lambda (x9)
                                                   (lambda (x10)
                                                      (if (null? x10)
                                                        #f
                                                        (if ((vect_item_124@vect
                                                               x7)
                                                             x9)
                                                          ((x8 (+fx x9 1))
                                                           (cdr x10))
                                                          (3-103-label_err_67@ty_error
                                                            " is undefined."
                                                            (caml-constr-get-field
                                                              x4
                                                              0)
                                                            (car x10))))))))
                                     ((x8 0) x6)))))))
                          ((20)
                           (let ((x6 (type_pair_instance_141@types
                                       (caml-make-regular-2
                                         #f
                                         (caml-constr-get-field
                                           (caml-constr-get-field
                                             (caml-constr-get-field x5 1)
                                             1)
                                           0)
                                         (caml-constr-get-field
                                           (caml-constr-get-field
                                             (caml-constr-get-field x5 1)
                                             1)
                                           1)))))
                             (begin
                               (3-167-unify_expr_226@typing
                                 (caml-constr-get-field x4 0)
                                 (caml-constr-get-field x4 1)
                                 (caml-constr-get-field x6 1))
                               (x2 (caml-make-regular-2
                                     #f
                                     (caml-constr-get-field x5 0)
                                     (caml-constr-get-field x6 0))))))
                          ((21)
                           (let ((x6 (type_pair_instance_141@types
                                       (caml-make-regular-2
                                         #f
                                         (caml-constr-get-field
                                           (caml-constr-get-field
                                             (caml-constr-get-field x5 1)
                                             1)
                                           0)
                                         (caml-constr-get-field
                                           (caml-constr-get-field
                                             (caml-constr-get-field x5 1)
                                             1)
                                           1)))))
                             (begin
                               (3-167-unify_expr_226@typing
                                 (caml-constr-get-field x4 0)
                                 (caml-constr-get-field x4 1)
                                 type_unit_26@builtins)
                               (begin
                                 (if (eq? (caml-constr-get-field
                                            (caml-constr-get-field
                                              (caml-constr-get-field x5 1)
                                              1)
                                            2)
                                          #t)
                                   (3-103-label_err_67@ty_error
                                     " is not mutable."
                                     (caml-constr-get-field x4 0)
                                     (caml-constr-get-field x5 1))
                                   #f)
                                 (begin
                                   (x2 (caml-make-regular-2
                                         #f
                                         (caml-constr-get-field x5 0)
                                         (caml-constr-get-field x6 0)))
                                   (x2 (caml-make-regular-2
                                         #f
                                         (caml-constr-get-field x5 2)
                                         (caml-constr-get-field x6 1))))))))
                          ((22)
                           (let ((x6 (new_type_var_196@types #f)))
                             (begin
                               (3-167-unify_expr_226@typing
                                 (caml-constr-get-field x4 0)
                                 (caml-constr-get-field x4 1)
                                 (type_stream_55@builtins x6))
                               ((do_list_18@list
                                  (lambda (x7)
                                     (case (caml-regular-constr-tag x7)
                                       ((1)
                                        (x2 (caml-make-regular-2
                                              #f
                                              (caml-constr-get-field x7 0)
                                              x6)))
                                       (else
                                        (x2 (caml-make-regular-2
                                              #f
                                              (caml-constr-get-field x7 0)
                                              (caml-constr-get-field x4 1)))))))
                                (caml-constr-get-field x5 0)))))
                          (else
                           (let ((x6 (new_type_var_196@types #f)))
                             (let ((x7 (type_stream_55@builtins x6)))
                               (let ((x8 (new_type_var_196@types #f)))
                                 (begin
                                   (3-167-unify_expr_226@typing
                                     (caml-constr-get-field x4 0)
                                     (caml-constr-get-field x4 1)
                                     (type_arrow_66@builtins
                                       (caml-make-regular-2 #f x7 x8)))
                                   (letrec ((x9 (lambda (x10)
                                                   (lambda (x11)
                                                      (if (null? (caml-constr-get-field
                                                                   x11
                                                                   0))
                                                        (2-209-type_expr_246@typing
                                                          ((@_176@list x10) x1)
                                                          (caml-make-regular-2
                                                            #f
                                                            (caml-constr-get-field
                                                              x11
                                                              1)
                                                            x8))
                                                        (case (caml-regular-constr-tag
                                                                (car (caml-constr-get-field
                                                                       x11
                                                                       0)))
                                                          ((1)
                                                           ((x9 (2-133-tpat_93@typing
                                                                  x10
                                                                  (caml-make-regular-3
                                                                    #f
                                                                    (caml-constr-get-field
                                                                      (car (caml-constr-get-field
                                                                             x11
                                                                             0))
                                                                      0)
                                                                    x6
                                                                    #t)))
                                                            (caml-make-regular-2
                                                              #f
                                                              (cdr (caml-constr-get-field
                                                                     x11
                                                                     0))
                                                              (caml-constr-get-field
                                                                x11
                                                                1))))
                                                          ((2)
                                                           (let ((x12 (new_type_var_196@types
                                                                        #f)))
                                                             (begin
                                                               (2-209-type_expr_246@typing
                                                                 ((@_176@list
                                                                    x10)
                                                                  x1)
                                                                 (caml-make-regular-2
                                                                   #f
                                                                   (caml-constr-get-field
                                                                     (car (caml-constr-get-field
                                                                            x11
                                                                            0))
                                                                     0)
                                                                   (type_arrow_66@builtins
                                                                     (caml-make-regular-2
                                                                       #f
                                                                       x7
                                                                       x12))))
                                                               ((x9 (2-133-tpat_93@typing
                                                                      x10
                                                                      (caml-make-regular-3
                                                                        #f
                                                                        (caml-constr-get-field
                                                                          (car (caml-constr-get-field
                                                                                 x11
                                                                                 0))
                                                                          1)
                                                                        x12
                                                                        #t)))
                                                                (caml-make-regular-2
                                                                  #f
                                                                  (cdr (caml-constr-get-field
                                                                         x11
                                                                         0))
                                                                  (caml-constr-get-field
                                                                    x11
                                                                    1))))))
                                                          (else
                                                           ((x9 (cons (caml-make-regular-2
                                                                        #f
                                                                        (caml-constr-get-field
                                                                          (car (caml-constr-get-field
                                                                                 x11
                                                                                 0))
                                                                          0)
                                                                        (caml-make-regular-2
                                                                          #f
                                                                          x7
                                                                          #t))
                                                                      x10))
                                                            (caml-make-regular-2
                                                              #f
                                                              (cdr (caml-constr-get-field
                                                                     x11
                                                                     0))
                                                              (caml-constr-get-field
                                                                x11
                                                                1))))))))))
                                     ((do_list_18@list (x9 '()))
                                      (caml-constr-get-field x5 0))))))))))))
               (x3 (lambda (x4)
                      (labels
                        ((staticfail1054
                           ()
                           (fatal_error_193@misc "texp_list")))
                        (if (null? (caml-constr-get-field x4 0))
                          (if (null? (caml-constr-get-field x4 1))
                            #f
                            (staticfail1054))
                          (if (null? (caml-constr-get-field x4 1))
                            (staticfail1054)
                            (begin
                              (x2 (caml-make-regular-2
                                    #f
                                    (car (caml-constr-get-field x4 0))
                                    (car (caml-constr-get-field x4 1))))
                              (x3 (caml-make-regular-2
                                    #f
                                    (cdr (caml-constr-get-field x4 0))
                                    (cdr (caml-constr-get-field x4 1)))))))))))
        (x2 a1055)))
)(begin
    (begin
      (define (type_let_decl_121@typing x1)
        (lambda (x2)
           (lambda (x3)
              (3-190-type_let_decl_121@typing x1 x2 x3))))
     (define (3-190-type_let_decl_121@typing x1 x2 x3)
        (begin
          (push_type_level_50@types #f)
          (let ((x4 (((list_it_96@list
                        (lambda (x4)
                           (lambda (x5)
                              (let ((x6 (new_type_var_196@types #f)))
                                (caml-make-regular-2
                                  #f
                                  (cons (caml-make-regular-3
                                          #f
                                          (caml-constr-get-field x4 0)
                                          x6
                                          #t)
                                        (caml-constr-get-field x5 0))
                                  (cons (caml-make-regular-2
                                          #f
                                          (caml-constr-get-field x4 1)
                                          x6)
                                        (caml-constr-get-field x5 1)))))))
                      x3)
                     '#(() () #f))))
            (let ((x5 (type_pattern_list2_96@typing
                        (caml-constr-get-field x4 0))))
              (let ((x6 ((@_176@list x5) x1)))
                (begin
                  ((do_list_18@list
                     (type_expr_246@typing (if x2 x6 x1)))
                   (caml-constr-get-field x4 1))
                  (begin
                    (pop_type_level_152@types #f)
                    (begin
                      ((do_list_18@list
                         (lambda (x7)
                            (generalize_type_47@types
                              (caml-constr-get-field
                                (caml-constr-get-field x7 1)
                                0))))
                       x5)
                      x6))))))))
)  (begin
      (define (type_statement_186@typing x1)
        (lambda (x2)
           (2-185-type_statement_186@typing x1 x2)))
     (define (2-185-type_statement_186@typing x1 x2)
        (let ((x3 (new_type_var_196@types #f)))
          (begin
            (2-209-type_expr_246@typing
              x1
              (caml-make-regular-2 #f x2 x3))
            (let ((x4 (caml-constr-get-field (type_repr_76@types x3) 0)))
              (labels
                ((staticfail1057 () #f))
                (case (if (caml-constant-constr? x4)
                        -1
                        (caml-regular-constr-tag x4))
                  ((2)
                   (begin
                     (prerr_location_1@location
                       (caml-constr-get-field x2 1))
                     (begin
                       (prerr_begline_213@misc
                         " Warning: function partially applied.")
                       (prerr_endline2_160@misc ""))))
                  (else (staticfail1057))))))))
)))

