import numpy as np
import rospy
import matplotlib.pyplot as plt
from mpl_toolkits import mplot3d
from matplotlib.widgets import Button, RadioButtons, CheckButtons, Slider

class Graphic:
  def __init__(self, boxes_ratio_1, boxes_ratio_2,
        horizon_trajectory_msgs,
        mpc_log_msgs, trajectory_msgs,
        external_wrench_msgs,
        control_command_msgs,
        arrow_force, arrow_torque,
        low_level_command_msgs=None,
        mpc_command_msgs=None,
        margin_x=.1, margin_y=.1,
        reference_x=0, reference_y=0, reference_vz=0.05,
        space_between_boxes=0.05):

    self.iteration = 0
    self.simulation_time = len(mpc_log_msgs)
    self.horizon_length = len(horizon_trajectory_msgs[0])
    self.horizon = Horizon(horizon_trajectory_msgs, self.horizon_length)
    self.mpc_solver_variables = MPCSolver(mpc_log_msgs)
    self.trajectory = Trajectory(trajectory_msgs)
    self.external_wrench = ExternalWrench(external_wrench_msgs)
    self.high_control_command = ControlCommand(control_command_msgs)
    self.mpc_command = None
    self.low_control_command = None
    if low_level_command_msgs!=None and mpc_command_msgs!=None:
      self.mpc_command = ControlCommand(mpc_command_msgs)
      self.low_control_command = ControlCommand(low_level_command_msgs)
      self.get_bias_time_commands()
    self.define_reference(reference_x, reference_y)
    # Load images
    self.arrow_torque = arrow_torque
    self.arrow_force = arrow_force

    # Definition of the boxes geometries
    # Figure 1
    available_x_1 = 1-2*margin_x
    available_y_1 = 1-2*margin_x-3*space_between_boxes
    margin_arrow_figures_x = 0.1
    arrows_width = 0.15
    force_torque_box_dim_height = boxes_ratio_1[3]*available_y_1
    attitude_box_dim_width = (available_x_1-2*space_between_boxes)/2
    attitude_box_dim_height = boxes_ratio_1[2]*available_y_1
    slider_box_width = available_x_1 - 0.4
    slider_box_height = boxes_ratio_1[1] * available_y_1
    horizon_box_width = (available_x_1-2*space_between_boxes)/2
    horizon_box_height = boxes_ratio_1[0]*available_y_1
    trajectory_box_width = (available_x_1-2*space_between_boxes)/2
    trajectory_box_height = boxes_ratio_1[0]*available_y_1
    self.force_y_box_dim = [margin_x + margin_arrow_figures_x, 
      margin_y/2, 
      arrows_width, 
      force_torque_box_dim_height/2]
    self.force_x_box_dim = [1-margin_x-2.5*margin_arrow_figures_x, 
      margin_y/2, 
      arrows_width, 
      force_torque_box_dim_height/2]
    self.torque_x_box_dim = [margin_x + margin_arrow_figures_x, 
      margin_y*0.75+force_torque_box_dim_height/2, 
      arrows_width, 
      force_torque_box_dim_height/2]
    self.torque_y_box_dim = [1-margin_x-2.5*margin_arrow_figures_x, 
      margin_y*0.75+force_torque_box_dim_height/2, 
      arrows_width, 
      force_torque_box_dim_height/2]
    self.bottom_attitude_box = margin_y+force_torque_box_dim_height+space_between_boxes
    self.roll_box_dim = [margin_x, 
      self.bottom_attitude_box,
      attitude_box_dim_width,
      attitude_box_dim_height]
    self.pitch_box_dim = [1-margin_x-attitude_box_dim_width, 
      self.bottom_attitude_box,
      attitude_box_dim_width,
      attitude_box_dim_height]
    self.bottom_slider = self.bottom_attitude_box+attitude_box_dim_height+space_between_boxes
    play_button_width = 0.04
    play_button_height = slider_box_height
    self.playbutton_box_dim = [margin_x,
      self.bottom_slider,
      play_button_width,
      play_button_height]
    show_button_width = 0.04
    show_button_height = slider_box_height
    self.showbutton_box_dim = [margin_x + 1.2*play_button_width,
      self.bottom_slider,
      show_button_width,
      show_button_height]
    self.slider_box_dim = [margin_x + 0.2,
      self.bottom_slider,
      slider_box_width,
      slider_box_height]
    self.bottom_horizon_box = self.bottom_slider+slider_box_height+space_between_boxes
    self.horizon_box_dim = [margin_x,
      self.bottom_horizon_box,
      horizon_box_width,
      horizon_box_height]
    self.bottom_trajectory_box = self.bottom_horizon_box
    self.trajectory_box_dim = [1-margin_x-horizon_box_width,
      self.bottom_trajectory_box,
      trajectory_box_width,
      trajectory_box_height]

    # Figure 2
    available_x_2 = 1-2*margin_x
    available_y_2 = 1-2*margin_x-2*space_between_boxes
    mpc_parameters_box_height = boxes_ratio_2[2] * available_y_2
    mpc_parameters_box_width = 0.8
    self.mpc_parameters_box_dim = [margin_x,
      margin_y,
      mpc_parameters_box_width,
      mpc_parameters_box_height]
    obj_function_box_bottom = self.mpc_parameters_box_dim[1]+self.mpc_parameters_box_dim[3]+space_between_boxes
    obj_function_box_width = available_x_2
    obj_function_box_height = boxes_ratio_2[1] * available_y_2
    self.obj_function_box_dim = [margin_x,
      obj_function_box_bottom,
      obj_function_box_width,
      obj_function_box_height]
    command_box_bottom = self.obj_function_box_dim[1]+self.obj_function_box_dim[3]+2*space_between_boxes
    command_box_width = available_x_2
    command_box_height = boxes_ratio_2[0] * available_y_2
    self.command_box_dim = [margin_x,
      command_box_bottom,
      command_box_width,
      command_box_height]

    # Passing the geometry properties to the matplotlib library
    self.fig1 = plt.figure(num=1,figsize=(10, 10))
    self.horizon_box = plt.axes(self.horizon_box_dim, projection='3d')
    self.trajectory_box = plt.axes(self.trajectory_box_dim, projection='3d')
    self.ax_playbutton = plt.axes(self.playbutton_box_dim)
    self.ax_showbutton = plt.axes(self.showbutton_box_dim)
    self.ax_slider = plt.axes(self.slider_box_dim)
    self.roll_box = plt.axes(self.roll_box_dim)
    self.pitch_box = plt.axes(self.pitch_box_dim)
    self.force_x_box = plt.axes(self.force_x_box_dim)
    self.force_y_box = plt.axes(self.force_y_box_dim)
    self.torque_x_box = plt.axes(self.torque_x_box_dim)
    self.torque_y_box = plt.axes(self.torque_y_box_dim)    
    self.fig2 = plt.figure(num=2,figsize=(10, 10))
    self.thrust_box = plt.axes(self.command_box_dim)
    self.torque_box = self.thrust_box.twinx()
    self.obj_function_box = plt.axes(self.obj_function_box_dim)
    self.mpc_parameters_box = plt.axes(self.mpc_parameters_box_dim)

    # First graph
    self.horizon_box.set_title("MPC Horizon")
    self.horizon_box.set_xlabel('x (m)')
    self.horizon_box.set_ylabel('y (m)')
    self.horizon_box.set_zlabel('z (m)')

    self.trajectory_box.set_title("Drone Trajectory")
    self.trajectory_box.set_xlabel('x (m)')
    self.trajectory_box.set_ylabel('y (m)')
    self.trajectory_box.set_zlabel('z (m)')

    self.roll_box.set_title('Roll')
    self.roll_box.set_xlim([-0.6,0.6])
    self.roll_box.set_ylim([-0.2,0.2])

    self.pitch_box.set_title('Pitch')
    self.pitch_box.set_xlim([-0.6,0.6])
    self.pitch_box.set_ylim([-0.2,0.2])

    self.remove_force_torque_axis_labels()

    # Second Graph
    # self.command_box.set_title('Comparison')
    self.x_labels = ['Thrust', 'Torque_x', 'Torque_y', 'Torque_z']
    self.x_axis_chart = np.arange(len(self.x_labels))
    self.thrust_box.set_xticks(self.x_axis_chart, minor=False)
    self.thrust_box.set_xticklabels(self.x_labels)
    
    # self.torque_box.set_ylim([-0.1, 0.1])

    self.obj_function_box.set_title('MPC objective function')
    self.obj_function_box.set_xlabel('Time (s)')
    self.obj_function_box.set_ylabel('Value')

    self.remove_mpc_parameters_axis_labels()

    # Definition of the slider
    valinit = 0
    self.time_slider = Slider(self.ax_slider, 'Time', 
      0.0, self.horizon.time_steps, valinit=valinit)
    self.time_slider.on_changed(self.update_slider)

    # Definition of the Play button
    self.play_flag = False
    self.playbutton = Button(self.ax_playbutton, 'Play', color='yellow')
    self.playbutton.on_clicked(self.play)

    # Definition of the Show button
    self.showbutton = Button(self.ax_showbutton, 'Show\nCmd', color='red')
    self.showbutton_flag = False
    self.showbutton.on_clicked(self.show_roll_pitch_cmd)

    # Definition of texts
    # Fig 1
    self.time_text = self.ax_slider.text(self.horizon.time_steps*1.2,0,'Time: '+str(valinit))
    self.force_x_text = self.force_x_box.text(-2400,500,'Force x: '+str(valinit))
    self.force_y_text = self.force_y_box.text(-2400,500,'Force y: '+str(valinit))
    self.torque_x_text = self.torque_x_box.text(-1200,200,'Torque x: '+str(valinit))
    self.torque_y_text = self.torque_y_box.text(-1200,200,'Torque y: '+str(valinit))
    # Fig 2
    self.mpc_status_text = self.mpc_parameters_box.text(0.0,-0.3,'MPC status: '+str(valinit))
    self.get_distance_from_reference()
    mean_deviation_reference = self.get_mean_deviation_reference()
    std_deviation_reference = self.get_std_deviation_reference()
    self.deviation_reference_mean_text = self.mpc_parameters_box.text(0.0,0.2,f'Deviation from reference (mean): {mean_deviation_reference:.3f}')
    self.deviation_reference_std_text = self.mpc_parameters_box.text(0.0,0.35,f'Deviation from reference (std): {std_deviation_reference:.3f}')
    self.deviation_horizon_text = self.mpc_parameters_box.text(0.0,0.8,'Deviation from horizon: ')

  def remove_force_torque_axis_labels(self):
    self.force_x_box.spines['top'].set_visible(False)
    self.force_x_box.spines['left'].set_visible(False)
    self.force_x_box.spines['bottom'].set_visible(False)
    self.force_x_box.spines['right'].set_visible(False)
    self.force_x_box.set_xticks([])
    self.force_x_box.set_yticks([])
    self.force_y_box.spines['top'].set_visible(False)
    self.force_y_box.spines['left'].set_visible(False)
    self.force_y_box.spines['bottom'].set_visible(False)
    self.force_y_box.spines['right'].set_visible(False)
    self.force_y_box.set_xticks([])
    self.force_y_box.set_yticks([])
    self.torque_x_box.spines['top'].set_visible(False)
    self.torque_x_box.spines['left'].set_visible(False)
    self.torque_x_box.spines['bottom'].set_visible(False)
    self.torque_x_box.spines['right'].set_visible(False)
    self.torque_x_box.set_xticks([])
    self.torque_x_box.set_yticks([])
    self.torque_y_box.spines['top'].set_visible(False)
    self.torque_y_box.spines['left'].set_visible(False)
    self.torque_y_box.spines['bottom'].set_visible(False)
    self.torque_y_box.spines['right'].set_visible(False)
    self.torque_y_box.set_xticks([])
    self.torque_y_box.set_yticks([])

  def remove_mpc_parameters_axis_labels(self):
    self.mpc_parameters_box.spines['top'].set_visible(False)
    self.mpc_parameters_box.spines['left'].set_visible(False)
    self.mpc_parameters_box.spines['bottom'].set_visible(False)
    self.mpc_parameters_box.spines['right'].set_visible(False)
    self.mpc_parameters_box.set_xticks([])
    self.mpc_parameters_box.set_yticks([])

  def plot_all(self):
    # First Figure
    self.line_horizon, = self.plot_horizon(-1)
    self.line_trajectory, = self.trajectory_box.plot(self.trajectory.x, self.trajectory.y, self.trajectory.z)
    self.line_reference, = self.trajectory_box.plot(self.x_reference, self.y_reference, self.z_reference, color='salmon')
    self.trajectory_circle, = self.draw_circle(-1)
    self.trajectory_horizon, = self.draw_horizon(-1)
    self.line_roll, = self.plot_roll(-1)
    self.line_pitch, = self.plot_pitch(-1)
    self.line_roll_cmd, = self.plot_roll_cmd(-1)
    self.line_pitch_cmd, = self.plot_pitch_cmd(-1)
    self.force_x_box.imshow(self.arrow_force)
    self.force_y_box.imshow(self.arrow_force)
    self.torque_x_box.imshow(self.arrow_torque)
    self.torque_y_box.imshow(self.arrow_torque)
  
    # Second Figure
    if self.mpc_command != None:
      self.mpc_thrust_bar_chart, self.mpc_torque_bar_chart = self.plot_mpc_control_cmd(-1)
      self.low_level_thrust_bar_chart, self.low_level_torque_bar_chart = self.plot_low_level_control_cmd(-1)
    self.line_obj_function = self.obj_function_box.plot(
      self.mpc_solver_variables.time, self.mpc_solver_variables.objective_function_value)
    self.obj_function_circle, = self.draw_obj_function_circle(-1)

    plt.draw()

  def define_reference(self, x_ref, y_ref):
    #dummy_reference
    self.x_reference = x_ref * np.ones(len(self.trajectory.x))
    self.y_reference = y_ref * np.ones(len(self.trajectory.y))
    self.z_reference = self.trajectory.z
  
  def plot_mpc_control_cmd(self, it):
    if it==-1:
      return self.thrust_box.bar(-0.125, 0, width=0.2, label='MPCCommand'),\
        self.torque_box.bar(np.array([1,2,3])-0.125, np.array([0,0,0]), width=0.2, label='MPCCommand')
    
    else:
      self.mpc_thrust_bar_chart.remove()
      self.mpc_torque_bar_chart.remove()
      torque = np.array([self.mpc_command.tx[it], self.mpc_command.ty[it], self.mpc_command.tz[it]])
      self.mpc_thrust_bar_chart = self.thrust_box.bar(-0.125, self.mpc_command.thrust[it], width=0.2, label='MPCCommand', color='teal')
      self.mpc_torque_bar_chart = self.torque_box.bar(np.array([1,2,3])-0.125, torque, width=0.2, label='MPCCommand', color='teal')

  def plot_low_level_control_cmd(self, it):
    if it==-1:
      return self.thrust_box.bar(0.125, 0, width=0.2, label='MPCCommand'),\
        self.torque_box.bar(np.array([1,2,3])+0.125, np.array([0,0,0]), width=0.2, label='MPCCommand')
    
    else:
      it_corr = self.find_nearest(self.low_control_command.time, self.mpc_solver_variables.time[it]+self.bias_time_low_command)
      self.low_level_thrust_bar_chart.remove()
      self.low_level_torque_bar_chart.remove()
      torque = np.array([self.low_control_command.tx[it_corr], self.low_control_command.ty[it_corr], self.low_control_command.tz[it_corr]])
      self.low_level_thrust_bar_chart = self.thrust_box.bar(0.125, self.low_control_command.thrust[it_corr], width=0.2, label='LowLevelCommand', color='navy')
      self.low_level_torque_bar_chart = self.torque_box.bar(np.array([1,2,3])+0.125, torque, width=0.2, label='LowLevelCommand', color='navy')

  def draw_obj_function_circle(self, it):
    if it == -1:
      return self.obj_function_box.plot([], [], color='green', marker='o')
    else:
      x_pos = self.mpc_solver_variables.time[it-1:it]
      y_pos = self.mpc_solver_variables.objective_function_value[it-1:it]
      self.obj_function_circle.set_data(x_pos, y_pos)

  def plot_horizon(self, it):
    if it == -1:
      return self.horizon_box.plot([], [], [])
    else:
      x_horiz = self.horizon.x[:,it]
      y_horiz = self.horizon.y[:,it]
      z_horiz = self.horizon.z[:,it]
      self.horizon_box.set_xlim([-0.05+min(x_horiz),0.05+max(x_horiz)])
      self.horizon_box.set_ylim([-0.05+min(y_horiz),0.05+max(y_horiz)])
      self.horizon_box.set_zlim([-0.05+min(z_horiz),0.05+max(z_horiz)])
      self.line_horizon.set_data(x_horiz, y_horiz)
      self.line_horizon.set_3d_properties(z_horiz)

  def draw_circle(self, it):
    if it == -1:
      return self.trajectory_box.plot([], [], [], color='green', marker='o')
    else:
      x_pos = self.trajectory.x[it-1:it]
      y_pos = self.trajectory.y[it-1:it]
      z_pos = self.trajectory.z[it-1:it]
      self.trajectory_circle.set_data(x_pos, y_pos)
      self.trajectory_circle.set_3d_properties(z_pos)

  def draw_horizon(self, it):
    x_horiz = self.horizon.x[:,it]
    y_horiz = self.horizon.y[:,it]
    z_horiz = self.horizon.z[:,it]
    if it == -1:
      return self.trajectory_box.plot([], [], [])
    else:
      self.trajectory_horizon.set_data(x_horiz, y_horiz)
      self.trajectory_horizon.set_3d_properties(z_horiz)

  def plot_roll(self, it):
    line_length = 1
    roll = self.trajectory.roll
    line_roll_x = [-line_length/2*np.cos(roll[it]), line_length/2*np.cos(roll[it])]
    line_roll_y = [-line_length/2*np.sin(roll[it]), line_length/2*np.sin(roll[it])]
    if it == -1:
      return self.roll_box.plot([], [])
    else:
      self.line_roll.set_data(line_roll_x, line_roll_y)

  def plot_roll_cmd(self, it):
    line_length = 1
    roll_cmd = self.high_control_command.roll
    it_corrected = self.find_nearest(self.high_control_command.time, self.mpc_solver_variables.time[it]+self.bias_time_high_command)
    line_roll_cmd_x = [-line_length/2*np.cos(roll_cmd[it_corrected]), line_length/2*np.cos(roll_cmd[it_corrected])]
    line_roll_cmd_y = [-line_length/2*np.sin(roll_cmd[it_corrected]), line_length/2*np.sin(roll_cmd[it_corrected])]
    if it == -1:
      return self.roll_box.plot([], [], color='gold', marker='*')
    else:
       if self.showbutton_flag == True:
        self.line_roll_cmd.set_data(line_roll_cmd_x, line_roll_cmd_y)

  def plot_pitch_cmd(self, it):
    line_length = 1
    pitch_cmd = self.high_control_command.pitch
    it_corrected = self.find_nearest(self.high_control_command.time, self.mpc_solver_variables.time[it]+self.bias_time_high_command)
    line_pitch_cmd_x = [-line_length/2*np.cos(-pitch_cmd[it_corrected]), line_length/2*np.cos(-pitch_cmd[it_corrected])]
    line_pitch_cmd_y = [-line_length/2*np.sin(-pitch_cmd[it_corrected]), line_length/2*np.sin(-pitch_cmd[it_corrected])]
    if it == -1:
      return self.pitch_box.plot([], [], color='gold', marker='*')
    else:
       if self.showbutton_flag == True:
        self.line_pitch_cmd.set_data(line_pitch_cmd_x, line_pitch_cmd_y)

  def plot_pitch(self, it):
    line_length = 1
    pitch = self.trajectory.pitch
    line_pitch_x = [-line_length/2*np.cos(-pitch[it]), line_length/2*np.cos(-pitch[it])]
    line_pitch_y = [-line_length/2*np.sin(-pitch[it]), line_length/2*np.sin(-pitch[it])]
    if it == -1:
      return self.pitch_box.plot([], [])
    else:
      self.line_pitch.set_data(line_pitch_x, line_pitch_y)

  def write_text(self, it):
    self.time_text.set_text('Time: '+f'{self.mpc_solver_variables.time[it]:.3f}')
    self.force_x_text.set_text('Force x: '+f'{self.external_wrench.fx[it]:.2e}')
    self.force_y_text.set_text('Force y: '+f'{self.external_wrench.fy[it]:.2e}')
    self.torque_x_text.set_text('Torque x: '+f'{self.external_wrench.tx[it]:.2e}')
    self.torque_y_text.set_text('Torque y: '+f'{self.external_wrench.ty[it]:.2e}')
    status_meaning = self.get_status_meaning(it)
    self.mpc_status_text.set_text(f'MPC status: {self.mpc_solver_variables.solver_status[it]}  -->  {status_meaning}')
    mean_deviation_horizon = self.get_mean_deviation_horizon(it)
    self.deviation_horizon_text.set_text(f'Deviation from horizon: {mean_deviation_horizon:.3f}')


  def update_slider(self,val):
    time_step = int(self.time_slider.val)

    # First figure
    self.plot_horizon(time_step)
    self.plot_roll(time_step)
    self.plot_roll_cmd(time_step)
    self.plot_pitch(time_step)
    self.plot_pitch_cmd(time_step)
    self.draw_circle(time_step)
    self.draw_horizon(time_step)
    self.write_text(time_step)
    self.fig1.canvas.draw_idle()
    
    # Second figure
    if self.mpc_command != None:
      self.plot_mpc_control_cmd(time_step)
      self.plot_low_level_control_cmd(time_step)
      self.thrust_box.legend()
      # self.torque_box.legend()
    self.draw_obj_function_circle(time_step)
    self.fig2.canvas.draw_idle()

  def play(self, event):
    if not self.play_flag:
      self.play_flag = True
      for it in range(self.simulation_time-1):
        if not self.play_flag:
          break
        self.time_slider.val = it
        self.update_slider(it)

        # Pause the simulation
        pause_time = self.mpc_solver_variables.time[it+1]-self.mpc_solver_variables.time[it]
        plt.pause(pause_time)
    else:
      self.play_flag = False

  def show_roll_pitch_cmd(self, event):
    if self.showbutton_flag == False:
      self.showbutton_flag = True
    else:
      self.showbutton_flag = False

  def find_nearest(self, array, value):
    return (np.abs(array - value)).argmin()

  def get_status_meaning(self, it):
    if self.mpc_solver_variables.solver_status[it] in self.mpc_solver_variables.solver_status_dict:
      return self.mpc_solver_variables.solver_status_dict[self.mpc_solver_variables.solver_status[it]]
    else:
      return "Not recognized"

  def get_distance_from_reference(self):
    self.distance_xy = np.sqrt((self.trajectory.x - self.x_reference)**2 + (self.trajectory.y - self.y_reference)**2)

  def get_mean_deviation_reference(self):
    return np.mean(self.distance_xy)

  def get_std_deviation_reference(self):
    return np.std(self.distance_xy)

  def get_mean_deviation_horizon(self,it):
    current_time = self.mpc_solver_variables.time[it]
    dt = 0.05     # MPC time_step_horizon
    horizon_time = current_time + np.arange(start=dt/10, stop=1+dt/10, step=dt)
    x_simulation = []
    y_simulation = []
    z_simulation = []
    for t_mpc in horizon_time:
      j = self.find_nearest(self.mpc_solver_variables.time, t_mpc)
      x_simulation += [self.trajectory.x[j]]
      y_simulation += [self.trajectory.y[j]]
      z_simulation += [self.trajectory.z[j]] 
    x_simulation = np.array(x_simulation)
    y_simulation = np.array(y_simulation)
    z_simulation = np.array(z_simulation)
    return np.mean(np.sqrt((x_simulation-self.horizon.x[:,it])**2 + 
      (y_simulation-self.horizon.y[:,it])**2) +
      (z_simulation-self.horizon.z[:,it])**2)

  def get_bias_time_commands(self):
    self.bias_time_high_command = self.high_control_command.time[-1] - self.mpc_solver_variables.time[-1]
    self.bias_time_low_command = self.low_control_command.time[-1] - self.mpc_solver_variables.time[-1]







class Horizon:
  def __init__(self, points_msgs, horizon_length=20):
    self.horizon_length = horizon_length
    self.points_msgs = points_msgs
    self.time_steps = len(self.points_msgs)
    # Position
    self.x = np.empty((horizon_length, self.time_steps))
    self.y = np.empty((horizon_length, self.time_steps))
    self.z = np.empty((horizon_length, self.time_steps))
    # Orientation
    self.qw = np.ones((horizon_length, self.time_steps))
    self.qx = np.empty((horizon_length, self.time_steps))
    self.qy = np.empty((horizon_length, self.time_steps))
    self.qz = np.empty((horizon_length, self.time_steps))
    # Velocity
    self.vx = np.empty((horizon_length, self.time_steps))
    self.vy = np.empty((horizon_length, self.time_steps))
    self.vz = np.empty((horizon_length, self.time_steps))
    # Angular velocity
    self.wx = np.empty((horizon_length, self.time_steps))
    self.wy = np.empty((horizon_length, self.time_steps))
    self.wz = np.empty((horizon_length, self.time_steps))

    # print(len(self.wx[1]))

    self.orderHorizonPoints()
    self.LightTheStructure()

  def orderHorizonPoints(self):
    j = 0
    for msg in self.points_msgs:
      for i in range(self.horizon_length):
        self.x[i,j]  = msg[i].pose.position.x
        self.y[i,j]  = msg[i].pose.position.y
        self.z[i,j]  = msg[i].pose.position.z
        self.qw[i,j] = msg[i].pose.orientation.w
        self.qx[i,j] = msg[i].pose.orientation.x
        self.qy[i,j] = msg[i].pose.orientation.y
        self.qz[i,j] = msg[i].pose.orientation.z
        self.vx[i,j] = msg[i].velocity.linear.x
        self.vy[i,j] = msg[i].velocity.linear.y
        self.vz[i,j] = msg[i].velocity.linear.z
        self.wx[i,j] = msg[i].velocity.angular.x
        self.wy[i,j] = msg[i].velocity.angular.y
        self.wz[i,j] = msg[i].velocity.angular.z

      j = j+1

  def LightTheStructure(self):
    self.points_msgs = None

class MPCSolver:
  def __init__(self, msgs, horizon_length=20):
    self.msgs = msgs
    self.horizon_length = np.empty((len(msgs)))
    self.execution_time = np.empty((len(msgs)))
    self.objective_function_value = np.empty((len(msgs)))
    self.solver_status = np.empty((len(msgs)))
    self.solver_status_dict = self.build_status_dictionary()
    self.time = np.empty((len(msgs)))

    self.buildStructure()
    self.defineTime()
    self.LightTheStructure()

  def buildStructure(self):
    i = 0
    for msg in self.msgs:
      self.execution_time[i] = msg.execution_time
      self.objective_function_value[i] = msg.objective_function_value
      self.solver_status[i] = msg.solver_status

      i += 1
  def LightTheStructure(self):
    self.msgs = None

  def defineTime(self):
    t_start = self.msgs[0].header.stamp.to_sec()
    it = 0
    # print(self.msgs[0].header.stamp.to_sec())
    for i in self.msgs:
      self.time[it] = i.header.stamp.to_sec() - t_start
      it = it + 1

  def build_status_dictionary(self):
    status_dict = {
      0 : "Solver Good",
      31 : "DoF of control problems > 0",
      33 : "Problem isn't convex",
      57 : "RET_WORKINGSET_UPDATE_FAILED",
      58 : "Maximum number of working set recalculations performed"
    }
    return status_dict

class Trajectory:
  def __init__(self, msgs):
    self.msgs = msgs

    # Position
    self.x = np.empty((len(msgs)))
    self.y = np.empty((len(msgs)))
    self.z = np.empty((len(msgs)))
    # Orientation
    self.qw = np.ones((len(msgs)))
    self.qx = np.empty((len(msgs)))
    self.qy = np.empty((len(msgs)))
    self.qz = np.empty((len(msgs)))

    self.buildStructure()
    self.LightTheStructure()

  def buildStructure(self):
    i = 0
    for msg in self.msgs:
      self.x[i] = msg.position.x
      self.y[i] = msg.position.y
      self.z[i] = msg.position.z
      self.qw[i] = msg.orientation.w
      self.qx[i] = msg.orientation.x
      self.qy[i] = msg.orientation.y
      self.qz[i] = msg.orientation.z

      i = i+1
    # Roll & Pitch
    self.pitch = np.arcsin(2 * (self.qw * self.qy - self.qz * self.qx))
    self.roll = np.arctan2(2 * (self.qw * self.qx + self.qy * self.qz),( 1 - 2 * (self.qx * self.qx + self.qy * self.qy)) )

  def LightTheStructure(self):
    self.msgs = None

class ExternalWrench:
  def __init__(self, msgs):
    self.msgs = msgs

    # External Force
    self.fx = np.empty((len(msgs)))
    self.fy = np.empty((len(msgs)))
    self.fz = np.empty((len(msgs)))
    # External Torque
    self.tx = np.empty((len(msgs)))
    self.ty = np.empty((len(msgs)))
    self.tz = np.empty((len(msgs)))

    self.buildStructure()
    self.LightTheStructure()

  def buildStructure(self):
    i = 0
    for msg in self.msgs:
      self.fx[i] = msg.force.x
      self.fy[i] = msg.force.y
      self.fz[i] = msg.force.z
      self.tx[i] = msg.torque.x
      self.ty[i] = msg.torque.y
      self.tz[i] = msg.torque.z

      i = i+1

  def LightTheStructure(self):
    self.msgs = None


class ControlCommand:
  def __init__(self, msgs):
    self.msgs = msgs
    self.time = np.empty((len(msgs)))

    # Desired Orientation
    self.qw = np.ones((len(msgs)))
    self.qx = np.empty((len(msgs)))
    self.qy = np.empty((len(msgs)))
    self.qz = np.empty((len(msgs)))

    self.pitch = np.empty((len(msgs)))
    self.roll = np.empty((len(msgs)))
    # Desired bodyRate
    self.wx = np.empty((len(msgs)))
    self.wy = np.empty((len(msgs)))
    self.wz = np.empty((len(msgs)))
    # Desired Torque
    self.tx = np.empty((len(msgs)))
    self.ty = np.empty((len(msgs)))
    self.tz = np.empty((len(msgs)))
    # Desired Collective_thrust
    self.thrust = np.empty((len(msgs)))

    self.buildStructure()
    self.defineTime()
    self.LightTheStructure()

  def buildStructure(self):
    i = 0
    for msg in self.msgs:
      # self.control_mode==1:
      self.qw[i] = msg.orientation.w
      self.qx[i] = msg.orientation.x
      self.qy[i] = msg.orientation.y
      self.qz[i] = msg.orientation.z
      # Roll & Pitch
      self.pitch[i] = np.arcsin(2 * (self.qw[i] * self.qy[i] - self.qz[i] * self.qx[i]))
      self.roll[i] = np.arctan2(2 * (self.qw[i] * self.qx[i] + self.qy[i] * self.qz[i]),( 1 - 2 * (self.qx[i] * self.qx[i] + self.qy[i] * self.qy[i])) )
      # self.control_mode==2:
      self.wx[i] = msg.bodyrates.x
      self.wy[i] = msg.bodyrates.y
      self.wz[i] = msg.bodyrates.z
      # self.control_mode==4:
      self.tx[i] = msg.torque.x
      self.ty[i] = msg.torque.y
      self.tz[i] = msg.torque.z
      
      self.thrust[i] = msg.collective_thrust

      i = i+1

  def defineTime(self):
    t_start = self.msgs[0].header.stamp.to_sec()
    it = 0
    # print(self.msgs[0].header.stamp.to_sec())
    for i in self.msgs:
      self.time[it] = i.header.stamp.to_sec() - t_start
      it = it + 1

  def LightTheStructure(self):
    self.msgs = None