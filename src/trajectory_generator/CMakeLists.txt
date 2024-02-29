cmake_minimum_required(VERSION 3.0.2)
project(trajectory_generator)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)
# add_compile_options(-O3)

## Find catkin macros and libraries 
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin_simple REQUIRED)

find_package(catkin REQUIRED COMPONENTS roslaunch)
roslaunch_add_file_check(launch)        # check the *.launch files (inside launch directory) for common errors  

catkin_simple() # This macro call gathers: find_package(...), include_directories(), add msg, srv and action on each of them.

# cs_add_library(mylib src/mylib.cpp)   # it calls add_library() and then target_link_libraries() macros

cs_add_executable(traj_gen src/trajectory_gen.cpp)   # To change in the right name
# target_link_libraries(my_exec my_lib)

cs_install()

cs_export()   # calls catkin_package(...) under the hood, extending that call with any libraries created and catkin_depends found automatically with catkin_simple

