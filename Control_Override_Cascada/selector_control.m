function modo_control = selector_control(in)
% Función para decidir qué referencia se le pasa al control
modo_control_ant=in(1);
e_u=in(2);
e_d=in(3);


	if modo_control_ant==1
		% Control de velocidad
		if(e_d>0)
			% Nos acercamos demasiado al coche de delante, se cambia a control de distancia
			modo_control=2;
		else
			modo_control=1;
		end
	elseif modo_control_ant==2
		% control de distancia
		if(e_u<0)
			% El coche lider va demasiado rápido, se cambia a control de velocidad y se deja ir
			modo_control=1;
		else
			modo_control=2;
		end
	else 
		% Valor inválido de variable "modo_control_ant" 
		% Esto ocurre en la primera interación de la simulación 
		% Se deja inicializado al control de velocidad 
		modo_control=1;  
	end

end
