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

%% Show the GUI and run the sim

%hanlde = UIJointJog;

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
% x+ is to the right
% y+ is towrd me
% z+ is down
FromRobotToWorld =   [1, 0,  0,   -0.5;
                      0, 0, -1,    0;
                      0, 1,  0,   -0.51;
                      0, 0,  0,   1;
    ];
FromWorldToRobot = inv(FromRobotToWorld)

CenterRobotInWorldFrame=[0.5, 0.51, 0, 1]';
CenterWorldFrame = [0,0,0,1]';

% transformation from  frame to robot frame
FromRobotToWorld * CenterRobotInWorldFrame ;

% transformation from world frame to robot frame
FromWorldToRobot * CenterWorldFrame ;


%%
world = vrworld('ArmModel3D.wrl', 'new');
open(world);
fig = vrfigure(world);
baseCube = vrnode(world, 'Base');
disp(baseCube.translation);% = [-.5, -.51, 0];
disp(baseCube.rotation);
for i=0:0.1:2*pi
    pause(0.1)
    baseCube.rotation = [0,1,0,i];
end
%sim('JointJogSim');