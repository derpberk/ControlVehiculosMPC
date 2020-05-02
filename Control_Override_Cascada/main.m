clear all; close all
parametros

F0 = punto_op([u_ini,theta,uw]);
[tau,K] = modelo_lin(u_ini,uw);

mdl='simu_acc';
load_system(mdl)

if rampa_vl==0
	set_param(strcat(mdl,'/Manual Switch'),'sw','1');
	set_param(strcat(mdl,'/Manual Switch1'),'sw','1');
else 
	set_param(strcat(mdl,'/Manual Switch'),'sw','0');
	set_param(strcat(mdl,'/Manual Switch1'),'sw','0');
end


out=sim(mdl,'StartTime','0','StopTime',num2str(tsim),'MaxStep','1e-3');

figure
hold on
plot(out.Fx)
grid
xlabel('t')
ylabel('$F_x$(m/s)','Interpreter','Latex')
title('Fuerza de tracción controlada absoluta')
saveas(gcf,'graficas/F.eps','epsc')
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
saveas(gcf,'graficas/pos.eps','epsc')
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
saveas(gcf,'graficas/segVel.eps','epsc')
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
saveas(gcf,'graficas/vel.eps','epsc')
coloca_figura(4)


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
yticks([1,2])
yticklabels({'Control de velocidad','Control de posición'})
ylim([0.5,2.5])
saveas(gcf,'graficas/modo_control.eps','epsc')
coloca_figura(5)
