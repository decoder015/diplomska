%----------------------------------------------------
% parameters: 
% comPort:      serial port name e.g. 'COM13'
% servo number: 0-4, 
% angle:        in degreees
%----------------------------------------------------
function RotateServo(comPort, sevoNumber, angle)
%% Open serial port
serialPort=serial(comPort', 'BaudRate', 9600, 'DataBits',8);
serialPort.terminator = 'CR';
fopen(serialPort);
%% Wrte to serial port
% write to port
% mini SSC 2 syntx [sync] [servo] [positon]
% eg. 255 0 
position = angles2servoPos(angle);
disp(position);
fwrite(serialPort, 255);          %[sync]
fwrite(serialPort, sevoNumber);   %[servo]
fwrite(serialPort, position);     %[positon]

pause(0.3);
%% close serial port
fclose(serialPort);
end