;; Le module 
(module
  __caml_string
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
    __caml_stream
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
    (create_string_138@string x1)
    (make_string_7@string x1)
    (2-69-make_string_7@string x1 x2)
    (nth_char_166@string x1)
    (2-143-nth_char_166@string x1 x2)
    (set_nth_char_28@string x1)
    (3-179-set_nth_char_28@string x1 x2 x3)
    (fill_string_42@string x1)
    (4-232-fill_string_42@string x1 x2 x3 x4)
    (blit_string_211@string x1)
    (5-22-blit_string_211@string x1 x2 x3 x4 x5)
    ^_54@string
    (sub_string_61@string x1)
    (3-23-sub_string_61@string x1 x2 x3)
    (replace_string_174@string x1)
    (3-75-replace_string_174@string x1 x2 x3)
    string_for_read_244@string))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define (create_string_138@string x1)
  (if (or (<fx x1 0) (>=fx x1 (bit-lsh 1 28)))
    (invalid_arg_209@exc "create_string")
    (create_string x1)))


(begin
  (define (make_string_7@string x1)
    (lambda (x2) (2-69-make_string_7@string x1 x2)))
 (define (2-69-make_string_7@string x1 x2)
    (if (or (<fx x1 0) (>=fx x1 (bit-lsh 1 28)))
      (invalid_arg_209@exc "make_string")
      (2-208-make_string_7@fstring x1 x2)))
)

(begin
  (define (nth_char_166@string x1)
    (lambda (x2) (2-143-nth_char_166@string x1 x2)))
 (define (2-143-nth_char_166@string x1 x2)
    (if (or (<fx x2 0) (>=fx x2 (string-length x1)))
      (invalid_arg_209@exc "nth_char")
      (string-ref x1 x2)))
)

(begin
  (define (set_nth_char_28@string x1)
    (lambda (x2)
       (lambda (x3)
          (3-179-set_nth_char_28@string x1 x2 x3))))
 (define (3-179-set_nth_char_28@string x1 x2 x3)
    (if (or (<fx x2 0) (>=fx x2 (string-length x1)))
      (invalid_arg_209@exc "set_nth_char")
      (string-set! x1 x2 x3)))
)

(begin
  (define (fill_string_42@string x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4)
             (4-232-fill_string_42@string x1 x2 x3 x4)))))
 (define (4-232-fill_string_42@string x1 x2 x3 x4)
    (if (or (<fx x2 0)
            (or (<fx x3 0)
                (>fx (+fx x2 x3) (string-length x1))))
      (invalid_arg_209@exc "fill_string")
      (fill_string x1 x2 x3 x4)))
)

(begin
  (define (blit_string_211@string x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4)
             (lambda (x5)
                (5-22-blit_string_211@string x1 x2 x3 x4 x5))))))
 (define (5-22-blit_string_211@string x1 x2 x3 x4 x5)
    (if (or (<fx x2 0)
            (or (>fx (+fx x2 x5) (string-length x1))
                (or (<fx x4 0)
                    (or (>fx (+fx x4 x5) (string-length x3))
                        (<fx x5 0)))))
      (invalid_arg_209@exc "blit_string")
      (blit_string x1 x2 x3 x4 x5)))
)

(define ^_54@string ^_54@fstring)

(begin
  (define (sub_string_61@string x1)
    (lambda (x2)
       (lambda (x3)
          (3-23-sub_string_61@string x1 x2 x3))))
 (define (3-23-sub_string_61@string x1 x2 x3)
    (if (or (<fx x2 0)
            (or (<fx x3 0)
                (>fx (+fx x2 x3) (string-length x1))))
      (invalid_arg_209@exc "sub_string")
      (3-22-sub_string_61@fstring x1 x2 x3)))
)

(begin
  (define (replace_string_174@string x1)
    (lambda (x2)
       (lambda (x3)
          (3-75-replace_string_174@string x1 x2 x3))))
 (define (3-75-replace_string_174@string x1 x2 x3)
    (if (or (<fx x3 0)
            (>fx (+fx x3 (string-length x2))
                 (string-length x1)))
      (invalid_arg_209@exc "replace_string")
      (3-137-replace_string_174@fstring x1 x2 x3)))
)

(define string_for_read_244@string
  string_for_read_244@fstring)


