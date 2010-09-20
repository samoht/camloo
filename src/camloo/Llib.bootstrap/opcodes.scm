;; Le module 
(module
  __caml_opcodes
  (library camloo-runtime)
  (export
    CONSTBYTE_220@opcodes
    CONSTSHORT_186@opcodes
    GETGLOBAL_118@opcodes
    SETGLOBAL_25@opcodes
    CUR_46@opcodes
    SWITCH_61@opcodes
    BRANCH_151@opcodes
    BRANCHIF_3@opcodes
    BRANCHIFNOT_240@opcodes
    POPBRANCHIFNOT_153@opcodes
    BRANCHIFNEQTAG_253@opcodes
    BRANCHIFEQ_142@opcodes
    BRANCHIFNEQ_7@opcodes
    BRANCHIFLT_225@opcodes
    BRANCHIFGT_61@opcodes
    BRANCHIFLE_212@opcodes
    BRANCHIFGE_150@opcodes
    BRANCHINTERVAL_39@opcodes
    C_CALL1_170@opcodes
    C_CALL2_125@opcodes
    C_CALL3_118@opcodes
    C_CALL4_27@opcodes
    C_CALL5_233@opcodes
    C_CALLN_100@opcodes
    MAKEBLOCK_160@opcodes
    MAKEBLOCK1_239@opcodes
    MAKEBLOCK2_101@opcodes
    MAKEBLOCK3_242@opcodes
    MAKEBLOCK4_5@opcodes
    TAGOF_105@opcodes
    ACCESS_239@opcodes
    ACC0_19@opcodes
    ACC1_165@opcodes
    ACC2_231@opcodes
    ACC3_71@opcodes
    ACC4_129@opcodes
    ACC5_90@opcodes
    ATOM_224@opcodes
    ATOM0_230@opcodes
    ATOM1_142@opcodes
    ATOM2_96@opcodes
    ATOM3_227@opcodes
    ATOM4_62@opcodes
    ATOM5_179@opcodes
    ATOM6_246@opcodes
    ATOM7_114@opcodes
    ATOM8_162@opcodes
    ATOM9_53@opcodes
    GETFIELD_41@opcodes
    GETFIELD0_7@opcodes
    GETFIELD1_30@opcodes
    GETFIELD2_73@opcodes
    GETFIELD3_173@opcodes
    SETFIELD_155@opcodes
    SETFIELD0_207@opcodes
    SETFIELD1_225@opcodes
    SETFIELD2_151@opcodes
    SETFIELD3_251@opcodes
    STOP_81@opcodes
    CHECK_SIGNALS_74@opcodes
    APPLY_180@opcodes
    RETURN_226@opcodes
    APPTERM_45@opcodes
    GRAB_247@opcodes
    LET_213@opcodes
    LETREC1_96@opcodes
    DUMMY_118@opcodes
    UPDATE_132@opcodes
    ENDLET_187@opcodes
    ENDLET1_105@opcodes
    PUSHTRAP_197@opcodes
    RAISE_41@opcodes
    POPTRAP_163@opcodes
    PUSH_64@opcodes
    POP_188@opcodes
    PUSHMARK_205@opcodes
    PUSH_GETGLOBAL_APPLY_136@opcodes
    PUSH_GETGLOBAL_APPTERM_156@opcodes
    BOOLNOT_123@opcodes
    NEGINT_130@opcodes
    SUCCINT_67@opcodes
    PREDINT_236@opcodes
    ADDINT_163@opcodes
    SUBINT_74@opcodes
    MULINT_80@opcodes
    DIVINT_14@opcodes
    MODINT_119@opcodes
    ANDINT_198@opcodes
    ORINT_128@opcodes
    XORINT_176@opcodes
    SHIFTLEFTINT_166@opcodes
    SHIFTRIGHTINTSIGNED_145@opcodes
    SHIFTRIGHTINTUNSIGNED_75@opcodes
    EQ_107@opcodes
    NEQ_145@opcodes
    LTINT_198@opcodes
    GTINT_46@opcodes
    LEINT_70@opcodes
    GEINT_166@opcodes
    INCR_93@opcodes
    DECR_38@opcodes
    FLOATOP_120@opcodes
    INTOFFLOAT_123@opcodes
    EQFLOAT_61@opcodes
    NEQFLOAT_89@opcodes
    LTFLOAT_102@opcodes
    GTFLOAT_151@opcodes
    LEFLOAT_249@opcodes
    GEFLOAT_127@opcodes
    STRINGLENGTH_31@opcodes
    GETSTRINGCHAR_83@opcodes
    SETSTRINGCHAR_251@opcodes
    EQSTRING_56@opcodes
    NEQSTRING_52@opcodes
    LTSTRING_43@opcodes
    GTSTRING_5@opcodes
    LESTRING_250@opcodes
    GESTRING_113@opcodes
    MAKEVECTOR_165@opcodes
    VECTLENGTH_45@opcodes
    GETVECTITEM_75@opcodes
    SETVECTITEM_147@opcodes
    FLOATOFINT_116@opcodes
    NEGFLOAT_177@opcodes
    ADDFLOAT_221@opcodes
    SUBFLOAT_225@opcodes
    MULFLOAT_26@opcodes
    DIVFLOAT_252@opcodes))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define CONSTBYTE_220@opcodes 0)

(define CONSTSHORT_186@opcodes 1)

(define GETGLOBAL_118@opcodes 2)

(define SETGLOBAL_25@opcodes 3)

(define CUR_46@opcodes 4)

(define SWITCH_61@opcodes 5)

(define BRANCH_151@opcodes 6)

(define BRANCHIF_3@opcodes 7)

(define BRANCHIFNOT_240@opcodes 8)

(define POPBRANCHIFNOT_153@opcodes 9)

(define BRANCHIFNEQTAG_253@opcodes 10)

(define BRANCHIFEQ_142@opcodes 11)

(define BRANCHIFNEQ_7@opcodes 12)

(define BRANCHIFLT_225@opcodes 13)

(define BRANCHIFGT_61@opcodes 14)

(define BRANCHIFLE_212@opcodes 15)

(define BRANCHIFGE_150@opcodes 16)

(define BRANCHINTERVAL_39@opcodes 17)

(define C_CALL1_170@opcodes 18)

(define C_CALL2_125@opcodes 19)

(define C_CALL3_118@opcodes 20)

(define C_CALL4_27@opcodes 21)

(define C_CALL5_233@opcodes 22)

(define C_CALLN_100@opcodes 23)

(define MAKEBLOCK_160@opcodes 24)

(define MAKEBLOCK1_239@opcodes 25)

(define MAKEBLOCK2_101@opcodes 26)

(define MAKEBLOCK3_242@opcodes 27)

(define MAKEBLOCK4_5@opcodes 28)

(define TAGOF_105@opcodes 29)

(define ACCESS_239@opcodes 30)

(define ACC0_19@opcodes 31)

(define ACC1_165@opcodes 32)

(define ACC2_231@opcodes 33)

(define ACC3_71@opcodes 34)

(define ACC4_129@opcodes 35)

(define ACC5_90@opcodes 36)

(define ATOM_224@opcodes 37)

(define ATOM0_230@opcodes 38)

(define ATOM1_142@opcodes 39)

(define ATOM2_96@opcodes 40)

(define ATOM3_227@opcodes 41)

(define ATOM4_62@opcodes 42)

(define ATOM5_179@opcodes 43)

(define ATOM6_246@opcodes 44)

(define ATOM7_114@opcodes 45)

(define ATOM8_162@opcodes 46)

(define ATOM9_53@opcodes 47)

(define GETFIELD_41@opcodes 48)

(define GETFIELD0_7@opcodes 49)

(define GETFIELD1_30@opcodes 50)

(define GETFIELD2_73@opcodes 51)

(define GETFIELD3_173@opcodes 52)

(define SETFIELD_155@opcodes 53)

(define SETFIELD0_207@opcodes 54)

(define SETFIELD1_225@opcodes 55)

(define SETFIELD2_151@opcodes 56)

(define SETFIELD3_251@opcodes 57)

(define STOP_81@opcodes 58)

(define CHECK_SIGNALS_74@opcodes 59)

(define APPLY_180@opcodes 60)

(define RETURN_226@opcodes 61)

(define APPTERM_45@opcodes 62)

(define GRAB_247@opcodes 63)

(define LET_213@opcodes 64)

(define LETREC1_96@opcodes 65)

(define DUMMY_118@opcodes 66)

(define UPDATE_132@opcodes 67)

(define ENDLET_187@opcodes 68)

(define ENDLET1_105@opcodes 69)

(define PUSHTRAP_197@opcodes 70)

(define RAISE_41@opcodes 71)

(define POPTRAP_163@opcodes 72)

(define PUSH_64@opcodes 73)

(define POP_188@opcodes 74)

(define PUSHMARK_205@opcodes 75)

(define PUSH_GETGLOBAL_APPLY_136@opcodes 76)

(define PUSH_GETGLOBAL_APPTERM_156@opcodes 77)

(define BOOLNOT_123@opcodes 78)

(define NEGINT_130@opcodes 79)

(define SUCCINT_67@opcodes 80)

(define PREDINT_236@opcodes 81)

(define ADDINT_163@opcodes 82)

(define SUBINT_74@opcodes 83)

(define MULINT_80@opcodes 84)

(define DIVINT_14@opcodes 85)

(define MODINT_119@opcodes 86)

(define ANDINT_198@opcodes 87)

(define ORINT_128@opcodes 88)

(define XORINT_176@opcodes 89)

(define SHIFTLEFTINT_166@opcodes 90)

(define SHIFTRIGHTINTSIGNED_145@opcodes 91)

(define SHIFTRIGHTINTUNSIGNED_75@opcodes 92)

(define EQ_107@opcodes 93)

(define NEQ_145@opcodes 94)

(define LTINT_198@opcodes 95)

(define GTINT_46@opcodes 96)

(define LEINT_70@opcodes 97)

(define GEINT_166@opcodes 98)

(define INCR_93@opcodes 99)

(define DECR_38@opcodes 100)

(define FLOATOP_120@opcodes 101)

(define INTOFFLOAT_123@opcodes 102)

(define EQFLOAT_61@opcodes 103)

(define NEQFLOAT_89@opcodes 104)

(define LTFLOAT_102@opcodes 105)

(define GTFLOAT_151@opcodes 106)

(define LEFLOAT_249@opcodes 107)

(define GEFLOAT_127@opcodes 108)

(define STRINGLENGTH_31@opcodes 109)

(define GETSTRINGCHAR_83@opcodes 110)

(define SETSTRINGCHAR_251@opcodes 111)

(define EQSTRING_56@opcodes 112)

(define NEQSTRING_52@opcodes 113)

(define LTSTRING_43@opcodes 114)

(define GTSTRING_5@opcodes 115)

(define LESTRING_250@opcodes 116)

(define GESTRING_113@opcodes 117)

(define MAKEVECTOR_165@opcodes 118)

(define VECTLENGTH_45@opcodes 119)

(define GETVECTITEM_75@opcodes 120)

(define SETVECTITEM_147@opcodes 121)

(define FLOATOFINT_116@opcodes 0)

(define NEGFLOAT_177@opcodes 1)

(define ADDFLOAT_221@opcodes 2)

(define SUBFLOAT_225@opcodes 3)

(define MULFLOAT_26@opcodes 4)

(define DIVFLOAT_252@opcodes 5)

