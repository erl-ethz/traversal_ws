#include "position_impedance_control/controller.h"
#include "sensor_msgs/Imu.h"
#include <quadrotor_common/math_common.h>     // MAYBE NOT USEFUL


namespace impedance_controller {

  ImpedanceController::ImpedanceController() {
    std::cout << "Standard initialization";
    R_w2NED_(0,1) = 1;
    R_w2NED_(1,0) = 1;
    R_w2NED_(2,2) = -1;
  }


  quadrotor_common::ControlCommand ImpedanceController::off() {
    quadrotor_common::ControlCommand command;
    command.zero();
    return command;
  }

  quadrotor_common::ControlCommand ImpedanceController::run(const quadrotor_common::QuadStateEstimate &state_estimate,
    const quadrotor_common::Trajectory &reference_trajectory,
    const ImpedanceControllerParameters &config) {

      // Define the type of control
      quadrotor_common::ControlCommand command;
      command.control_mode=quadrotor_common::ControlMode::ATTITUDE;
      // assess reference input
      command.armed = true;

      // DEBUG: printing coordinates and state information
      auto euler = state_estimate.orientation.toRotationMatrix().eulerAngles(0, 1, 2);
      // std::cout << "Roll: " << euler[0] << "Pitch: " << euler[1] << "Yaw: " << euler[2] << "\n";


      quadrotor_common::TrajectoryPoint reference_state(reference_trajectory.points.front());
      // DEBUG
      // std::cout << "reference_point_z: " << reference_state.position[2]
      //   << "current_position z: " << -state_estimate.position[2] 
      //   << "reference_point_v_z: " << reference_state.velocity[2] 
      //   << "reference_point_a_z: " << reference_state.acceleration[2] << "\n";

      // Compute the pseudo_acceleration (from Ruggiero's paper) propedeutic for thrust and attitude computation
      Pseudo_accelerationComputation(reference_state, state_estimate, config);

      //Compute the thrust
      ThrustComputation();

      //Compute the desired attitude
      psi_ = 0;   // Set yaw angle to zero
      AttitudeComputation();

      // DEBUG
      std::cout << "Roll: " << phi_ << "Pitch: " << theta_  << "\n";

      // Set the command
      command.orientation = Eigen::AngleAxisd(psi_, Eigen::Vector3d::UnitZ())
        * Eigen::AngleAxisd(theta_, Eigen::Vector3d::UnitY())
        * Eigen::AngleAxisd(phi_, Eigen::Vector3d::UnitX());
      command.collective_thrust = thrust_;

      return command;

    }

  void ImpedanceController::Pseudo_accelerationComputation(
    const quadrotor_common::TrajectoryPoint &reference_point,
    const quadrotor_common::QuadStateEstimate &state_estimate,
    const ImpedanceControllerParameters &config) {
      
      double v_x = state_estimate.velocity[0];
      double v_y = state_estimate.velocity[1];
      double v_z = state_estimate.velocity[2];

      double vel_des_x = reference_point.velocity[0];
      double vel_des_y = reference_point.velocity[1];
      double vel_des_z = reference_point.velocity[2];
      double acc_des_x = reference_point.acceleration[0];
      double acc_des_y = reference_point.acceleration[1];
      double acc_des_z = reference_point.acceleration[2];

      // To BE UPDATED when the mpc will be ready
      pseudo_acceleration_[0] = + acc_des_x + config.d_x_/config.m_*(vel_des_x - v_x);
      pseudo_acceleration_[1] = + acc_des_y + config.d_y_/config.m_*(vel_des_y - v_y);
      pseudo_acceleration_[2] = + acc_des_z + config.d_z_/config.m_*(vel_des_z - v_z) + g_;
         
      // std::cout << 
      //   "pseude_acc_x: " << pseudo_acceleration_[0] << 
      //   ", pseude_acc_y: " << pseudo_acceleration_[1] << 
      //   ", pseude_acc_z: " << pseudo_acceleration_[2] << "\n";   // DEBUG
      // std::cout << "acc_des_x: " << acc_des_x << ", acc_des_x: " << acc_des_y << ", acc_des_z: " << acc_des_z << "\n";    // DEBUG
  }

  void ImpedanceController::ThrustComputation() {

      thrust_ = pseudo_acceleration_.norm();
      // std::cout << "thrust impedance: " << thrust_ << "\n";  // DEBUG
  }

  void ImpedanceController::AttitudeComputation() {

      phi_ = std::asin((pseudo_acceleration_[0]*std::sin(psi_)-pseudo_acceleration_[1]*std::cos(psi_))/pseudo_acceleration_.norm());
      theta_ = std::atan((pseudo_acceleration_[0]*std::cos(psi_)+pseudo_acceleration_[1]*std::sin(psi_))/pseudo_acceleration_[2]);
  }
}