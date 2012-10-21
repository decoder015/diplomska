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

hanlde = UIJointJog;
%sim('JointJogSim');