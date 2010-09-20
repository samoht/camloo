;; Le module 
(module
  __caml_lam
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_lambda
    __caml_prim
    __caml_globals)
  (export
    (string_for_C_read_34@lam x1)
    current_out_stream_102@lam
    (ps_179@lam x1)
    (pn_129@lam x1)
    (pc_182@lam x1)
    (pi_71@lam x1)
    (pf_249@lam x1)
    (prim_test_234@lam x1)
    (dump_lam_160@lam x1)
    (dump_struct_constant_199@lam x1)
    (dump_lams_227@lam x1)
    (pdummy_size_74@lam x1)
    (dump_primitive_237@lam x1)
    (dump_atomic_constant_103@lam x1)
    (dump_constr_95@lam x1)
    (dump_constr_tag_75@lam x1)
    (dump_qualified_ident_170@lam x1)
    (dump_bool_test_110@lam x1)
    (dump_float_primitive_199@lam x1)
    (dump_lambda_193@lam x1)
    (3-232-dump_lambda_193@lam x1 x2 x3)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (string_for_C_read_34@lam x1)
  (let ((x2 0))
    (begin
      (let ((stop1001 (-fx (string-length x1) 1)))
        (let for1000 ((i3 0))
          (if (<=fx i3 stop1001)
            (begin
              (set! x2
                (+fx x2
                     (let ((x5 ((nth_char_166@string x1) i3)))
                       (labels
                         ((staticfail1002 () (if (is_printable x5) 1 4)))
                         (case x5
                           ((#\tab #\newline #\\ #\") 2)
                           (else (staticfail1002)))))))
              (for1000 (+fx i3 1)))
            (unspecified))))
      (if (eq? x2 (string-length x1))
        x1
        (let ((x3 (create_string_138@string x2)))
          (begin
            (set! x2 0)
            (begin
              (let ((stop1004 (-fx (string-length x1) 1)))
                (let for1003 ((i4 0))
                  (if (<=fx i4 stop1004)
                    (begin
                      (begin
                        (let ((x6 ((nth_char_166@string x1) i4)))
                          (labels
                            ((staticfail1005
                               ()
                               (if (is_printable x6)
                                 (((set_nth_char_28@string x3) x2) x6)
                                 (let ((x7 (int_of_char x6)))
                                   (begin
                                     (((set_nth_char_28@string x3) x2) #\\)
                                     (begin
                                       (set! x2 (+fx x2 1))
                                       (begin
                                         (((set_nth_char_28@string x3) x2)
                                          (char_of_int_212@char
                                            (+fx 48 (/fx x7 64))))
                                         (begin
                                           (set! x2 (+fx x2 1))
                                           (begin
                                             (((set_nth_char_28@string x3) x2)
                                              (char_of_int_212@char
                                                (+fx 48 (modulo (/fx x7 8) 8))))
                                             (begin
                                               (set! x2 (+fx x2 1))
                                               (((set_nth_char_28@string x3) x2)
                                                (char_of_int_212@char
                                                  (+fx 48
                                                       (modulo
                                                         x7
                                                         8))))))))))))))
                            (case x6
                              ((#\")
                               (begin
                                 (((set_nth_char_28@string x3) x2) #\\)
                                 (begin
                                   (set! x2 (+fx x2 1))
                                   (((set_nth_char_28@string x3) x2) #\"))))
                              ((#\\)
                               (begin
                                 (((set_nth_char_28@string x3) x2) #\\)
                                 (begin
                                   (set! x2 (+fx x2 1))
                                   (((set_nth_char_28@string x3) x2) #\\))))
                              ((#\newline)
                               (begin
                                 (((set_nth_char_28@string x3) x2) #\\)
                                 (begin
                                   (set! x2 (+fx x2 1))
                                   (((set_nth_char_28@string x3) x2) #\n))))
                              ((#\tab)
                               (begin
                                 (((set_nth_char_28@string x3) x2) #\\)
                                 (begin
                                   (set! x2 (+fx x2 1))
                                   (((set_nth_char_28@string x3) x2) #\t))))
                              (else (staticfail1005)))))
                        (set! x2 (+fx x2 1)))
                      (for1003 (+fx i4 1)))
                    (unspecified))))
              x3)))))))


(define current_out_stream_102@lam
  (make-cell stdout_127@io))


(define (ps_179@lam x1)
  ((output_string_156@io
     (cell-ref current_out_stream_102@lam))
   x1))


(define (pn_129@lam x1)
  (output_char
    (cell-ref current_out_stream_102@lam)
    #\newline))


(define (pc_182@lam x1)
  (output_char
    (cell-ref current_out_stream_102@lam)
    x1))


(define (pi_71@lam x1)
  (ps_179@lam (string_of_int_188@int x1)))


(define (pf_249@lam x1)
  (begin
    (((fprintf_48@printf
        (cell-ref current_out_stream_102@lam))
      "%f")
     x1)
    #f))


(define (prim_test_234@lam x1)
  (let ((g1012 x1))
    (cond ((eq? g1012 #f) (ps_179@lam "PTeq"))
          ((eq? g1012 #t) (ps_179@lam "PTnoteq"))
          ((eq? g1012 #u0000) (ps_179@lam "PTlt"))
          ((eq? g1012 #a000) (ps_179@lam "PTle"))
          ((eq? g1012 #<0006>) (ps_179@lam "PTgt"))
          ((eq? g1012 #<0007>) (ps_179@lam "PTge"))
          (else (ps_179@lam "PTnoteqimm")))))


(begin
  (define (dump_lam_160@lam x1)
    (let ((g1013 x1))
      (cond ((eq? g1013 #<000a>)
             (ps_179@lam "(Lstaticfail)"))
            (else
             (case (caml-regular-constr-tag g1013)
               ((1)
                (begin
                  (ps_179@lam "(Lvar ")
                  (begin
                    (pi_71@lam (caml-constr-get-field x1 0))
                    (ps_179@lam ")"))))
               ((2)
                (begin
                  (ps_179@lam "(Lconst ")
                  (begin
                    (dump_struct_constant_199@lam
                      (caml-constr-get-field x1 0))
                    (ps_179@lam ")"))))
               ((3)
                (begin
                  (ps_179@lam "(Lapply ")
                  (begin
                    (dump_lam_160@lam (caml-constr-get-field x1 0))
                    (begin
                      (dump_lams_227@lam (caml-constr-get-field x1 1))
                      (ps_179@lam ")")))))
               ((4)
                (begin
                  (ps_179@lam "(Lfunction ")
                  (begin
                    (dump_lam_160@lam (caml-constr-get-field x1 0))
                    (ps_179@lam ")"))))
               ((5)
                (labels
                  ((staticfail1006
                     ()
                     (begin
                       (ps_179@lam "(Llet ")
                       (begin
                         (dump_lams_227@lam (caml-constr-get-field x1 0))
                         (begin
                           (ps_179@lam " ")
                           (begin
                             (dump_lam_160@lam (caml-constr-get-field x1 1))
                             (ps_179@lam ")")))))))
                  (if (null? (caml-constr-get-field x1 0))
                    (dump_lam_160@lam (caml-constr-get-field x1 1))
                    (staticfail1006))))
               ((6)
                (begin
                  (ps_179@lam "(Lletrec (")
                  (begin
                    ((do_list_18@list
                       (lambda (x2)
                          (begin
                            (ps_179@lam "(")
                            (begin
                              (dump_lam_160@lam (caml-constr-get-field x2 0))
                              (begin
                                (ps_179@lam " (")
                                (begin
                                  (pdummy_size_74@lam
                                    (caml-constr-get-field x2 1))
                                  (ps_179@lam "))")))))))
                     (caml-constr-get-field x1 0))
                    (begin
                      (ps_179@lam ") ")
                      (begin
                        (dump_lam_160@lam (caml-constr-get-field x1 1))
                        (ps_179@lam ")"))))))
               ((7)
                (begin
                  (ps_179@lam "(Lprim ")
                  (begin
                    (dump_primitive_237@lam
                      (caml-constr-get-field x1 0))
                    (begin
                      (ps_179@lam " ")
                      (begin
                        (dump_lams_227@lam (caml-constr-get-field x1 1))
                        (ps_179@lam ")"))))))
               ((8)
                (begin
                  (ps_179@lam "(Lcond ")
                  (begin
                    (dump_lam_160@lam (caml-constr-get-field x1 0))
                    (begin
                      (ps_179@lam " (")
                      (begin
                        ((do_list_18@list
                           (lambda (x2)
                              (begin
                                (ps_179@lam "(")
                                (begin
                                  (dump_atomic_constant_103@lam
                                    (caml-constr-get-field x2 0))
                                  (begin
                                    (ps_179@lam " ")
                                    (begin
                                      (dump_lam_160@lam
                                        (caml-constr-get-field x2 1))
                                      (ps_179@lam ") ")))))))
                         (caml-constr-get-field x1 1))
                        (ps_179@lam "))"))))))
               ((9)
                (begin
                  (ps_179@lam "(Lswitch ")
                  (begin
                    (pi_71@lam (caml-constr-get-field x1 0))
                    (begin
                      (ps_179@lam " ")
                      (begin
                        (dump_lam_160@lam (caml-constr-get-field x1 1))
                        (begin
                          (ps_179@lam "(")
                          (begin
                            ((do_list_18@list
                               (lambda (x2)
                                  (begin
                                    (ps_179@lam "(")
                                    (begin
                                      (dump_constr_95@lam
                                        (caml-constr-get-field x2 0))
                                      (begin
                                        (ps_179@lam " ")
                                        (begin
                                          (dump_lam_160@lam
                                            (caml-constr-get-field x2 1))
                                          (ps_179@lam ") ")))))))
                             (caml-constr-get-field x1 2))
                            (ps_179@lam "))"))))))))
               ((11)
                (begin
                  (ps_179@lam "(Lstatichandle ")
                  (begin
                    (dump_lam_160@lam (caml-constr-get-field x1 0))
                    (begin
                      (ps_179@lam " ")
                      (begin
                        (dump_lam_160@lam (caml-constr-get-field x1 1))
                        (ps_179@lam ")"))))))
               ((12)
                (begin
                  (ps_179@lam "(Lhandle ")
                  (begin
                    (dump_lam_160@lam (caml-constr-get-field x1 0))
                    (begin
                      (ps_179@lam " ")
                      (begin
                        (dump_lam_160@lam (caml-constr-get-field x1 1))
                        (ps_179@lam ")"))))))
               ((13)
                (begin
                  (ps_179@lam "(Lifthenelse ")
                  (begin
                    (dump_lam_160@lam (caml-constr-get-field x1 0))
                    (begin
                      (ps_179@lam " ")
                      (begin
                        (dump_lam_160@lam (caml-constr-get-field x1 1))
                        (begin
                          (ps_179@lam " ")
                          (begin
                            (dump_lam_160@lam (caml-constr-get-field x1 2))
                            (ps_179@lam ")"))))))))
               ((14)
                (begin
                  (ps_179@lam "(Lsequence ")
                  (begin
                    (dump_lam_160@lam (caml-constr-get-field x1 0))
                    (begin
                      (ps_179@lam " ")
                      (begin
                        (dump_lam_160@lam (caml-constr-get-field x1 1))
                        (ps_179@lam ")"))))))
               ((15)
                (begin
                  (ps_179@lam "(Lwhile ")
                  (begin
                    (dump_lam_160@lam (caml-constr-get-field x1 0))
                    (begin
                      (ps_179@lam " ")
                      (begin
                        (dump_lam_160@lam (caml-constr-get-field x1 1))
                        (ps_179@lam ")"))))))
               ((16)
                (begin
                  (ps_179@lam "(Lfor ")
                  (begin
                    (dump_lam_160@lam (caml-constr-get-field x1 0))
                    (begin
                      (ps_179@lam " ")
                      (begin
                        (dump_lam_160@lam (caml-constr-get-field x1 1))
                        (begin
                          (ps_179@lam " ")
                          (begin
                            (if (caml-constr-get-field x1 2)
                              (ps_179@lam "#t ")
                              (ps_179@lam "#f "))
                            (begin
                              (dump_lam_160@lam (caml-constr-get-field x1 3))
                              (ps_179@lam ")")))))))))
               ((17)
                (begin
                  (ps_179@lam "(Lsequand ")
                  (begin
                    (dump_lam_160@lam (caml-constr-get-field x1 0))
                    (begin
                      (ps_179@lam " ")
                      (begin
                        (dump_lam_160@lam (caml-constr-get-field x1 1))
                        (ps_179@lam ")"))))))
               ((18)
                (begin
                  (ps_179@lam "(Lsequor ")
                  (begin
                    (dump_lam_160@lam (caml-constr-get-field x1 0))
                    (begin
                      (ps_179@lam " ")
                      (begin
                        (dump_lam_160@lam (caml-constr-get-field x1 1))
                        (ps_179@lam ")"))))))
               (else
                (begin
                  (ps_179@lam "(Lshared ")
                  (begin
                    (dump_lam_160@lam (caml-constr-get-field x1 0))
                    (begin
                      (ps_179@lam " ")
                      (begin
                        (pi_71@lam
                          (cell-ref (caml-constr-get-field x1 1)))
                        (ps_179@lam ")")))))))))))
 (begin
    (define (dump_lams_227@lam x1)
      (begin
        (ps_179@lam "(")
        (begin
          ((do_list_18@list
             (lambda (x2)
                (begin (dump_lam_160@lam x2) (ps_179@lam " "))))
           x1)
          (ps_179@lam ")"))))
   (begin
      (define (dump_atomic_constant_103@lam x1)
        (case (caml-regular-constr-tag x1)
          ((1) (pi_71@lam (caml-constr-get-field x1 0)))
          ((2) (pf_249@lam (caml-constr-get-field x1 0)))
          ((3)
           (begin
             (ps_179@lam "#")
             (begin
               (pc_182@lam #\")
               (begin
                 (ps_179@lam
                   (string_for_C_read_34@lam
                     (caml-constr-get-field x1 0)))
                 (pc_182@lam #\")))))
          (else
           (labels
             ((staticfail1007
                ()
                (begin
                  (ps_179@lam "#a")
                  (let ((x2 (int_of_char (caml-constr-get-field x1 0))))
                    (let ((x3 (string_of_int_188@int x2)))
                      (if (<fx x2 10)
                        (begin (ps_179@lam "00") (ps_179@lam x3))
                        (if (<fx x2 100)
                          (begin (ps_179@lam "0") (ps_179@lam x3))
                          (ps_179@lam x3))))))))
             (let ((g1014 (caml-constr-get-field x1 0)))
               (cond ((char=? g1014 #\newline)
                      (begin (ps_179@lam "#\\") (ps_179@lam "Newline")))
                     ((char=? g1014 #\tab)
                      (begin (ps_179@lam "#\\") (ps_179@lam "tab")))
                     (else (staticfail1007))))))))
     (begin
        (define (dump_struct_constant_199@lam x1)
          (case (caml-regular-constr-tag x1)
            ((1)
             (begin
               (ps_179@lam "(SCatom ")
               (begin
                 (dump_atomic_constant_103@lam
                   (caml-constr-get-field x1 0))
                 (ps_179@lam ")"))))
            (else
             (begin
               (ps_179@lam "(SCblock ")
               (begin
                 (dump_constr_tag_75@lam
                   (caml-constr-get-field x1 0))
                 (begin
                   (ps_179@lam " (")
                   (begin
                     ((do_list_18@list
                        (lambda (x2)
                           (begin
                             (dump_struct_constant_199@lam x2)
                             (ps_179@lam " "))))
                      (caml-constr-get-field x1 1))
                     (ps_179@lam "))"))))))))
       (begin
          (define (dump_qualified_ident_170@lam x1)
            (begin
              (ps_179@lam "(qualifiedident ")
              (begin
                (pc_182@lam #\")
                (begin
                  (ps_179@lam (caml-constr-get-field x1 0))
                  (begin
                    (pc_182@lam #\")
                    (begin
                      (ps_179@lam " ")
                      (begin
                        (pc_182@lam #\")
                        (begin
                          (ps_179@lam (caml-constr-get-field x1 1))
                          (begin (pc_182@lam #\") (ps_179@lam ")"))))))))))
         (begin
            (define (dump_constr_tag_75@lam x1)
              (case (caml-regular-constr-tag x1)
                ((1)
                 (begin
                   (ps_179@lam "(ConstrExtensible ")
                   (begin
                     (dump_qualified_ident_170@lam
                       (caml-constr-get-field x1 0))
                     (begin
                       (ps_179@lam " ")
                       (begin
                         (pi_71@lam (caml-constr-get-field x1 1))
                         (ps_179@lam ")"))))))
                (else
                 (begin
                   (ps_179@lam "(ConstrRegular ")
                   (begin
                     (dump_qualified_ident_170@lam
                       (caml-constr-get-field x1 0))
                     (begin
                       (ps_179@lam " ")
                       (begin
                         (pi_71@lam (caml-constr-get-field x1 1))
                         (begin
                           (ps_179@lam " ")
                           (begin
                             (pi_71@lam (caml-constr-get-field x1 2))
                             (ps_179@lam ")"))))))))))
           (begin
              (define (dump_constr_95@lam x1)
                (let ((x2 (caml-constr-get-field
                            (caml-constr-get-field x1 1)
                            3)))
                  (case (caml-regular-constr-tag x2)
                    ((1)
                     (begin
                       (ps_179@lam "(ConstrExtensible ")
                       (begin
                         (dump_qualified_ident_170@lam
                           (caml-constr-get-field x2 0))
                         (begin
                           (ps_179@lam " ")
                           (begin
                             (pi_71@lam (caml-constr-get-field x2 1))
                             (ps_179@lam ")"))))))
                    (else
                     (let ((x3 (caml-constr-get-field
                                 (caml-constr-get-field x1 1)
                                 4)))
                       (labels
                         ((staticfail1008
                            ()
                            (begin
                              (ps_179@lam "(ConstrRegular ")
                              (begin
                                (dump_qualified_ident_170@lam
                                  (caml-constr-get-field x2 0))
                                (begin
                                  (ps_179@lam " ")
                                  (begin
                                    (pi_71@lam (caml-constr-get-field x2 1))
                                    (begin
                                      (ps_179@lam " ")
                                      (begin
                                        (pi_71@lam (caml-constr-get-field x2 2))
                                        (ps_179@lam ")")))))))))
                         (let ((g1015 x3))
                           (cond ((eq? g1015 #f)
                                  (begin
                                    (ps_179@lam "(ConstrConstant ")
                                    (begin
                                      (dump_qualified_ident_170@lam
                                        (caml-constr-get-field x2 0))
                                      (begin
                                        (ps_179@lam " ")
                                        (begin
                                          (pi_71@lam
                                            (caml-constr-get-field x2 1))
                                          (begin
                                            (ps_179@lam " ")
                                            (begin
                                              (pi_71@lam
                                                (caml-constr-get-field x2 2))
                                              (ps_179@lam ")"))))))))
                                 (else (staticfail1008))))))))))
             (begin
                (define (pdummy_size_74@lam x1)
                  (let ((g1016 x1))
                    (cond ((eq? g1016 #unspecified)
                           (ps_179@lam "function "))
                          ((eq? g1016 #<0006>) (ps_179@lam "stream"))
                          ((eq? g1016 #<0007>) (ps_179@lam "parser"))
                          (else
                           (case (caml-regular-constr-tag g1016)
                             ((1)
                              (begin
                                (ps_179@lam "tuple ")
                                (pi_71@lam (caml-constr-get-field x1 0))))
                             ((2)
                              (begin
                                (dump_constr_95@lam
                                  (caml-constr-get-field x1 0))
                                (pi_71@lam (caml-constr-get-field x1 1))))
                             ((4)
                              (begin
                                (ps_179@lam "vector ")
                                (pi_71@lam (caml-constr-get-field x1 0))))
                             (else
                              (begin
                                (ps_179@lam "record ")
                                (pi_71@lam (caml-constr-get-field x1 0)))))))))
               (begin
                  (define (dump_primitive_237@lam x1)
                    (let ((g1017 x1))
                      (cond ((eq? g1017 #f) (ps_179@lam "Pidentity"))
                            ((eq? g1017 #a000) (ps_179@lam "Pupdate"))
                            ((eq? g1017 #<0008>) (ps_179@lam "Ptag-of"))
                            ((eq? g1017 #<000c>) (ps_179@lam "Praise"))
                            ((eq? g1017 #<000d>) (ps_179@lam "Pnot"))
                            ((eq? g1017 #<000e>) (ps_179@lam "Pnegint"))
                            ((eq? g1017 #<000f>) (ps_179@lam "Psuccint"))
                            ((eq? g1017 #<0010>) (ps_179@lam "Ppredint"))
                            ((eq? g1017 #<0011>) (ps_179@lam "Paddint"))
                            ((eq? g1017 #<0012>) (ps_179@lam "Psubint"))
                            ((eq? g1017 #<0013>) (ps_179@lam "Pmulint"))
                            ((eq? g1017 #<0014>) (ps_179@lam "Pdivint"))
                            ((eq? g1017 #<0015>) (ps_179@lam "Pmodint"))
                            ((eq? g1017 #<0016>) (ps_179@lam "Pandint"))
                            ((eq? g1017 #<0017>) (ps_179@lam "Porint"))
                            ((eq? g1017 #<0018>) (ps_179@lam "Pxorint"))
                            ((eq? g1017 #<0019>)
                             (ps_179@lam "Pshiftleftint"))
                            ((eq? g1017 #<001a>)
                             (ps_179@lam "Pshiftrightintsigned"))
                            ((eq? g1017 #<001b>)
                             (ps_179@lam "Pshiftrightintunsigned"))
                            ((eq? g1017 #<001c>) (ps_179@lam "Pincr"))
                            ((eq? g1017 #<001d>) (ps_179@lam "Pdecr"))
                            ((eq? g1017 #<001e>) (ps_179@lam "Pintoffloat"))
                            ((eq? g1017 #<0020>)
                             (ps_179@lam "Pstringlength"))
                            ((eq? g1017 #<0021>)
                             (ps_179@lam "Pgetstringchar"))
                            ((eq? g1017 #<0022>)
                             (ps_179@lam "Psetstringchar"))
                            ((eq? g1017 #<0023>) (ps_179@lam "Pmakevector"))
                            ((eq? g1017 #<0024>) (ps_179@lam "Pvectlength"))
                            ((eq? g1017 #<0025>) (ps_179@lam "Pgetvectitem"))
                            ((eq? g1017 #<0026>) (ps_179@lam "Psetvectitem"))
                            (else
                             (case (caml-regular-constr-tag g1017)
                               ((2)
                                (begin
                                  (ps_179@lam "(Pget_global ")
                                  (begin
                                    (dump_qualified_ident_170@lam
                                      (caml-constr-get-field x1 0))
                                    (ps_179@lam ")"))))
                               ((3)
                                (begin
                                  (ps_179@lam "(Pset_global ")
                                  (begin
                                    (dump_qualified_ident_170@lam
                                      (caml-constr-get-field x1 0))
                                    (ps_179@lam ")"))))
                               ((4)
                                (begin
                                  (ps_179@lam "(Pdummy ")
                                  (begin
                                    (pdummy_size_74@lam
                                      (caml-constr-get-field x1 0))
                                    (ps_179@lam ")"))))
                               ((6)
                                (begin
                                  (ps_179@lam "(Ptest ")
                                  (begin
                                    (dump_bool_test_110@lam
                                      (caml-constr-get-field x1 0))
                                    (ps_179@lam ")"))))
                               ((7)
                                (begin
                                  (ps_179@lam "(Pmakeblock ")
                                  (begin
                                    (dump_constr_tag_75@lam
                                      (caml-constr-get-field x1 0))
                                    (ps_179@lam ")"))))
                               ((9)
                                (begin
                                  (ps_179@lam "(Pfield ")
                                  (begin
                                    (pi_71@lam (caml-constr-get-field x1 0))
                                    (ps_179@lam ")"))))
                               ((10)
                                (begin
                                  (ps_179@lam "(Psetfield ")
                                  (begin
                                    (pi_71@lam (caml-constr-get-field x1 0))
                                    (ps_179@lam ")"))))
                               ((11)
                                (begin
                                  (ps_179@lam "(Pccall ")
                                  (begin
                                    (ps_179@lam (caml-constr-get-field x1 0))
                                    (begin
                                      (ps_179@lam " ")
                                      (begin
                                        (pi_71@lam (caml-constr-get-field x1 1))
                                        (ps_179@lam ")"))))))
                               (else
                                (begin
                                  (ps_179@lam "(Pfloatprim ")
                                  (begin
                                    (dump_float_primitive_199@lam
                                      (caml-constr-get-field x1 0))
                                    (ps_179@lam ")")))))))))
                 (begin
                    (define (dump_float_primitive_199@lam x1)
                      (let ((g1018 x1))
                        (cond ((eq? g1018 #f) (ps_179@lam "Pfloatofint"))
                              ((eq? g1018 #t) (ps_179@lam "Pnegfloat"))
                              ((eq? g1018 #unspecified)
                               (ps_179@lam "Paddfloat"))
                              ((eq? g1018 #u0000) (ps_179@lam "Psubfloat"))
                              ((eq? g1018 #a000) (ps_179@lam "Pmulfloat"))
                              ((eq? g1018 #<0006>) (ps_179@lam "Pdivfloat"))
                              (else #f))))
                   (define (dump_bool_test_110@lam x1)
                      (let ((g1019 x1))
                        (cond ((eq? g1019 #f) (ps_179@lam "Peq"))
                              ((eq? g1019 #t) (ps_179@lam "Pnoteq_test"))
                              (else
                               (case (caml-regular-constr-tag g1019)
                                 ((3)
                                  (labels
                                    ((staticfail1009
                                       ()
                                       (begin
                                         (ps_179@lam "(Pint_test ")
                                         (begin
                                           (prim_test_234@lam
                                             (caml-constr-get-field x1 0))
                                           (ps_179@lam ")")))))
                                    (case (if (caml-constant-constr?
                                                (caml-constr-get-field x1 0))
                                            -1
                                            (caml-regular-constr-tag
                                              (caml-constr-get-field x1 0)))
                                      ((3)
                                       (begin
                                         (ps_179@lam "(Pint_test (Pnoteqimm ")
                                         (begin
                                           (pi_71@lam
                                             (caml-constr-get-field
                                               (caml-constr-get-field x1 0)
                                               0))
                                           (ps_179@lam "))"))))
                                      (else (staticfail1009)))))
                                 ((4)
                                  (labels
                                    ((staticfail1010
                                       ()
                                       (begin
                                         (ps_179@lam "(Pfloat_test ")
                                         (begin
                                           (prim_test_234@lam
                                             (caml-constr-get-field x1 0))
                                           (ps_179@lam ")")))))
                                    (case (if (caml-constant-constr?
                                                (caml-constr-get-field x1 0))
                                            -1
                                            (caml-regular-constr-tag
                                              (caml-constr-get-field x1 0)))
                                      ((3)
                                       (begin
                                         (ps_179@lam "(Pint_test (Pnoteqimm ")
                                         (begin
                                           (pf_249@lam
                                             (caml-constr-get-field
                                               (caml-constr-get-field x1 0)
                                               0))
                                           (ps_179@lam "))"))))
                                      (else (staticfail1010)))))
                                 ((5)
                                  (labels
                                    ((staticfail1011
                                       ()
                                       (begin
                                         (ps_179@lam "(Pstring_test ")
                                         (begin
                                           (prim_test_234@lam
                                             (caml-constr-get-field x1 0))
                                           (ps_179@lam ")")))))
                                    (case (if (caml-constant-constr?
                                                (caml-constr-get-field x1 0))
                                            -1
                                            (caml-regular-constr-tag
                                              (caml-constr-get-field x1 0)))
                                      ((3)
                                       (begin
                                         (ps_179@lam "(Pint_test (Pnoteqimm ")
                                         (begin
                                           (ps_179@lam
                                             (caml-constr-get-field
                                               (caml-constr-get-field x1 0)
                                               0))
                                           (ps_179@lam "))"))))
                                      (else (staticfail1011)))))
                                 (else
                                  (dump_constr_tag_75@lam
                                    (caml-constr-get-field
                                      x1
                                      0))))))))
))))))))))

(begin
  (define (dump_lambda_193@lam x1)
    (lambda (x2)
       (lambda (x3)
          (3-232-dump_lambda_193@lam x1 x2 x3))))
 (define (3-232-dump_lambda_193@lam x1 x2 x3)
    (begin
      (cell-set! current_out_stream_102@lam x1)
      (begin
        (if x2
          (begin
            (ps_179@lam "(rec ")
            (begin (dump_lam_160@lam x3) (ps_179@lam ")")))
          (dump_lam_160@lam x3))
        (pn_129@lam #f))))
)

