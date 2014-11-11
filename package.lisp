;;;; package.lisp -*- Mode: Lisp;-*- 

#|(cl:in-package :cl-user)|#


(defpackage :asdf-readtables
  (:use)
  (:export :system/readtable
           :find-system-default-readtable
           :system-readtable
           :defsystem/readtable))


(defpackage :asdf-readtables.internal
  (:use :asdf-readtables :cl :named-readtables :asdf))

