;; Le module 
(module
  __caml_tr_env
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_syntax
    __caml_lambda
    __caml_prim
    __caml_globals
    __caml_ty_error)
  (export
    (translate_path_176@tr_env x1)
    (2-149-translate_path_176@tr_env x1 a1000)
    (translate_access_117@tr_env x1)
    (2-26-translate_access_117@tr_env x1 x2)
    (translate_update_202@tr_env x1)
    (3-114-translate_update_202@tr_env x1 x2 x3)
    (paths_of_pat_67@tr_env x1)
    (2-246-paths_of_pat_67@tr_env x1 x2)
    (mutable_vars_of_pat_68@tr_env x1)
    (add_lets_to_env_171@tr_env x1)
    (2-201-add_lets_to_env_171@tr_env x1 x2)
    (add_lets_to_expr_69@tr_env x1)
    (3-167-add_lets_to_expr_69@tr_env x1 x2 x3)
    (add_pat_to_env_200@tr_env x1)
    (2-244-add_pat_to_env_200@tr_env x1 x2)
    (add_pat_list_to_env_65@tr_env x1)
    (2-65-add_pat_list_to_env_65@tr_env x1 x2)
    (add_for_parameter_to_env_127@tr_env x1)
    (2-180-add_for_parameter_to_env_127@tr_env x1 x2)
    (add_let_rec_to_env_158@tr_env x1)
    (2-243-add_let_rec_to_env_158@tr_env x1 x2)
    (env_for_toplevel_let_34@tr_env x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (translate_path_176@tr_env x1)
    (lambda (a1000)
       (2-149-translate_path_176@tr_env x1 a1000)))
 (define (2-149-translate_path_176@tr_env x1 a1000)
    (letrec ((x2 (lambda (x3)
                    (let ((g1013 x3))
                      (cond ((eq? g1013 #f) x1)
                            (else
                             (caml-make-regular-2
                               #<0007>
                               (caml-make-regular-1
                                 #<0009>
                                 (caml-constr-get-field x3 0))
                               (cons (x2 (caml-constr-get-field x3 1))
                                     '()))))))))
      (x2 a1000)))
)

(begin
  (define (translate_access_117@tr_env x1)
    (lambda (x2)
       (2-26-translate_access_117@tr_env x1 x2)))
 (define (2-26-translate_access_117@tr_env x1 x2)
    (letrec ((x3 (lambda (x4)
                    (lambda (x5)
                       (let ((g1014 x5))
                         (cond ((eq? g1014 #f)
                                (fatal_error_193@misc "translate_env"))
                               (else
                                (case (caml-regular-constr-tag g1014)
                                  ((2)
                                   ((x3 (+fx x4 1))
                                    (caml-constr-get-field x5 0)))
                                  (else
                                   (with-handler
                                     (lambda (x6)
                                        (labels
                                          ((staticfail1004 () (caml-raise x6)))
                                          (case (caml-extensible-constr-tag x6)
                                            ((Not_found_4@exc)
                                             ((x3 (+fx x4 1))
                                              (caml-constr-get-field x5 1)))
                                            (else (staticfail1004)))))
                                     (unwind-protect
                                       (begin
                                         (push-exception-handler)
                                         (let ((x6 ((assoc_252@list x1)
                                                    (caml-constr-get-field
                                                      x5
                                                      0))))
                                           (2-149-translate_path_176@tr_env
                                             (caml-make-regular-1 #f x4)
                                             x6)))
                                       (pop-exception-handler))))))))))))
      ((x3 0) x2)))
)

(begin
  (define (translate_update_202@tr_env x1)
    (lambda (x2)
       (lambda (x3)
          (3-114-translate_update_202@tr_env x1 x2 x3))))
 (define (3-114-translate_update_202@tr_env x1 x2 x3)
    (letrec ((x4 (lambda (x5)
                    (lambda (x6)
                       (let ((g1015 x6))
                         (cond ((eq? g1015 #f)
                                (fatal_error_193@misc "translate_update"))
                               (else
                                (case (caml-regular-constr-tag g1015)
                                  ((2)
                                   ((x4 (+fx x5 1))
                                    (caml-constr-get-field x6 0)))
                                  (else
                                   (with-handler
                                     (lambda (x7)
                                        (labels
                                          ((staticfail1006 () (caml-raise x7)))
                                          (case (caml-extensible-constr-tag x7)
                                            ((Not_found_4@exc)
                                             ((x4 (+fx x5 1))
                                              (caml-constr-get-field x6 1)))
                                            (else (staticfail1006)))))
                                     (unwind-protect
                                       (begin
                                         (push-exception-handler)
                                         (let ((x7 ((assoc_252@list x1)
                                                    (caml-constr-get-field
                                                      x6
                                                      0))))
                                           (let ((g1016 x7))
                                             (cond ((eq? g1016 #f)
                                                    (caml-raise
                                                      'Not_found_4@exc))
                                                   (else
                                                    (caml-make-regular-2
                                                      #<0007>
                                                      (caml-make-regular-1
                                                        #<000a>
                                                        (caml-constr-get-field
                                                          x7
                                                          0))
                                                      (cons (2-149-translate_path_176@tr_env
                                                              (caml-make-regular-1
                                                                #f
                                                                x5)
                                                              (caml-constr-get-field
                                                                x7
                                                                1))
                                                            (cons x3 '()))))))))
                                       (pop-exception-handler))))))))))))
      ((x4 0) x2)))
)

(begin
  (define (paths_of_pat_67@tr_env x1)
    (lambda (x2)
       (2-246-paths_of_pat_67@tr_env x1 x2)))
 (define (2-246-paths_of_pat_67@tr_env x1 x2)
    (let ((x3 (caml-constr-get-field x2 0)))
      (labels
        ((staticfail1009 () '()))
        (case (if (caml-constant-constr? x3)
                -1
                (caml-regular-constr-tag x3))
          ((2)
           (cons (caml-make-regular-2
                   #f
                   (caml-constr-get-field x3 0)
                   x1)
                 '()))
          ((3)
           (cons (caml-make-regular-2
                   #f
                   (caml-constr-get-field x3 1)
                   x1)
                 (2-246-paths_of_pat_67@tr_env
                   x1
                   (caml-constr-get-field x3 0))))
          ((5)
           (letrec ((x4 (lambda (x5)
                           (lambda (x6)
                              (if (null? x6)
                                '()
                                ((@_176@list
                                   (2-246-paths_of_pat_67@tr_env
                                     (caml-make-regular-2 #t x5 x1)
                                     (car x6)))
                                 ((x4 (+fx x5 1)) (cdr x6))))))))
             ((x4 0) (caml-constr-get-field x3 0))))
          ((6) '())
          ((7)
           (let ((x4 (caml-constr-get-field
                       (caml-constr-get-field
                         (caml-constr-get-field x3 0)
                         1)
                       4)))
             (labels
               ((staticfail1010
                  ()
                  (2-246-paths_of_pat_67@tr_env
                    (caml-make-regular-2 #t 0 x1)
                    (caml-constr-get-field x3 1))))
               (case (if (caml-constant-constr? x4)
                       -1
                       (caml-regular-constr-tag x4))
                 ((3)
                  (2-246-paths_of_pat_67@tr_env
                    x1
                    (caml-constr-get-field x3 1)))
                 (else (staticfail1010))))))
          ((9)
           (2-246-paths_of_pat_67@tr_env
             x1
             (caml-constr-get-field x3 0)))
          ((10)
           (letrec ((x4 (lambda (x5)
                           (if (null? x5)
                             '()
                             ((@_176@list
                                (2-246-paths_of_pat_67@tr_env
                                  (caml-make-regular-2
                                    #t
                                    (caml-constr-get-field
                                      (caml-constr-get-field
                                        (caml-constr-get-field (car x5) 0)
                                        1)
                                      3)
                                    x1)
                                  (caml-constr-get-field (car x5) 1)))
                              (x4 (cdr x5)))))))
             (x4 (caml-constr-get-field x3 0))))
          (else (staticfail1009))))))
)

(define (mutable_vars_of_pat_68@tr_env x1)
  (let ((x2 (caml-constr-get-field x1 0)))
    (labels
      ((staticfail1011 () '()))
      (case (if (caml-constant-constr? x2)
              -1
              (caml-regular-constr-tag x2))
        ((9 3)
         (mutable_vars_of_pat_68@tr_env
           (caml-constr-get-field x2 0)))
        ((5)
         ((flat_map_45@list mutable_vars_of_pat_68@tr_env)
          (caml-constr-get-field x2 0)))
        ((7)
         (let ((x3 (caml-constr-get-field
                     (caml-constr-get-field
                       (caml-constr-get-field x2 0)
                       1)
                     2)))
           (let ((g1017 x3))
             (cond ((eq? g1017 #f)
                    (free_vars_of_pat_1@syntax
                      (caml-constr-get-field x2 1)))
                   ((eq? g1017 #t)
                    (mutable_vars_of_pat_68@tr_env
                      (caml-constr-get-field x2 1)))
                   (else #f)))))
        ((10)
         ((flat_map_45@list
            (lambda (x3)
               (let ((x4 (caml-constr-get-field
                           (caml-constr-get-field
                             (caml-constr-get-field x3 0)
                             1)
                           2)))
                 (let ((g1018 x4))
                   (cond ((eq? g1018 #f)
                          (free_vars_of_pat_1@syntax
                            (caml-constr-get-field x3 1)))
                         ((eq? g1018 #t)
                          (mutable_vars_of_pat_68@tr_env
                            (caml-constr-get-field x3 1)))
                         (else #f))))))
          (caml-constr-get-field x2 0)))
        (else (staticfail1011))))))


(begin
  (define (add_lets_to_env_171@tr_env x1)
    (lambda (x2)
       (2-201-add_lets_to_env_171@tr_env x1 x2)))
 (define (2-201-add_lets_to_env_171@tr_env x1 x2)
    (let ((x3 x1))
      (if (null? x3)
        x2
        (2-201-add_lets_to_env_171@tr_env
          (cdr x3)
          (caml-make-regular-2
            #unspecified
            (cons (caml-make-regular-2 #f (car x3) #f) '())
            x2)))))
)

(begin
  (define (add_lets_to_expr_69@tr_env x1)
    (lambda (x2)
       (lambda (x3)
          (3-167-add_lets_to_expr_69@tr_env x1 x2 x3))))
 (define (3-167-add_lets_to_expr_69@tr_env x1 x2 x3)
    (letrec ((x4 (lambda (x5)
                    (lambda (x6)
                       (if (null? x6)
                         '()
                         (cons (2-26-translate_access_117@tr_env (car x6) x5)
                               ((x4 (caml-make-regular-1 #t x5)) (cdr x6))))))))
      (caml-make-regular-2 #a000 ((x4 x2) x1) x3)))
)

(begin
  (define (add_pat_to_env_200@tr_env x1)
    (lambda (x2)
       (2-244-add_pat_to_env_200@tr_env x1 x2)))
 (define (2-244-add_pat_to_env_200@tr_env x1 x2)
    (let ((x3 (caml-make-regular-2
                #unspecified
                (2-246-paths_of_pat_67@tr_env #f x2)
                x1)))
      (let ((x4 (mutable_vars_of_pat_68@tr_env x2)))
        (caml-make-regular-2
          #f
          (2-201-add_lets_to_env_171@tr_env x4 x3)
          ((add_lets_to_expr_69@tr_env x4) x3)))))
)

(begin
  (define (add_pat_list_to_env_65@tr_env x1)
    (lambda (x2)
       (2-65-add_pat_list_to_env_65@tr_env x1 x2)))
 (define (2-65-add_pat_list_to_env_65@tr_env x1 x2)
    (let ((x3 (((it_list_7@list
                  (lambda (x3)
                     (lambda (x4)
                        (caml-make-regular-2
                          #unspecified
                          (2-246-paths_of_pat_67@tr_env #f x4)
                          x3))))
                x1)
               x2)))
      (let ((x4 ((flat_map_45@list mutable_vars_of_pat_68@tr_env)
                 x2)))
        (caml-make-regular-2
          #f
          (2-201-add_lets_to_env_171@tr_env x4 x3)
          ((add_lets_to_expr_69@tr_env x4) x3)))))
)

(begin
  (define (add_for_parameter_to_env_127@tr_env x1)
    (lambda (x2)
       (2-180-add_for_parameter_to_env_127@tr_env x1 x2)))
 (define (2-180-add_for_parameter_to_env_127@tr_env x1 x2)
    (caml-make-regular-1
      #t
      (caml-make-regular-2
        #unspecified
        (cons (caml-make-regular-2 #f x2 '#(0 #f #t))
              '())
        x1)))
)

(begin
  (define (add_let_rec_to_env_158@tr_env x1)
    (lambda (x2)
       (2-243-add_let_rec_to_env_158@tr_env x1 x2)))
 (define (2-243-add_let_rec_to_env_158@tr_env x1 x2)
    (let ((x3 (lambda (x3)
                 (lambda (x4)
                    (let ((x5 (caml-constr-get-field
                                (caml-constr-get-field x4 0)
                                0)))
                      (labels
                        ((staticfail1012
                           ()
                           (illegal_letrec_pat_53@ty_error
                             (caml-constr-get-field
                               (caml-constr-get-field x4 0)
                               1))))
                        (case (if (caml-constant-constr? x5)
                                -1
                                (caml-regular-constr-tag x5))
                          ((2)
                           (caml-make-regular-2
                             #unspecified
                             (cons (caml-make-regular-2
                                     #f
                                     (caml-constr-get-field x5 0)
                                     #f)
                                   '())
                             x3))
                          (else (staticfail1012)))))))))
      (((it_list_7@list x3) x1) x2)))
)

(define (env_for_toplevel_let_34@tr_env x1)
  (((it_list_7@list
      (lambda (x2)
         (lambda (x3)
            (caml-make-regular-2
              #unspecified
              (2-246-paths_of_pat_67@tr_env #f x3)
              x2))))
    #f)
   x1))


