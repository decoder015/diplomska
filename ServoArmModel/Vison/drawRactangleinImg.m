function [imageOut] = drawRactangleinImg(image, text, pos_x, pos_y, width, height)

rect = vision.ShapeInserter;

rect.BorderColor = 'Custom';
rect.CustomBorderColor = uint8([255, 0 ,0]);

imageOut = step(rect, image, int32([pos_y - height/2, pos_x - width/2, height, width]));
for i=1:1:5
    imageOut = step(rect, imageOut, int32([pos_y-(height+i)/2, pos_x-(width+i)/2,...
                                           height + i,        width + i]));
end

t_x = pos_x + width/2;
t_y = pos_y - (height/2) -40;
imageOut = writeTextInImg(imageOut, text, t_x, t_y );

end