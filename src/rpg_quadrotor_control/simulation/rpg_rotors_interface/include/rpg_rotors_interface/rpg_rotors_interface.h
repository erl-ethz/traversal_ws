#pragma once

#include <mav_msgs/Actuators.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/WrenchStamped.h>
#include <quadrotor_common/control_command.h>
#include <quadrotor_msgs/ControlCommand.h>
#include <quadrotor_msgs/PID.h>
#include <ros/ros.h>
#include <std_msgs/Bool.h>
#include <Eigen/Dense>

namespace rpg_rotors_interface {

struct TorquesAndThrust {
  Eigen::Vector3d body_torques;
  double collective_thrust;
};

struct PIDTerm {
	double x;
	double y;
	double z;
	PIDTerm() : x(0.0), y(0.0), z(0.0) {}
};

class RPGRotorsInterface {
 public:
  EIGEN_MAKE_ALIGNED_OPERATOR_NEW

  RPGRotorsInterface(const ros::NodeHandle& nh, const ros::NodeHandle& pnh);

  RPGRotorsInterface()
      : RPGRotorsInterface(ros::NodeHandle(), ros::NodeHandle("~")) {}
  ~RPGRotorsInterface();

 private:
  void lowLevelControlLoop(const ros::TimerEvent& time);

  void rotorsOdometryCallback(const nav_msgs::Odometry::ConstPtr& msg);
  void rpgControlCommandCallback(
      const quadrotor_msgs::ControlCommand::ConstPtr& msg);
  void motorSpeedCallback(const mav_msgs::Actuators::ConstPtr& msg);
  void InteractionCallback(
      const std_msgs::BoolConstPtr& msg);

  quadrotor_common::ControlCommand attitudeControl(
      const quadrotor_common::ControlCommand& attitude_cmd,
      const Eigen::Quaterniond& attitude_estimate);

  TorquesAndThrust bodyRateControl(
      const quadrotor_common::ControlCommand& rate_cmd,
      const Eigen::Vector3d& body_rate_estimate);

  mav_msgs::Actuators mixer(const TorquesAndThrust& torques_and_thrust);

  void armInterfaceCallback(const std_msgs::Bool::ConstPtr& msg);

  void loadParameters();

  void updateIntegralTerm(const Eigen::Quaterniond& q_e, const double& dt);
  void updateDerivativeTerm(const Eigen::Quaterniond& q_e_previous, const Eigen::Quaterniond& q_e_current, const double& dt);

  quadrotor_msgs::ControlCommand toRosMsg(const TorquesAndThrust& torque_and_thrust_cmd);

	PIDTerm integral_term_, derivative_term_;
  Eigen::Quaterniond q_e_previous_;

  nav_msgs::Odometry quad_state_;

  ros::NodeHandle nh_;
  ros::NodeHandle pnh_;

  ros::Timer low_level_control_loop_timer_;

  ros::Publisher rotors_desired_motor_speed_pub_;
  ros::Publisher low_level_torque_and_thrust_pub_;
  ros::Publisher pid_terms_pub_;

  ros::Subscriber rotors_odometry_sub_;
  ros::Subscriber rpg_control_command_sub_;
  ros::Subscriber motor_speed_sub_;
  ros::Subscriber arm_interface_sub_;
  ros::Subscriber interaction_sub_;

  bool interface_armed_;
  TorquesAndThrust torques_and_thrust_estimate_;
  quadrotor_msgs::ControlCommand control_command_;
  quadrotor_msgs::PID pid_msg_;
  mav_msgs::Actuators last_motor_speed_;

  // Parameters
  Eigen::Matrix3d inertia_;
  Eigen::MatrixXd K_lqr_;
  double low_level_control_frequency_;
  double roll_pitch_cont_gain_;
  double integral_gain_, derivative_gain_;
	double integral_threshold_;
  double arm_length_;
  double rotor_drag_coeff_;
  double rotor_thrust_coeff_;
  double mass_;
  double max_rotor_speed_;
  bool interaction_;
	ros::Time t_termination_attitude_control_;
};

}  // namespace rpg_rotors_interface
