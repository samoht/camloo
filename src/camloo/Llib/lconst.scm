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
(module Lconst
		(library camloo-runtime)
		(include "var.sch" "trace.sch")
		(import  utils)
		(export (ConstrExtensible? constr)
				(Lconst             exp)
				(constr-tag         exp)
				(constr-tag-value   exp)
				(constr-tag-value-as-cnst exp ::bool)
				(get-constr-prop    exp cp)
				(set-constr-prop!   exp prop)
				(unset-constr-prop! exp prop)))

;*---------------------------------------------------------------------*/
;*    ConstrExtensible? ...                                            */
;*---------------------------------------------------------------------*/
(define (ConstrExtensible? constr)
   (eq? (car constr) 'ConstrExtensible))

;*---------------------------------------------------------------------*/
;*    Lconst-string ...                                                */
;*---------------------------------------------------------------------*/
(define (Lconst-string s)
  (let ((max-len 1000)
		(str-len (string-length s)))
	(if (<=fx str-len max-len)
		s
		(let loop ((r   0)
				   (res '()))
		  (if (<=fx (-fx str-len r) max-len)
			  `(string-append
				,@(reverse (cons (substring s r str-len)
								 res)))
			  (loop (+fx r max-len)
					(cons (substring s r (+fx r max-len))
						  res)))))))

;*---------------------------------------------------------------------*/
;*    *quasiquote?* ...                                                */
;*---------------------------------------------------------------------*/
(define *quasiquote?* #f)

;*---------------------------------------------------------------------*/
;*    Lconst ...                                                       */
;*    -------------------------------------------------------------    */
;*    Ce n'est pas tres beau mais avant d'allouer un constructeur      */
;*    on regarde s'il ne s'agit pas d'un `cons' (ou de '()). Si        */
;*    c'est le cas on fait une allocation particuliere (voir           */
;*    fichiers `lprim.scm' et `lswitch.scm'.                           */
;*---------------------------------------------------------------------*/
(define (Lconst exp)
  (trace 12 "Lconst: " (shape exp))
  (set! *quasiquote?* #f)
  (let internal-Lconst ((exp exp) (kwote? #f))
	(match-case exp

				((SCatom ?e)
				 (if (string? e)
					 (Lconst-string e)
					 e))

				((SCblock (and ?tag (ConstrRegular (qualifiedident ?module ?name)
					    ?tag-num ?nb-constr)) ?e)
				 (let ((m? (and (string=? module "builtin"))))
				   (cond
					((and m? (string=? name "[]"))
					 (if kwote?
						 '()
						 ''()))
					((and m? (string=? name "false"))
					 #f)
					((and m? (string=? name "true"))
					 #t)
					((and m? (string=? name "::"))
					 (let ((l (cons (internal-Lconst (car e) #t)
									(internal-Lconst (cadr e) #t))))
					   (cond
						(kwote? l)
						(*quasiquote?* (list 'quasiquote l))
						(else `',l))))
					((and m? (string=? name "vector"))
					 (if (null? e)
						 (constr-tag-value-as-cnst tag kwote?)
						 (let ((constr (list->vector
										(map (lambda (el)
											   (internal-Lconst el #t))
											 e))))
						   (cond
							(kwote? constr)
							(*quasiquote?* (list 'quasiquote constr))
							(else `',constr)))))
					(else
					 (if (null? e)
						 (constr-tag-value-as-cnst tag kwote?)
						 (let ((constr
								(list->vector
								 (append!
								  (map (lambda (el) (internal-Lconst el #t)) e)
								  (list (constr-tag-value-as-cnst tag kwote?))))))
						   (cond
							(kwote? constr)
							(*quasiquote?* (list 'quasiquote constr))
							(else `',constr))))))))

				((SCblock (and ?tag (ConstrExtensible ?- ?-)) ?e)
				 (if (null? e)
					 (let ((tag (constr-tag-value-as-cnst tag kwote?)))
					   (cond
						(kwote? tag)
						(*quasiquote?* (list 'quasiquote tag))
						(else `',tag)))
					 ;; Le tag est le dernier element des vecteurs representant
					 ;; les constructeurs extensibles.
					 ;; on fait cette horreur du append! parce qu'en general
					 ;; les listes sont toutes petites (0 ou 1 elements), dixit
					 ;; Pierre :-D
					 (let ((constr (list->vector
									(append!
									 (map (lambda (el) (internal-Lconst el #t)) e)
									 (list
									  (constr-tag-value-as-cnst tag kwote?)
									  caml-extensible-tag )))))
					   (cond
						(kwote? constr)
						(*quasiquote?* (list 'quasiquote constr))
						(else `',constr)))))

				((Lprim (Pmakeblock ?constr) ?values)
				 (internal-Lconst (Pmakeblock->Lconst constr values) kwote?))
				
				((Lconst ?exp)
				 ;; ce cas correspond a un Lconst interne a un Pmakeblock
				 (internal-Lconst exp kwote?))

				(else
				 (error "internal error (Lconst)"
						"Illegal constante expression"
						(shape exp))))))
   
;*---------------------------------------------------------------------*/
;*    Pmakeblock->Lconst ...                                           */
;*---------------------------------------------------------------------*/
(define (Pmakeblock->Lconst constr values)
   `(SCblock ,constr ,values))

;*---------------------------------------------------------------------*/
;*    name-of-exception ...                                            */
;*---------------------------------------------------------------------*/
(define (name-of-exception exception module int)
  (let ((exce (if (symbol? exception)
				  (symbol->string exception)
				  exception)))
	(string->symbol (string-append exce "_" (integer->string int) "@" module))))

;*---------------------------------------------------------------------*/
;*    constr-tag ...                                                   */
;*---------------------------------------------------------------------*/
(define (constr-tag exp)
   (match-case exp
      ((ConstrRegular ?- ?tag-num ?nb-constr)
       (do-caml-make-tag tag-num nb-constr))
      ((ConstrExtensible (?- ?module ?exception) ?int)
       `',(name-of-exception exception module int))))

;*---------------------------------------------------------------------*/
;*    constr-tag-value-as-cnst ...                                     */
;*---------------------------------------------------------------------*/
(define (constr-tag-value-as-cnst exp kwote?)
  (match-case exp 
	((ConstrConstant ?- ?tag-num ?nb-constr) (caml-make-tag tag-num))
	((ConstrRegular ?- ?tag-num ?nb-constr)
	 (let ((tag (caml-make-tag tag-num)))
	   (cond
		((eof-object? tag)
		 (error "constr-tag-value-as-cnst"
				"Illegal tag-value (eof-object)"
				tag))
		((eoa-object? tag)
		 (error "constr-tag-value-as-cnst"
				"Illegal tag-value (eoa-object)"
				tag))
		(else
		 tag))))
	((ConstrExtensible (?- ?module ?exception) ?int)
	 (if kwote?
		 `',(name-of-exception exception module int)
		 (name-of-exception exception module int)))
	(else
	 (error "constr-tag-value-as-cnst" "Illegal tag" exp))))

;*---------------------------------------------------------------------*/
;*    constr-tag-value ...                                             */
;*---------------------------------------------------------------------*/
(define (constr-tag-value exp)
  (match-case exp
    ((ConstrConstant ?- ?tag-num ?nb-constr) (+ tag-num 1))
	((ConstrRegular ?- ?tag-num ?nb-constr) (+ tag-num 1))
	((ConstrExtensible (?- ?module ?exception) ?int)
	 (name-of-exception exception module int))))

;*---------------------------------------------------------------------*/
;*    do-caml-make-tag ...                                             */
;*---------------------------------------------------------------------*/
(define (do-caml-make-tag tag-num nb-constr)
   (if (and (integer? tag-num) (integer? nb-constr))
       (let ((res (caml-make-tag tag-num)))
		 (cond
		  ((eof-object? res)
		   (error "do-caml-make-tag"
				  "Illegal tag-value (eof-object)"
				  res))
		  ((eoa-object? res)
		   (error "do-caml-make-tag"
				  "Illegal tag-value (eoa-object)"
				  res))
		  (else
		   res)))
       `(caml-make-tag ,tag-num ,nb-constr)))

;*---------------------------------------------------------------------*/
;*    get-constr-prop ...                                              */
;*---------------------------------------------------------------------*/
(define (get-constr-prop exp cp)
   (cond
      ((symbol? exp)
       (let ((plist (symbol-plist exp)))
	  (if (pair? plist)
	      (car plist)
	      #f)))
      ((local? exp)
       (local-property exp))
      (else
       (let ((cell (assoc exp cp)))
	  (if (pair? cell)
	      (cdr cell)
	      #f)))))

;*---------------------------------------------------------------------*/
;*    set-constr-prop! ...                                             */
;*---------------------------------------------------------------------*/
(define (set-constr-prop! exp prop)
   (cond
      ((symbol? exp)
       (putprop! exp prop #t)
       '())
      ((local? exp)
       (local-property-set! exp prop)
       '())
      (else
       (list (cons exp prop)))))

;*---------------------------------------------------------------------*/
;*    unset-constr-prop! ...                                           */
;*---------------------------------------------------------------------*/
(define (unset-constr-prop! exp prop)
   (if (symbol? exp)
       (remprop! exp prop)))
   
;*---------------------------------------------------------------------*/
;*    eoa-object? ...                                                  */
;*---------------------------------------------------------------------*/
(define (eoa-object? exp)
   (define (f . l)
      (null? l))
   (f exp))
