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
;*    directives                                                       */
;*---------------------------------------------------------------------*/
(directives
      (import (*trace* init)))

;*---------------------------------------------------------------------*/
;*    trace ...                                                        */
;*---------------------------------------------------------------------*/
(define-macro (trace when . text)
   `(if (<= ,when *trace*)
        (fprint (current-error-port) ,@text)
        'nop))
