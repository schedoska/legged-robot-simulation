clear all;

time_of_action = 25;
time_step = 0.0001;

q_desired_array = zeros(round(time_of_action/time_step), 26);
q_desired_array_deriv = zeros(round(time_of_action/time_step), 26);
q_desired_array_accel = zeros(round(time_of_action/time_step), 26);

for cos = 1:(time_of_action/time_step)
    q_desired_array(cos,:) = [0.7227 -1.4455 0.7227 -1.4455 0.7227 -1.4455 0.7227 -1.4455 zeros(1,18)];
end

XY_trajectory_derived = zeros(round(time_of_action/time_step), 8);
XY_trajectory = zeros(round(time_of_action/time_step), 8);
XY_trajectory(1,:) = [1.5 0 1.5 0.3 1.5 0 1.5 0];

%--------------------------------------------------------- SWING TRAJECTORY

SwingTime = 1;
LegUpHeight = 0.2;
LegMoveDistance = -0.3;
Smooth = 0.5;

XY_SWING_TRAJ_der = zeros(round(SwingTime/time_step),2);

hx = 4*LegUpHeight/(SwingTime*(2-Smooth));
XY_SWING_TRAJ_der = paintLinearChange(XY_SWING_TRAJ_der, time_step, 0, Smooth*0.25*SwingTime, 0, hx, 1);
XY_SWING_TRAJ_der = paintLinearChange(XY_SWING_TRAJ_der, time_step, Smooth*0.25*SwingTime, 0.5*SwingTime-Smooth*0.25*SwingTime, hx, hx, 1);
XY_SWING_TRAJ_der = paintLinearChange(XY_SWING_TRAJ_der, time_step, 0.5*SwingTime-Smooth*0.25*SwingTime, 0.5*SwingTime+Smooth*0.25*SwingTime, hx, -hx, 1);
XY_SWING_TRAJ_der = paintLinearChange(XY_SWING_TRAJ_der, time_step, 0.5*SwingTime+Smooth*0.25*SwingTime, SwingTime-Smooth*0.25*SwingTime, -hx, -hx, 1);
XY_SWING_TRAJ_der = paintLinearChange(XY_SWING_TRAJ_der, time_step, SwingTime-Smooth*0.25*SwingTime, SwingTime, -hx, 0, 1);

hy = 2*LegMoveDistance/(SwingTime*(2-Smooth));
XY_SWING_TRAJ_der = paintLinearChange(XY_SWING_TRAJ_der, time_step, 0, Smooth*0.5*SwingTime, 0, hy, 2);
XY_SWING_TRAJ_der = paintLinearChange(XY_SWING_TRAJ_der, time_step, Smooth*0.5*SwingTime, SwingTime-Smooth*0.5*SwingTime, hy, hy, 2);
XY_SWING_TRAJ_der = paintLinearChange(XY_SWING_TRAJ_der, time_step, SwingTime-Smooth*0.5*SwingTime, SwingTime, hy, 0, 2);

%--------------------------------------------------------- SWING TRAJECTORY
%--------------------------------------------------------- SUPPORT TRAJECTORY

SupportTime = 1;
SupportLegMoveDistance = 0.1;

hy = SupportLegMoveDistance/SupportTime;
XY_SUPPORT_TRAJ_der = zeros(round(SupportTime/time_step),2);
XY_SUPPORT_TRAJ_der = paintLinearChange(XY_SUPPORT_TRAJ_der, time_step, 0, SupportTime, hy, hy, 2);

%--------------------------------------------------------- SUPPORT TRAJECTORY

% XY_trajectory_derived(1:250000,:) = 0;
% % 
% SwingHeightTime = 0.1;
% SwingHeightVelo = 2;
% SwingStaleTime = 0.15;
% SwingStaleVelo = -1.6666676;
% SupportTime = 0.9;
% SupportVelo = 0.83333333;
% preSupportOff = 0.1;
% afterSupportOff = 0.1;
% 
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0, SwingHeightTime, SwingHeightVelo, SwingHeightVelo, 1);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, SwingHeightTime, SwingHeightTime+SwingStaleTime, SwingStaleVelo, SwingStaleVelo, 2);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, SwingHeightTime+SwingStaleTime, 2*SwingHeightTime+SwingStaleTime, -SwingHeightVelo, -SwingHeightVelo, 1);
% Offset = 2*SwingHeightTime+SwingStaleTime;
% 
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, Offset, Offset+SwingHeightTime, SwingHeightVelo, SwingHeightVelo, 1);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, Offset+SwingHeightTime, Offset+SwingHeightTime+SwingStaleTime, SwingStaleVelo, SwingStaleVelo, 2);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, Offset+SwingHeightTime+SwingStaleTime, Offset+2*SwingHeightTime+SwingStaleTime, -SwingHeightVelo, -SwingHeightVelo, 1);
% Offset = Offset+2*SwingHeightTime+SwingStaleTime+preSupportOff;
% 
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, Offset, Offset+SupportTime, SupportVelo, SupportVelo, 2);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, Offset, Offset+SupportTime, SupportVelo, SupportVelo, 2);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, Offset, Offset+SupportTime, SupportVelo, SupportVelo, 2);
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, Offset, Offset+SupportTime, SupportVelo, SupportVelo, 2);
% Offset = Offset+SupportTime+afterSupportOff;
% 
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, Offset, Offset+SwingHeightTime, SwingHeightVelo, SwingHeightVelo, 1);
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, Offset+SwingHeightTime, Offset+SwingHeightTime+SwingStaleTime, SwingStaleVelo, SwingStaleVelo, 2);
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, Offset+SwingHeightTime+SwingStaleTime, Offset+2*SwingHeightTime+SwingStaleTime, -SwingHeightVelo, -SwingHeightVelo, 1);
% Offset = Offset+2*SwingHeightTime+SwingStaleTime;
% 
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, Offset, Offset+SwingHeightTime, SwingHeightVelo, SwingHeightVelo, 1);
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, Offset+SwingHeightTime, Offset+SwingHeightTime+SwingStaleTime, SwingStaleVelo, SwingStaleVelo, 2);
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, Offset+SwingHeightTime+SwingStaleTime, Offset+2*SwingHeightTime+SwingStaleTime, -SwingHeightVelo, -SwingHeightVelo, 1);
% Offset = Offset+2*SwingHeightTime+SwingStaleTime+preSupportOff;
% 
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, Offset, Offset+SupportTime, -0.66*SupportVelo, -0.66*SupportVelo, 2);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, Offset, Offset+SupportTime, -0.66*SupportVelo, -0.66*SupportVelo, 2);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, Offset, Offset+SupportTime, -0.66*SupportVelo, -0.66*SupportVelo, 2);
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, Offset, Offset+SupportTime, -0.66*SupportVelo, -0.66*SupportVelo, 2);
% Offset = Offset+SupportTime+afterSupportOff+preSupportOff;
% RecordPeriod = Offset
% % RecordPeriod = 10;
% round(RecordPeriod/time_step);

XY_trajectory_derived(1:round(time_of_action/time_step),:) = 0;

 XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0, 0.1, 2, 2, 1);
 XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0.1, 0.2, -2.5, -2.5, 2);
 XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0.2, 0.3, -2, -2, 1);

 XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0, 0.1, 2, 2, 1);
 XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0.1, 0.2, -2.5, -2.5, 2);
 XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0.2, 0.3, -2, -2, 1);

 XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0.55, 0.7, 1.6666, 1.6666, 2);
 XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.55, 0.7, 1.6666, 1.6666, 2);
 XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0.55, 0.7, 1.6666, 1.6666, 2);
 XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 0.55, 0.7, 1.6666, 1.6666, 2);
 XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.55, 0.7, -0.2, -0.2, 1);
 XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 0.55, 0.7, -0.2, -0.2, 1);
 XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.7, 0.8, 0.3, 0.3, 1);
 XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 0.7, 0.8, 0.3, 0.3, 1);

 XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 1, 1.1, 2, 2, 1);
 XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 1.1, 1.2, -2.5, -2.5, 2);
 XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 1.2, 1.3, -2, -2, 1);

 XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 1, 1.1, 2, 2, 1);
 XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 1.1, 1.2, -2.5, -2.5, 2);
 XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 1.2, 1.3, -2, -2, 1);
RecordPeriod = 2;
%---------------------------------------------------------------------- NA
%DOLE JEST TO CO POWYŻEJ ALE ZMODYFIKOWANE NIE USUWAJ TEGO CO JEST POWYŻEJ
%BO TO ORYGINALNY NAJLLEPSYZ CHÓD JAKI POSIADAMY XDDDDDDD
XY_trajectory_derived(1:round(time_of_action/time_step),:) = 0;

 XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0, 0.1, 2, 2, 1);
 XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0.1, 0.2, -2.5, -2.5, 2);
 XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0.2, 0.3, -2, -2, 1);

 XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0, 0.1, 2, 2, 1);
 XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0.1, 0.2, -2.5, -2.5, 2);
 XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0.2, 0.3, -2, -2, 1);

 XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0.7, 0.85, 1.6666, 1.6666, 2);
 XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.7, 0.85, 1.6666, 1.6666, 2);
 XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0.7, 0.85, 1.6666, 1.6666, 2);
 XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 0.7, 0.85, 1.6666, 1.6666, 2);
 XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.7, 0.85, -0.2, -0.2, 1);
 XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 0.7, 0.85, -0.2, -0.2, 1);
 XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.85, 0.95, 0.3, 0.3, 1);
 XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 0.85, 0.95, 0.3, 0.3, 1);

 XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 1.35, 1.45, 2, 2, 1);
 XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 1.45, 1.55, -2.5, -2.5, 2);
 XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 1.55, 1.65, -2, -2, 1);

 XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 1.35, 1.45, 2, 2, 1);
 XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 1.45, 1.55, -2.5, -2.5, 2);
 XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 1.55, 1.65, -2, -2, 1);
RecordPeriod = 2.05;
%---------------------------------------------------------------------- NA
%DOLE JEST TO CO POWYŻEJ ALE ZMODYFIKOWANE NIE USUWAJ TEGO CO JEST POWYŻEJ
%BO TO ZMODYFIKOWANA ALE STABILNA CZASOWO WERSJA CHODu JAKI POSIADAMY XDDDDDDD
XY_trajectory_derived(1:round(time_of_action/time_step),:) = 0;

UPVELO = 2.5;
BACKVELO = -0.83333333;

 XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0, 0.15, UPVELO, UPVELO, 1);
 XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0.0, 0.3, BACKVELO, BACKVELO, 2);
 XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0.15, 0.3, -UPVELO, -UPVELO, 1);

 XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0, 0.15, UPVELO, UPVELO, 1);
 XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0.0, 0.3, BACKVELO, BACKVELO, 2);
 XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0.15, 0.3, -UPVELO, -UPVELO, 1);

 XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0.7, 0.85, 1.6666, 1.6666, 2);
 XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.7, 0.85, 1.6666, 1.6666, 2);
 XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0.7, 0.85, 1.6666, 1.6666, 2);
 XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 0.7, 0.85, 1.6666, 1.6666, 2);
 % XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.7, 0.85, -0.2, -0.2, 1);
 % XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 0.7, 0.85, -0.2, -0.2, 1);
 % XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.85, 0.95, 0.3, 0.3, 1);
 % XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 0.85, 0.95, 0.3, 0.3, 1);

 XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 1.25, 1.4, UPVELO, UPVELO, 1);
 XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 1.25, 1.55, BACKVELO, BACKVELO, 2);
 XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 1.4, 1.55, -UPVELO, -UPVELO, 1);

 XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 1.25, 1.4, UPVELO, UPVELO, 1);
 XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 1.25, 1.55, BACKVELO, BACKVELO, 2);
 XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 1.4, 1.55, -UPVELO, -UPVELO, 1);
RecordPeriod = 1.95;


% XY_trajectory_derived(1:round(time_of_action/time_step),:) = 0;
% 
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0, 0.1, 2, 2, 2);
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 0, 0.1, 2, 2, 2);
% 
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0.1, 0.16, -2, -2, 1);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0.1, 0.16, -2, -2, 1);
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0.16, 0.18, 1, 1, 1);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0.16, 0.18, 1, 1, 1);
% 
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.19, 0.24, 3, 3, 1);
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 0.19, 0.24, 3, 3, 1);
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0.19, 0.29, 2, 2, 2);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0.19, 0.29, 2, 2, 2);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.24, 0.29, -3, -3, 1);
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 0.24, 0.29, -3, -3, 1);
% 
% RecordPeriod = 40;


% KROK_1 - działa
% XY_trajectory_derived(:) = 0;
% 
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0, 0.1, 2, 2, 1);
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0.1, 0.2, -2, -2, 2);
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0.2, 0.28, -2, -2, 1);
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0.28, 0.32, -2, 0, 1);
% 
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.62, 0.72, 2, 2, 1);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.72, 0.82, -2, -2, 2);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.82, 0.9, -2, -2, 1);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.9, 0.94, -2, 0, 1);
% 
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 0, 0.32, 0.22, 0.22, 2);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0, 0.32, 0.22, 0.22, 2);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0, 0.32, 0.22, 0.22, 2);
% 
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 0.62, 0.94, 0.22, 0.22, 2);
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 0.62, 0.94, 0.22, 0.22, 2);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0.62, 0.94, 0.22, 0.22, 2);
% 
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 1.24, 1.34, 2, 2, 1);
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 1.34, 1.44, -2, -2, 2);
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 1.44, 1.52, -2, -2, 1);
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 1.52, 1.56, -2, 0, 1);
% 
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 1.86, 1.96, 2, 2, 1);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 1.96, 2.06, -2, -2, 2);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 2.06, 2.14, -2, -2, 1);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 2.14, 2.18, -2, 0, 1);
% 
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 1.24, 1.56, 0.22, 0.22, 2);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 1.24, 1.56, 0.22, 0.22, 2);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 1.24, 1.56, 0.22, 0.22, 2);
% 
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 1.86, 2.18, 0.22, 0.22, 2);
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 1.86, 2.18, 0.22, 0.22, 2);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 1.86, 2.18, 0.22, 0.22, 2);
% RecordPeriod = 2.48;

% XY_trajectory_derived(:) = 0;
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0, 0.1, 2, 2, 1);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.1, 0.3, -1.5, -1.5, 2);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 0.3, 0.5, -1, -1, 1);
% 
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0.6, 0.7, 2, 2, 1);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0.7, 0.9, -1.5, -1.5, 2);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 0.9, 1.1, -1, -1, 1);
% 
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 1.5, 1.8, 1, 1, 2);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 1.5, 1.8, 1, 1, 2);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 1.5, 1.8, 1, 1, 2);
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 1.5, 1.8, 1, 1, 2);
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2),time_step, 1.5, 1.8, -0.1, -0.1, 1);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4),time_step, 1.5, 1.8, -0.1, -0.1, 1);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6),time_step, 1.5, 1.8, -0.1, -0.1, 1);
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8),time_step, 1.5, 1.8, -0.1, -0.1, 1);
% RecordPeriod = 200;

for w = 1:100
    for e = 1:round(RecordPeriod/time_step)
        if e+w*(round(RecordPeriod/time_step)) > height(XY_trajectory_derived)
            break;
        end
        XY_trajectory_derived(e+w*(round(RecordPeriod/time_step)),:) = XY_trajectory_derived(e,:);
    end
end


 % XY_trajectory_derived(:) = 0;
XY_trajectory = IntegrateArray(XY_trajectory_derived, [-1.3 -0.0 -1.3 -0.0 -1.3 -0.0 -1.3 -0.0], time_step);

hhh = figure;



subplot(4,1,1)
plot([time_step:time_step:1.95],-XY_trajectory(1:19500,4),'b');
grid on;
ylabel('$y \: [m]$','interpreter','latex');
%set ( gca, 'ydir', 'reverse' )
legend('$y_d(t) - PG$','interpreter','latex');
subplot(4,1,2)
plot([time_step:time_step:1.95],-XY_trajectory(1:19500,2),'b');
grid on;
ylabel('$y \: [m]$','interpreter','latex');
%set ( gca, 'ydir', 'reverse' )
legend('$y_d(t) - PD$','interpreter','latex');
subplot(4,1,3)
plot([time_step:time_step:1.95],-XY_trajectory(1:19500,8),'b');
grid on;
ylabel('$y \: [m]$','interpreter','latex');
%set ( gca, 'ydir', 'reverse' )
legend('$y_d(t) - LD$','interpreter','latex');
subplot(4,1,4)
plot([time_step:time_step:1.95],-XY_trajectory(1:19500,6),'b');
grid on;
ylabel('$x \: [m]$','interpreter','latex');
xlabel('$t \: [s]$','interpreter','latex');
%set ( gca, 'ydir', 'reverse' )
legend('$y_d(t) - LG$','interpreter','latex');
return



set ( gca, 'ydir', 'reverse' )

xlabel('$y \: [m]$','interpreter','latex');
ylabel('$x \: [m]$','interpreter','latex');
% axis([0 1 1.45 2.05])
legend('$p_d(t) - Faza \: swobodna$','$p_d(t) - Faza \: podpierania$','interpreter','latex');
title('Ścieżka ruchu nogi w czasie cyklu','interpreter','latex')
return


% -------------------------------------------------- SKOK
% XY_trajectory_derived(:,:) = 0;
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2), time_step, 0, 0.1, -3, -3, 1);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4), time_step, 0, 0.1, -3, -3, 1);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6), time_step, 0, 0.1, -3, -3, 1);
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8), time_step, 0, 0.1, -3, -3, 1);
% 
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2), time_step, 0.1, 0.2, 3, 3, 1);
% XY_trajectory_derived(:,3:4) = paintLinearChange(XY_trajectory_derived(:,3:4), time_step, 0.1, 0.2, 3, 3, 1);
% XY_trajectory_derived(:,5:6) = paintLinearChange(XY_trajectory_derived(:,5:6), time_step, 0.1, 0.2, 3, 3, 1);
% XY_trajectory_derived(:,7:8) = paintLinearChange(XY_trajectory_derived(:,7:8), time_step, 0.1, 0.2, 3, 3, 1);
% XY_trajectory = IntegrateArray(XY_trajectory_derived, [-1.5 -0 -1.5 0.0 -1.5 0 -1.5 0.0], time_step);

%------------------------------------------------ DO PRA Y INZYCNIERKSIEJ
% Ts = 1;
% gamma = 1;
% H_l = 1;
% t_gamma = gamma*(1/4)*Ts;
% Vmax = H_l*(1/(Ts*(1-0.5*gamma)));
% 
% XY_trajectory_derived(:,:) = 0;
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2), time_step, 0, t_gamma, 0, -Vmax, 1);
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2), time_step, t_gamma, 0.5*Ts-t_gamma, -Vmax, -Vmax, 1);
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2), time_step, 0.5*Ts-t_gamma, 0.5*Ts+t_gamma, -Vmax, Vmax, 1);
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2), time_step, 0.5*Ts+t_gamma, Ts-t_gamma, Vmax, Vmax, 1);
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2), time_step, Ts-t_gamma, Ts, Vmax, 0, 1);
% XY_trajectory = IntegrateArray(XY_trajectory_derived, [-1.5 -0 -1.5 0.0 -1.5 0 -1.5 0.0], time_step);
% 
% subplot(3,2,1)
% hold on;
% grid on;
% plot(0:time_step:1, -XY_trajectory(1:10001,1),'k','LineWidth',1.1)
% xlabel('$t \:[s]$','interpreter','latex');
% ylabel('$x_d \:[m]$','interpreter','latex');
% axis([0 1 1.45 2.05])
% legend('$\gamma = 1$','interpreter','latex');
% 
% subplot(3,2,3)
% hold on;
% grid on;
% plot(0:time_step:1, -XY_trajectory_derived(1:10001,1),'k','LineWidth',1.1)
% xlabel('$t \:[s]$','interpreter','latex');
% ylabel('$\dot{x}_d \:[m/s]$','interpreter','latex');
% axis([0 1 -1.5 1.5])
% 
% for cos = 1:((time_of_action/time_step)-1)
%     if cos == -1
%         q_desired_array_deriv(cos,1) = XY_trajectory_derived(cos,1) / time_step;
%     else
%     q_desired_array_deriv(cos,1) = (XY_trajectory_derived(cos+1,1) - XY_trajectory_derived(cos,1)) / time_step;
%     end
% end
% 
% subplot(3,2,5)
% hold on;
% grid on;
% plot(0:time_step:(1-2*time_step), -q_desired_array_deriv(1:9999,1),'k','LineWidth',1.1)
% xlabel('$t \:[s]$','interpreter','latex');
% ylabel('$\ddot{x}_d \:[m/s^2]$','interpreter','latex');
% axis([0 1 -12 12])
% 
% Ts = 1;
% gamma = 0.5;
% deltaz = 0.5;
% t_gamma = gamma*(1/4)*Ts;
% Vmax = deltaz*(1/(Ts*(1-0.5*gamma)));
% 
% XY_trajectory_derived(:,:) = 0;
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2), time_step, 0, t_gamma, 0, Vmax, 1);
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2), time_step, t_gamma, Ts-t_gamma, Vmax, Vmax, 1);
% XY_trajectory_derived(:,1:2) = paintLinearChange(XY_trajectory_derived(:,1:2), time_step, Ts-t_gamma, Ts, Vmax, 0, 1);
% XY_trajectory = IntegrateArray(XY_trajectory_derived, [-1.5 -0 -1.5 0.0 -1.5 0 -1.5 0.0], time_step);
% 
% subplot(3,2,2)
% hold on;
% grid on;
% plot(0:time_step:1, -XY_trajectory(1:10001,1),'k','LineWidth',1.1)
% xlabel('$t \:[s]$','interpreter','latex');
% ylabel('$z_d \:[m]$','interpreter','latex');
% axis([0 1 0.85 1.55])
% 
% subplot(3,2,4)
% hold on;
% grid on;
% plot(0:time_step:1, -XY_trajectory_derived(1:10001,1),'k','LineWidth',1.1)
% xlabel('$t \:[s]$','interpreter','latex');
% ylabel('$\dot{z}_d \:[m/s]$','interpreter','latex');
% axis([0 1 -0.75 0.1])
% 
% for cos = 1:((time_of_action/time_step)-1)
%     if cos == -1
%         q_desired_array_deriv(cos,1) = XY_trajectory_derived(cos,1) / time_step;
%     else
%     q_desired_array_deriv(cos,1) = (XY_trajectory_derived(cos+1,1) - XY_trajectory_derived(cos,1)) / time_step;
%     end
% end
% 
% subplot(3,2,6)
% hold on;
% grid on;
% plot(0:time_step:(1-2*time_step), -q_desired_array_deriv(1:9999,1),'k','LineWidth',1.1)
% xlabel('$t \:[s]$','interpreter','latex');
% ylabel('$\ddot{z}_d \:[m/s^2]$','interpreter','latex');
% axis([0 1 -6 6])
% return

%------------------------------------------------ DO PRA Y INZYCNIERKSIEJ


%---------------------------------------------------------------------------------------------------------
for i = 1:(time_of_action/time_step)
    q_desired_array(i,1:2) = InverseLegKinematics(1,1,XY_trajectory(i,1),XY_trajectory(i,2));
    q_desired_array(i,3:4) = InverseLegKinematics(1,1,XY_trajectory(i,3),XY_trajectory(i,4));
    q_desired_array(i,5:6) = InverseLegKinematics(1,1,XY_trajectory(i,5),XY_trajectory(i,6));
    q_desired_array(i,7:8) = InverseLegKinematics(1,1,XY_trajectory(i,7),XY_trajectory(i,8));
end
for cos = 1:((time_of_action/time_step)-1)
    if cos == -1
        q_desired_array_deriv(cos,:) = q_desired_array(cos,:) / time_step;
    else
    q_desired_array_deriv(cos,:) = (q_desired_array(cos+1,:) - q_desired_array(cos,:));% / time_step;
    end
end
for cos = 1:((time_of_action/time_step)-2)
    if cos == -1
        q_desired_array_accel(cos,:) = q_desired_array_deriv(cos,:) / time_step;
    else
    q_desired_array_accel(cos,:) = (q_desired_array_deriv(cos+1,:) - q_desired_array_deriv(cos,:)) / time_step;
    end
end
save('save_q_desired','q_desired_array');
save('save_q_desired_derivative','q_desired_array_deriv');
save('save_q_desired_array_accel','q_desired_array_accel');
c_desired_array = zeros(round(time_of_action/time_step), 4);
for i = 1:round(1.5/time_step)
        c_desired_array(i,:) = [0,1,1,1];
end
for i = round(1.5/time_step):round(time_of_action/time_step)
        c_desired_array(i,:) = [1,1,1,1];
end

save('save_c_desired',"c_desired_array");

% ----------------------------------------------------------------------------------------
function q = IntegrateArray(array, BegVal, time_step)
    q = zeros(height(array), width(array));
    q(1,:) = BegVal;
    for i = 2:height(array)
        q(i,:) = q(i-1,:) + array(i-1,:) * time_step;
    end
end

function q = paintLinearChange(array, time_step, tim_start, tim_end, start_val, end_val, parameter)
    dif = start_val - end_val;
    d_per_step = dif / (tim_start/time_step - tim_end/time_step); 
    for t = (tim_start/time_step+1):(tim_end/time_step)
        t = round(t);
        array(t,parameter) = start_val + (t-(tim_start/time_step)) * d_per_step;
    end
    q = array;
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

function q = insertIn2ColumnsPeriodacly(array, insertable, Offset_tim, T_period, step_time)
    for i = 0:100
        if round(Offset_tim/step_time)+i*round(T_period/step_time)+height(insertable) > height(array)
            q = array;
            return
        end
        for k = 1:height(insertable)
            array(round(Offset_tim/step_time)+i*round(T_period/step_time)+k,:) = insertable(k,:);
        end
    end
    q = array;
end







