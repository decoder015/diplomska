clc;
close all;
clear all;
%%
%open video
cam = videoinput('winvideo', 1, 'RGB24_320x240');
preview(cam);