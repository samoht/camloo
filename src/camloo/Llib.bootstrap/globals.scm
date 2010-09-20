;; Le module 
(module
  __caml_globals
  (library camloo-runtime)
  (import __caml_const)
  (export
    (little_name_of_global_209@globals x1)
    generic_255@globals
    notgeneric_227@globals))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (little_name_of_global_209@globals x1)
  (caml-constr-get-field
    (caml-constr-get-field x1 0)
    1))


(begin
  (define generic_255@globals -1)
  (define notgeneric_227@globals 0))

