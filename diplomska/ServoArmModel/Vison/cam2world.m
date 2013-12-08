%**************************************************************************
%   Description:
%   For given camera matrix obtaind form camera calibration 
%   the function tranosforms point in picture (x, y) to world
%   assuming that all poits are no Z=1 plane
%
%   Input parameters:
%   (x,y) coordinats in picture
%   
%   Output parameters:
%   (x, y, 0) cordinates in world frame
%
%   Camera matrix:
%   KK = [ fc(1) alpha_c *fc(1)  cc(1);
%           0      fc(2)         cc(2);
%           0      0             1;
%         ]
%**************************************************************************
function [world]=cam2world(x, y)
%% Camera matrix
% Focal Length:          fc = [ 1384.80667   1382.12856 ] ± [ 58.63048   59.74003 ]
% Principal point:       cc = [ 376.73942   252.51461 ] ± [ 54.25429   43.30927 ]
% Skew:             alpha_c = [ 0.00000 ] ± [ 0.00000  ]   => angle of pixel axes = 90.00000 ± 0.00000 degrees
% Distortion:            kc = [ -0.59924   6.94918   -0.00916   0.01177  0.00000 ] ± [ 0.37260   8.78685   0.00918   0.00695  0.00000 ]
% Pixel error:          err = [ 0.80895   1.04779 ]

kk = [ 1384.80667, 0*1384.80667,  376.73942;
        0,          1382.12856,   252.51461;
        0,          0,            1;  
     ];
%% Camera resolution
resx = 640;
resy = 480;
%% Get ray projections
x = floor(x);
y = floor(y);

% get projection
P_camera = inv(kk) * [x, y, 1]';

% calculate camera frame offset
camCenterOffset = inv(kk) * [resx/2, resy/2, 1]';

%apply offset pict_x/2 pict_y/ is at (0,0) on image
P_camera = P_camera - camCenterOffset;

%ratio betwen camera and world
% cam frame cord at res_x res_y is 0,0 alog x by 3 cm is 0.0477
% wx * L = 3cm L = 3/wx
lamda_X  = 3/0.0477;
lamda_Y  = 3/0.033;

%apply ratio 
P_camera(1) = P_camera(1) * lamda_X;
P_camera(2) = P_camera(2) * lamda_Y;

% retrun
world = P_camera;
world(3) = 0;

%transpose
world = world';
end