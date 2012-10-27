%%
clc;
close all;
clear all;
%% Global variables for rotation of joints 
% used for communication between GUI and Simulink
global joint0Val ;
global joint1Val ;
global joint2Val ;
global joint3Val ;
%% Global variables initialization
joint0Val = 0;
joint1Val = 0;
joint2Val = 0;
joint3Val = 0;

%% Show the GUI and run the sim
%hanlde = UIJointJog;
world = vrworld('ArmModel3D.wrl', 'new');
open(world);
fig = vrfigure(world);
%% Get the robot components
baseCube = vrnode(world, 'Base');
foreArm  = vrnode(world, 'ForeArm');
arm = vrnode(world, 'Arm');
gripper = vrnode(world, 'Gripper');

baseServo01 = vrnode(world, 'Base_Servo_01');
baseServo02 = vrnode(world, 'Base_Servo_02');
%% Do the transformations
% parameters in degres:
 theta0 = 0;
 theta1 = 0;
 theta2 = 0;
 theta3 = 45;

% get VR transformations
[vr_foreArmRotation, vr_foreArmTranslation,...
 vr_armRotation,     vr_armTranslation,...
 vr_gripperRotation, vr_gripperTranslation] = JointValuesToVRTranformations(theta0, theta1, theta2, theta3);

% foreArm
foreArm.rotation = vr_foreArmRotation;
foreArm.translation = vr_foreArmTranslation;

% arm
arm.rotation = vr_armRotation;
arm.translation = vr_armTranslation;

% gripper
% get axis angle representation from rotation matrix
gripper.rotation = vr_gripperRotation;
gripper.translation =vr_gripperTranslation;

% redraw 3D env
vrdrawnow
