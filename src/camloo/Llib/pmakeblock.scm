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
(module Pmakeblock
   		(include "trace.sch")
		(import  utils
				 Llambda
				 Lconst)
		(export (Pmakeblock <expr> <constr> <values> <cp> <bool> <bool>)))

;*---------------------------------------------------------------------*/
;*    Pmakeblock ...                                                   */
;*---------------------------------------------------------------------*/
(define (make-call fn constr values cp)
  (let* ((n (length values))
		 (n-str (integer->string n))
		 (args (map (lambda (v) (Llambda v #f cp #f #f #f)) values)))
	(if (<= n 4)
		`(,(string->symbol (string-append (symbol->string fn) "-" n-str))
		  ,(constr-tag constr)
		  ,@args)
		`(,fn ,(constr-tag constr) ,n ,@args))))
				
(define (Pmakeblock exp constr values cp sg? raise?)
  (trace 12 "Pmakeblock: " (shape constr) (shape values))
  (match-case constr
			  ((ConstrRegular (qualifiedident ?module ?name) ?- ?-)
			   (cond
				((and (string=? module "builtin")(string=? name "::"))
				 (if (and sg? (constant-expressions? values))
					 (Lconst exp)
					 `(cons ,@(map (lambda (v) (Llambda v #f cp #f #f #f)) values))))
				((and (string=? module "ref") (string=? name "ref"))
				 `(make-cell ,(Llambda (car values) #f cp #f #f #f)))
				(else
				 (if (and sg? (constant-expressions? values))
					 ;; c'est une constante et on la lie a une variable
					 ;; globale, on ne produit pas de code mais une constante.
					 (Lconst exp)
					 ;; ce n'est pas une constante, on produit du code
					 `,(if (ConstrExtensible? constr)
							(if raise?
								(make-call 'caml-make-static-extensible constr values cp)
								(make-call 'caml-make-extensible constr values cp))
							(make-call 'caml-make-regular constr values cp))))))
			  (else
			   (if (and sg? (constant-expressions? values))
				   ;; c'est une constante et on la lie a une variable
				   ;; globale, on ne produit pas de code mais une constante.
				   (Lconst exp)
				   ;; ce n'est pas une constante, on produit du code
				   `,(if (ConstrExtensible? constr)
						  (if raise?
							  (make-call 'caml-make-static-extensible constr values cp)
							  (make-call 'caml-make-extensible constr values cp))
						  (make-call 'caml-make-regular constr values cp))))))

;*---------------------------------------------------------------------*/
;*    constant-expressions? ...                                        */
;*---------------------------------------------------------------------*/
(define (constant-expressions? values)
   (trace 12 "constant-expressions? : " (shape values))
   (define (constant-expr? expr)
      (trace 12 "constant-expr? : " (shape expr))
      (match-case expr
	 ((Lconst . ?-)
	  #t)
	 ((Lprim (Pmakeblock ?-) ?values)
	  (constant-expressions? values))
	 (else
	  #f)))
   (let loop ((values values))
      (cond
	 ((null? values)
	  (trace 12 "...   OUI")
	  #t)
	 ((constant-expr? (car values))
	  (loop (cdr values)))
	 (else
	  (trace 12 "...   NON")
	  #f))))

