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
(module init
		(import module
				__caml_main)
		(export (parse-args! argv)
				(start-io!)
				(close-io!)
				(read-afile!)
				*in*
				*trace*
				*pout*
				*pin*
				*module-str*
				*module-symb*
				*basename-str*
				*basename-symb*
				*sci-str*
				*module-alist*
				*optim*
				*version*
				*bootstrap*
				*hop-mode*
				*mlopt*
				*stop*
				*zi-mode*
				*out*
				*lam*))

;*---------------------------------------------------------------------*/
;*    Quelques variables globales de controles                         */
;*---------------------------------------------------------------------*/
(define *trace*         0)
(define *out*           #f)
(define *in*            #f)
(define *lam*           #f)
(define *pout*          #f)
(define *pin*           #f)
(define *module-str*    #f)
(define *module-symb*   #f)
(define *basename-str*  #f)
(define *basename-symb* #f)
(define *sci-str*       #f)
(define *afile*         #f)
(define *module-alist* '())
(define *optim*         0)
(define *version*       "0.4.7")
(define *bootstrap*     #f)
(define *hop-mode*      #f)
(define *mlopt*         "")
(define *stop*          #f)
(define *zi-mode*       #f)

;*--------------------------------------------------------------------*/
;*    parse-args! ...                                                  */
;*---------------------------------------------------------------------*/
(define *others* '())
(define (parse-args! argv)
  (args-parse argv
			  ((("-h" "--help") (help "This help message"))
			   (args-parse-usage #f)
			   (exit 0))
			  ((("-v" "--version") (help "Version number"))
			   (print *version*)
			   (exit 0))
			  (("-afile" ?file (help "Name of the `a file (default is .afile)"))
			   (set! *afile* file))
			  (("-o" ?file (help "Output file"))
			   (set! *out* file))
			  (("-t?level" (help "Level of verbosity"))
			   (set! *trace* (string->integer level)))
			  (("-m" ?module (help "Module name"))
			   (set! *module-str* module)
			   (set! *module-symb* (string->symbol *module-str*)))
			  (("-O" (help "Optimized translation"))
			   (set! *optim* 1))
			  (("-mlopt" ?options (help "Options to pass to the ML compiler"))
			   (set! *mlopt* options))
			  (("-stop" (help "Only perform the ML compilation step and then stop"))
			   (set! *stop* #t))
			  (("-zi" (help "Compilation of ML interfaces"))
			   (set! *zi-mode* #t))
			  (("--bootstrap" (help "Bootstrap mode"))
			   (set! *bootstrap* #t))
			  (("--hop" (help "HOP mode"))
			   (print "HOP mode")
			   (set! *hop-mode* #t))
			  (else
			   (set! *others* (append *others* (list else)))))
  (if (=fx 1 (length *others*))
	  (begin
		(set! *in* (car *others*))
		(set! *lam* (string-append (prefix *in*) ".lam"))
		(set! *basename-str* (basename (prefix *in*)))
		(set! *basename-symb* (string->symbol *basename-str*))
		(set! *sci-str* (string-append (basename (prefix *in*)) ".sci"))

		(if (not (string? *module-str*))
			(begin
			  (set! *module-str* (module-shape *basename-str*))
			  (set! *module-symb* (string->symbol *module-str*)))))
	  (if (and (null? *others*) (not (eq? "" *mlopt*)))
		  (begin
			(main_109@main (list->vector (cons "camloo" (string-split *mlopt*))))
			(exit 0))
		  (if (null? *others*)
			  (exit -1)
			  (begin
				(print "Illegal argument `" *others* "'")
				(exit -1))))))

;*---------------------------------------------------------------------*/
;*    start-io! ...                                                    */
;*---------------------------------------------------------------------*/
(define (start-io!)
   (if (string? *lam*)
       (begin
		 (set! *pin* (open-input-file *lam*))
		 (if (not (input-port? *pin*))
			 (error "start-io!" "Can't open file" *lam*)) )
	   ( error "start-io!" "You have to specify an input file" *in*))

   (if (not (string? *out*))
	   (set! *out* (string-append (basename (prefix *in*)) ".scm")))
   (set! *pout* (open-output-file *out*))
   (if (not (output-port? *pout*))
	   (error "start-io!" "Can't open file" *out*)))

;*---------------------------------------------------------------------*/
;*    close-io! ...                                                    */
;*---------------------------------------------------------------------*/
(define (close-io!)
   (if (and (string? *in*) (input-port? *pin*))
       (close-input-port *pin*))
   (if (and (string? *out*) (output-port? *pout*))
       (close-output-port *pout*)))

;*---------------------------------------------------------------------*/
;*    read-afile! ...                                                  */
;*---------------------------------------------------------------------*/
(define (readf x)
  (let ((port (open-input-file x)))
	(if (not (input-port? port))
		(error "camloo" "can't open `a file'" x)
		(begin
		  (set! *module-alist* (read port))
		  (close-input-port port)
		  'done))))

(define (read-afile!)
  (if (string? *afile*)
	  (if (file-exists? *afile*)
		  (readf *afile*)
		  (error "camloo" "can't find `a file'" *afile*))
	  (if (file-exists? ".afile")
		  (begin
			(set! *afile* ".afile")
			(readf *afile*))
		  (set! *module-alist* `( (,*module-symb* ,*in*) )))))
