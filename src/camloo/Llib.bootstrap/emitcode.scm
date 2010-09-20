;; Le module 
(module
  __caml_emitcode
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_instruct
    __caml_prim
    __caml_globals
    __caml_opcodes
    __caml_prim_opc
    __caml_buffcode
    __caml_config
    __caml_labels
    __caml_reloc)
  (export
    (out_bool_test_109@emitcode x1)
    (2-192-out_bool_test_109@emitcode x1 x2)
    (out_int_const_243@emitcode x1)
    (out_tag_245@emitcode x1)
    (out_header_98@emitcode x1)
    (size_of_dummy_91@emitcode x1)
    (emit_178@emitcode x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (out_bool_test_109@emitcode x1)
    (lambda (x2)
       (2-192-out_bool_test_109@emitcode x1 x2)))
 (define (2-192-out_bool_test_109@emitcode x1 x2)
    (labels
      ((staticfail1000
         ()
         (fatal_error_193@misc "out_bool_test")))
      (let ((g1012 x2))
        (cond ((eq? g1012 #f) (out_60@buffcode x1))
              ((eq? g1012 #t) (out_60@buffcode (+fx x1 1)))
              ((eq? g1012 #u0000) (out_60@buffcode (+fx x1 2)))
              ((eq? g1012 #<0006>)
               (out_60@buffcode (+fx x1 3)))
              ((eq? g1012 #a000) (out_60@buffcode (+fx x1 4)))
              ((eq? g1012 #<0007>)
               (out_60@buffcode (+fx x1 5)))
              (else (staticfail1000))))))
)

(define (out_int_const_243@emitcode x1)
  (if (and (<=fx x1 (/fx (-fx maxint_byte_178@config 1) 2))
           (>=fx x1 (/fx (-fx minint_byte_232@config 1) 2)))
    (begin
      (out_60@buffcode CONSTBYTE_220@opcodes)
      (out_60@buffcode (+fx (+fx x1 x1) 1)))
    (if (and (<=fx x1 (/fx (-fx maxint_short_71@config 1) 2))
             (>=fx x1 (/fx (-fx minint_short_93@config 1) 2)))
      (begin
        (out_60@buffcode CONSTSHORT_186@opcodes)
        (out_short_156@buffcode (+fx (+fx x1 x1) 1)))
      (begin
        (out_60@buffcode GETGLOBAL_118@opcodes)
        (slot_for_literal_145@reloc
          (caml-make-regular-1
            #f
            (caml-make-regular-1 #f x1)))))))


(define (out_tag_245@emitcode x1)
  (case (caml-regular-constr-tag x1)
    ((2)
     (out_60@buffcode (caml-constr-get-field x1 1)))
    (else
     (2-254-slot_for_tag_19@reloc
       (caml-constr-get-field x1 0)
       (caml-constr-get-field x1 1)))))


(define (out_header_98@emitcode x1)
  (begin
    (out_tag_245@emitcode
      (caml-constr-get-field x1 1))
    (begin
      (out_60@buffcode
        (bit-lsh (caml-constr-get-field x1 0) 2))
      (begin
        (out_60@buffcode
          (bit-rsh (caml-constr-get-field x1 0) 6))
        (out_60@buffcode
          (bit-rsh (caml-constr-get-field x1 0) 14))))))


(define (size_of_dummy_91@emitcode x1)
  (let ((g1013 x1))
    (cond ((eq? g1013 #unspecified) 2)
          ((eq? g1013 #<0006>) 2)
          ((eq? g1013 #<0007>) 2)
          (else
           (case (caml-regular-constr-tag g1013)
             ((4 1) (caml-constr-get-field x1 0))
             ((2) (caml-constr-get-field x1 1))
             (else (caml-constr-get-field x1 0)))))))


(define (emit_178@emitcode x1)
  (if (null? x1)
    #f
    (labels
      ((staticfail1001
         ()
         (begin
           (out_60@buffcode
             (let ((x2 (car x1)))
               (labels
                 ((staticfail1002
                    ()
                    (fatal_error_193@misc "emit: should not happen")))
                 (let ((g1014 x2))
                   (cond ((eq? g1014 #<000d>) RETURN_226@opcodes)
                         ((eq? g1014 #a000) GRAB_247@opcodes)
                         ((eq? g1014 #<0006>) PUSH_64@opcodes)
                         ((eq? g1014 #<0007>) PUSHMARK_205@opcodes)
                         ((eq? g1014 #<0008>) LET_213@opcodes)
                         ((eq? g1014 #<000a>) APPLY_180@opcodes)
                         ((eq? g1014 #<000b>) APPTERM_45@opcodes)
                         ((eq? g1014 #<0013>) POPTRAP_163@opcodes)
                         ((eq? g1014 #<000c>) CHECK_SIGNALS_74@opcodes)
                         (else (staticfail1002)))))))
           (emit_178@emitcode (cdr x1)))))
      (let ((g1015 (car x1)))
        (cond ((eq? g1015 #<0006>)
               (if (null? (cdr x1))
                 (staticfail1001)
                 (case (if (caml-constant-constr? (car (cdr x1)))
                         -1
                         (caml-regular-constr-tag (car (cdr x1))))
                   ((2)
                    (if (null? (cdr (cdr x1)))
                      (staticfail1001)
                      (let ((g1016 (car (cdr (cdr x1)))))
                        (cond ((eq? g1016 #<000a>)
                               (begin
                                 (out_60@buffcode
                                   PUSH_GETGLOBAL_APPLY_136@opcodes)
                                 (begin
                                   (slot_for_get_global_124@reloc
                                     (caml-constr-get-field (car (cdr x1)) 0))
                                   (emit_178@emitcode (cdr (cdr (cdr x1)))))))
                              ((eq? g1016 #<000b>)
                               (begin
                                 (out_60@buffcode
                                   PUSH_GETGLOBAL_APPTERM_156@opcodes)
                                 (begin
                                   (slot_for_get_global_124@reloc
                                     (caml-constr-get-field (car (cdr x1)) 0))
                                   (emit_178@emitcode (cdr (cdr (cdr x1)))))))
                              (else (staticfail1001))))))
                   (else (staticfail1001)))))
              (else
               (case (if (caml-constant-constr? g1015)
                       -1
                       (caml-regular-constr-tag g1015))
                 ((1)
                  (labels
                    ((staticfail1003
                       ()
                       (begin
                         (out_60@buffcode GETGLOBAL_118@opcodes)
                         (begin
                           (slot_for_literal_145@reloc
                             (caml-constr-get-field (car x1) 0))
                           (emit_178@emitcode (cdr x1))))))
                    (case (caml-regular-constr-tag
                            (caml-constr-get-field (car x1) 0))
                      ((1)
                       (case (if (caml-constant-constr?
                                   (caml-constr-get-field
                                     (caml-constr-get-field (car x1) 0)
                                     0))
                               -1
                               (caml-regular-constr-tag
                                 (caml-constr-get-field
                                   (caml-constr-get-field (car x1) 0)
                                   0)))
                         ((1)
                          (begin
                            (out_int_const_243@emitcode
                              (caml-constr-get-field
                                (caml-constr-get-field
                                  (caml-constr-get-field (car x1) 0)
                                  0)
                                0))
                            (emit_178@emitcode (cdr x1))))
                         ((4)
                          (begin
                            (out_int_const_243@emitcode
                              (int_of_char
                                (caml-constr-get-field
                                  (caml-constr-get-field
                                    (caml-constr-get-field (car x1) 0)
                                    0)
                                  0)))
                            (emit_178@emitcode (cdr x1))))
                         (else (staticfail1003))))
                      (else
                       (if (null? (caml-constr-get-field
                                    (caml-constr-get-field (car x1) 0)
                                    1))
                         (begin
                           (let ((x2 (caml-constr-get-field
                                       (caml-constr-get-field (car x1) 0)
                                       0)))
                             (case (caml-regular-constr-tag x2)
                               ((2)
                                (if (<fx (caml-constr-get-field x2 1) 10)
                                  (out_60@buffcode
                                    (+fx ATOM0_230@opcodes
                                         (caml-constr-get-field x2 1)))
                                  (begin
                                    (out_60@buffcode ATOM_224@opcodes)
                                    (out_60@buffcode
                                      (caml-constr-get-field x2 1)))))
                               (else
                                (begin
                                  (out_60@buffcode ATOM_224@opcodes)
                                  (2-254-slot_for_tag_19@reloc
                                    (caml-constr-get-field x2 0)
                                    (caml-constr-get-field x2 1))))))
                           (emit_178@emitcode (cdr x1)))
                         (staticfail1003))))))
                 ((2)
                  (begin
                    (out_60@buffcode GETGLOBAL_118@opcodes)
                    (begin
                      (slot_for_get_global_124@reloc
                        (caml-constr-get-field (car x1) 0))
                      (emit_178@emitcode (cdr x1)))))
                 ((3)
                  (begin
                    (out_60@buffcode SETGLOBAL_25@opcodes)
                    (begin
                      (slot_for_set_global_49@reloc
                        (caml-constr-get-field (car x1) 0))
                      (emit_178@emitcode (cdr x1)))))
                 ((4)
                  (begin
                    (if (<fx (caml-constr-get-field (car x1) 0) 6)
                      (out_60@buffcode
                        (+fx ACC0_19@opcodes
                             (caml-constr-get-field (car x1) 0)))
                      (begin
                        (out_60@buffcode ACCESS_239@opcodes)
                        (out_60@buffcode
                          (caml-constr-get-field (car x1) 0))))
                    (emit_178@emitcode (cdr x1))))
                 ((9)
                  (labels
                    ((staticfail1004
                       ()
                       (labels
                         ((staticfail1005
                            ()
                            (begin
                              (out_60@buffcode ENDLET_187@opcodes)
                              (begin
                                (out_60@buffcode
                                  (caml-constr-get-field (car x1) 0))
                                (emit_178@emitcode (cdr x1))))))
                         (let ((g1017 (caml-constr-get-field (car x1) 0)))
                           (cond ((=fx g1017 1)
                                  (begin
                                    (out_60@buffcode ENDLET1_105@opcodes)
                                    (emit_178@emitcode (cdr x1))))
                                 (else (staticfail1005)))))))
                    (if (null? (cdr x1))
                      (staticfail1004)
                      (case (if (caml-constant-constr? (car (cdr x1)))
                              -1
                              (caml-regular-constr-tag (car (cdr x1))))
                        ((9)
                         (emit_178@emitcode
                           (cons (caml-make-regular-1
                                   #<0009>
                                   (+fx (caml-constr-get-field (car x1) 0)
                                        (caml-constr-get-field
                                          (car (cdr x1))
                                          0)))
                                 (cdr (cdr x1)))))
                        (else (staticfail1004))))))
                 ((15)
                  (begin
                    (out_60@buffcode LETREC1_96@opcodes)
                    (begin
                      (out_label_131@labels
                        (caml-constr-get-field (car x1) 0))
                      (emit_178@emitcode (cdr x1)))))
                 ((16)
                  (begin
                    (if (<=fx (caml-constr-get-field (car x1) 1) 0)
                      (fatal_error_193@misc "emit : Kmakeblock")
                      (if (<fx (caml-constr-get-field (car x1) 1) 5)
                        (begin
                          (out_60@buffcode
                            (-fx (+fx MAKEBLOCK1_239@opcodes
                                      (caml-constr-get-field (car x1) 1))
                                 1))
                          (out_tag_245@emitcode
                            (caml-constr-get-field (car x1) 0)))
                        (begin
                          (out_60@buffcode MAKEBLOCK_160@opcodes)
                          (out_header_98@emitcode
                            (caml-make-regular-2
                              #f
                              (caml-constr-get-field (car x1) 1)
                              (caml-constr-get-field (car x1) 0))))))
                    (emit_178@emitcode (cdr x1))))
                 ((20)
                  (if (eq? (caml-constr-get-field (car x1) 0)
                           Nolabel_4@instruct)
                    (fatal_error_193@misc "emit: undefined label")
                    (begin
                      (define_label_232@labels
                        (caml-constr-get-field (car x1) 0))
                      (emit_178@emitcode (cdr x1)))))
                 ((14)
                  (begin
                    (out_60@buffcode CUR_46@opcodes)
                    (begin
                      (out_label_131@labels
                        (caml-constr-get-field (car x1) 0))
                      (emit_178@emitcode (cdr x1)))))
                 ((18)
                  (begin
                    (out_60@buffcode PUSHTRAP_197@opcodes)
                    (begin
                      (out_label_131@labels
                        (caml-constr-get-field (car x1) 0))
                      (emit_178@emitcode (cdr x1)))))
                 ((21)
                  (begin
                    (out_60@buffcode BRANCH_151@opcodes)
                    (begin
                      (out_label_131@labels
                        (caml-constr-get-field (car x1) 0))
                      (emit_178@emitcode (cdr x1)))))
                 ((24 22)
                  (begin
                    (out_60@buffcode BRANCHIF_3@opcodes)
                    (begin
                      (out_label_131@labels
                        (caml-constr-get-field (car x1) 0))
                      (emit_178@emitcode (cdr x1)))))
                 ((25 23)
                  (begin
                    (out_60@buffcode BRANCHIFNOT_240@opcodes)
                    (begin
                      (out_label_131@labels
                        (caml-constr-get-field (car x1) 0))
                      (emit_178@emitcode (cdr x1)))))
                 ((28)
                  (begin
                    (out_60@buffcode SWITCH_61@opcodes)
                    (begin
                      (out_60@buffcode
                        (let ((g1018 (caml-constr-get-field (car x1) 0)))
                          (if g1018 (vector-length g1018) 0)))
                      (let ((x2 (cell-ref out_position_239@buffcode)))
                        (begin
                          ((do_vect_153@vect
                             (out_label_with_orig_230@labels x2))
                           (caml-constr-get-field (car x1) 0))
                          (emit_178@emitcode (cdr x1)))))))
                 ((26)
                  (begin
                    (let ((x2 (caml-constr-get-field (car x1) 0)))
                      (let ((g1019 x2))
                        (cond ((eq? g1019 #f)
                               (begin
                                 (out_60@buffcode BRANCHIFEQ_142@opcodes)
                                 (out_label_131@labels
                                   (caml-constr-get-field (car x1) 1))))
                              ((eq? g1019 #t)
                               (begin
                                 (out_60@buffcode BRANCHIFNEQ_7@opcodes)
                                 (out_label_131@labels
                                   (caml-constr-get-field (car x1) 1))))
                              (else
                               (case (caml-regular-constr-tag g1019)
                                 ((3)
                                  (labels
                                    ((staticfail1006
                                       ()
                                       (begin
                                         (2-192-out_bool_test_109@emitcode
                                           BRANCHIFEQ_142@opcodes
                                           (caml-constr-get-field x2 0))
                                         (out_label_131@labels
                                           (caml-constr-get-field
                                             (car x1)
                                             1)))))
                                    (case (if (caml-constant-constr?
                                                (caml-constr-get-field x2 0))
                                            -1
                                            (caml-regular-constr-tag
                                              (caml-constr-get-field x2 0)))
                                      ((3)
                                       (begin
                                         (out_60@buffcode PUSH_64@opcodes)
                                         (begin
                                           (out_60@buffcode PUSH_64@opcodes)
                                           (begin
                                             (out_int_const_243@emitcode
                                               (caml-constr-get-field
                                                 (caml-constr-get-field x2 0)
                                                 0))
                                             (begin
                                               (out_60@buffcode EQ_107@opcodes)
                                               (begin
                                                 (out_60@buffcode
                                                   POPBRANCHIFNOT_153@opcodes)
                                                 (out_label_131@labels
                                                   (caml-constr-get-field
                                                     (car x1)
                                                     1))))))))
                                      (else (staticfail1006)))))
                                 ((4)
                                  (labels
                                    ((staticfail1007
                                       ()
                                       (begin
                                         (2-192-out_bool_test_109@emitcode
                                           EQFLOAT_61@opcodes
                                           (caml-constr-get-field x2 0))
                                         (begin
                                           (out_60@buffcode BRANCHIF_3@opcodes)
                                           (out_label_131@labels
                                             (caml-constr-get-field
                                               (car x1)
                                               1))))))
                                    (case (if (caml-constant-constr?
                                                (caml-constr-get-field x2 0))
                                            -1
                                            (caml-regular-constr-tag
                                              (caml-constr-get-field x2 0)))
                                      ((3)
                                       (begin
                                         (out_60@buffcode PUSH_64@opcodes)
                                         (begin
                                           (out_60@buffcode PUSH_64@opcodes)
                                           (begin
                                             (out_60@buffcode
                                               GETGLOBAL_118@opcodes)
                                             (begin
                                               (slot_for_literal_145@reloc
                                                 (caml-make-regular-1
                                                   #f
                                                   (caml-make-regular-1
                                                     #t
                                                     (caml-constr-get-field
                                                       (caml-constr-get-field
                                                         x2
                                                         0)
                                                       0))))
                                               (begin
                                                 (out_60@buffcode
                                                   EQFLOAT_61@opcodes)
                                                 (begin
                                                   (out_60@buffcode
                                                     POPBRANCHIFNOT_153@opcodes)
                                                   (out_label_131@labels
                                                     (caml-constr-get-field
                                                       (car x1)
                                                       1)))))))))
                                      (else (staticfail1007)))))
                                 ((5)
                                  (labels
                                    ((staticfail1008
                                       ()
                                       (begin
                                         (2-192-out_bool_test_109@emitcode
                                           EQSTRING_56@opcodes
                                           (caml-constr-get-field x2 0))
                                         (begin
                                           (out_60@buffcode BRANCHIF_3@opcodes)
                                           (out_label_131@labels
                                             (caml-constr-get-field
                                               (car x1)
                                               1))))))
                                    (case (if (caml-constant-constr?
                                                (caml-constr-get-field x2 0))
                                            -1
                                            (caml-regular-constr-tag
                                              (caml-constr-get-field x2 0)))
                                      ((3)
                                       (begin
                                         (out_60@buffcode PUSH_64@opcodes)
                                         (begin
                                           (out_60@buffcode PUSH_64@opcodes)
                                           (begin
                                             (out_60@buffcode
                                               GETGLOBAL_118@opcodes)
                                             (begin
                                               (slot_for_literal_145@reloc
                                                 (caml-make-regular-1
                                                   #f
                                                   (caml-make-regular-1
                                                     #unspecified
                                                     (caml-constr-get-field
                                                       (caml-constr-get-field
                                                         x2
                                                         0)
                                                       0))))
                                               (begin
                                                 (out_60@buffcode
                                                   EQSTRING_56@opcodes)
                                                 (begin
                                                   (out_60@buffcode
                                                     POPBRANCHIFNOT_153@opcodes)
                                                   (out_label_131@labels
                                                     (caml-constr-get-field
                                                       (car x1)
                                                       1)))))))))
                                      (else (staticfail1008)))))
                                 (else
                                  (begin
                                    (out_60@buffcode BRANCHIFNEQTAG_253@opcodes)
                                    (begin
                                      (out_tag_245@emitcode
                                        (caml-constr-get-field x2 0))
                                      (out_label_131@labels
                                        (caml-constr-get-field
                                          (car x1)
                                          1))))))))))
                    (emit_178@emitcode (cdr x1))))
                 ((27)
                  (begin
                    (out_60@buffcode PUSH_64@opcodes)
                    (begin
                      (out_int_const_243@emitcode
                        (caml-constr-get-field (car x1) 0))
                      (begin
                        (out_60@buffcode PUSH_64@opcodes)
                        (begin
                          (if ((lambda (x y) (not (eq? x y)))
                               (caml-constr-get-field (car x1) 0)
                               (caml-constr-get-field (car x1) 1))
                            (out_int_const_243@emitcode
                              (caml-constr-get-field (car x1) 1))
                            #f)
                          (begin
                            (out_60@buffcode BRANCHINTERVAL_39@opcodes)
                            (begin
                              (out_label_131@labels
                                (caml-constr-get-field (car x1) 2))
                              (begin
                                (out_label_131@labels
                                  (caml-constr-get-field (car x1) 3))
                                (emit_178@emitcode (cdr x1))))))))))
                 ((17)
                  (labels
                    ((staticfail1009
                       ()
                       (begin
                         (let ((x2 (caml-constr-get-field (car x1) 0)))
                           (labels
                             ((staticfail1010
                                ()
                                (out_60@buffcode
                                  (opcode_for_primitive_27@prim_opc x2))))
                             (case (if (caml-constant-constr? x2)
                                     -1
                                     (caml-regular-constr-tag x2))
                               ((4)
                                (begin
                                  (out_60@buffcode DUMMY_118@opcodes)
                                  (out_60@buffcode
                                    (size_of_dummy_91@emitcode
                                      (caml-constr-get-field x2 0)))))
                               ((6)
                                (let ((x3 (caml-constr-get-field x2 0)))
                                  (labels
                                    ((staticfail1011
                                       ()
                                       (fatal_error_193@misc
                                         "emit : Kprim, Ptest")))
                                    (let ((g1020 x3))
                                      (cond ((eq? g1020 #f)
                                             (out_60@buffcode EQ_107@opcodes))
                                            ((eq? g1020 #t)
                                             (out_60@buffcode NEQ_145@opcodes))
                                            (else
                                             (case (if (caml-constant-constr?
                                                         g1020)
                                                     -1
                                                     (caml-regular-constr-tag
                                                       g1020))
                                               ((3)
                                                (2-192-out_bool_test_109@emitcode
                                                  EQ_107@opcodes
                                                  (caml-constr-get-field x3 0)))
                                               ((4)
                                                (2-192-out_bool_test_109@emitcode
                                                  EQFLOAT_61@opcodes
                                                  (caml-constr-get-field x3 0)))
                                               ((5)
                                                (2-192-out_bool_test_109@emitcode
                                                  EQSTRING_56@opcodes
                                                  (caml-constr-get-field x3 0)))
                                               (else (staticfail1011)))))))))
                               ((9)
                                (if (<fx (caml-constr-get-field x2 0) 4)
                                  (out_60@buffcode
                                    (+fx GETFIELD0_7@opcodes
                                         (caml-constr-get-field x2 0)))
                                  (begin
                                    (out_60@buffcode GETFIELD_41@opcodes)
                                    (out_60@buffcode
                                      (caml-constr-get-field x2 0)))))
                               ((10)
                                (if (<fx (caml-constr-get-field x2 0) 4)
                                  (out_60@buffcode
                                    (+fx SETFIELD0_207@opcodes
                                         (caml-constr-get-field x2 0)))
                                  (begin
                                    (out_60@buffcode SETFIELD_155@opcodes)
                                    (out_60@buffcode
                                      (caml-constr-get-field x2 0)))))
                               ((11)
                                (begin
                                  (if (<=fx (caml-constr-get-field x2 1) 5)
                                    (out_60@buffcode
                                      (-fx (+fx C_CALL1_170@opcodes
                                                (caml-constr-get-field x2 1))
                                           1))
                                    (begin
                                      (out_60@buffcode C_CALLN_100@opcodes)
                                      (out_60@buffcode
                                        (caml-constr-get-field x2 1))))
                                  (slot_for_c_prim_55@reloc
                                    (caml-constr-get-field x2 0))))
                               ((31)
                                (begin
                                  (out_60@buffcode FLOATOP_120@opcodes)
                                  (out_60@buffcode
                                    (opcode_for_float_primitive_146@prim_opc
                                      (caml-constr-get-field x2 0)))))
                               (else (staticfail1010)))))
                         (emit_178@emitcode (cdr x1)))))
                    (let ((g1021 (caml-constr-get-field (car x1) 0)))
                      (cond ((eq? g1021 #f) (emit_178@emitcode (cdr x1)))
                            (else (staticfail1009))))))
                 (else (staticfail1001)))))))))


