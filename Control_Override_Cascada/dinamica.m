function out = dinamica(in)

u=in(1);
uw=in(2);
theta=in(3);
Fx=in(4);

global m l rho  Cd  f  g  A
% Fuerza de rozamiento aerodinámico.
% Se le añade el signo para el caso que retroceda
Da=0.5*rho*Cd*A*(u+uw)^2*sign(u+uw); Fz=m*g*cos(theta);

% Fuerza de rozmiento de los neumáticos
Rx=f*Fz;

% Fuerza total sobre el vehículo
F=-Da -  m*g*sin(theta) -Rx + Fx;

% 2da ley de Newton
a=F/m;

out=a;

end

