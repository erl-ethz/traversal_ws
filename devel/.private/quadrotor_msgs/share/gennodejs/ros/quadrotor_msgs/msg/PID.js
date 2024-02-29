// Auto-generated. Do not edit!

// (in-package quadrotor_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class PID {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.proportional_term = null;
      this.integrative_term = null;
      this.derivative_term = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('proportional_term')) {
        this.proportional_term = initObj.proportional_term
      }
      else {
        this.proportional_term = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('integrative_term')) {
        this.integrative_term = initObj.integrative_term
      }
      else {
        this.integrative_term = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('derivative_term')) {
        this.derivative_term = initObj.derivative_term
      }
      else {
        this.derivative_term = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PID
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [proportional_term]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.proportional_term, buffer, bufferOffset);
    // Serialize message field [integrative_term]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.integrative_term, buffer, bufferOffset);
    // Serialize message field [derivative_term]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.derivative_term, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PID
    let len;
    let data = new PID(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [proportional_term]
    data.proportional_term = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [integrative_term]
    data.integrative_term = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [derivative_term]
    data.derivative_term = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 72;
  }

  static datatype() {
    // Returns string type for a message object
    return 'quadrotor_msgs/PID';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2e215d204eed4067287363f18b2c8af2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PID(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.proportional_term !== undefined) {
      resolved.proportional_term = geometry_msgs.msg.Vector3.Resolve(msg.proportional_term)
    }
    else {
      resolved.proportional_term = new geometry_msgs.msg.Vector3()
    }

    if (msg.integrative_term !== undefined) {
      resolved.integrative_term = geometry_msgs.msg.Vector3.Resolve(msg.integrative_term)
    }
    else {
      resolved.integrative_term = new geometry_msgs.msg.Vector3()
    }

    if (msg.derivative_term !== undefined) {
      resolved.derivative_term = geometry_msgs.msg.Vector3.Resolve(msg.derivative_term)
    }
    else {
      resolved.derivative_term = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

module.exports = PID;
