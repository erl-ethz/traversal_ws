#include "force_filter.h"


int main(int argc, char **argv) {
  ros::init(argc, argv, "sensor_filter");
  
  force_filter sensor_filter_class;
  ros::Rate loop(sensor_filter_class.rate_);
  
  while (ros::ok())
  {
    ros::spinOnce();
    loop.sleep();
  }
  
}