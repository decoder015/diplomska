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