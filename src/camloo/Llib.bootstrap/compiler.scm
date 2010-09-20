;; Le module 
(module
  __caml_compiler
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
    __caml_back
    __caml_emit_phr)
  (export
    (parse_phrase_86@compiler x1)
    (3-202-parse_phrase_86@compiler x1 x2 x3)
    parse_impl_phrase_21@compiler
    parse_intf_phrase_10@compiler
    (do_directive_88@compiler x1)
    verbose_226@compiler
    (compile_intf_phrase_157@compiler x1)
    (compile_interface_171@compiler x1)
    (2-44-compile_interface_171@compiler x1 x2)
    (compile_impl_phrase_72@compiler x1)
    (2-222-compile_impl_phrase_72@compiler x1 x2)
    (compile_impl_92@compiler x1)
    (2-160-compile_impl_92@compiler x1 x2)
    write_extended_zi_52@compiler
    (compile_implementation_215@compiler x1)
    (2-234-compile_implementation_215@compiler x1 x2)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (parse_phrase_86@compiler x1)
    (lambda (x2)
       (lambda (x3)
          (3-202-parse_phrase_86@compiler x1 x2 x3))))
 (define (3-202-parse_phrase_86@compiler x1 x2 x3)
    (letrec ((x4 (lambda (x5)
                    (with-handler
                      (lambda (x6)
                         (labels
                           ((staticfail1002 () (caml-raise x6)))
                           (case (caml-extensible-constr-tag x6)
                             ((Lexical_error_1@lexer) (x4 #f))
                             (else (staticfail1002)))))
                      (unwind-protect
                        (begin
                          (push-exception-handler)
                          (let ((x6 (x2 x3)))
                            (labels
                              ((staticfail1000 () (x4 #f)))
                              (let ((g1010 x6))
                                (cond ((eq? g1010 #<0007>) #f)
                                      ((eq? g1010 #<001f>) #f)
                                      (else (staticfail1000)))))))
                        (pop-exception-handler))))))
      (with-handler
        (lambda (x5)
           (labels
             ((staticfail1004 () (caml-raise x5)))
             (case (caml-extensible-constr-tag x5)
               ((Parse_error_2@parsing)
                (let ((x6 (get_lexeme_start_200@lexing x3)))
                  (let ((x7 (get_lexeme_end_177@lexing x3)))
                    (begin
                      (if (or ((caml-constr-get-field x5 0) #<0007>)
                              ((caml-constr-get-field x5 0) #<001f>))
                        #f
                        (x4 #f))
                      (begin
                        (prerr_location_1@location
                          (caml-make-regular-2 #f x6 x7))
                        (begin
                          (prerr_begline_213@misc " Syntax error.")
                          (begin
                            (prerr_endline_232@io "")
                            (caml-raise 'Toplevel_2@misc))))))))
               ((Lexical_error_1@lexer)
                (begin
                  (if (and (>=fx (caml-constr-get-field x5 1) 0)
                           (>=fx (caml-constr-get-field x5 2) 0))
                    (prerr_location_1@location
                      (caml-make-regular-2
                        #f
                        (caml-constr-get-field x5 1)
                        (caml-constr-get-field x5 2)))
                    #f)
                  (begin
                    (prerr_begline_213@misc " Lexical error: ")
                    (begin
                      (prerr_string_235@io
                        (caml-constr-get-field x5 0))
                      (begin
                        (prerr_endline_232@io ".")
                        (begin (x4 #f) (caml-raise 'Toplevel_2@misc)))))))
               ((Toplevel_2@misc)
                (begin (x4 #f) (caml-raise 'Toplevel_2@misc)))
               (else (staticfail1004)))))
        (unwind-protect
          (begin (push-exception-handler) ((x1 x2) x3))
          (pop-exception-handler)))))
)

(begin
  (define parse_impl_phrase_21@compiler
    ((parse_phrase_86@compiler
       Implementation_42@parser)
     Main_250@lexer))
 (define parse_intf_phrase_10@compiler
    ((parse_phrase_86@compiler Interface_72@parser)
     Main_250@lexer))
)

(define (do_directive_88@compiler x1)
  (labels
    ((staticfail1005
       ()
       (begin
         (prerr_begline_213@misc
           " Warning: unknown directive \"")
         (begin
           (prerr_string_235@io
             (caml-constr-get-field x1 0))
           (prerr_endline2_160@misc "\", ignored.")))))
    (let ((g1011 (caml-constr-get-field x1 0)))
      (cond ((string=? g1011 "open")
             (begin
               (cell-set!
                 used_modules_84@modules
                 (cons (find_module_27@modules
                         (caml-constr-get-field x1 1))
                       (cell-ref used_modules_84@modules)))
               #f))
            ((string=? g1011 "close")
             (begin
               (cell-set!
                 used_modules_84@modules
                 ((exceptq_174@list
                    (find_module_27@modules
                      (caml-constr-get-field x1 1)))
                  (cell-ref used_modules_84@modules)))
               #f))
            ((string=? g1011 "infix")
             (begin
               (add_infix_226@lexer
                 (caml-constr-get-field x1 1))
               #f))
            ((string=? g1011 "uninfix")
             (begin
               (remove_infix_29@lexer
                 (caml-constr-get-field x1 1))
               #f))
            ((string=? g1011 "directory")
             (cell-set!
               load_path_99@misc
               (cons (caml-constr-get-field x1 1)
                     (cell-ref load_path_99@misc))))
            (else (staticfail1005))))))


(define verbose_226@compiler (make-cell #f))

(define (compile_intf_phrase_157@compiler x1)
  (let ((x2 (caml-constr-get-field x1 0)))
    (case (caml-regular-constr-tag x2)
      ((1)
       (begin
         (2-220-type_valuedecl_23@ty_decl
           (caml-constr-get-field x1 1)
           (caml-constr-get-field x2 0))
         #f))
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
  (define (compile_interface_171@compiler x1)
    (lambda (x2)
       (2-44-compile_interface_171@compiler x1 x2)))
 (define (2-44-compile_interface_171@compiler x1 x2)
    (let ((x3 ((^_54@string x2) ".mli"))
          (x4 ((^_54@string x2) ".zi")))
      (let ((x5 (open_in_bin_161@io x3))
            (x6 (open_out_bin_83@io x4)))
        (with-handler
          (lambda (x7)
             (labels
               ((staticfail1007
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
                      (close_out x6))))
                 (else (staticfail1007)))))
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
                          (let g1012 ()
                            (if #t
                              (begin
                                (compile_intf_phrase_157@compiler
                                  (parse_intf_phrase_10@compiler x7))
                                (g1012))
                              '())))))))))
            (pop-exception-handler))))))
)

(begin
  (define (compile_impl_phrase_72@compiler x1)
    (lambda (x2)
       (2-222-compile_impl_phrase_72@compiler x1 x2)))
 (define (2-222-compile_impl_phrase_72@compiler x1 x2)
    (begin
      (reset_type_expression_vars_117@typing #f)
      (let ((x3 (caml-constr-get-field x2 0)))
        (case (caml-regular-constr-tag x3)
          ((1)
           (let ((x4 (2-54-type_expression_168@ty_decl
                       (caml-constr-get-field x2 1)
                       (caml-constr-get-field x3 0))))
             (begin
               (3-69-emit_phrase_15@emit_phr
                 x1
                 (expr_is_pure_5@syntax
                   (caml-constr-get-field x3 0))
                 (2-140-compile_lambda_215@back
                   #f
                   (translate_expression_98@front
                     (caml-constr-get-field x3 0))))
               (if (cell-ref verbose_226@compiler)
                 (print_expr_98@pr_decl x4)
                 #f))))
          ((2)
           (let ((x4 (3-101-type_letdef_82@ty_decl
                       (caml-constr-get-field x2 1)
                       (caml-constr-get-field x3 0)
                       (caml-constr-get-field x3 1))))
             (begin
               (3-69-emit_phrase_15@emit_phr
                 x1
                 (letdef_is_pure_151@syntax
                   (caml-constr-get-field x3 1))
                 (if (caml-constr-get-field x3 0)
                   (2-140-compile_lambda_215@back
                     #t
                     (2-231-translate_letdef_rec_253@front
                       (caml-constr-get-field x2 1)
                       (caml-constr-get-field x3 1)))
                   (2-140-compile_lambda_215@back
                     #f
                     (2-223-translate_letdef_153@front
                       (caml-constr-get-field x2 1)
                       (caml-constr-get-field x3 1)))))
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
  (define (compile_impl_92@compiler x1)
    (lambda (x2)
       (2-160-compile_impl_92@compiler x1 x2)))
 (define (2-160-compile_impl_92@compiler x1 x2)
    (let ((x3 ((^_54@string x2) ".ml"))
          (x4 ((^_54@string x2) ".zo")))
      (let ((x5 (open_in_bin_161@io x3))
            (x6 (open_out_bin_83@io x4)))
        (let ((x7 (create_lexer_channel_186@lexing x5)))
          (begin
            (cell-set! input_name_202@location x3)
            (begin
              (cell-set! input_chan_27@location x5)
              (begin
                (cell-set! input_lexbuf_35@location x7)
                (begin
                  (start_emit_phrase_36@emit_phr x6)
                  (with-handler
                    (lambda (x8)
                       (labels
                         ((staticfail1009
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
                              (end_emit_phrase_38@emit_phr x6)
                              (begin (close_in x5) (close_out x6))))
                           (else (staticfail1009)))))
                    (unwind-protect
                      (begin
                        (push-exception-handler)
                        (let g1013 ()
                          (if #t
                            (begin
                              (2-222-compile_impl_phrase_72@compiler
                                x6
                                (parse_impl_phrase_21@compiler x7))
                              (g1013))
                            '())))
                      (pop-exception-handler)))))))))))
)

(define write_extended_zi_52@compiler
  (make-cell #f))


(begin
  (define (compile_implementation_215@compiler x1)
    (lambda (x2)
       (2-234-compile_implementation_215@compiler x1 x2)))
 (define (2-234-compile_implementation_215@compiler x1 x2)
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
                      (2-160-compile_impl_92@compiler x1 x2)
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
                      (2-160-compile_impl_92@compiler x1 x2)
                      (begin
                        (write_compiled_interface_99@modules x4)
                        (close_out x4)))))
                (pop-exception-handler))))))))
)

