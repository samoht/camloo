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
(module var
   (include "var.sch")
   (import  module)
   (extern (get-hash-number::int (::string) "get_hash_number"))
   (export (get-global  name  module)
	    (define-global  name  module)
		(bigloo-global bname name module)
	    (define-foreign cname arity)
	    (overwrite-global-definition! exp)
	    (get-all-global)
	    (get-all-foreign)))

;*---------------------------------------------------------------------*/
;*    *all-global* ...                                                 */
;*---------------------------------------------------------------------*/
(define *all-global* '())

;*---------------------------------------------------------------------*/
;*    get-all-global ...                                               */
;*---------------------------------------------------------------------*/
(define (get-all-global)
   *all-global*)

;*---------------------------------------------------------------------*/
;*    define-global ...                                                */
;*    -------------------------------------------------------------    */
;*    S'il existe deja une variable qui a le meme nom (et dont on      */
;*    a deja lu la definition) alors on renomme l'ancienne variable.   */
;*    -------------------------------------------------------------    */
;*    Il faut noter que les cas tres tricky ont deja ete traites par   */
;*    la fonction `overwrite-global-definition!' qui est invoquee      */
;*    quand on trouve des `sequence' au top-level (fonction llambda).  */
;*---------------------------------------------------------------------*/
(define (define-global name module)
  (with-trace 2 'DEFINE-GLOBAL
  (let* ((name  (if (symbol? name)
					name
					(string->symbol (string-append
									 name
									 "_"
									 (integer->string
									  (get-hash-number name))))))
		 (fname (symbol-append name '@ (string->symbol module)))
		 (old   (getprop fname 'global)))
	(cond
	 ((not old)
	  ;; on a rien sous ce nom ...
	  (let ((new (create-global name module)))
		(trace-item "DEFINE->new=" new)
		 (global-defined?-set! new #t)
		 new))
	 ((not (global-defined? old))
	  ;; on a deja une globale mais on n'a pas trouve sa definition ...
	  (global-defined?-set! old #t)
	  old)
	 (else
	  ;; on a deja une global definie, on fait une alpha conversion
	  (let ((new-name (gensym)))
		(remprop! fname 'global)
		(putprop! (symbol-append new-name '@ (string->symbol module))
				  'global old)
		(global-name-set! old new-name)
		(global-exported?-set! old #f))
	  ;; on cree une nouvelle variable
	  (let ((new (create-global name module)))
		(global-defined?-set! new #t)
		new))))))

;*---------------------------------------------------------------------*/
;*    get-global ...                                                   */
;*    -------------------------------------------------------------    */
;*    S'il existe deja une variable qui a le meme nom (et dont on      */
;*    a deja lu la definition) alors on renomme l'ancienne variable.   */
;*---------------------------------------------------------------------*/
(define (get-global name module)
   (let* ((name (if (symbol? name)
					name
					(string->symbol
					 (string-append name
									"_"
									(integer->string (get-hash-number name))))))
		  (old  (getprop (symbol-append name '@ (string->symbol module))
						 'global)))
      (if old
		  old
		  (create-global name module))))
      
(define (bigloo-global bname name module)
  (let ((global (get-global name module)))
	(global-bname-set! global bname)
	global))

;*---------------------------------------------------------------------*/
;*    create-global ...                                                */
;*---------------------------------------------------------------------*/
(define (create-global name module)
  (with-trace 2 'CREATE-GLOBAL
   (let ((new     (make-global))
		 (smodule (string->symbol module)))
	 (trace-item "name=" name " module=" module)
	 (remember-module! module)
	 (putprop! (symbol-append name '@ smodule) 'global new)
	 (set! *all-global* (cons new *all-global*))
	 (global-name-set!      new name)
	 (global-module-set!    new smodule)
	 (global-exported?-set! new #t)
	 (global-function?-set! new #f)
	 (global-defined?-set!  new #f)
	 (global-arity-set!     new 0)
	 (global-args-set!      new '())
	 (global-bname-set!     new #f)
	 (trace-item "CREATE->new=" new)
	 new)))

;*---------------------------------------------------------------------*/
;*    *all-foreign* ...                                                */
;*---------------------------------------------------------------------*/
(define *all-foreign* '())

;*---------------------------------------------------------------------*/
;*    get-all-foreign ...                                              */
;*---------------------------------------------------------------------*/
(define (get-all-foreign)
   *all-foreign*)

;*---------------------------------------------------------------------*/
;*    remember-foreign! ...                                            */
;*---------------------------------------------------------------------*/
(define (remember-foreign! l)
   (set! *all-foreign* (cons l *all-foreign*)))

;*---------------------------------------------------------------------*/
;*    define-foreign ...                                               */
;*---------------------------------------------------------------------*/
(define (define-foreign cname arity)
   (let ((sname (string->symbol (string-upcase cname))))
      (if (getprop sname 'global)
	  (error "define-foreign" "Conflict in name for foreign" cname)
	  (let ((old (getprop sname 'foreign)))
	     (if old
		 (if (not (=fx old arity))
		     (error
		      "define-foreign"
		      "Foreign has already been declared with another arity"
		      cname)
		     sname)
		 (begin
		    (putprop! sname 'foreign arity)
		    (remember-foreign! (list cname sname arity))
		    sname))))))

;*---------------------------------------------------------------------*/
;*    overwrite-global-definition! ...                                 */
;*    -------------------------------------------------------------    */
;*    On est oblige de faire un traitement avant de compiler           */
;*    les corps des fonctions. Si non, le cas:                         */
;*                                                                     */
;*       let foo x = 9;;                                               */
;*                                                                     */
;*       let rec bar x = foo x                                         */
;*       and foo x = 8;;                                               */
;*                                                                     */
;*       print_int( bar 7 );;                                          */
;*       print_newline();;                                             */
;*                                                                     */
;*    est a tous les coups mal traite !                                */
;*---------------------------------------------------------------------*/
(define (overwrite-global-definition! exp)
   (match-case exp
      ((Lprim (Pset_global ?def ?-))
       (overwrite-one-global-definition! def))
      ((Lsequence
	(Lprim (Pset_global ?def ?-))
	?rest)
       (overwrite-one-global-definition! def)
       (overwrite-global-definition! rest))))
       
;*---------------------------------------------------------------------*/
;*    overwrite-one-global-definition! ...                             */
;*---------------------------------------------------------------------*/
(define (overwrite-one-global-definition! def)
   (let* ((module (cadr def))
	  (name  (if (symbol? (caddr def))
		     (caddr def)
		     (string->symbol (string-append
				      (caddr def)
				      "_"
				      (integer->string
				       (get-hash-number (caddr def)))))))
	  (fname  (symbol-append name '@ (string->symbol module)))
	  (old    (getprop fname 'global)))
      (cond
	 ((not old)
	  ;; on a rien sous ce nom, on ne fait donc rien
	  'done)
	 ((not (global-defined? old))
	  ;; on a deja une globale mais on n'a pas trouve sa definition,
	  ;; on ne fait donc rien non plus
	  'done)
	 (else
	  ;; on a deja une global definie, on fait une alpha conversion
	  ;; sur l'ancienne version
	  (let ((new-name (gensym)))
	     (remprop! fname 'global)
	     (putprop! (symbol-append new-name '@ (string->symbol module))
		       'global old)
	     (global-name-set! old new-name)
	     (global-exported?-set! old #f)
	     'done)))))
	  
	  
	  
      
   
