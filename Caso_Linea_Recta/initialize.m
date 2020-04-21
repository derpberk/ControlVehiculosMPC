% Parámetros iniciales de la simulación %
V_ego_init = 110/3.6; % Velocidad inicial del EGO Car %
P_ego_init = 0; % Posicion Inicial del coche EGO %
V_lead_init = 110/3.6; % Velocidad inicial del LEAD Car %
P_lead_init = P_ego_init + 30; % Posicion Inicial del coche LEAD %

% Parametros de configuracion del controlador %
d_min = 10; % Distancia mínima de seguridad en todo caso %
t_gap = 1.5; % segundos que tarda en frenar por cada mps del EGO %
Ts = 0.1; %Tiempo de muestreo del controlador % 
Ft_min = -3000; % Valor mínimo de Ft (frenado)
Ft_max = 2000; % Valor máximo de Ft (aceleracion)
fault_d = 200; % Valor de distancia máxima leible %

% Parámetros intrínsecos del modelo %
K_lin = 0.05; % Ganancia estática del modelo lineal de aceleración %
tau_lin = 81.1; % Constante de tiempo del modelo lineal de aceleración %
