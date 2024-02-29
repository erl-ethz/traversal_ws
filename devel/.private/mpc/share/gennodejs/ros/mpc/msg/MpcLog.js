// Auto-generated. Do not edit!

// (in-package mpc.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');
let quadrotor_msgs = _finder('quadrotor_msgs');

//-----------------------------------------------------------

class MpcLog {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.pose = null;
      this.velocity = null;
      this.control_command_mpc = null;
      this.horizon_trajectory = null;
      this.execution_time = null;
      this.preparation_time = null;
      this.objective_function_value = null;
      this.kkt_value = null;
      this.solver_status = null;
      this.external_wrench = null;
      this.interaction = null;
      this.sliding_x = null;
      this.sliding_y = null;
      this.sliding_yaw = null;
      this.interaction_reference_velocity = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = new geometry_msgs.msg.Twist();
      }
      if (initObj.hasOwnProperty('control_command_mpc')) {
        this.control_command_mpc = initObj.control_command_mpc
      }
      else {
        this.control_command_mpc = new quadrotor_msgs.msg.ControlCommand();
      }
      if (initObj.hasOwnProperty('horizon_trajectory')) {
        this.horizon_trajectory = initObj.horizon_trajectory
      }
      else {
        this.horizon_trajectory = new quadrotor_msgs.msg.Trajectory();
      }
      if (initObj.hasOwnProperty('execution_time')) {
        this.execution_time = initObj.execution_time
      }
      else {
        this.execution_time = 0.0;
      }
      if (initObj.hasOwnProperty('preparation_time')) {
        this.preparation_time = initObj.preparation_time
      }
      else {
        this.preparation_time = 0.0;
      }
      if (initObj.hasOwnProperty('objective_function_value')) {
        this.objective_function_value = initObj.objective_function_value
      }
      else {
        this.objective_function_value = 0.0;
      }
      if (initObj.hasOwnProperty('kkt_value')) {
        this.kkt_value = initObj.kkt_value
      }
      else {
        this.kkt_value = 0.0;
      }
      if (initObj.hasOwnProperty('solver_status')) {
        this.solver_status = initObj.solver_status
      }
      else {
        this.solver_status = 0;
      }
      if (initObj.hasOwnProperty('external_wrench')) {
        this.external_wrench = initObj.external_wrench
      }
      else {
        this.external_wrench = new geometry_msgs.msg.Wrench();
      }
      if (initObj.hasOwnProperty('interaction')) {
        this.interaction = initObj.interaction
      }
      else {
        this.interaction = false;
      }
      if (initObj.hasOwnProperty('sliding_x')) {
        this.sliding_x = initObj.sliding_x
      }
      else {
        this.sliding_x = false;
      }
      if (initObj.hasOwnProperty('sliding_y')) {
        this.sliding_y = initObj.sliding_y
      }
      else {
        this.sliding_y = false;
      }
      if (initObj.hasOwnProperty('sliding_yaw')) {
        this.sliding_yaw = initObj.sliding_yaw
      }
      else {
        this.sliding_yaw = false;
      }
      if (initObj.hasOwnProperty('interaction_reference_velocity')) {
        this.interaction_reference_velocity = initObj.interaction_reference_velocity
      }
      else {
        this.interaction_reference_velocity = new geometry_msgs.msg.Twist();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MpcLog
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.pose, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = geometry_msgs.msg.Twist.serialize(obj.velocity, buffer, bufferOffset);
    // Serialize message field [control_command_mpc]
    bufferOffset = quadrotor_msgs.msg.ControlCommand.serialize(obj.control_command_mpc, buffer, bufferOffset);
    // Serialize message field [horizon_trajectory]
    bufferOffset = quadrotor_msgs.msg.Trajectory.serialize(obj.horizon_trajectory, buffer, bufferOffset);
    // Serialize message field [execution_time]
    bufferOffset = _serializer.float64(obj.execution_time, buffer, bufferOffset);
    // Serialize message field [preparation_time]
    bufferOffset = _serializer.float64(obj.preparation_time, buffer, bufferOffset);
    // Serialize message field [objective_function_value]
    bufferOffset = _serializer.float64(obj.objective_function_value, buffer, bufferOffset);
    // Serialize message field [kkt_value]
    bufferOffset = _serializer.float64(obj.kkt_value, buffer, bufferOffset);
    // Serialize message field [solver_status]
    bufferOffset = _serializer.int8(obj.solver_status, buffer, bufferOffset);
    // Serialize message field [external_wrench]
    bufferOffset = geometry_msgs.msg.Wrench.serialize(obj.external_wrench, buffer, bufferOffset);
    // Serialize message field [interaction]
    bufferOffset = _serializer.bool(obj.interaction, buffer, bufferOffset);
    // Serialize message field [sliding_x]
    bufferOffset = _serializer.bool(obj.sliding_x, buffer, bufferOffset);
    // Serialize message field [sliding_y]
    bufferOffset = _serializer.bool(obj.sliding_y, buffer, bufferOffset);
    // Serialize message field [sliding_yaw]
    bufferOffset = _serializer.bool(obj.sliding_yaw, buffer, bufferOffset);
    // Serialize message field [interaction_reference_velocity]
    bufferOffset = geometry_msgs.msg.Twist.serialize(obj.interaction_reference_velocity, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MpcLog
    let len;
    let data = new MpcLog(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [pose]
    data.pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = geometry_msgs.msg.Twist.deserialize(buffer, bufferOffset);
    // Deserialize message field [control_command_mpc]
    data.control_command_mpc = quadrotor_msgs.msg.ControlCommand.deserialize(buffer, bufferOffset);
    // Deserialize message field [horizon_trajectory]
    data.horizon_trajectory = quadrotor_msgs.msg.Trajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [execution_time]
    data.execution_time = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [preparation_time]
    data.preparation_time = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [objective_function_value]
    data.objective_function_value = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [kkt_value]
    data.kkt_value = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [solver_status]
    data.solver_status = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [external_wrench]
    data.external_wrench = geometry_msgs.msg.Wrench.deserialize(buffer, bufferOffset);
    // Deserialize message field [interaction]
    data.interaction = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [sliding_x]
    data.sliding_x = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [sliding_y]
    data.sliding_y = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [sliding_yaw]
    data.sliding_yaw = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [interaction_reference_velocity]
    data.interaction_reference_velocity = geometry_msgs.msg.Twist.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += quadrotor_msgs.msg.ControlCommand.getMessageSize(object.control_command_mpc);
    length += quadrotor_msgs.msg.Trajectory.getMessageSize(object.horizon_trajectory);
    return length + 237;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mpc/MpcLog';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '725215538d96af0b0ca24a15333c8b19';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MpcLog(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.pose !== undefined) {
      resolved.pose = geometry_msgs.msg.Pose.Resolve(msg.pose)
    }
    else {
      resolved.pose = new geometry_msgs.msg.Pose()
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = geometry_msgs.msg.Twist.Resolve(msg.velocity)
    }
    else {
      resolved.velocity = new geometry_msgs.msg.Twist()
    }

    if (msg.control_command_mpc !== undefined) {
      resolved.control_command_mpc = quadrotor_msgs.msg.ControlCommand.Resolve(msg.control_command_mpc)
    }
    else {
      resolved.control_command_mpc = new quadrotor_msgs.msg.ControlCommand()
    }

    if (msg.horizon_trajectory !== undefined) {
      resolved.horizon_trajectory = quadrotor_msgs.msg.Trajectory.Resolve(msg.horizon_trajectory)
    }
    else {
      resolved.horizon_trajectory = new quadrotor_msgs.msg.Trajectory()
    }

    if (msg.execution_time !== undefined) {
      resolved.execution_time = msg.execution_time;
    }
    else {
      resolved.execution_time = 0.0
    }

    if (msg.preparation_time !== undefined) {
      resolved.preparation_time = msg.preparation_time;
    }
    else {
      resolved.preparation_time = 0.0
    }

    if (msg.objective_function_value !== undefined) {
      resolved.objective_function_value = msg.objective_function_value;
    }
    else {
      resolved.objective_function_value = 0.0
    }

    if (msg.kkt_value !== undefined) {
      resolved.kkt_value = msg.kkt_value;
    }
    else {
      resolved.kkt_value = 0.0
    }

    if (msg.solver_status !== undefined) {
      resolved.solver_status = msg.solver_status;
    }
    else {
      resolved.solver_status = 0
    }

    if (msg.external_wrench !== undefined) {
      resolved.external_wrench = geometry_msgs.msg.Wrench.Resolve(msg.external_wrench)
    }
    else {
      resolved.external_wrench = new geometry_msgs.msg.Wrench()
    }

    if (msg.interaction !== undefined) {
      resolved.interaction = msg.interaction;
    }
    else {
      resolved.interaction = false
    }

    if (msg.sliding_x !== undefined) {
      resolved.sliding_x = msg.sliding_x;
    }
    else {
      resolved.sliding_x = false
    }

    if (msg.sliding_y !== undefined) {
      resolved.sliding_y = msg.sliding_y;
    }
    else {
      resolved.sliding_y = false
    }

    if (msg.sliding_yaw !== undefined) {
      resolved.sliding_yaw = msg.sliding_yaw;
    }
    else {
      resolved.sliding_yaw = false
    }

    if (msg.interaction_reference_velocity !== undefined) {
      resolved.interaction_reference_velocity = geometry_msgs.msg.Twist.Resolve(msg.interaction_reference_velocity)
    }
    else {
      resolved.interaction_reference_velocity = new geometry_msgs.msg.Twist()
    }

    return resolved;
    }
};

module.exports = MpcLog;
