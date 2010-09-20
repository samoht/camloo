;; Le module 
(module
  __caml_syntax
  (library camloo-runtime)
  (import
    __caml_const
    __caml_location
    __caml_globals)
  (export
    (free_vars_of_pat_1@syntax x1)
    (expr_is_pure_5@syntax x1)
    (letdef_is_pure_151@syntax x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (free_vars_of_pat_1@syntax x1)
  (let ((x2 (caml-constr-get-field x1 0)))
    (let ((g1001 x2))
      (cond ((eq? g1001 #f) '())
            (else
             (case (caml-regular-constr-tag g1001)
               ((2) (cons (caml-constr-get-field x2 0) '()))
               ((3)
                (cons (caml-constr-get-field x2 1)
                      (free_vars_of_pat_1@syntax
                        (caml-constr-get-field x2 0))))
               ((6 4) '())
               ((5)
                ((flat_map_45@list free_vars_of_pat_1@syntax)
                 (caml-constr-get-field x2 0)))
               ((7)
                (free_vars_of_pat_1@syntax
                  (caml-constr-get-field x2 1)))
               ((8)
                ((@_176@list
                   (free_vars_of_pat_1@syntax
                     (caml-constr-get-field x2 0)))
                 (free_vars_of_pat_1@syntax
                   (caml-constr-get-field x2 1))))
               ((9)
                (free_vars_of_pat_1@syntax
                  (caml-constr-get-field x2 0)))
               (else
                ((flat_map_45@list
                   (lambda (x3)
                      (free_vars_of_pat_1@syntax
                        (caml-constr-get-field x3 1))))
                 (caml-constr-get-field x2 0)))))))))


(define (expr_is_pure_5@syntax x1)
  (let ((x2 (caml-constr-get-field x1 0)))
    (labels
      ((staticfail1000 () #f))
      (case (if (caml-constant-constr? x2)
              -1
              (caml-regular-constr-tag x2))
        ((23 8 4 2 1) #t)
        ((17 3)
         ((for_all_96@list expr_is_pure_5@syntax)
          (caml-constr-get-field x2 0)))
        ((5)
         (expr_is_pure_5@syntax
           (caml-constr-get-field x2 1)))
        ((16)
         (expr_is_pure_5@syntax
           (caml-constr-get-field x2 0)))
        ((19)
         ((for_all_96@list
            (lambda (x3)
               (expr_is_pure_5@syntax
                 (caml-constr-get-field x3 1))))
          (caml-constr-get-field x2 0)))
        (else (staticfail1000))))))


(define (letdef_is_pure_151@syntax x1)
  ((for_all_96@list
     (lambda (x2)
        (expr_is_pure_5@syntax
          (caml-constr-get-field x2 1))))
   x1))


