;; Le module 
(module
  __caml_pr_type
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_globals
    __caml_builtins
    __caml_types
    __caml_modules)
  (export
    cur_chan_128@pr_type
    (print_on_54@pr_type x1)
    (print_string_98@pr_type x1)
    (print_global_105@pr_type x1)
    (2-135-print_global_105@pr_type x1 x2)
    print_type_constructor_243@pr_type
    (int_to_alpha_65@pr_type x1)
    reset_type_var_name_24@pr_type
    name_of_type_var_218@pr_type
    (print_typ_44@pr_type x1)
    (print_typ_list_121@pr_type x1)
    (2-112-print_typ_44@pr_type x1 x2)
    (3-203-print_typ_list_121@pr_type x1 x2 x3)
    (print_constr_31@pr_type x1)
    (print_type_constr_74@pr_type x1)
    (print_value_37@pr_type x1)
    (print_label_155@pr_type x1)
    (prerr_constr_25@pr_type x1)
    (prerr_type_constr_169@pr_type x1)
    (prerr_value_96@pr_type x1)
    (prerr_label_206@pr_type x1)
    (print_type_241@pr_type x1)
    (print_one_type_206@pr_type x1)
    (prerr_type_191@pr_type x1)
    (prerr_one_type_122@pr_type x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 
(define name_of_type_var_218@pr_type (unspecified))
(define reset_type_var_name_24@pr_type (unspecified))

;; Les expressions globales 
(define cur_chan_128@pr_type (make-cell #f))

(define (print_on_54@pr_type x1)
  (cell-set! cur_chan_128@pr_type x1))


(define (print_string_98@pr_type x1)
  (let ((x2 (cell-ref cur_chan_128@pr_type)))
    (let ((g1008 x2))
      (cond ((eq? g1008 #f) (print_string_98@io x1))
            ((eq? g1008 #t) (prerr_string_235@io x1))
            (else #f)))))


(begin
  (define (print_global_105@pr_type x1)
    (lambda (x2)
       (2-135-print_global_105@pr_type x1 x2)))
 (define (2-135-print_global_105@pr_type x1 x2)
    (letrec ((x3 (lambda (x4)
                    (if (null? x4)
                      #f
                      (with-handler
                        (lambda (x5)
                           (labels
                             ((staticfail1001 () (caml-raise x5)))
                             (case (caml-extensible-constr-tag x5)
                               ((Not_found_4@exc) (x3 (cdr x4)))
                               (else (staticfail1001)))))
                        (unwind-protect
                          (begin
                            (push-exception-handler)
                            (begin
                              ((find_75@hashtbl (x1 (car x4)))
                               (caml-constr-get-field
                                 (caml-constr-get-field x2 0)
                                 1))
                              (tree_equal
                                (caml-constr-get-field
                                  (caml-constr-get-field x2 0)
                                  0)
                                (caml-constr-get-field (car x4) 0))))
                          (pop-exception-handler)))))))
      (begin
        (if (not (x3 (cons (cell-ref defined_module_128@modules)
                           (cell-ref used_modules_84@modules))))
          (begin
            (print_string_98@pr_type
              (caml-constr-get-field
                (caml-constr-get-field x2 0)
                0))
            (print_string_98@pr_type "__"))
          #f)
        (print_string_98@pr_type
          (caml-constr-get-field
            (caml-constr-get-field x2 0)
            1)))))
)

(define print_type_constructor_243@pr_type
  (print_global_105@pr_type
    types_of_module_132@modules))


(define (int_to_alpha_65@pr_type x1)
  (if (<fx x1 26)
    ((make_string_7@string 1)
     (char_of_int_212@char (+fx x1 96)))
    ((^_54@string
       (int_to_alpha_65@pr_type (/fx x1 26)))
     ((make_string_7@string 1)
      (char_of_int_212@char (+fx (modulo x1 26) 97))))))


(let ((x1 (let ((x1 '()) (x2 0))
            (caml-make-regular-2
              #f
              (lambda (x3)
                 (begin (set! x1 '()) (begin (set! x2 0) #f)))
              (lambda (x3)
                 (with-handler
                   (lambda (x4)
                      (labels
                        ((staticfail1003 () (caml-raise x4)))
                        (case (caml-extensible-constr-tag x4)
                          ((Not_found_4@exc)
                           (begin
                             (set! x2 (+fx x2 1))
                             (let ((x5 (int_to_alpha_65@pr_type x2)))
                               (begin
                                 (set! x1
                                   (cons (caml-make-regular-2 #f x3 x5) x1))
                                 x5))))
                          (else (staticfail1003)))))
                   (unwind-protect
                     (begin
                       (push-exception-handler)
                       ((assq_219@list x3) x1))
                     (pop-exception-handler))))))))
  (begin
    (set! reset_type_var_name_24@pr_type
      (caml-constr-get-field x1 0))
    (set! name_of_type_var_218@pr_type
      (caml-constr-get-field x1 1))))

(begin
  (begin
    (define (print_typ_44@pr_type x1)
      (lambda (x2) (2-112-print_typ_44@pr_type x1 x2)))
   (define (2-112-print_typ_44@pr_type x1 x2)
      (let ((x3 (type_repr_76@types x2)))
        (let ((x4 (caml-constr-get-field x3 0)))
          (case (caml-regular-constr-tag x4)
            ((1)
             (begin
               (print_string_98@pr_type "'")
               (print_string_98@pr_type
                 (name_of_type_var_218@pr_type x3))))
            ((2)
             (begin
               (if (>=fx x1 1) (print_string_98@pr_type "(") #f)
               (begin
                 (2-112-print_typ_44@pr_type
                   1
                   (caml-constr-get-field x4 0))
                 (begin
                   (print_string_98@pr_type " -> ")
                   (begin
                     (2-112-print_typ_44@pr_type
                       0
                       (caml-constr-get-field x4 1))
                     (if (>=fx x1 1) (print_string_98@pr_type ")") #f))))))
            ((3)
             (begin
               (if (>=fx x1 2) (print_string_98@pr_type "(") #f)
               (begin
                 (((print_typ_list_121@pr_type 2) " * ")
                  (caml-constr-get-field x4 0))
                 (if (>=fx x1 2) (print_string_98@pr_type ")") #f))))
            (else
             (begin
               (let ((x5 (caml-constr-get-field x4 1)))
                 (labels
                   ((staticfail1005
                      ()
                      (begin
                        (print_string_98@pr_type "(")
                        (begin
                          (((print_typ_list_121@pr_type 0) ", ") x5)
                          (print_string_98@pr_type ") ")))))
                   (if (null? x5)
                     #f
                     (if (null? (cdr x5))
                       (begin
                         (2-112-print_typ_44@pr_type 2 (car x5))
                         (print_string_98@pr_type " "))
                       (staticfail1005)))))
               (print_type_constructor_243@pr_type
                 (caml-constr-get-field x4 0))))))))
)(begin
    (define (print_typ_list_121@pr_type x1)
      (lambda (x2)
         (lambda (x3)
            (3-203-print_typ_list_121@pr_type x1 x2 x3))))
   (define (3-203-print_typ_list_121@pr_type x1 x2 x3)
      (if (null? x3)
        (fatal_error_193@misc "print_typ_list")
        (labels
          ((staticfail1007
             ()
             (begin
               (2-112-print_typ_44@pr_type x1 (car x3))
               (begin
                 (print_string_98@pr_type x2)
                 (3-203-print_typ_list_121@pr_type x1 x2 (cdr x3))))))
          (if (null? (cdr x3))
            (2-112-print_typ_44@pr_type x1 (car x3))
            (staticfail1007)))))
))

(begin
  (define (print_constr_31@pr_type x1)
    (begin
      (print_on_54@pr_type #f)
      (2-135-print_global_105@pr_type
        constrs_of_module_249@modules
        x1)))
 (begin
    (define (print_type_constr_74@pr_type x1)
      (begin
        (print_on_54@pr_type #f)
        (2-135-print_global_105@pr_type
          types_of_module_132@modules
          x1)))
   (begin
      (define (print_value_37@pr_type x1)
        (begin
          (print_on_54@pr_type #f)
          (2-135-print_global_105@pr_type
            values_of_module_199@modules
            x1)))
     (define (print_label_155@pr_type x1)
        (begin
          (print_on_54@pr_type #f)
          (2-135-print_global_105@pr_type
            labels_of_module_207@modules
            x1)))
)))

(begin
  (define (prerr_constr_25@pr_type x1)
    (begin
      (print_on_54@pr_type #t)
      (2-135-print_global_105@pr_type
        constrs_of_module_249@modules
        x1)))
 (begin
    (define (prerr_type_constr_169@pr_type x1)
      (begin
        (print_on_54@pr_type #t)
        (2-135-print_global_105@pr_type
          types_of_module_132@modules
          x1)))
   (begin
      (define (prerr_value_96@pr_type x1)
        (begin
          (print_on_54@pr_type #t)
          (2-135-print_global_105@pr_type
            values_of_module_199@modules
            x1)))
     (define (prerr_label_206@pr_type x1)
        (begin
          (print_on_54@pr_type #t)
          (2-135-print_global_105@pr_type
            labels_of_module_207@modules
            x1)))
)))

(define (print_type_241@pr_type x1)
  (begin
    (print_on_54@pr_type #f)
    (2-112-print_typ_44@pr_type 0 x1)))


(define (print_one_type_206@pr_type x1)
  (begin
    (print_on_54@pr_type #f)
    (begin
      (reset_type_var_name_24@pr_type #f)
      (2-112-print_typ_44@pr_type 0 x1))))


(define (prerr_type_191@pr_type x1)
  (begin
    (print_on_54@pr_type #t)
    (2-112-print_typ_44@pr_type 0 x1)))


(define (prerr_one_type_122@pr_type x1)
  (begin
    (print_on_54@pr_type #t)
    (begin
      (reset_type_var_name_24@pr_type #f)
      (2-112-print_typ_44@pr_type 0 x1))))


