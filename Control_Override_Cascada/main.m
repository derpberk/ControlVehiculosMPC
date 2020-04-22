clear all; close all
parametros

F0 = punto_op(u_ini,theta,uw);
[tau,K] = modelo_lin(u_ini,uw);

mdl='simu_acc';
load_system(mdl)

if rampa_vl==0
	set_param(strcat(mdl,'/Manual Switch'),'sw','0');
	set_param(strcat(mdl,'/Manual Switch1'),'sw','0');
else 
	set_param(strcat(mdl,'/Manual Switch'),'sw','1');
	set_param(strcat(mdl,'/Manual Switch1'),'sw','1');
end


out=sim(mdl,'StartTime','0','StopTime',num2str(tsim),'MaxStep','1e-3');

figure
hold on
plot(out.Fx)
grid
xlabel('t')
ylabel('$F_x$(m/s)','Interpreter','Latex')
title('Fuerza de tracción controlada absoluta')
coloca_figura(1)

figure
hold on
plot(out.d)
plot(out.R,'--')
grid
xlabel('t (s)','Interpreter','Latex')
ylabel('$d$\ (m)','Interpreter','Latex')
title('Seguimiento de distancia')
gca.XLim=[0, tsim];
saveas(gcf,'pos.eps','epsc')
coloca_figura(2)

figure
hold on
plot(out.u)
plot(out.u_ref,'--')
grid
xlabel('t (s)','Interpreter','Latex')
ylabel('$u$\ (m)','Interpreter','Latex')
title('Seguimiento de velocidad')
gca.XLim=[0, tsim];
saveas(gcf,'pos.eps','epsc')
coloca_figura(3)

figure
hold on
plot(out.u);
plot(out.vl)
grid
xlabel('t (s)','Interpreter','Latex')
ylabel('$u$ (m/s)','Interpreter','Latex')
legend('vehículo perseguidor', 'vehículo lider')
title('Velocidad de los vehículos')
gca.XLim=[0, tsim];
saveas(gcf,'vel.eps','epsc')
coloca_figura(4)

%figure
%hold on
%plot(out.d)
%plot(out.d_lin)
%plot(out.R,'--')
%grid
%legend('u (modelo no lineal)', 'u (modelo lineal)', 'Referencia');
%xlabel('t')
%ylabel('$d$\ (m)','Interpreter','Latex')
%title('Comparación del seguimiento de distancia')
%gca.XLim=[0, tsim];
%saveas(gcf,'comp.eps','epsc')


%figure
%hold on
%plot(out.uw)
%grid
%xlabel('t')
%ylabel('uw(m/s)')
%title('Velocidad del viento')
%
%figure
%hold on
%plot(out.theta)
%grid
%xlabel('t')
%ylabel('$\theta$(m/s)','Interpreter','Latex')
%title('Pendiente del suelo')

figure
hold on
plot(out.modo_control)
grid
xlabel('t (s)','Interpreter','Latex')
ylabel('Controlador', 'Interpreter', 'Latex')
title('Modo de control')
%set( gca, 'YTickLabel', ["Control de velocidad";"Control de posición"] );
%set( gca, 'YTick', [1,2] );
%set( gca, 'YLim',[0.9, 2.1]);
coloca_figura(5)
