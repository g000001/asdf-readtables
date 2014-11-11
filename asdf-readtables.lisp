;;;; asdf-readtables -*- Mode: Lisp;-*- 


(cl:in-package :asdf-readtables.internal)


(defclass system/readtable (asdf:system)
  ((readtable :initform :standard :initarg :readtable :accessor system-readtable)))


(defmethod find-system-default-readtable ((system system))
  *readtable*)


(defmethod find-system-default-readtable ((system system/readtable))
  (funcall (intern (string '#:find-readtable) (string '#:named-readtables))
           (system-readtable (find-system system))))


(defmethod asdf:perform :around ((operation asdf:load-op) (file asdf:cl-source-file))
  (let ((*readtable* (find-system-default-readtable (component-parent file))))
    (call-next-method)))


(defmethod asdf:perform :around ((operation asdf:compile-op) (file asdf:cl-source-file))
  (let ((*readtable* (find-system-default-readtable (component-parent file))))
    (call-next-method)))


(defmethod change-class :after ((system system)
                                (class (eql (find-class 'asdf-readtables:system/readtable)))
                                &key &allow-other-keys)
  (load-system system :force t))


(defmethod change-class :after ((system system)
                                (class (eql (find-class 'asdf:system))) &key &allow-other-keys)
  (load-system system :force t))


(defmacro defsystem/readtable (name &body body)
  `(defsystem ,name
     :defsystem-depends-on (:named-readtables)
     :class system/readtable
     ,@body))


;;; *EOF*
