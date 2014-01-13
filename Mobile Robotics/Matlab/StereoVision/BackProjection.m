%% Step 7. Backprojection
% With a stereo depth map and knowledge of the intrinsic parameters of the
% camera, it is possible to backproject image pixels into 3D points [1,2].
% One way to compute the camera intrinsics is with the MATLAB Camera
% Calibration Toolbox [6] from the California Institute of Technology(R).
% Such a tool will produce an intrinsics matrix, K, of the form:
%
%  K = [focal_length_x          skew_x  camera_center_x;
%                    0  focal_length_y  camera_center_y;
%                    0               0                1];
%
% This relates 3D world coordinates to homogenized camera coordinates via:
%
% $$[x_{camera} \, y_{camera} \, 1]^T = K \cdot [x_{world} \, y_{world} \, z_{world}]^T$$
%
% With the intrinsics matrix, we can backproject each image pixel into a 3D
% ray that describes all the world points that could have been projected
% onto that pixel on the image. This leaves unknown the distance of that
% point to the camera. This is provided by the disparity measurements of
% the stereo depth map as:
%
% $$z_{world} = focal\_length \cdot \frac{1 + stereo\_baseline}{disparity}$$
%
% Note that unitless pixel disparities cannot be used directly in this
% equation. Also, if the stereo baseline (the distance between the two
% cameras) is not well-known, it introduces more unknowns. Thus we
% transform this equation into the general form:
%
% $$z_{world} = a + \frac{b}{disparity}$$
%
% We solve for the two unknowns via least squares by collecting
% a few corresponding depth and disparity values from the scene and using
% them as tie points. The full technique is demonstrated below.

function BackProjection(leftI, rightI, leftI3chan, rightI3chan)
disparityRange = 15;

DpyramidDynamic = vipstereo_blockmatch_combined(leftI,rightI, ...
    'NumPyramids',3, 'DisparityRange',4, 'DynamicProgramming',true, ...
    'Waitbar', true, ...
    'WaitbarTitle', 'Performing combined pyramid and dynamic programming');

figure(3), clf;
imshow(DpyramidDynamic,[]), axis('image'), colorbar, colormap jet;
caxis([0 disparityRange]);
title('3-level pyramid with dynamic programming');

DdynamicSubpixel = vipstereo_blockmatch_combined(leftI,rightI, ...
    'NumPyramids',3, 'DisparityRange',4, 'DynamicProgramming',true, ...
    'Subpixel', true, ...
    'Waitbar', true, ...
    'WaitbarTitle', ['Performing combined pyramid and dynamic ',...
    'programming with sub-pixel estimation']);

figure(4), clf;
imshow(DdynamicSubpixel,[]), axis image, colormap('jet'), colorbar;
caxis([0 disparityRange]);
title('Pyramid with dynamic programming and sub-pixel accuracy');


% Camera intrinsics matrix
K = [409.4433         0  204.1225
    0  416.0865  146.4133
    0         0    1.0000];

% Create a sub-sampled grid for backprojection.
dec = 2;
[X,Y] = meshgrid(1:dec:size(leftI,2),1:dec:size(leftI,1));
P = K\[X(:)'; Y(:)'; ones(1,numel(X), 'single')];
Disp = max(0,DdynamicSubpixel(1:dec:size(leftI,1),1:dec:size(leftI,2)));
hMedF = vision.MedianFilter('NeighborhoodSize',[5 5]);
Disp = step(hMedF,Disp); % Median filter to smooth out noise.


% Derive conversion from disparity to depth with tie points:
knownDs = [15   9   2]'; % Disparity values in pixels
knownZs = [4  4.5 6.8]';

% World z values in meters based on scene measurements.
ab = [1./knownDs ones(size(knownDs), 'single')] \ knownZs; % least squares

% Convert disparity to z (distance from camera)
ZZ = ab(1)./Disp(:)' + ab(2);

% Threshold to [0,8] meters.
ZZdisp = min(8,max(0, ZZ ));
Pd = bsxfun(@times,P,ZZ);

% Remove near points
bad = Pd(3,:)>8 | Pd(3,:)<3;
Pd = Pd(:,~bad);

%%
% In the reprojection, the walls, ceiling, and floor all appear mutually
% orthogonal, and the scene is well reconstructed. Since camera calibration
% also gives intrinsics with units, we can assign units to the
% backprojected points. The dimensions of the plot are given in meters, and
% one can verify that the sizes of objects and the scene appear correct.

% Collect quantized colors for point display
Colors = rightI3chan(1:dec:size(rightI,1),1:dec:size(rightI,2),:);
Colors = reshape(Colors,[size(Colors,1)*size(Colors,2) size(Colors,3)]);
Colors = Colors(~bad,:);
cfac = 20;
C8 = round(cfac*Colors);
[U,I,J] = unique(C8,'rows');
C8 = C8/cfac;

figure(2), clf, hold on, axis equal;
for i=1:size(U,1)
    plot3(-Pd(1,J==i),-Pd(3,J==i),-Pd(2,J==i),'.','Color',C8(I(i),:));
end
view(161,14), grid on;
xlabel('x (meters)'), ylabel('z (meters)'), zlabel('y (meters)');
end