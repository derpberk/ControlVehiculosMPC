function [tau K] = calcula_lin(V0,VW0)
	global m g f rho A Cd

	tau=m/(rho*Cd*A*(V0 + VW0));
	K=1/(rho*Cd*A*(V0 + VW0));


end

