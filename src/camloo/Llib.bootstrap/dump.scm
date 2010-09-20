;; Le module 
(module
  __caml_dump
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_lexer
    __caml_parser
    __caml_location
    __caml_syntax
    __caml_builtins
    __caml_globals
    __caml_modules
    __caml_types
    __caml_ty_error
    __caml_typing
    __caml_ty_decl
    __caml_pr_decl
    __caml_ty_intf
    __caml_front
    __caml_instruct
    __caml_compiler
    __caml_lam
    __caml_emit_phr
    __caml_prim)
  (export
    (dump_impl_phrase_211@dump x1)
    (2-13-dump_impl_phrase_211@dump x1 x2)
    (dump_imports_34@dump x1)
    (2-133-dump_imports_34@dump x1 x2)
    (dump_impl_61@dump x1)
    (2-18-dump_impl_61@dump x1 x2)
    (dump_syntax_implementation_69@dump x1)
    (2-63-dump_syntax_implementation_69@dump x1 x2)
    mklib_84@dump
    prims_to_dump_51@dump
    scheme_prims_to_dump_236@dump
    (dump_intf_phrase_160@dump x1)
    (write_one_decl_74@dump x1)
    (2-149-write_one_decl_74@dump x1 x2)
    (write_one_scheme_import_decl_237@dump x1)
    (2-145-write_one_scheme_import_decl_237@dump
      x1
      x2)
    (write_one_scheme_export_decl_32@dump x1)
    (2-173-write_one_scheme_export_decl_32@dump
      x1
      x2)
    (write_one_scheme_define_decl_82@dump x1)
    (2-161-write_one_scheme_define_decl_82@dump
      x1
      x2)
    (write_dumped_interface_16@dump x1)
    (2-172-write_dumped_interface_16@dump x1 x2)
    (dump_interface_92@dump x1)
    (2-199-dump_interface_92@dump x1 x2)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (dump_impl_phrase_211@dump x1)
    (lambda (x2)
       (2-13-dump_impl_phrase_211@dump x1 x2)))
 (define (2-13-dump_impl_phrase_211@dump x1 x2)
    (begin
      (reset_type_expression_vars_117@typing #f)
      (let ((x3 (caml-constr-get-field x2 0)))
        (case (caml-regular-constr-tag x3)
          ((1)
           (let ((x4 (2-54-type_expression_168@ty_decl
                       (caml-constr-get-field x2 1)
                       (caml-constr-get-field x3 0))))
             (begin
               (3-232-dump_lambda_193@lam
                 x1
                 #f
                 (translate_expression_98@front
                   (caml-constr-get-field x3 0)))
               (if (cell-ref verbose_226@compiler)
                 (print_expr_98@pr_decl x4)
                 #f))))
          ((2)
           (let ((x4 (3-101-type_letdef_82@ty_decl
                       (caml-constr-get-field x2 1)
                       (caml-constr-get-field x3 0)
                       (caml-constr-get-field x3 1))))
             (begin
               (if (caml-constr-get-field x3 0)
                 (3-232-dump_lambda_193@lam
                   x1
                   #t
                   (2-231-translate_letdef_rec_253@front
                     (caml-constr-get-field x2 1)
                     (caml-constr-get-field x3 1)))
                 (3-232-dump_lambda_193@lam
                   x1
                   #f
                   (2-223-translate_letdef_153@front
                     (caml-constr-get-field x2 1)
                     (caml-constr-get-field x3 1))))
               (if (cell-ref verbose_226@compiler)
                 (print_valdef_178@pr_decl x4)
                 #f))))
          ((3)
           (let ((x4 (2-9-type_typedecl_239@ty_decl
                       (caml-constr-get-field x2 1)
                       (caml-constr-get-field x3 0))))
             (if (cell-ref verbose_226@compiler)
               (print_typedecl_247@pr_decl x4)
               #f)))
          ((4)
           (let ((x4 (2-255-type_excdecl_123@ty_decl
                       (caml-constr-get-field x2 1)
                       (caml-constr-get-field x3 0))))
             (if (cell-ref verbose_226@compiler)
               (print_excdecl_200@pr_decl x4)
               #f)))
          (else
           (do_directive_88@compiler
             (caml-constr-get-field x3 0)))))))
)

(begin
  (define (dump_imports_34@dump x1)
    (lambda (x2) (2-133-dump_imports_34@dump x1 x2)))
 (define (2-133-dump_imports_34@dump x1 x2)
    ((do_list_18@list
       (lambda (x3)
          (begin
            ((output_string_156@io x1) "(import ")
            (begin
              ((output_string_156@io x1)
               (caml-constr-get-field x3 0))
              (begin
                ((output_string_156@io x1) " \"")
                (begin
                  ((output_string_156@io x1)
                   (caml-constr-get-field x3 1))
                  ((output_string_156@io x1) "\")\n")))))))
     x2))
)

(begin
  (define (dump_impl_61@dump x1)
    (lambda (x2) (2-18-dump_impl_61@dump x1 x2)))
 (define (2-18-dump_impl_61@dump x1 x2)
    (let ((x3 ((^_54@string x2) ".ml"))
          (x4 ((^_54@string x2) ".lam")))
      (let ((x5 (open_in_bin_161@io x3))
            (x6 (open_out_142@io x4)))
        (let ((x7 (create_lexer_channel_186@lexing x5)))
          (begin
            (cell-set! input_name_202@location x3)
            (begin
              (cell-set! input_chan_27@location x5)
              (begin
                (cell-set! input_lexbuf_35@location x7)
                (with-handler
                  (lambda (x8)
                     (labels
                       ((staticfail1001
                          ()
                          (begin
                            (close_in x5)
                            (begin
                              (close_out x6)
                              (begin
                                (remove_file_255@misc x4)
                                (caml-raise x8))))))
                       (case (caml-extensible-constr-tag x8)
                         ((End_of_file_1@io)
                          (begin
                            (2-133-dump_imports_34@dump
                              x6
                              (get_ever_opened_modules_184@modules #f))
                            (begin (close_in x5) (close_out x6))))
                         (else (staticfail1001)))))
                  (unwind-protect
                    (begin
                      (push-exception-handler)
                      (let g1007 ()
                        (if #t
                          (begin
                            (2-13-dump_impl_phrase_211@dump
                              x6
                              (parse_impl_phrase_21@compiler x7))
                            (g1007))
                          '())))
                    (pop-exception-handler))))))))))
)

(begin
  (define (dump_syntax_implementation_69@dump x1)
    (lambda (x2)
       (2-63-dump_syntax_implementation_69@dump x1 x2)))
 (define (2-63-dump_syntax_implementation_69@dump x1 x2)
    (begin
      (cell-set! external_types_124@ty_decl '())
      (if (file_exists_172@misc ((^_54@string x2) ".mli"))
        (with-handler
          (lambda (x3)
             (begin
               (remove_file_255@misc ((^_54@string x2) ".zo"))
               (caml-raise x3)))
          (unwind-protect
            (begin
              (push-exception-handler)
              (let ((x3 (read_module_102@modules
                          ((^_54@string x2) ".zi"))))
                (begin
                  (2-158-start_compiling_implementation_91@modules
                    x1
                    x3)
                  (begin
                    (enter_interface_definitions_230@ty_intf x3)
                    (begin
                      (2-18-dump_impl_61@dump x1 x2)
                      (begin
                        (check_interface_106@ty_intf x3)
                        (begin
                          (if (cell-ref write_extended_zi_52@compiler)
                            (let ((x4 ((^_54@string x2) ".zix")))
                              (let ((x5 (open_out_bin_83@io x4)))
                                (with-handler
                                  (lambda (x6)
                                     (begin
                                       (close_out x5)
                                       (begin
                                         (remove_file_255@misc x4)
                                         (caml-raise x6))))
                                  (unwind-protect
                                    (begin
                                      (push-exception-handler)
                                      (begin
                                        (write_compiled_interface_99@modules x5)
                                        (close_out x5)))
                                    (pop-exception-handler)))))
                            #f)
                          (kill_module_137@modules x1))))))))
            (pop-exception-handler)))
        (let ((x3 ((^_54@string x2) ".zi")))
          (let ((x4 (open_out_bin_83@io x3)))
            (with-handler
              (lambda (x5)
                 (begin
                   (close_out x4)
                   (begin (remove_file_255@misc x3) (caml-raise x5))))
              (unwind-protect
                (begin
                  (push-exception-handler)
                  (begin
                    (start_compiling_interface_242@modules x1)
                    (begin
                      (2-18-dump_impl_61@dump x1 x2)
                      (begin
                        (write_compiled_interface_99@modules x4)
                        (close_out x4)))))
                (pop-exception-handler))))))))
)

(define mklib_84@dump (make-cell #f))

(define prims_to_dump_51@dump (make-cell '()))

(define scheme_prims_to_dump_236@dump
  (make-cell '()))


(define (dump_intf_phrase_160@dump x1)
  (let ((x2 (caml-constr-get-field x1 0)))
    (case (caml-regular-constr-tag x2)
      ((1)
       (let ((x3 (lambda (x3)
                    (labels
                      ((staticfail1002 () #f))
                      (case (if (caml-constant-constr?
                                  (caml-constr-get-field x3 2))
                              -1
                              (caml-regular-constr-tag
                                (caml-constr-get-field x3 2)))
                        ((2)
                         (let ((g1008 (caml-constr-get-field
                                        (caml-constr-get-field x3 2)
                                        0)))
                           (cond ((eq? g1008 #f)
                                  (case (if (caml-constant-constr?
                                              (caml-constr-get-field
                                                (caml-constr-get-field x3 2)
                                                2))
                                          -1
                                          (caml-regular-constr-tag
                                            (caml-constr-get-field
                                              (caml-constr-get-field x3 2)
                                              2)))
                                    ((11)
                                     (cell-set!
                                       prims_to_dump_51@dump
                                       (cons (caml-make-regular-3
                                               #f
                                               (caml-constr-get-field x3 0)
                                               (caml-constr-get-field
                                                 (caml-constr-get-field
                                                   (caml-constr-get-field x3 2)
                                                   2)
                                                 0)
                                               (caml-constr-get-field
                                                 (caml-constr-get-field
                                                   (caml-constr-get-field x3 2)
                                                   2)
                                                 1))
                                             (cell-ref prims_to_dump_51@dump))))
                                    (else (staticfail1002))))
                                 (else
                                  (case (if (caml-constant-constr?
                                              (caml-constr-get-field
                                                (caml-constr-get-field x3 2)
                                                2))
                                          -1
                                          (caml-regular-constr-tag
                                            (caml-constr-get-field
                                              (caml-constr-get-field x3 2)
                                              2)))
                                    ((11)
                                     (cell-set!
                                       scheme_prims_to_dump_236@dump
                                       (cons (caml-make-regular
                                               #f
                                               5
                                               (caml-constr-get-field x3 0)
                                               (caml-constr-get-field
                                                 (caml-constr-get-field
                                                   (caml-constr-get-field x3 2)
                                                   2)
                                                 0)
                                               (caml-constr-get-field
                                                 (caml-constr-get-field
                                                   (caml-constr-get-field x3 2)
                                                   0)
                                                 0)
                                               (caml-constr-get-field
                                                 (caml-constr-get-field
                                                   (caml-constr-get-field x3 2)
                                                   0)
                                                 1)
                                               (caml-constr-get-field
                                                 (caml-constr-get-field
                                                   (caml-constr-get-field x3 2)
                                                   2)
                                                 1))
                                             (cell-ref
                                               scheme_prims_to_dump_236@dump))))
                                    (else (staticfail1002)))))))
                        (else (staticfail1002)))))))
         (begin
           (2-220-type_valuedecl_23@ty_decl
             (caml-constr-get-field x1 1)
             (caml-constr-get-field x2 0))
           ((do_list_18@list x3)
            (caml-constr-get-field x2 0)))))
      ((2)
       (let ((x3 (2-9-type_typedecl_239@ty_decl
                   (caml-constr-get-field x1 1)
                   (caml-constr-get-field x2 0))))
         (if (cell-ref verbose_226@compiler)
           (print_typedecl_247@pr_decl x3)
           #f)))
      ((3)
       (let ((x3 (2-255-type_excdecl_123@ty_decl
                   (caml-constr-get-field x1 1)
                   (caml-constr-get-field x2 0))))
         (if (cell-ref verbose_226@compiler)
           (print_excdecl_200@pr_decl x3)
           #f)))
      (else
       (do_directive_88@compiler
         (caml-constr-get-field x2 0))))))


(begin
  (define (write_one_decl_74@dump x1)
    (lambda (x2)
       (2-149-write_one_decl_74@dump x1 x2)))
 (define (2-149-write_one_decl_74@dump x1 x2)
    (if (tree_equal (caml-constr-get-field x2 2) 0)
      ((output_string_156@io x1)
       ((^_54@string "      ")
        ((^_54@string (caml-constr-get-field x2 1)) "\n")))
      (begin
        ((output_string_156@io x1)
         ((^_54@string "      (obj ")
          ((^_54@string (caml-constr-get-field x2 1)) " (")))
        (begin
          (let ((stop1004 (-fx (caml-constr-get-field x2 2) 1)))
            (let for1003 ((i3 0))
              (if (<=fx i3 stop1004)
                (begin
                  ((output_string_156@io x1) "obj ")
                  (for1003 (+fx i3 1)))
                (unspecified))))
          ((output_string_156@io x1)
           ((^_54@string ") \"")
            ((^_54@string (caml-constr-get-field x2 1))
             "\")\n")))))))
)

(begin
  (define (write_one_scheme_import_decl_237@dump x1)
    (lambda (x2)
       (2-145-write_one_scheme_import_decl_237@dump
         x1
         x2)))
 (define (2-145-write_one_scheme_import_decl_237@dump
           x1
           x2)
    ((output_string_156@io x1)
     ((^_54@string "      (")
      ((^_54@string (caml-constr-get-field x2 1))
       ((^_54@string " ")
        ((^_54@string (caml-constr-get-field x2 2))
         ((^_54@string " \"")
          ((^_54@string (caml-constr-get-field x2 3))
           "\")\n"))))))))
)

(begin
  (define (write_one_scheme_export_decl_32@dump x1)
    (lambda (x2)
       (2-173-write_one_scheme_export_decl_32@dump
         x1
         x2)))
 (define (2-173-write_one_scheme_export_decl_32@dump
           x1
           x2)
    (letrec ((x3 (lambda (x4)
                    (lambda (x5)
                       (if (<fx x5 1)
                         x4
                         ((x3 ((^_54@string " obj") x4)) (-fx x5 1)))))))
      (if (tree_equal (caml-constr-get-field x2 4) 0)
        ((output_string_156@io x1)
         ((^_54@string "      ")
          ((^_54@string (caml-constr-get-field x2 1)) "\n")))
        ((output_string_156@io x1)
         ((^_54@string "      (")
          ((^_54@string (caml-constr-get-field x2 1))
           ((^_54@string
              ((x3 "") (caml-constr-get-field x2 4)))
            ")\n")))))))
)

(begin
  (define (write_one_scheme_define_decl_82@dump x1)
    (lambda (x2)
       (2-161-write_one_scheme_define_decl_82@dump
         x1
         x2)))
 (define (2-161-write_one_scheme_define_decl_82@dump
           x1
           x2)
    (letrec ((x3 (lambda (x4)
                    (lambda (x5)
                       (if (<fx x5 1)
                         x4
                         ((x3 ((^_54@string " x")
                               ((^_54@string (string_of_int_188@int x5)) x4)))
                          (-fx x5 1)))))))
      (let ((x4 ((x3 "") (caml-constr-get-field x2 4))))
        (if ((<>_141@eq (caml-constr-get-field x2 0))
             (caml-constr-get-field x2 1))
          (if (tree_equal (caml-constr-get-field x2 4) 0)
            ((output_string_156@io x1)
             ((^_54@string "(define ")
              ((^_54@string (caml-constr-get-field x2 0))
               ((^_54@string " ")
                ((^_54@string (caml-constr-get-field x2 1)) "\n")))))
            ((output_string_156@io x1)
             ((^_54@string "(define (")
              ((^_54@string (caml-constr-get-field x2 0))
               ((^_54@string x4)
                ((^_54@string ") (")
                 ((^_54@string (caml-constr-get-field x2 1))
                  ((^_54@string x4) "))\n"))))))))
          #f))))
)

(begin
  (define (write_dumped_interface_16@dump x1)
    (lambda (x2)
       (2-172-write_dumped_interface_16@dump x1 x2)))
 (define (2-172-write_dumped_interface_16@dump x1 x2)
    (if (not (cell-ref mklib_84@dump))
      (let ((x3 ((^_54@string x2) ".ml"))
            (x4 ((^_54@string x2) ".lam")))
        (begin
          (if (not (file_exists_172@misc x3))
            (let ((x5 (open_out_142@io x4))) (close_out x5))
            #f)
          (let ((x5 ((^_54@string x2) ".sci")))
            (let ((x6 (>fx (list_length_112@list
                             (cell-ref prims_to_dump_51@dump))
                           0)))
              (let ((x7 (2-128-list_filter_194@misc
                          (lambda (x7)
                             (tree_equal
                               (caml-constr-get-field x7 0)
                               (caml-constr-get-field x7 1)))
                          (cell-ref scheme_prims_to_dump_236@dump))))
                (let ((x8 (2-128-list_filter_194@misc
                            (lambda (x8)
                               ((<>_141@eq (caml-constr-get-field x8 0))
                                (caml-constr-get-field x8 1)))
                            (cell-ref scheme_prims_to_dump_236@dump))))
                  (let ((x9 (or (>fx (list_length_112@list x7) 0)
                                (>fx (list_length_112@list x8) 0))))
                    (if (or x6 x9)
                      (let ((x10 (open_out_142@io x5)))
                        (with-handler
                          (lambda (x11)
                             (begin
                               (close_out x10)
                               (begin
                                 (remove_file_255@misc x5)
                                 (caml-raise x11))))
                          (unwind-protect
                            (begin
                              (push-exception-handler)
                              (begin
                                ((output_string_156@io x10) "(directives ")
                                (begin
                                  (if x6
                                    (begin
                                      ((output_string_156@io x10)
                                       "\n   (extern\n")
                                      (begin
                                        ((do_list_18@list
                                           (write_one_decl_74@dump x10))
                                         (cell-ref prims_to_dump_51@dump))
                                        ((output_string_156@io x10) "   )\n")))
                                    #f)
                                  (begin
                                    (if x9
                                      (begin
                                        (if (>fx (list_length_112@list x7) 0)
                                          (begin
                                            ((output_string_156@io x10)
                                             "\n   (from\n")
                                            (begin
                                              ((do_list_18@list
                                                 (write_one_scheme_import_decl_237@dump
                                                   x10))
                                               x7)
                                              ((output_string_156@io x10)
                                               "   )\n")))
                                          #f)
                                        (if (>fx (list_length_112@list x8) 0)
                                          (begin
                                            ((output_string_156@io x10)
                                             "\n   (import\n")
                                            (begin
                                              ((do_list_18@list
                                                 (write_one_scheme_import_decl_237@dump
                                                   x10))
                                               x8)
                                              (begin
                                                ((output_string_156@io x10)
                                                 "   )\n")
                                                (begin
                                                  ((output_string_156@io x10)
                                                   "\n   (export\n")
                                                  (begin
                                                    ((do_list_18@list
                                                       (write_one_scheme_export_decl_32@dump
                                                         x10))
                                                     x8)
                                                    ((output_string_156@io x10)
                                                     "   )\n"))))))
                                          #f))
                                      #f)
                                    (begin
                                      ((output_string_156@io x10) ")\n")
                                      (begin
                                        (if x9
                                          ((do_list_18@list
                                             (write_one_scheme_define_decl_82@dump
                                               x10))
                                           x8)
                                          #f)
                                        (close_out x10)))))))
                            (pop-exception-handler))))
                      #f))))))))
      #f))
)

(begin
  (define (dump_interface_92@dump x1)
    (lambda (x2)
       (2-199-dump_interface_92@dump x1 x2)))
 (define (2-199-dump_interface_92@dump x1 x2)
    (let ((x3 ((^_54@string x2) ".mli"))
          (x4 ((^_54@string x2) ".zi")))
      (let ((x5 (open_in_bin_161@io x3))
            (x6 (open_out_bin_83@io x4)))
        (with-handler
          (lambda (x7)
             (labels
               ((staticfail1006
                  ()
                  (begin
                    (close_in x5)
                    (begin
                      (close_out x6)
                      (begin (remove_file_255@misc x4) (caml-raise x7))))))
               (case (caml-extensible-constr-tag x7)
                 ((End_of_file_1@io)
                  (begin
                    (close_in x5)
                    (begin
                      (write_compiled_interface_99@modules x6)
                      (begin
                        (2-172-write_dumped_interface_16@dump x1 x2)
                        (close_out x6)))))
                 (else (staticfail1006)))))
          (unwind-protect
            (begin
              (push-exception-handler)
              (begin
                (start_compiling_interface_242@modules x1)
                (let ((x7 (create_lexer_channel_186@lexing x5)))
                  (begin
                    (cell-set! input_name_202@location x3)
                    (begin
                      (cell-set! input_chan_27@location x5)
                      (begin
                        (cell-set! input_lexbuf_35@location x7)
                        (begin
                          (cell-set! external_types_124@ty_decl '())
                          (let g1009 ()
                            (if #t
                              (begin
                                (dump_intf_phrase_160@dump
                                  (parse_intf_phrase_10@compiler x7))
                                (g1009))
                              '())))))))))
            (pop-exception-handler))))))
)

