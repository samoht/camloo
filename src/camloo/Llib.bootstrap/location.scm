;; Le module 
(module
  __caml_location
  (library camloo-runtime)
  (import __caml_config __caml_misc)
  (export
    input_name_202@location
    input_chan_27@location
    input_lexbuf_35@location
    no_location_97@location
    (get_current_location_179@location x1)
    (prerr_lines_83@location x1)
    (5-192-prerr_lines_83@location x1 x2 x3 x4 x5)
    (prerr_loc_115@location x1)
    (4-111-prerr_loc_115@location x1 x2 x3 x4)
    (prerr_location_1@location x1)
    (prerr_input_name_16@location x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define input_name_202@location (make-cell ""))
  (begin
    (define input_chan_27@location
      (make-cell std_in_43@io))
   (define input_lexbuf_35@location (make-cell 0))))

(define no_location_97@location '#(0 0 #f))

(define (get_current_location_179@location x1)
  (caml-make-regular-2
    #f
    (symbol_start_182@parsing #f)
    (symbol_end_28@parsing #f)))


(begin
  (define (prerr_lines_83@location x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4)
             (lambda (x5)
                (5-192-prerr_lines_83@location x1 x2 x3 x4 x5))))))
 (define (5-192-prerr_lines_83@location x1 x2 x3 x4 x5)
    (begin
      (prerr_string_235@io ", line ")
      (begin
        (prerr_int_158@io x4)
        (begin
          (if ((lambda (x y) (not (eq? x y))) x5 x4)
            (begin
              (prerr_string_235@io "-")
              (prerr_int_158@io x5))
            #f)
          (begin
            (prerr_string_235@io ", characters ")
            (begin
              (prerr_int_158@io (-fx x1 x3))
              (begin
                (prerr_string_235@io "-")
                (begin
                  (prerr_int_158@io (-fx x2 x3))
                  (prerr_string_235@io ":")))))))))
)

(begin
  (define (prerr_loc_115@location x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4)
             (4-111-prerr_loc_115@location x1 x2 x3 x4)))))
 (define (4-111-prerr_loc_115@location x1 x2 x3 x4)
    (let ((x5 (lambda (x5)
                 (lambda (x6)
                    (let ((stop1001 x5))
                      (let for1000 ((i7 1))
                        (if (<=fx i7 stop1001)
                          (begin
                            (prerr_char_240@io x6)
                            (for1000 (+fx i7 1)))
                          (unspecified)))))))
          (x6 (lambda (x6)
                 (with-handler
                   (lambda (x7)
                      (labels
                        ((staticfail1003 () (caml-raise x7)))
                        (case (caml-extensible-constr-tag x7)
                          ((End_of_file_1@io) #f)
                          (else (staticfail1003)))))
                   (unwind-protect
                     (begin
                       (push-exception-handler)
                       (let g1024 ()
                         (if ((lambda (x y) (not (eq? x y)))
                              (x1 #f)
                              #\newline)
                           (begin #f (g1024))
                           '())))
                     (pop-exception-handler)))))
          (x7 (lambda (x7)
                 (let ((x8 #\space))
                   (begin
                     (with-handler
                       (lambda (x9)
                          (labels
                            ((staticfail1005 () (caml-raise x9)))
                            (case (caml-extensible-constr-tag x9)
                              ((End_of_file_1@io)
                               (prerr_string_235@io "<EOF>"))
                              (else (staticfail1005)))))
                       (unwind-protect
                         (begin
                           (push-exception-handler)
                           (let g1025 ()
                             (if (begin
                                   (set! x8 (x1 #f))
                                   ((lambda (x y) (not (eq? x y)))
                                    x8
                                    #\newline))
                               (begin (prerr_char_240@io x8) (g1025))
                               '())))
                         (pop-exception-handler)))
                     (prerr_endline_232@io "")))))
          (x8 (lambda (x8)
                 (lambda (x9)
                    (lambda (x10)
                       (let ((x11 #\space) (x12 x8) (x13 x9))
                         (with-handler
                           (lambda (x14)
                              (labels
                                ((staticfail1007 () (caml-raise x14)))
                                (case (caml-extensible-constr-tag x14)
                                  ((End_of_file_1@io)
                                   (prerr_string_235@io
                                     ((make_string_7@string 5) x10)))
                                  (else (staticfail1007)))))
                           (unwind-protect
                             (begin
                               (push-exception-handler)
                               (let g1026 ()
                                 (if (begin
                                       (set! x11 (x1 #f))
                                       ((lambda (x y) (not (eq? x y)))
                                        x11
                                        #\newline))
                                   (begin
                                     (if (>fx x12 0)
                                       (begin
                                         (set! x12 (-fx x12 1))
                                         (if (eq? x11 #\tab)
                                           (prerr_char_240@io x11)
                                           (prerr_char_240@io #\space)))
                                       (if (>fx x13 0)
                                         (begin
                                           (set! x13 (-fx x13 1))
                                           (if (eq? x11 #\tab)
                                             (prerr_char_240@io x11)
                                             (prerr_char_240@io x10)))
                                         #f))
                                     (g1026))
                                   '())))
                             (pop-exception-handler)))))))))
      (let ((x9 0) (x10 1) (x11 0) (x12 1) (x13 0))
        (begin
          (x2 0)
          (begin
            (with-handler
              (lambda (x14)
                 (labels
                   ((staticfail1009 () (caml-raise x14)))
                   (case (caml-extensible-constr-tag x14)
                     ((End_of_file_1@io) #f)
                     (else (staticfail1009)))))
              (unwind-protect
                (begin
                  (push-exception-handler)
                  (let g1027 ()
                    (if (<fx x9 (caml-constr-get-field x4 0))
                      (begin
                        (begin
                          (set! x9 (+fx x9 1))
                          (if (eq? (x1 #f) #\newline)
                            (begin
                              (set! x10 (+fx x10 1))
                              (begin (set! x11 x9) #f))
                            #f))
                        (g1027))
                      '())))
                (pop-exception-handler)))
            (begin
              (set! x12 x10)
              (begin
                (set! x13 x11)
                (begin
                  (with-handler
                    (lambda (x14)
                       (labels
                         ((staticfail1011 () (caml-raise x14)))
                         (case (caml-extensible-constr-tag x14)
                           ((End_of_file_1@io) #f)
                           (else (staticfail1011)))))
                    (unwind-protect
                      (begin
                        (push-exception-handler)
                        (let g1028 ()
                          (if (<fx x9 (caml-constr-get-field x4 1))
                            (begin
                              (begin
                                (set! x9 (+fx x9 1))
                                (if (eq? (x1 #f) #\newline)
                                  (begin
                                    (set! x12 (+fx x12 1))
                                    (begin (set! x13 x9) #f))
                                  #f))
                              (g1028))
                            '())))
                      (pop-exception-handler)))
                  (begin
                    (if x3
                      (5-192-prerr_lines_83@location
                        (caml-constr-get-field x4 0)
                        (caml-constr-get-field x4 1)
                        x11
                        x10
                        x12)
                      #f)
                    (begin
                      (prerr_endline_232@io "")
                      (if (eq? x10 x12)
                        (begin
                          (x2 x11)
                          (begin
                            (prerr_begline_213@misc "")
                            (begin
                              (x7 #f)
                              (begin
                                (x2 x11)
                                (begin
                                  (prerr_begline_213@misc "")
                                  (begin
                                    (((x8 (-fx (caml-constr-get-field x4 0)
                                               x11))
                                      (-fx (caml-constr-get-field x4 1)
                                           (caml-constr-get-field x4 0)))
                                     #\^)
                                    (prerr_endline_232@io "")))))))
                        (begin
                          (x2 x11)
                          (begin
                            (prerr_begline_213@misc "")
                            (begin
                              (((x8 0) (-fx (caml-constr-get-field x4 0) x11))
                               #\.)
                              (begin
                                (x2 (caml-constr-get-field x4 0))
                                (begin
                                  (x7 #f)
                                  (begin
                                    (if (<=fx (-fx x12 x10) 8)
                                      (let ((stop1013 (-fx x12 1)))
                                        (let for1012 ((i14 (+fx x10 1)))
                                          (if (<=fx i14 stop1013)
                                            (begin
                                              (begin
                                                (prerr_begline_213@misc "")
                                                (x7 #f))
                                              (for1012 (+fx i14 1)))
                                            (unspecified))))
                                      (begin
                                        (let ((stop1015 (+fx x10 3)))
                                          (let for1014 ((i14 (+fx x10 1)))
                                            (if (<=fx i14 stop1015)
                                              (begin
                                                (begin
                                                  (prerr_begline_213@misc "")
                                                  (x7 #f))
                                                (for1014 (+fx i14 1)))
                                              (unspecified))))
                                        (begin
                                          (prerr_begline_213@misc "..........")
                                          (begin
                                            (prerr_endline_232@io "")
                                            (begin
                                              (let ((stop1017 (-fx x12 4)))
                                                (let for1016 ((i14 (+fx x10 4)))
                                                  (if (<=fx i14 stop1017)
                                                    (begin
                                                      (x6 #f)
                                                      (for1016 (+fx i14 1)))
                                                    (unspecified))))
                                              (let ((stop1019 (-fx x12 1)))
                                                (let for1018 ((i14 (-fx x12 3)))
                                                  (if (<=fx i14 stop1019)
                                                    (begin
                                                      (begin
                                                        (prerr_begline_213@misc
                                                          "")
                                                        (x7 #f))
                                                      (for1018 (+fx i14 1)))
                                                    (unspecified)))))))))
                                    (begin
                                      (prerr_begline_213@misc "")
                                      (begin
                                        (with-handler
                                          (lambda (x14)
                                             (labels
                                               ((staticfail1023
                                                  ()
                                                  (caml-raise x14)))
                                               (case (caml-extensible-constr-tag
                                                       x14)
                                                 ((End_of_file_1@io)
                                                  (prerr_string_235@io "<EOF>"))
                                                 (else (staticfail1023)))))
                                          (unwind-protect
                                            (begin
                                              (push-exception-handler)
                                              (begin
                                                (let ((stop1021
                                                        (-fx (caml-constr-get-field
                                                               x4
                                                               1)
                                                             1)))
                                                  (let for1020 ((i14 x13))
                                                    (if (<=fx i14 stop1021)
                                                      (begin
                                                        (prerr_char_240@io
                                                          (x1 #f))
                                                        (for1020 (+fx i14 1)))
                                                      (unspecified))))
                                                (((x8 0) 100) #\.)))
                                            (pop-exception-handler)))
                                        (prerr_endline_232@io
                                          ""))))))))))))))))))))
)

(define (prerr_location_1@location x1)
  (if (>fx (string-length
             (cell-ref input_name_202@location))
           0)
    (let ((x2 (pos_in (cell-ref input_chan_27@location))))
      (begin
        (prerr_string_235@io "File \"")
        (begin
          (prerr_string_235@io
            (cell-ref input_name_202@location))
          (begin
            (prerr_string_235@io "\"")
            (begin
              (4-111-prerr_loc_115@location
                (lambda (x3)
                   (input_char (cell-ref input_chan_27@location)))
                ((lambda (x3) (lambda (x4) (seek_in x3 x4)))
                 (cell-ref input_chan_27@location))
                #t
                x1)
              (seek_in (cell-ref input_chan_27@location) x2))))))
    (begin
      (prerr_begline_213@misc " Toplevel input:")
      (let ((x2 0))
        (let ((x3 (lambda (x3)
                     (let ((x4 (if (>=fx x2 2048)
                                 (caml-raise 'End_of_file_1@io)
                                 (if (>=fx x2 0)
                                   ((nth_char_166@string
                                      (caml-constr-get-field
                                        (cell-ref input_lexbuf_35@location)
                                        1))
                                    x2)
                                   #\.))))
                       (begin (set! x2 (+fx x2 1)) x4))))
              (x4 (lambda (x4)
                     (set! x2
                       (-fx x4
                            (caml-constr-get-field
                              (cell-ref input_lexbuf_35@location)
                              2))))))
          (4-111-prerr_loc_115@location x3 x4 #f x1))))))


(define (prerr_input_name_16@location x1)
  (begin
    (prerr_string_235@io "File \"")
    (begin
      (prerr_string_235@io
        (cell-ref input_name_202@location))
      (prerr_endline_232@io "\", line 1:"))))


