#pragma once

#include <geometry_msgs/WrenchStamped.h>
#include <ros/ros.h>
#include <ros/console.h>
#include <Eigen/Dense>
#include "quadrotor_common/parameter_helper.h"

class force_filter
{
  private:
    ros::NodeHandle nh_;

    double alpha_;
    std::unique_ptr<geometry_msgs::WrenchStamped> filter_data_msg_;

    // ros::Timer timer_;
    ros::Publisher wrench_pub_;
    ros::Subscriber raw_sensor_data_;
    void rawDataCallback(const geometry_msgs::WrenchStamped::ConstPtr& msg);
    void InitializeWrench();

  public:
    force_filter();
    ~force_filter();
    bool loadParameters();
    double rate_ = 100;
    double scale_ = 1;
};


force_filter::force_filter()
{
  // Load Parameters
  if(!loadParameters()) std::cout << "Not properly initialized\n";

  InitializeWrench();

  // Publisher
  wrench_pub_ = 
    nh_.advertise<geometry_msgs::WrenchStamped>("ft_sensor_topic_filtered", 1);

  // Subscriber
  raw_sensor_data_ = nh_.subscribe(
      "ft_sensor_topic", 1,
      &force_filter::rawDataCallback, this);
}

force_filter::~force_filter()
{
}

bool force_filter::loadParameters() {
  const std::string path_rel_to_node = "sensor_filter";
  if (!quadrotor_common::getParam(path_rel_to_node+"/alpha_filter", alpha_, nh_)) return false;
  if (!quadrotor_common::getParam(path_rel_to_node+"/rate_sensor", rate_, nh_)) return false;

  return true;
}


void force_filter::rawDataCallback(const geometry_msgs::WrenchStamped::ConstPtr& msg) {
  filter_data_msg_->wrench.force.x = scale_ * (alpha_ * msg->wrench.force.x + (1-alpha_)*filter_data_msg_->wrench.force.x);
  filter_data_msg_->wrench.force.y = scale_ * (alpha_ * msg->wrench.force.y + (1-alpha_)*filter_data_msg_->wrench.force.y);
  filter_data_msg_->wrench.force.z = scale_ * (alpha_ * msg->wrench.force.z + (1-alpha_)*filter_data_msg_->wrench.force.z);

  filter_data_msg_->wrench.torque.x = scale_ * (alpha_ * msg->wrench.torque.x + (1-alpha_)*filter_data_msg_->wrench.torque.x);
  filter_data_msg_->wrench.torque.y = scale_ * (alpha_ * msg->wrench.torque.y + (1-alpha_)*filter_data_msg_->wrench.torque.y);
  filter_data_msg_->wrench.torque.z = scale_ * (alpha_ * msg->wrench.torque.z + (1-alpha_)*filter_data_msg_->wrench.torque.z);

  // ROS_INFO("Publishing filtered sensor message\n");
  wrench_pub_.publish(*filter_data_msg_);
}


void force_filter::InitializeWrench() {
  // Inizialize ptr
  filter_data_msg_ = std::make_unique<geometry_msgs::WrenchStamped>();
}