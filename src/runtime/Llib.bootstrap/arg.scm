;; Le module 
(module
  __caml_arg
  (import
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
    __caml_parsing
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
    (stop_154@arg x1)
    (parse_vect_143@arg x1)
    (3-253-parse_vect_143@arg x1 x2 x3)
    parse_184@arg))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (stop_154@arg x1)
  (let ((x2 (if (>fx (let ((g1010 command_line_240@sys))
                       (if g1010 (vector-length g1010) 0))
                     0)
              (vector-ref command_line_240@sys 0)
              "(?)")))
    (let ((x3 (let ((x3 x1))
                (case (caml-regular-constr-tag x3)
                  ((1)
                   (2-69-^_54@fstring
                     x2
                     (2-69-^_54@fstring
                       ": unknown option: \""
                       (2-69-^_54@fstring
                         (caml-constr-get-field x3 0)
                         "\"."))))
                  ((3)
                   (2-69-^_54@fstring
                     x2
                     (2-69-^_54@fstring
                       ": option \""
                       (2-69-^_54@fstring
                         (caml-constr-get-field x3 0)
                         "\" needs an argument."))))
                  ((2)
                   (2-69-^_54@fstring
                     x2
                     (2-69-^_54@fstring
                       ": wrong argument \""
                       (2-69-^_54@fstring
                         (caml-constr-get-field x3 1)
                         (2-69-^_54@fstring
                           "\"; option \""
                           (2-69-^_54@fstring
                             (caml-constr-get-field x3 0)
                             (2-69-^_54@fstring
                               "\" expects "
                               (2-69-^_54@fstring
                                 (caml-constr-get-field x3 2)
                                 "."))))))))
                  (else
                   (2-69-^_54@fstring
                     x2
                     (2-69-^_54@fstring
                       ": "
                       (caml-constr-get-field x3 0))))))))
      (begin (prerr_endline_232@io x3) (exit_246@io 2)))))


(begin
  (define (parse_vect_143@arg x1)
    (lambda (x2)
       (lambda (x3) (3-253-parse_vect_143@arg x1 x2 x3))))
 (define (3-253-parse_vect_143@arg x1 x2 x3)
    (letrec ((x4 (lambda (x6)
                    (if (null? x6)
                      #f
                      (if (and (>=fx (string-length (car x6)) 1)
                               (tree_equal (string-ref (car x6) 0) #\-))
                        ((x5 (car x6)) (cdr x6))
                        (with-handler
                          (lambda (x7)
                             (labels
                               ((staticfail1001 () (caml-raise x7)))
                               (case (caml-extensible-constr-tag x7)
                                 ((Bad_1@arg)
                                  (stop_154@arg
                                    (caml-make-regular-1
                                      #u0000
                                      (caml-constr-get-field x7 0))))
                                 (else (staticfail1001)))))
                          (unwind-protect
                            (begin
                              (push-exception-handler)
                              (begin (x3 (car x6)) (x4 (cdr x6))))
                            (pop-exception-handler)))))))
             (x5 (lambda (x6)
                    (lambda (x7)
                       (let ((x8 (with-handler
                                   (lambda (x8)
                                      (labels
                                        ((staticfail1003 () (caml-raise x8)))
                                        (case (caml-extensible-constr-tag x8)
                                          ((Not_found_4@exc)
                                           (stop_154@arg
                                             (caml-make-regular-1 #f x6)))
                                          (else (staticfail1003)))))
                                   (unwind-protect
                                     (begin
                                       (push-exception-handler)
                                       (2-203-assoc_252@list x6 x2))
                                     (pop-exception-handler)))))
                         (with-handler
                           (lambda (x9)
                              (labels
                                ((staticfail1009 () (caml-raise x9)))
                                (case (caml-extensible-constr-tag x9)
                                  ((Bad_1@arg)
                                   (stop_154@arg
                                     (caml-make-regular-1
                                       #u0000
                                       (caml-constr-get-field x9 0))))
                                  (else (staticfail1009)))))
                           (unwind-protect
                             (begin
                               (push-exception-handler)
                               (let ((x9 (caml-make-regular-2 #f x8 x7)))
                                 (labels
                                   ((staticfail1004
                                      ()
                                      (caml-raise
                                        '#("Mlib/arg.ml"
                                           1288
                                           1723
                                           Match_failure_1@builtin
                                           ()))))
                                   (labels
                                     ((staticfail1005
                                        ()
                                        (if (null? (caml-constr-get-field x9 1))
                                          (stop_154@arg
                                            (caml-make-regular-1
                                              #unspecified
                                              x6))
                                          (staticfail1004))))
                                     (case (caml-regular-constr-tag
                                             (caml-constr-get-field x9 0))
                                       ((3)
                                        (begin
                                          ((caml-constr-get-field
                                             (caml-constr-get-field x9 0)
                                             0)
                                           #f)
                                          (x4 (caml-constr-get-field x9 1))))
                                       ((1)
                                        (if (null? (caml-constr-get-field x9 1))
                                          (staticfail1005)
                                          (begin
                                            ((caml-constr-get-field
                                               (caml-constr-get-field x9 0)
                                               0)
                                             (car (caml-constr-get-field x9 1)))
                                            (x4 (cdr (caml-constr-get-field
                                                       x9
                                                       1))))))
                                       ((2)
                                        (if (null? (caml-constr-get-field x9 1))
                                          (staticfail1005)
                                          (begin
                                            (with-handler
                                              (lambda (x10)
                                                 (labels
                                                   ((staticfail1007
                                                      ()
                                                      (caml-raise x10)))
                                                   (case (caml-extensible-constr-tag
                                                           x10)
                                                     ((Failure_3@exc)
                                                      (let ((g1011 (caml-constr-get-field
                                                                     x10
                                                                     0)))
                                                        (cond ((string=?
                                                                 g1011
                                                                 "int_of_string")
                                                               (stop_154@arg
                                                                 (caml-make-regular-3
                                                                   #t
                                                                   x6
                                                                   (car (caml-constr-get-field
                                                                          x9
                                                                          1))
                                                                   "an integer")))
                                                              (else
                                                               (staticfail1007)))))
                                                     (else (staticfail1007)))))
                                              (unwind-protect
                                                (begin
                                                  (push-exception-handler)
                                                  ((caml-constr-get-field
                                                     (caml-constr-get-field
                                                       x9
                                                       0)
                                                     0)
                                                   (int_of_string
                                                     (car (caml-constr-get-field
                                                            x9
                                                            1)))))
                                                (pop-exception-handler)))
                                            (x4 (cdr (caml-constr-get-field
                                                       x9
                                                       1))))))
                                       (else
                                        (if (null? (caml-constr-get-field x9 1))
                                          (staticfail1005)
                                          (begin
                                            ((caml-constr-get-field
                                               (caml-constr-get-field x9 0)
                                               0)
                                             (float_of_string
                                               (car (caml-constr-get-field
                                                      x9
                                                      1))))
                                            (x4 (cdr (caml-constr-get-field
                                                       x9
                                                       1)))))))))))
                             (pop-exception-handler))))))))
      (let ((x6 (list_of_vect_3@fvect x1)))
        (if (null? x6) #f (x4 (cdr x6))))))
)

(define parse_184@arg
  (parse_vect_143@arg command_line_240@sys))


