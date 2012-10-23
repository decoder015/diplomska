function [transformation] = rothz(theta)
transformation = rotz(theta, 'deg');
%make it homogenious 
transformation(1,4) = 0;
transformation(2,4) = 0;
transformation(3,4) = 0;
transformation(4,4) = 1;

transformation(4,1) = 0;
transformation(4,2) = 0;
transformation(4,3) = 0;
end