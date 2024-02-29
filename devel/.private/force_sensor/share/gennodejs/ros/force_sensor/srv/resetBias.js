// Auto-generated. Do not edit!

// (in-package force_sensor.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class resetBiasRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.reset_bias_request = null;
    }
    else {
      if (initObj.hasOwnProperty('reset_bias_request')) {
        this.reset_bias_request = initObj.reset_bias_request
      }
      else {
        this.reset_bias_request = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type resetBiasRequest
    // Serialize message field [reset_bias_request]
    bufferOffset = _serializer.bool(obj.reset_bias_request, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type resetBiasRequest
    let len;
    let data = new resetBiasRequest(null);
    // Deserialize message field [reset_bias_request]
    data.reset_bias_request = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'force_sensor/resetBiasRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f507d7cdfba8604617b8444600c62d63';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool reset_bias_request
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new resetBiasRequest(null);
    if (msg.reset_bias_request !== undefined) {
      resolved.reset_bias_request = msg.reset_bias_request;
    }
    else {
      resolved.reset_bias_request = false
    }

    return resolved;
    }
};

class resetBiasResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.reset_bias_response = null;
    }
    else {
      if (initObj.hasOwnProperty('reset_bias_response')) {
        this.reset_bias_response = initObj.reset_bias_response
      }
      else {
        this.reset_bias_response = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type resetBiasResponse
    // Serialize message field [reset_bias_response]
    bufferOffset = _serializer.bool(obj.reset_bias_response, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type resetBiasResponse
    let len;
    let data = new resetBiasResponse(null);
    // Deserialize message field [reset_bias_response]
    data.reset_bias_response = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'force_sensor/resetBiasResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '728c6e7d68d536560608257d1f206ca8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool reset_bias_response
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new resetBiasResponse(null);
    if (msg.reset_bias_response !== undefined) {
      resolved.reset_bias_response = msg.reset_bias_response;
    }
    else {
      resolved.reset_bias_response = false
    }

    return resolved;
    }
};

module.exports = {
  Request: resetBiasRequest,
  Response: resetBiasResponse,
  md5sum() { return '746b7f4e281851ca839750a1bcfc846b'; },
  datatype() { return 'force_sensor/resetBias'; }
};
