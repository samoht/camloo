;; Le module 
(module
  __caml_ty_decl
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_globals
    __caml_builtins
    __caml_location
    __caml_syntax
    __caml_modules
    __caml_types
    __caml_typing
    __caml_ty_error)
  (export
    (enter_new_variant_138@ty_decl x1)
    (3-138-enter_new_variant_138@ty_decl x1 x2 x3)
    (enter_new_record_14@ty_decl x1)
    (2-175-enter_new_record_14@ty_decl x1 x2)
    (enter_new_abbrev_98@ty_decl x1)
    (enter_new_type_102@ty_decl x1)
    external_types_124@ty_decl
    (define_new_type_147@ty_decl x1)
    (2-220-define_new_type_147@ty_decl x1 x2)
    (type_typedecl_239@ty_decl x1)
    (2-9-type_typedecl_239@ty_decl x1 x2)
    (type_excdecl_123@ty_decl x1)
    (2-255-type_excdecl_123@ty_decl x1 x2)
    (fully_generalize_type_109@ty_decl x1)
    (2-48-fully_generalize_type_109@ty_decl x1 x2)
    (type_valuedecl_23@ty_decl x1)
    (2-220-type_valuedecl_23@ty_decl x1 x2)
    (type_letdef_82@ty_decl x1)
    (3-101-type_letdef_82@ty_decl x1 x2 x3)
    (type_expression_168@ty_decl x1)
    (2-54-type_expression_168@ty_decl x1 x2)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (enter_new_variant_138@ty_decl x1)
    (lambda (x2)
       (lambda (x3)
          (3-138-enter_new_variant_138@ty_decl x1 x2 x3))))
 (define (3-138-enter_new_variant_138@ty_decl x1 x2 x3)
    (let ((x4 (list_length_112@list
                (caml-constr-get-field x3 2))))
      (letrec ((x5 (lambda (x6)
                      (lambda (x7)
                         (if (null? x7)
                           '()
                           (case (caml-regular-constr-tag (car x7))
                             ((1)
                              (let ((x8 (if x1
                                          (caml-make-regular-2
                                            #f
                                            (caml-make-regular-2
                                              #f
                                              (compiled_module_name_64@modules
                                                #f)
                                              (caml-constr-get-field
                                                (car x7)
                                                0))
                                            (new_exc_stamp_188@modules #f))
                                          (caml-make-regular-3
                                            #t
                                            (caml-make-regular-2
                                              #f
                                              (compiled_module_name_64@modules
                                                #f)
                                              (caml-constr-get-field
                                                (car x7)
                                                0))
                                            x6
                                            x4))))
                                (let ((x9 (2-131-defined_global_60@modules
                                            (caml-constr-get-field (car x7) 0)
                                            (caml-make-regular
                                              #f
                                              5
                                              (caml-constr-get-field x3 1)
                                              type_unit_26@builtins
                                              #t
                                              x8
                                              #f))))
                                  (begin
                                    (add_constr_192@modules x9)
                                    (cons x9 ((x5 (+fx x6 1)) (cdr x7)))))))
                             (else
                              (let ((x8 (2-128-type_of_type_expression_43@typing
                                          #t
                                          (caml-constr-get-field (car x7) 1)))
                                    (x9 (if x1
                                          (caml-make-regular-2
                                            #f
                                            (caml-make-regular-2
                                              #f
                                              (compiled_module_name_64@modules
                                                #f)
                                              (caml-constr-get-field
                                                (car x7)
                                                0))
                                            (new_exc_stamp_188@modules #f))
                                          (caml-make-regular-3
                                            #t
                                            (caml-make-regular-2
                                              #f
                                              (compiled_module_name_64@modules
                                                #f)
                                              (caml-constr-get-field
                                                (car x7)
                                                0))
                                            x6
                                            x4))))
                                (let ((x10 (let ((x10 (type_repr_76@types x8)))
                                             (labels
                                               ((staticfail1000 () #t))
                                               (case (if (caml-constant-constr?
                                                           (caml-constr-get-field
                                                             x10
                                                             0))
                                                       -1
                                                       (caml-regular-constr-tag
                                                         (caml-constr-get-field
                                                           x10
                                                           0)))
                                                 ((3)
                                                  (let ((x11 (caml-constr-get-field
                                                               (car x7)
                                                               2)))
                                                    (let ((g1006 x11))
                                                      (cond ((eq? g1006 #t)
                                                             (caml-make-regular-1
                                                               #unspecified
                                                               (list_length_112@list
                                                                 (caml-constr-get-field
                                                                   (caml-constr-get-field
                                                                     x10
                                                                     0)
                                                                   0))))
                                                            ((eq? g1006 #f) #t)
                                                            (else #f)))))
                                                 (else (staticfail1000)))))))
                                  (let ((x11 (2-131-defined_global_60@modules
                                               (caml-constr-get-field
                                                 (car x7)
                                                 0)
                                               (caml-make-regular
                                                 #f
                                                 5
                                                 (caml-constr-get-field x3 1)
                                                 x8
                                                 (caml-constr-get-field
                                                   (car x7)
                                                   2)
                                                 x9
                                                 x10))))
                                    (begin
                                      (add_constr_192@modules x11)
                                      (begin
                                        (if (or (eq? (caml-constr-get-field
                                                       (car x7)
                                                       2)
                                                     #f)
                                                ((lambda (x y) (not (eq? x y)))
                                                 (dangerous_vars_81@types x8)
                                                 '()))
                                          (begin
                                            (caml-constr-set-field!
                                              (caml-constr-get-field
                                                (caml-constr-get-field x3 0)
                                                1)
                                              1
                                              #t)
                                            #f)
                                          #f)
                                        (cons x11
                                              ((x5 (+fx x6 1))
                                               (cdr x7)))))))))))))))
        (let ((x6 ((x5 0) (caml-constr-get-field x3 2))))
          (begin
            (pop_type_level_152@types #f)
            (begin
              (generalize_type_constr_9@types
                (caml-constr-get-field x3 1))
              (begin
                ((do_list_18@list
                   (lambda (x7)
                      (generalize_type_constr_9@types
                        (caml-constr-get-field
                          (caml-constr-get-field x7 1)
                          1))))
                 x6)
                (caml-make-regular-1 #t x6))))))))
)

(begin
  (define (enter_new_record_14@ty_decl x1)
    (lambda (x2)
       (2-175-enter_new_record_14@ty_decl x1 x2)))
 (define (2-175-enter_new_record_14@ty_decl x1 x2)
    (letrec ((x3 (lambda (x4)
                    (lambda (x5)
                       (if (null? x5)
                         '()
                         (let ((x6 (2-128-type_of_type_expression_43@typing
                                     #t
                                     (caml-constr-get-field (car x5) 1))))
                           (let ((x7 (2-131-defined_global_60@modules
                                       (caml-constr-get-field (car x5) 0)
                                       (caml-make-regular-4
                                         #f
                                         (caml-constr-get-field x2 1)
                                         x6
                                         (caml-constr-get-field (car x5) 2)
                                         x4))))
                             (begin
                               (add_label_68@modules x7)
                               (begin
                                 (if (or (eq? (caml-constr-get-field (car x5) 2)
                                              #f)
                                         ((lambda (x y) (not (eq? x y)))
                                          (dangerous_vars_81@types x6)
                                          '()))
                                   (begin
                                     (caml-constr-set-field!
                                       (caml-constr-get-field
                                         (caml-constr-get-field x2 0)
                                         1)
                                       1
                                       #t)
                                     #f)
                                   #f)
                                 (cons x7 ((x3 (+fx x4 1)) (cdr x5))))))))))))
      (let ((x4 ((x3 0) (caml-constr-get-field x2 2))))
        (begin
          (pop_type_level_152@types #f)
          (begin
            (generalize_type_constr_9@types
              (caml-constr-get-field x2 1))
            (begin
              ((do_list_18@list
                 (lambda (x5)
                    (generalize_type_constr_9@types
                      (caml-constr-get-field
                        (caml-constr-get-field x5 1)
                        1))))
               x4)
              (caml-make-regular-1 #unspecified x4)))))))
)

(define (enter_new_abbrev_98@ty_decl x1)
  (let ((x2 (2-128-type_of_type_expression_43@typing
              #t
              (caml-constr-get-field x1 2))))
    (begin
      (pop_type_level_152@types #f)
      (begin
        (generalize_type_constr_9@types x2)
        (begin
          ((do_list_18@list generalize_type_constr_9@types)
           (caml-constr-get-field x1 1))
          (begin
            (caml-constr-set-field!
              (caml-constr-get-field
                (caml-constr-get-field x1 0)
                1)
              2
              (caml-make-regular-2
                #t
                (caml-constr-get-field x1 1)
                x2))
            (caml-make-regular-2
              #u0000
              (caml-constr-get-field x1 1)
              x2)))))))


(define (enter_new_type_102@ty_decl x1)
  (let ((x2 (2-131-defined_global_60@modules
              (caml-constr-get-field x1 0)
              (caml-make-regular-3
                #f
                (new_type_stamp_250@modules #f)
                #f
                #f))))
    (let ((x3 (2-131-defined_global_60@modules
                (caml-constr-get-field x1 0)
                (caml-make-regular-3
                  #f
                  x2
                  (list_length_112@list
                    (caml-constr-get-field x1 1))
                  #f))))
      (begin
        (add_type_46@modules x3)
        (caml-make-regular-3
          #f
          x3
          (caml-constr-get-field x1 1)
          (caml-constr-get-field x1 2))))))


(define external_types_124@ty_decl
  (make-cell '()))


(begin
  (define (define_new_type_147@ty_decl x1)
    (lambda (x2)
       (2-220-define_new_type_147@ty_decl x1 x2)))
 (define (2-220-define_new_type_147@ty_decl x1 x2)
    (begin
      (push_type_level_50@types #f)
      (let ((x3 (with-handler
                  (lambda (x3)
                     (labels
                       ((staticfail1002 () (caml-raise x3)))
                       (case (caml-extensible-constr-tag x3)
                         ((Failure_3@exc)
                          (let ((g1007 (caml-constr-get-field x3 0)))
                            (cond ((string=? g1007 "bind_type_expression_vars")
                                   (duplicate_param_in_type_decl_err_227@ty_error
                                     x1))
                                  (else (staticfail1002)))))
                         (else (staticfail1002)))))
                  (unwind-protect
                    (begin
                      (push-exception-handler)
                      (bind_type_expression_vars_163@typing
                        (caml-constr-get-field x2 1)))
                    (pop-exception-handler)))))
        (let ((x4 (caml-make-regular-2
                    #f
                    (caml-make-regular-2
                      #u0000
                      (caml-constr-get-field
                        (caml-constr-get-field
                          (caml-constr-get-field x2 0)
                          1)
                        0)
                      x3)
                    notgeneric_227@globals)))
          (let ((x5 (let ((x5 (caml-constr-get-field x2 2)))
                      (case (caml-regular-constr-tag x5)
                        ((1)
                         (begin
                           (if (eq? (caml-constr-get-field x5 0) #f)
                             (begin
                               (caml-constr-set-field!
                                 (caml-constr-get-field
                                   (caml-constr-get-field
                                     (caml-constr-get-field
                                       (caml-constr-get-field x2 0)
                                       1)
                                     0)
                                   1)
                                 1
                                 #t)
                               #f)
                             #f)
                           (begin (pop_type_level_152@types #f) #f)))
                        ((2)
                         (3-138-enter_new_variant_138@ty_decl
                           #f
                           x1
                           (caml-make-regular-3
                             #f
                             (caml-constr-get-field
                               (caml-constr-get-field
                                 (caml-constr-get-field x2 0)
                                 1)
                               0)
                             x4
                             (caml-constr-get-field x5 0))))
                        ((3)
                         (2-175-enter_new_record_14@ty_decl
                           x1
                           (caml-make-regular-3
                             #f
                             (caml-constr-get-field
                               (caml-constr-get-field
                                 (caml-constr-get-field x2 0)
                                 1)
                               0)
                             x4
                             (caml-constr-get-field x5 0))))
                        (else
                         (enter_new_abbrev_98@ty_decl
                           (caml-make-regular-3
                             #f
                             (caml-constr-get-field
                               (caml-constr-get-field
                                 (caml-constr-get-field x2 0)
                                 1)
                               0)
                             x3
                             (caml-constr-get-field x5 0))))))))
            (begin
              (caml-constr-set-field!
                (caml-constr-get-field
                  (caml-constr-get-field x2 0)
                  1)
                2
                x5)
              (begin
                (with-handler
                  (lambda (x6)
                     (labels
                       ((staticfail1004 () (caml-raise x6)))
                       (case (caml-extensible-constr-tag x6)
                         ((Not_found_4@exc) #f)
                         (else (staticfail1004)))))
                  (unwind-protect
                    (begin
                      (push-exception-handler)
                      (let ((x6 ((assoc_252@list
                                   (caml-constr-get-field
                                     (caml-constr-get-field
                                       (caml-constr-get-field x2 0)
                                       0)
                                     1))
                                 (cell-ref external_types_124@ty_decl))))
                        (begin
                          (if (or (caml-constr-get-field x6 1)
                                  (caml-constr-get-field x6 2))
                            (2-10-illegal_type_redefinition_102@ty_error
                              x1
                              (caml-constr-get-field x6 0))
                            #f)
                          (begin
                            (caml-constr-set-field! x6 2 #t)
                            (let ((x7 (caml-constr-get-field
                                        (caml-constr-get-field
                                          (caml-constr-get-field x6 0)
                                          1)
                                        0))
                                  (x8 (caml-constr-get-field
                                        (caml-constr-get-field
                                          (caml-constr-get-field x2 0)
                                          1)
                                        0)))
                              (begin
                                (caml-constr-set-field!
                                  (caml-constr-get-field x8 1)
                                  0
                                  (caml-constr-get-field
                                    (caml-constr-get-field x7 1)
                                    0))
                                (caml-constr-set-field!
                                  (caml-constr-get-field x7 1)
                                  2
                                  (caml-constr-get-field
                                    (caml-constr-get-field x8 1)
                                    2))))))))
                    (pop-exception-handler)))
                (caml-make-regular-2 #f x4 x5))))))))
)

(begin
  (define (type_typedecl_239@ty_decl x1)
    (lambda (x2)
       (2-9-type_typedecl_239@ty_decl x1 x2)))
 (define (2-9-type_typedecl_239@ty_decl x1 x2)
    ((map_118@list (define_new_type_147@ty_decl x1))
     ((map_118@list enter_new_type_102@ty_decl) x2)))
)

(begin
  (define (type_excdecl_123@ty_decl x1)
    (lambda (x2)
       (2-255-type_excdecl_123@ty_decl x1 x2)))
 (define (2-255-type_excdecl_123@ty_decl x1 x2)
    (begin
      (push_type_level_50@types #f)
      (begin
        (reset_type_expression_vars_117@typing #f)
        (3-138-enter_new_variant_138@ty_decl
          #t
          x1
          (caml-make-regular-3
            #f
            constr_type_exn_222@builtins
            type_exn_242@builtins
            x2)))))
)

(begin
  (define (fully_generalize_type_109@ty_decl x1)
    (lambda (x2)
       (2-48-fully_generalize_type_109@ty_decl x1 x2)))
 (define (2-48-fully_generalize_type_109@ty_decl x1 x2)
    (begin
      (generalize_type_47@types x2)
      (let ((x3 (free_type_vars_143@types x2)))
        (labels
          ((staticfail1005
             ()
             (3-176-cannot_generalize_err_175@ty_error
               x1
               x3
               x2)))
          (if (null? x3) #f (staticfail1005))))))
)

(begin
  (define (type_valuedecl_23@ty_decl x1)
    (lambda (x2)
       (2-220-type_valuedecl_23@ty_decl x1 x2)))
 (define (2-220-type_valuedecl_23@ty_decl x1 x2)
    (let ((x3 (lambda (x3)
                 (begin
                   (push_type_level_50@types #f)
                   (begin
                     (reset_type_expression_vars_117@typing #f)
                     (let ((x4 (2-128-type_of_type_expression_43@typing
                                 #f
                                 (caml-constr-get-field x3 1))))
                       (begin
                         (pop_type_level_152@types #f)
                         (begin
                           (2-48-fully_generalize_type_109@ty_decl x1 x4)
                           (add_value_24@modules
                             (2-131-defined_global_60@modules
                               (caml-constr-get-field x3 0)
                               (caml-make-regular-2
                                 #f
                                 x4
                                 (caml-constr-get-field x3 2))))))))))))
      ((do_list_18@list x3) x2)))
)

(begin
  (define (type_letdef_82@ty_decl x1)
    (lambda (x2)
       (lambda (x3)
          (3-101-type_letdef_82@ty_decl x1 x2 x3))))
 (define (3-101-type_letdef_82@ty_decl x1 x2 x3)
    (begin
      (push_type_level_50@types #f)
      (let ((x4 (((it_list_7@list
                    (lambda (x4)
                       (lambda (x5)
                          (let ((x6 (new_type_var_196@types #f)))
                            (caml-make-regular-2
                              #f
                              (cons (caml-make-regular-3
                                      #f
                                      (caml-constr-get-field x5 0)
                                      x6
                                      #t)
                                    (caml-constr-get-field x4 0))
                              (cons (caml-make-regular-2
                                      #f
                                      (caml-constr-get-field x5 1)
                                      x6)
                                    (caml-constr-get-field x4 1)))))))
                  '#(() () #f))
                 x3)))
        (let ((x5 (type_pattern_list2_96@typing
                    (caml-constr-get-field x4 0))))
          (let ((x6 (do_list_18@list
                      (lambda (x6)
                         (add_value_24@modules
                           (2-131-defined_global_60@modules
                             (caml-constr-get-field x6 0)
                             (caml-make-regular-2
                               #f
                               (caml-constr-get-field
                                 (caml-constr-get-field x6 1)
                                 0)
                               #f)))))))
            (begin
              (if x2 (x6 x5) #f)
              (begin
                ((do_list_18@list (type_expr_246@typing '()))
                 (caml-constr-get-field x4 1))
                (begin
                  (pop_type_level_152@types #f)
                  (begin
                    ((do_list_18@list
                       (lambda (x7)
                          (2-48-fully_generalize_type_109@ty_decl
                            x1
                            (caml-constr-get-field
                              (caml-constr-get-field x7 1)
                              0))))
                     x5)
                    (begin (if (not x2) (x6 x5) #f) x5))))))))))
)

(begin
  (define (type_expression_168@ty_decl x1)
    (lambda (x2)
       (2-54-type_expression_168@ty_decl x1 x2)))
 (define (2-54-type_expression_168@ty_decl x1 x2)
    (begin
      (push_type_level_50@types #f)
      (let ((x3 (new_type_var_196@types #f)))
        (begin
          (2-209-type_expr_246@typing
            '()
            (caml-make-regular-2 #f x2 x3))
          (begin
            (pop_type_level_152@types #f)
            (begin
              (2-48-fully_generalize_type_109@ty_decl x1 x3)
              x3))))))
)

