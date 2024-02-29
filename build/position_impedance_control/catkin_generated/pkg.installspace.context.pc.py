# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "autopilot;geometry_msgs;quadrotor_common;roscpp;std_msgs;trajectory_msgs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lposition_impedance_controller".split(';') if "-lposition_impedance_controller" != "" else []
PROJECT_NAME = "position_impedance_control"
PROJECT_SPACE_DIR = "/home/emanuele/traversal_ws/install"
PROJECT_VERSION = "0.0.0"
