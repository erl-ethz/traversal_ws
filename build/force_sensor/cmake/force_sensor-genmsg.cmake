# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "force_sensor: 0 messages, 1 services")

set(MSG_I_FLAGS "-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(force_sensor_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/emanuele/traversal_ws/src/rpg_quadrotor_control/force_sensor/srv/resetBias.srv" NAME_WE)
add_custom_target(_force_sensor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "force_sensor" "/home/emanuele/traversal_ws/src/rpg_quadrotor_control/force_sensor/srv/resetBias.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(force_sensor
  "/home/emanuele/traversal_ws/src/rpg_quadrotor_control/force_sensor/srv/resetBias.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/force_sensor
)

### Generating Module File
_generate_module_cpp(force_sensor
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/force_sensor
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(force_sensor_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(force_sensor_generate_messages force_sensor_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emanuele/traversal_ws/src/rpg_quadrotor_control/force_sensor/srv/resetBias.srv" NAME_WE)
add_dependencies(force_sensor_generate_messages_cpp _force_sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(force_sensor_gencpp)
add_dependencies(force_sensor_gencpp force_sensor_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS force_sensor_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(force_sensor
  "/home/emanuele/traversal_ws/src/rpg_quadrotor_control/force_sensor/srv/resetBias.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/force_sensor
)

### Generating Module File
_generate_module_eus(force_sensor
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/force_sensor
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(force_sensor_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(force_sensor_generate_messages force_sensor_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emanuele/traversal_ws/src/rpg_quadrotor_control/force_sensor/srv/resetBias.srv" NAME_WE)
add_dependencies(force_sensor_generate_messages_eus _force_sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(force_sensor_geneus)
add_dependencies(force_sensor_geneus force_sensor_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS force_sensor_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(force_sensor
  "/home/emanuele/traversal_ws/src/rpg_quadrotor_control/force_sensor/srv/resetBias.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/force_sensor
)

### Generating Module File
_generate_module_lisp(force_sensor
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/force_sensor
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(force_sensor_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(force_sensor_generate_messages force_sensor_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emanuele/traversal_ws/src/rpg_quadrotor_control/force_sensor/srv/resetBias.srv" NAME_WE)
add_dependencies(force_sensor_generate_messages_lisp _force_sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(force_sensor_genlisp)
add_dependencies(force_sensor_genlisp force_sensor_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS force_sensor_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(force_sensor
  "/home/emanuele/traversal_ws/src/rpg_quadrotor_control/force_sensor/srv/resetBias.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/force_sensor
)

### Generating Module File
_generate_module_nodejs(force_sensor
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/force_sensor
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(force_sensor_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(force_sensor_generate_messages force_sensor_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emanuele/traversal_ws/src/rpg_quadrotor_control/force_sensor/srv/resetBias.srv" NAME_WE)
add_dependencies(force_sensor_generate_messages_nodejs _force_sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(force_sensor_gennodejs)
add_dependencies(force_sensor_gennodejs force_sensor_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS force_sensor_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(force_sensor
  "/home/emanuele/traversal_ws/src/rpg_quadrotor_control/force_sensor/srv/resetBias.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/force_sensor
)

### Generating Module File
_generate_module_py(force_sensor
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/force_sensor
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(force_sensor_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(force_sensor_generate_messages force_sensor_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emanuele/traversal_ws/src/rpg_quadrotor_control/force_sensor/srv/resetBias.srv" NAME_WE)
add_dependencies(force_sensor_generate_messages_py _force_sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(force_sensor_genpy)
add_dependencies(force_sensor_genpy force_sensor_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS force_sensor_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/force_sensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/force_sensor
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(force_sensor_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/force_sensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/force_sensor
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(force_sensor_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/force_sensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/force_sensor
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(force_sensor_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/force_sensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/force_sensor
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(force_sensor_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/force_sensor)
  install(CODE "execute_process(COMMAND \"/home/emanuele/anaconda3/envs/RL_landing/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/force_sensor\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/force_sensor
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(force_sensor_generate_messages_py geometry_msgs_generate_messages_py)
endif()
