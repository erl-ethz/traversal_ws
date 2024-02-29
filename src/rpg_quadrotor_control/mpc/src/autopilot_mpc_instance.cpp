#include "autopilot/autopilot.h"
#include "mpc_controller.h"
#include "mpc_params.h"

template class autopilot::AutoPilot<mpc_impedance::MPCController<float>,
                         mpc_impedance::MPCParams<float>>;

int main(int argc, char **argv) {
  ros::init(argc, argv, "autopilot");
  std::cout << "Ehi man autopilot is working with MPC :)\n";    // DEBUG
  autopilot::AutoPilot<mpc_impedance::MPCController<float>,
                       mpc_impedance::MPCParams<float>>
      autopilot;

  ros::spin();

  return 0;
}