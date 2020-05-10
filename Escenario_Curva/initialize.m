%Coche Koenigsegg Agera R
%Especificaciones técnicas https://www.koenigsegg.com/car/agera-r/

% Parámetros del vehículo %
Cd = 0.33;
frontalArea = 1.873;
masa = 1435;
densidadAire = 1.202;
L = 2.54;
a = 1.14;
b = L - a;
I_z = 2420;
C_af = 44000;
C_ar = 47000;

% Parámetros iniciales de la simulación %
V_ego_init = 30; % Velocidad inicial del EGO Car %
P_ego_init = [4.32 -7.3+1.8]; % Posicion Inicial del coche EGO %
Yaw_init = -25; %Posición angular inicial del coche EGO %

T2 = 10; % pendiente %
IV2 = 0;
FV2 = 0;

T3 = 10; % viento %
IV3 = 0;
FV3 = 0;

% Parametros de configuracion del controlador %
d_min = 10; % Distancia mínima de seguridad en todo caso %
t_gap = 1.5; % segundos que tarda en frenar por cada mps del EGO %
Ts = 0.1; %Tiempo de muestreo del controlador %
Ft_min = -3000; % Valor mínimo de Ft (frenado)
Ft_max = 2000; % Valor máximo de Ft (aceleracion)
fault_d = 200; % Valor de distancia máxima leible %

% Parámetros intrínsecos del modelo %
u0 = V_ego_init;
uw = IV3;
Fx0 = 0.015*masa*9.81 + 0.5*densidadAire*frontalArea*Cd*(u0+uw)^2; % Punto de operación %
K_lin = 1/(densidadAire*Cd*frontalArea*(u0+uw)); % Ganancia estática del modelo lineal de aceleración %
tau_lin = masa/(densidadAire*Cd*frontalArea*(u0+uw)); % Constante de tiempo del modelo lineal de aceleración %

% Control override (dinámica lateral) %

Lim_Beta = 3;
Lim_Yaw = 0.08;
off_factor = 0.9;
bias_factor = 0.8; %aumentar ligeramente para un rizado más lento

% Simulación del conductor %

sysdriver = c2d(tf(1,[0.25 1]),0.01);
[numdriver, dendriver,Tsdriver] = tfdata(sysdriver,'v');
