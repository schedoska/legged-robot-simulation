clear all;

%example = matfile('CHODZENIE\q_kroki_1.mat');
%example = matfile('CHODZENIE\q_kroki_2.mat');
example = matfile('save_q.mat');
q_n = example.q_n_record;

% q_n = [0.7227 -1.4455 0.7227 -1.4455 0.9808 -1.3181 0.7227 -1.4455 0 0 0 0 0 0 0 0 0 0];
% q0_IK = 1.0414  ;
% q1_IK = -2.0828;
% for k = 0:3
%     q_n(1+k*2) = q0_IK;
%     q_n(2+k*2) = q1_IK;
% end
% %0.5449   -2.2495    0.8783   -1.8156
% %1.1163   -1.5764    1.4488   -2.0652
% 1.15922
 % q_n = [ 1.15922   -2.31854524824620 1.15922   -2.31854524824620 1.15922   -2.31854524824620 1.15922   -2.31854524824620...
 % 1 0 -0.0 0 0.0 0 0 0 0 0];






g = 9.8;
m = 1;
a1 = 1;
a2 = 1;
a3 = 0.5;
a4 = 1;

q0_PG = 0.7;
q1_PG = -1.4;
q0_PD = 0.7;
q1_PD = -1.4;
q0_LG = 0.7;
q1_LG = -1.4;
q0_LD = 0.7;
q1_LD = -1.4;

x = 0;
y = 0;
z = 0;
or_x = 0;
or_y = 0;
or_z = 0;
 
f = figure;
f.Position = [250 100 1000 700];

% hold on;
% grid on;
% plot(0.5,1,'-r*')
% plot(0.5,-1,'-r*')
% plot(-0.5,-1,'-r*')
% plot(0,-0,'-r*')
% return;
% 
% grid on;
% hold on;
% % plot([1:1:200000],q_n(:,15));
% % plot([1:1:200000],q_n(:,18));
% % plot([1:1:200000],q_n(:,21));
% % plot([1:1:200000],q_n(:,24));
% plot([1:1:200000],q_n(:,11));
% return

% feetPos = zeros(200000,3);
% for i = 1:1:200000
%     q0_PG = q_n(i,1);
% q1_PG = q_n(i,2);
% q0_PD = q_n(i,3);
% q1_PD = q_n(i,4);
% q0_LG = q_n(i,7);
% q1_LG = q_n(i,8);
% q0_LD = q_n(i,5);
% q1_LD = q_n(i,6);
% 
% x = q_n(i,9);
% y = q_n(i,10);
% z = q_n(i,11);
% or_x = q_n(i,12);
% or_y = q_n(i,13);
% or_z = q_n(i,14);
%     s2_PD = [x - a4*sin(or_y) - a3*cos(or_y)*sin(or_z) + a1*sin(or_y)*sin(q0_PD) + a2*cos(q1_PD)*(sin(or_y)*sin(q0_PD) - cos(or_y)*cos(or_z)*cos(q0_PD)) + a2*sin(q1_PD)*(cos(q0_PD)*sin(or_y) + cos(or_y)*cos(or_z)*sin(q0_PD)) - a1*cos(or_y)*cos(or_z)*cos(q0_PD);
% y + a3*(cos(or_x)*cos(or_z) - sin(or_x)*sin(or_y)*sin(or_z)) - a2*cos(q1_PD)*(cos(q0_PD)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) + cos(or_y)*sin(or_x)*sin(q0_PD)) + a2*sin(q1_PD)*(sin(q0_PD)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - cos(or_y)*cos(q0_PD)*sin(or_x)) + a4*cos(or_y)*sin(or_x) - a1*cos(q0_PD)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - a1*cos(or_y)*sin(or_x)*sin(q0_PD);
% z + a3*(cos(or_z)*sin(or_x) + cos(or_x)*sin(or_y)*sin(or_z)) - a2*cos(q1_PD)*(cos(q0_PD)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) - cos(or_x)*cos(or_y)*sin(q0_PD)) + a2*sin(q1_PD)*(sin(q0_PD)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + cos(or_x)*cos(or_y)*cos(q0_PD)) - a4*cos(or_x)*cos(or_y) - a1*cos(q0_PD)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + a1*cos(or_x)*cos(or_y)*sin(q0_PD);
% 1];
%     feetPos(i,1)=s2_PD(3);
% end
% 
% plot(1:1:200000,feetPos(:,1));
% grid on;
% return
% % 
% 
time_step = 0.0001;
t = 1:1:100000;
wys = 1-0.2*cos(t/(5/time_step)*2*pi);
szer = 0.2*sin(t/(5/time_step)*2*pi);
kat = 0.1*sin(t/(5/time_step)*2*pi);
% 
% hhh = figure;
% hold on;
% grid on;
% plot(q_n(2600:(2600+4877),11),q_n(2600:(2600+4877),9),'k')
% %plot(szer(1:50000),wys(1:50000),'--b')
% %plot(1:1:100000,q_n(:,9)-wys.');
% axis equal
% xlabel('$z \: [m]$','interpreter','latex');
% ylabel('$x \: [m]$','interpreter','latex');
% % axis([0 1 1.45 2.05])
% legend('$x(t), z(t)$','$x_d(t), z_d(t)$','interpreter','latex');
% title('Algorytm Qu-Dorseya: $K_p=150$, $K_d=15$','interpreter','latex')
% return

% hhh = figure;
% hold on;
% grid on;
% % plot(q_n(:,11),q_n(:,9),'k','LineWidth',0.9)
% % plot(szer,wys,':','Color',[0.600  0.6 0.6],'LineWidth',0.9)
% plot(1:1:20000,q_n(:,13),'k')
% %plot(1:1:100000,kat,'--b')
% %axis equal
% xlabel('$t \: [s]$','interpreter','latex');
% ylabel('$\phi \: [rad]$','interpreter','latex');
% % axis([0 1 1.45 2.05])
% legend('$\phi(t)$','$\phi_d(t)$','interpreter','latex');
% title('Algorytm Qu-Dorseya: $K_p=150$, $K_d=15$','interpreter','latex')
% return

hhh = figure;
hold on;
grid on;
% plot(q_n(:,11),q_n(:,9),'k')
% plot(szer,wys,'--b')
% plot(time_step:time_step:10,-wys.'+q_n(:,9),'-.k')
% plot(time_step:time_step:10,-szer.'+q_n(:,11),'k')
plot(time_step:time_step:10,-kat.'+q_n(:,13),'k')
% axis equal
xlabel('$t \: [s]$','interpreter','latex');
ylabel('$e \: [rad]$','interpreter','latex');
% axis([0 1 1.45 2.05])
legend('$e_\phi(t)$','interpreter','latex');
%legend('$e_\phi$','interpreter','latex');
title('Algorytm obliczanego momentu: $K_p=10$, $K_d=10$','interpreter','latex')
return



% hhh = figure;
% subplot(2,1,1);
% hold on;
% grid on;
% %plot(q_n(:,11),q_n(:,9),'k')
% %plot(szer,wys,'--b')
% plot(5:1:99997,q_n(5:99997,21)-wys(5:99997).','--b');
% plot(5:1:99997,q_n(5:99997,24)-wys(5:99997).','--k');
% plot(5:1:99997,q_n(5:99997,15)-wys(5:99997).','b');
% plot(5:1:99997,q_n(5:99997,18)-wys(5:99997).','k');
% %axis equal
% xlabel('$t \: [s]$','interpreter','latex');
% ylabel('$\lambda_x \: [N]$','interpreter','latex');
% % axis([0 1 1.45 2.05])
% legend('$\lambda_{x_{LG}}(t)$','$\lambda_{x_{LD}}(t)$','$\lambda_{x_{PD}}(t)$','$\lambda_{x_{PG}}(t)$','interpreter','latex');
% title('Siły reakcji podłoża λ_x')
% return

%----------------------------------------------------- SKOK
sHIstory = zeros(4,20000);

% for i = 1:20000
%     q0_PG = q_n(i,1);
% q1_PG = q_n(i,2);
% q0_PD = q_n(i,3);
% q1_PD = q_n(i,4);
% q0_LG = q_n(i,7);
% q1_LG = q_n(i,8);
% q0_LD = q_n(i,5);
% q1_LD = q_n(i,6);
% 
% x = q_n(i,9);
% y = q_n(i,10);
% z = q_n(i,11);
% or_x = q_n(i,12);
% or_y = q_n(i,13);
% or_z = q_n(i,14);
%     s2_PD = [x - a4*sin(or_y) - a3*cos(or_y)*sin(or_z) + a1*sin(or_y)*sin(q0_PD) + a2*cos(q1_PD)*(sin(or_y)*sin(q0_PD) - cos(or_y)*cos(or_z)*cos(q0_PD)) + a2*sin(q1_PD)*(cos(q0_PD)*sin(or_y) + cos(or_y)*cos(or_z)*sin(q0_PD)) - a1*cos(or_y)*cos(or_z)*cos(q0_PD);
% y + a3*(cos(or_x)*cos(or_z) - sin(or_x)*sin(or_y)*sin(or_z)) - a2*cos(q1_PD)*(cos(q0_PD)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) + cos(or_y)*sin(or_x)*sin(q0_PD)) + a2*sin(q1_PD)*(sin(q0_PD)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - cos(or_y)*cos(q0_PD)*sin(or_x)) + a4*cos(or_y)*sin(or_x) - a1*cos(q0_PD)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - a1*cos(or_y)*sin(or_x)*sin(q0_PD);
% z + a3*(cos(or_z)*sin(or_x) + cos(or_x)*sin(or_y)*sin(or_z)) - a2*cos(q1_PD)*(cos(q0_PD)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) - cos(or_x)*cos(or_y)*sin(q0_PD)) + a2*sin(q1_PD)*(sin(q0_PD)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + cos(or_x)*cos(or_y)*cos(q0_PD)) - a4*cos(or_x)*cos(or_y) - a1*cos(q0_PD)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + a1*cos(or_x)*cos(or_y)*sin(q0_PD);
% 1];
%     s2_PG = [x + a4*sin(or_y) - a3*cos(or_y)*sin(or_z) + a1*sin(or_y)*sin(q0_PG) + a2*cos(q1_PG)*(sin(or_y)*sin(q0_PG) - cos(or_y)*cos(or_z)*cos(q0_PG)) + a2*sin(q1_PG)*(cos(q0_PG)*sin(or_y) + cos(or_y)*cos(or_z)*sin(q0_PG)) - a1*cos(or_y)*cos(or_z)*cos(q0_PG);
% y + a3*(cos(or_x)*cos(or_z) - sin(or_x)*sin(or_y)*sin(or_z)) - a2*cos(q1_PG)*(cos(q0_PG)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) + cos(or_y)*sin(or_x)*sin(q0_PG)) + a2*sin(q1_PG)*(sin(q0_PG)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - cos(or_y)*cos(q0_PG)*sin(or_x)) - a4*cos(or_y)*sin(or_x) - a1*cos(q0_PG)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - a1*cos(or_y)*sin(or_x)*sin(q0_PG);
% z + a3*(cos(or_z)*sin(or_x) + cos(or_x)*sin(or_y)*sin(or_z)) - a2*cos(q1_PG)*(cos(q0_PG)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) - cos(or_x)*cos(or_y)*sin(q0_PG)) + a2*sin(q1_PG)*(sin(q0_PG)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + cos(or_x)*cos(or_y)*cos(q0_PG)) + a4*cos(or_x)*cos(or_y) - a1*cos(q0_PG)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + a1*cos(or_x)*cos(or_y)*sin(q0_PG);
% 1];
%     sHIstory(:,i) = [s2_PG(1); s2_PG(3);s2_PD(1); s2_PD(3)];
% end


% hhh = figure;
% x = [-5,-2,-2,2];
% y = [0.5,0.5,0,0];
% 
% ggkkg = -0.5:-0.0001:-3;
% wykresos = -0.4565*ggkkg.^2-1.7978*ggkkg+0.4152;
% 
% hold on;
% grid on;
% 
% 
% plot(q_n(2500:(2500+7631),11),q_n(2500:(2500+7631),9),'k')
% %plot(q_n((2600+6356):20000,11),q_n((2600+6356):20000,9),'g')
% plot(sHIstory(2,1:(2500+7631)),sHIstory(1,1:(2500+7631)),':','Color',[0.2 0.2 0.2])
% plot(sHIstory(4,1:(2500+7631)),sHIstory(3,1:(2500+7631)),'--','Color',[0.6 0.6 0.6])
% plot(ggkkg, wykresos, '--b');
% 
% plot(x,y,'-.','Color',[0 0 0]);
% plot(q_n(1:2500,11),q_n(1:2500,9),'c')
% %plot(q_n(1:2600,11),q_n(1:2600,9),'Color',[0.412, 0.839, 1])
% plot(-0.5,1.2,'ob');
% plot(-3,1.7,'ob');
% plot(-1,1.75,'ob');
% 
% 
% axis equal
% xlabel('$x \: [m]$','interpreter','latex');
% ylabel('$y \: [m]$','interpreter','latex');
% % axis([0 1 1.45 2.05])
% legend('$r(t)$','$s_{PD}(t), s_{LD}(t)$','$s_{PG}(t), s_{LG}(t)$','$r_d(t)$','$G_l(y,z)$','$r_0(t)$','interpreter','latex');
% title('Trajektoria skoku','interpreter','latex')
% return


%--------- TRAJEKOTRIE X i Y
% hhh = figure;
%  hold on;
% grid on;
% 
% ujax = time_step:time_step:0.7576;
% z_trajectory = 1.2+4.3723*ujax-(9.8/2)*ujax.^2;
% x_trajectory = -0.5-3.2998*ujax;
% ujax2 = time_step:time_step:0.25;
% z_trajectory2 = (3.4393/0.25)*(ujax2.^2)/2+0.6701;
% 
% w = time_step:time_step:(0.7576);
% 
% plot(-0.25:time_step:1.7499,q_n(:,11),'k')
% plot(time_step:time_step:(0.7576),x_trajectory,'--b')
% 
% %plot(-0.25:time_step:1.7499,q_n(:,9),'k')
% %plot(time_step:time_step:(0.7576),z_trajectory,'--b')
% xline(0,'--k')
% xline(0.7576,'--k')
% plot(0,-0.5,'-ob');
% plot(0.7576,-3,'-ob');
% 
% 
% 
% xlabel('$t \: [s]$','interpreter','latex');
% ylabel('$z \: [m]$','interpreter','latex');
%  axis([-0.25 1.75 -3.5 0])
% legend('$z(t)$','$z_d(t)$','$t=0$: $z_d(t)=z_0$','$t=0.75$: $z_d(t)=z_l$','interpreter','latex');
% title('Trajektoria skoku','interpreter','latex')
% text(-0.23,-3.25,'Rozpęd')
% text(0.25,-3.25,'Faza lotu')
% text(1.1,-3.25,'Faza lądowania')
% return

% WYKRSY PREDKOSCI PRZY ROZPEDZANIU

% predkoscuCenter = zeros(2,2500);
% for i = 1:2500
%     predkoscuCenter(1,i) = (q_n(i+1,9)-q_n(i,9))/time_step;
%     predkoscuCenter(2,i) = (q_n(i+1,11)-q_n(i,11))/time_step;
% end
% hhh = figure;
%   hold on;
%  grid on;
% 
%  timeimis = time_step:time_step:0.25;
%  x_trajaja = 0.6535+(4.3723/0.25).*(timeimis.^2)./2;
%  z_trajaja = -0.0875+(-3.2998/0.25).*(timeimis.^2)./2;
% 
% 
%  plot(timeimis, x_trajaja.'-q_n(1:2500,9),'--k');
%   plot(timeimis, z_trajaja.'-q_n(1:2500,11),'k');
%   xlabel('$t \: [s]$','interpreter','latex');
% ylabel('$e \: [m]$','interpreter','latex');
%   % axis([-0.25 1.75 -3.5 0])
%  legend('$e_x(t)$','$e_z(t)$','interpreter','latex');
%  title('Błąd śledzenia trajektorii rozpędu')
% 
%  return

% WYKRSY SIL REAKCJI SKOKU

% hhh = figure;
%    hold on;
%   grid on;
% plot([-0.25:time_step:1.7499],q_n(:,15),'k');
% plot([-0.25:time_step:1.7499],q_n(:,18),'b');
% % plot([time_step:time_step:2],q_n(:,21));
% % plot([time_step:time_step:2],q_n(:,24));
% % plot([time_step:time_step:2],q_n(:,9));
% axis([-0.25 1.75 -200 1250])
% 
% xline(0,'--','Color',[0.5,0.5,0.5]);
% xline(0.7476,'--','Color',[0.5,0.5,0.5])
% 
% xlabel('$t \: [s]$','interpreter','latex');
% ylabel('$\lambda_x \: [N]$','interpreter','latex');
%   % axis([-0.25 1.75 -3.5 0])
%  legend('$\lambda_{x_{PD}}(t),\lambda_{x_{LD}}(t)$','$\lambda_{x_{PG}}(t),\lambda_{x_{LG}}(t)$','interpreter','latex');
%  title('Siły nacisku nóg na podłoże');
%  text(-0.23,-90,'Rozpęd')
% text(0.25,-90,'Faza lotu')
% text(1.1,-90,'Faza lądowania')
% return

%----------------------------------------------------- SKOK




%------------------------------------- WYKRESY CHODZENIE XDDDDDDD

hhh = figure;

hold on;
grid on;

% subplot(3,1,1)
% hold on;
% grid on;
% plot(time_step:time_step:14,q_n(1:140000,12),'k')
% ylabel('$\theta \: [rad]$','interpreter','latex');
% legend('$\theta(t) - OX_W$','interpreter','latex');
% subplot(3,1,2)
% hold on;
% grid on;
% plot(time_step:time_step:14,q_n(1:140000,13),'k')
% ylabel('$\phi \: [rad]$','interpreter','latex');
% legend('$\phi(t) - OY_W$','interpreter','latex');
% subplot(3,1,3)
% hold on;
% grid on;
% plot(time_step:time_step:14,q_n(1:140000,14),'k')
% ylabel('$\psi \: [rad]$','interpreter','latex');
% legend('$\psi(t) - OZ_W$','interpreter','latex');
% plot(q_n(1:140000,11),q_n(1:140000,10),'k')
% plot(0,0,'-ob')
% plot(-0.7748, -0.0125,'-ob')
% axis equal;
% 
% xlabel('$z \: [s]$','interpreter','latex');
% ylabel('$y \: [m]$','interpreter','latex');
% % axis([0 1 1.45 2.05])
% legend('$y(t),z(t)$','interpreter','latex');
% title('Trajektoria chodu','interpreter','latex')
% return

% hhh = figure;
% 
% hold on;
% grid on;
% 
% plot(time_step:time_step:14,q_n(1:140000,15),'b');
% plot(time_step:time_step:14,q_n(1:140000,18),'Color',[0.412, 0.671, 0.949]);
% plot(time_step:time_step:14,q_n(1:140000,21),'Color',[0.6,0.6,0.6]);
% plot(time_step:time_step:14,q_n(1:140000,24),'k');
% 
% xlabel('$t \: [s]$','interpreter','latex');
% ylabel('$\lambda_x \: [m]$','interpreter','latex');
% % axis([0 1 1.45 2.05])
% legend('$\lambda_{x_{PD}}(t)$','$\lambda_{x_{PG}}(t)$','$\lambda_{x_{LG}}(t)$','$\lambda_{x_{LD}}(t)$','interpreter','latex');
% title('Siła nacisku na podłoże','interpreter','latex')
% return


% hhh = figure;
% 
% hold on;
% grid on;
% 
% pontaxY = [0,0.125,0.25]
% pontasX = [1.3,0.925,1.3]
% plot(pontaxY, pontasX, 'k');
% plot([0.25,0],[1.3,1.3], '--b')
% 
% 
% 
% set ( gca, 'ydir', 'reverse' )
% axis equal;
% 
% xlabel('$y \: [m]$','interpreter','latex');
% ylabel('$x \: [m]$','interpreter','latex');
% % axis([0 1 1.45 2.05])
% legend('$p_d(t) - Faza \: swobodna$','$p_d(t) - Faza \: podpierania$','interpreter','latex');
% title('Ścieżka ruchu nogi w czasie cyklu','interpreter','latex')
% return





% hhh = figure;
% 
% hold on;
% grid on;
% 
% plot([time_step:time_step:14],XY_trajectory(1:140000,1));
% 
% 
% 
% set ( gca, 'ydir', 'reverse' )
% axis equal;
% 
% xlabel('$y \: [m]$','interpreter','latex');
% ylabel('$x \: [m]$','interpreter','latex');
% % axis([0 1 1.45 2.05])
% legend('$p_d(t) - Faza \: swobodna$','$p_d(t) - Faza \: podpierania$','interpreter','latex');
% title('Ścieżka ruchu nogi w czasie cyklu','interpreter','latex')
% return


%------------------------------------- WYKRESY CHODZENIE XDDDDDDD








% for i = 1:(height(q_n)/20):height(q_n)
for i = 0:400:20000
    if i == 0
        i = 1
    end
    i
    clf;
    hold on;
    grid on;
    xlabel('z'); ylabel('y'); zlabel('x');
   %view(45,45);
   view(0,0)
   %view(20,10)
    axis([-4 2 -2 2 -1 3])
    %axis([-2 2 -1.5 1.5 -2 0])
    % % axis equal

q0_PG = q_n(i,1);
q1_PG = q_n(i,2);
q0_PD = q_n(i,3);
q1_PD = q_n(i,4);
q0_LG = q_n(i,7);
q1_LG = q_n(i,8);
q0_LD = q_n(i,5);
q1_LD = q_n(i,6);

x = q_n(i,9);
y = q_n(i,10);
z = q_n(i,11);
or_x = q_n(i,12);
or_y = q_n(i,13);
or_z = q_n(i,14);

sC = [x;y;z;1];

sC_front = [x + a4*sin(or_y);...
y - a4*cos(or_y)*sin(or_x);...
z + a4*cos(or_x)*cos(or_y);...
1];

sC_back = [x - a4*sin(or_y);
y + a4*cos(or_y)*sin(or_x);
z - a4*cos(or_x)*cos(or_y);
1];

s0_PG = [x + a4*sin(or_y) - a3*cos(or_y)*sin(or_z);
y + a3*(cos(or_x)*cos(or_z) - sin(or_x)*sin(or_y)*sin(or_z)) - a4*cos(or_y)*sin(or_x);
z + a3*(cos(or_z)*sin(or_x) + cos(or_x)*sin(or_y)*sin(or_z)) + a4*cos(or_x)*cos(or_y);
1];

s1_PG = [x + a4*sin(or_y) - a3*cos(or_y)*sin(or_z) + a1*sin(or_y)*sin(q0_PG) - a1*cos(or_y)*cos(or_z)*cos(q0_PG);
y + a3*(cos(or_x)*cos(or_z) - sin(or_x)*sin(or_y)*sin(or_z)) - a4*cos(or_y)*sin(or_x) - a1*cos(q0_PG)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - a1*cos(or_y)*sin(or_x)*sin(q0_PG);
z + a3*(cos(or_z)*sin(or_x) + cos(or_x)*sin(or_y)*sin(or_z)) + a4*cos(or_x)*cos(or_y) - a1*cos(q0_PG)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + a1*cos(or_x)*cos(or_y)*sin(q0_PG);
1];
 
s2_PG = [x + a4*sin(or_y) - a3*cos(or_y)*sin(or_z) + a1*sin(or_y)*sin(q0_PG) + a2*cos(q1_PG)*(sin(or_y)*sin(q0_PG) - cos(or_y)*cos(or_z)*cos(q0_PG)) + a2*sin(q1_PG)*(cos(q0_PG)*sin(or_y) + cos(or_y)*cos(or_z)*sin(q0_PG)) - a1*cos(or_y)*cos(or_z)*cos(q0_PG);
y + a3*(cos(or_x)*cos(or_z) - sin(or_x)*sin(or_y)*sin(or_z)) - a2*cos(q1_PG)*(cos(q0_PG)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) + cos(or_y)*sin(or_x)*sin(q0_PG)) + a2*sin(q1_PG)*(sin(q0_PG)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - cos(or_y)*cos(q0_PG)*sin(or_x)) - a4*cos(or_y)*sin(or_x) - a1*cos(q0_PG)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - a1*cos(or_y)*sin(or_x)*sin(q0_PG);
z + a3*(cos(or_z)*sin(or_x) + cos(or_x)*sin(or_y)*sin(or_z)) - a2*cos(q1_PG)*(cos(q0_PG)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) - cos(or_x)*cos(or_y)*sin(q0_PG)) + a2*sin(q1_PG)*(sin(q0_PG)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + cos(or_x)*cos(or_y)*cos(q0_PG)) + a4*cos(or_x)*cos(or_y) - a1*cos(q0_PG)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + a1*cos(or_x)*cos(or_y)*sin(q0_PG);
1];

data(round(i/2500)+1,1) = s2_PG(1);
data(round(i/2500)+1,2) = s2_PG(3);
%--------------------------------------------------------------------------------------------------

s0_LG = [x + a4*sin(or_y) + a3*cos(or_y)*sin(or_z);
y - a3*(cos(or_x)*cos(or_z) - sin(or_x)*sin(or_y)*sin(or_z)) - a4*cos(or_y)*sin(or_x);
z - a3*(cos(or_z)*sin(or_x) + cos(or_x)*sin(or_y)*sin(or_z)) + a4*cos(or_x)*cos(or_y);
1];

s1_LG = [x + a4*sin(or_y) + a3*cos(or_y)*sin(or_z) + a1*sin(or_y)*sin(q0_LG) - a1*cos(or_y)*cos(or_z)*cos(q0_LG);
y - a3*(cos(or_x)*cos(or_z) - sin(or_x)*sin(or_y)*sin(or_z)) - a4*cos(or_y)*sin(or_x) - a1*cos(q0_LG)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - a1*cos(or_y)*sin(or_x)*sin(q0_LG);
z - a3*(cos(or_z)*sin(or_x) + cos(or_x)*sin(or_y)*sin(or_z)) + a4*cos(or_x)*cos(or_y) - a1*cos(q0_LG)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + a1*cos(or_x)*cos(or_y)*sin(q0_LG);
1];
 
s2_LG = [x + a4*sin(or_y) + a3*cos(or_y)*sin(or_z) + a1*sin(or_y)*sin(q0_LG) + a2*cos(q1_LG)*(sin(or_y)*sin(q0_LG) - cos(or_y)*cos(or_z)*cos(q0_LG)) + a2*sin(q1_LG)*(cos(q0_LG)*sin(or_y) + cos(or_y)*cos(or_z)*sin(q0_LG)) - a1*cos(or_y)*cos(or_z)*cos(q0_LG);
y - a3*(cos(or_x)*cos(or_z) - sin(or_x)*sin(or_y)*sin(or_z)) - a2*cos(q1_LG)*(cos(q0_LG)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) + cos(or_y)*sin(or_x)*sin(q0_LG)) + a2*sin(q1_LG)*(sin(q0_LG)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - cos(or_y)*cos(q0_LG)*sin(or_x)) - a4*cos(or_y)*sin(or_x) - a1*cos(q0_LG)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - a1*cos(or_y)*sin(or_x)*sin(q0_LG);
z - a3*(cos(or_z)*sin(or_x) + cos(or_x)*sin(or_y)*sin(or_z)) - a2*cos(q1_LG)*(cos(q0_LG)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) - cos(or_x)*cos(or_y)*sin(q0_LG)) + a2*sin(q1_LG)*(sin(q0_LG)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + cos(or_x)*cos(or_y)*cos(q0_LG)) + a4*cos(or_x)*cos(or_y) - a1*cos(q0_LG)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + a1*cos(or_x)*cos(or_y)*sin(q0_LG);
1];
 
%--------------------------------------------------------------------------------------------------

s0_PD = [x - a4*sin(or_y) - a3*cos(or_y)*sin(or_z);
y + a3*(cos(or_x)*cos(or_z) - sin(or_x)*sin(or_y)*sin(or_z)) + a4*cos(or_y)*sin(or_x);
z + a3*(cos(or_z)*sin(or_x) + cos(or_x)*sin(or_y)*sin(or_z)) - a4*cos(or_x)*cos(or_y);
1];

s1_PD = [x - a4*sin(or_y) - a3*cos(or_y)*sin(or_z) + a1*sin(or_y)*sin(q0_PD) - a1*cos(or_y)*cos(or_z)*cos(q0_PD);
y + a3*(cos(or_x)*cos(or_z) - sin(or_x)*sin(or_y)*sin(or_z)) + a4*cos(or_y)*sin(or_x) - a1*cos(q0_PD)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - a1*cos(or_y)*sin(or_x)*sin(q0_PD);
z + a3*(cos(or_z)*sin(or_x) + cos(or_x)*sin(or_y)*sin(or_z)) - a4*cos(or_x)*cos(or_y) - a1*cos(q0_PD)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + a1*cos(or_x)*cos(or_y)*sin(q0_PD);
1];
 
s2_PD = [x - a4*sin(or_y) - a3*cos(or_y)*sin(or_z) + a1*sin(or_y)*sin(q0_PD) + a2*cos(q1_PD)*(sin(or_y)*sin(q0_PD) - cos(or_y)*cos(or_z)*cos(q0_PD)) + a2*sin(q1_PD)*(cos(q0_PD)*sin(or_y) + cos(or_y)*cos(or_z)*sin(q0_PD)) - a1*cos(or_y)*cos(or_z)*cos(q0_PD);
y + a3*(cos(or_x)*cos(or_z) - sin(or_x)*sin(or_y)*sin(or_z)) - a2*cos(q1_PD)*(cos(q0_PD)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) + cos(or_y)*sin(or_x)*sin(q0_PD)) + a2*sin(q1_PD)*(sin(q0_PD)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - cos(or_y)*cos(q0_PD)*sin(or_x)) + a4*cos(or_y)*sin(or_x) - a1*cos(q0_PD)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - a1*cos(or_y)*sin(or_x)*sin(q0_PD);
z + a3*(cos(or_z)*sin(or_x) + cos(or_x)*sin(or_y)*sin(or_z)) - a2*cos(q1_PD)*(cos(q0_PD)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) - cos(or_x)*cos(or_y)*sin(q0_PD)) + a2*sin(q1_PD)*(sin(q0_PD)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + cos(or_x)*cos(or_y)*cos(q0_PD)) - a4*cos(or_x)*cos(or_y) - a1*cos(q0_PD)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + a1*cos(or_x)*cos(or_y)*sin(q0_PD);
1];
 
%--------------------------------------------------------------------------------------------------

s0_LD = [x - a4*sin(or_y) + a3*cos(or_y)*sin(or_z);
y - a3*(cos(or_x)*cos(or_z) - sin(or_x)*sin(or_y)*sin(or_z)) + a4*cos(or_y)*sin(or_x);
z - a3*(cos(or_z)*sin(or_x) + cos(or_x)*sin(or_y)*sin(or_z)) - a4*cos(or_x)*cos(or_y);
1];

s1_LD = [x - a4*sin(or_y) + a3*cos(or_y)*sin(or_z) + a1*sin(or_y)*sin(q0_LD) - a1*cos(or_y)*cos(or_z)*cos(q0_LD);
y - a3*(cos(or_x)*cos(or_z) - sin(or_x)*sin(or_y)*sin(or_z)) + a4*cos(or_y)*sin(or_x) - a1*cos(q0_LD)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - a1*cos(or_y)*sin(or_x)*sin(q0_LD);
z - a3*(cos(or_z)*sin(or_x) + cos(or_x)*sin(or_y)*sin(or_z)) - a4*cos(or_x)*cos(or_y) - a1*cos(q0_LD)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + a1*cos(or_x)*cos(or_y)*sin(q0_LD);
1];
 
s2_LD = [x - a4*sin(or_y) + a3*cos(or_y)*sin(or_z) + a1*sin(or_y)*sin(q0_LD) + a2*cos(q1_LD)*(sin(or_y)*sin(q0_LD) - cos(or_y)*cos(or_z)*cos(q0_LD)) + a2*sin(q1_LD)*(cos(q0_LD)*sin(or_y) + cos(or_y)*cos(or_z)*sin(q0_LD)) - a1*cos(or_y)*cos(or_z)*cos(q0_LD);
y - a3*(cos(or_x)*cos(or_z) - sin(or_x)*sin(or_y)*sin(or_z)) - a2*cos(q1_LD)*(cos(q0_LD)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) + cos(or_y)*sin(or_x)*sin(q0_LD)) + a2*sin(q1_LD)*(sin(q0_LD)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - cos(or_y)*cos(q0_LD)*sin(or_x)) + a4*cos(or_y)*sin(or_x) - a1*cos(q0_LD)*(cos(or_x)*sin(or_z) + cos(or_z)*sin(or_x)*sin(or_y)) - a1*cos(or_y)*sin(or_x)*sin(q0_LD);
z - a3*(cos(or_z)*sin(or_x) + cos(or_x)*sin(or_y)*sin(or_z)) - a2*cos(q1_LD)*(cos(q0_LD)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) - cos(or_x)*cos(or_y)*sin(q0_LD)) + a2*sin(q1_LD)*(sin(q0_LD)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + cos(or_x)*cos(or_y)*cos(q0_LD)) - a4*cos(or_x)*cos(or_y) - a1*cos(q0_LD)*(sin(or_x)*sin(or_z) - cos(or_x)*cos(or_z)*sin(or_y)) + a1*cos(or_x)*cos(or_y)*sin(q0_LD);
1];
 
% eLG = -1.5 - s2_LG(1) - 0.5 - s2_LG(2) + 1 - s2_LG(3)
% ePD = -1.5 - s2_PD(1) + 0.5 - s2_PD(2) - 1 - s2_PD(3)
% eLD = -1.5 - s2_LD(1) - 0.5 - s2_LD(2) - 1 - s2_LD(3)

% hold on;
% grid on;
% xlabel('z'); ylabel('y'); zlabel('x');
% axis([-2 2 -2 2 -2 2])

plot3(sC(3), sC(2), sC(1), 'c*');
quiver3(sC(3), sC(2), sC(1), sC_front(3)-sC(3), sC_front(2)-sC(2), sC_front(1)-sC(1), 'b*','AutoScale','off');
quiver3(sC(3), sC(2), sC(1), -sC(3)+sC_back(3), -sC(2)+sC_back(2), -sC(1)+sC_back(1), 'b*','AutoScale','off');
quiver3(sC_front(3), sC_front(2), sC_front(1), -sC_front(3)+s0_PG(3), -sC_front(2)+s0_PG(2), -sC_front(1)+s0_PG(1), 'b*','AutoScale','off');
quiver3(sC_front(3), sC_front(2), sC_front(1), -sC_front(3)+s0_LG(3), -sC_front(2)+s0_LG(2), -sC_front(1)+s0_LG(1), 'b*','AutoScale','off');
quiver3(sC_back(3), sC_back(2), sC_back(1), -sC_back(3)+s0_PD(3), -sC_back(2)+s0_PD(2), -sC_back(1)+s0_PD(1), 'b*','AutoScale','off');
quiver3(sC_back(3), sC_back(2), sC_back(1), -sC_back(3)+s0_LD(3), -sC_back(2)+s0_LD(2), -sC_back(1)+s0_LD(1), 'b*','AutoScale','off');

quiver3(s0_PG(3), s0_PG(2), s0_PG(1), s1_PG(3)-s0_PG(3), s1_PG(2)-s0_PG(2), s1_PG(1)-s0_PG(1), 'k*','AutoScale','off');
quiver3(s1_PG(3), s1_PG(2), s1_PG(1), s2_PG(3)-s1_PG(3), s2_PG(2)-s1_PG(2), s2_PG(1)-s1_PG(1), 'k*','AutoScale','off');

quiver3(s0_LG(3), s0_LG(2), s0_LG(1), s1_LG(3)-s0_LG(3), s1_LG(2)-s0_LG(2), s1_LG(1)-s0_LG(1), 'k*','AutoScale','off');
quiver3(s1_LG(3), s1_LG(2), s1_LG(1), s2_LG(3)-s1_LG(3), s2_LG(2)-s1_LG(2), s2_LG(1)-s1_LG(1), 'k*','AutoScale','off');

quiver3(s0_PD(3), s0_PD(2), s0_PD(1), s1_PD(3)-s0_PD(3), s1_PD(2)-s0_PD(2), s1_PD(1)-s0_PD(1), 'k*','AutoScale','off');
quiver3(s1_PD(3), s1_PD(2), s1_PD(1), s2_PD(3)-s1_PD(3), s2_PD(2)-s1_PD(2), s2_PD(1)-s1_PD(1), 'k*','AutoScale','off');

quiver3(s0_LD(3), s0_LD(2), s0_LD(1), s1_LD(3)-s0_LD(3), s1_LD(2)-s0_LD(2), s1_LD(1)-s0_LD(1), 'k*','AutoScale','off');
quiver3(s1_LD(3), s1_LD(2), s1_LD(1), s2_LD(3)-s1_LD(3), s2_LD(2)-s1_LD(2), s2_LD(1)-s1_LD(1), 'k*','AutoScale','off');

plot3(s2_LD(3), s2_LD(2), s2_LD(1),'*','Color',[0.671 0.671 0.671]);
plot3(s2_PD(3), s2_PD(2), s2_PD(1),'*','Color',[0.671 0.671 0.671]);
plot3(s2_LG(3), s2_LG(2), s2_LG(1),'*','Color',[0.671 0.671 0.671]);
wwa =plot3(s2_PG(3), s2_PG(2), s2_PG(1),'*','Color',[0.671 0.671 0.671]);


pause(0.001)

end





