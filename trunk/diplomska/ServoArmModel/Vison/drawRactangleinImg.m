%**************************************************************************
%   Draws bounding box around objects for given positon
%**************************************************************************
function [imageOut] = drawRactangleinImg(image, text, pos_x, pos_y, width, height)

% object for drawing rectangles
rect = vision.ShapeInserter;

% set ractangle border cloro
rect.BorderColor = 'Custom';
rect.CustomBorderColor = uint8([255, 0 ,0]);

% draw rectangle on image
imageOut = step(rect, image, int32([pos_y - height/2, pos_x - width/2, height, width]));

%draw 5 rectangles to increase rectnagle thickness
for i=1:1:5
    imageOut = step(rect, imageOut, int32([pos_y-(height+i)/2, pos_x-(width+i)/2,...
                                           height + i,        width + i]));
end

% set text postion above rectangle
t_x = pos_x - width/2;
t_y = pos_y - height/2 - 20;

% draw text above rectangle on image
imageOut = writeTextInImg(imageOut, text, t_x, t_y );
end