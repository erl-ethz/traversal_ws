; Auto-generated. Do not edit!


(cl:in-package quadrotor_msgs-msg)


;//! \htmlinclude PID.msg.html

(cl:defclass <PID> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (proportional_term
    :reader proportional_term
    :initarg :proportional_term
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (integrative_term
    :reader integrative_term
    :initarg :integrative_term
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (derivative_term
    :reader derivative_term
    :initarg :derivative_term
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass PID (<PID>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PID>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PID)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name quadrotor_msgs-msg:<PID> is deprecated: use quadrotor_msgs-msg:PID instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PID>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:header-val is deprecated.  Use quadrotor_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'proportional_term-val :lambda-list '(m))
(cl:defmethod proportional_term-val ((m <PID>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:proportional_term-val is deprecated.  Use quadrotor_msgs-msg:proportional_term instead.")
  (proportional_term m))

(cl:ensure-generic-function 'integrative_term-val :lambda-list '(m))
(cl:defmethod integrative_term-val ((m <PID>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:integrative_term-val is deprecated.  Use quadrotor_msgs-msg:integrative_term instead.")
  (integrative_term m))

(cl:ensure-generic-function 'derivative_term-val :lambda-list '(m))
(cl:defmethod derivative_term-val ((m <PID>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:derivative_term-val is deprecated.  Use quadrotor_msgs-msg:derivative_term instead.")
  (derivative_term m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PID>) ostream)
  "Serializes a message object of type '<PID>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'proportional_term) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'integrative_term) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'derivative_term) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PID>) istream)
  "Deserializes a message object of type '<PID>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'proportional_term) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'integrative_term) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'derivative_term) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PID>)))
  "Returns string type for a message object of type '<PID>"
  "quadrotor_msgs/PID")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PID)))
  "Returns string type for a message object of type 'PID"
  "quadrotor_msgs/PID")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PID>)))
  "Returns md5sum for a message object of type '<PID>"
  "2e215d204eed4067287363f18b2c8af2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PID)))
  "Returns md5sum for a message object of type 'PID"
  "2e215d204eed4067287363f18b2c8af2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PID>)))
  "Returns full string definition for message of type '<PID>"
  (cl:format cl:nil "Header header~%~%geometry_msgs/Vector3 proportional_term~%geometry_msgs/Vector3 integrative_term~%geometry_msgs/Vector3 derivative_term~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PID)))
  "Returns full string definition for message of type 'PID"
  (cl:format cl:nil "Header header~%~%geometry_msgs/Vector3 proportional_term~%geometry_msgs/Vector3 integrative_term~%geometry_msgs/Vector3 derivative_term~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PID>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'proportional_term))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'integrative_term))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'derivative_term))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PID>))
  "Converts a ROS message object to a list"
  (cl:list 'PID
    (cl:cons ':header (header msg))
    (cl:cons ':proportional_term (proportional_term msg))
    (cl:cons ':integrative_term (integrative_term msg))
    (cl:cons ':derivative_term (derivative_term msg))
))
