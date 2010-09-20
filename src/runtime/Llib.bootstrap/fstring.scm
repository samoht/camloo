;; Le module 
(module
  __caml_fstring
  (import
    __caml_arg
    __caml_baltree
    __caml_char
    __caml_eq
    __caml_exc
    __caml_fchar
    __caml_filename
    __caml_float
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
    (make_string_7@fstring x1)
    (2-208-make_string_7@fstring x1 x2)
    (^_54@fstring x1)
    (2-69-^_54@fstring x1 x2)
    (sub_string_61@fstring x1)
    (3-22-sub_string_61@fstring x1 x2 x3)
    (replace_string_174@fstring x1)
    (3-137-replace_string_174@fstring x1 x2 x3)
    (string_for_read_244@fstring x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (make_string_7@fstring x1)
    (lambda (x2) (2-208-make_string_7@fstring x1 x2)))
 (define (2-208-make_string_7@fstring x1 x2)
    (let ((x3 (create_string x1)))
      (begin (fill_string x3 0 x1 x2) x3)))
)

(begin
  (define (^_54@fstring x1)
    (lambda (x2) (2-69-^_54@fstring x1 x2)))
 (define (2-69-^_54@fstring x1 x2)
    (let ((x3 (string-length x1)) (x4 (string-length x2)))
      (let ((x5 (create_string (+fx x3 x4))))
        (begin
          (blit_string x1 0 x5 0 x3)
          (begin (blit_string x2 0 x5 x3 x4) x5)))))
)

(begin
  (define (sub_string_61@fstring x1)
    (lambda (x2)
       (lambda (x3)
          (3-22-sub_string_61@fstring x1 x2 x3))))
 (define (3-22-sub_string_61@fstring x1 x2 x3)
    (let ((x4 (create_string x3)))
      (begin (blit_string x1 x2 x4 0 x3) x4)))
)

(begin
  (define (replace_string_174@fstring x1)
    (lambda (x2)
       (lambda (x3)
          (3-137-replace_string_174@fstring x1 x2 x3))))
 (define (3-137-replace_string_174@fstring x1 x2 x3)
    (blit_string x2 0 x1 x3 (string-length x2)))
)

(define (string_for_read_244@fstring x1)
  (let ((x2 0))
    (begin
      (let ((stop1001 (-fx (string-length x1) 1)))
        (let for1000 ((i3 0))
          (if (<=fx i3 stop1001)
            (begin
              (set! x2
                (+fx x2
                     (let ((x5 (string-ref x1 i3)))
                       (labels
                         ((staticfail1002 () (if (is_printable x5) 1 4)))
                         (case x5
                           ((#\tab #\newline #\\ #\") 2)
                           (else (staticfail1002)))))))
              (for1000 (+fx i3 1)))
            (unspecified))))
      (if (eq? x2 (string-length x1))
        x1
        (let ((x3 (create_string x2)))
          (begin
            (set! x2 0)
            (begin
              (let ((stop1004 (-fx (string-length x1) 1)))
                (let for1003 ((i4 0))
                  (if (<=fx i4 stop1004)
                    (begin
                      (begin
                        (let ((x6 (string-ref x1 i4)))
                          (labels
                            ((staticfail1005
                               ()
                               (if (is_printable x6)
                                 (string-set! x3 x2 x6)
                                 (let ((x7 (int_of_char x6)))
                                   (begin
                                     (string-set! x3 x2 #\\)
                                     (begin
                                       (set! x2 (+fx x2 1))
                                       (begin
                                         (string-set!
                                           x3
                                           x2
                                           (char_of_int (+fx 48 (/fx x7 100))))
                                         (begin
                                           (set! x2 (+fx x2 1))
                                           (begin
                                             (string-set!
                                               x3
                                               x2
                                               (char_of_int
                                                 (+fx 48
                                                      (modulo (/fx x7 10) 10))))
                                             (begin
                                               (set! x2 (+fx x2 1))
                                               (string-set!
                                                 x3
                                                 x2
                                                 (char_of_int
                                                   (+fx 48
                                                        (modulo
                                                          x7
                                                          10))))))))))))))
                            (case x6
                              ((#\")
                               (begin
                                 (string-set! x3 x2 #\\)
                                 (begin
                                   (set! x2 (+fx x2 1))
                                   (string-set! x3 x2 #\"))))
                              ((#\\)
                               (begin
                                 (string-set! x3 x2 #\\)
                                 (begin
                                   (set! x2 (+fx x2 1))
                                   (string-set! x3 x2 #\\))))
                              ((#\newline)
                               (begin
                                 (string-set! x3 x2 #\\)
                                 (begin
                                   (set! x2 (+fx x2 1))
                                   (string-set! x3 x2 #\n))))
                              ((#\tab)
                               (begin
                                 (string-set! x3 x2 #\\)
                                 (begin
                                   (set! x2 (+fx x2 1))
                                   (string-set! x3 x2 #\t))))
                              (else (staticfail1005)))))
                        (set! x2 (+fx x2 1)))
                      (for1003 (+fx i4 1)))
                    (unspecified))))
              x3)))))))


