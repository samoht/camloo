;; Le module 
(module
  __caml_par_aux
  (library camloo-runtime)
  (import
    __caml_const
    __caml_misc
    __caml_globals
    __caml_location
    __caml_syntax
    __caml_modules
    __caml_builtins
    __caml_errors)
  (export
    (make_expr_117@par_aux x1)
    (make_pat_240@par_aux x1)
    (make_typ_62@par_aux x1)
    (make_impl_49@par_aux x1)
    (make_intf_179@par_aux x1)
    (make_apply_9@par_aux x1)
    (make_unop_114@par_aux x1)
    (2-34-make_unop_114@par_aux x1 x2)
    (make_binop_209@par_aux x1)
    (3-6-make_binop_209@par_aux x1 x2 x3)
    (make_ternop_133@par_aux x1)
    (4-123-make_ternop_133@par_aux x1 x2 x3 x4)
    (make_list_250@par_aux a1001)
    (make_unary_minus_227@par_aux x1)
    (2-40-make_unary_minus_227@par_aux x1 x2)
    (find_constructor_240@par_aux x1)
    (find_label_181@par_aux x1)
    (expr_constr_or_ident_224@par_aux x1)
    (pat_constr_or_var_232@par_aux x1)
    (make_range_pat_54@par_aux x1)
    (2-133-make_range_pat_54@par_aux x1 x2)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (make_expr_117@par_aux x1)
    (caml-make-regular-2
      #f
      x1
      (get_current_location_179@location #f)))
 (begin
    (define (make_pat_240@par_aux x1)
      (caml-make-regular-2
        #f
        x1
        (get_current_location_179@location #f)))
   (begin
      (define (make_typ_62@par_aux x1)
        (caml-make-regular-2
          #f
          x1
          (get_current_location_179@location #f)))
     (begin
        (define (make_impl_49@par_aux x1)
          (caml-make-regular-2
            #f
            x1
            (get_current_location_179@location #f)))
       (define (make_intf_179@par_aux x1)
          (caml-make-regular-2
            #f
            x1
            (get_current_location_179@location #f)))
))))

(define (make_apply_9@par_aux x1)
  (labels
    ((staticfail1000
       ()
       (make_expr_117@par_aux
         (caml-make-regular-2
           #<0006>
           (caml-constr-get-field x1 0)
           (caml-constr-get-field x1 1)))))
    (case (if (caml-constant-constr?
                (caml-constr-get-field
                  (caml-constr-get-field x1 0)
                  0))
            -1
            (caml-regular-constr-tag
              (caml-constr-get-field
                (caml-constr-get-field x1 0)
                0)))
      ((4)
       (if (null? (caml-constr-get-field x1 1))
         (staticfail1000)
         (if (null? (cdr (caml-constr-get-field x1 1)))
           (make_expr_117@par_aux
             (caml-make-regular-2
               #a000
               (caml-constr-get-field
                 (caml-constr-get-field
                   (caml-constr-get-field x1 0)
                   0)
                 0)
               (car (caml-constr-get-field x1 1))))
           (staticfail1000))))
      (else (staticfail1000)))))


(begin
  (begin
    (define (make_unop_114@par_aux x1)
      (lambda (x2) (2-34-make_unop_114@par_aux x1 x2)))
   (define (2-34-make_unop_114@par_aux x1 x2)
      (let ((x3 (get_current_location_179@location #f)))
        (caml-make-regular-2
          #f
          (caml-make-regular-2
            #<0006>
            (caml-make-regular-2
              #f
              (caml-make-regular-1
                #f
                (make-cell (caml-make-regular-1 #t x1)))
              (caml-make-regular-2
                #f
                (caml-constr-get-field x3 0)
                (caml-constr-get-field
                  (caml-constr-get-field x2 1)
                  0)))
            (cons x2 '()))
          x3)))
)(begin
    (begin
      (define (make_binop_209@par_aux x1)
        (lambda (x2)
           (lambda (x3)
              (3-6-make_binop_209@par_aux x1 x2 x3))))
     (define (3-6-make_binop_209@par_aux x1 x2 x3)
        (make_expr_117@par_aux
          (caml-make-regular-2
            #<0006>
            (caml-make-regular-2
              #f
              (caml-make-regular-1
                #f
                (make-cell (caml-make-regular-1 #t x1)))
              (caml-make-regular-2
                #f
                (caml-constr-get-field
                  (caml-constr-get-field x2 1)
                  1)
                (caml-constr-get-field
                  (caml-constr-get-field x3 1)
                  0)))
            (cons x2 (cons x3 '())))))
)  (begin
      (define (make_ternop_133@par_aux x1)
        (lambda (x2)
           (lambda (x3)
              (lambda (x4)
                 (4-123-make_ternop_133@par_aux x1 x2 x3 x4)))))
     (define (4-123-make_ternop_133@par_aux x1 x2 x3 x4)
        (make_expr_117@par_aux
          (caml-make-regular-2
            #<0006>
            (caml-make-regular-2
              #f
              (caml-make-regular-1
                #f
                (make-cell (caml-make-regular-1 #t x1)))
              (caml-make-regular-2
                #f
                (caml-constr-get-field
                  (caml-constr-get-field x2 1)
                  1)
                (caml-constr-get-field
                  (caml-constr-get-field x3 1)
                  0)))
            (cons x2 (cons x3 (cons x4 '()))))))
)))

(define (make_list_250@par_aux a1001)
  (letrec ((x1 (lambda (x2)
                  (lambda (x3)
                     (if (null? x3)
                       x2
                       ((x1 (make_expr_117@par_aux
                              (caml-make-regular-2
                                #a000
                                constr_cons_77@builtins
                                (make_expr_117@par_aux
                                  (caml-make-regular-1
                                    #unspecified
                                    (cons (car x3) (cons x2 '())))))))
                        (cdr x3)))))))
    ((x1 (make_expr_117@par_aux
           (caml-make-regular-1
             #u0000
             constr_nil_72@builtins)))
     a1001)))


(begin
  (define (make_unary_minus_227@par_aux x1)
    (lambda (x2)
       (2-40-make_unary_minus_227@par_aux x1 x2)))
 (define (2-40-make_unary_minus_227@par_aux x1 x2)
    (labels
      ((staticfail1002
         ()
         (fatal_error_193@misc "make_unary_minus")))
      (let ((g1019 x1))
        (cond ((string=? g1019 "-")
               (labels
                 ((staticfail1003
                    ()
                    (2-34-make_unop_114@par_aux "minus" x2)))
                 (case (if (caml-constant-constr?
                             (caml-constr-get-field x2 0))
                         -1
                         (caml-regular-constr-tag
                           (caml-constr-get-field x2 0)))
                   ((2)
                    (case (if (caml-constant-constr?
                                (caml-constr-get-field
                                  (caml-constr-get-field x2 0)
                                  0))
                            -1
                            (caml-regular-constr-tag
                              (caml-constr-get-field
                                (caml-constr-get-field x2 0)
                                0)))
                      ((1)
                       (case (if (caml-constant-constr?
                                   (caml-constr-get-field
                                     (caml-constr-get-field
                                       (caml-constr-get-field x2 0)
                                       0)
                                     0))
                               -1
                               (caml-regular-constr-tag
                                 (caml-constr-get-field
                                   (caml-constr-get-field
                                     (caml-constr-get-field x2 0)
                                     0)
                                   0)))
                         ((1)
                          (make_expr_117@par_aux
                            (caml-make-regular-1
                              #t
                              (caml-make-regular-1
                                #f
                                (caml-make-regular-1
                                  #f
                                  (negfx (caml-constr-get-field
                                           (caml-constr-get-field
                                             (caml-constr-get-field
                                               (caml-constr-get-field x2 0)
                                               0)
                                             0)
                                           0)))))))
                         ((2)
                          (make_expr_117@par_aux
                            (caml-make-regular-1
                              #t
                              (caml-make-regular-1
                                #f
                                (caml-make-regular-1
                                  #t
                                  (negfl (caml-constr-get-field
                                           (caml-constr-get-field
                                             (caml-constr-get-field
                                               (caml-constr-get-field x2 0)
                                               0)
                                             0)
                                           0)))))))
                         (else (staticfail1003))))
                      (else (staticfail1003))))
                   (else (staticfail1003)))))
              ((string=? g1019 "-.")
               (labels
                 ((staticfail1004
                    ()
                    (2-34-make_unop_114@par_aux "minus_float" x2)))
                 (case (if (caml-constant-constr?
                             (caml-constr-get-field x2 0))
                         -1
                         (caml-regular-constr-tag
                           (caml-constr-get-field x2 0)))
                   ((2)
                    (case (if (caml-constant-constr?
                                (caml-constr-get-field
                                  (caml-constr-get-field x2 0)
                                  0))
                            -1
                            (caml-regular-constr-tag
                              (caml-constr-get-field
                                (caml-constr-get-field x2 0)
                                0)))
                      ((1)
                       (case (if (caml-constant-constr?
                                   (caml-constr-get-field
                                     (caml-constr-get-field
                                       (caml-constr-get-field x2 0)
                                       0)
                                     0))
                               -1
                               (caml-regular-constr-tag
                                 (caml-constr-get-field
                                   (caml-constr-get-field
                                     (caml-constr-get-field x2 0)
                                     0)
                                   0)))
                         ((2)
                          (make_expr_117@par_aux
                            (caml-make-regular-1
                              #t
                              (caml-make-regular-1
                                #f
                                (caml-make-regular-1
                                  #t
                                  (negfl (caml-constr-get-field
                                           (caml-constr-get-field
                                             (caml-constr-get-field
                                               (caml-constr-get-field x2 0)
                                               0)
                                             0)
                                           0)))))))
                         (else (staticfail1004))))
                      (else (staticfail1004))))
                   (else (staticfail1004)))))
              (else (staticfail1002))))))
)

(define (find_constructor_240@par_aux x1)
  (with-handler
    (lambda (x2)
       (labels
         ((staticfail1006 () (caml-raise x2)))
         (case (caml-extensible-constr-tag x2)
           ((Desc_not_found_1@modules)
            (3-182-unbound_err_215@errors
              "Constructor"
              x1
              (get_current_location_179@location #f)))
           (else (staticfail1006)))))
    (unwind-protect
      (begin
        (push-exception-handler)
        (find_constr_desc_181@modules x1))
      (pop-exception-handler))))


(define (find_label_181@par_aux x1)
  (with-handler
    (lambda (x2)
       (labels
         ((staticfail1008 () (caml-raise x2)))
         (case (caml-extensible-constr-tag x2)
           ((Desc_not_found_1@modules)
            (3-182-unbound_err_215@errors
              "Label"
              x1
              (get_current_location_179@location #f)))
           (else (staticfail1008)))))
    (unwind-protect
      (begin
        (push-exception-handler)
        (find_label_desc_109@modules x1))
      (pop-exception-handler))))


(define (expr_constr_or_ident_224@par_aux x1)
  (case (caml-regular-constr-tag x1)
    ((1)
     (with-handler
       (lambda (x2)
          (labels
            ((staticfail1010 () (caml-raise x2)))
            (case (caml-extensible-constr-tag x2)
              ((Desc_not_found_1@modules)
               (make_expr_117@par_aux
                 (caml-make-regular-1
                   #f
                   (make-cell
                     (caml-make-regular-1
                       #t
                       (caml-constr-get-field x1 0))))))
              (else (staticfail1010)))))
       (unwind-protect
         (begin
           (push-exception-handler)
           (make_expr_117@par_aux
             (caml-make-regular-1
               #u0000
               (find_constr_desc_181@modules x1))))
         (pop-exception-handler))))
    (else
     (with-handler
       (lambda (x2)
          (labels
            ((staticfail1014 () (caml-raise x2)))
            (case (caml-extensible-constr-tag x2)
              ((Desc_not_found_1@modules)
               (with-handler
                 (lambda (x3)
                    (labels
                      ((staticfail1016 () (caml-raise x3)))
                      (case (caml-extensible-constr-tag x3)
                        ((Desc_not_found_1@modules)
                         (3-182-unbound_err_215@errors
                           "Value"
                           x1
                           (get_current_location_179@location #f)))
                        (else (staticfail1016)))))
                 (unwind-protect
                   (begin
                     (push-exception-handler)
                     (make_expr_117@par_aux
                       (caml-make-regular-1
                         #f
                         (make-cell
                           (caml-make-regular-1
                             #f
                             (find_value_desc_91@modules x1))))))
                   (pop-exception-handler))))
              (else (staticfail1014)))))
       (unwind-protect
         (begin
           (push-exception-handler)
           (make_expr_117@par_aux
             (caml-make-regular-1
               #u0000
               (find_constr_desc_181@modules x1))))
         (pop-exception-handler))))))


(define (pat_constr_or_var_232@par_aux x1)
  (with-handler
    (lambda (x2)
       (labels
         ((staticfail1018 () (caml-raise x2)))
         (case (caml-extensible-constr-tag x2)
           ((Desc_not_found_1@modules)
            (make_pat_240@par_aux
              (caml-make-regular-1 #t x1)))
           (else (staticfail1018)))))
    (unwind-protect
      (begin
        (push-exception-handler)
        (make_pat_240@par_aux
          (caml-make-regular-1
            #<0006>
            (find_constr_desc_181@modules
              (caml-make-regular-1 #f x1)))))
      (pop-exception-handler))))


(begin
  (define (make_range_pat_54@par_aux x1)
    (lambda (x2)
       (2-133-make_range_pat_54@par_aux x1 x2)))
 (define (2-133-make_range_pat_54@par_aux x1 x2)
    (if (>fx x1 x2)
      (2-133-make_range_pat_54@par_aux x2 x1)
      (if (eq? x1 x2)
        (make_pat_240@par_aux
          (caml-make-regular-1
            #u0000
            (caml-make-regular-1
              #u0000
              (char_of_int_212@char x1))))
        (make_pat_240@par_aux
          (caml-make-regular-2
            #<0008>
            (make_pat_240@par_aux
              (caml-make-regular-1
                #u0000
                (caml-make-regular-1
                  #u0000
                  (char_of_int_212@char x1))))
            (2-133-make_range_pat_54@par_aux (+fx x1 1) x2))))))
)

