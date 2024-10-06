% Physical parameters of vehicle
m_car_kg = 57;            % mass of the car in kg
r_tire_m = 0.254;         % wheel radius in meters
N_friction = 0.02;        % rolling resistance coefficient

% Parameters of environment
P_DensityOfAir = 1.225;   % air density in kg/m^3
A_frontArea = 0.5;        % frontal area in m^2
Cd_aerodynamic_friction = 0.3; % aerodynamic drag coefficient

% Parameters of electric motor
P_max_Watt = 1000;        % maximum motor power in watts (W)
Vmax = 16.67;             % max vehicle speed in m/s (60 km/h)
w_max = Vmax / r_tire_m;  % maximum angular velocity in rad/s
V_max_voltage = 48;       % voltage in volts
I_current = P_max_Watt / V_max_voltage; % current in amps

% Initial conditions
v0 = 0;                   % initial velocity in m/s
x0 = 0;                   % initial position in meters
t_total = 60;             % total simulation time in seconds
g = 9.81;                 % gravitational acceleration in m/s^2

% Simulation setup
dt = 0.01;                % time step in seconds
t = 0;                    % initial time

% Initialize arrays to store results
velocities = [];
positions = [];
times = [];

v = v0;                   % initialize velocity
x = x0;                   % initialize position

% Time loop
while t < t_total
    % Calculate rolling resistance force
    F_friction = N_friction * m_car_kg * g;
    
    % Calculate aerodynamic drag force
    F_air = 0.5 * P_DensityOfAir * Cd_aerodynamic_friction * A_frontArea * v^2;
    
    % Calculate motor traction force (simplified as constant torque)
    T = P_max_Watt / w_max;  % approximate torque
    F_traction = T / r_tire_m;  % traction force
    
    % Calculate net force
    F_net = F_traction - (F_friction + F_air);
    
    % Calculate acceleration
    a = F_net / m_car_kg;
    
    % Update velocity and position
    v = v + a * dt;
    x = x + v * dt;
    
    % Update time
    t = t + dt;
    
    % Store data for plotting
    velocities(end+1) = v;
    positions(end+1) = x;
    times(end+1) = t;
end

% Visualization of results
figure;
subplot(2,1,1);
plot(times, velocities);
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Vehicle Velocity over Time');

subplot(2,1,2);
plot(times, positions);
xlabel('Time (s)');
ylabel('Position (m)');
title('Vehicle Position over Time');
