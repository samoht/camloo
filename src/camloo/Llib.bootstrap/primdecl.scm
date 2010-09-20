;; Le module 
(module
  __caml_primdecl
  (library camloo-runtime)
  (import __caml_prim __caml_globals)
  (export
    primitive_names_68@primdecl
    (find_primitive_124@primdecl x1)
    (2-217-find_primitive_124@primdecl x1 x2)
    (find_scheme_primitive_12@primdecl x1)
    (4-160-find_scheme_primitive_12@primdecl
      x1
      x2
      x3
      x4)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define primitive_names_68@primdecl
  '(#("identity" #f #f)
    #("field0" #(0 #<0009>) #f)
    #("field1" #(1 #<0009>) #f)
    #("field2" #(2 #<0009>) #f)
    #("field3" #(3 #<0009>) #f)
    #("setfield0" #(0 #<000a>) #f)
    #("setfield1" #(1 #<000a>) #f)
    #("setfield2" #(2 #<000a>) #f)
    #("setfield3" #(3 #<000a>) #f)
    #("update" #a000 #f)
    #("tag_of" #<0008> #f)
    #("raise" #<000c> #f)
    #("not" #<000d> #f)
    #("succ" #<000f> #f)
    #("pred" #<0010> #f)
    #("~int" #<000e> #f)
    #("+int" #<0011> #f)
    #("-int" #<0012> #f)
    #("*int" #<0013> #f)
    #("div" #<0014> #f)
    #("mod" #<0015> #f)
    #("and" #<0016> #f)
    #("or" #<0017> #f)
    #("xor" #<0018> #f)
    #("shift_left" #<0019> #f)
    #("shift_right_signed" #<001a> #f)
    #("shift_right_unsigned" #<001b> #f)
    #("incr" #<001c> #f)
    #("decr" #<001d> #f)
    #("int_of_float" #<001e> #f)
    #("float_of_int" #(#f #<001f>) #f)
    #("~float" #(#t #<001f>) #f)
    #("+float" #(#unspecified #<001f>) #f)
    #("-float" #(#u0000 #<001f>) #f)
    #("*float" #(#a000 #<001f>) #f)
    #("/" #(#<0006> #<001f>) #f)
    #("string_length" #<0020> #f)
    #("get_nth_char" #<0021> #f)
    #("set_nth_char" #<0022> #f)
    #("make_vect" #<0023> #f)
    #("vect_length" #<0024> #f)
    #("get_vect_item" #<0025> #f)
    #("set_vect_item" #<0026> #f)
    #("==" #(#f #<0006>) #f)
    #("!=" #(#t #<0006>) #f)
    #("=int" #(#(#f #unspecified) #<0006>) #f)
    #("<>int" #(#(#t #unspecified) #<0006>) #f)
    #("<int" #(#(#u0000 #unspecified) #<0006>) #f)
    #(">int" #(#(#<0006> #unspecified) #<0006>) #f)
    #("<=int" #(#(#a000 #unspecified) #<0006>) #f)
    #(">=int" #(#(#<0007> #unspecified) #<0006>) #f)
    #("=float" #(#(#f #u0000) #<0006>) #f)
    #("<>float" #(#(#t #u0000) #<0006>) #f)
    #("<float" #(#(#u0000 #u0000) #<0006>) #f)
    #(">float" #(#(#<0006> #u0000) #<0006>) #f)
    #("<=float" #(#(#a000 #u0000) #<0006>) #f)
    #(">=float" #(#(#<0007> #u0000) #<0006>) #f)
    #("=string" #(#(#f #a000) #<0006>) #f)
    #("<>string" #(#(#t #a000) #<0006>) #f)
    #("<string" #(#(#u0000 #a000) #<0006>) #f)
    #(">string" #(#(#<0006> #a000) #<0006>) #f)
    #("<=string" #(#(#a000 #a000) #<0006>) #f)
    #(">=string" #(#(#<0007> #a000) #<0006>) #f)))


(begin
  (define (find_primitive_124@primdecl x1)
    (lambda (x2)
       (2-217-find_primitive_124@primdecl x1 x2)))
 (define (2-217-find_primitive_124@primdecl x1 x2)
    (with-handler
      (lambda (x3)
         (labels
           ((staticfail1001 () (caml-raise x3)))
           (case (caml-extensible-constr-tag x3)
             ((Not_found_4@exc)
              (caml-make-regular-3
                #t
                #f
                x1
                (caml-make-regular-2 #<000b> x2 x1)))
             (else (staticfail1001)))))
      (unwind-protect
        (begin
          (push-exception-handler)
          (caml-make-regular-3
            #t
            #f
            x1
            ((assoc_252@list x2) primitive_names_68@primdecl)))
        (pop-exception-handler))))
)

(begin
  (define (find_scheme_primitive_12@primdecl x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4)
             (4-160-find_scheme_primitive_12@primdecl
               x1
               x2
               x3
               x4)))))
 (define (4-160-find_scheme_primitive_12@primdecl
           x1
           x2
           x3
           x4)
    (caml-make-regular-3
      #t
      (caml-make-regular-2 #t x3 x4)
      x1
      (caml-make-regular-2 #<000b> x2 x1)))
)

