%%
clc;
close all;
clear all;
%%
%read image
imgBlank   = imread('Blank.jpg');
imgObjects = imread('Objects.jpg');

subplot(3,3,1);
title('Objects');
imshow(imgObjects);

subplot(3,3,2);
title('Blank')
imshow(imgBlank);

% calc difference
imgDif = imgBlank - imgObjects;

subplot(3,3,3);
imshow(imgDif);

imgGray = rgb2gray(imgDif);

subplot(3,3,4)
imshow(imgGray);

threshold = 20;

binary_image = imgGray > threshold;

subplot(3,3,5);
imshow(binary_image);

%label objects
imgLbl = bwlabel(binary_image,4);

imshow( label2rgb(imgLbl) );

%get blobs
blobMeasurements = regionprops(imgLbl, 'all');

for i=1:1:length(blobMeasurements)
    
    if(blobMeasurements(i).Area > 50)       
        x = blobMeasurements(i).Centroid(1);
        y = blobMeasurements(i).Centroid(2);
        boxw =blobMeasurements(i).BoundingBox(2);
        disp(blobMeasurements(i).BoundingBox);
        w = blobMeasurements(i).BoundingBox(3);
        h = blobMeasurements(i).BoundingBox(4);
        
        fprintf('Blob area:\n')
        disp(blobMeasurements(i).Area);
        fprintf('Box width');
        disp(boxw)
        %# draw a rectangle
        rectangle('Position',[x-(w/2) y-(h/2) w h], 'LineWidth',2, 'EdgeColor','r');
    end

end


%open video
%cam = videoinput('winvideo', 1, 'RGB24_320x240');