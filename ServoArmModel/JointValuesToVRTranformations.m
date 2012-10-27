function [foreArmRotation foreArmTranslation ...
          armRotation armTranslation ... 
          gripperRotation gripperTranslation] = JointValuesToVRTranformations(joint0Val, joint1Val, joint2Val, joint3Val)
%% Kinematic model in meters
link0Len = 0.00;
link1Len = 0.0837;
link2Len = 0.1014;
link3Len = 0.0825;
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
                 0, 1,  0,   link0Len; % offset from base to first joint
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];
             
% Fore arm  Joint 1          
Joint1Frame =   [1, 0,  0,   0;
                 0, 1,  0,   link1Len; % link 1 offset (fore arm)
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];  

Joint2Frame =   [1, 0,  0,   0;
                 0, 1,  0,   link2Len;  % link 2 arm offset
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];
             
Joint3Frame =   [1, 0,  0,   0;
                 0, 1,  0,   link3Len;  % link 2 arm offset
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];
%% VR link frames

VR_Joint0Frame =[1, 0,  0,   0;
                 0, 1,  0,   0;  %185 link 2 arm offset
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];

VR_Joint1Frame =[1, 0,  0,   0;
                 0, 1,  0,   0.0837;  %185 link 2 arm offset
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];

VR_Joint2Frame =[1, 0,  0,   0;
                 0, 1,  0,   0.1851;  %185 link 2 arm offset
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];
             
VR_Joint3Frame =[1, 0,  0,   0.005;
                 0, 1,  0,   0.265;  % 0.2676 link 3 arm offset
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ]; 
             
center = [0,0,0,1];
Joint1Offset = [];
Joint2Offset = [];

%% Do the transformations
% parameters in degres:
% theta0
% theta1
% theta2
% theta3
%% Rotate Joint0
theta0 = joint0Val;
%% Rotate Joint1
fprintf('****************************************************************\n');
fprintf('                         Joint1                                 \n');
fprintf('****************************************************************\n')

% angle
theta1 = joint1Val;
fprintf('Theta1: %d\n' ,theta1);

% rotation bu angle of theta in degrees
Joint1Frame = Joint0Frame * Joint1Frame;
Joint1Frame = Joint1Frame * rothz(theta1);

fprintf('Joint 1 frame:\n');
disp(Joint1Frame);

% 3d vector no homogeneous
Joint1Offset =  Joint1Frame * center'; 
Joint1Offset = Joint1Offset(1:3)';

fprintf('Joint1Offset:\n');
disp(Joint1Offset);

% get rotation in VR world
VR_Joint1Frame = rothz(theta1) * VR_Joint1Frame;

VR_Joint1Position = GetTranslationFromFrame(VR_Joint1Frame);
VR_Joint1Translation = (-1)* VR_Joint1Position(1:3) + Joint1Offset;

% get axis angle representation from rotation matrix
foreArmRotation = vrrotmat2vec( t2r(VR_Joint1Frame) );
foreArmTranslation = VR_Joint1Translation;
%vrdrawnow;
%% Rotate Joint2
fprintf('****************************************************************\n');
fprintf('                         Joint2                                 \n');
fprintf('****************************************************************\n');

theta2 = joint2Val;
fprintf('Theta2:');
disp(theta2);

%rotate by joint1 rotation
Joint2Frame = Joint1Frame * Joint2Frame;
Joint2Frame = Joint2Frame * rothz(theta2);

fprintf('Joint 2 frame:\n');
disp(Joint2Frame);

Joint2Offset = Joint2Frame * center';
Joint2Offset = Joint2Offset(1:3)'; %3d vector no homogenious

fprintf('Joint2Offset:\n');
disp(Joint2Offset);

% get rotation in VR world
VR_Joint2Frame = rothz(theta1 + theta2) * VR_Joint2Frame;

VR_Joint2Position = GetTranslationFromFrame(VR_Joint2Frame);
VR_Joint2Translation = (-1)* VR_Joint2Position(1:3) + Joint2Offset;

fprintf('VR_Joint2Position:\n');
disp(VR_Joint2Position);

fprintf('VR_Joint2Translation:\n');
disp(VR_Joint2Translation);
% get axis angle representation from rotation matrix

armRotation = vrrotmat2vec( t2r(VR_Joint2Frame) ); %t2r(Joint2Frame) 
armTranslation = VR_Joint2Translation; %= Joint2Offset;
 
%%  Rotate Joint3
fprintf('****************************************************************\n');
fprintf('                         Joint3                                 \n');
fprintf('****************************************************************\n');

theta3= joint3Val;

fprintf('Theta3:');
disp(theta3);

%rotate by joint3 rotation
Joint3Frame = Joint2Frame * Joint3Frame;
Joint3Frame = Joint3Frame * rothz(theta3);

fprintf('Joint 3 frame:\n');
disp(Joint3Frame);

Joint3Offset = Joint3Frame * center';
Joint3Offset = Joint3Offset(1:3)'; %3d vector no homogenious

fprintf('Joint3Offset:\n');
disp(Joint3Offset);

VR_Joint3Frame = rothz(theta1 + theta2 + theta3) * VR_Joint3Frame;

VR_Joint3Position = GetTranslationFromFrame(VR_Joint3Frame);
VR_Joint3Translation = (-1)* VR_Joint3Position(1:3) + Joint3Offset;

fprintf('VR_Joint3frame\n');
disp(VR_Joint3Frame);

fprintf('VR_Joint3Position:\n');
disp(VR_Joint3Position);

fprintf('VR_Joint3Translation:\n');
disp(VR_Joint3Translation);

% get axis angle representation from rotation matrix
gripperRotation = vrrotmat2vec( t2r(VR_Joint3Frame) ); %t2r(Joint2Frame) 
gripperTranslation =VR_Joint3Translation;
end
