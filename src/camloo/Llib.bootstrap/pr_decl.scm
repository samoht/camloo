;; Le module 
(module
  __caml_pr_decl
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_globals
    __caml_pr_type)
  (export
    (print_expr_98@pr_decl x1)
    (print_valdef_178@pr_decl x1)
    (print_constr_decl_48@pr_decl x1)
    (print_label_decl_216@pr_decl x1)
    (print_one_typedecl_224@pr_decl x1)
    (print_typedecl_247@pr_decl x1)
    (print_excdecl_200@pr_decl x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (print_expr_98@pr_decl x1)
  (begin
    (print_string_98@io "(* - : ")
    (begin
      (print_one_type_206@pr_type x1)
      (begin
        (print_endline_197@io " *)")
        (flush std_out_112@io)))))


(define (print_valdef_178@pr_decl x1)
  (begin
    ((do_list_18@list
       (lambda (x2)
          (begin
            (print_string_98@io "value ")
            (begin
              (print_string_98@io (caml-constr-get-field x2 0))
              (begin
                (print_string_98@io " : ")
                (begin
                  (print_one_type_206@pr_type
                    (caml-constr-get-field
                      (caml-constr-get-field x2 1)
                      0))
                  (print_endline_197@io ";;")))))))
     x1)
    (flush std_out_112@io)))


(define (print_constr_decl_48@pr_decl x1)
  (begin
    (print_string_98@io
      (caml-constr-get-field
        (caml-constr-get-field x1 0)
        1))
    (begin
      (let ((x2 (caml-constr-get-field
                  (caml-constr-get-field x1 1)
                  4)))
        (labels
          ((staticfail1000
             ()
             (begin
               (print_string_98@io " of ")
               (begin
                 (let ((x3 (caml-constr-get-field
                             (caml-constr-get-field x1 1)
                             2)))
                   (labels
                     ((staticfail1001 () #f))
                     (let ((g1005 x3))
                       (cond ((eq? g1005 #f) (print_string_98@io "mutable "))
                             (else (staticfail1001))))))
                 (print_type_241@pr_type
                   (caml-constr-get-field
                     (caml-constr-get-field x1 1)
                     1))))))
          (let ((g1006 x2))
            (cond ((eq? g1006 #f) #f)
                  (else (staticfail1000))))))
      (print_endline_197@io ""))))


(define (print_label_decl_216@pr_decl x1)
  (begin
    (let ((x2 (caml-constr-get-field
                (caml-constr-get-field x1 1)
                2)))
      (labels
        ((staticfail1002 () #f))
        (let ((g1007 x2))
          (cond ((eq? g1007 #f) (print_string_98@io "mutable "))
                (else (staticfail1002))))))
    (begin
      (print_string_98@io
        (caml-constr-get-field
          (caml-constr-get-field x1 0)
          1))
      (begin
        (print_string_98@io " : ")
        (begin
          (print_type_241@pr_type
            (caml-constr-get-field
              (caml-constr-get-field x1 1)
              1))
          (print_endline_197@io ""))))))


(define (print_one_typedecl_224@pr_decl x1)
  (begin
    (reset_type_var_name_24@pr_type #f)
    (begin
      (print_type_241@pr_type
        (caml-constr-get-field x1 0))
      (let ((x2 (caml-constr-get-field x1 1)))
        (labels
          ((staticfail1003
             ()
             (caml-raise
               '#("Mlib/pr_decl.ml"
                  1131
                  1688
                  Match_failure_1@builtin
                  ()))))
          (let ((g1008 x2))
            (cond ((eq? g1008 #f) (print_endline_197@io ""))
                  (else
                   (case (caml-regular-constr-tag g1008)
                     ((2)
                      (if (null? (caml-constr-get-field x2 0))
                        (staticfail1003)
                        (begin
                          (print_endline_197@io " = ")
                          (begin
                            (print_string_98@io "    ")
                            (begin
                              (print_constr_decl_48@pr_decl
                                (car (caml-constr-get-field x2 0)))
                              ((do_list_18@list
                                 (lambda (x3)
                                    (begin
                                      (print_string_98@io "  | ")
                                      (print_constr_decl_48@pr_decl x3))))
                               (cdr (caml-constr-get-field x2 0))))))))
                     ((3)
                      (if (null? (caml-constr-get-field x2 0))
                        (staticfail1003)
                        (begin
                          (print_endline_197@io " = ")
                          (begin
                            (print_string_98@io "  { ")
                            (begin
                              (print_label_decl_216@pr_decl
                                (car (caml-constr-get-field x2 0)))
                              (begin
                                ((do_list_18@list
                                   (lambda (x3)
                                      (begin
                                        (print_string_98@io "  ; ")
                                        (print_label_decl_216@pr_decl x3))))
                                 (cdr (caml-constr-get-field x2 0)))
                                (print_endline_197@io "  }")))))))
                     (else
                      (begin
                        (print_string_98@io " == ")
                        (begin
                          (print_type_241@pr_type
                            (caml-constr-get-field x2 1))
                          (print_endline_197@io "")))))))))))))


(define (print_typedecl_247@pr_decl x1)
  (if (null? x1)
    (fatal_error_193@misc "print_typedecl")
    (begin
      (print_string_98@io "type ")
      (begin
        (print_one_typedecl_224@pr_decl (car x1))
        (begin
          ((do_list_18@list
             (lambda (x2)
                (begin
                  (print_string_98@io " and ")
                  (print_one_typedecl_224@pr_decl x2))))
           (cdr x1))
          (begin
            (print_string_98@io ";;")
            (print_newline_91@io #f)))))))


(define (print_excdecl_200@pr_decl x1)
  (labels
    ((staticfail1004
       ()
       (fatal_error_193@misc "print_excdecl")))
    (case (if (caml-constant-constr? x1)
            -1
            (caml-regular-constr-tag x1))
      ((2)
       (begin
         ((do_list_18@list
            (lambda (x2)
               (begin
                 (reset_type_var_name_24@pr_type #f)
                 (begin
                   (print_string_98@io "exception ")
                   (print_constr_decl_48@pr_decl x2)))))
          (caml-constr-get-field x1 0))
         (begin
           (print_string_98@io ";;")
           (print_newline_91@io #f))))
      (else (staticfail1004)))))


