%% Step 6. Combined Pyramiding and Dynamic Programming
% Finally we merge the above techniques and run dynamic programming along
% with image pyramiding, where the dynamic programming is run on the
% disparity estimates output by every pyramid level. The results compare
% well with the highest-quality results we have obtained so far, and are
% still achieved at a reduced computational burden versus basic block
% matching.
%
% It is also possible to use sub-pixel methods with dynamic programming,
% and we show the results of all three techniques in the second image. As
% before, subpixel refinement reduces contouring effects and clearly improves
% accuracy. The previous code has been bundled into
% <matlab:edit(fullfile(matlabroot,'toolbox','vipblks','vipdemos','vipstereo_blockmatch_combined.m')) |vipstereo_blockmatch_combined.m|>,
% which exposes all of the options previously presented as parameter-value
% pairs.
function CombinedPyramidingAndDynamicProgramming(leftI,rightI)
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
end