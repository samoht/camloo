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

(module __caml_sys
		(import __caml_handle)
		(extern (include "Clib/globals-bigloo.h")
				(sys_open::obj  (::obj ::obj ::obj) "sys_open")
				(sys_close::obj (::obj)             "sys_close")
				(sys_exit::obj  (::obj)             "bigloo_exit")
				(sys_error::obj ()                  "sys_error")
				(macro s_irall_56@sys::int          "SYS__S_IRALL")
				(macro s_iwall_219@sys::int         "SYS__S_IWALL"))
		(export command_line_240@sys
				interactive_191@sys
				(inline sys_remove s)
				(inline sys_rename a b)
				(inline sys_getenv s)
				(sys_chdir d)
				(sys_catch_break flag)
				(sys_gettimeofday x)))
  
;*---------------------------------------------------------------------*/
;*    command_line ...                                                 */
;*---------------------------------------------------------------------*/
(define command_line_240@sys
  (list->vector *the-command-line*))

;*---------------------------------------------------------------------*/
;*    interactive ...                                                  */
;*---------------------------------------------------------------------*/
(define interactive_191@sys #f)

;*---------------------------------------------------------------------*/
;*    sys_remove ...                                                   */
;*---------------------------------------------------------------------*/
(define-inline (sys_remove s)
   (delete-file s))

;*---------------------------------------------------------------------*/
;*    sys_rename ...                                                   */
;*---------------------------------------------------------------------*/
(define-inline (sys_rename a b)
   (rename-file a b))

;*---------------------------------------------------------------------*/
;*    sys_getenv ...                                                   */
;*---------------------------------------------------------------------*/
(define-inline (sys_getenv s)
   (let ((value (getenv s)))
      (if (not value)
	  (caml-raise 'Not_found_4_exc)
	  value)))
   
;*---------------------------------------------------------------------*/
;*    sys_chdir ...                                                    */
;*---------------------------------------------------------------------*/
(define (sys_chdir dirname)
   (if (not (chdir dirname))
       (sys_error)
       '#<0000>))

;*---------------------------------------------------------------------*/
;*    sys_catch_break ...                                              */
;*    -------------------------------------------------------------    */
;*    Attention le symbol `break_2@sys' doit rester conforme a la      */
;*    definition de l'exception break dans le fichier `tag.scm'.       */
;*---------------------------------------------------------------------*/
(define (sys_catch_break flag)
   (let ((SIGINT 3))
   (if flag
       (signal SIGINT (lambda (x)
			 (sigsetmask 0)
			 (caml-raise 'Break_2@sys)))
       (signal SIGINT sys_exit))))

(define (sys_gettimeofday _)
   (/ (current-microseconds) 1000000))