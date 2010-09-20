;; Le module 
(module
  __caml_reloc
  (library camloo-runtime)
  (import __caml_const __caml_buffcode)
  (export
    reloc_info_209@reloc
    (reset_204@reloc x1)
    (enter_218@reloc x1)
    (slot_for_literal_145@reloc x1)
    (slot_for_get_global_124@reloc x1)
    (slot_for_set_global_49@reloc x1)
    (slot_for_tag_19@reloc x1)
    (2-254-slot_for_tag_19@reloc x1 x2)
    (slot_for_c_prim_55@reloc x1)
    (get_info_0@reloc x1)))

;; L'initialisation du module
(init_camloo!)

;; Les variables globales 

;; Les expressions globales 
(define reloc_info_209@reloc (make-cell '()))

(define (reset_204@reloc x1)
  (cell-set! reloc_info_209@reloc '()))


(define (enter_218@reloc x1)
  (cell-set!
    reloc_info_209@reloc
    (cons (caml-make-regular-2
            #f
            x1
            (cell-ref out_position_239@buffcode))
          (cell-ref reloc_info_209@reloc))))


(begin
  (define (slot_for_literal_145@reloc x1)
    (begin
      (enter_218@reloc (caml-make-regular-1 #f x1))
      (out_short_156@buffcode 0)))
 (begin
    (define (slot_for_get_global_124@reloc x1)
      (begin
        (enter_218@reloc (caml-make-regular-1 #t x1))
        (out_short_156@buffcode 0)))
   (begin
      (define (slot_for_set_global_49@reloc x1)
        (begin
          (enter_218@reloc
            (caml-make-regular-1 #unspecified x1))
          (out_short_156@buffcode 0)))
     (begin
        (begin
          (define (slot_for_tag_19@reloc x1)
            (lambda (x2) (2-254-slot_for_tag_19@reloc x1 x2)))
         (define (2-254-slot_for_tag_19@reloc x1 x2)
            (begin
              (enter_218@reloc
                (caml-make-regular-2 #u0000 x1 x2))
              (out_60@buffcode 0)))
)      (define (slot_for_c_prim_55@reloc x1)
          (begin
            (enter_218@reloc (caml-make-regular-1 #a000 x1))
            (out_short_156@buffcode 0)))
))))

(define (get_info_0@reloc x1)
  (let ((x2 (cell-ref reloc_info_209@reloc)))
    (begin
      (cell-set! reloc_info_209@reloc '())
      (rev_210@list x2))))


