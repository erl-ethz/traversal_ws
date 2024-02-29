; Auto-generated. Do not edit!


(cl:in-package mpc-msg)


;//! \htmlinclude MpcLog.msg.html

(cl:defclass <MpcLog> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (velocity
    :reader velocity
    :initarg :velocity
    :type geometry_msgs-msg:Twist
    :initform (cl:make-instance 'geometry_msgs-msg:Twist))
   (control_command_mpc
    :reader control_command_mpc
    :initarg :control_command_mpc
    :type quadrotor_msgs-msg:ControlCommand
    :initform (cl:make-instance 'quadrotor_msgs-msg:ControlCommand))
   (horizon_trajectory
    :reader horizon_trajectory
    :initarg :horizon_trajectory
    :type quadrotor_msgs-msg:Trajectory
    :initform (cl:make-instance 'quadrotor_msgs-msg:Trajectory))
   (execution_time
    :reader execution_time
    :initarg :execution_time
    :type cl:float
    :initform 0.0)
   (preparation_time
    :reader preparation_time
    :initarg :preparation_time
    :type cl:float
    :initform 0.0)
   (objective_function_value
    :reader objective_function_value
    :initarg :objective_function_value
    :type cl:float
    :initform 0.0)
   (kkt_value
    :reader kkt_value
    :initarg :kkt_value
    :type cl:float
    :initform 0.0)
   (solver_status
    :reader solver_status
    :initarg :solver_status
    :type cl:fixnum
    :initform 0)
   (external_wrench
    :reader external_wrench
    :initarg :external_wrench
    :type geometry_msgs-msg:Wrench
    :initform (cl:make-instance 'geometry_msgs-msg:Wrench))
   (interaction
    :reader interaction
    :initarg :interaction
    :type cl:boolean
    :initform cl:nil)
   (sliding_x
    :reader sliding_x
    :initarg :sliding_x
    :type cl:boolean
    :initform cl:nil)
   (sliding_y
    :reader sliding_y
    :initarg :sliding_y
    :type cl:boolean
    :initform cl:nil)
   (sliding_yaw
    :reader sliding_yaw
    :initarg :sliding_yaw
    :type cl:boolean
    :initform cl:nil)
   (interaction_reference_velocity
    :reader interaction_reference_velocity
    :initarg :interaction_reference_velocity
    :type geometry_msgs-msg:Twist
    :initform (cl:make-instance 'geometry_msgs-msg:Twist)))
)

(cl:defclass MpcLog (<MpcLog>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MpcLog>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MpcLog)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mpc-msg:<MpcLog> is deprecated: use mpc-msg:MpcLog instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MpcLog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpc-msg:header-val is deprecated.  Use mpc-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <MpcLog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpc-msg:pose-val is deprecated.  Use mpc-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <MpcLog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpc-msg:velocity-val is deprecated.  Use mpc-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'control_command_mpc-val :lambda-list '(m))
(cl:defmethod control_command_mpc-val ((m <MpcLog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpc-msg:control_command_mpc-val is deprecated.  Use mpc-msg:control_command_mpc instead.")
  (control_command_mpc m))

(cl:ensure-generic-function 'horizon_trajectory-val :lambda-list '(m))
(cl:defmethod horizon_trajectory-val ((m <MpcLog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpc-msg:horizon_trajectory-val is deprecated.  Use mpc-msg:horizon_trajectory instead.")
  (horizon_trajectory m))

(cl:ensure-generic-function 'execution_time-val :lambda-list '(m))
(cl:defmethod execution_time-val ((m <MpcLog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpc-msg:execution_time-val is deprecated.  Use mpc-msg:execution_time instead.")
  (execution_time m))

(cl:ensure-generic-function 'preparation_time-val :lambda-list '(m))
(cl:defmethod preparation_time-val ((m <MpcLog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpc-msg:preparation_time-val is deprecated.  Use mpc-msg:preparation_time instead.")
  (preparation_time m))

(cl:ensure-generic-function 'objective_function_value-val :lambda-list '(m))
(cl:defmethod objective_function_value-val ((m <MpcLog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpc-msg:objective_function_value-val is deprecated.  Use mpc-msg:objective_function_value instead.")
  (objective_function_value m))

(cl:ensure-generic-function 'kkt_value-val :lambda-list '(m))
(cl:defmethod kkt_value-val ((m <MpcLog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpc-msg:kkt_value-val is deprecated.  Use mpc-msg:kkt_value instead.")
  (kkt_value m))

(cl:ensure-generic-function 'solver_status-val :lambda-list '(m))
(cl:defmethod solver_status-val ((m <MpcLog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpc-msg:solver_status-val is deprecated.  Use mpc-msg:solver_status instead.")
  (solver_status m))

(cl:ensure-generic-function 'external_wrench-val :lambda-list '(m))
(cl:defmethod external_wrench-val ((m <MpcLog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpc-msg:external_wrench-val is deprecated.  Use mpc-msg:external_wrench instead.")
  (external_wrench m))

(cl:ensure-generic-function 'interaction-val :lambda-list '(m))
(cl:defmethod interaction-val ((m <MpcLog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpc-msg:interaction-val is deprecated.  Use mpc-msg:interaction instead.")
  (interaction m))

(cl:ensure-generic-function 'sliding_x-val :lambda-list '(m))
(cl:defmethod sliding_x-val ((m <MpcLog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpc-msg:sliding_x-val is deprecated.  Use mpc-msg:sliding_x instead.")
  (sliding_x m))

(cl:ensure-generic-function 'sliding_y-val :lambda-list '(m))
(cl:defmethod sliding_y-val ((m <MpcLog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpc-msg:sliding_y-val is deprecated.  Use mpc-msg:sliding_y instead.")
  (sliding_y m))

(cl:ensure-generic-function 'sliding_yaw-val :lambda-list '(m))
(cl:defmethod sliding_yaw-val ((m <MpcLog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpc-msg:sliding_yaw-val is deprecated.  Use mpc-msg:sliding_yaw instead.")
  (sliding_yaw m))

(cl:ensure-generic-function 'interaction_reference_velocity-val :lambda-list '(m))
(cl:defmethod interaction_reference_velocity-val ((m <MpcLog>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mpc-msg:interaction_reference_velocity-val is deprecated.  Use mpc-msg:interaction_reference_velocity instead.")
  (interaction_reference_velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MpcLog>) ostream)
  "Serializes a message object of type '<MpcLog>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'velocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'control_command_mpc) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'horizon_trajectory) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'execution_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'preparation_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'objective_function_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'kkt_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'solver_status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'external_wrench) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'interaction) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'sliding_x) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'sliding_y) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'sliding_yaw) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'interaction_reference_velocity) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MpcLog>) istream)
  "Deserializes a message object of type '<MpcLog>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'velocity) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'control_command_mpc) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'horizon_trajectory) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'execution_time) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'preparation_time) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'objective_function_value) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'kkt_value) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'solver_status) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'external_wrench) istream)
    (cl:setf (cl:slot-value msg 'interaction) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'sliding_x) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'sliding_y) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'sliding_yaw) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'interaction_reference_velocity) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MpcLog>)))
  "Returns string type for a message object of type '<MpcLog>"
  "mpc/MpcLog")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MpcLog)))
  "Returns string type for a message object of type 'MpcLog"
  "mpc/MpcLog")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MpcLog>)))
  "Returns md5sum for a message object of type '<MpcLog>"
  "725215538d96af0b0ca24a15333c8b19")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MpcLog)))
  "Returns md5sum for a message object of type 'MpcLog"
  "725215538d96af0b0ca24a15333c8b19")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MpcLog>)))
  "Returns full string definition for message of type '<MpcLog>"
  (cl:format cl:nil "Header header~%~%geometry_msgs/Pose  pose~%geometry_msgs/Twist   velocity~%quadrotor_msgs/ControlCommand   control_command_mpc~%quadrotor_msgs/Trajectory  horizon_trajectory~%float64   execution_time~%float64   preparation_time~%float64   objective_function_value~%float64   kkt_value~%int8      solver_status~%geometry_msgs/Wrench    external_wrench~%bool      interaction~%bool      sliding_x~%bool      sliding_y~%bool      sliding_yaw~%geometry_msgs/Twist   interaction_reference_velocity~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: quadrotor_msgs/ControlCommand~%# Quadrotor control command~%~%# control mode enums~%uint8 NONE=0~%uint8 ATTITUDE=1~%uint8 BODY_RATES=2~%uint8 ANGULAR_ACCELERATIONS=3~%uint8 ROTOR_THRUSTS=4~%~%Header header~%~%# Control mode as defined above~%uint8 control_mode~%~%# Flag whether controller is allowed to arm~%bool armed~%~%# Time at which this command should be executed~%time expected_execution_time~%~%# Orientation of the body frame with respect to the world frame [-]~%geometry_msgs/Quaternion orientation~%~%# Body rates in body frame [rad/s]~%# Note that in ATTITUDE mode the x-y-bodyrates are only feed forward terms ~%# computed from a reference trajectory~%# Also in ATTITUDE mode, the z-bodyrate has to be from feedback control~%geometry_msgs/Vector3 bodyrates~%~%# Angular accelerations in body frame [rad/s^2]~%geometry_msgs/Vector3 angular_accelerations~%~%# Torques~%geometry_msgs/Vector3 torque~%~%# Collective mass normalized thrust [m/s^2]~%float64 collective_thrust~%~%# Single rotor thrusts [N]~%# These are only considered in the ROTOR_THRUSTS control mode~%float64[] rotor_thrusts~%~%================================================================================~%MSG: quadrotor_msgs/Trajectory~%# Trajectory type enums~%~%# Undefined trajectory type~%uint8 UNDEFINED=0~%~%# General trajectory type that considers orientation from the pose and~%# neglects heading values~%uint8 GENERAL=1~%~%# Trajectory types that compute orientation from acceleration and heading~%# values and consider derivatives up to what is indicated by the name~%uint8 ACCELERATION=2~%uint8 JERK=3~%uint8 SNAP=4~%~%Header header~%~%# Trajectory type as defined above~%uint8 type~%~%quadrotor_msgs/TrajectoryPoint[] points~%~%================================================================================~%MSG: quadrotor_msgs/TrajectoryPoint~%duration time_from_start~%~%geometry_msgs/Pose pose~%~%geometry_msgs/Twist velocity~%~%geometry_msgs/Twist acceleration~%~%geometry_msgs/Twist jerk~%~%geometry_msgs/Twist snap~%~%# Heading angle with respect to world frame [rad]~%float64 heading~%~%# First derivative of the heading angle [rad/s]~%float64 heading_rate~%~%# Second derivative of the heading angle [rad/s^2]~%float64 heading_acceleration~%~%================================================================================~%MSG: geometry_msgs/Wrench~%# This represents force in free space, separated into~%# its linear and angular parts.~%Vector3  force~%Vector3  torque~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MpcLog)))
  "Returns full string definition for message of type 'MpcLog"
  (cl:format cl:nil "Header header~%~%geometry_msgs/Pose  pose~%geometry_msgs/Twist   velocity~%quadrotor_msgs/ControlCommand   control_command_mpc~%quadrotor_msgs/Trajectory  horizon_trajectory~%float64   execution_time~%float64   preparation_time~%float64   objective_function_value~%float64   kkt_value~%int8      solver_status~%geometry_msgs/Wrench    external_wrench~%bool      interaction~%bool      sliding_x~%bool      sliding_y~%bool      sliding_yaw~%geometry_msgs/Twist   interaction_reference_velocity~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: quadrotor_msgs/ControlCommand~%# Quadrotor control command~%~%# control mode enums~%uint8 NONE=0~%uint8 ATTITUDE=1~%uint8 BODY_RATES=2~%uint8 ANGULAR_ACCELERATIONS=3~%uint8 ROTOR_THRUSTS=4~%~%Header header~%~%# Control mode as defined above~%uint8 control_mode~%~%# Flag whether controller is allowed to arm~%bool armed~%~%# Time at which this command should be executed~%time expected_execution_time~%~%# Orientation of the body frame with respect to the world frame [-]~%geometry_msgs/Quaternion orientation~%~%# Body rates in body frame [rad/s]~%# Note that in ATTITUDE mode the x-y-bodyrates are only feed forward terms ~%# computed from a reference trajectory~%# Also in ATTITUDE mode, the z-bodyrate has to be from feedback control~%geometry_msgs/Vector3 bodyrates~%~%# Angular accelerations in body frame [rad/s^2]~%geometry_msgs/Vector3 angular_accelerations~%~%# Torques~%geometry_msgs/Vector3 torque~%~%# Collective mass normalized thrust [m/s^2]~%float64 collective_thrust~%~%# Single rotor thrusts [N]~%# These are only considered in the ROTOR_THRUSTS control mode~%float64[] rotor_thrusts~%~%================================================================================~%MSG: quadrotor_msgs/Trajectory~%# Trajectory type enums~%~%# Undefined trajectory type~%uint8 UNDEFINED=0~%~%# General trajectory type that considers orientation from the pose and~%# neglects heading values~%uint8 GENERAL=1~%~%# Trajectory types that compute orientation from acceleration and heading~%# values and consider derivatives up to what is indicated by the name~%uint8 ACCELERATION=2~%uint8 JERK=3~%uint8 SNAP=4~%~%Header header~%~%# Trajectory type as defined above~%uint8 type~%~%quadrotor_msgs/TrajectoryPoint[] points~%~%================================================================================~%MSG: quadrotor_msgs/TrajectoryPoint~%duration time_from_start~%~%geometry_msgs/Pose pose~%~%geometry_msgs/Twist velocity~%~%geometry_msgs/Twist acceleration~%~%geometry_msgs/Twist jerk~%~%geometry_msgs/Twist snap~%~%# Heading angle with respect to world frame [rad]~%float64 heading~%~%# First derivative of the heading angle [rad/s]~%float64 heading_rate~%~%# Second derivative of the heading angle [rad/s^2]~%float64 heading_acceleration~%~%================================================================================~%MSG: geometry_msgs/Wrench~%# This represents force in free space, separated into~%# its linear and angular parts.~%Vector3  force~%Vector3  torque~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MpcLog>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'control_command_mpc))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'horizon_trajectory))
     8
     8
     8
     8
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'external_wrench))
     1
     1
     1
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'interaction_reference_velocity))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MpcLog>))
  "Converts a ROS message object to a list"
  (cl:list 'MpcLog
    (cl:cons ':header (header msg))
    (cl:cons ':pose (pose msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':control_command_mpc (control_command_mpc msg))
    (cl:cons ':horizon_trajectory (horizon_trajectory msg))
    (cl:cons ':execution_time (execution_time msg))
    (cl:cons ':preparation_time (preparation_time msg))
    (cl:cons ':objective_function_value (objective_function_value msg))
    (cl:cons ':kkt_value (kkt_value msg))
    (cl:cons ':solver_status (solver_status msg))
    (cl:cons ':external_wrench (external_wrench msg))
    (cl:cons ':interaction (interaction msg))
    (cl:cons ':sliding_x (sliding_x msg))
    (cl:cons ':sliding_y (sliding_y msg))
    (cl:cons ':sliding_yaw (sliding_yaw msg))
    (cl:cons ':interaction_reference_velocity (interaction_reference_velocity msg))
))
