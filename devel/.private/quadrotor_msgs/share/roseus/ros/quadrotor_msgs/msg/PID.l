;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::PID)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'PID (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::PID")
  (make-package "QUADROTOR_MSGS::PID"))

(in-package "ROS")
;;//! \htmlinclude PID.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass quadrotor_msgs::PID
  :super ros::object
  :slots (_header _proportional_term _integrative_term _derivative_term ))

(defmethod quadrotor_msgs::PID
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:proportional_term __proportional_term) (instance geometry_msgs::Vector3 :init))
    ((:integrative_term __integrative_term) (instance geometry_msgs::Vector3 :init))
    ((:derivative_term __derivative_term) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _proportional_term __proportional_term)
   (setq _integrative_term __integrative_term)
   (setq _derivative_term __derivative_term)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:proportional_term
   (&rest __proportional_term)
   (if (keywordp (car __proportional_term))
       (send* _proportional_term __proportional_term)
     (progn
       (if __proportional_term (setq _proportional_term (car __proportional_term)))
       _proportional_term)))
  (:integrative_term
   (&rest __integrative_term)
   (if (keywordp (car __integrative_term))
       (send* _integrative_term __integrative_term)
     (progn
       (if __integrative_term (setq _integrative_term (car __integrative_term)))
       _integrative_term)))
  (:derivative_term
   (&rest __derivative_term)
   (if (keywordp (car __derivative_term))
       (send* _derivative_term __derivative_term)
     (progn
       (if __derivative_term (setq _derivative_term (car __derivative_term)))
       _derivative_term)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Vector3 _proportional_term
    (send _proportional_term :serialization-length)
    ;; geometry_msgs/Vector3 _integrative_term
    (send _integrative_term :serialization-length)
    ;; geometry_msgs/Vector3 _derivative_term
    (send _derivative_term :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Vector3 _proportional_term
       (send _proportional_term :serialize s)
     ;; geometry_msgs/Vector3 _integrative_term
       (send _integrative_term :serialize s)
     ;; geometry_msgs/Vector3 _derivative_term
       (send _derivative_term :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Vector3 _proportional_term
     (send _proportional_term :deserialize buf ptr-) (incf ptr- (send _proportional_term :serialization-length))
   ;; geometry_msgs/Vector3 _integrative_term
     (send _integrative_term :deserialize buf ptr-) (incf ptr- (send _integrative_term :serialization-length))
   ;; geometry_msgs/Vector3 _derivative_term
     (send _derivative_term :deserialize buf ptr-) (incf ptr- (send _derivative_term :serialization-length))
   ;;
   self)
  )

(setf (get quadrotor_msgs::PID :md5sum-) "2e215d204eed4067287363f18b2c8af2")
(setf (get quadrotor_msgs::PID :datatype-) "quadrotor_msgs/PID")
(setf (get quadrotor_msgs::PID :definition-)
      "Header header

geometry_msgs/Vector3 proportional_term
geometry_msgs/Vector3 integrative_term
geometry_msgs/Vector3 derivative_term
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :quadrotor_msgs/PID "2e215d204eed4067287363f18b2c8af2")


