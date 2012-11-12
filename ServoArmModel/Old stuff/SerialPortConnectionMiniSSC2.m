clc;
clear all;
close all;
%%
% open serial port
%PrintWithHeader('Open serial port');
serialPort=serial('COM13', 'BaudRate', 9600, 'DataBits',8);
serialPort.terminator = 'CR';
fopen(serialPort);
% disp(serialPort);
%%
% write to port
% mini SSC 2 syntx [sync] [servo] [positon]
% eg. 255 0 
fwrite(serialPort, 255); %[sync]
fwrite(serialPort, 1);   %[servo]
fwrite(serialPort,  127);   %[positon]
%%
% read from serial
% data = freadf(serialPort);
% fprintf('Reciving data...\n %s',data);
%%
%
%
fclose(serialPort);

servopos = angles2servoPos(0);
fprintf('Servopos:');
disp(servopos);