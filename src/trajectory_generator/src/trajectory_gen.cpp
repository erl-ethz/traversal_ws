#include "trajectory_gen.h"

#include <vector>

#include <autopilot/autopilot_states.h>
#include <polynomial_trajectories/polynomial_trajectory_settings.h>
#include <quadrotor_common/control_command.h>
#include <quadrotor_common/geometry_eigen_conversions.h>
#include <quadrotor_common/parameter_helper.h>
#include <std_msgs/Bool.h>
#include <trajectory_generation_helper/heading_trajectory_helper.h>
#include <trajectory_generation_helper/polynomial_trajectory_helper.h>
#include <Eigen/Dense>

namespace trajectory_generator {

TrajGen::TrajGen() {
  arm_pub_ = nh_.advertise<std_msgs::Bool>("bridge/arm", 1);
}

TrajGen::~TrajGen() {}


void TrajGen::run() {
    ros::Rate command_rate(kExecLoopRate_);
    std::cout << "Fire up the engines!\n";

    // Make sure everything is up and running
    // Wait for Autopilot feedback with assert
    if((autopilot_helper_.waitForAutopilotFeedback(10.0, kExecLoopRate_)))
        std::cout << "Did not receive autopilot feedback within 10 seconds.";

    ros::Duration(3.0).sleep();

    // Arm bridge
    std_msgs::Bool arm_msg;
    arm_msg.data = true;
    arm_pub_.publish(arm_msg);

    // Takeoff
    autopilot_helper_.sendStart();

    // Wait for autopilot to go to start
    if((autopilot_helper_.waitForSpecificAutopilotState(
      autopilot::States::START, 0.5, kExecLoopRate_)))
      std::cout << "Autopilot did not switch to start after sending start command.";

    // Wait for autopilot to go to hover
    if((autopilot_helper_.waitForSpecificAutopilotState(
      autopilot::States::HOVER, 10.0, kExecLoopRate_)))
      std::cout << "Autopilot did not switch to hover after take off.";


    // ReferenceState mode
    // TO DO : definition of the desired point
    quadrotor_common::TrajectoryPoint desired_point;

    desired_point.position.x() = x_ref_;
    desired_point.position.y() = y_ref_;
    desired_point.position.z() = z_ref_;
    desired_point.velocity.x() = vx_ref_;
    desired_point.velocity.y() = vy_ref_;
    desired_point.velocity.z() = vz_ref_;
    // desired_point.acceleration.x() = ;   // Not considered by MPC
    // desired_point.acceleration.y() = ;   // Not considered by MPC
    // desired_point.acceleration.z() = ;   // Not considered by MPC

    //ros::Duration(3.0).sleep();
    
    while (ros::ok())
    {
      autopilot_helper_.sendReferenceState(desired_point);
      command_rate.sleep();
    }
    
  }

bool TrajGen::loadParameters()
{
  const std::string path_rel_to_node = "trajectory_generator/";
  #define GET_PARAM(name) \
  if (!quadrotor_common::getParam(path_rel_to_node+#name, name, nh_)) \
    return false;

  #define GET_PARAM_(name) \
  if (!quadrotor_common::getParam(path_rel_to_node+#name, name ## _, nh_)) \
    return false;

  GET_PARAM_(x_ref);
  GET_PARAM_(y_ref);
  GET_PARAM_(z_ref);
  GET_PARAM_(vx_ref);
  GET_PARAM_(vy_ref);
  GET_PARAM_(vz_ref);

  #undef GET_PARAM
  #undef GET_PARAM_

  return true;
}


}  // namespace trajectory_generator

int main(int argc, char** argv) {
  ros::init(argc, argv, "trajectory_generator");
  trajectory_generator::TrajGen trial;
  trial.loadParameters();
  trial.run();
}
