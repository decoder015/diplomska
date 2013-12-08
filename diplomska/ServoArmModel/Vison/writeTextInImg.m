%**************************************************************************
%           Draws text on image for given postion in pixels
%**************************************************************************
function [imgWithText]= writeTextInImg(image, text, location_x, location_y)
    
    % get object for drawing text on image
    htxtins = vision.TextInserter(text);
    
    %set color [red, green, blue]
    htxtins.Color = [255, 0, 0];
    
    %set font size
    htxtins.FontSize = 14;
    
    %set location on text [x y]
    htxtins.Location = [location_y location_x];
    
    % set text
    imgWithText = step(htxtins, image);
end