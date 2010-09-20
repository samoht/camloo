;; Le module 
(module
  __caml_lambda
  (library camloo-runtime)
  (import
    __caml_const
    __caml_prim
    __caml_globals
    __caml_instruct)
  (export (share_lambda_40@lambda x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (share_lambda_40@lambda x1)
  (caml-make-regular-2
    #<0013>
    x1
    (make-cell Nolabel_4@instruct)))


