
(cl:in-package :asdf)

(defsystem "force_sensor-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "resetBias" :depends-on ("_package_resetBias"))
    (:file "_package_resetBias" :depends-on ("_package"))
  ))