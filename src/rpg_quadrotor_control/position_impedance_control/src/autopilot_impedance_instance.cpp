#include "autopilot/autopilot.h"
#include "position_impedance_control/controller.h"

int main(int argc, char **argv) {
  ros::init(argc, argv, "autopilot");
  autopilot::AutoPilot<impedance_controller::ImpedanceController,
                       impedance_controller::ImpedanceControllerParameters>
      autopilot;

  ros::spin();

  return 0;
}