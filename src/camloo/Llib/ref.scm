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
(module optimize-ref
		(include "var.sch"
				 "trace.sch")
		(import  utils)
		(export  (optimize-ref exps)))
 
;*---------------------------------------------------------------------*/
;*    optimize-ref ...                                                 */
;*    -------------------------------------------------------------    */
;*    Cette passe est assez simple, on se contente de reparcourir      */
;*    le code produit par `Llambda' (voir fichier llambda.scm) et      */
;*    toutes les references qui ne sont jamais utilisees en valeur     */
;*    sont supprimer.                                                  */
;*    Savoir qu'une reference est utilisee comme valeur est le         */
;*    resultat d'une annotation (sur le champs value? des variables    */
;*    locales) portee dans `Llambda'.                                  */
;*    -------------------------------------------------------------    */
;*    cette fonction prend en argument un arbre (ene liste d'expr)     */
;*---------------------------------------------------------------------*/
(define (optimize-ref exps)
   (trace 11 "optimize-ref: " (shape exps))
   (for-each remove-ref exps))

;*---------------------------------------------------------------------*/
;*    remove-ref ...                                                   */
;*---------------------------------------------------------------------*/
(define (remove-ref exp)
   (trace 11 "remove-ref: " exp)
   (match-case exp
;*--- atom ------------------------------------------------------------*/
      ((atom ?-)
       exp)
;*--- quote -----------------------------------------------------------*/
      ((quote ?-)
       exp)
;*--- set! ------------------------------------------------------------*/
      ((set! ?- ?-)
       (remove-ref-set! exp))
;*--- if --------------------------------------------------------------*/
      ((if ?- ?- ?-)
       (remove-ref-if exp))
;*--- begin -----------------------------------------------------------*/
      ((begin . ?body)
       (set-cdr! exp (remove-ref-begin body))
       exp)
;*--- letn ------------------------------------------------------------*/
      ((let (atom ?-) . ?-)
       (remove-ref-letn exp))
;*--- let -------------------------------------------------------------*/
      (((or let let*) . ?-)
       (remove-ref-let exp))
;*--- letrec ----------------------------------------------------------*/
      ((letrec . ?-)
       (remove-ref-letrec exp))
;*--- labels ----------------------------------------------------------*/
      ((labels . ?-)
       (remove-ref-labels exp))
;*--- lambda ----------------------------------------------------------*/
      ((lambda . ?-)
       (remove-ref-lambda exp))
;*--- bind-exit -------------------------------------------------------*/
      ((bind-exit ?- . ?body)
       (set-cdr! (cdr exp) (remove-ref-begin body))
       exp)
;*--- case ------------------------------------------------------------*/
      ((case ?- . ?-)
       (remove-ref-case exp)
       exp)
;*--- unspecified -----------------------------------------------------*/
      ((unspecified)
       exp)
;*--- else ------------------------------------------------------------*/
      (else
       (remove-ref-application exp))))

;*---------------------------------------------------------------------*/
;*    remove-ref-set! ...                                              */
;*---------------------------------------------------------------------*/
(define (remove-ref-set! exp)
   (set-car! (cddr exp) (remove-ref (caddr exp)))
   exp)

;*---------------------------------------------------------------------*/
;*    remove-ref-if ...                                                */
;*---------------------------------------------------------------------*/
(define (remove-ref-if exp)
   (set-car! (cdr exp) (remove-ref (cadr exp)))
   (set-car! (cddr exp) (remove-ref (caddr exp)))
   (set-car! (cdddr exp) (remove-ref (cadddr exp)))
   exp)

;*---------------------------------------------------------------------*/
;*    remove-ref-begin ...                                             */
;*---------------------------------------------------------------------*/
(define (remove-ref-begin body)
   (let loop ((hook body))
      (if (null? hook)
	  body
	  (begin
	     (set-car! hook (remove-ref (car hook)))
	     (loop (cdr hook))))))

;*---------------------------------------------------------------------*/
;*    remove-ref-letn ...                                              */
;*---------------------------------------------------------------------*/
(define (remove-ref-letn exp)
   (let ((bindings (caddr exp))
	 (body     (cdddr exp)))
      (let loop ((bindings bindings))
	 (if (null? bindings)
	     (begin
		(remove-ref-begin body)
		exp)
	     (let ((binding (car bindings)))
		(match-case binding
		   ((?var (make-cell ?value))
		    (if (not (local-value? var))
			(set-car! (cdr binding) (remove-ref value))
			(set-car! (cdr binding) (remove-ref (cadr binding)))))
		   (else
		    (set-car! (cdr binding) (remove-ref (cadr binding)))))
		(loop (cdr bindings)))))))

;*---------------------------------------------------------------------*/
;*    remove-ref-let ...                                               */
;*---------------------------------------------------------------------*/
(define (remove-ref-let exp)
   (let ((bindings (cadr exp))
	 (body     (cddr exp)))
      (let loop ((bindings bindings))
	 (if (null? bindings)
	     (begin
		(remove-ref-begin body)
		exp)
	     (let ((binding (car bindings)))
		(match-case binding
		   ((?var (make-cell ?value))
		    (if (not (local-value? var))
			(set-car! (cdr binding) (remove-ref value))
			(set-car! (cdr binding) (remove-ref (cadr binding)))))
		   (else
		    (set-car! (cdr binding) (remove-ref (cadr binding)))))
		(loop (cdr bindings)))))))

;*---------------------------------------------------------------------*/
;*    remove-ref-letrec ...                                            */
;*---------------------------------------------------------------------*/
(define (remove-ref-letrec exp)
   (trace 11 "remove-ref-letrec: " (shape exp))
   (let ((bindings (cadr exp))
	 (body     (cddr exp)))
      (let loop ((bindings bindings))
	 (trace 11 "remove-ref-letrec:bindings: " (shape bindings))
	 (if (null? bindings)
	     (begin
		(trace 11 "remove-ref-letrec:body: " (shape body))
		(remove-ref-begin body)
		exp)
	     (let ((binding (car bindings)))
		(set-car! (cdr binding) (remove-ref (cadr binding)))
		(loop (cdr bindings)))))))

;*---------------------------------------------------------------------*/
;*    remove-ref-labels ...                                            */
;*---------------------------------------------------------------------*/
(define (remove-ref-labels exp)
   (let ((bindings (cadr exp))
	 (body     (cddr exp)))
      (let loop ((bindings bindings))
	 (if (null? bindings)
	     (begin
		(remove-ref-begin body)
		exp)
	     (let ((binding (car bindings)))
		(set-car! (cddr binding) (remove-ref (caddr binding)))
		(loop (cdr bindings)))))))
	 
;*---------------------------------------------------------------------*/
;*    remove-ref-lambda ...                                            */
;*---------------------------------------------------------------------*/
(define (remove-ref-lambda exp)
   (set-car! (cddr exp) (remove-ref (caddr exp)))
   exp)

;*---------------------------------------------------------------------*/
;*    remove-ref-case ...                                              */
;*---------------------------------------------------------------------*/
(define (remove-ref-case exp)
   (set-car! (cdr exp) (remove-ref (cadr exp)))
   (for-each (lambda (clause)
		(set-car! (cdr clause) (remove-ref (cadr clause))))
	     (cddr exp))
   exp)
	     
;*---------------------------------------------------------------------*/
;*    remove-ref-application ...                                       */
;*---------------------------------------------------------------------*/
(define (remove-ref-application exp)
   (trace 11 "remove-ref-application: " (shape exp))
   (match-case exp
      ((cell-ref ?var)
       (trace 11 "   var: " var)
       (if (and (local? var)
		(not (local-value? var)))
	   var
	   (remove-ref-begin exp)))
      ((cell-set! ?var ?value)
       (trace 11 "   var: " var)
       (if (and (local? var)
		(not (local-value? var)))
	   `(set! ,var ,(remove-ref value))
	   (remove-ref-begin exp)))
      (else
       (remove-ref-begin exp))))
 
		     
