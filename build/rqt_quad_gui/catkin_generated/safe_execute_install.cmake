execute_process(COMMAND "/home/emanuele/traversal_ws/build/rqt_quad_gui/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/emanuele/traversal_ws/build/rqt_quad_gui/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
