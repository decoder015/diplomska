%%
clc;
close all;
clear all;
%% Set global variables for joins 
% used for communication between GUI and Simulink
global joint0Val ;
global joint1Val ;
global joint2Val ;
global joint3Val ;

joint0Val = 0;
joint1Val = 0;
joint2Val = 0;
joint3Val = 0;

%% Kinematic model in meters

% world frame 
% x+ is to the right 
% y+ is pointing up
% z+ is towards me
worldFrame = [ 1, 0, 0, 0;
               0, 1, 0, 0;
               0, 0, 1, 0;
               0, 0, 0, 1;
    ];

% current robot orientation
% Fore arm
Joint0Frame =   [1, 0,  0,   0;
                 0, 1,  0,   0.06;
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];
% Fore arm            
Joint1Frame =   [1, 0,  0,   0;
                 0, 1,  0,   0.08;
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];  

Joint2Frame =   [1, 0,  0,   0;
                 0, 1,  0,   0.26;
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];             

Joint1Offset = [0, 0.08, 0];
Joint2Offset = [0, 0.19, 0];
%% Show the GUI and run the sim
%hanlde = UIJointJog;
world = vrworld('ArmModel3D.wrl', 'new');
open(world);
fig = vrfigure(world);
%% Get robot components
baseCube = vrnode(world, 'Base');
foreArm  = vrnode(world, 'ForeArm');
arm = vrnode(world, 'Arm');
%% Do the transformations
% parameters in degres:
% theta0
% theta1
% theta2
% theta3
%% Rotate Joint0
theta0 = 10;

%% Rotate Joint1
fprintf('****************************************************************\n');
fprintf('                         Joint1                                 \n');
fprintf('****************************************************************\n')

theta1 = 00;

Joint1Frame = Joint1Frame * rothz(theta1);
tmpJoint1Offset = Joint1Offset * t2r(Joint1Frame);

disp(Joint1Frame);
disp(tmpJoint1Offset);

tmpJoint1Offset(1,1) = tmpJoint1Offset(1,1);
tmpJoint1Offset(1,2) = Joint1Offset(1,2) - tmpJoint1Offset(1,2);
tmpJoint1Offset(1,3) = tmpJoint1Offset(1,3);

disp(Joint1Offset);
disp(tmpJoint1Offset);

% get axis angle representation form rottion matrix
foreArm.rotation = vrrotmat2vec( t2r(Joint1Frame) );
foreArm.translation = tmpJoint1Offset;
%% Rotate Joint2
fprintf('****************************************************************\n');
fprintf('                         Joint2                                 \n');
fprintf('****************************************************************\n');

theta2 = 90;

Joint2Frame = Joint2Frame * Joint1Frame * rothz(theta2);
tmpJoint2Offset = Joint2Offset * t2r(Joint2Frame);

disp(Joint2Frame);
disp(tmpJoint2Offset);

tmpJoint2Offset(1,1) = tmpJoint2Offset(1,1);
tmpJoint2Offset(1,2) = Joint2Offset(1,2) - tmpJoint2Offset(1,2);
tmpJoint2Offset(1,3) = tmpJoint2Offset(1,3);

disp(Joint2Offset);
disp(tmpJoint2Offset);

% get axis angle representation form rottion matrix
arm.rotation = vrrotmat2vec( t2r(Joint2Frame) );
arm.translation = tmpJoint2Offset;

%plot frame
%trplot(Joint0FrameInv, 'frame', 'Joint0')
%sim('JointJogSim');