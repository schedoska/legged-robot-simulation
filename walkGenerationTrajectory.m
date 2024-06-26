q_FromIK = InverseLegKinematics(1,1,1,0.2)
return

time_of_action = 8;
time_step = 0.001;

q_desired_array = zeros(time_of_action/time_step, 26);
q_desired_array_deriv = zeros(time_of_action/time_step, 26);

for cos = 1:(time_of_action/time_step)
    q_desired_array(cos,:) = [0.7227 -1.4455 0.7227 -1.4455 0.7227 -1.4455 0.7227 -1.4455 zeros(1,18)];
end

XY_trajectory_derived = zeros(time_of_action/time_step, 8);
XY_trajectory = zeros(time_of_action/time_step, 8);
XY_trajectory(1,:) = [1.5 0 1.5 0 1.5 0 1.5 0];

%----------------------------------------------------------------------------------------------------

XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 0, 0.4, -0.75, 0.5, time_step, 1);   % SWING
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 0.4, 0.8, 0.75, 0.5, time_step, 1);  % SWING
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 0, 0.8, 0, -0.156, time_step, 2);
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 0, 0.8, 0, -0.156, time_step, 3);
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 0, 0.8, 0, -0.156, time_step, 4);

XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 1, 1.8, 0, -0.156, time_step, 1);   
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 1, 1.4, -0.75, 0.5, time_step, 2);    % Swing
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 1.4, 1.8, 0.75, 0.5, time_step, 2);    % Swing
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 1, 1.8, 0, -0.156, time_step, 3);
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 1, 1.8, 0, -0.156, time_step, 4);

XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 2, 2.8, 0, -0.156, time_step, 1);   
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 2, 2.8, 0, -0.156, time_step, 2);    
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 2, 2.4, -0.75, 0.5, time_step, 3);    % Swing
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 2.4, 2.8, 0.75, 0.5, time_step, 3);    % Swing
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 2, 2.8, 0, -0.156, time_step, 4);

XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 3, 3.8, 0, -0.156, time_step, 1);   
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 3, 3.8, 0, -0.156, time_step, 2);    
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 3, 3.8, 0, -0.156, time_step, 3);    
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 3, 3.4, -0.75, 0.5, time_step, 4);    % Swing
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 3.4, 3.8, 0.75, 0.5, time_step, 4);    % Swing

%=====

XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 4, 4.4, -0.75, 0.5, time_step, 1);   % SWING
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 4.4, 4.8, 0.75, 0.5, time_step, 1);  % SWING
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 4, 4.8, 0, -0.156, time_step, 2);
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 4, 4.8, 0, -0.156, time_step, 3);
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 4, 4.8, 0, -0.156, time_step, 4);

XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 5, 5.8, 0, -0.156, time_step, 1);   
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 5, 5.4, -0.75, 0.5, time_step, 2);    % Swing
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 5.4, 5.8, 0.75, 0.5, time_step, 2);    % Swing
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 5, 5.8, 0, -0.156, time_step, 3);
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 5, 5.8, 0, -0.156, time_step, 4);

XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 6, 6.8, 0, -0.156, time_step, 1);   
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 6, 6.8, 0, -0.156, time_step, 2);    
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 6, 6.4, -0.75, 0.5, time_step, 3);    % Swing
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 6.4, 6.8, 0.75, 0.5, time_step, 3);    % Swing
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 6, 6.8, 0, -0.156, time_step, 4);

XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 7, 7.8, 0, -0.156, time_step, 1);   
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 7, 7.8, 0, -0.156, time_step, 2);    
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 7, 7.8, 0, -0.156, time_step, 3);    
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 7, 7.4, -0.75, 0.5, time_step, 4);    % Swing
XY_trajectory_derived = recordLinearVel(XY_trajectory_derived, 7.4, 7.8, 0.75, 0.5, time_step, 4);    % Swing


for i = 2:(time_of_action/time_step)
    XY_trajectory(i,:) = XY_trajectory(i-1,:) + XY_trajectory_derived(i,:)*time_step;
end
for i = 1:(time_of_action/time_step)
    q_desired_array(i,1:2) = InverseLegKinematics(1,1,XY_trajectory(i,1),XY_trajectory(i,2));
    q_desired_array(i,3:4) = InverseLegKinematics(1,1,XY_trajectory(i,3),XY_trajectory(i,4));
    q_desired_array(i,5:6) = InverseLegKinematics(1,1,XY_trajectory(i,5),XY_trajectory(i,6));
    q_desired_array(i,7:8) = InverseLegKinematics(1,1,XY_trajectory(i,7),XY_trajectory(i,8));
end


c_desired_array = zeros(time_of_action/time_step, 4);
for i = 1:1/time_step
        c_desired_array(i,:) = [0,1,1,1];
end
for i = 1/time_step:2/time_step
        c_desired_array(i,:) = [1,0,1,1];
end
for i = 2/time_step:3/time_step
        c_desired_array(i,:) = [1,1,0,1];
end
for i = 3/time_step:4/time_step
        c_desired_array(i,:) = [1,1,1,0];
end
for i = 4/time_step:5/time_step
        c_desired_array(i,:) = [0,1,1,1];
end
for i = 5/time_step:6/time_step
        c_desired_array(i,:) = [1,0,1,1];
end
for i = 6/time_step:7/time_step
        c_desired_array(i,:) = [1,1,0,1];
end
for i = 7/time_step:8/time_step
        c_desired_array(i,:) = [1,1,1,0];
end


% -----------------------------------------------------------------------------------------------------

for cos = 1:((time_of_action/time_step)-1)
    q_desired_array_deriv(cos,:) = q_desired_array(cos+1,:) - q_desired_array(cos,:);
end

save('save_q_desired','q_desired_array');
save('save_q_desired_derivative','q_desired_array_deriv');
save('save_c_desired',"c_desired_array");

%-----------------------------------------------------------------------------------------------------------

function H = recordLinearVel(XY_trajectory_derived, Start, End, vel_x, vel_y, time_step, Leg)
    for t = (Start/time_step+1):(End/time_step)
       t = round(t);
         XY_trajectory_derived(t,(Leg-1)*2+1:(Leg-1)*2+2) = [vel_x vel_y];
    end
    H = XY_trajectory_derived;
end

function q = moveLineary(q_trajectory, s_start, s_end, time_start, time_end, time_step, q_0_index, q_1_index)
    start_index = time_start / time_step + 1
    end_index = time_end / time_step

    dx = (s_end(1) - s_start(1)) / (start_index - end_index)
    dy = (s_end(2) - s_start(2)) / (start_index - end_index)
    
    for t = 0:(end_index - start_index)
        qr = InverseLegKinematics(1,1,s_start(1)-dx*t, s_start(2)-dy*t);
        q_trajectory(start_index+t,q_0_index) = qr(1);
        q_trajectory(start_index+t,q_1_index) = qr(2);
    end
    q = q_trajectory;
end


function q = InverseLegKinematics(a1,a2,x, y)
    L = sqrt(x^2 + y^2);
    if L > 2
        x
        y
    end
    q(2) = - pi + acos((a1^2+a2^2-L^2)/(2*a1*a2));
    q(1) = - atan(y/x) + acos((a1^2+L^2-a2^2)/(2*a1*L));
end