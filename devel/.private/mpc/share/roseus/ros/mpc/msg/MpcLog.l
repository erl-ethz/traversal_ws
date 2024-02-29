;; Auto-generated. Do not edit!


(when (boundp 'mpc::MpcLog)
  (if (not (find-package "MPC"))
    (make-package "MPC"))
  (shadow 'MpcLog (find-package "MPC")))
(unless (find-package "MPC::MPCLOG")
  (make-package "MPC::MPCLOG"))

(in-package "ROS")
;;//! \htmlinclude MpcLog.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "QUADROTOR_MSGS"))
  (ros::roseus-add-msgs "quadrotor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass mpc::MpcLog
  :super ros::object
  :slots (_header _pose _velocity _control_command_mpc _horizon_trajectory _execution_time _preparation_time _objective_function_value _kkt_value _solver_status _external_wrench _interaction _sliding_x _sliding_y _sliding_yaw _interaction_reference_velocity ))

(defmethod mpc::MpcLog
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:velocity __velocity) (instance geometry_msgs::Twist :init))
    ((:control_command_mpc __control_command_mpc) (instance quadrotor_msgs::ControlCommand :init))
    ((:horizon_trajectory __horizon_trajectory) (instance quadrotor_msgs::Trajectory :init))
    ((:execution_time __execution_time) 0.0)
    ((:preparation_time __preparation_time) 0.0)
    ((:objective_function_value __objective_function_value) 0.0)
    ((:kkt_value __kkt_value) 0.0)
    ((:solver_status __solver_status) 0)
    ((:external_wrench __external_wrench) (instance geometry_msgs::Wrench :init))
    ((:interaction __interaction) nil)
    ((:sliding_x __sliding_x) nil)
    ((:sliding_y __sliding_y) nil)
    ((:sliding_yaw __sliding_yaw) nil)
    ((:interaction_reference_velocity __interaction_reference_velocity) (instance geometry_msgs::Twist :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _pose __pose)
   (setq _velocity __velocity)
   (setq _control_command_mpc __control_command_mpc)
   (setq _horizon_trajectory __horizon_trajectory)
   (setq _execution_time (float __execution_time))
   (setq _preparation_time (float __preparation_time))
   (setq _objective_function_value (float __objective_function_value))
   (setq _kkt_value (float __kkt_value))
   (setq _solver_status (round __solver_status))
   (setq _external_wrench __external_wrench)
   (setq _interaction __interaction)
   (setq _sliding_x __sliding_x)
   (setq _sliding_y __sliding_y)
   (setq _sliding_yaw __sliding_yaw)
   (setq _interaction_reference_velocity __interaction_reference_velocity)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:control_command_mpc
   (&rest __control_command_mpc)
   (if (keywordp (car __control_command_mpc))
       (send* _control_command_mpc __control_command_mpc)
     (progn
       (if __control_command_mpc (setq _control_command_mpc (car __control_command_mpc)))
       _control_command_mpc)))
  (:horizon_trajectory
   (&rest __horizon_trajectory)
   (if (keywordp (car __horizon_trajectory))
       (send* _horizon_trajectory __horizon_trajectory)
     (progn
       (if __horizon_trajectory (setq _horizon_trajectory (car __horizon_trajectory)))
       _horizon_trajectory)))
  (:execution_time
   (&optional __execution_time)
   (if __execution_time (setq _execution_time __execution_time)) _execution_time)
  (:preparation_time
   (&optional __preparation_time)
   (if __preparation_time (setq _preparation_time __preparation_time)) _preparation_time)
  (:objective_function_value
   (&optional __objective_function_value)
   (if __objective_function_value (setq _objective_function_value __objective_function_value)) _objective_function_value)
  (:kkt_value
   (&optional __kkt_value)
   (if __kkt_value (setq _kkt_value __kkt_value)) _kkt_value)
  (:solver_status
   (&optional __solver_status)
   (if __solver_status (setq _solver_status __solver_status)) _solver_status)
  (:external_wrench
   (&rest __external_wrench)
   (if (keywordp (car __external_wrench))
       (send* _external_wrench __external_wrench)
     (progn
       (if __external_wrench (setq _external_wrench (car __external_wrench)))
       _external_wrench)))
  (:interaction
   (&optional (__interaction :null))
   (if (not (eq __interaction :null)) (setq _interaction __interaction)) _interaction)
  (:sliding_x
   (&optional (__sliding_x :null))
   (if (not (eq __sliding_x :null)) (setq _sliding_x __sliding_x)) _sliding_x)
  (:sliding_y
   (&optional (__sliding_y :null))
   (if (not (eq __sliding_y :null)) (setq _sliding_y __sliding_y)) _sliding_y)
  (:sliding_yaw
   (&optional (__sliding_yaw :null))
   (if (not (eq __sliding_yaw :null)) (setq _sliding_yaw __sliding_yaw)) _sliding_yaw)
  (:interaction_reference_velocity
   (&rest __interaction_reference_velocity)
   (if (keywordp (car __interaction_reference_velocity))
       (send* _interaction_reference_velocity __interaction_reference_velocity)
     (progn
       (if __interaction_reference_velocity (setq _interaction_reference_velocity (car __interaction_reference_velocity)))
       _interaction_reference_velocity)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; geometry_msgs/Twist _velocity
    (send _velocity :serialization-length)
    ;; quadrotor_msgs/ControlCommand _control_command_mpc
    (send _control_command_mpc :serialization-length)
    ;; quadrotor_msgs/Trajectory _horizon_trajectory
    (send _horizon_trajectory :serialization-length)
    ;; float64 _execution_time
    8
    ;; float64 _preparation_time
    8
    ;; float64 _objective_function_value
    8
    ;; float64 _kkt_value
    8
    ;; int8 _solver_status
    1
    ;; geometry_msgs/Wrench _external_wrench
    (send _external_wrench :serialization-length)
    ;; bool _interaction
    1
    ;; bool _sliding_x
    1
    ;; bool _sliding_y
    1
    ;; bool _sliding_yaw
    1
    ;; geometry_msgs/Twist _interaction_reference_velocity
    (send _interaction_reference_velocity :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; geometry_msgs/Twist _velocity
       (send _velocity :serialize s)
     ;; quadrotor_msgs/ControlCommand _control_command_mpc
       (send _control_command_mpc :serialize s)
     ;; quadrotor_msgs/Trajectory _horizon_trajectory
       (send _horizon_trajectory :serialize s)
     ;; float64 _execution_time
       (sys::poke _execution_time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _preparation_time
       (sys::poke _preparation_time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _objective_function_value
       (sys::poke _objective_function_value (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _kkt_value
       (sys::poke _kkt_value (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int8 _solver_status
       (write-byte _solver_status s)
     ;; geometry_msgs/Wrench _external_wrench
       (send _external_wrench :serialize s)
     ;; bool _interaction
       (if _interaction (write-byte -1 s) (write-byte 0 s))
     ;; bool _sliding_x
       (if _sliding_x (write-byte -1 s) (write-byte 0 s))
     ;; bool _sliding_y
       (if _sliding_y (write-byte -1 s) (write-byte 0 s))
     ;; bool _sliding_yaw
       (if _sliding_yaw (write-byte -1 s) (write-byte 0 s))
     ;; geometry_msgs/Twist _interaction_reference_velocity
       (send _interaction_reference_velocity :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; geometry_msgs/Twist _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;; quadrotor_msgs/ControlCommand _control_command_mpc
     (send _control_command_mpc :deserialize buf ptr-) (incf ptr- (send _control_command_mpc :serialization-length))
   ;; quadrotor_msgs/Trajectory _horizon_trajectory
     (send _horizon_trajectory :deserialize buf ptr-) (incf ptr- (send _horizon_trajectory :serialization-length))
   ;; float64 _execution_time
     (setq _execution_time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _preparation_time
     (setq _preparation_time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _objective_function_value
     (setq _objective_function_value (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _kkt_value
     (setq _kkt_value (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int8 _solver_status
     (setq _solver_status (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _solver_status 127) (setq _solver_status (- _solver_status 256)))
   ;; geometry_msgs/Wrench _external_wrench
     (send _external_wrench :deserialize buf ptr-) (incf ptr- (send _external_wrench :serialization-length))
   ;; bool _interaction
     (setq _interaction (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _sliding_x
     (setq _sliding_x (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _sliding_y
     (setq _sliding_y (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _sliding_yaw
     (setq _sliding_yaw (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; geometry_msgs/Twist _interaction_reference_velocity
     (send _interaction_reference_velocity :deserialize buf ptr-) (incf ptr- (send _interaction_reference_velocity :serialization-length))
   ;;
   self)
  )

(setf (get mpc::MpcLog :md5sum-) "725215538d96af0b0ca24a15333c8b19")
(setf (get mpc::MpcLog :datatype-) "mpc/MpcLog")
(setf (get mpc::MpcLog :definition-)
      "Header header

geometry_msgs/Pose  pose
geometry_msgs/Twist   velocity
quadrotor_msgs/ControlCommand   control_command_mpc
quadrotor_msgs/Trajectory  horizon_trajectory
float64   execution_time
float64   preparation_time
float64   objective_function_value
float64   kkt_value
int8      solver_status
geometry_msgs/Wrench    external_wrench
bool      interaction
bool      sliding_x
bool      sliding_y
bool      sliding_yaw
geometry_msgs/Twist   interaction_reference_velocity

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
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

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
================================================================================
MSG: quadrotor_msgs/ControlCommand
# Quadrotor control command

# control mode enums
uint8 NONE=0
uint8 ATTITUDE=1
uint8 BODY_RATES=2
uint8 ANGULAR_ACCELERATIONS=3
uint8 ROTOR_THRUSTS=4

Header header

# Control mode as defined above
uint8 control_mode

# Flag whether controller is allowed to arm
bool armed

# Time at which this command should be executed
time expected_execution_time

# Orientation of the body frame with respect to the world frame [-]
geometry_msgs/Quaternion orientation

# Body rates in body frame [rad/s]
# Note that in ATTITUDE mode the x-y-bodyrates are only feed forward terms 
# computed from a reference trajectory
# Also in ATTITUDE mode, the z-bodyrate has to be from feedback control
geometry_msgs/Vector3 bodyrates

# Angular accelerations in body frame [rad/s^2]
geometry_msgs/Vector3 angular_accelerations

# Torques
geometry_msgs/Vector3 torque

# Collective mass normalized thrust [m/s^2]
float64 collective_thrust

# Single rotor thrusts [N]
# These are only considered in the ROTOR_THRUSTS control mode
float64[] rotor_thrusts

================================================================================
MSG: quadrotor_msgs/Trajectory
# Trajectory type enums

# Undefined trajectory type
uint8 UNDEFINED=0

# General trajectory type that considers orientation from the pose and
# neglects heading values
uint8 GENERAL=1

# Trajectory types that compute orientation from acceleration and heading
# values and consider derivatives up to what is indicated by the name
uint8 ACCELERATION=2
uint8 JERK=3
uint8 SNAP=4

Header header

# Trajectory type as defined above
uint8 type

quadrotor_msgs/TrajectoryPoint[] points

================================================================================
MSG: quadrotor_msgs/TrajectoryPoint
duration time_from_start

geometry_msgs/Pose pose

geometry_msgs/Twist velocity

geometry_msgs/Twist acceleration

geometry_msgs/Twist jerk

geometry_msgs/Twist snap

# Heading angle with respect to world frame [rad]
float64 heading

# First derivative of the heading angle [rad/s]
float64 heading_rate

# Second derivative of the heading angle [rad/s^2]
float64 heading_acceleration

================================================================================
MSG: geometry_msgs/Wrench
# This represents force in free space, separated into
# its linear and angular parts.
Vector3  force
Vector3  torque

")



(provide :mpc/MpcLog "725215538d96af0b0ca24a15333c8b19")


