function coloca_figura(pos)
	% No están disponibles todos los pixeles de la pantalla
	w_screen=1920-100;
	h_screen=1080-50;

	n_h=2;
	n_w=3;

	h=h_screen/n_h;
	w=w_screen/n_w;

	w_pos=floor((pos-1)/n_h)*w+70;
	h_pos=mod(pos-1,n_h)*h;

	set(gcf,'Renderer', 'painters', 'Units', 'pixels', 'OuterPosition', [w_pos,h_pos, w, h]);

end
