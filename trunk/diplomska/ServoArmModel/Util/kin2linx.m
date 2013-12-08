%**************************************************************************
%
%**************************************************************************
function [linxRobotJointAng] = kin2linx(joint1 ,joint2, joint3, joint4)

% j2 and j3 are different by 90 (pi/2)deg from kinematic model!!!
linxRobotJointAng(1) = joint1;
linxRobotJointAng(2) = pi/2 - joint2;
linxRobotJointAng(3) = pi/2 + joint3;
linxRobotJointAng(4) = joint4;
end