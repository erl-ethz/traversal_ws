#pragma once

#include <autopilot/autopilot_helper.h>
#include <quadrotor_msgs/AutopilotFeedback.h>
#include <ros/ros.h>

namespace trajectory_generator {

class TrajGen {
 public:
  TrajGen();
  virtual ~TrajGen();

  bool loadParameters();
  void run();

 private:
  void measureTracking(const ros::TimerEvent& time);

  ros::NodeHandle nh_;

  ros::Publisher arm_pub_;

  ros::Timer measure_tracking_timer_;

  autopilot_helper::AutoPilotHelper autopilot_helper_;

  // Constants
  static constexpr double kExecLoopRate_ = 50.0;

  // Reference coordinates
  double x_ref_, y_ref_, z_ref_, vx_ref_, vy_ref_, vz_ref_;
};

}  // namespace rpg_quadrotor_integration_test
