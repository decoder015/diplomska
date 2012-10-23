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
% Fore arm Joint 0
Joint0Frame =   [1, 0,  0,   0;
                 0, 1,  0,   0.06; % offset from base to first joint
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];
             
% Fore arm  Joint 1          
Joint1Frame =   [1, 0,  0,   0;
                 0, 1,  0,   0.08; % link 1 offset (fore arm)
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];  

Joint2Frame =   [1, 0,  0,   0;
                 0, 1,  0,   0.11;  % link 2 arm offset
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];             
center = [0,0,0,1];
Joint1Offset = [];
Joint2Offset = [];
%% Show the GUI and run the sim
%hanlde = UIJointJog;
world = vrworld('ArmModel3D.wrl', 'new');
open(world);
fig = vrfigure(world);
%% Get the robot components
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

% angle
theta1 = 90;
fprintf('Theta1: %d\n' ,theta1);

% rotation bu angle of theta in degrees
Joint1Frame = Joint1Frame * rothz(theta1);

fprintf('Joint 1 frame:\n');
disp(Joint1Frame);

Joint1Offset = Joint1Frame * center';
 % 3d vector no homogeneous 
Joint1Offset = Joint1Offset(1:3)';

tmpJoint1Offset = Joint1Offset * t2r(Joint1Frame);
fprintf('Joint1 offset vector:\n')
disp(tmpJoint1Offset);

tmpJoint1Offset(1,1) = tmpJoint1Offset(1,1);
tmpJoint1Offset(1,2) = Joint1Offset(1,2) - tmpJoint1Offset(1,2);
tmpJoint1Offset(1,3) = tmpJoint1Offset(1,3);

disp(Joint1Offset);
disp(tmpJoint1Offset);

%testv=[0,0,0,1]';
%Joint1Frame * testv

% get axis angle representation from rotation matrix
foreArm.rotation = vrrotmat2vec( t2r(Joint1Frame) );
foreArm.translation = tmpJoint1Offset;

 vrdrawnow;
%% Rotate Joint2
fprintf('****************************************************************\n');
fprintf('                         Joint2                                 \n');
fprintf('****************************************************************\n');

theta2 = 0;
fprintf('Theta2:');
disp(theta2);

%rotate by joint1 rotation
Joint2Frame =  Joint1Frame * Joint2Frame;

test = [0,0.19,0];
test * rotz(theta0)

fprintf('Joint 2 frame:\n');
disp(Joint2Frame);

Joint2Offset = Joint2Frame * center';
Joint2Offset = Joint2Offset(1:3)'; %3d vector no homogenious

fprintf('Joint2Offset:\n');
disp(Joint2Offset);

% get axis angle representation from rotation matrix
arm.rotation = vrrotmat2vec( (rotz(pi/2)) ); %t2r(Joint2Frame) 

 vrdrawnow; 
%%  Rotate Joint3
fprintf('****************************************************************\n');
fprintf('                         Joint3                                 \n');
fprintf('****************************************************************\n');

%Joint2Frame = Joint2Frame * Joint1Frame * rothz(theta2);
%Joint2Offset = Joint2Offset * t2r(Joint1Frame);
%disp(Joint2Frame);
%disp(Joint2Offset);

%tmpJoint2Offset = tmpJoint1Offset + Joint2Offset * t2r(Joint2Frame);


%disp(tmpJoint2Offset);

%tmpJoint2Offset(1,1) = tmpJoint2Offset(1,1);
%tmpJoint2Offset(1,2) = Joint2Offset(1,2) - tmpJoint2Offset(1,2);
%tmpJoint2Offset(1,3) = tmpJoint2Offset(1,3);

%disp(Joint2Offset);
%disp(tmpJoint2Offset);

% get axis angle representation form rottion matrix
%arm.rotation = vrrotmat2vec( t2r(Joint2Frame) );
%arm.translation = tmpJoint2Offset;

%plot frame
%trplot(Joint0FrameInv, 'frame', 'Joint0')
%sim('JointJogSim');