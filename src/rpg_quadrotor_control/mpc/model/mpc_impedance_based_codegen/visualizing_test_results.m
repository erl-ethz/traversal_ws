mpc_vars = importdata("mpc_drone.txt", " ");
drone_state = mpc_vars(:,1:10);
drone_input_impedance = mpc_vars(:,11:16);
drone_input_standard = mpc_vars(:,17:20);
NSteps = size(drone_state,1);

dt = 0.05;
t = 0:0.05:0.05*(NSteps-1);

x = drone_state(:,1);
y = drone_state(:,2);
z = drone_state(:,3);
v_x = drone_state(:,4);
v_y = drone_state(:,5);
v_z = drone_state(:,6);
euler = quat2eul(drone_state(:,7:10));
% magnitude_quaternion = zeros(NSteps,1);
% quat_normalized = zeros(NSteps,4);
% for i=1:NSteps
%     magnitude_quaternion(i) = norm(drone_state(i,7:10));
%     quat_normalized(i,:) = drone_state(i, 7:10)/magnitude_quaternion(i);
% end


%% Control variables check
g = 9.81;
M = 0.742;
D_x = 1; D_y = 1; D_z = 5;
v_desired_x = drone_input_impedance(:,1);
v_desired_y = drone_input_impedance(:,2);
v_desired_z = drone_input_impedance(:,3);
a_desired_x = drone_input_impedance(:,4);
a_desired_y = drone_input_impedance(:,5);
a_desired_z = drone_input_impedance(:,6);
thrust_true = drone_input_standard(:,4);

s_x = - a_desired_x - D_x/M*(v_desired_x-v_x);
s_y = - a_desired_y - D_y/M*(v_desired_y-v_y);
s_z = - a_desired_z - D_z/M*(v_desired_z-v_z) - g;
thrust_impedance = sqrt(s_x.^2 + s_y.^2 + s_z.^2);
figure(1)
plot(t, thrust_impedance, t, thrust_true)
xlabel('Time (s)'), ylabel('Acceleration (m/s^2)')
legend('Real thrust', 'Position impedance thrust')

figure(2)
plot(t, thrust_impedance - thrust_true)
title('Error between real and impedance thrust')

%% plots dynamics
figure(1)
plot(t,x), xlabel("Time (s)"), ylabel("X (m)")

figure(2)
plot(t,y), xlabel("Time (s)"), ylabel("Y (m)")

figure(3)
plot(t,z), xlabel("Time (s)"), ylabel("Z (m)")

figure(4)
plot(t,v_z), xlabel("Time (s)"), ylabel("V_z (m/s)")

figure(5)
plot3(x,y,z) , xlabel("X (m)"), ylabel("Y (m)"), zlabel("Z (m)")

figure(6)
plot(t, euler*180/pi), hold on

roll_impedance = asin(-s_y./thrust_impedance);
pitch_impedance = atan(s_x./s_z);
plot(t, roll_impedance*180/pi), hold on
plot(t, pitch_impedance*180/pi), legend('roll','pitch','yaw','roll impedance','pitch impedance')