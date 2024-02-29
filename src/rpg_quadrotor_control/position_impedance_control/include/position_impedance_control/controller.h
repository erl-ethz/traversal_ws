#pragma once

#include <quadrotor_common/control_command.h>
#include <quadrotor_common/quad_state_estimate.h>
#include <quadrotor_common/trajectory.h>
#include <quadrotor_common/trajectory_point.h>
#include <quadrotor_common/parameter_helper.h>
#include <ros/ros.h>
#include <Eigen/Dense>


namespace impedance_controller {

  struct ImpedanceControllerParameters {
    ImpedanceControllerParameters() {std::cout << "Standard initialization";}
    ImpedanceControllerParameters(const ros::NodeHandle& pnh) {
      if(!loadParameters(pnh)) 
        std::cout << "Not read properly the params file\n";
    }

    double d_x_, d_y_, d_z_;
    double m_;
    double max_phi_ ;
    double min_phi_;
    double max_theta_;
    double min_theta_;
    double max_thrust_;

    bool loadParameters(const ros::NodeHandle& pnh) {
      const std::string path_rel_to_node = "impedance_controller";

      if (!quadrotor_common::getParam(path_rel_to_node+"/mass", m_, pnh)) 
        return false;

      if (!quadrotor_common::getParam(path_rel_to_node+"/damping_x", d_x_, pnh)) 
        return false;

      if (!quadrotor_common::getParam(path_rel_to_node+"/damping_y", d_y_, pnh)) 
        return false;
      
      if (!quadrotor_common::getParam(path_rel_to_node+"/damping_z", d_z_, pnh)) 
        return false;

      return true;
    }
  };

  class ImpedanceController {

    public:
      ImpedanceController();
      ~ImpedanceController() {}

      quadrotor_common::ControlCommand off();
      quadrotor_common::ControlCommand run(const quadrotor_common::QuadStateEstimate &state_estimate,
               const quadrotor_common::Trajectory &reference_trajectory,
               const ImpedanceControllerParameters &config);



    private:
      Eigen::Matrix3d R_w2NED_;
      Eigen::Vector3d pseudo_acceleration_;
      void Pseudo_accelerationComputation(
        const quadrotor_common::TrajectoryPoint &reference_point,
        const quadrotor_common::QuadStateEstimate &state_estimate,
        const ImpedanceControllerParameters &config);
      void ThrustComputation();
      void AttitudeComputation();
      quadrotor_common::TrajectoryPoint RefFromWorld2NED(
        const quadrotor_common::TrajectoryPoint reference_state);
      quadrotor_common::QuadStateEstimate StateFromWorld2NED(
        const quadrotor_common::QuadStateEstimate &state);

      double g_ = 9.81;

      // Initialization of the controller output
      double thrust_ = g_;
      double phi_ = 0;
      double theta_ = 0; 
      double psi_ = 0;

  };


}