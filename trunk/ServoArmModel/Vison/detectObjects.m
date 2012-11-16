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

%region of interest
%      x,    y   x    y
roi = [50, 0, 540, 480];

%imgBlank = imcrop(imgBlank, roi);
%imgObjects = imcrop(imgObjects, roi);

% calc difference

imgBlank = rgb2gray(imgBlank);

imgObjects = rgb2gray(imgObjects);

imgDif = imgBlank - imgObjects;

% convert it to gray scale image
%imgGray = imgDif; %rgb2gray(imgDif);

imgGray = wiener2(imgDif,[5,5]);


threshold = 65;
% create bit map: Above tresholod are 1's
binary_image = imgDif > threshold;

% fill empty holles
filled = imfill(binary_image, 'holes');

%remove blobs smaller then 100px
filled = bwareaopen(filled, 200);

%clean border
filled = imclearborder(filled);

%label objects (Connected componnents)
imgLbl = bwlabel(filled, 4);

%get blobs
blobMeasurements = regionprops(imgLbl, 'all');

imshow(imgObjects, 'parent', display);
minBlobArea = 100;

shrinkAreaFactor = 0.9;
for i=1:1:length(blobMeasurements)    
    %filter blobs
    if(blobMeasurements(i).Area > minBlobArea )       
        x = blobMeasurements(i).Centroid(1);
        y = blobMeasurements(i).Centroid(2);        
        %boxw =blobMeasurements(i).BoundingBox(2);
        %disp(blobMeasurements(i).BoundingBox);
        %get width and height of bounding box
        w = blobMeasurements(i).BoundingBox(3) * shrinkAreaFactor;
        h = blobMeasurements(i).BoundingBox(4) * shrinkAreaFactor;        
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
    imshow(filled);
    
    subplot(3,3,7);
    imshow( label2rgb(imgLbl) );
end
end
