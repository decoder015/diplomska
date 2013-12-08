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
%Joint0Frame =  transl(0,a 0.06, 0)
%Joint0Frame =t Joint0Frame * rothx(-90);
%disp(Joint0Frame);
%frInv = inv(Joint0Frame)

%rotation = Joint0Frame * rothz(0)
%rotVect = getZ(Joint0Frame);
%%
L(1) = Link([ 0	0 pi/2 0], 'standard');
L(2) = Link([ 0	0 pi/2 0], 'standard');
%twolink = SerialLink(L, 'name', 'two link');
%twolink.plot([0 0 0 0 0]);
%%
L(1) = Link([ 0     0   2  0], 'standard');
L(2) = Link([ pi/2     0   3  pi/2], 'standard');
twolink = SerialLink(L, 'name', 'two link')
T=rpy2tr(0,0,0); 
T(1:2, 4)=[1 1]
Qsol=twolink.ikine(T, zeros(1,2), [1 1 0 0 0 0]);
twolink.plot([0,pi/2])

