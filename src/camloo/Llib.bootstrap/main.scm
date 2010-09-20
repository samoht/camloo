;; Le module 
(module
  __caml_main
  (library camloo-runtime)
  (import
    __caml_config
    __caml_misc
    __caml_modules
    __caml_compiler
    __caml_dump
    __caml_version)
  (export
    (anonymous_150@main x1)
    (c2b_254@main x1)
    (set_stdlib_160@main x1)
    (add_include_184@main x1)
    (open_set_165@main x1)
    (show_version_33@main x1)
    (show_types_flag_89@main x1)
    (debug_option_218@main x1)
    (mklib_option_180@main x1)
    (main_109@main x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (anonymous_150@main x1)
    (if ((check_suffix_88@filename x1) ".ml")
      (let ((x2 ((chop_suffix_96@filename x1) ".ml")))
        (2-234-compile_implementation_215@compiler
          (basename_226@filename x2)
          x2))
      (if ((check_suffix_88@filename x1) ".mli")
        (let ((x2 ((chop_suffix_96@filename x1) ".mli")))
          (2-44-compile_interface_171@compiler
            (basename_226@filename x2)
            x2))
        (caml-raise
          (caml-make-static-extensible-1
            'Bad_1@arg
            ((^_54@string "don't know what to do with ") x1))))))
 (begin
    (define (c2b_254@main x1)
      (if ((check_suffix_88@filename x1) ".ml")
        (let ((x2 ((chop_suffix_96@filename x1) ".ml")))
          (2-63-dump_syntax_implementation_69@dump
            (basename_226@filename x2)
            x2))
        (if ((check_suffix_88@filename x1) ".mli")
          (let ((x2 ((chop_suffix_96@filename x1) ".mli")))
            (2-199-dump_interface_92@dump
              (basename_226@filename x2)
              x2))
          (caml-raise
            (caml-make-static-extensible-1
              'Bad_1@arg
              ((^_54@string "don't know what to do with ") x1))))))
   (begin
      (define (set_stdlib_160@main x1)
        (begin
          (cell-set! path_library_222@config x1)
          (cell-set!
            load_path_99@misc
            (cons (cell-ref path_library_222@config) '()))))
     (begin
        (define (add_include_184@main x1)
          (cell-set!
            load_path_99@misc
            (cons x1 (cell-ref load_path_99@misc))))
       (begin
          (define (open_set_165@main x1)
            (with-handler
              (lambda (x2)
                 (labels
                   ((staticfail1001 () (caml-raise x2)))
                   (case (caml-extensible-constr-tag x2)
                     ((Not_found_4@exc)
                      (caml-raise
                        (caml-make-static-extensible-1
                          'Bad_1@arg
                          ((^_54@string "unknown module set ") x1))))
                     (else (staticfail1001)))))
              (unwind-protect
                (begin
                  (push-exception-handler)
                  (cell-set!
                    default_used_modules_33@modules
                    ((assoc_252@list x1)
                     default_used_interfaces_171@config)))
                (pop-exception-handler))))
         (begin
            (define (show_version_33@main x1)
              (begin
                (prerr_string_235@io banner_209@version)
                (prerr_endline_232@io "")))
           (begin
              (define (show_types_flag_89@main x1)
                (cell-set! verbose_226@compiler #t))
             (begin
                (define (debug_option_218@main x1)
                  (cell-set! write_extended_zi_52@compiler #t))
               (define (mklib_option_180@main x1)
                  (cell-set! mklib_84@dump #t))
))))))))

(define (main_109@main x1)
  (with-handler
    (lambda (x2)
       (labels
         ((staticfail1003 () (caml-raise x2)))
         (case (caml-extensible-constr-tag x2)
           ((Toplevel_2@misc) (exit_246@io 2))
           ((Break_2@sys) (exit_246@io 3))
           ((Zinc_1@misc)
            (begin
              (prerr_string_235@io "# Internal error: ")
              (begin
                (prerr_endline_232@io
                  (caml-constr-get-field x2 0))
                (exit_246@io 4))))
           (else (staticfail1003)))))
    (unwind-protect
      (begin
        (push-exception-handler)
        (begin
          (sys_catch_break #t)
          (begin
            (cell-set!
              default_used_modules_33@modules
              ((assoc_252@list "cautious")
               default_used_interfaces_171@config))
            (begin
              (cell-set!
                load_path_99@misc
                (cons (cell-ref path_library_222@config) '()))
              (((parse_vect_143@arg x1)
                (cons (caml-make-regular-2
                        #f
                        "-stdlib"
                        (caml-make-regular-1 #f set_stdlib_160@main))
                      (cons (caml-make-regular-2
                              #f
                              "-I"
                              (caml-make-regular-1 #f add_include_184@main))
                            (cons (caml-make-regular-2
                                    #f
                                    "-include"
                                    (caml-make-regular-1
                                      #f
                                      add_include_184@main))
                                  (cons (caml-make-regular-2
                                          #f
                                          "-O"
                                          (caml-make-regular-1
                                            #f
                                            open_set_165@main))
                                        (cons (caml-make-regular-2
                                                #f
                                                "-open"
                                                (caml-make-regular-1
                                                  #f
                                                  open_set_165@main))
                                              (cons (caml-make-regular-2
                                                      #f
                                                      "-v"
                                                      (caml-make-regular-1
                                                        #unspecified
                                                        show_version_33@main))
                                                    (cons (caml-make-regular-2
                                                            #f
                                                            "-version"
                                                            (caml-make-regular-1
                                                              #unspecified
                                                              show_version_33@main))
                                                          (cons (caml-make-regular-2
                                                                  #f
                                                                  "-i"
                                                                  (caml-make-regular-1
                                                                    #unspecified
                                                                    show_types_flag_89@main))
                                                                (cons (caml-make-regular-2
                                                                        #f
                                                                        "-g"
                                                                        (caml-make-regular-1
                                                                          #unspecified
                                                                          debug_option_218@main))
                                                                      (cons (caml-make-regular-2
                                                                              #f
                                                                              "-debug"
                                                                              (caml-make-regular-1
                                                                                #unspecified
                                                                                debug_option_218@main))
                                                                            (cons (caml-make-regular-2
                                                                                    #f
                                                                                    "-dump"
                                                                                    (caml-make-regular-1
                                                                                      #f
                                                                                      c2b_254@main))
                                                                                  (cons (caml-make-regular-2
                                                                                          #f
                                                                                          "-mklib"
                                                                                          (caml-make-regular-1
                                                                                            #unspecified
                                                                                            mklib_option_180@main))
                                                                                        (cons (caml-make-regular-2
                                                                                                #f
                                                                                                "-"
                                                                                                (caml-make-regular-1
                                                                                                  #f
                                                                                                  anonymous_150@main))
                                                                                              '()))))))))))))))
               anonymous_150@main)))))
      (pop-exception-handler))))


