%Coche Koenigsegg Agera R
%Especificaciones t�cnicas https://www.koenigsegg.com/car/agera-r/

% Par�metros del veh�culo %
Cd = 0.33;
frontalArea = 1.873;
masa = 1435;
densidadAire = 1.202;

% Par�metros iniciales de la simulaci�n %
V_ego_init = 90/3.6; % Velocidad inicial del EGO Car %
P_ego_init = -200; % Posicion Inicial del coche EGO %

T2 = 10; % pendiente %
IV2 = 0;
FV2 = 0;

T3 = 10; % viento %
IV3 = 0;
FV3 = 0;

% Parametros de configuracion del controlador %
d_min = 10; % Distancia m�nima de seguridad en todo caso %
t_gap = 1.5; % segundos que tarda en frenar por cada mps del EGO %
Ts = 0.1; %Tiempo de muestreo del controlador %
Ft_min = -3000; % Valor m�nimo de Ft (frenado)
Ft_max = 2000; % Valor m�ximo de Ft (aceleracion)
fault_d = 200; % Valor de distancia m�xima leible %

% Par�metros intr�nsecos del modelo %
u0 = V_ego_init;
uw = IV3;
Fx0 = 0.015*masa*9.81 + 0.5*densidadAire*frontalArea*Cd*(u0+uw)^2; % Punto de operaci�n %
K_lin = 1/(densidadAire*Cd*frontalArea*(u0+uw)); % Ganancia est�tica del modelo lineal de aceleraci�n %
tau_lin = masa/(densidadAire*Cd*frontalArea*(u0+uw)); % Constante de tiempo del modelo lineal de aceleraci�n %
