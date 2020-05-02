function  d = distancia_seguridad(Vo)
global a_fren

% Cálculo de la distancia de frenado suponiendo una aceleración 
% constante igual al parametro  "-a_fren" definido en "parámetros.m"

% El tiempo de frenado ante aceleración cte, es igual a 
% t_fren=Vo/a_fren

% Por otro lado, la distancia de frenado es:
% d=t_fren*Vo/2

% Se sustituye la primera expresión en la segunda:
d=Vo^2/(a_fren*2);

end
