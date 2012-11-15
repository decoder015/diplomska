%**************************************************************************
%               Detect objects using background subtraction
%
%   Input parameters
%   imgBlank:   an image without objects
%   imgObjects: an image with objects
%   treshold:   gray sclate treshold to create bit map
%   blobSize:   use only clusters with size greater then blobSize
%**************************************************************************
function [objects] = detectObjects(imgBlank, imgObjects, display)
%%
%debugMode
% ON = 1
% OFF = 0;
debugMode = 1;

% calc difference
imgDif = imgBlank - imgObjects;

% convert it to gray scale image
imgGray = rgb2gray(imgDif);

threshold = 30;
% create bit map: Above tresholod are 1's
binary_image = imgGray > threshold;

% fill empty holles
filled = imfill(binary_image, 'holes');

%clean border
filled = imclearborder(filled);

%label objects (Connected componnents)
imgLbl = bwlabel(filled, 4);

%get blobs
blobMeasurements = regionprops(imgLbl, 'all');

imshow(imgObjects, 'parent', display);
minBlobArea = 100;
for i=1:1:length(blobMeasurements)    
    %filter blobs
    if(blobMeasurements(i).Area > minBlobArea )       
        x = blobMeasurements(i).Centroid(1);
        y = blobMeasurements(i).Centroid(2);        
        %boxw =blobMeasurements(i).BoundingBox(2);
        %disp(blobMeasurements(i).BoundingBox);
        %get width and height of bounding box
        w = blobMeasurements(i).BoundingBox(3);
        h = blobMeasurements(i).BoundingBox(4);        
        %fprintf('Blob area:\n')
        %disp(blobMeasurements(i).Area);
        %fprintf('Box width');
        %disp(boxw)        
        %# draw a rectangle
        rectangle('Position',[x-(w/2) y-(h/2) w h], 'LineWidth',2, 'EdgeColor','r');
    end
end
%show debug images
if(debugMode)
    figure(2);
    subplot(3,3,1);
    imshow(imgBlank);    
    
    subplot(3,3,2);
    imshow(imgObjects);
    
    subplot(3,3,3);
    imshow(imgDif);
    
    subplot(3,3,4)
    imshow(imgGray);
    
    subplot(3,3,5);
    imshow(binary_image);
    
    subplot(3,3,6);
    imshow( label2rgb(imgLbl) );
    
    subplot(3,3,7);
    imshow(filled)
end
end
