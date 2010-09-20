;; Le module 
(module
  __caml_prim_opc
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_prim
    __caml_globals
    __caml_opcodes)
  (export
    (opcode_for_primitive_27@prim_opc x1)
    (opcode_for_float_primitive_146@prim_opc x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (opcode_for_primitive_27@prim_opc x1)
  (labels
    ((staticfail1000
       ()
       (fatal_error_193@misc "opcode_for_primitive")))
    (let ((g1001 x1))
      (cond ((eq? g1001 #a000) UPDATE_132@opcodes)
            ((eq? g1001 #<000c>) RAISE_41@opcodes)
            ((eq? g1001 #<000d>) BOOLNOT_123@opcodes)
            ((eq? g1001 #<0008>) TAGOF_105@opcodes)
            ((eq? g1001 #<000e>) NEGINT_130@opcodes)
            ((eq? g1001 #<000f>) SUCCINT_67@opcodes)
            ((eq? g1001 #<0010>) PREDINT_236@opcodes)
            ((eq? g1001 #<0011>) ADDINT_163@opcodes)
            ((eq? g1001 #<0012>) SUBINT_74@opcodes)
            ((eq? g1001 #<0013>) MULINT_80@opcodes)
            ((eq? g1001 #<0014>) DIVINT_14@opcodes)
            ((eq? g1001 #<0015>) MODINT_119@opcodes)
            ((eq? g1001 #<0016>) ANDINT_198@opcodes)
            ((eq? g1001 #<0017>) ORINT_128@opcodes)
            ((eq? g1001 #<0018>) XORINT_176@opcodes)
            ((eq? g1001 #<0019>) SHIFTLEFTINT_166@opcodes)
            ((eq? g1001 #<001a>)
             SHIFTRIGHTINTSIGNED_145@opcodes)
            ((eq? g1001 #<001b>)
             SHIFTRIGHTINTUNSIGNED_75@opcodes)
            ((eq? g1001 #<001c>) INCR_93@opcodes)
            ((eq? g1001 #<001d>) DECR_38@opcodes)
            ((eq? g1001 #<001e>) INTOFFLOAT_123@opcodes)
            ((eq? g1001 #<0020>) STRINGLENGTH_31@opcodes)
            ((eq? g1001 #<0021>) GETSTRINGCHAR_83@opcodes)
            ((eq? g1001 #<0022>) SETSTRINGCHAR_251@opcodes)
            ((eq? g1001 #<0023>) MAKEVECTOR_165@opcodes)
            ((eq? g1001 #<0024>) VECTLENGTH_45@opcodes)
            ((eq? g1001 #<0025>) GETVECTITEM_75@opcodes)
            ((eq? g1001 #<0026>) SETVECTITEM_147@opcodes)
            (else (staticfail1000))))))


(define (opcode_for_float_primitive_146@prim_opc x1)
  (let ((g1002 x1))
    (cond ((eq? g1002 #f) FLOATOFINT_116@opcodes)
          ((eq? g1002 #t) NEGFLOAT_177@opcodes)
          ((eq? g1002 #unspecified) ADDFLOAT_221@opcodes)
          ((eq? g1002 #u0000) SUBFLOAT_225@opcodes)
          ((eq? g1002 #a000) MULFLOAT_26@opcodes)
          ((eq? g1002 #<0006>) DIVFLOAT_252@opcodes)
          (else #f))))


