# CMake generated Testfile for 
# Source directory: /home/emanuele/traversal_ws/src/trajectory_generator
# Build directory: /home/emanuele/traversal_ws/build/trajectory_generator
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_trajectory_generator_roslaunch-check_launch "/home/emanuele/traversal_ws/build/trajectory_generator/catkin_generated/env_cached.sh" "/home/emanuele/anaconda3/envs/RL_landing/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/emanuele/traversal_ws/build/trajectory_generator/test_results/trajectory_generator/roslaunch-check_launch.xml" "--return-code" "/home/emanuele/anaconda3/envs/RL_landing/lib/python3.8/site-packages/cmake/data/bin/cmake -E make_directory /home/emanuele/traversal_ws/build/trajectory_generator/test_results/trajectory_generator" "/opt/ros/noetic/share/roslaunch/cmake/../scripts/roslaunch-check -o \"/home/emanuele/traversal_ws/build/trajectory_generator/test_results/trajectory_generator/roslaunch-check_launch.xml\" \"/home/emanuele/traversal_ws/src/trajectory_generator/launch\" ")
set_tests_properties(_ctest_trajectory_generator_roslaunch-check_launch PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/roslaunch/cmake/roslaunch-extras.cmake;66;catkin_run_tests_target;/home/emanuele/traversal_ws/src/trajectory_generator/CMakeLists.txt;14;roslaunch_add_file_check;/home/emanuele/traversal_ws/src/trajectory_generator/CMakeLists.txt;0;")
subdirs("gtest")
