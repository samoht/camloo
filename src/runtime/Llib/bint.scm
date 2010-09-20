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

(module __caml_bint
		(extern (format_int::obj (obj obj)   "format_int")
				(c-int_of_string::obj (obj)  "int_of_string"))
		(export (inline int_of_string s)
				(inline int_of_char char)
				(inline char_of_int int)))

;*---------------------------------------------------------------------*/
;*    int_of_string ...                                                */
;*---------------------------------------------------------------------*/
(define-inline (int_of_string s)
   (c-int_of_string s))
   
;*---------------------------------------------------------------------*/
;*    int_of_char ...                                                  */
;*---------------------------------------------------------------------*/
(define-inline (int_of_char x)
   (char->integer x))

;*---------------------------------------------------------------------*/
;*    char_of_int ...                                                  */
;*---------------------------------------------------------------------*/
(define-inline (char_of_int x)
   (integer->char x))

