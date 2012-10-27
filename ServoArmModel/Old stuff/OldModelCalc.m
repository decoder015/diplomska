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

%% Somme extra code
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