
syms T1 T2 T3 T4 T5 T6 T7 T8
syms lambdaPG_x lambdaPG_y lambdaPG_z lambdaPD_x lambdaPD_y lambdaPD_z lambdaLD_x lambdaLD_y lambdaLD_z lambdaLG_x lambdaLG_y lambdaLG_z

Jc_PG = jacobian([s2_PG(1);s2_PG(2);s2_PG(3)],q);
Jc_PD = jacobian([s2_PD(1);s2_PD(2);s2_PD(3)],q);
Jc_LD = jacobian([s2_LD(1);s2_LD(2);s2_LD(3)],q);
Jc_LG = jacobian([s2_LG(1);s2_LG(2);s2_LG(3)],q); 
Js = [Jc_PG.' Jc_PD.' Jc_LD.' Jc_LG.'].';

eqn = [Q*diff(q,t,t).'+C*diff(q,t).'+D==(Js.')*[lambdaPG_x;lambdaPG_y;lambdaPG_z;lambdaPD_x;lambdaPD_y;lambdaPD_z;lambdaLD_x;lambdaLD_y;lambdaLD_z;lambdaLG_x;lambdaLG_y;lambdaLG_z] +...
    [T1; T2; T3; T4; T5; T6; T7; T8; 0; 0; 0; 0; 0; 0];
    Jc_PG*diff(q,t,t).'+diff(Jc_PG,t)*diff(q,t).'==[0;0;0];
    Jc_PD*diff(q,t,t).'+diff(Jc_PD,t)*diff(q,t).'==[0;0;0];
    Jc_LD*diff(q,t,t).'+diff(Jc_LD,t)*diff(q,t).'==[0;0;0];
    Jc_LG*diff(q,t,t).'+diff(Jc_LG,t)*diff(q,t).'==[0;0;0]];
eqn = subs(eqn, [diff(q(1),t,t) diff(q(2),t,t) diff(q(3),t,t) diff(q(4),t,t) diff(q(5),t,t) diff(q(6),t,t) ...
     diff(q(7),t,t) diff(q(8),t,t) diff(q(9),t,t) diff(q(10),t,t) diff(q(11),t,t) diff(q(12),t,t) diff(q(13),t,t) diff(q(14),t,t)],...
     [qdd(1) qdd(2) qdd(3) qdd(4) qdd(5) qdd(6) qdd(7) qdd(8) qdd(9) qdd(10) qdd(11) qdd(12) qdd(13) qdd(14)]);

[A, B] = equationsToMatrix(eqn, [T1 T2 T3 T4 T5 T6 T7 T8 qdd(9) qdd(10) qdd(11) qdd(12) qdd(13) qdd(14) lambdaPG_x lambdaPG_y lambdaPG_z lambdaPD_x lambdaPD_y lambdaPD_z lambdaLD_x lambdaLD_y lambdaLD_z lambdaLG_x lambdaLG_y lambdaLG_z]);

q_wo = sym('q_wo',[n 1]);
dq_wo = sym('dq_wo',[n 1]);
ddq_wo = sym('ddq_wo',[n 1]);
A = subs(A, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
    [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
A = subs(A, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
    [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);
B = subs(B, [dq(1) dq(2) dq(3) dq(4) dq(5) dq(6) dq(7) dq(8) dq(9) dq(10) dq(11) dq(12) dq(13) dq(14)],...
    [dq_wo(1) dq_wo(2) dq_wo(3) dq_wo(4) dq_wo(5) dq_wo(6) dq_wo(7) dq_wo(8) dq_wo(9) dq_wo(10) dq_wo(11) dq_wo(12) dq_wo(13) dq_wo(14)]);
B = subs(B, [q(1) q(2) q(3) q(4) q(5) q(6) q(7) q(8) q(9) q(10) q(11) q(12) q(13) q(14)],...
    [q_wo(1) q_wo(2) q_wo(3) q_wo(4) q_wo(5) q_wo(6) q_wo(7) q_wo(8) q_wo(9) q_wo(10) q_wo(11) q_wo(12) q_wo(13) q_wo(14)]);

A_ht = matlabFunction(A);
B_ht = matlabFunction(B);

%--------------------------------------------------------------------------

ddq_n = zeros(26,1);
dq_n = zeros(26,1);
example = matfile('save_q_desired.mat');
q_n = example.q_desired_array(1,:).';
q_n(9) = -0.2;
q_trajectory = example.q_desired_array;
example = matfile('save_q_desired_derivative.mat');
q_trajectory_derivative = example.q_desired_array_deriv;
example = matfile('save_q_desired_array_accel.mat');
q_trajectory_accel = example.q_desired_array_accel; 
example = matfile('save_c_desired.mat');
c_timeline = example.c_desired_array;

time_to_record = 4;
time_step = 0.0001;

T_list_time = zeros(time_to_record/time_step,8);
Lambda_list = zeros(time_to_record/time_step,12);

index = 1;
for tim = 0:time_step:(time_to_record - time_step)
    qdd_demanded = q_trajectory_accel(index,:);

    A_bis = A_ht(1,1,0.5,1,1,q_n(1),q_n(2),q_n(3),q_n(4),q_n(5),q_n(6),q_n(7),q_n(8),q_n(12),q_n(13),q_n(14));
    B_bis = B_ht(1,1,0.5,1,dq_n(1),dq_n(2),dq_n(3),dq_n(4),dq_n(5),dq_n(6),dq_n(7),dq_n(8),dq_n(12),dq_n(13),dq_n(14),...
        9.8,1,q_n(1),q_n(2),q_n(3),q_n(4),q_n(5),q_n(6),q_n(7),q_n(8),q_n(12),q_n(13),q_n(14),...
        qdd_demanded(1),qdd_demanded(2),qdd_demanded(3),qdd_demanded(4),...
        qdd_demanded(5),qdd_demanded(6),qdd_demanded(7),qdd_demanded(8));

    c_timeline_now = c_timeline(index,:);

        % if c_timeline_now(1) == 1
        %     B_bis(15:17) = B_bis(15:17) - velocityOfPGleg(1:3) / time_step;
        % end
        % if c_timeline_now(2) == 1
        %     B_bis(18:20) = B_bis(18:20) - velocityOfPDleg(1:3) / time_step;
        % end
        % if c_timeline_now(3) == 1
        %     B_bis(21:23) = B_bis(21:23) - velocityOfLDleg(1:3) / time_step;
        % end
        % if c_timeline_now(4) == 1
        %     B_bis(24:26) = B_bis(24:26) - velocityOfLGleg(1:3) / time_step;
        % end

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

    ddq_n = pinv(A_bis,1e-12)*B_bis;
    ddq_n_adjusted = [ddq_n(1:14); zeros(12,1)];
    for i = 1:length(constrainedLegsList)
        ddq_n_adjusted(15+(constrainedLegsList(i)-1)*3:17+(constrainedLegsList(i)-1)*3) = ddq_n(15+(i-1)*3:17+(i-1)*3);
    end
    T_list_time(round(index),:) = ddq_n_adjusted(1:8);
    dq_n = dq_n + [qdd_demanded(1:8).'; ddq_n_adjusted(9:26)] * time_step;
    q_n = q_n + dq_n * time_step;
    index = index + 1;
    Lambda_list(index,:) = ddq_n_adjusted(15:26);
end

