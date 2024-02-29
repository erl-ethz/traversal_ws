cmake_minimum_required(VERSION 3.0.2)
project(debugger)

find_package(catkin_simple REQUIRED)

catkin_simple()

cs_install_scripts(src/debugger.py)

cs_export()