;; Le module 
(module
  __caml_buffcode
  (library camloo-runtime)
  (import __caml_misc __caml_config __caml_opcodes)
  (export
    out_buffer_163@buffcode
    out_position_239@buffcode
    (realloc_out_buffer_139@buffcode x1)
    (init_out_code_133@buffcode x1)
    (out_60@buffcode x1)
    (out_short_156@buffcode x1)
    (out_long_97@buffcode x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define out_buffer_163@buffcode
    (make-cell (create_string_138@string 64)))
 (define out_position_239@buffcode (make-cell 0)))

(define (realloc_out_buffer_139@buffcode x1)
  (let ((x2 (create_string_138@string
              (*fx 2
                   (string-length
                     (cell-ref out_buffer_163@buffcode))))))
    (begin
      (((replace_string_174@string x2)
        (cell-ref out_buffer_163@buffcode))
       0)
      (begin (cell-set! out_buffer_163@buffcode x2) #f))))


(define (init_out_code_133@buffcode x1)
  (begin
    (cell-set! out_position_239@buffcode 0)
    #f))


(define (out_60@buffcode x1)
  (begin
    (if (>=fx (cell-ref out_position_239@buffcode)
              (string-length
                (cell-ref out_buffer_163@buffcode)))
      (realloc_out_buffer_139@buffcode #f)
      #f)
    (begin
      (((set_nth_char_28@string
          (cell-ref out_buffer_163@buffcode))
        (cell-ref out_position_239@buffcode))
       (char_of_int (bit-and x1 255)))
      (cell-set!
        out_position_239@buffcode
        (+fx (cell-ref out_position_239@buffcode) 1)))))


(define (out_short_156@buffcode x1)
  (begin
    (out_60@buffcode x1)
    (out_60@buffcode (bit-rsh x1 8))))


(define (out_long_97@buffcode x1)
  (begin
    (out_60@buffcode x1)
    (begin
      (out_60@buffcode (bit-rsh x1 8))
      (begin
        (out_60@buffcode (bit-rsh x1 16))
        (out_60@buffcode (bit-rsh x1 24))))))


