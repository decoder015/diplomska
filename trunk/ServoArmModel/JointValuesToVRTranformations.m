function [baseServosRotation ...          
          foreArmRotation foreArmTranslation ...
          armRotation armTranslation ... 
          gripperRotation gripperTranslation] = JointValuesToVRTranformations(joint0Val, joint1Val, joint2Val, joint3Val, debugMode)
%% Kinematic model in meters
link0Len = 0.06;
link1Len = 0.0237;
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
                 0, 1,  0,   0.06;  %185 link 2 arm offset
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];

VR_Joint1Frame =[1, 0,  0,   0;
                 0, 1,  0,   0.08237;  %185 link 2 arm offset
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];

VR_Joint2Frame =[1, 0,  0,   0;
                 0, 1,  0,   0.1851;  %185 link 2 arm offset
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ];
             
VR_Joint3Frame =[1, 0,  0,   0;
                 0, 1,  0,   0.2676 %0.265;  % 0.2676 link 3 arm offset
                 0, 0,  1,   0;
                 0, 0,  0,   1;
                 ]; 
             
VR_center = [0,0,0,1];
%% Do the transformations
% ***********************************************************
% Note : Joint rotations of frames should be allways around z+ axes
% ***********************************************************
% parameters are in degres:
% theta0
% theta1
% theta2
% theta3
%% Rotate Joint0
%****************************************************************
%                         Joint0                                 
%****************************************************************
% angle
theta0 = joint0Val;

% base servo rotations
tmpRot = roty(theta0, 'deg');
baseServosRotation = vrrotmat2vec(tmpRot);

% rotation by angle of theta in degrees
Joint0Frame = Joint0Frame * rothy(theta0);

% 3d vector no homogeneous
Joint0Offset = Joint0Frame * VR_center'; 
Joint0Offset = Joint0Offset(1:3)';

% get rotation in VR world
VR_Joint0Frame = VR_Joint0Frame * rothy(theta0); %rothz(theta0)

VR_Joint0Position = GetTranslationFromFrame(VR_Joint0Frame);
VR_Joint0Translation = (-1)* VR_Joint0Position(1:3) + Joint0Offset;

if(debugMode)
    fprintf('****************************************************************\n');
    fprintf('                         Joint0                                 \n');
    fprintf('****************************************************************\n')
    fprintf('Theta0: %d\n' ,theta0);
    fprintf('Joint 0 frame:\n');
    disp(Joint0Frame);
    fprintf('VR_Joint0Frame:\n');
    disp(VR_Joint0Frame);
    fprintf('Joint0Offset:\n');
    disp(Joint0Offset);
    fprintf('VR_Joint0Position:\n');
    disp(VR_Joint0Position);
    fprintf('VR_Joint0Translation:\n');
    disp(VR_Joint0Translation);
    fprintf('VR_rotation');
    disp(vrrotmat2vec( t2r(VR_Joint0Frame) ) );
end
%% Rotate Joint1
%*****************************************************************
%                         Joint1                                 
%*****************************************************************
% angle
theta1 = joint1Val;

% rotation bu angle of theta in degrees
Joint1Frame = Joint0Frame * Joint1Frame;
Joint1Frame = Joint1Frame * rothz(theta1);

% 3d vector no homogeneous
Joint1Offset =  Joint1Frame * VR_center'; 
Joint1Offset = Joint1Offset(1:3)';

% get rotation in VR world
%VR_Joint1Frame = VR_Joint0Frame * VR_Joint1Frame;
VR_Joint1Frame = rothy(theta0) * rothz(theta1) * VR_Joint1Frame ;

VR_Joint1Position = GetTranslationFromFrame(VR_Joint1Frame);
VR_Joint1Translation = (-1)* VR_Joint1Position(1:3) + Joint1Offset;

% get axis angle representation from rotation matrix
foreArmRotation = vrrotmat2vec( t2r(Joint1Frame) );
foreArmTranslation = VR_Joint1Translation;

if(debugMode)
    fprintf('****************************************************************\n');
    fprintf('                         Joint1                                 \n');
    fprintf('****************************************************************\n')    
    fprintf('Theta1: %d\n' ,theta1);    
    fprintf('Joint 1 frame:\n');
    disp(Joint1Frame);    
    fprintf('VR_Joint1Frame:\n');
    disp(VR_Joint1Frame);    
    fprintf('Joint1Offset:\n');
    disp(Joint1Offset);    
    fprintf('VR_Joint1Position:\n');
    disp(VR_Joint1Position);    
    fprintf('VR_Joint1Translation:\n');
    disp(VR_Joint1Translation);
end
%vrdrawnow;
%% Rotate Joint2
%****************************************************************
%                         Joint2                                 
%****************************************************************    
theta2 = joint2Val;

%rotate by joint1 rotation
Joint2Frame = Joint1Frame * Joint2Frame;
Joint2Frame = Joint2Frame * rothz(theta2);

Joint2Offset = Joint2Frame * VR_center';
Joint2Offset = Joint2Offset(1:3)'; %3d vector no homogenious

% get rotation in VR world
%VR_Joint2Frame = VR_Joint2Frame * VR_Joint1Frame;
VR_Joint2Frame =  rothy(theta0) * rothz(theta1) * ...
                  rothz(theta2) * VR_Joint2Frame;

VR_Joint2Position = GetTranslationFromFrame(VR_Joint2Frame);
VR_Joint2Translation = (-1)* VR_Joint2Position(1:3) + Joint2Offset;

% get axis angle representation from rotation matrix
armRotation = vrrotmat2vec( t2r(Joint2Frame) ); %t2r(Joint2Frame) 
armTranslation = VR_Joint2Translation; %= Joint2Offset;

if(debugMode)
    fprintf('****************************************************************\n');
    fprintf('                         Joint2                                 \n');
    fprintf('****************************************************************\n');    
    fprintf('Theta2:');
    disp(theta2);    
    fprintf('Joint 2 frame:\n');
    disp(Joint2Frame);    
    fprintf('VR_Joint2Frame:\n');
    disp(VR_Joint2Frame);    
    fprintf('Joint2Offset:\n');
    disp(Joint2Offset);    
    fprintf('VR_Joint2Position:\n');
    disp(VR_Joint2Position);    
    fprintf('VR_Joint2Translation:\n');
    disp(VR_Joint2Translation);
end 
%%  Rotate Joint3
%*****************************************************************
%                         Joint3                                 
%*****************************************************************
theta3= joint3Val;

%rotate by joint3 rotation
Joint3Frame = Joint2Frame * Joint3Frame;
Joint3Frame = Joint3Frame * rothz(theta3);

Joint3Offset = Joint3Frame * VR_center';
Joint3Offset = Joint3Offset(1:3)'; %3d vector no homogenious

%VR_Joint3Frame = VR_Joint2Frame * VR_Joint3Frame;
VR_Joint3Frame = rothy(theta0) * rothz(theta1) * ...
                  rothz(theta2) *rothz(theta3) * VR_Joint3Frame;

VR_Joint3Position = GetTranslationFromFrame(VR_Joint3Frame);
VR_Joint3Translation = (-1)* VR_Joint3Position(1:3) + Joint3Offset;

% get axis angle representation from rotation matrix
gripperRotation = vrrotmat2vec( t2r(VR_Joint3Frame) );
gripperTranslation =VR_Joint3Translation;

if(debugMode)
    fprintf('****************************************************************\n');
    fprintf('                         Joint3                                 \n');
    fprintf('****************************************************************\n');
    fprintf('Theta3:');
    disp(theta3);
    fprintf('Joint 3 frame:\n');
    disp(Joint3Frame);
    fprintf('VR_Joint3frame\n');
    disp(VR_Joint3Frame);
    fprintf('Joint3Offset:\n');
    disp(Joint3Offset);
    fprintf('VR_Joint3Position:\n');
    disp(VR_Joint3Position);
    fprintf('VR_Joint3Translation:\n');
    disp(VR_Joint3Translation);
end
end
