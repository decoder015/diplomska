%% Angles to servo position
% 90 deg = 127 pos
% 0 deg  = 0 pos
% -90 = 255;
function [servoPos]=angles2servoPos(angle)


servoPos = floor((127/45)*angle + 127);

if(servoPos > 255)
   servoPos = 255;
end

if(servoPos < 0)
    servoPos = 0;
end

end