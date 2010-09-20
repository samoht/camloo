;; Le module 
(module
  __caml_errors
  (library camloo-runtime)
  (import
    __caml_misc
    __caml_const
    __caml_globals
    __caml_location)
  (export
    (print_qualid_104@errors x1)
    (prerr_qualid_47@errors x1)
    (print_globalref_211@errors x1)
    (prerr_globalref_125@errors x1)
    (unbound_err_215@errors x1)
    (3-182-unbound_err_215@errors x1 x2 x3)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (print_qualid_104@errors x1)
  (begin
    (print_string_98@io (caml-constr-get-field x1 0))
    (begin
      (print_string_98@io "__")
      (print_string_98@io (caml-constr-get-field x1 1)))))


(define (prerr_qualid_47@errors x1)
  (begin
    (prerr_string_235@io
      (caml-constr-get-field x1 0))
    (begin
      (prerr_string_235@io "__")
      (prerr_string_235@io
        (caml-constr-get-field x1 1)))))


(define (print_globalref_211@errors x1)
  (case (caml-regular-constr-tag x1)
    ((1)
     (print_string_98@io (caml-constr-get-field x1 0)))
    (else
     (print_qualid_104@errors
       (caml-constr-get-field x1 0)))))


(define (prerr_globalref_125@errors x1)
  (case (caml-regular-constr-tag x1)
    ((1)
     (prerr_string_235@io
       (caml-constr-get-field x1 0)))
    (else
     (prerr_qualid_47@errors
       (caml-constr-get-field x1 0)))))


(begin
  (define (unbound_err_215@errors x1)
    (lambda (x2)
       (lambda (x3)
          (3-182-unbound_err_215@errors x1 x2 x3))))
 (define (3-182-unbound_err_215@errors x1 x2 x3)
    (begin
      (prerr_location_1@location x3)
      (begin
        (prerr_begline_213@misc " ")
        (begin
          (prerr_string_235@io x1)
          (begin
            (prerr_string_235@io " ")
            (begin
              (prerr_globalref_125@errors x2)
              (begin
                (prerr_endline_232@io " is unbound.")
                (caml-raise 'Toplevel_2@misc))))))))
)

