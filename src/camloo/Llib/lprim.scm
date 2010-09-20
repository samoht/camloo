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

;*---------------------------------------------------------------------*/
;*    Le module                                                        */
;*---------------------------------------------------------------------*/
(module Lprim
		(include "var.sch")
		(import  Llambda
				 var
				 Pmakeblock
				 Lconst
				 Ldefine
				 module
				 utils
				 generate
				 init
				 hop-names)
		(export  (Lprim exp tl? cp sg? raise?)))

;*---------------------------------------------------------------------*/
;*    is-function? ...                                                 */
;*---------------------------------------------------------------------*/
(define (is-function? exp)
   (match-case exp
      ((Lshared ?exp ?-)
       (is-function? exp))
      ((Lfunction . ?-)
       #t)
      ((Lletrec ?- ?body)
       (is-function? body))
      ((Llet ?- ?body)
       (is-function? body))
      (else
       #f)))

(define (== m1 n1 m2 n2)
   (and (=fx *optim* 1)
		(string=? m1 m2)
		(string=? n1 n2)))

;*---------------------------------------------------------------------*/
;*    Lprim ...                                                        */
;*---------------------------------------------------------------------*/
(define (Lprim exp tl? cp sg? raise?)
   (with-trace 2 'LPRIM
   (match-case (cdr exp)
      (((Pget_global (qualifiedident ?module ?name)) ())
	   (trace-item "module=" module)
	   (cond ((== module name "vect" "vect_item")
			  (bigloo-global 'vector-ref name module))
			 ((== module name "vect" "vect_assign")
			  (bigloo-global 'vector-set! name module))
			 (else
			  (remember-module! module)
			  (get-global name module))))
	  ((Pidentity (?rest))
       (Llambda rest tl? cp #f #f #f))
      (((Pset_global (qualifiedident ?module ?name)) (?value))
       (Pset_global exp tl? cp))
      (((Pdummy . ?rest) ())
       (match-case rest
	  ((and (? integer?) ?int)
	   ;; pour etre compatible avec la version qui n'a pas l'optime
	   ;; des dummy on a rajoute ce filtre.
	   `(caml-allocate-regular-constr ,int))
	  ((vector ?int)
	   `(make-vector ,int))
	  (((or tuple record) ?int)
	   `(caml-allocate-regular-constr ,int))
	  (((or stream parser))
	   '(caml-allocate-regular-constr 2))
	  ((function)
	   '(unspecified))
	  (((?- (?- ?module ?name) . ?-) ?int)
	   (cond
	      ((and (string=? module "builtin")
		    (string=? name "::"))
	       '(cons (unspecified) (unspecified)))
	      (else
	       `(caml-allocate-regular-constr ,int))))
	  (else
	   (error "Lprim" "Illegal Pdummy form" (shape (cdr exp))))))
      ((Pupdate (?exp1 ?exp2))
       (if (is-function? exp2)
	   ;; cas bizzare qui semble etre genere pour les streams
	   `(set! ,(Llambda exp1 #f cp #f #f #f)
		  ,(Llambda exp2 #f cp #f #f #f))
	   `(caml-constr-update! ,(Llambda exp1 #f cp #f #f #f)
				 ,(Llambda exp2 #f cp #f #f #f))))
      (((Ptest ?test) (?e1 ?e2))
       `(,(Ptest test) ,(Llambda e1 #f cp #f #f #f)
		       ,(Llambda e2 #f cp #f #f #f)))
      (((Pmakeblock ?constr) ?values)
       (Pmakeblock exp constr values cp sg? raise?))
      ((Ptag-of (?e))
       `(tag-of ,(Llambda e #f cp #f #f #t)))
      (((Pfield ?int) (?e))
       (Pfield int e cp))
      (((Psetfield ?int) (?exp ?value))
       (Psetfield int exp value cp))
      (((Pccall ?call ?n) ?args)
       (case call
	  ((cell-ref)
	   `(cell-ref ,(Llambda (car args) #f cp #t #f #f)))
	  ((cell-set!)
	   `(cell-set! ,(Llambda (car args) #f cp #t #f #f)
		       ,(Llambda (cadr args) #f cp #f #f #f)))
	  (else
	   `(,call ,@(map (lambda (v) (Llambda v #f cp #f #f #f))
			  args)))))
      ((Praise (?value)) 
       `(caml-raise ,(Llambda value #f cp #f #f #t)))
      ((Pnot (?e))
       `(not ,(Llambda e #f cp #f #f #f)))
      ((Pnegint (?e))
       `(negfx ,(Llambda e #f cp #f #f #f)))
      ((Psuccint (?e))
       `(+fx ,(Llambda e #f cp #f #f #f) 1))
      ((Ppredint (?e))
       `(-fx ,(Llambda e #f cp #f #f #f) 1))
      ((Paddint (?e1 ?e2))
       `(+fx ,(Llambda e1 #f cp #f #f #f) ,(Llambda e2 #f cp #f #f #f)))
      ((Psubint (?e1 ?e2))
       `(-fx ,(Llambda e1 #f cp #f #f #f) ,(Llambda e2 #f cp #f #f #f)))
      ((Pmulint (?e1 ?e2))
       `(*fx ,(Llambda e1 #f cp #f #f #f) ,(Llambda e2 #f cp #f #f #f)))
      ((Pdivint (?e1 ?e2))
       `(/fx ,(Llambda e1 #f cp #f #f #f) ,(Llambda e2 #f cp #f #f #f)))
      ((Pmodint (?e1 ?e2))
       `(modulo ,(Llambda e1 #f cp #f #f #f) ,(Llambda e2 #f cp #f #f #f)))
      ((Pandint (?e1 ?e2))
       `(bit-and ,(Llambda e1 #f cp #f #f #f) ,(Llambda e2 #f cp #f #f #f)))
      ((Porint (?e1 ?e2))
       `(bit-or ,(Llambda e1 #f cp #f #f #f) ,(Llambda e2 #f cp #f #f #f)))
      ((Pxorint (?e1 ?e2))
       `(bit-xor ,(Llambda e1 #f cp #f #f #f) ,(Llambda e2 #f cp #f #f #f)))
      ((Pshiftleftint (?e1 ?e2))
       `(bit-lsh ,(Llambda e1 #f cp #f #f #f) ,(Llambda e2 #f cp #f #f #f)))
      ((Pshiftrightintsigned (?e1 ?e2))
       `(bit-rsh ,(Llambda e1 #f cp #f #f #f) ,(Llambda e2 #f cp #f #f #f)))
      ((Pshiftrightintunsigned (?e1 ?e2))
       `(bit-ursh ,(Llambda e1 #f cp #f #f #f) ,(Llambda e2 #f cp #f #f #f)))
      ((Pincr (?e))
       (let ((var (Llambda e #f cp #t #f #f)))
	  (if (and (not (local? var))
		   (not (global? var)))
	      (let ((local (make-local-variable "aux")))
		 (exit-lexical-block!)
		 `(let ((,local ,var))
		     (cell-set! ,local (+fx (cell-ref ,local) 1))))
	      `(cell-set! ,var (+fx (cell-ref ,var) 1)))))
      ((Pdecr (?e))
       (let ((var (Llambda e #f cp #t #f #f)))
	  (if (and (not (local? var))
		   (not (global? var)))
	      (let ((local (make-local-variable "aux")))
		 (exit-lexical-block!)
		 `(let ((,local ,var))
		     (cell-set! ,local (+fx (cell-ref ,local) 1))))
	      `(cell-set! ,var (-fx (cell-ref ,var) 1)))))
      ((Pintoffloat (?e))
       `(flonum->fixnum ,(Llambda e #f cp #f #f #f)))
      (((Pfloatprim ?f) ?e)
       `(,(Pfloatprim f) ,@(map (lambda (v) (Llambda v #f cp #f #f #f)) e)))
      ((Pstringlength (?e))
       `(string-length ,(Llambda e #f cp #f #f #f)))
      ((Pgetstringchar (?e1 ?e2))
       `(string-ref ,(Llambda e1 #f cp #f #f #f)
		    ,(Llambda e2 #f cp #f #f #f)))
      ((Psetstringchar (?e1 ?e2 ?e3))
       `(string-set! ,(Llambda e1 #f cp #f #f #f)
		     ,(Llambda e2 #f cp #f #f #f)
		     ,(Llambda e3 #f cp #f #f #f)))
      ((Pmakevector (?e1 ?e2))
       `(make-vector ,(Llambda e1 #f cp #f #f #f)
		     ,(Llambda e2 #f cp #f #f #f)))
      ((Pvectlength (?e))
       (let ((v (gensym)))
	  `(let ((,v ,(Llambda e #f cp #f #f #f)))
	      (if ,v
		  (vector-length ,v)
		  0))))
      ((Pgetvectitem (?e1 ?e2))
       `(vector-ref ,(Llambda e1 #f cp #f #f #f)
		    ,(Llambda e2 #f cp #f #f #f)))
      ((Psetvectitem (?e1 ?e2 ?e3))
       `(vector-set! ,(Llambda e1 #f cp #f #f #f)
		     ,(Llambda e2 #f cp #f #f #f)
		     ,(Llambda e3 #f cp #f #f #f)))
      (else
       (error "Lprim" "Unknown primitives" exp)))))

;*---------------------------------------------------------------------*/
;*    Pfield ...                                                       */
;*    -------------------------------------------------------------    */
;*    Il existe plusieurs facons de faire un `Pfield'. Le chois        */
;*    de la methode depend des proprietes eventuelles de               */
;*    l'expression qu'on dereference.                                  */
;*    -------------------------------------------------------------    */
;*    Jusqu'a present il y a trois cas:                                */
;*       - les variables servant d'indice aux boucles `for'            */
;*       - les constructeurs constants qui ont ete alloues dans des    */
;*         `cons'                                                      */
;*       - tous les autres                                             */
;*---------------------------------------------------------------------*/
(define (Pfield int e cp)
   (let* ((be   (Llambda e #f cp #t #f #t)) ;; on met raise? a #t pour
	  (prop (get-constr-prop be cp)))   ;; l'optim du `raise/failure'
      (case prop
	 ((for-indice)
	  be)
	 ((::)
	  (if (=fx int 0)
	      `(car ,be)
	      `(cdr ,be)))
	 ((ref)
	  `(cell-ref ,be))
	 (else
	  `(caml-constr-get-field ,be ,int)))))

;*---------------------------------------------------------------------*/
;*    Psetfield ...                                                    */
;*    -------------------------------------------------------------    */
;*    Meme remarque que pour la precedente fonction.                   */
;*---------------------------------------------------------------------*/
(define (Psetfield int exp value cp)
   (let* ((be   (Llambda exp #f cp #t #f #f))
	  (prop (get-constr-prop be cp))
	  (ve   (Llambda value #f cp #f #f #f)))
      (case prop
	 ((for-indice)
	  `(set! ,be ,ve))
	 ((::)
	  `(,(if (=fx int 0) 'set-car! 'set-cdr!) ,be ,ve))
	 ((ref)
	  `(cell-set! ,be ,ve))
	 (else
	  `(caml-constr-set-field! ,be ,int ,ve)))))

;*---------------------------------------------------------------------*/
;*    Ptest ...                                                        */
;*---------------------------------------------------------------------*/
(define (Ptest test)
   (match-case test
      (Peq
       'eq?)
      (Pnoteq_test
       '(lambda (x y) (not (eq? x y))))
      ((Pint_test ?op)
       (Pint_test op))
      ((Pfloat_test ?op)
       (Pfloat_test op))
      ((Pstring_test ?op)
       (Pstring_test op))
      (else
       `(todo-Ptest ,test))))

;*---------------------------------------------------------------------*/
;*    Pint_test ...                                                    */
;*---------------------------------------------------------------------*/
(define (Pint_test op)
   (case op
      ((PTeq)               '=fx)
      ((PTnoteq PTnoteqimm) '(lambda (x y) (not (=fx x y))))
      ((PTlt)               '<fx)
      ((PTle)               '<=fx)
      ((PTgt)               '>fx)
      ((PTge)               '>=fx)))

;*---------------------------------------------------------------------*/
;*    Pfloat_test ...                                                  */
;*---------------------------------------------------------------------*/
(define (Pfloat_test op)
   (case op
      ((PTeq)               '=fl)
      ((PTnoteq PTnoteqimm) '(lambda (x y) (not (=fl x y))))
      ((PTlt)               '<fl)
      ((PTle)               '<=fl)
      ((PTgt)               '>fl)
      ((PTge)               '>=fl)))

;*---------------------------------------------------------------------*/
;*    Pstring_test ...                                                 */
;*---------------------------------------------------------------------*/
(define (Pstring_test op)
   (case op
      ((PTeq)               'string=?)
      ((PTnoteq PTnoteqimm) '(lambda (x y) (not (string=? x y))))
      ((PTlt)               'string<?)
      ((PTle)               'string<=?)
      ((PTgt)               'string>?)
      ((PTge)               'string>=?)))

;*---------------------------------------------------------------------*/
;*    Pfloatprim ...                                                   */
;*---------------------------------------------------------------------*/
(define (Pfloatprim f)
   (case f
      ((Pfloatofint)
       'fixnum->flonum)
      ((Pnegfloat)
       'negfl)
      ((Paddfloat)
       '+fl)
      ((Psubfloat)
       '-fl)
      ((Pmulfloat)
       '*fl)
      ((Pdivfloat)
       '/fl)))

      
   
