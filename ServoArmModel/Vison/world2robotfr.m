%**************************************************************************
%
%**************************************************************************
function [in_robotfr]=world2robotfr(pos_vector)

%robot frame
 robotFrame = [1,  0,  0, 15;
               0, -1,  0, 0; 
               0,  0,  1, 0; 
               0,  0,  0, 1; 
              ];

%transform to robot ref frame
in_robotfr = robotFrame * pos_vector';

%transpose 
in_robotfr = in_robotfr';
end