function [K1,K2,K3,K4,Kp] =disenna_control(tipo_cont,omega_c,K,tau)
	% K1: Ganancia de la distancia
	% K2: Ganancia de la velocidad del vehículo que persigue
	% K3: Ganancia de la integral del error
	% K4: Ganancia de la doble integral del error

	% Inicialización a 0
	K1=0;K2=0;K3=0;K4=0;
	Kp=0;

	switch tipo_cont
		case 0
		% Control P
			Kp=omega_c^2*tau/K;
			Kp=2;
		case 1
		% Control PI
			Ki=omega_c/K;
			Kp=Ki*tau;
			K3=-Ki;

			K3=-1e-2;
			%K3=0;
			Kp=1;
			
		case 2
		% Control por realimentación lineal del vector de estados
			Kp=0;
			A = [0     ,-1 	   ,0	   ,0     ;
			     0     ,-1/tau ,0	   ,0     ;
			     1     ,0 	   ,0	   ,0     ;
			     0     ,0 	   ,1	   ,0     ];
			B = [0   ;
		             K/tau;
		             0;
		             0];
			C = [1,0,0,0];
			P = [-0.36+0.1744i, -0.36-0.1744i, -1.08, -1.18];
			[K_vec,prec,msg] = place(A,B,P);
						
			K1=K_vec(1);
			K2=K_vec(2);
			K3=K_vec(3);
			K4=K_vec(4);
		otherwise
			error('valor a tipo_cont no valido')
	end
end
