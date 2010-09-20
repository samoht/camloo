;* Copyright (C) 1994-2010 INRIA
;*
;* This program is free software; you can redistribute it and/or modify
;* it under the terms of the GNU General Public License as published by
;* the Free Software Foundation; version 2 of the License.
;*
;* This program is distributed in the hope that it will be useful,
;* but WITHOUT ANY WARRANTY; without even the implied warranty of
;* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;* GNU General Public License for more details.

(module __caml_constr
		(export (caml-make-tag::obj ::long)
				caml-extensible-tag::obj

				;; les allocateurs
				(caml-allocate-regular-constr::obj ::long)

				(caml-make-regular::obj   ::obj ::long . ::obj)
				(caml-make-regular-1::obj ::obj ::obj)
				(caml-make-regular-2::obj ::obj ::obj ::obj)
				(caml-make-regular-3::obj ::obj ::obj ::obj ::obj)
				(caml-make-regular-4::obj ::obj ::obj ::obj ::obj ::obj)

				(caml-make-extensible::obj   ::obj ::long . ::obj)
				(caml-make-extensible-1::obj ::obj ::obj)
				(caml-make-extensible-2::obj ::obj ::obj ::obj)
				(caml-make-extensible-3::obj ::obj ::obj ::obj ::obj)
				(caml-make-extensible-4::obj ::obj ::obj ::obj ::obj ::obj)

				;; les predicats
				(caml-constant-constr?::bool ::obj)
				(caml-regular-constr?::bool ::obj)
				(caml-extensible-constr?::bool ::obj)

				;; les longeurs
				(caml-regular-constr-length::obj ::obj)

				;; les tags
				(caml-constr-tag::obj ::obj)
				(caml-constant-constr-tag::long ::obj)
				(caml-regular-constr-tag::long ::obj)
				(caml-extensible-constr-tag::symbol ::obj)

				;; les acces aux champs
				(caml-constr-get-field::obj ::obj ::long)
				(caml-constr-set-field!::obj ::obj ::long ::obj)

				(caml-constr-update! c1 c2)
				(inline caml-make-static-extensible-1 obj obj)
				(inline caml-make-static-extensible-2 obj obj obj)
				(inline caml-make-static-extensible-3 obj obj obj obj)
				(inline caml-make-static-extensible-4 obj obj obj obj obj)
				*the-static-extensible-1*
				*the-static-extensible-2*
				*the-static-extensible-3*
				*the-static-extensible-4*
				(init-static-extensible!)
				(caml-copy-extensible constr))
   #;(pragma  (caml-make-tag _no_side_effect_ _no_mutation_ _imbricable_)
	    (caml-make-regular-1 _no_mutation_ 
				 _allocater_
				 #(init-stack-regular-1
				   "svector_t( 1 )"
				   sregular-ref
				   fixed-length))
	    (caml-make-regular-2 _no_mutation_ 
				 _allocater_
				 #(init-stack-regular-2
				  "svector_t( 2 )"
				  sregular-ref
				  fixed-length))
	    (caml-make-regular-3 _no_mutation_ 
				 _allocater_
				 #(init-stack-regular-3
				  "svector_t( 3 )"
				  sregular-ref
				  fixed-length))
	    (caml-make-regular-4 _no_mutation_ 
				 _allocater_
				 #(init-stack-regular-4
				  "svector_t( 4 )"
				  sregular-ref
				  fixed-length))
            (caml-constr-set-field! _dont_return_but_ ((2 . 0)))
            (caml-constr-get-field _no_side_effect_ _no_mutation_ _imbricable_
				   _dont_return_)
	    (caml-constant-constr? _no_side_effect_ _imutable_
				   _no_mutation_ _imbricable_
				   _dont_return_)
	    (caml-regular-constr? _no_side_effect_ _imutable_
				  _no_mutation_ _imbricable_)
	    (caml-extensible-constr? _no_side_effect_ _imutable_
				     _no_mutation_ _imbricable_)
	    (caml-constant-constr-tag _no_side_effect_ _imutable_
				      _no_mutation_ _imbricable_)
	    (caml-regular-constr-tag _no_side_effect_ _imutable_
				      _no_mutation_ _imbricable_)
	    (caml-extensible-constr-tag _no_side_effect_ _imutable_
					_no_mutation_ _imbricable_)))

;*---------------------------------------------------------------------*/
;*    caml-constr-update! ...                                          */
;*---------------------------------------------------------------------*/
(define (caml-constr-update! c1 c2)
   (cond
      ((and (vector? c1) (vector? c2))
       (if (>=fx (vector-length c1) (vector-length c2))
		   (let loop ((i (-fx (vector-length c2) 1)))
			 (if (=fx i -1)
				 'done
				 (begin
				   (vector-set! c1 i (vector-ref c2 i))
				   (loop (-fx i 1)))))
		   (error "Illegal vector update" c1 c2)))
      ((and (procedure? c1) (procedure? c2))
       (error "Illegal procedure update" c1 c2))
      ((and (pair? c1) (pair? c2))
       (set-car! c1 (car c2))
       (set-cdr! c1 (cdr c2)))
      ((caml-constant-constr? c2)
	   (vector-set! c1 (-fx (vector-length c1) 1) c2)
	   c1)
	  (else
	   (error "Illegal update" c1 c2))))

;*---------------------------------------------------------------------*/
;*    Les constructeurs extensibles statiques (pre-alloues).           */
;*---------------------------------------------------------------------*/
(define *the-static-extensible-1* (unspecified))
;  '#( #unspecified #unspecified #unspecified ))
(define *the-static-extensible-2*  (unspecified))
;  '#( #unspecified #unspecified #unspecified #unspecified))
(define *the-static-extensible-3* (unspecified))
;  '#( #unspecified #unspecified #unspecified #unspecified #unspecified))
(define *the-static-extensible-4* (unspecified))
;  '#( #unspecified #unspecified #unspecified #unspecified #unspecified #unspecified))

;*---------------------------------------------------------------------*/
;*    init-static-extensible! ...                                      */
;*---------------------------------------------------------------------*/
(define (init-static-extensible!)
  (set! *the-static-extensible-1*
		(caml-make-extensible-1
		 #unspecified
		 #unspecified))
  (set! *the-static-extensible-2*
		(caml-make-extensible-2
		 #unspecified
		 #unspecified
		 #unspecified))
  (set! *the-static-extensible-3*
		(caml-make-extensible-3
		 #unspecified
		 #unspecified
		 #unspecified
		 #unspecified))
  (set! *the-static-extensible-4*
		(caml-make-extensible-4
		 #unspecified
		 #unspecified
		 #unspecified
		 #unspecified
		 #unspecified)))
   
;*---------------------------------------------------------------------*/
;*    caml-make-static-extensible-1 ...                                */
;*---------------------------------------------------------------------*/
(define-inline (caml-make-static-extensible-1 tag val0)
   (begin
      (caml-constr-set-field! *the-static-extensible-1* 0 val0)
      (caml-constr-set-field! *the-static-extensible-1* 1 tag)
      *the-static-extensible-1*))

;*---------------------------------------------------------------------*/
;*    caml-make-static-extensible-2 ...                                */
;*---------------------------------------------------------------------*/
(define-inline (caml-make-static-extensible-2 tag val0 val1)
   (begin
      (caml-constr-set-field! *the-static-extensible-2* 0 val0)
      (caml-constr-set-field! *the-static-extensible-2* 1 val1)
      (caml-constr-set-field! *the-static-extensible-2* 2 tag)
      *the-static-extensible-2*))

;*---------------------------------------------------------------------*/
;*    caml-make-static-extensible-3 ...                                */
;*---------------------------------------------------------------------*/
(define-inline (caml-make-static-extensible-3 tag val0 val1 val2)
   (begin
      (caml-constr-set-field! *the-static-extensible-3* 0 val0)
      (caml-constr-set-field! *the-static-extensible-3* 1 val1)
      (caml-constr-set-field! *the-static-extensible-3* 2 val2)
      (caml-constr-set-field! *the-static-extensible-3* 3 tag)
      *the-static-extensible-3*))

;*---------------------------------------------------------------------*/
;*    caml-make-static-extensible-4 ...                                */
;*---------------------------------------------------------------------*/
(define-inline (caml-make-static-extensible-4 tag val0 val1 val2 val3)
   (begin
      (caml-constr-set-field! *the-static-extensible-4* 0 val0)
      (caml-constr-set-field! *the-static-extensible-4* 1 val1)
      (caml-constr-set-field! *the-static-extensible-4* 2 val2)
      (caml-constr-set-field! *the-static-extensible-4* 3 val3)
      (caml-constr-set-field! *the-static-extensible-4* 4 tag)
      *the-static-extensible-4*))

;*---------------------------------------------------------------------*/
;*    caml-copy-extensible ...                                         */
;*    -------------------------------------------------------------    */
;*    Pour faire cette fonction on est oblige de savoir que            */
;*    les extensibles sont implemante par des vecteurs (ne serait-ce   */
;*    que pour calculer la taille de l'extensible).                    */
;*---------------------------------------------------------------------*/
(define (caml-copy-extensible constr)
  (cond
   ((vector? constr)
	(let* ((size       (vector-length constr))
		   (new-constr (make-vector size)))
	  (let loop ((size (-fx size 1)))
		(if (=fx size -1)
			new-constr
			(begin
			  (vector-set! new-constr size (vector-ref constr size))
			  (loop (-fx size 1)))))))
   ((symbol? constr)
	constr)
   (else
	(error "caml-copy-extensible" "Illegal constructor" constr))))
       
(define (caml-make-tag x)                (integer->cnst (+fx x 1)))
(define caml-extensible-tag              (integer->cnst 0))
(define (caml-allocate-regular-constr x) (make-vector (+fx x 1)))

;TODO: to optimize
(define (caml-make-regular tag size . l)
  (let ((v (copy-vector (list->vector l) (+fx size 1))))
	(begin
	  (vector-set! v size tag)
	  v)))

(define (caml-make-regular-1 tag x) `#(,x ,tag))
(define (caml-make-regular-2 tag x y) `#(,x ,y ,tag))
(define (caml-make-regular-3 tag x y z) `#(,x ,y ,z ,tag))
(define (caml-make-regular-4 tag x y z a) `#(,x ,y ,z ,a ,tag))

;TODO: optimization
(define (caml-make-extensible tag size . l)
  (caml-make-regular caml-extensible-tag (+fx size 1) (append l '(tag))))

(define (caml-make-extensible-1 tag x) `#(,x ,tag ,caml-extensible-tag))
(define (caml-make-extensible-2 tag x y) `#(,x ,y ,tag ,caml-extensible-tag))
(define (caml-make-extensible-3 tag x y z) `#(,x ,y ,z ,tag ,caml-extensible-tag))
(define (caml-make-extensible-4 tag x y z a) `#(,x ,y ,z ,a ,tag ,caml-extensible-tag))

(define (caml-constant-constr? c) (cnst? c))
(define (caml-regular-constr? r)
  (and (vector? r) 
	   (not (eq? caml-extensible-tag (vector-ref r (-fx (vector-length r) 1))))))
(define (caml-extensible-constr? r)
  (or (symbol? r)
	  (and (vector? r) 
		   (eq? caml-extensible-tag (vector-ref r (-fx (vector-length r) 1))))))

(define (caml-regular-constr-length v) (-fx (vector-length v) 1))

(define (caml-constant-constr-tag c)   (cnst->integer (-fx c 1)))
(define (caml-regular-constr-tag c)    (cnst->integer (vector-ref c (-fx (vector-length c) 1))))
(define (caml-extensible-constr-tag c)
  (if (symbol? c) c (vector-ref c (-fx (vector-length c) 2))))
(define (caml-constr-tag c)
  (if (caml-constant-constr? c)
	  (caml-constant-constr-tag c)
	  (if (caml-regular-constr? c)
		  (caml-regular-constr-tag c)
		  (caml-extensible-constr-tag c))))

(define (caml-constr-get-field v k) (vector-ref v k))
(define (caml-constr-set-field! v k x) (vector-set! v k x))


