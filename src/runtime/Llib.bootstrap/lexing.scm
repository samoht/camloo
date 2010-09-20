;; Le module 
(module
  __caml_lexing
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
    lex_aux_buffer_252@lexing
    (lex_refill_236@lexing x1)
    (2-105-lex_refill_236@lexing x1 x2)
    (dummy_action_146@lexing x1)
    (create_lexer_225@lexing x1)
    (create_lexer_channel_186@lexing x1)
    (create_lexer_string_89@lexing x1)
    (get_lexeme_227@lexing x1)
    (get_lexeme_char_170@lexing x1)
    (2-182-get_lexeme_char_170@lexing x1 x2)
    (backtrack_236@lexing x1)
    (get_lexeme_start_200@lexing x1)
    (get_lexeme_end_177@lexing x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define lex_aux_buffer_252@lexing
  (create_string 1024))


(begin
  (define (lex_refill_236@lexing x1)
    (lambda (x2) (2-105-lex_refill_236@lexing x1 x2)))
 (define (2-105-lex_refill_236@lexing x1 x2)
    (let ((x3 ((x1 lex_aux_buffer_252@lexing) 1024)))
      (let ((x4 (if (>fx x3 0)
                  x3
                  (begin
                    (string-set! lex_aux_buffer_252@lexing 0 #a000)
                    1))))
        (begin
          (blit_string
            (caml-constr-get-field x2 1)
            x4
            (caml-constr-get-field x2 1)
            0
            (-fx 2048 x4))
          (begin
            (blit_string
              lex_aux_buffer_252@lexing
              0
              (caml-constr-get-field x2 1)
              (-fx 2048 x4)
              x4)
            (begin
              (caml-constr-set-field!
                x2
                2
                (+fx (caml-constr-get-field x2 2) x4))
              (begin
                (caml-constr-set-field!
                  x2
                  4
                  (-fx (caml-constr-get-field x2 4) x4))
                (begin
                  (caml-constr-set-field!
                    x2
                    3
                    (-fx (caml-constr-get-field x2 3) x4))
                  (begin
                    (caml-constr-set-field!
                      x2
                      5
                      (-fx (caml-constr-get-field x2 5) x4))
                    (if (<fx (caml-constr-get-field x2 3) 0)
                      (failwith_217@exc "lexing: token too long")
                      #f))))))))))
)

(define (dummy_action_146@lexing x1)
  (failwith_217@exc "lexing: empty token"))


(define (create_lexer_225@lexing x1)
  (caml-make-regular
    #f
    7
    (lex_refill_236@lexing x1)
    (create_string 2048)
    -2048
    2048
    2048
    2048
    dummy_action_146@lexing))


(define (create_lexer_channel_186@lexing x1)
  (create_lexer_225@lexing
    (lambda (x2)
       (lambda (x3) (4-66-input_26@io x1 x2 0 x3)))))


(define (create_lexer_string_89@lexing x1)
  (caml-make-regular
    #f
    7
    (lambda (x2)
       (caml-constr-set-field!
         x2
         4
         (-fx (caml-constr-get-field x2 4) 1)))
    (2-69-^_54@fstring x1 "\000")
    0
    0
    0
    0
    dummy_action_146@lexing))


(define (get_lexeme_227@lexing x1)
  (let ((x2 (-fx (caml-constr-get-field x1 4)
                 (caml-constr-get-field x1 3))))
    (let ((x3 (create_string x2)))
      (begin
        (blit_string
          (caml-constr-get-field x1 1)
          (caml-constr-get-field x1 3)
          x3
          0
          x2)
        x3))))


(begin
  (define (get_lexeme_char_170@lexing x1)
    (lambda (x2)
       (2-182-get_lexeme_char_170@lexing x1 x2)))
 (define (2-182-get_lexeme_char_170@lexing x1 x2)
    (string-ref
      (caml-constr-get-field x1 1)
      (+fx (caml-constr-get-field x1 3) x2)))
)

(define (backtrack_236@lexing x1)
  (begin
    (caml-constr-set-field!
      x1
      4
      (caml-constr-get-field x1 5))
    ((caml-constr-get-field x1 6) x1)))


(begin
  (define (get_lexeme_start_200@lexing x1)
    (+fx (caml-constr-get-field x1 2)
         (caml-constr-get-field x1 3)))
 (define (get_lexeme_end_177@lexing x1)
    (+fx (caml-constr-get-field x1 2)
         (caml-constr-get-field x1 4)))
)

