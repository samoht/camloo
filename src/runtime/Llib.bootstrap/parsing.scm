;; Le module 
(module
  __caml_parsing
  (import
    __caml_arg
    __caml_baltree
    __caml_char
    __caml_eq
    __caml_exc
    __caml_fchar
    __caml_filename
    __caml_float
    __caml_fstring
    __caml_fvect
    __caml_genlex
    __caml_hashtbl
    __caml_int
    __caml_io
    __caml_lexing
    __caml_list
    __caml_map
    __caml_pair
    __caml_printexc
    __caml_printf
    __caml_queue
    __caml_random
    __caml_set
    __caml_sort
    __caml_stack
    __caml_stream
    __caml_string
    __caml_vect
    __caml_constr
    __caml_bfloat
    __caml_bint
    __caml_bio
    __caml_bmisc
    __caml_bstring
    __caml_sys
    __caml_handle
    __caml_intext
    __caml_tag)
  (export
    env_68@parsing
    (grow_stacks_196@parsing x1)
    (clear_parser_17@parsing x1)
    (yyparse_223@parsing x1)
    (4-56-yyparse_223@parsing x1 x2 x3 x4)
    (peek_val_78@parsing x1)
    (symbol_start_182@parsing x1)
    (symbol_end_28@parsing x1)
    (rhs_start_56@parsing x1)
    (rhs_end_87@parsing x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define env_68@parsing
  (caml-make-regular
    #f
    12
    (make-vector 100 0)
    (make-vector 100 #f)
    (make-vector 100 0)
    (make-vector 100 0)
    100
    0
    #f
    0
    0
    0
    0
    0))


(define (grow_stacks_196@parsing x1)
  (let ((x2 (caml-constr-get-field env_68@parsing 4)))
    (let ((x3 (*fx x2 2)))
      (let ((x4 (make-vector x3 0))
            (x5 (make-vector x3 #f))
            (x6 (make-vector x3 0))
            (x7 (make-vector x3 0)))
        (begin
          (5-48-blit_vect_203@fvect
            (caml-constr-get-field env_68@parsing 0)
            0
            x4
            0
            x2)
          (begin
            (caml-constr-set-field! env_68@parsing 0 x4)
            (begin
              (5-48-blit_vect_203@fvect
                (caml-constr-get-field env_68@parsing 1)
                0
                x5
                0
                x2)
              (begin
                (caml-constr-set-field! env_68@parsing 1 x5)
                (begin
                  (5-48-blit_vect_203@fvect
                    (caml-constr-get-field env_68@parsing 2)
                    0
                    x6
                    0
                    x2)
                  (begin
                    (caml-constr-set-field! env_68@parsing 2 x6)
                    (begin
                      (5-48-blit_vect_203@fvect
                        (caml-constr-get-field env_68@parsing 3)
                        0
                        x7
                        0
                        x2)
                      (begin
                        (caml-constr-set-field! env_68@parsing 3 x7)
                        (caml-constr-set-field! env_68@parsing 4 x3)))))))))))))


(define (clear_parser_17@parsing x1)
  (begin
    (4-206-fill_vect_126@fvect
      (caml-constr-get-field env_68@parsing 1)
      0
      (caml-constr-get-field env_68@parsing 4)
      #f)
    (caml-constr-set-field! env_68@parsing 6 #f)))


(begin
  (define (yyparse_223@parsing x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4)
             (4-56-yyparse_223@parsing x1 x2 x3 x4)))))
 (define (4-56-yyparse_223@parsing x1 x2 x3 x4)
    (letrec ((x5 (lambda (x6)
                    (lambda (x7)
                       (let ((x8 (parse_engine x1 env_68@parsing x6 x7)))
                         (let ((g1002 x8))
                           (cond ((eq? g1002 #f)
                                  (let ((x9 (x3 x4)))
                                    (begin
                                      (caml-constr-set-field!
                                        env_68@parsing
                                        7
                                        (+fx (caml-constr-get-field x4 2)
                                             (caml-constr-get-field x4 3)))
                                      (begin
                                        (caml-constr-set-field!
                                          env_68@parsing
                                          8
                                          (+fx (caml-constr-get-field x4 2)
                                               (caml-constr-get-field x4 4)))
                                        ((x5 #t) x9)))))
                                 ((eq? g1002 #t)
                                  (let ((x9 (caml-constr-get-field
                                              env_68@parsing
                                              5)))
                                    (caml-raise
                                      (caml-make-static-extensible-1
                                        'Parse_error_2@parsing
                                        (lambda (x10)
                                           (eq? (vector-ref
                                                  (caml-constr-get-field x1 1)
                                                  (tag-of x10))
                                                x9))))))
                                 ((eq? g1002 #a000)
                                  ((x5 #a000)
                                   ((vector-ref
                                      (caml-constr-get-field x1 0)
                                      (caml-constr-get-field env_68@parsing 11))
                                    #f)))
                                 ((eq? g1002 #unspecified)
                                  (begin
                                    (grow_stacks_196@parsing #f)
                                    ((x5 #unspecified) #f)))
                                 ((eq? g1002 #u0000)
                                  (begin
                                    (grow_stacks_196@parsing #f)
                                    ((x5 #u0000) #f)))
                                 (else #f))))))))
      (begin
        (caml-constr-set-field! env_68@parsing 5 x2)
        (begin
          (caml-constr-set-field! env_68@parsing 9 0)
          (with-handler
            (lambda (x6)
               (labels
                 ((staticfail1001 () (caml-raise x6)))
                 (case (caml-extensible-constr-tag x6)
                   ((yyexit_1@parsing) (caml-constr-get-field x6 0))
                   (else (staticfail1001)))))
            (unwind-protect
              (begin (push-exception-handler) ((x5 #f) #f))
              (pop-exception-handler)))))))
)

(define (peek_val_78@parsing x1)
  (vector-ref
    (caml-constr-get-field env_68@parsing 1)
    (-fx (caml-constr-get-field env_68@parsing 9) x1)))


(begin
  (define (symbol_start_182@parsing x1)
    (vector-ref
      (caml-constr-get-field env_68@parsing 2)
      (+fx (-fx (caml-constr-get-field env_68@parsing 9)
                (caml-constr-get-field env_68@parsing 10))
           1)))
 (define (symbol_end_28@parsing x1)
    (vector-ref
      (caml-constr-get-field env_68@parsing 3)
      (caml-constr-get-field env_68@parsing 9)))
)

(begin
  (define (rhs_start_56@parsing x1)
    (vector-ref
      (caml-constr-get-field env_68@parsing 2)
      (-fx (caml-constr-get-field env_68@parsing 9)
           (-fx (caml-constr-get-field env_68@parsing 10)
                x1))))
 (define (rhs_end_87@parsing x1)
    (vector-ref
      (caml-constr-get-field env_68@parsing 3)
      (-fx (caml-constr-get-field env_68@parsing 9)
           (-fx (caml-constr-get-field env_68@parsing 10)
                x1))))
)

