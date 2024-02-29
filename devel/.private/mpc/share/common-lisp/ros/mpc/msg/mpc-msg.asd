
(cl:in-package :asdf)

(defsystem "mpc-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :quadrotor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "MpcLog" :depends-on ("_package_MpcLog"))
    (:file "_package_MpcLog" :depends-on ("_package"))
  ))