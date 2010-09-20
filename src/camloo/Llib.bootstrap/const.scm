;; Le module 
(module
  __caml_const
  (library camloo-runtime)
  (import __caml_misc)
  (export
    const_unit_249@const
    (int_of_atom_37@const x1)
    (int_of_constr_tag_57@const x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define const_unit_249@const
  '#(#(#("builtin" "()" #f) 0 1 #t) () #t))


(define (int_of_atom_37@const x1)
  (labels
    ((staticfail1000
       ()
       (fatal_error_193@misc "int_of_atom")))
    (case (if (caml-constant-constr? x1)
            -1
            (caml-regular-constr-tag x1))
      ((1) (caml-constr-get-field x1 0))
      ((4) (int_of_char (caml-constr-get-field x1 0)))
      (else (staticfail1000)))))


(define (int_of_constr_tag_57@const x1)
  (case (caml-regular-constr-tag x1)
    ((2) (caml-constr-get-field x1 1))
    (else (fatal_error_193@misc "int_of_constr_tag"))))


