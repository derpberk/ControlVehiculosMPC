global m  rho  Cd  f  g  A

%% Parámetros del vehículo 
m=1015; % [Kg]
f=0.015; 
rho=1.202;
Cd=0.32;
g=9.8; % [m/s^2]
A=0.9*1.643*1.551; % [m^2]

% tiempo de simulación 
tsim=200; % [s]

%% Perturbaciones
% Salto en las perturbaciones a partir del pto de operación 
uw = 20;
theta = 0;
delta_uw=0; % [m/s]
delta_theta=0; % [rad]
% Tiempo en el que se aplica el salto de perturbaciones
t_pert=100;

% Selector de velocidad del lider
% rampa_vl == 1  -> cambio en forma de rampa
% rampa_vl == 0  -> cambio en forma de escalon
rampa_vl = 0;

% Velocidad inicial del lider
vl = 20; % [m/s]

% Escalon en la velocidad del lider
delta_vl = 2; %[m/s]

% Pendiente de la rampa que sigue la velocidad del lider
pend_vl= 1; % [(m/s)/s]

% Instante del cambio en vl
t_vl = 100;


%% Referencias
% Distancia de referencia
d_ref = 200; % [m]
delta_d_ref = 5; % [m]
% Velocidad de referencia
u_ref = 20 % [m/s]
delta_u_ref = 5; % [m/s]
% Instante del escalón 
t_ref=20; % [s]


%% Inicializaciónde los integradores
u_ini=20; % [m/s]
% Distancia inicial 
d_0 = 200; % [m]


%% Controladores
% Controlador de posición 
Kp_pos = -0.08;
Ki_pos = 0;
Kd_pos = 0;

% Controlador de velocidad 
Kp_vel = 100;
Ki_vel = 10;
Kd_vel = 0;
