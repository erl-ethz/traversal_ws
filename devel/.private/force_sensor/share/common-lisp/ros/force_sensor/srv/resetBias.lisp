; Auto-generated. Do not edit!


(cl:in-package force_sensor-srv)


;//! \htmlinclude resetBias-request.msg.html

(cl:defclass <resetBias-request> (roslisp-msg-protocol:ros-message)
  ((reset_bias_request
    :reader reset_bias_request
    :initarg :reset_bias_request
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass resetBias-request (<resetBias-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <resetBias-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'resetBias-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name force_sensor-srv:<resetBias-request> is deprecated: use force_sensor-srv:resetBias-request instead.")))

(cl:ensure-generic-function 'reset_bias_request-val :lambda-list '(m))
(cl:defmethod reset_bias_request-val ((m <resetBias-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader force_sensor-srv:reset_bias_request-val is deprecated.  Use force_sensor-srv:reset_bias_request instead.")
  (reset_bias_request m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <resetBias-request>) ostream)
  "Serializes a message object of type '<resetBias-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reset_bias_request) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <resetBias-request>) istream)
  "Deserializes a message object of type '<resetBias-request>"
    (cl:setf (cl:slot-value msg 'reset_bias_request) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<resetBias-request>)))
  "Returns string type for a service object of type '<resetBias-request>"
  "force_sensor/resetBiasRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resetBias-request)))
  "Returns string type for a service object of type 'resetBias-request"
  "force_sensor/resetBiasRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<resetBias-request>)))
  "Returns md5sum for a message object of type '<resetBias-request>"
  "746b7f4e281851ca839750a1bcfc846b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resetBias-request)))
  "Returns md5sum for a message object of type 'resetBias-request"
  "746b7f4e281851ca839750a1bcfc846b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resetBias-request>)))
  "Returns full string definition for message of type '<resetBias-request>"
  (cl:format cl:nil "bool reset_bias_request~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resetBias-request)))
  "Returns full string definition for message of type 'resetBias-request"
  (cl:format cl:nil "bool reset_bias_request~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <resetBias-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <resetBias-request>))
  "Converts a ROS message object to a list"
  (cl:list 'resetBias-request
    (cl:cons ':reset_bias_request (reset_bias_request msg))
))
;//! \htmlinclude resetBias-response.msg.html

(cl:defclass <resetBias-response> (roslisp-msg-protocol:ros-message)
  ((reset_bias_response
    :reader reset_bias_response
    :initarg :reset_bias_response
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass resetBias-response (<resetBias-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <resetBias-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'resetBias-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name force_sensor-srv:<resetBias-response> is deprecated: use force_sensor-srv:resetBias-response instead.")))

(cl:ensure-generic-function 'reset_bias_response-val :lambda-list '(m))
(cl:defmethod reset_bias_response-val ((m <resetBias-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader force_sensor-srv:reset_bias_response-val is deprecated.  Use force_sensor-srv:reset_bias_response instead.")
  (reset_bias_response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <resetBias-response>) ostream)
  "Serializes a message object of type '<resetBias-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reset_bias_response) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <resetBias-response>) istream)
  "Deserializes a message object of type '<resetBias-response>"
    (cl:setf (cl:slot-value msg 'reset_bias_response) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<resetBias-response>)))
  "Returns string type for a service object of type '<resetBias-response>"
  "force_sensor/resetBiasResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resetBias-response)))
  "Returns string type for a service object of type 'resetBias-response"
  "force_sensor/resetBiasResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<resetBias-response>)))
  "Returns md5sum for a message object of type '<resetBias-response>"
  "746b7f4e281851ca839750a1bcfc846b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'resetBias-response)))
  "Returns md5sum for a message object of type 'resetBias-response"
  "746b7f4e281851ca839750a1bcfc846b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<resetBias-response>)))
  "Returns full string definition for message of type '<resetBias-response>"
  (cl:format cl:nil "bool reset_bias_response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'resetBias-response)))
  "Returns full string definition for message of type 'resetBias-response"
  (cl:format cl:nil "bool reset_bias_response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <resetBias-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <resetBias-response>))
  "Converts a ROS message object to a list"
  (cl:list 'resetBias-response
    (cl:cons ':reset_bias_response (reset_bias_response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'resetBias)))
  'resetBias-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'resetBias)))
  'resetBias-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'resetBias)))
  "Returns string type for a service object of type '<resetBias>"
  "force_sensor/resetBias")