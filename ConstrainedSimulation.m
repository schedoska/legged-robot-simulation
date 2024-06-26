dq_n = zeros(26,1);
%dq_n = [-0.0461882062907648	0.0923764125815296	-0.0461882062907648	0.0923764125815296	-0.0461882062907648	0.0923764125815296	-0.0461882062907648	0.0923764125815296 zeros(1,18)].';

example = matfile('save_q_desired.mat');
q_n = example.q_desired_array(1,:).';
q_n(9) =  0.8;
%q_n(11) = -0.0875;
%q_n(1:8) = [1.0472   -2.0944    1.0472   -2.0944    1.0472   -2.0944    1.0472   -2.0944].';
q_trajectory = example.q_desired_array;
example = matfile('save_q_desired_derivative.mat');
q_trajectory_derivative = example.q_desired_array_deriv;
example = matfile('save_c_desired.mat');
c_timeline = example.c_desired_array;
example = matfile('save_q_desired_array_accel.mat');
q_trajectory_accel = example.q_desired_array_accel;

% syms lambdaPG_x lambdaPG_y lambdaPG_z lambdaPD_x lambdaPD_y lambdaPD_z lambdaLD_x lambdaLD_y lambdaLD_z lambdaLG_x lambdaLG_y lambdaLG_z
% Jc_PG = jacobian([s2_PG(1);s2_PG(2);s2_PG(3)],q);
% Jc_PD = jacobian([s2_PD(1);s2_PD(2);s2_PD(3)],q);
% Jc_LD = jacobian([s2_LD(1);s2_LD(2);s2_LD(3)],q);
% Jc_LG = jacobian([s2_LG(1);s2_LG(2);s2_LG(3)],q);
% Js = [Jc_PG.' Jc_PD.' Jc_LD.' Jc_LG.'].';
% 
% eqn = [Q*diff(q,t,t).'+C*diff(q,t).'+D==(Js.')*[lambdaPG_x;lambdaPG_y;lambdaPG_z;lambdaPD_x;lambdaPD_y;lambdaPD_z;lambdaLD_x;lambdaLD_y;lambdaLD_z;lambdaLG_x;lambdaLG_y;lambdaLG_z];
%     Jc_PG*diff(q,t,t).'+diff(Jc_PG,t)*diff(q,t).'==[0;0;0];
%     Jc_PD*diff(q,t,t).'+diff(Jc_PD,t)*diff(q,t).'==[0;0;0];
%     Jc_LD*diff(q,t,t).'+diff(Jc_LD,t)*diff(q,t).'==[0;0;0];
%     Jc_LG*diff(q,t,t).'+diff(Jc_LG,t)*diff(q,t).'==[0;0;0]];
% eqn = subs(eqn, [diff(q(1),t,t) diff(q(2),t,t) diff(q(3),t,t) diff(q(4),t,t) diff(q(5),t,t) diff(q(6),t,t) ...
%     diff(q(7),t,t) diff(q(8),t,t) diff(q(9),t,t) diff(q(10),t,t) diff(q(11),t,t) diff(q(12),t,t) diff(q(13),t,t) diff(q(14),t,t)],...
%     [qdd(1) qdd(2) qdd(3) qdd(4) qdd(5) qdd(6) qdd(7) qdd(8) qdd(9) qdd(10) qdd(11) qdd(12) qdd(13) qdd(14)]);
% [A, B] = equationsToMatrix(eqn, [qdd(1) qdd(2) qdd(3) qdd(4) qdd(5) qdd(6) qdd(7) qdd(8) qdd(9) qdd(10) qdd(11) ...
%     qdd(12) qdd(13) qdd(14) lambdaPG_x lambdaPG_y lambdaPG_z lambdaPD_x lambdaPD_y lambdaPD_z lambdaLD_x lambdaLD_y lambdaLD_z lambdaLG_x lambdaLG_y lambdaLG_z]);
% 
% q_wo = sym('q_wo',[n 1]);
% dq_wo = sym('dq_wo',[n 1]);
% ddq_wo = sym('ddq_wo',[n 1]);
% A = subs(A, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
%     [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
% A = subs(A, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% B = subs(B, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
%     [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
% B = subs(B, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% 
% A_ht = matlabFunction(A);
% B_ht = matlabFunction(B);
% 
% % -------------------------------------------- FUNKCJE PRĘDKOŚCI STÓP
% ds2_PG = diff(s2_PG,t);
% ds2_PG = subs(ds2_PG, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
%     [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
% ds2_PG = subs(ds2_PG, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% ds2_PG_ht = matlabFunction(ds2_PG);
% 
% ds2_PD = diff(s2_PD,t);
% ds2_PD = subs(ds2_PD, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
%     [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
% ds2_PD = subs(ds2_PD, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% ds2_PD_ht = matlabFunction(ds2_PD);
% 
% ds2_LD = diff(s2_LD,t);
% ds2_LD = subs(ds2_LD, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
%     [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
% ds2_LD = subs(ds2_LD, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% ds2_LD_ht = matlabFunction(ds2_LD);
% 
% ds2_LG = diff(s2_LG,t);
% ds2_LG = subs(ds2_LG, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
%     [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
% ds2_LG = subs(ds2_LG, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% ds2_LG_ht = matlabFunction(ds2_LG);
% % -------------------------------------------- FUNKCJE PRĘDKOŚCI STÓP
% % -------------------------------------------- FUNCKJE POZYCJI STÓP
% s2_PG_pos = s2_PG;
% s2_PG_pos = subs(s2_PG_pos, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
%     [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
% s2_PG_pos = subs(s2_PG_pos, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% s2_PG_pos_ht = matlabFunction(s2_PG_pos);
% 
% s2_PD_pos = s2_PD;
% s2_PD_pos = subs(s2_PD_pos, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
%     [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
% s2_PD_pos = subs(s2_PD_pos, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% s2_PD_pos_ht = matlabFunction(s2_PD_pos);
% 
% s2_LD_pos = s2_LD;
% s2_LD_pos = subs(s2_LD_pos, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
%     [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
% s2_LD_pos = subs(s2_LD_pos, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% s2_LD_pos_ht = matlabFunction(s2_LD_pos);
% 
% s2_LG_pos = s2_LG;
% s2_LG_pos = subs(s2_LG_pos, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
%     [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
% s2_LG_pos = subs(s2_LG_pos, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% s2_LG_pos_ht = matlabFunction(s2_LG_pos);
% % -------------------------------------------- FUNCKJE POZYCJI STÓP
% % -------------------------------------------- FUNCKJE PRZYŚPIESZEŃ STÓP
% dds2_PG = diff(s2_PG,t,t);
% dds2_PG = subs(dds2_PG, [diff(q(1),t,t) diff(q(2),t,t) diff(q(3),t,t) diff(q(4),t,t) diff(q(5),t,t) diff(q(6),t,t) ...
%     diff(q(7),t,t) diff(q(8),t,t) diff(q(9),t,t) diff(q(10),t,t) diff(q(11),t,t) diff(q(12),t,t) diff(q(13),t,t) diff(q(14),t,t)],...
%     [qdd(1) qdd(2) qdd(3) qdd(4) qdd(5) qdd(6) qdd(7) qdd(8) qdd(9) qdd(10) qdd(11) qdd(12) qdd(13) qdd(14)]);
% dds2_PG = subs(dds2_PG, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
%     [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
% dds2_PG = subs(dds2_PG, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% dds2_PG_ht = matlabFunction(dds2_PG);
% 
% dds2_PD = diff(s2_PD,t,t);
% dds2_PD = subs(dds2_PD, [diff(q(1),t,t) diff(q(2),t,t) diff(q(3),t,t) diff(q(4),t,t) diff(q(5),t,t) diff(q(6),t,t) ...
%     diff(q(7),t,t) diff(q(8),t,t) diff(q(9),t,t) diff(q(10),t,t) diff(q(11),t,t) diff(q(12),t,t) diff(q(13),t,t) diff(q(14),t,t)],...
%     [qdd(1) qdd(2) qdd(3) qdd(4) qdd(5) qdd(6) qdd(7) qdd(8) qdd(9) qdd(10) qdd(11) qdd(12) qdd(13) qdd(14)]);
% dds2_PD = subs(dds2_PD, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
%     [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
% dds2_PD = subs(dds2_PD, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% dds2_PD_ht = matlabFunction(dds2_PD);
% 
% dds2_LD = diff(s2_LD,t,t);
% dds2_LD = subs(dds2_LD, [diff(q(1),t,t) diff(q(2),t,t) diff(q(3),t,t) diff(q(4),t,t) diff(q(5),t,t) diff(q(6),t,t) ...
%     diff(q(7),t,t) diff(q(8),t,t) diff(q(9),t,t) diff(q(10),t,t) diff(q(11),t,t) diff(q(12),t,t) diff(q(13),t,t) diff(q(14),t,t)],...
%     [qdd(1) qdd(2) qdd(3) qdd(4) qdd(5) qdd(6) qdd(7) qdd(8) qdd(9) qdd(10) qdd(11) qdd(12) qdd(13) qdd(14)]);
% dds2_LD = subs(dds2_LD, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
%     [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
% dds2_LD = subs(dds2_LD, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% dds2_LD_ht = matlabFunction(dds2_LD);
% 
% dds2_LG = diff(s2_LG,t,t);
% dds2_LG = subs(dds2_LG, [diff(q(1),t,t) diff(q(2),t,t) diff(q(3),t,t) diff(q(4),t,t) diff(q(5),t,t) diff(q(6),t,t) ...
%     diff(q(7),t,t) diff(q(8),t,t) diff(q(9),t,t) diff(q(10),t,t) diff(q(11),t,t) diff(q(12),t,t) diff(q(13),t,t) diff(q(14),t,t)],...
%     [qdd(1) qdd(2) qdd(3) qdd(4) qdd(5) qdd(6) qdd(7) qdd(8) qdd(9) qdd(10) qdd(11) qdd(12) qdd(13) qdd(14)]);
% dds2_LG = subs(dds2_LG, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
%     [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
% dds2_LG = subs(dds2_LG, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% dds2_LG_ht = matlabFunction(dds2_LG);
% 
% D_substitude = subs(D, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%      [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% D_ht = matlabFunction(D_substitude);
% 
% % ------------ EKSPERYMENTALNE DO SLEDZENIA SYLWETKI ---- POCZĄTEK
% 
% Js_sym = Js;
% Js_sym = subs(Js_sym, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%      [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
%  Js_ht = matlabFunction(Js_sym);
% 
% J_un_sym = Js(:,9:14);
% J_un_sym = subs(J_un_sym, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% J_un_ht = matlabFunction(J_un_sym);
% J_act_sym = Js(:,1:8);
% J_act_sym = subs(J_act_sym, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% J_act_ht = matlabFunction(J_act_sym);
% dJs_sym = diff(Js,t);
% dJs_sym = subs(dJs_sym, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
%     [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
% dJs_sym = subs(dJs_sym, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% dJs_ht = matlabFunction(dJs_sym);
% 
% Q_eta_sym = Q;
% Q_eta_sym = subs(Q_eta_sym, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% Q_eta_ht = matlabFunction(Q_eta_sym);
% 
% C_eta_sym = C;
% C_eta_sym = subs(C_eta_sym, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
%     [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
% C_eta_sym = subs(C_eta_sym, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% C_eta_ht = matlabFunction(C_eta_sym);
% 
% D_eta_sym = D;
% D_eta_sym = subs(D_eta_sym, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
%     [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
% D_eta_ht = matlabFunction(D_eta_sym);

%%------------ EKSPERYMENTALNE DO SLEDZENIA SYLWETKI ---- KOENI

% -------------------------------------------- FUNCKJE PRZYŚPIESZEŃ STÓP

time_to_record = 10;
time_step = 0.0001;

feetData2 = zeros(time_to_record/time_step, 12);
feetData = zeros(time_to_record/time_step, 8); %vel , accc in x 
q_n_record = zeros(time_to_record/time_step, 26);
index = 1;

T_f = [0;0;0;0;0;0;0;0;0;0;0;0;0;0];
Torques_record = zeros(time_to_record/time_step, 8);

c_timeline_now = [0 0 0 0];
c_timeline_prev = [0 0 0 0];
c_release_permit = [0 0 0 0];

%GroundLevel = -1.5;      % Stara wartość poziomu ziemi
GroundLevel = 0;

step_index = 1;
for tim = 0:time_step:(time_to_record - time_step)
    
    A_bis = A_ht(1,1,0.5,1,1,q_n(1),q_n(2),q_n(3),q_n(4),q_n(5),q_n(6),q_n(7),q_n(8),q_n(12),q_n(13),q_n(14));
    A_bis = double(A_bis);
    B_bis = B_ht(1,1,0.5,1,dq_n(1),dq_n(2),dq_n(3),dq_n(4),dq_n(5),dq_n(6),dq_n(7),dq_n(8),dq_n(12),dq_n(13),dq_n(14),...
        9.8,1,q_n(1),q_n(2),q_n(3),q_n(4),q_n(5),q_n(6),q_n(7),q_n(8),q_n(12),q_n(13),q_n(14));
    B_bis = double(B_bis);

    A_bis_copy = A_bis;
    B_bis_copy = B_bis;
    
    %-------------------------------------------------------------- IMPAKT STOPY o PODŁOŻE
    positionOfPGleg = s2_PG_pos_ht(1,1,0.5,1,q_n(1),q_n(2),q_n(9),q_n(10),q_n(11),q_n(12),q_n(13),q_n(14));
    positionOfPDleg = s2_PD_pos_ht(1,1,0.5,1,q_n(3),q_n(4),q_n(9),q_n(10),q_n(11),q_n(12),q_n(13),q_n(14));
    positionOfLDleg = s2_LD_pos_ht(1,1,0.5,1,q_n(5),q_n(6),q_n(9),q_n(10),q_n(11),q_n(12),q_n(13),q_n(14));
    positionOfLGleg = s2_LG_pos_ht(1,1,0.5,1,q_n(7),q_n(8),q_n(9),q_n(10),q_n(11),q_n(12),q_n(13),q_n(14));
    c_timeline_now = [0 0 0 0];

    %if (ddq_n_adjusted(15) > 0) && positionOfPGleg(1) <= GroundLevel < ---- wczsniej bylo tak
    if positionOfPGleg(1) <= groundLevelFunction(positionOfPGleg(2), positionOfPGleg(3)) 
        c_timeline_now(1) = 1;
    end
    if positionOfPDleg(1) <= groundLevelFunction(positionOfPDleg(2), positionOfPDleg(3))
        c_timeline_now(2) = 1;
    end
    if positionOfLDleg(1) <= groundLevelFunction(positionOfLDleg(2), positionOfLDleg(3))
        c_timeline_now(3) = 1;
    end
    if positionOfLGleg(1) <= groundLevelFunction(positionOfLGleg(2), positionOfLGleg(3))
        c_timeline_now(4) = 1;
    end
    
    velocityOfPGleg = ds2_PG_ht(1,1,0.5,1,dq_n(1),dq_n(2),dq_n(9),dq_n(10),dq_n(11),dq_n(12),dq_n(13),dq_n(14),...
                q_n(1),q_n(2),q_n(12),q_n(13),q_n(14));
    velocityOfPDleg = ds2_PD_ht(1,1,0.5,1,dq_n(3),dq_n(4),dq_n(9),dq_n(10),dq_n(11),dq_n(12),dq_n(13),dq_n(14),...
                q_n(3),q_n(4),q_n(12),q_n(13),q_n(14));
    velocityOfLDleg = ds2_LD_ht(1,1,0.5,1,dq_n(5),dq_n(6),dq_n(9),dq_n(10),dq_n(11),dq_n(12),dq_n(13),dq_n(14),...
                q_n(5),q_n(6),q_n(12),q_n(13),q_n(14));
    velocityOfLGleg = ds2_LG_ht(1,1,0.5,1,dq_n(7),dq_n(8),dq_n(9),dq_n(10),dq_n(11),dq_n(12),dq_n(13),dq_n(14),...
                q_n(7),q_n(8),q_n(12),q_n(13),q_n(14));

    if index ~= 1
        if c_timeline_now(1) == 1
            B_bis(15:17) = B_bis(15:17) - velocityOfPGleg(1:3) / time_step;
        end
        if c_timeline_now(2) == 1
            B_bis(18:20) = B_bis(18:20) - velocityOfPDleg(1:3) / time_step;
        end
        if c_timeline_now(3) == 1
            B_bis(21:23) = B_bis(21:23) - velocityOfLDleg(1:3) / time_step;
        end
        if c_timeline_now(4) == 1
            B_bis(24:26) = B_bis(24:26) - velocityOfLGleg(1:3) / time_step;
        end
    end

    %esper  
            % Jnumsaef = Js_ht(1,1,0.5,1,q_n(1),q_n(2),q_n(3),q_n(4),q_n(5),q_n(6),q_n(7),q_n(8),q_n(12),q_n(13),q_n(14));
            % Qdefefas=Q_eta_ht(1,1,0.5,1,1,q_n(1),q_n(2),q_n(3),q_n(4),q_n(5),q_n(6),q_n(7),q_n(8),q_n(12),q_n(13),q_n(14));
            % ewfefw = pinv(Jnumsaef * (pinv(Qdefefas,1e-4)) * Jnumsaef.');
            % feetData2(index,:)= ewfefw * [velocityOfPGleg(1:3);velocityOfPDleg(1:3);velocityOfLDleg(1:3);velocityOfLGleg(1:3)] ./ time_step;    
            % %esper
    feetData(index, :) = [velocityOfPGleg(1) velocityOfPDleg(1) velocityOfLDleg(1) velocityOfLGleg(1) c_timeline_now];
    %-------------------------------------------------------------- IMPAKT STOPY o PODŁOŻE

    if c_timeline_now(4) == 0
      A_bis(24:26,:) = [];
      A_bis(:,24:26) = [];
      B_bis(24:26) = [];
    end
    if c_timeline_now(3) == 0
      A_bis(21:23,:) = [];
      A_bis(:,21:23) = [];
      B_bis(21:23) = [];
    end
    if c_timeline_now(2) == 0
      A_bis(18:20,:) = [];
      A_bis(:,18:20) = [];
      B_bis(18:20) = [];
    end
    if c_timeline_now(1) == 0
      A_bis(15:17,:) = [];
      A_bis(:,15:17) = [];
      B_bis(15:17) = [];
    end

    constrainedLegsList = [];
    swingLegsList = [];
    for i = 1:4
        if c_timeline_now(i) ~= 0
            constrainedLegsList = [constrainedLegsList i];
        else
            swingLegsList = [swingLegsList, i];
        end
    end
    
    %------------- EKPERYMENTALNE SLEDZENIE SYLWETKI -------- POCZATEK

    J_un = J_un_ht(1,1,0.5,1,q_n(1),q_n(2),q_n(3),q_n(4),q_n(5),q_n(6),q_n(7),q_n(8),q_n(12),q_n(13),q_n(14));
    J_act = J_act_ht(1,1,q_n(1),q_n(2),q_n(3),q_n(4),q_n(5),q_n(6),q_n(7),q_n(8),q_n(12),q_n(13),q_n(14));
    dJs = dJs_ht(1,1,0.5,1,dq_n(1),dq_n(2),dq_n(3),dq_n(4),dq_n(5),dq_n(6),dq_n(7),dq_n(8),dq_n(12),dq_n(13),dq_n(14),...
        q_n(1),q_n(2),q_n(3),q_n(4),q_n(5),q_n(6),q_n(7),q_n(8),q_n(12),q_n(13),q_n(14));
    
    M_eta = [eye(8); -(((J_un.')*J_un)^(-1))*(J_un.')*J_act];
    N_eta = [zeros(8,1);-(((J_un.')*J_un)^(-1))*(J_un.')*dJs*dq_n(1:14)];
    
    Q_eta = Q_eta_ht(1,1,0.5,1,1,q_n(1),q_n(2),q_n(3),q_n(4),q_n(5),q_n(6),q_n(7),q_n(8),q_n(12),q_n(13),q_n(14));
    C_eta = C_eta_ht(1,1,0.5,1,dq_n(1),dq_n(2),dq_n(3),dq_n(4),dq_n(5),dq_n(6),dq_n(7),dq_n(8),dq_n(12),dq_n(13),dq_n(14),...
        1,q_n(1),q_n(2),q_n(3),q_n(4),q_n(5),q_n(6),q_n(7),q_n(8),q_n(12),q_n(13),q_n(14));
    D_eta = D_eta_ht(1,1,9.8,1,q_n(1),q_n(2),q_n(3),q_n(4),q_n(5),q_n(6),q_n(7),q_n(8),q_n(13),q_n(14));
    
    if index == 1
        roro = [0.1;0.0;0.1;0.0;0.1;0.0;0.1;0.0;];
    elseif index == 15000
        roro = [-0.1;0.0;-0.1;0.0;-0.1;0.0;-0.1;0.0;];
    else 
        roro = [-0.0;0.0;-0.0;0.0;-0.0;0.0;-0.0;0.0;];
    end
    
    Kp = [50 50 1 1 1 1 50 50].';
    Tauua = (M_eta.')*Q_eta*M_eta * (q_trajectory_accel(index,1:8).'+10*(q_trajectory_derivative(index,1:8).'-dq_n(1:8))+10*(q_trajectory(index,1:8).'-q_n(1:8))) +...
            (M_eta.')*Q_eta*N_eta +...
            (M_eta.')*(C_eta*dq_n(1:14) + D_eta);

    %------------- EKPERYMENTALNE SLEDZENIE SYLWETKI -------- KONIEC
    
    D_val = D_ht(1,1,9.8,1,q_n(1),q_n(2),q_n(3),q_n(4),q_n(5),q_n(6),q_n(7),q_n(8),q_n(13),q_n(14)) .* [1;1;1;1;1;1;1;1;zeros(6,1)];
    Torques = (900*(q_trajectory(index,:).' - q_n) + 90*(q_trajectory_derivative(index,:).' - dq_n)) .* [1;1;1;1;1;1;1;1;zeros(18,1)];
    Torques = Torques + [D_val;zeros(12,1)];
    
    % STEROWANIE SYLWETKA EKSPERYMENTALNE
    % if index < 1000 %2500
    %     Torques = [Tauua;zeros(18,1)];
    % elseif index >= 1000 && index < 1100 %2500 && index < 2600
    %     Torques = [Tauua*0;zeros(18,1)];
    % end
    Torques = [Tauua;zeros(18,1)];

    Torques_record(index, 1:8) = Torques(1:8).';
    B_bis = B_bis + Torques(1:26-length(swingLegsList)*3);
    
    ddq_n = pinv(A_bis,1e-4)*B_bis;
    %ddq_n = pinv(A_bis,1e-15)*B_bis;
    ddq_n_adjusted = [ddq_n(1:14); zeros(12,1)];
    for i = 1:length(constrainedLegsList)
        ddq_n_adjusted(15+(constrainedLegsList(i)-1)*3:17+(constrainedLegsList(i)-1)*3) = ddq_n(15+(i-1)*3:17+(i-1)*3);
    end

    accelOfPGleg = dds2_PG_ht(1,1,0.5,1,dq_n(1),dq_n(2),dq_n(12),dq_n(13),dq_n(14),...
        q_n(1),q_n(2),q_n(12),q_n(13),q_n(14),...
        ddq_n(1),ddq_n(2),ddq_n(9),ddq_n(10),ddq_n(11),ddq_n(12),ddq_n(13),ddq_n(14));
    accelOfPDleg = dds2_PD_ht(1,1,0.5,1,dq_n(3),dq_n(4),dq_n(12),dq_n(13),dq_n(14),...
        q_n(3),q_n(4),q_n(12),q_n(13),q_n(14),...
        ddq_n(3),ddq_n(4),ddq_n(9),ddq_n(10),ddq_n(11),ddq_n(12),ddq_n(13),ddq_n(14));
    accelOfLDleg = dds2_LD_ht(1,1,0.5,1,dq_n(5),dq_n(6),dq_n(12),dq_n(13),dq_n(14),...
        q_n(5),q_n(6),q_n(12),q_n(13),q_n(14),...
        ddq_n(5),ddq_n(6),ddq_n(9),ddq_n(10),ddq_n(11),ddq_n(12),ddq_n(13),ddq_n(14));
    accelOfLGleg = dds2_LG_ht(1,1,0.5,1,dq_n(7),dq_n(8),dq_n(12),dq_n(13),dq_n(14),...
        q_n(7),q_n(8),q_n(12),q_n(13),q_n(14),...
        ddq_n(7),ddq_n(8),ddq_n(9),ddq_n(10),ddq_n(11),ddq_n(12),ddq_n(13),ddq_n(14));

    %------------------------------------------------- PONOWNE SPRAWDZENIE
    if ddq_n_adjusted(15) < 0 || ddq_n_adjusted(18) < 0 || ddq_n_adjusted(21) < 0 || ddq_n_adjusted(24) < 0
        c_timeline_now = [0 0 0 0];

        if (ddq_n_adjusted(15) > 0) && positionOfPGleg(1) <= groundLevelFunction(positionOfPGleg(2), positionOfPGleg(3))
            c_timeline_now(1) = 1;
        end
        if (ddq_n_adjusted(18) > 0) && positionOfPDleg(1) <= groundLevelFunction(positionOfPDleg(2), positionOfPDleg(3))
            c_timeline_now(2) = 1;
        end
        if (ddq_n_adjusted(21) > 0) && positionOfLDleg(1) <= groundLevelFunction(positionOfLDleg(2), positionOfLDleg(3))
            c_timeline_now(3) = 1;
        end
        if (ddq_n_adjusted(24) > 0) && positionOfLGleg(1) <= groundLevelFunction(positionOfLGleg(2), positionOfLGleg(3))
            c_timeline_now(4) = 1;
        end

        if index ~= 1
            if c_timeline_now(1) == 1
                B_bis_copy(15:17) = B_bis_copy(15:17) - velocityOfPGleg(1:3) / time_step;
            end
            if c_timeline_now(2) == 1
                B_bis_copy(18:20) = B_bis_copy(18:20) - velocityOfPDleg(1:3) / time_step;
            end
            if c_timeline_now(3) == 1
                B_bis_copy(21:23) = B_bis_copy(21:23) - velocityOfLDleg(1:3) / time_step;
            end
            if c_timeline_now(4) == 1
                B_bis_copy(24:26) = B_bis_copy(24:26) - velocityOfLGleg(1:3) / time_step;
            end
        end

        if c_timeline_now(4) == 0
            A_bis_copy(24:26,:) = [];
            A_bis_copy(:,24:26) = [];
            B_bis_copy(24:26) = [];
        end
        if c_timeline_now(3) == 0
          A_bis_copy(21:23,:) = [];
          A_bis_copy(:,21:23) = [];
          B_bis_copy(21:23) = [];
        end
        if c_timeline_now(2) == 0
          A_bis_copy(18:20,:) = [];
          A_bis_copy(:,18:20) = [];
          B_bis_copy(18:20) = [];
        end
        if c_timeline_now(1) == 0
          A_bis_copy(15:17,:) = [];
          A_bis_copy(:,15:17) = [];
          B_bis_copy(15:17) = [];
        end

    constrainedLegsList = [];
    swingLegsList = [];
    for i = 1:4
        if c_timeline_now(i) ~= 0
            constrainedLegsList = [constrainedLegsList i];
        else
            swingLegsList = [swingLegsList, i];
        end
    end

    B_bis_copy = B_bis_copy + Torques(1:26-length(swingLegsList)*3);

    ddq_n = pinv(A_bis_copy,1e-4)*B_bis_copy;

    end
    %------------------------------------------------- PONOWNE SPRAWDZENIE

    accelOfPGleg = dds2_PG_ht(1,1,0.5,1,dq_n(1),dq_n(2),dq_n(12),dq_n(13),dq_n(14),...
        q_n(1),q_n(2),q_n(12),q_n(13),q_n(14),...
        ddq_n(1),ddq_n(2),ddq_n(9),ddq_n(10),ddq_n(11),ddq_n(12),ddq_n(13),ddq_n(14));
    accelOfPDleg = dds2_PD_ht(1,1,0.5,1,dq_n(3),dq_n(4),dq_n(12),dq_n(13),dq_n(14),...
        q_n(3),q_n(4),q_n(12),q_n(13),q_n(14),...
        ddq_n(3),ddq_n(4),ddq_n(9),ddq_n(10),ddq_n(11),ddq_n(12),ddq_n(13),ddq_n(14));
    accelOfLDleg = dds2_LD_ht(1,1,0.5,1,dq_n(5),dq_n(6),dq_n(12),dq_n(13),dq_n(14),...
        q_n(5),q_n(6),q_n(12),q_n(13),q_n(14),...
        ddq_n(5),ddq_n(6),ddq_n(9),ddq_n(10),ddq_n(11),ddq_n(12),ddq_n(13),ddq_n(14));
    accelOfLGleg = dds2_LG_ht(1,1,0.5,1,dq_n(7),dq_n(8),dq_n(12),dq_n(13),dq_n(14),...
        q_n(7),q_n(8),q_n(12),q_n(13),q_n(14),...
        ddq_n(7),ddq_n(8),ddq_n(9),ddq_n(10),ddq_n(11),ddq_n(12),ddq_n(13),ddq_n(14));

    feetData(index, :) = [velocityOfPGleg(1)+accelOfPGleg(1)*time_step velocityOfPDleg(1)+accelOfPDleg(1)*time_step ... 
        velocityOfLDleg(1)+accelOfLDleg(1)*time_step velocityOfLGleg(1)+accelOfLGleg(1)*time_step ...
        accelOfPGleg(1) accelOfPDleg(1) accelOfLDleg(1) accelOfLGleg(1)];





















    ddq_n_adjusted = [ddq_n(1:14); zeros(12,1)];
    for i = 1:length(constrainedLegsList)
        ddq_n_adjusted(15+(constrainedLegsList(i)-1)*3:17+(constrainedLegsList(i)-1)*3) = ddq_n(15+(i-1)*3:17+(i-1)*3);
    end
    
    dq_n = dq_n + ddq_n_adjusted * time_step;
    q_n = q_n + dq_n * time_step;
    
    q_n_record(index,1:26) = q_n;
    q_n_record(index,15:26) = ddq_n_adjusted(15:26);
    index = index + 1;
    if rem(index,1000) == 0
        index
    end
    c_timeline_prev = c_timeline_now;
    %step_index = step_index + 1
end

save('save_q.mat','q_n_record');
q_n


return

% --------------------------------------------------------------------

function gl = groundLevelFunction(y_d, z_d)
    %if z_d < -1.1
    if z_d < -2
        gl = 0.5;
    else
        gl = 0;
    end
end

function c_ijk = christoffel(Q_,q_,i,j,k)
    c_ijk = 0.5*(diff(Q_(i,j), q_(k)) + ...
                 diff(Q_(i,k), q_(j)) - ...
                 diff(Q_(j,k), q_(i)));
end

function K = fast_Ki(s_,m_)
    K = 0.5*m_*(diff(s_(1))^2 + diff(s_(2))^2 + diff(s_(3))^2);
end

function A = transMatrix(o_z_, t_z_, t_x_, o_x_)
    A = [cos(o_z_), -sin(o_z_), 0, 0; sin(o_z_), cos(o_z_), 0, 0; 0, 0, 1, t_z_; 0,0,0,1]...
      * [1,0,0,t_x_; 0,cos(o_x_),-sin(o_x_),0; 0,sin(o_x_),cos(o_x_),0; 0,0,0,1];
end

