;;; -*- mode: Scheme -*-

;;; Copyright 2015 SteelSeries ApS. All rights reserved.
;;; Copyright 2017 Dave Astels. All rights reserved.
;;; Use of this source code is governed by a BSD-style
;;; license that can be found in the LICENSE file.


(define-macro (let bindings . body)
  `((lambda ,(map car bindings) ,@body)
	,@(map cadr bindings)))


(define-macro (let* bindings . body)
  (if (nil? bindings)
	  `(begin ,@body)
	  `(let (,(first bindings))
		 (let* ,(cdr bindings) ,@body))))

;;; remove support until I can figure out the compilation
;; (define-macro (letrec bindings . body)
;;   `(let ,(map (lambda (binding)
;; 				(list (car binding) nil))
;; 			  bindings)
;; 	 ,@(map (lambda (binding)
;; 			  `(set! ,@binding))
;; 			bindings)
;; 	 ,@body))
