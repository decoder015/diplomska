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
                 0, 1,  0,   0.16;
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];  

Joint2Frame =   [1, 0,  0,   0;
                 0, 1,  0,   0.26;
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];             
             
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

theta0 = 45;
theta1 = 45;

Joint0FrameInv = [];
Joint0FrameInv = inv(Joint0Frame);
disp(Joint0FrameInv)

foreArmTranslation = GetTranslationFromFrame(Joint0FrameInv)
foreArm.translation = foreArmTranslation(1:3);

%[RotationAxe, Angle]
vectorY = GetY(Joint0FrameInv);
Joint0RotationVector = [vectorY(1:3), theta1];
disp(Joint0RotationVector);
foreArm.rotation = Joint0RotationVector;

%plot frame
%trplot(Joint0FrameInv, 'frame', 'Joint0')




%sim('JointJogSim');