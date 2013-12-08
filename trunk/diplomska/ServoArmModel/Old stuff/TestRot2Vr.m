%% Clean up
clc;
clear all;
close all;
%% Base Frame
frame = [1,0,0;
         0,1,0;
         0,0,1;
         ];
 
fprintf('Frame:\n');
disp(frame)
%% Vr world
world = vrworld('Rot.wrl', 'new');
open(world);
fig = vrfigure(world);
cyl = vrnode(world, 'Cylinder');
%% Transformations
theta0 = -90;
theta1 = 45;
theta2 = 90;
%% rotx
fprintf('*******************rotx*******************\n');
fprintf('Theta0:');
disp(theta0);

frame = frame * rotx(theta0, 'deg');
fprintf('Frame:\n');
disp(frame)

vr_rot = vrrotmat2vec(frame);

fprintf('Vr_rotation:\n');
disp(vr_rot);
%% Roty
fprintf('*******************roty*******************\n');
fprintf('Theta2:');
disp(theta1);

frame = frame * roty(theta1, 'deg');
fprintf('Frame:\n');
disp(frame)

vr_rot = vrrotmat2vec(frame);
fprintf('Vr_rotation:\n');
disp(vr_rot);

%% RotZ
fprintf('*******************rotZ*******************\n');
fprintf('Theta2:');
disp(theta2);

frame = frame * rotZ(theta2, 'deg');
fprintf('Frame:\n');
disp(frame)

vr_rot = vrrotmat2vec(frame);
fprintf('Vr_rotation:\n');
disp(vr_rot);

%% Apply rotation
translVect = [0, 0.5, 0];
transfVector = frame * translVect';
disp(transfVector);
cyl.rotation = vr_rot;
cyl.translation = transfVector';
vrdrawnow;