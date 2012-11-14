clc;
close all;
clear all;
%%
%open video
cam =  videoinput('winvideo', 1, 'RGB24_640x480');

 src_obj = getselectedsource(cam);
 get(src_obj)
subplot(2,2,1);
preview(cam)
disp ('end');

