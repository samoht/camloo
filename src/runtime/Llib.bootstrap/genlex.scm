;; Le module 
(module
  __caml_genlex
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
    initial_buffer_128@genlex
    buffer_20@genlex
    bufpos_62@genlex
    (reset_buffer_23@genlex x1)
    (store_147@genlex x1)
    (get_string_221@genlex x1)
    (make_lexer_140@genlex x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define initial_buffer_128@genlex
  (create_string 32))


(define buffer_20@genlex
  (make-cell initial_buffer_128@genlex))


(define bufpos_62@genlex (make-cell 0))

(define (reset_buffer_23@genlex x1)
  (begin
    (cell-set!
      buffer_20@genlex
      initial_buffer_128@genlex)
    (cell-set! bufpos_62@genlex 0)))


(define (store_147@genlex x1)
  (begin
    (if (>=fx (cell-ref bufpos_62@genlex)
              (string-length (cell-ref buffer_20@genlex)))
      (let ((x2 (create_string
                  (*fx 2 (cell-ref bufpos_62@genlex)))))
        (begin
          (blit_string
            (cell-ref buffer_20@genlex)
            0
            x2
            0
            (cell-ref bufpos_62@genlex))
          (cell-set! buffer_20@genlex x2)))
      #f)
    (begin
      (string-set!
        (cell-ref buffer_20@genlex)
        (cell-ref bufpos_62@genlex)
        x1)
      (cell-set!
        bufpos_62@genlex
        (+fx (cell-ref bufpos_62@genlex) 1)))))


(define (get_string_221@genlex x1)
  (let ((x2 (3-22-sub_string_61@fstring
              (cell-ref buffer_20@genlex)
              0
              (cell-ref bufpos_62@genlex))))
    (begin
      (cell-set!
        buffer_20@genlex
        initial_buffer_128@genlex)
      x2)))


(define (make_lexer_140@genlex x1)
  (let ((x2 (new_27@hashtbl 17)))
    (begin
      (2-1-do_list_18@list
        (lambda (x3)
           (3-64-add_6@hashtbl
             x2
             x3
             (caml-make-regular-1 #f x3)))
        x1)
      (let ((x3 (lambda (x3)
                   (with-handler
                     (lambda (x4)
                        (labels
                          ((staticfail1001 () (caml-raise x4)))
                          (case (caml-extensible-constr-tag x4)
                            ((Not_found_4@exc) (caml-make-regular-1 #t x3))
                            (else (staticfail1001)))))
                     (unwind-protect
                       (begin
                         (push-exception-handler)
                         (2-65-find_75@hashtbl x2 x3))
                       (pop-exception-handler)))))
            (x4 (lambda (x4)
                   (let ((x5 (2-208-make_string_7@fstring 1 x4)))
                     (with-handler
                       (lambda (x6)
                          (labels
                            ((staticfail1003 () (caml-raise x6)))
                            (case (caml-extensible-constr-tag x6)
                              ((Not_found_4@exc)
                               (caml-raise 'Parse_error_2@stream))
                              (else (staticfail1003)))))
                       (unwind-protect
                         (begin
                           (push-exception-handler)
                           (2-65-find_75@hashtbl x2 x5))
                         (pop-exception-handler)))))))
        (letrec ((x5 (lambda (x20)
                        (let ((x21 (stream_peek_92@stream x20)))
                          (labels
                            ((staticfail1004
                               ()
                               (begin (stream_junk_216@stream x20) (x4 x21))))
                            (case x21
                              ((#a012 #a026 #\tab #\return #\newline #\space)
                               (begin
                                 (stream_junk_216@stream x20)
                                 (let ((x22 x20)) (x5 x22))))
                              ((#a255
                                #a254
                                #a253
                                #a252
                                #a251
                                #a250
                                #a249
                                #a248
                                #a247
                                #a246
                                #a245
                                #a244
                                #a243
                                #a242
                                #a241
                                #a240
                                #a239
                                #a238
                                #a237
                                #a236
                                #a235
                                #a234
                                #a233
                                #a232
                                #a231
                                #a230
                                #a229
                                #a228
                                #a227
                                #a226
                                #a225
                                #a224
                                #a223
                                #a222
                                #a221
                                #a220
                                #a219
                                #a218
                                #a217
                                #a216
                                #a215
                                #a214
                                #a213
                                #a212
                                #a211
                                #a210
                                #a209
                                #a208
                                #a207
                                #a206
                                #a205
                                #a204
                                #a203
                                #a202
                                #a201
                                #a200
                                #a199
                                #a198
                                #a197
                                #a196
                                #a195
                                #a194
                                #a193
                                #a192
                                #\z
                                #\y
                                #\x
                                #\w
                                #\v
                                #\u
                                #\t
                                #\s
                                #\r
                                #\q
                                #\p
                                #\o
                                #\n
                                #\m
                                #\l
                                #\k
                                #\j
                                #\i
                                #\h
                                #\g
                                #\f
                                #\e
                                #\d
                                #\c
                                #\b
                                #\a
                                #\Z
                                #\Y
                                #\X
                                #\W
                                #\V
                                #\U
                                #\T
                                #\S
                                #\R
                                #\Q
                                #\P
                                #\O
                                #\N
                                #\M
                                #\L
                                #\K
                                #\J
                                #\I
                                #\H
                                #\G
                                #\F
                                #\E
                                #\D
                                #\C
                                #\B
                                #\A)
                               (begin
                                 (stream_junk_216@stream x20)
                                 (let ((x22 x20))
                                   (begin
                                     (reset_buffer_23@genlex #f)
                                     (begin (store_147@genlex x21) (x6 x22))))))
                              ((#\*
                                #\|
                                #\^
                                #\~
                                #\\
                                #\@
                                #\?
                                #\>
                                #\=
                                #\<
                                #\:
                                #\/
                                #\+
                                #\#
                                #\$
                                #\&
                                #\%
                                #\!)
                               (begin
                                 (stream_junk_216@stream x20)
                                 (let ((x22 x20))
                                   (begin
                                     (reset_buffer_23@genlex #f)
                                     (begin (store_147@genlex x21) (x7 x22))))))
                              ((#\9 #\8 #\7 #\6 #\5 #\4 #\3 #\2 #\1 #\0)
                               (begin
                                 (stream_junk_216@stream x20)
                                 (let ((x22 x20))
                                   (begin
                                     (reset_buffer_23@genlex #f)
                                     (begin (store_147@genlex x21) (x9 x22))))))
                              ((#\`)
                               (begin
                                 (stream_junk_216@stream x20)
                                 (let ((x22 (2-203-parser_require_204@stream
                                              x14
                                              x20)))
                                   (let ((x23 (stream_require_148@stream x20)))
                                     (labels
                                       ((staticfail1005
                                          ()
                                          (caml-raise 'Parse_error_2@stream)))
                                       (let ((g1030 x23))
                                         (cond ((char=? g1030 #\`)
                                                (begin
                                                  (stream_junk_216@stream x20)
                                                  (caml-make-regular-1
                                                    #<0006>
                                                    x22)))
                                               (else (staticfail1005)))))))))
                              ((#\")
                               (begin
                                 (stream_junk_216@stream x20)
                                 (let ((x22 x20))
                                   (begin
                                     (reset_buffer_23@genlex #f)
                                     (caml-make-regular-1 #a000 (x13 x22))))))
                              ((#\-)
                               (begin
                                 (stream_junk_216@stream x20)
                                 (let ((x22 x20)) (x8 x22))))
                              ((#\()
                               (begin
                                 (stream_junk_216@stream x20)
                                 (let ((x22 x20)) (x16 x22))))
                              (else (staticfail1004)))))))
                 (x6 (lambda (x20)
                        (bind-exit
                          (staticexit1007)
                          (labels
                            ((staticfail1006
                               ()
                               (staticexit1007
                                 (begin (x3 (get_string_221@genlex #f))))))
                            (let ((x21 (with-handler
                                         (lambda (x21)
                                            (if (eq? (tag-of x21) 10)
                                              (staticfail1006)
                                              (caml-raise x21)))
                                         (unwind-protect
                                           (begin
                                             (push-exception-handler)
                                             (stream_peek_92@stream x20))
                                           (pop-exception-handler)))))
                              (case x21
                                ((#\'
                                  #\_
                                  #\9
                                  #\8
                                  #\7
                                  #\6
                                  #\5
                                  #\4
                                  #\3
                                  #\2
                                  #\1
                                  #\0
                                  #a255
                                  #a254
                                  #a253
                                  #a252
                                  #a251
                                  #a250
                                  #a249
                                  #a248
                                  #a247
                                  #a246
                                  #a245
                                  #a244
                                  #a243
                                  #a242
                                  #a241
                                  #a240
                                  #a239
                                  #a238
                                  #a237
                                  #a236
                                  #a235
                                  #a234
                                  #a233
                                  #a232
                                  #a231
                                  #a230
                                  #a229
                                  #a228
                                  #a227
                                  #a226
                                  #a225
                                  #a224
                                  #a223
                                  #a222
                                  #a221
                                  #a220
                                  #a219
                                  #a218
                                  #a217
                                  #a216
                                  #a215
                                  #a214
                                  #a213
                                  #a212
                                  #a211
                                  #a210
                                  #a209
                                  #a208
                                  #a207
                                  #a206
                                  #a205
                                  #a204
                                  #a203
                                  #a202
                                  #a201
                                  #a200
                                  #a199
                                  #a198
                                  #a197
                                  #a196
                                  #a195
                                  #a194
                                  #a193
                                  #a192
                                  #\z
                                  #\y
                                  #\x
                                  #\w
                                  #\v
                                  #\u
                                  #\t
                                  #\s
                                  #\r
                                  #\q
                                  #\p
                                  #\o
                                  #\n
                                  #\m
                                  #\l
                                  #\k
                                  #\j
                                  #\i
                                  #\h
                                  #\g
                                  #\f
                                  #\e
                                  #\d
                                  #\c
                                  #\b
                                  #\a
                                  #\Z
                                  #\Y
                                  #\X
                                  #\W
                                  #\V
                                  #\U
                                  #\T
                                  #\S
                                  #\R
                                  #\Q
                                  #\P
                                  #\O
                                  #\N
                                  #\M
                                  #\L
                                  #\K
                                  #\J
                                  #\I
                                  #\H
                                  #\G
                                  #\F
                                  #\E
                                  #\D
                                  #\C
                                  #\B
                                  #\A)
                                 (begin
                                   (stream_junk_216@stream x20)
                                   (let ((x22 x20))
                                     (begin (store_147@genlex x21) (x6 x22)))))
                                (else (staticfail1006))))))))
                 (x7 (lambda (x20)
                        (bind-exit
                          (staticexit1009)
                          (labels
                            ((staticfail1008
                               ()
                               (staticexit1009
                                 (begin (x3 (get_string_221@genlex #f))))))
                            (let ((x21 (with-handler
                                         (lambda (x21)
                                            (if (eq? (tag-of x21) 10)
                                              (staticfail1008)
                                              (caml-raise x21)))
                                         (unwind-protect
                                           (begin
                                             (push-exception-handler)
                                             (stream_peek_92@stream x20))
                                           (pop-exception-handler)))))
                              (case x21
                                ((#\*
                                  #\|
                                  #\^
                                  #\~
                                  #\\
                                  #\@
                                  #\?
                                  #\>
                                  #\=
                                  #\<
                                  #\:
                                  #\/
                                  #\-
                                  #\+
                                  #\#
                                  #\$
                                  #\&
                                  #\%
                                  #\!)
                                 (begin
                                   (stream_junk_216@stream x20)
                                   (let ((x22 x20))
                                     (begin (store_147@genlex x21) (x7 x22)))))
                                (else (staticfail1008))))))))
                 (x8 (lambda (x20)
                        (bind-exit
                          (staticexit1011)
                          (labels
                            ((staticfail1010
                               ()
                               (staticexit1011 (begin (x4 #\-)))))
                            (let ((x21 (with-handler
                                         (lambda (x21)
                                            (if (eq? (tag-of x21) 10)
                                              (staticfail1010)
                                              (caml-raise x21)))
                                         (unwind-protect
                                           (begin
                                             (push-exception-handler)
                                             (stream_peek_92@stream x20))
                                           (pop-exception-handler)))))
                              (case x21
                                ((#\9 #\8 #\7 #\6 #\5 #\4 #\3 #\2 #\1 #\0)
                                 (begin
                                   (stream_junk_216@stream x20)
                                   (let ((x22 x20))
                                     (begin
                                       (reset_buffer_23@genlex #f)
                                       (begin
                                         (store_147@genlex #\-)
                                         (begin
                                           (store_147@genlex x21)
                                           (x9 x22)))))))
                                (else (staticfail1010))))))))
                 (x9 (lambda (x20)
                        (bind-exit
                          (staticexit1013)
                          (labels
                            ((staticfail1012
                               ()
                               (staticexit1013
                                 (begin
                                   (caml-make-regular-1
                                     #unspecified
                                     (int_of_string
                                       (get_string_221@genlex #f)))))))
                            (let ((x21 (with-handler
                                         (lambda (x21)
                                            (if (eq? (tag-of x21) 10)
                                              (staticfail1012)
                                              (caml-raise x21)))
                                         (unwind-protect
                                           (begin
                                             (push-exception-handler)
                                             (stream_peek_92@stream x20))
                                           (pop-exception-handler)))))
                              (case x21
                                ((#\9 #\8 #\7 #\6 #\5 #\4 #\3 #\2 #\1 #\0)
                                 (begin
                                   (stream_junk_216@stream x20)
                                   (let ((x22 x20))
                                     (begin (store_147@genlex x21) (x9 x22)))))
                                ((#\.)
                                 (begin
                                   (stream_junk_216@stream x20)
                                   (let ((x22 x20))
                                     (begin (store_147@genlex #\.) (x10 x22)))))
                                ((#\E #\e)
                                 (begin
                                   (stream_junk_216@stream x20)
                                   (let ((x22 x20))
                                     (begin (store_147@genlex #\E) (x11 x22)))))
                                (else (staticfail1012))))))))
                 (x10 (lambda (x20)
                         (bind-exit
                           (staticexit1015)
                           (labels
                             ((staticfail1014
                                ()
                                (staticexit1015
                                  (begin
                                    (caml-make-regular-1
                                      #u0000
                                      (float_of_string
                                        (get_string_221@genlex #f)))))))
                             (let ((x21 (with-handler
                                          (lambda (x21)
                                             (if (eq? (tag-of x21) 10)
                                               (staticfail1014)
                                               (caml-raise x21)))
                                          (unwind-protect
                                            (begin
                                              (push-exception-handler)
                                              (stream_peek_92@stream x20))
                                            (pop-exception-handler)))))
                               (case x21
                                 ((#\9 #\8 #\7 #\6 #\5 #\4 #\3 #\2 #\1 #\0)
                                  (begin
                                    (stream_junk_216@stream x20)
                                    (let ((x22 x20))
                                      (begin
                                        (store_147@genlex x21)
                                        (x10 x22)))))
                                 ((#\E #\e)
                                  (begin
                                    (stream_junk_216@stream x20)
                                    (let ((x22 x20))
                                      (begin
                                        (store_147@genlex #\E)
                                        (x11 x22)))))
                                 (else (staticfail1014))))))))
                 (x11 (lambda (x20)
                         (bind-exit
                           (staticexit1017)
                           (labels
                             ((staticfail1016
                                ()
                                (staticexit1017
                                  (begin (let ((x22 x20)) (x12 x22))))))
                             (let ((x21 (with-handler
                                          (lambda (x21)
                                             (if (eq? (tag-of x21) 10)
                                               (staticfail1016)
                                               (caml-raise x21)))
                                          (unwind-protect
                                            (begin
                                              (push-exception-handler)
                                              (stream_peek_92@stream x20))
                                            (pop-exception-handler)))))
                               (let ((g1031 x21))
                                 (cond ((or (char=? g1031 #\-)
                                            (char=? g1031 #\+))
                                        (begin
                                          (stream_junk_216@stream x20)
                                          (let ((x22 x20))
                                            (begin
                                              (store_147@genlex x21)
                                              (x12 x22)))))
                                       (else (staticfail1016)))))))))
                 (x12 (lambda (x20)
                         (bind-exit
                           (staticexit1019)
                           (labels
                             ((staticfail1018
                                ()
                                (staticexit1019
                                  (begin
                                    (caml-make-regular-1
                                      #u0000
                                      (float_of_string
                                        (get_string_221@genlex #f)))))))
                             (let ((x21 (with-handler
                                          (lambda (x21)
                                             (if (eq? (tag-of x21) 10)
                                               (staticfail1018)
                                               (caml-raise x21)))
                                          (unwind-protect
                                            (begin
                                              (push-exception-handler)
                                              (stream_peek_92@stream x20))
                                            (pop-exception-handler)))))
                               (case x21
                                 ((#\9 #\8 #\7 #\6 #\5 #\4 #\3 #\2 #\1 #\0)
                                  (begin
                                    (stream_junk_216@stream x20)
                                    (let ((x22 x20))
                                      (begin
                                        (store_147@genlex x21)
                                        (x12 x22)))))
                                 (else (staticfail1018))))))))
                 (x13 (lambda (x20)
                         (let ((x21 (stream_peek_92@stream x20)))
                           (labels
                             ((staticfail1020
                                ()
                                (begin
                                  (stream_junk_216@stream x20)
                                  (let ((x22 x20))
                                    (begin (store_147@genlex x21) (x13 x22))))))
                             (let ((g1032 x21))
                               (cond ((char=? g1032 #\")
                                      (begin
                                        (stream_junk_216@stream x20)
                                        (get_string_221@genlex #f)))
                                     ((char=? g1032 #\\)
                                      (begin
                                        (stream_junk_216@stream x20)
                                        (let ((x22 (2-203-parser_require_204@stream
                                                     x15
                                                     x20)))
                                          (let ((x23 x20))
                                            (begin
                                              (store_147@genlex x22)
                                              (x13 x23))))))
                                     (else (staticfail1020))))))))
                 (x14 (lambda (x20)
                         (let ((x21 (stream_peek_92@stream x20)))
                           (labels
                             ((staticfail1021
                                ()
                                (begin (stream_junk_216@stream x20) x21)))
                             (let ((g1033 x21))
                               (cond ((char=? g1033 #\\)
                                      (begin
                                        (stream_junk_216@stream x20)
                                        (let ((x22 (2-203-parser_require_204@stream
                                                     x15
                                                     x20)))
                                          x22)))
                                     (else (staticfail1021))))))))
                 (x15 (lambda (x20)
                         (let ((x21 (stream_peek_92@stream x20)))
                           (labels
                             ((staticfail1022
                                ()
                                (begin (stream_junk_216@stream x20) x21)))
                             (case x21
                               ((#\n)
                                (begin (stream_junk_216@stream x20) #\newline))
                               ((#\r)
                                (begin (stream_junk_216@stream x20) #\return))
                               ((#\t)
                                (begin (stream_junk_216@stream x20) #\tab))
                               ((#\9 #\8 #\7 #\6 #\5 #\4 #\3 #\2 #\1 #\0)
                                (begin
                                  (stream_junk_216@stream x20)
                                  (let ((x22 (stream_require_148@stream x20)))
                                    (labels
                                      ((staticfail1023
                                         ()
                                         (caml-raise 'Parse_error_2@stream)))
                                      (case x22
                                        ((#\9
                                          #\8
                                          #\7
                                          #\6
                                          #\5
                                          #\4
                                          #\3
                                          #\2
                                          #\1
                                          #\0)
                                         (begin
                                           (stream_junk_216@stream x20)
                                           (let ((x23 (stream_require_148@stream
                                                        x20)))
                                             (labels
                                               ((staticfail1024
                                                  ()
                                                  (caml-raise
                                                    'Parse_error_2@stream)))
                                               (case x23
                                                 ((#\9
                                                   #\8
                                                   #\7
                                                   #\6
                                                   #\5
                                                   #\4
                                                   #\3
                                                   #\2
                                                   #\1
                                                   #\0)
                                                  (begin
                                                    (stream_junk_216@stream x20)
                                                    (char_of_int
                                                      (+fx (+fx (*fx (-fx (int_of_char
                                                                            x21)
                                                                          48)
                                                                     100)
                                                                (*fx (-fx (int_of_char
                                                                            x22)
                                                                          48)
                                                                     10))
                                                           (int_of_char x23)))))
                                                 (else (staticfail1024)))))))
                                        (else (staticfail1023)))))))
                               (else (staticfail1022)))))))
                 (x16 (lambda (x20)
                         (bind-exit
                           (staticexit1026)
                           (labels
                             ((staticfail1025
                                ()
                                (staticexit1026 (begin (x4 #\()))))
                             (let ((x21 (with-handler
                                          (lambda (x21)
                                             (if (eq? (tag-of x21) 10)
                                               (staticfail1025)
                                               (caml-raise x21)))
                                          (unwind-protect
                                            (begin
                                              (push-exception-handler)
                                              (stream_peek_92@stream x20))
                                            (pop-exception-handler)))))
                               (let ((g1034 x21))
                                 (cond ((char=? g1034 #\*)
                                        (begin
                                          (stream_junk_216@stream x20)
                                          (let ((x22 x20))
                                            (begin (x17 x22) (x5 x22)))))
                                       (else (staticfail1025)))))))))
                 (x17 (lambda (x20)
                         (let ((x21 (stream_peek_92@stream x20)))
                           (labels
                             ((staticfail1027
                                ()
                                (begin
                                  (stream_junk_216@stream x20)
                                  (let ((x22 x20)) (x17 x22)))))
                             (let ((g1035 x21))
                               (cond ((char=? g1035 #\()
                                      (begin
                                        (stream_junk_216@stream x20)
                                        (let ((x22 x20)) (x18 x22))))
                                     ((char=? g1035 #\*)
                                      (begin
                                        (stream_junk_216@stream x20)
                                        (let ((x22 x20)) (x19 x22))))
                                     (else (staticfail1027))))))))
                 (x18 (lambda (x20)
                         (let ((x21 (stream_peek_92@stream x20)))
                           (labels
                             ((staticfail1028
                                ()
                                (begin
                                  (stream_junk_216@stream x20)
                                  (let ((x22 x20)) (x17 x22)))))
                             (let ((g1036 x21))
                               (cond ((char=? g1036 #\*)
                                      (begin
                                        (stream_junk_216@stream x20)
                                        (let ((x22 x20))
                                          (begin (x17 x22) (x17 x22)))))
                                     (else (staticfail1028))))))))
                 (x19 (lambda (x20)
                         (let ((x21 (stream_peek_92@stream x20)))
                           (labels
                             ((staticfail1029
                                ()
                                (begin
                                  (stream_junk_216@stream x20)
                                  (let ((x22 x20)) (x17 x22)))))
                             (let ((g1037 x21))
                               (cond ((char=? g1037 #\))
                                      (begin (stream_junk_216@stream x20) #f))
                                     (else (staticfail1029)))))))))
          (lambda (x20)
             (stream_from_102@stream (lambda (x21) (x5 x20)))))))))


