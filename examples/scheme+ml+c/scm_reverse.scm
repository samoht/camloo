;*---------------------------------------------------------------------*/
;*    Copyright (c) 1994 by Manuel Serrano. All rights reserved.       */
;*                                                                     */
;*                                     ,--^,                           */
;*                               _ ___/ /|/                            */
;*                           ,;'( )__, ) '                             */
;*                          ;;  //   L__.                              */
;*                          '   \    /  '                              */
;*                               ^   ^                                 */
;*                                                                     */
;*                                                                     */
;*    This program is distributed in the hope that it will be useful.  */
;*    Use and copying of this software and preparation of derivative   */
;*    works based upon this software are permitted, so long as the     */
;*    following conditions are met:                                    */
;*           o credit to the authors is acknowledged following         */
;*             current academic behaviour                              */
;*           o no fees or compensation are charged for use, copies,    */
;*             or access to this software                              */
;*           o this copyright notice is included intact.               */
;*      This software is made available AS IS, and no warranty is made */
;*      about the software or its performance.                         */
;*                                                                     */
;*      Bug descriptions, use reports, comments or suggestions are     */
;*      welcome Send them to                                           */
;*        <Manuel.Serrano@inria.fr>                                    */
;*        Manuel Serrano                                               */
;*        INRIA -- Rocquencourt                                        */
;*        Domaine de Voluceau, BP 105                                  */
;*        78153 Le Chesnay Cedex                                       */
;*        France                                                       */
;*---------------------------------------------------------------------*/


(module scm_reverse
   (extern
	(include "type.h")
	(type el (struct (value::int "value") (next::el* "next")) "struct el")
	(print-el*::void (el*) "print_el_list"))
   (export (nreverse l)))

(define (nreverse l)
   (print-el* (list->el* l))
   (print "in Scheme: reversing the list")
   (if (pair? l)
       (let nr ((l l)
		(r '()))
          (if (null? (cdr l))
              (begin
                 (set-cdr! l r)
                 l)
	      (let ((cdrl (cdr l)))
		 (nr cdrl
		     (begin (set-cdr! l r) l)))))
       l))


(define (list->el* l)
   (let ((head (make-el*)))
      (let loop ((l l)
		 (c head))
	 (if (null? l)
	     head
	     (let ((new (make-el*)))
		(el*-value-set! c (car l))
		(el*-next-set! c new)
		(loop (cdr l) new))))))
