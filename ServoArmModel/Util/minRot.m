%*******************************************************
% For given vector of angles with more then 2Pi returns minimum angles.
% Angles are in radians.
%*******************************************************
function [minangle] = minRot(angle)
for i=1:1:length(angle)
    angle(i) = minAngle(angle(i));
end
minangle = angle;
end

%% Find min angle
% delta = angle tollerance
function [ang] = minAngle(angle)
    i = 1;
    delta = 0.5;
    while(abs(angle) + delta >= 2*pi)
        fprintf('angle: %6.4f\n',radtodeg(angle));
        angle = angle - (sign(angle)*2*pi);
        i = i+1;
    end
    ang= angle;
end