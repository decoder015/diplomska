%% Stereo Vision
% Stereo vision is the process of recovering depth from camera images by
% comparing two or more views of the same scene. Simple, binocular stereo
% uses only two images, typically taken with parallel cameras that were
% separated by a horizontal distance known as the "baseline." The output of
% the stereo computation is a disparity map (which is translatable to a
% range image) which tells how far each point in the physical scene was
% from the camera.
%
% In this demo, we use MATLAB(R) and the 
% Computer Vision System Toolbox(TM) to compute the depth map between 
% two rectified stereo images. See the 
% <matlab:showdemo('videorectification') Image Rectification Demo>
% to learn about the details behind rectification. In this demo we use
% block matching, which is the standard algorithm for high-speed stereo
% vision in hardware systems [8]. We first explore basic block matching,
% and then apply dynamic programming to improve accuracy, and image
% pyramiding to improve speed.
%
% This demo is similar to the Simulink(R)
% <matlab:showdemo('vipstereo')>Disparity Estimation for Stereo Vision Demo>.
% The main difference is that the Simulink demo does not assume it has been
% given rectified images, and so searches along general epipolar lines that
% are not necessarily parallel to the x-axis.
%
%  Copyright 2004-2010 The MathWorks, Inc.
%  $Revision: 1.1.6.1 $Date: 2010/08/30 02:59:52 $

%% Step 1. Read Stereo Image Pair
% Here we read in the color stereo image pair and convert the images to
% gray scale for the matching process. Using color images may provide some
% improvement in accuracy, but it is more efficient to work with only 
% one-channel images. For this we use the |ImageDataTypeConverter| and the 
% |ColorSpaceConverter| System objects. Below we show the left camera image
% and a color composite of both images so that one can easily see the
% disparity between them.
clc
clear all
close all %close all diagrams

hIdtc = vision.ImageDataTypeConverter;
hCsc = vision.ColorSpaceConverter('Conversion','RGB to intensity');

leftI3chan = step(hIdtc, imread('.\img\scene_left.png'));
leftI = step(hCsc,leftI3chan);

rightI3chan = step(hIdtc, imread('.\img\scene_right.png'));
rightI = step(hCsc,rightI3chan);

imgColorComposite = cat(3, rightI, leftI, leftI);

figure(1)
subplot(2,2,1), imshow(leftI3chan)  ,title('Left image') , axis image;
subplot(2,2,2), imshow(rightI3chan) ,title('Right image');
subplot(2,2,3), imshow(imgColorComposite) ,title('Color composite (right=red, left=cyan)');

%BasicBlockMatching(leftI, rightI);
%SubPixelEstimation(leftI, rightI);

%CombinedPyramidingAndDynamicProgramming(leftI, rightI);

BackProjection(leftI, rightI, leftI3chan, rightI3chan);