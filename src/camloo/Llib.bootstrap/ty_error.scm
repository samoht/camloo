;; Le module 
(module
  __caml_ty_error
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_globals
    __caml_errors
    __caml_location
    __caml_syntax
    __caml_types
    __caml_pr_type)
  (export
    (wrong_type_err_242@ty_error x1)
    (2-14-wrong_type_err_242@ty_error x1 x2)
    (unbound_type_var_err_210@ty_error x1)
    (2-57-unbound_type_var_err_210@ty_error x1 x2)
    (type_arity_err_104@ty_error x1)
    (3-205-type_arity_err_104@ty_error x1 x2 x3)
    (non_linear_pattern_err_245@ty_error x1)
    (2-228-non_linear_pattern_err_245@ty_error x1 x2)
    (orpat_should_be_closed_err_143@ty_error x1)
    (pat_wrong_type_err_97@ty_error x1)
    (expr_wrong_type_err_214@ty_error x1)
    (ill_shaped_match_err_118@ty_error x1)
    (duplicate_param_in_type_decl_err_227@ty_error
      x1)
    (duplicate_constr_in_type_decl_err_141@ty_error
      x1)
    (3-131-duplicate_constr_in_type_decl_err_141@ty_error
      x1
      x2
      x3)
    (not_mutable_err_16@ty_error x1)
    (2-235-not_mutable_err_16@ty_error x1 x2)
    (undefined_type_err_184@ty_error x1)
    (undefined_value_err_83@ty_error x1)
    (type_mismatch_err_114@ty_error x1)
    (2-244-type_mismatch_err_114@ty_error x1 x2)
    (cannot_generalize_err_175@ty_error x1)
    (3-176-cannot_generalize_err_175@ty_error
      x1
      x2
      x3)
    (label_err_67@ty_error x1)
    (3-103-label_err_67@ty_error x1 x2 x3)
    (rec_unknown_size_err_179@ty_error x1)
    (2-205-rec_unknown_size_err_179@ty_error x1 x2)
    (non_constant_constr_err_198@ty_error x1)
    (2-170-non_constant_constr_err_198@ty_error
      x1
      x2)
    (constant_constr_err_151@ty_error x1)
    (2-7-constant_constr_err_151@ty_error x1 x2)
    (illegal_letrec_pat_53@ty_error x1)
    (illegal_letrec_expr_66@ty_error x1)
    (illegal_type_redefinition_102@ty_error x1)
    (2-10-illegal_type_redefinition_102@ty_error
      x1
      x2)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (wrong_type_err_242@ty_error x1)
    (lambda (x2)
       (2-14-wrong_type_err_242@ty_error x1 x2)))
 (define (2-14-wrong_type_err_242@ty_error x1 x2)
    (begin
      (reset_type_var_name_24@pr_type #f)
      (begin
        (prerr_string_235@io " of type ")
        (begin
          (prerr_type_191@pr_type x1)
          (begin
            (prerr_endline_232@io "")
            (begin
              (prerr_begline_213@misc
                " cannot be used with type ")
              (begin
                (prerr_type_191@pr_type x2)
                (begin
                  (prerr_endline_232@io "")
                  (caml-raise 'Toplevel_2@misc)))))))))
)

(begin
  (define (unbound_type_var_err_210@ty_error x1)
    (lambda (x2)
       (2-57-unbound_type_var_err_210@ty_error x1 x2)))
 (define (2-57-unbound_type_var_err_210@ty_error x1 x2)
    (begin
      (prerr_location_1@location
        (caml-constr-get-field x2 1))
      (begin
        (prerr_begline_213@misc " Type variable '")
        (begin
          (prerr_string_235@io x1)
          (begin
            (prerr_endline_232@io " is unbound")
            (caml-raise 'Toplevel_2@misc))))))
)

(begin
  (define (type_arity_err_104@ty_error x1)
    (lambda (x2)
       (lambda (x3)
          (3-205-type_arity_err_104@ty_error x1 x2 x3))))
 (define (3-205-type_arity_err_104@ty_error x1 x2 x3)
    (begin
      (prerr_location_1@location x3)
      (begin
        (prerr_begline_213@misc " Type constructor ")
        (begin
          (prerr_type_constr_169@pr_type x1)
          (begin
            (prerr_string_235@io " of arity ")
            (begin
              (prerr_int_158@io
                (caml-constr-get-field
                  (caml-constr-get-field x1 1)
                  1))
              (begin
                (prerr_string_235@io " is used with arity ")
                (begin
                  (prerr_int_158@io (list_length_112@list x2))
                  (begin
                    (prerr_endline_232@io ".")
                    (caml-raise 'Toplevel_2@misc))))))))))
)

(begin
  (define (non_linear_pattern_err_245@ty_error x1)
    (lambda (x2)
       (2-228-non_linear_pattern_err_245@ty_error x1 x2)))
 (define (2-228-non_linear_pattern_err_245@ty_error x1 x2)
    (begin
      (prerr_location_1@location
        (caml-constr-get-field x1 1))
      (begin
        (prerr_begline_213@misc " Variable ")
        (begin
          (prerr_string_235@io x2)
          (begin
            (prerr_endline_232@io
              " is bound twice in this pattern.")
            (caml-raise 'Toplevel_2@misc))))))
)

(define (orpat_should_be_closed_err_143@ty_error x1)
  (begin
    (prerr_location_1@location
      (caml-constr-get-field x1 1))
    (begin
      (prerr_begline_213@misc
        " A pattern with '|' cannot bind variables.")
      (begin
        (prerr_endline_232@io "")
        (caml-raise 'Toplevel_2@misc)))))


(define (pat_wrong_type_err_97@ty_error x1)
  (begin
    (prerr_location_1@location
      (caml-constr-get-field x1 1))
    (begin
      (prerr_begline_213@misc " Pattern")
      wrong_type_err_242@ty_error)))


(define (expr_wrong_type_err_214@ty_error x1)
  (begin
    (prerr_location_1@location
      (caml-constr-get-field x1 1))
    (begin
      (prerr_begline_213@misc " Expression")
      wrong_type_err_242@ty_error)))


(define (ill_shaped_match_err_118@ty_error x1)
  (begin
    (prerr_location_1@location
      (caml-constr-get-field x1 1))
    (begin
      (prerr_begline_213@misc
        " Curried matching with cases of different lengths.")
      (begin
        (prerr_endline_232@io "")
        (caml-raise 'Toplevel_2@misc)))))


(define (duplicate_param_in_type_decl_err_227@ty_error
         x1)
  (begin
    (prerr_location_1@location x1)
    (begin
      (prerr_begline_213@misc
        " Repeated type parameter in type declaration.")
      (begin
        (prerr_endline_232@io "")
        (caml-raise 'Toplevel_2@misc)))))


(begin
  (define (duplicate_constr_in_type_decl_err_141@ty_error
           x1)
    (lambda (x2)
       (lambda (x3)
          (3-131-duplicate_constr_in_type_decl_err_141@ty_error
            x1
            x2
            x3))))
 (define (3-131-duplicate_constr_in_type_decl_err_141@ty_error
           x1
           x2
           x3)
    (begin
      (prerr_location_1@location x2)
      (begin
        (prerr_begline_213@misc " Constructor ")
        (begin
          (prerr_string_235@io x1)
          (begin
            (prerr_string_235@io x3)
            (begin
              (prerr_endline_232@io "is defined twice.")
              (caml-raise 'Toplevel_2@misc)))))))
)

(begin
  (define (not_mutable_err_16@ty_error x1)
    (lambda (x2)
       (2-235-not_mutable_err_16@ty_error x1 x2)))
 (define (2-235-not_mutable_err_16@ty_error x1 x2)
    (begin
      (prerr_location_1@location x2)
      (begin
        (prerr_begline_213@misc " Variable ")
        (begin
          (prerr_string_235@io x1)
          (begin
            (prerr_endline_232@io " is not mutable.")
            (caml-raise 'Toplevel_2@misc))))))
)

(define (undefined_type_err_184@ty_error x1)
  (begin
    (prerr_input_name_16@location #f)
    (begin
      (prerr_begline_213@misc " Type ")
      (begin
        (prerr_type_constr_169@pr_type x1)
        (begin
          (prerr_endline_232@io
            " is declared in the interface, but not implemented.")
          (caml-raise 'Toplevel_2@misc))))))


(define (undefined_value_err_83@ty_error x1)
  (begin
    (prerr_input_name_16@location #f)
    (begin
      (prerr_begline_213@misc " Value ")
      (begin
        (prerr_value_96@pr_type x1)
        (begin
          (prerr_endline_232@io
            " is declared in the interface, but not implemented.")
          (caml-raise 'Toplevel_2@misc))))))


(begin
  (define (type_mismatch_err_114@ty_error x1)
    (lambda (x2)
       (2-244-type_mismatch_err_114@ty_error x1 x2)))
 (define (2-244-type_mismatch_err_114@ty_error x1 x2)
    (begin
      (prerr_input_name_16@location #f)
      (begin
        (prerr_begline_213@misc " Value ")
        (begin
          (prerr_value_96@pr_type x1)
          (begin
            (reset_type_var_name_24@pr_type #f)
            (begin
              (prerr_string_235@io " is declared with type ")
              (begin
                (prerr_type_191@pr_type
                  (type_instance_208@types
                    (caml-constr-get-field
                      (caml-constr-get-field x1 1)
                      0)))
                (begin
                  (prerr_endline_232@io "")
                  (begin
                    (prerr_begline_213@misc
                      " and defined with type ")
                    (begin
                      (prerr_type_191@pr_type
                        (type_instance_208@types
                          (caml-constr-get-field
                            (caml-constr-get-field x2 1)
                            0)))
                      (begin
                        (prerr_endline_232@io "")
                        (caml-raise 'Toplevel_2@misc))))))))))))
)

(begin
  (define (cannot_generalize_err_175@ty_error x1)
    (lambda (x2)
       (lambda (x3)
          (3-176-cannot_generalize_err_175@ty_error
            x1
            x2
            x3))))
 (define (3-176-cannot_generalize_err_175@ty_error
           x1
           x2
           x3)
    (begin
      (prerr_location_1@location x1)
      (begin
        (reset_type_var_name_24@pr_type #f)
        (begin
          (prerr_begline_213@misc " Cannot generalize")
          (begin
            ((do_list_18@list
               (lambda (x4)
                  (begin
                    (prerr_string_235@io " ")
                    (prerr_type_191@pr_type x4))))
             x2)
            (begin
              (prerr_string_235@io " in ")
              (begin
                (prerr_type_191@pr_type x3)
                (begin
                  (prerr_endline_232@io "")
                  (caml-raise 'Toplevel_2@misc)))))))))
)

(begin
  (define (label_err_67@ty_error x1)
    (lambda (x2)
       (lambda (x3)
          (3-103-label_err_67@ty_error x1 x2 x3))))
 (define (3-103-label_err_67@ty_error x1 x2 x3)
    (begin
      (prerr_location_1@location
        (caml-constr-get-field x2 1))
      (begin
        (prerr_begline_213@misc " Label ")
        (begin
          (prerr_label_206@pr_type x3)
          (begin
            (prerr_endline_232@io x1)
            (caml-raise 'Toplevel_2@misc))))))
)

(begin
  (define (rec_unknown_size_err_179@ty_error x1)
    (lambda (x2)
       (2-205-rec_unknown_size_err_179@ty_error x1 x2)))
 (define (2-205-rec_unknown_size_err_179@ty_error x1 x2)
    (begin
      (prerr_location_1@location x2)
      (begin
        (prerr_begline_213@misc
          " Cannot define recursive values of type ")
        (begin
          (prerr_type_191@pr_type x1)
          (begin
            (prerr_endline_232@io "")
            (caml-raise 'Toplevel_2@misc))))))
)

(begin
  (define (non_constant_constr_err_198@ty_error x1)
    (lambda (x2)
       (2-170-non_constant_constr_err_198@ty_error
         x1
         x2)))
 (define (2-170-non_constant_constr_err_198@ty_error
           x1
           x2)
    (begin
      (prerr_location_1@location x2)
      (begin
        (prerr_begline_213@misc " Constructor ")
        (begin
          (prerr_constr_25@pr_type x1)
          (begin
            (prerr_endline_232@io " expects an argument")
            (caml-raise 'Toplevel_2@misc))))))
)

(begin
  (define (constant_constr_err_151@ty_error x1)
    (lambda (x2)
       (2-7-constant_constr_err_151@ty_error x1 x2)))
 (define (2-7-constant_constr_err_151@ty_error x1 x2)
    (begin
      (prerr_location_1@location x2)
      (begin
        (prerr_begline_213@misc
          " The constant constructor ")
        (begin
          (prerr_constr_25@pr_type x1)
          (begin
            (prerr_endline_232@io
              " cannot accept an argument")
            (caml-raise 'Toplevel_2@misc))))))
)

(define (illegal_letrec_pat_53@ty_error x1)
  (begin
    (prerr_location_1@location x1)
    (begin
      (prerr_begline_213@misc
        " Only variables are allowed as left-hand sides of \"let rec\"")
      (begin
        (prerr_endline_232@io "")
        (caml-raise 'Toplevel_2@misc)))))


(define (illegal_letrec_expr_66@ty_error x1)
  (begin
    (prerr_location_1@location x1)
    (begin
      (prerr_begline_213@misc
        " This kind of expression is not allowed in right-hand sides of \"let rec\"")
      (begin
        (prerr_endline_232@io "")
        (caml-raise 'Toplevel_2@misc)))))


(begin
  (define (illegal_type_redefinition_102@ty_error x1)
    (lambda (x2)
       (2-10-illegal_type_redefinition_102@ty_error
         x1
         x2)))
 (define (2-10-illegal_type_redefinition_102@ty_error
           x1
           x2)
    (begin
      (prerr_location_1@location x1)
      (begin
        (prerr_begline_213@misc " The type ")
        (begin
          (prerr_type_constr_169@pr_type x2)
          (begin
            (prerr_endline_232@io " must not be redefined.")
            (caml-raise 'Toplevel_2@misc))))))
)

