clc;
close all;
clear all;
%%
%open video
cam = videoinput('winvideo', 1, 'YUY2_640x480');

 src_obj = getselectedsource(cam);
 get(src_obj)

preview(cam)
disp ('end');

