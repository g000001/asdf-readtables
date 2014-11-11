;;;; defsystem-with-readtable.asd -*- Mode: Lisp;-*- 

(cl:in-package :asdf)


(defsystem :asdf-readtables
  :serial t
  :depends-on (:fiveam
               :named-readtables
               :asdf)
  :components ((:file "package")
               (:file "asdf-readtables")
               #|(:file "test")|#))


#|(defmethod perform ((o test-op) (c (eql (find-system :asdf-readtables))))
  (load-system :asdf-readtables)
  (or (flet (($ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
        (let ((result (funcall ($ :fiveam :run) ($ :asdf-readtables.internal :asdf-readtables))))
          (funcall ($ :fiveam :explain!) result)
          (funcall ($ :fiveam :results-status) result)))
      (error "test-op failed") ))|#


;;; *EOF*
