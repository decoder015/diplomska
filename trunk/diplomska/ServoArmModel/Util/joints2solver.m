%**************************************************************************
%
%**************************************************************************
function [joints]=joints2solver(joint0, joint1, joint2, joint3,...
                                joint4, joint5, joint6)
                            
    joints = [joint0, 90-joint1, -90+joint2, joint3, joint4, joint5]; %, joint6                       
    
    % return joint values in robot conf
    joints = degtorad(joints);
end