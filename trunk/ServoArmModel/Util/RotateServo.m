%----------------------------------------------------
% parameters: 
% comPort:      serial port name e.g. 'COM13'
% port state:   0 closed, 1 opend
% servo number: 0-4, 
% angle:        in degreees
%----------------------------------------------------
function RotateServo(comPort, sevoNumber, angle)
%% Wrte to serial port
% write to port
% mini SSC 2 syntx [sync] [servo] [positon]
% eg. 255 0 
position = angles2servoPos(angle);
%disp(position);
fwrite(comPort, 255);          %[sync]
fwrite(comPort, sevoNumber);   %[servo]
fwrite(comPort, position);     %[positon]
%=======================END=========================