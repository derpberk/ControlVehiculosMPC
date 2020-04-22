function F0 = punto_op(V0,theta0,VW0)
	global m g f rho A Cd

	F0 = m*g*sin(theta0) + f*m*g*cos(theta0) + 0.5*rho*A*Cd*(V0 + VW0)^2;	

end
