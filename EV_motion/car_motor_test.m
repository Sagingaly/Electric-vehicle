% Friction force
m_car = 57; % Mass of the car in kg
g = 9.81; % Gravitational acceleration in m/s^2
n_friction = 0.02; % Rolling resistance coefficient

F_friction = m_car * g * n_friction;

% Force of aerodynamic drag
P_density_of_air = 1.225; % Air density in kg/m^3
C_d = 0.04; % Drag coefficient
Area_front = 0.5; % Frontal area of the car in m^2
Velocity_const = 20; % Car speed in m/s

F_air = 0.5 * P_density_of_air * C_d * Area_front * (Velocity_const^2);


% Motor Type: Brushless DC Motor
motor_power = 2000; % Motor Power: 2000 W (2 kW)
motor_voltage = 48; % Voltage of motor
motor_rpm_speed = 4300; % RPM

angular_velocity = (motor_rpm_speed * 2 * 3.14)/60;

torque = motor_power/angular_velocity;


% Traction force
% T_torque = 4.43;  Torque in Nm
r_tire = 0.254; % Radius of the tire in meters

F_traction = torque / r_tire;

% Display results
disp(['Traction Force: ', num2str(F_traction)]);
disp(['Aerodynamic Drag Force: ', num2str(F_air)]);
disp(['Rolling Friction Force: ', num2str(F_friction)]);

% Check if the car can move
if F_traction > (F_air + F_friction)
    disp('Can pull');
else
    disp('Cannot pull');
end

