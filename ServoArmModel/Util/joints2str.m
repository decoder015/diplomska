%**************************************************************************
%
%**************************************************************************
function [jointsStr] = joints2str(joint1, joint2, joint3, joint4, joint5, joint6)

%return formated string
jointsStr = sprintf ('J1:%4.2f J2:%4.2f J3:%4.2f J4:%4.2f J5:%4.2f J6:%4.2f', ...
                      joint1, joint2, joint3, joint4, joint5, joint6);
end    