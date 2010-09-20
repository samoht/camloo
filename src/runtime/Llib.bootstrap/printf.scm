;; Le module 
(module
  __caml_printf
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
    __caml_parsing
    __caml_printexc
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
    (barf_if_more_args_32@printf x1)
    (fprintf_48@printf x1)
    (2-151-fprintf_48@printf x1 x2)
    (printf_219@printf x1)
    fprint_78@printf
    print_144@printf))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (barf_if_more_args_32@printf x1)
  (invalid_arg_209@exc
    "fprintf: too many arguments"))


(begin
  (define (fprintf_48@printf x1)
    (lambda (x2) (2-151-fprintf_48@printf x1 x2)))
 (define (2-151-fprintf_48@printf x1 x2)
    (letrec ((x3 (lambda (x7)
                    (if (>=fx x7 (string-length x2))
                      barf_if_more_args_32@printf
                      (let ((x8 (string-ref x2 x7)))
                        (labels
                          ((staticfail1000
                             ()
                             (begin (output_char x1 x8) (x3 (+fx x7 1)))))
                          (let ((g1003 x8))
                            (cond ((char=? g1003 #\%)
                                   (let ((x9 (x4 (+fx x7 1))))
                                     (let ((x10 (string-ref x2 x9)))
                                       (labels
                                         ((staticfail1001
                                            ()
                                            (invalid_arg_209@exc
                                              (2-69-^_54@fstring
                                                "fprintf: unknown format "
                                                (char_for_read_215@fchar
                                                  x10)))))
                                         (case x10
                                           ((#\%)
                                            (begin
                                              (output_char x1 #\%)
                                              (x3 (+fx x9 1))))
                                           ((#\s)
                                            (lambda (x11)
                                               (begin
                                                 (if (or (not (obj_is_block
                                                                x11))
                                                         ((lambda (x y)
                                                             (not (eq? x y)))
                                                          (tag-of x11)
                                                          253))
                                                   (invalid_arg_209@exc
                                                     "fprintf: string argument expected")
                                                   (if (<=fx x9 (+fx x7 1))
                                                     (2-235-output_string_156@io
                                                       x1
                                                       x11)
                                                     (let ((x12 (with-handler
                                                                  (lambda (x12)
                                                                     (invalid_arg_209@exc
                                                                       "fprintf: bad %s format"))
                                                                  (unwind-protect
                                                                    (begin
                                                                      (push-exception-handler)
                                                                      (int_of_string
                                                                        (3-22-sub_string_61@fstring
                                                                          x2
                                                                          (+fx x7
                                                                               1)
                                                                          (-fx (-fx x9
                                                                                    x7)
                                                                               1))))
                                                                    (pop-exception-handler)))))
                                                       (if (and (>fx x12 0)
                                                                (<fx (string-length
                                                                       x11)
                                                                     x12))
                                                         (begin
                                                           (2-235-output_string_156@io
                                                             x1
                                                             (2-208-make_string_7@fstring
                                                               (-fx x12
                                                                    (string-length
                                                                      x11))
                                                               #\space))
                                                           (2-235-output_string_156@io
                                                             x1
                                                             x11))
                                                         (if (and (<fx x12 0)
                                                                  (<fx (string-length
                                                                         x11)
                                                                       (negfx x12)))
                                                           (begin
                                                             (2-235-output_string_156@io
                                                               x1
                                                               x11)
                                                             (2-235-output_string_156@io
                                                               x1
                                                               (2-208-make_string_7@fstring
                                                                 (-fx (negfx x12)
                                                                      (string-length
                                                                        x11))
                                                                 #\space)))
                                                           (2-235-output_string_156@io
                                                             x1
                                                             x11))))))
                                                 (x3 (+fx x9 1)))))
                                           ((#\c)
                                            (lambda (x11)
                                               (if (obj_is_block x11)
                                                 (invalid_arg_209@exc
                                                   "fprintf: char argument expected")
                                                 (begin
                                                   (output_char x1 x11)
                                                   (x3 (+fx x9 1))))))
                                           ((#\u #\X #\x #\o #\i #\d)
                                            ((x5 x7) x9))
                                           ((#\G #\g #\E #\e #\f) ((x6 x7) x9))
                                           ((#\b)
                                            (lambda (x11)
                                               (begin
                                                 (if (obj_is_block x11)
                                                   (2-235-output_string_156@io
                                                     x1
                                                     (if x11 "true" "false"))
                                                   (invalid_arg_209@exc
                                                     "fprintf: boolean argument expected"))
                                                 (x3 (+fx x9 1)))))
                                           (else (staticfail1001)))))))
                                  (else (staticfail1000)))))))))
             (x4 (lambda (x7)
                    (let ((x8 (string-ref x2 x7)))
                      (labels
                        ((staticfail1002 () x7))
                        (case x8
                          ((#\-
                            #\.
                            #\space
                            #\9
                            #\8
                            #\7
                            #\6
                            #\5
                            #\4
                            #\3
                            #\2
                            #\1
                            #\0)
                           (x4 (+fx x7 1)))
                          (else (staticfail1002)))))))
             (x5 (lambda (x7)
                    (lambda (x8)
                       (lambda (x9)
                          (if (obj_is_block x9)
                            (invalid_arg_209@exc
                              "fprintf: int argument expected")
                            (let ((x10 (-fx x8 x7)))
                              (let ((x11 (create_string (+fx x10 2))))
                                (begin
                                  (blit_string x2 x7 x11 0 x10)
                                  (begin
                                    (string-set! x11 x10 #\l)
                                    (begin
                                      (string-set!
                                        x11
                                        (+fx x10 1)
                                        (string-ref x2 x8))
                                      (begin
                                        (2-235-output_string_156@io
                                          x1
                                          (format_int x11 x9))
                                        (x3 (+fx x8 1)))))))))))))
             (x6 (lambda (x7)
                    (lambda (x8)
                       (lambda (x9)
                          (if (or (not (obj_is_block x9))
                                  ((lambda (x y) (not (eq? x y)))
                                   (tag-of x9)
                                   254))
                            (invalid_arg_209@exc
                              "fprintf: float argument expected")
                            (begin
                              (2-235-output_string_156@io
                                x1
                                (format_float
                                  (3-22-sub_string_61@fstring
                                    x2
                                    x7
                                    (+fx (-fx x8 x7) 1))
                                  x9))
                              (x3 (+fx x8 1)))))))))
      (x3 0)))
)

(define (printf_219@printf x1)
  (2-151-fprintf_48@printf std_out_112@io x1))


(begin
  (define fprint_78@printf output_string_156@io)
  (define print_144@printf print_string_98@io))

