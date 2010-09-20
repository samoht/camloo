;; Le module 
(module
  __caml_vect
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
    __caml_string
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
    (inline make_vect_185@vect x1)
    (inline 2-70-make_vect_185@vect x1 x2)
    (inline make_matrix_88@vect x1)
    (inline 3-223-make_matrix_88@vect x1 x2 x3)
    (inline vect_item_124@vect x1)
    (inline 2-194-vect_item_124@vect x1 x2)
    (inline vect_assign_169@vect x1)
    (inline 3-189-vect_assign_169@vect x1 x2 x3)
    (inline fill_vect_126@vect x1)
    (inline 4-32-fill_vect_126@vect x1 x2 x3 x4)
    (inline blit_vect_203@vect x1)
    (inline 5-65-blit_vect_203@vect x1 x2 x3 x4 x5)
    concat_vect_32@vect
    (inline sub_vect_160@vect x1)
    (inline 3-41-sub_vect_160@vect x1 x2 x3)
    copy_vect_177@vect
    list_of_vect_3@vect
    vect_of_list_150@vect
    do_vect_153@vect
    map_vect_149@vect
    map_vect_list_65@vect))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(begin
  (define-inline (make_vect_185@vect x1)
    (lambda (x2) (2-70-make_vect_185@vect x1 x2)))
 (define-inline (2-70-make_vect_185@vect x1 x2)
    (if (or (<fx x1 0) (>=fx x1 4194304))
      (invalid_arg_209@exc "make_vect")
      (make-vector x1 x2)))
)

(begin
  (define-inline (make_matrix_88@vect x1)
    (lambda (x2)
       (lambda (x3)
          (3-223-make_matrix_88@vect x1 x2 x3))))
 (define-inline (3-223-make_matrix_88@vect x1 x2 x3)
    (if (or (<fx x1 0)
            (or (>=fx x1 4194304)
                (or (<fx x2 0) (>=fx x2 4194304))))
      (invalid_arg_209@exc "make_matrix")
      (3-21-make_matrix_88@fvect x1 x2 x3)))
)

(begin
  (define-inline (vect_item_124@vect x1)
    (lambda (x2) (2-194-vect_item_124@vect x1 x2)))
 (define-inline (2-194-vect_item_124@vect x1 x2)
    (if (or (<fx x2 0)
            (>=fx x2
                  (let ((g1000 x1))
                    (if g1000 (vector-length g1000) 0))))
      (invalid_arg_209@exc "vect_item")
      (vector-ref x1 x2)))
)

(begin
  (define-inline (vect_assign_169@vect x1)
    (lambda (x2)
       (lambda (x3)
          (3-189-vect_assign_169@vect x1 x2 x3))))
 (define-inline (3-189-vect_assign_169@vect x1 x2 x3)
    (if (or (<fx x2 0)
            (>=fx x2
                  (let ((g1001 x1))
                    (if g1001 (vector-length g1001) 0))))
      (invalid_arg_209@exc "vect_assign")
      (vector-set! x1 x2 x3)))
)

(begin
  (define-inline (fill_vect_126@vect x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4)
             (4-32-fill_vect_126@vect x1 x2 x3 x4)))))
 (define-inline (4-32-fill_vect_126@vect x1 x2 x3 x4)
    (if (or (<fx x2 0)
            (or (<fx x3 0)
                (>fx (+fx x2 x3)
                     (let ((g1002 x1))
                       (if g1002 (vector-length g1002) 0)))))
      (invalid_arg_209@exc "fill_vect")
      (4-206-fill_vect_126@fvect x1 x2 x3 x4)))
)

(begin
  (define-inline (blit_vect_203@vect x1)
    (lambda (x2)
       (lambda (x3)
          (lambda (x4)
             (lambda (x5)
                (5-65-blit_vect_203@vect x1 x2 x3 x4 x5))))))
 (define-inline (5-65-blit_vect_203@vect x1 x2 x3 x4 x5)
    (if (or (<fx x2 0)
            (or (>fx (+fx x2 x5)
                     (let ((g1003 x1))
                       (if g1003 (vector-length g1003) 0)))
                (or (<fx x4 0)
                    (or (>fx (+fx x4 x5)
                             (let ((g1004 x3))
                               (if g1004 (vector-length g1004) 0)))
                        (<fx x5 0)))))
      (invalid_arg_209@exc "blit_vect")
      (5-48-blit_vect_203@fvect x1 x2 x3 x4 x5)))
)

(define concat_vect_32@vect concat_vect_32@fvect)

(begin
  (define-inline (sub_vect_160@vect x1)
    (lambda (x2)
       (lambda (x3) (3-41-sub_vect_160@vect x1 x2 x3))))
 (define-inline (3-41-sub_vect_160@vect x1 x2 x3)
    (if (or (<fx x2 0)
            (or (<fx x3 0)
                (>fx (+fx x2 x3)
                     (let ((g1005 x1))
                       (if g1005 (vector-length g1005) 0)))))
      (invalid_arg_209@exc "sub_vect")
      (3-89-sub_vect_160@fvect x1 x2 x3)))
)

(define copy_vect_177@vect copy_vect_177@fvect)

(begin
  (define list_of_vect_3@vect list_of_vect_3@fvect)
  (define vect_of_list_150@vect
    vect_of_list_150@fvect)
)

(begin
  (define do_vect_153@vect do_vect_153@fvect)
  (begin
    (define map_vect_149@vect map_vect_149@fvect)
    (define map_vect_list_65@vect
      map_vect_list_65@fvect)
))

