cmake_minimum_required(VERSION 3.0.2)
project(flexible_environment)

find_package(catkin REQUIRED COMPONENTS
  eigen_catkin
  gazebo_joint_torsional_spring
  roslaunch
)

catkin_package()


## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)


## Mark other files for installation (e.g. launch and bag files, etc.)
foreach(dir launch urdf)
	install(DIRECTORY ${dir}/
		DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/${dir})
endforeach(dir)