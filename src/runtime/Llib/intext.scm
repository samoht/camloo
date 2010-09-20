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

(module __caml_intext
		(import __caml_constr
				__caml_handle
				__caml_bio)
		(extern (putword::obj (obj long)   "putword")
				(getword::long (obj)       "getword"))
		(export (intern_val channel)
				(extern_val channel exp)))

;*---------------------------------------------------------------------*/
;*    MAGIC_NUMBER ...                                                 */
;*---------------------------------------------------------------------*/
(define MAGIC_NUMBER #x95A6B9)
 
;*---------------------------------------------------------------------*/
;*    intern_val ...                                                   */
;*---------------------------------------------------------------------*/
(define (intern_val channel)
  (let ((to-be-magic (getword channel)))
	(if (not (eq? to-be-magic MAGIC_NUMBER))
		(caml-raise (caml-make-static-extensible-1 'Failure_3@exc "intern: bad object"))
		(let* ((len       (getword channel))
			   (buf       (make-string len))
			   (res       (intern-value channel buf 0 len)))
		  (if (not res)
			  (caml-raise (caml-make-static-extensible-1 'Failure_3@exc "intern: truncated object"))
			  (string->obj buf))))))

;*---------------------------------------------------------------------*/
;*    extern_val ...                                                   */
;*---------------------------------------------------------------------*/
(define (extern_val channel exp)
   (let ((str (obj->string exp)))
      (putword channel MAGIC_NUMBER)
      (putword channel (string-length str))
      (output channel str 0 (string-length str))))
