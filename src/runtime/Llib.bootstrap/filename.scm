;; Le module 
(module
  __caml_filename
  (import
    __caml_arg
    __caml_baltree
    __caml_char
    __caml_eq
    __caml_exc
    __caml_fchar
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
    (check_suffix_88@filename x1)
    (2-53-check_suffix_88@filename x1 x2)
    (chop_suffix_96@filename x1)
    (2-39-chop_suffix_96@filename x1 x2)
    current_dir_name_124@filename
    (concat_228@filename x1)
    (2-115-concat_228@filename x1 x2)
    (is_absolute_255@filename x1)
    (slash_pos_240@filename x1)
    (basename_226@filename x1)
    (dirname_229@filename x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define (check_suffix_88@filename x1)
    (lambda (x2)
       (2-53-check_suffix_88@filename x1 x2)))
 (define (2-53-check_suffix_88@filename x1 x2)
    (and (>=fx (string-length x1) (string-length x2))
         (tree_equal
           (3-22-sub_string_61@fstring
             x1
             (-fx (string-length x1) (string-length x2))
             (string-length x2))
           x2)))
)

(begin
  (define (chop_suffix_96@filename x1)
    (lambda (x2)
       (2-39-chop_suffix_96@filename x1 x2)))
 (define (2-39-chop_suffix_96@filename x1 x2)
    (3-22-sub_string_61@fstring
      x1
      0
      (-fx (string-length x1) (string-length x2))))
)

(define current_dir_name_124@filename ".")

(begin
  (define (concat_228@filename x1)
    (lambda (x2) (2-115-concat_228@filename x1 x2)))
 (define (2-115-concat_228@filename x1 x2)
    (let ((x3 (-fx (string-length x1) 1)))
      (if (or (<fx x3 0) (eq? (string-ref x1 x3) #\/))
        (2-69-^_54@fstring x1 x2)
        (2-69-^_54@fstring x1 (2-69-^_54@fstring "/" x2)))))
)

(define (is_absolute_255@filename x1)
  (or (and (>=fx (string-length x1) 1)
           (tree_equal
             (3-22-sub_string_61@fstring x1 0 1)
             "/"))
      (or (and (>=fx (string-length x1) 2)
               (tree_equal
                 (3-22-sub_string_61@fstring x1 0 2)
                 "./"))
          (and (>=fx (string-length x1) 3)
               (tree_equal
                 (3-22-sub_string_61@fstring x1 0 3)
                 "../")))))


(define (slash_pos_240@filename x1)
  (letrec ((x2 (lambda (x3)
                  (if (<fx x3 0)
                    (caml-raise 'Not_found_4@exc)
                    (if (eq? (string-ref x1 x3) #\/)
                      x3
                      (x2 (-fx x3 1)))))))
    (x2 (-fx (string-length x1) 1))))


(define (basename_226@filename x1)
  (with-handler
    (lambda (x2)
       (labels
         ((staticfail1001 () (caml-raise x2)))
         (case (caml-extensible-constr-tag x2)
           ((Not_found_4@exc) x1)
           (else (staticfail1001)))))
    (unwind-protect
      (begin
        (push-exception-handler)
        (let ((x2 (+fx (slash_pos_240@filename x1) 1)))
          (3-22-sub_string_61@fstring
            x1
            x2
            (-fx (string-length x1) x2))))
      (pop-exception-handler))))


(define (dirname_229@filename x1)
  (if (tree_equal x1 "/")
    x1
    (with-handler
      (lambda (x2)
         (labels
           ((staticfail1003 () (caml-raise x2)))
           (case (caml-extensible-constr-tag x2)
             ((Not_found_4@exc) ".")
             (else (staticfail1003)))))
      (unwind-protect
        (begin
          (push-exception-handler)
          (3-22-sub_string_61@fstring
            x1
            0
            (slash_pos_240@filename x1)))
        (pop-exception-handler)))))


