;; Le module 
(module
  __caml_ty_intf
  (library camloo-runtime)
  (import
    __caml_const
    __caml_misc
    __caml_globals
    __caml_modules
    __caml_types
    __caml_ty_error
    __caml_ty_decl)
  (export
    (enter_interface_definitions_230@ty_intf x1)
    (check_interface_106@ty_intf x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (enter_interface_definitions_230@ty_intf x1)
  (begin
    (cell-set! external_types_124@ty_decl '())
    (begin
      ((do_table_147@hashtbl
         (lambda (x2)
            (lambda (x3)
               (let ((x4 (let ((x4 (caml-constr-get-field
                                     (caml-constr-get-field x3 1)
                                     2)))
                           (labels
                             ((staticfail1000
                                ()
                                (begin (add_type_46@modules x3) #t)))
                             (let ((g1007 x4))
                               (cond ((eq? g1007 #f) #f)
                                     (else (staticfail1000))))))))
                 (cell-set!
                   external_types_124@ty_decl
                   (cons (caml-make-regular-2
                           #f
                           (caml-constr-get-field
                             (caml-constr-get-field x3 0)
                             1)
                           (caml-make-regular-3 #f x3 x4 #f))
                         (cell-ref external_types_124@ty_decl)))))))
       (types_of_module_132@modules x1))
      (begin
        ((do_table_147@hashtbl
           (lambda (x2)
              (lambda (x3)
                 (let ((x4 (caml-constr-get-field
                             (caml-constr-get-field x3 1)
                             1)))
                   (labels
                     ((staticfail1001 () #f))
                     (case (if (caml-constant-constr? x4)
                             -1
                             (caml-regular-constr-tag x4))
                       ((2) (add_value_24@modules x3))
                       (else (staticfail1001))))))))
         (values_of_module_199@modules x1))
        (begin
          ((do_table_147@hashtbl
             (lambda (x2)
                (lambda (x3) (add_constr_192@modules x3))))
           (constrs_of_module_249@modules x1))
          ((do_table_147@hashtbl
             (lambda (x2)
                (lambda (x3) (add_label_68@modules x3))))
           (labels_of_module_207@modules x1)))))))


(define (check_interface_106@ty_intf x1)
  (let ((x2 (cell-ref defined_module_128@modules)))
    (let ((x3 (lambda (x3)
                 (with-handler
                   (lambda (x4)
                      (labels
                        ((staticfail1005 () (caml-raise x4)))
                        (case (caml-extensible-constr-tag x4)
                          ((Not_found_4@exc)
                           (undefined_value_err_83@ty_error x3))
                          (else (staticfail1005)))))
                   (unwind-protect
                     (begin
                       (push-exception-handler)
                       (let ((x4 ((find_75@hashtbl
                                    (values_of_module_199@modules x2))
                                  (little_name_of_global_209@globals x3))))
                         (with-handler
                           (lambda (x5)
                              (labels
                                ((staticfail1003 () (caml-raise x5)))
                                (case (caml-extensible-constr-tag x5)
                                  ((Unify_1@types)
                                   (2-244-type_mismatch_err_114@ty_error x3 x4))
                                  (else (staticfail1003)))))
                           (unwind-protect
                             (begin
                               (push-exception-handler)
                               (filter_45@types
                                 (caml-make-regular-2
                                   #f
                                   (type_instance_208@types
                                     (caml-constr-get-field
                                       (caml-constr-get-field x4 1)
                                       0))
                                   (caml-constr-get-field
                                     (caml-constr-get-field x3 1)
                                     0))))
                             (pop-exception-handler)))))
                     (pop-exception-handler))))))
      ((do_table_147@hashtbl
         (lambda (x4)
            (lambda (x5)
               (let ((x6 (caml-constr-get-field
                           (caml-constr-get-field x5 1)
                           1)))
                 (labels
                   ((staticfail1006 () #f))
                   (let ((g1008 x6))
                     (cond ((eq? g1008 #f) (x3 x5))
                           (else (staticfail1006)))))))))
       (values_of_module_199@modules x1)))))


