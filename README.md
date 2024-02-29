## Simulation environment for traversing complliant obstacles 

System Requirements: 

Ubuntu 18.04 (or 20.04) with ROS Melodic (or Noetic). 

Descripion and Usage: 

The simulation environment is created for testing physical interaction strategies for traversing compliant environments. The main building block is RotorS package (https://github.com/ethz-asl/rotors_simulator), as we used it to create a model of our drone (URDF) and to have sensors and plugins for state estimation and flight. We add a hinged door as compliant environment; fr the compliant behavior we use a plugin for rotational joints with spring reaction (https://github.com/aminsung/gazebo_joint_torsional_spring_plugin). We build our Nonlinear Model Predictive Control for the traversal task,; the MPC is adapted from https://github.com/uzh-rpg/rpg_mpc, which is based on ACADO and qpoases. Parameters of the optimization-based controller can be changed, and are loaded when launched. The flight control architecture, which is based on https://github.com/uzh-rpg/rpg_quadrotor_control, uses the MPC in an autopilot fashion. All these mentioned repos can directly be installed from ours. Further detailed explanations of the different components can be found on the linked packages. 

The NMPC controller node further needs to receive a reference trajectory command to start, which is done with a rosservice call on the service 'follow_trajectory', where the speed has to be specified. Example: 

'rosservice call /your_drone/follow_trajectory "reference_velocity: x: -0.15 y: 0.0 z: 0.0" '
