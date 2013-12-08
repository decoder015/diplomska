%**************************************************************************
%       Checks if joint values are wiht in linx robot joint limits.
%      if limits are outside linx robot set joints to max/min value.
%      In radians!! 
%**************************************************************************
function [joints] = linxJointLimis(joint1, joint2, joint3, joint4)
    joints(1) = checkJointLimitLinx(joint1);
    joints(2) = checkJointLimitLinx(joint2);
    joints(4) = checkJointLimitLinx(joint3);
    joints(5) = checkJointLimitLinx(joint4);  
end

function [joint] = checkJointLimitLinx(joint)
    if(joint > pi/4)
        joint = pi/4;
    end
    
    if(joint < -pi/4)
        joint = -pi/4;
    end;
end

