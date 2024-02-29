cmake_minimum_required(VERSION 3.0.2)
project(position_impedance_control)


find_package(catkin_simple REQUIRED)

catkin_simple(ALL_DEPS_REQUIRED)


## Declare a C++ library
cs_add_library(position_impedance_controller 
  library/controller.cpp)

target_include_directories(position_impedance_controller PUBLIC
  include/)



## Make an executable
cs_add_executable(impedance_position_controller_node
  src/autopilot_impedance_instance.cpp)
target_link_libraries(impedance_position_controller_node
  position_impedance_controller)

#############
## Install ##
#############
cs_install()
cs_export()