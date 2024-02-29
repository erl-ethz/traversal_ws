cmake_minimum_required(VERSION 3.0.2)
project(force_sensor)


find_package(catkin_simple REQUIRED)

catkin_simple(ALL_DEPS_REQUIRED) # This macro call gathers: find_package(...), include_directories(), add msg, srv and action on each of them.

cs_add_executable(sensor_filter src/force_filter.cpp)   # To change in the right name

cs_install()

cs_export()   # calls catkin_package(...) under the hood, extending that call with any libraries created and catkin_depends found automatically with catkin_simple

