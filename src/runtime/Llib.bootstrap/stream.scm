;; Le module 
(module
  __caml_stream
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
    __caml_printf
    __caml_queue
    __caml_random
    __caml_set
    __caml_sort
    __caml_stack
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
    (stream_peek_92@stream x1)
    (stream_junk_216@stream x1)
    (stream_require_148@stream x1)
    (parser_require_204@stream x1)
    (2-203-parser_require_204@stream x1 x2)
    (stream_next_231@stream x1)
    (stream_from_102@stream x1)
    (stream_of_string_193@stream x1)
    (stream_of_channel_238@stream x1)
    (do_stream_62@stream x1)
    (2-97-do_stream_62@stream x1 x2)
    (stream_check_138@stream x1)
    (2-49-stream_check_138@stream x1 x2)
    (end_of_stream_192@stream x1)
    (stream_get_8@stream x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (stream_peek_92@stream x1)
  (let ((g1017 x1))
    (cond ((eq? g1017 #f)
           (caml-raise 'Parse_failure_1@stream))
          (else
           (case (caml-regular-constr-tag g1017)
             ((6) (caml-raise 'Parse_failure_1@stream))
             ((2) (caml-constr-get-field x1 0))
             ((3)
              (with-handler
                (lambda (x2)
                   (labels
                     ((staticfail1001 () (caml-raise x2)))
                     (case (caml-extensible-constr-tag x2)
                       ((Parse_failure_1@stream)
                        (begin
                          (caml-constr-update!
                            x1
                            (caml-constr-get-field x1 1))
                          (stream_peek_92@stream x1)))
                       (else (staticfail1001)))))
                (unwind-protect
                  (begin
                    (push-exception-handler)
                    (stream_peek_92@stream
                      (caml-constr-get-field x1 0)))
                  (pop-exception-handler))))
             ((4)
              (begin
                (caml-constr-update!
                  x1
                  ((caml-constr-get-field x1 0) #f))
                (stream_peek_92@stream x1)))
             (else
              (let ((x2 (caml-constr-get-field x1 1)))
                (let ((g1018 x2))
                  (cond ((eq? g1018 #unspecified)
                         (caml-raise 'Parse_failure_1@stream))
                        ((eq? g1018 #t)
                         (with-handler
                           (lambda (x3)
                              (labels
                                ((staticfail1003 () (caml-raise x3)))
                                (case (caml-extensible-constr-tag x3)
                                  ((Parse_failure_1@stream End_of_file_1@io)
                                   (begin
                                     (vector-set! x1 1 #unspecified)
                                     (caml-raise 'Parse_failure_1@stream)))
                                  (else (staticfail1003)))))
                           (unwind-protect
                             (begin
                               (push-exception-handler)
                               (let ((x3 ((caml-constr-get-field x1 0) #f)))
                                 (begin
                                   (vector-set!
                                     x1
                                     1
                                     (caml-make-regular-1 #f x3))
                                   x3)))
                             (pop-exception-handler))))
                        (else (caml-constr-get-field x2 0)))))))))))


(define (stream_junk_216@stream x1)
  (labels
    ((staticfail1004 () #f))
    (case (if (caml-constant-constr? x1)
            -1
            (caml-regular-constr-tag x1))
      ((2)
       (caml-constr-update!
         x1
         (caml-constr-get-field x1 1)))
      ((3)
       (stream_junk_216@stream
         (caml-constr-get-field x1 0)))
      ((5) (vector-set! x1 1 #t))
      (else (staticfail1004)))))


(define (stream_require_148@stream x1)
  (with-handler
    (lambda (x2)
       (labels
         ((staticfail1006 () (caml-raise x2)))
         (case (caml-extensible-constr-tag x2)
           ((Parse_failure_1@stream)
            (caml-raise 'Parse_error_2@stream))
           (else (staticfail1006)))))
    (unwind-protect
      (begin
        (push-exception-handler)
        (stream_peek_92@stream x1))
      (pop-exception-handler))))


(begin
  (define (parser_require_204@stream x1)
    (lambda (x2)
       (2-203-parser_require_204@stream x1 x2)))
 (define (2-203-parser_require_204@stream x1 x2)
    (with-handler
      (lambda (x3)
         (labels
           ((staticfail1008 () (caml-raise x3)))
           (case (caml-extensible-constr-tag x3)
             ((Parse_failure_1@stream)
              (caml-raise 'Parse_error_2@stream))
             (else (staticfail1008)))))
      (unwind-protect
        (begin (push-exception-handler) (x1 x2))
        (pop-exception-handler))))
)

(define (stream_next_231@stream x1)
  (let ((x2 (stream_peek_92@stream x1)))
    (begin (stream_junk_216@stream x1) x2)))


(define (stream_from_102@stream x1)
  (caml-make-regular-2 #a000 x1 #t))


(define (stream_of_string_193@stream x1)
  (let ((x2 -1))
    (stream_from_102@stream
      (lambda (x3)
         (begin
           (set! x2 (+fx x2 1))
           (if (>=fx x2 (string-length x1))
             (caml-raise 'Parse_failure_1@stream)
             (string-ref x1 x2)))))))


(define (stream_of_channel_238@stream x1)
  (stream_from_102@stream
    (lambda (x2) (input_char x1))))


(begin
  (define (do_stream_62@stream x1)
    (lambda (x2) (2-97-do_stream_62@stream x1 x2)))
 (define (2-97-do_stream_62@stream x1 x2)
    (letrec ((x3 (lambda (x4)
                    (begin
                      (x1 (stream_peek_92@stream x2))
                      (begin (stream_junk_216@stream x2) (x3 #f))))))
      (with-handler
        (lambda (x4)
           (labels
             ((staticfail1010 () (caml-raise x4)))
             (case (caml-extensible-constr-tag x4)
               ((Parse_failure_1@stream) #f)
               (else (staticfail1010)))))
        (unwind-protect
          (begin (push-exception-handler) (x3 #f))
          (pop-exception-handler)))))
)

(begin
  (define (stream_check_138@stream x1)
    (lambda (x2)
       (2-49-stream_check_138@stream x1 x2)))
 (define (2-49-stream_check_138@stream x1 x2)
    (let ((x3 (stream_peek_92@stream x2)))
      (if (x1 x3)
        (begin (stream_junk_216@stream x2) x3)
        (caml-raise 'Parse_failure_1@stream))))
)

(define (end_of_stream_192@stream x1)
  (if (with-handler
        (lambda (x2)
           (labels
             ((staticfail1012 () (caml-raise x2)))
             (case (caml-extensible-constr-tag x2)
               ((Parse_failure_1@stream) #t)
               (else (staticfail1012)))))
        (unwind-protect
          (begin
            (push-exception-handler)
            (begin (stream_peek_92@stream x1) #f))
          (pop-exception-handler)))
    #f
    (caml-raise 'Parse_failure_1@stream)))


(define (stream_get_8@stream x1)
  (let ((g1019 x1))
    (cond ((eq? g1019 #f)
           (caml-raise 'Parse_failure_1@stream))
          (else
           (case (caml-regular-constr-tag g1019)
             ((6) (caml-raise 'Parse_failure_1@stream))
             ((2)
              (caml-make-regular-2
                #f
                (caml-constr-get-field x1 0)
                (caml-constr-get-field x1 1)))
             ((3)
              (let ((x2 (with-handler
                          (lambda (x2)
                             (labels
                               ((staticfail1014 () (caml-raise x2)))
                               (case (caml-extensible-constr-tag x2)
                                 ((Parse_failure_1@stream)
                                  (stream_get_8@stream
                                    (caml-constr-get-field x1 1)))
                                 (else (staticfail1014)))))
                          (unwind-protect
                            (begin
                              (push-exception-handler)
                              (let ((x2 (stream_get_8@stream
                                          (caml-constr-get-field x1 0))))
                                (caml-make-regular-2
                                  #f
                                  (caml-constr-get-field x2 0)
                                  (caml-make-regular-2
                                    #unspecified
                                    (caml-constr-get-field x2 1)
                                    (caml-constr-get-field x1 1)))))
                            (pop-exception-handler)))))
                (begin
                  (caml-constr-update!
                    x1
                    (caml-make-regular-2
                      #t
                      (caml-constr-get-field x2 0)
                      (caml-constr-get-field x2 1)))
                  x2)))
             ((4)
              (begin
                (caml-constr-update!
                  x1
                  ((caml-constr-get-field x1 0) #f))
                (stream_get_8@stream x1)))
             (else
              (let ((x2 (caml-constr-get-field x1 1)))
                (let ((g1020 x2))
                  (cond ((eq? g1020 #t)
                         (with-handler
                           (lambda (x3)
                              (labels
                                ((staticfail1016 () (caml-raise x3)))
                                (case (caml-extensible-constr-tag x3)
                                  ((Parse_failure_1@stream End_of_file_1@io)
                                   (begin
                                     (caml-constr-update! x1 '#(0 #<0006>))
                                     (caml-raise 'Parse_failure_1@stream)))
                                  (else (staticfail1016)))))
                           (unwind-protect
                             (begin
                               (push-exception-handler)
                               (let ((x3 ((caml-constr-get-field x1 0) #f)))
                                 (let ((x4 (caml-make-regular-2
                                             #a000
                                             (caml-constr-get-field x1 0)
                                             #t)))
                                   (begin
                                     (caml-constr-update!
                                       x1
                                       (caml-make-regular-2 #t x3 x4))
                                     (caml-make-regular-2 #f x3 x4)))))
                             (pop-exception-handler))))
                        ((eq? g1020 #unspecified)
                         (caml-raise 'Parse_failure_1@stream))
                        (else
                         (let ((x3 (caml-make-regular-2
                                     #a000
                                     (caml-constr-get-field x1 0)
                                     #t)))
                           (begin
                             (caml-constr-update!
                               x1
                               (caml-make-regular-2
                                 #t
                                 (caml-constr-get-field x2 0)
                                 x3))
                             (caml-make-regular-2
                               #f
                               (caml-constr-get-field x2 0)
                               x3)))))))))))))


