clc;
clear all;
close all;
%%
% world frame 
% x+ is to the right 
% y+ is pointing up
% z+ is towards me
worldFrame = [ 1, 0, 0, 0;
               0, 1, 0, 0;
               0, 0, 1, 0;
               0, 0, 0, 1;
    ];
%%
Joint0Frame =  transl(0, 0.06, 0)
Joint0Frame = Joint0Frame * rothx(-90);
disp(Joint0Frame);
%frInv = inv(Joint0Frame)

rotation = Joint0Frame * rothz(0)
rotVect = getZ(Joint0Frame);