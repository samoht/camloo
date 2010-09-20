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


(module fib
		(extern
		 (export fib "fib"))
		(export
		 (fib::int ::int)))

(define (fib x)
   (print "in Scheme: fib( " x " )")
   (labels ((fib (x) (if (< x 2)
			 1
			 (+ (fib (- x 1)) (fib (- x 2))))))
      (fib x)))


       
