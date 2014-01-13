function BasicBlockMatching(leftI, rightI)
Dbasic = zeros(size(leftI), 'single');
disparityRange = 15;

% Selects (2*halfBlockSize+1)-by-(2*halfBlockSize+1) block.
halfBlockSize = 3;
blockSize = 2*halfBlockSize+1;

% Allocate space for all template matcher System objects.
tmats = cell(blockSize);

% Initialize progress bar
hWaitBar = waitbar(0, 'Performing basic block matching...');
nRowsLeft = size(leftI, 1);

% Scan over all rows.
for m=1:nRowsLeft
    % Set min/max row bounds for image block.
    minr = max(1, m-halfBlockSize);
    maxr = min(nRowsLeft, m+halfBlockSize);
    % Scan over all columns.
    for n=1:size(leftI,2)
        
        minc = max(1, n-halfBlockSize);
        maxc = min(size(leftI,2), n+halfBlockSize);
        
        % Compute disparity bounds.
        mind = max( -disparityRange, 1-minc );
        maxd = min( disparityRange, size(leftI,2)-maxc );
        
        % Construct template and region of interest.
        template = rightI(minr:maxr,minc:maxc);
        templateCenter = floor((size(template)+1)/2);
        
        roi = [minr+templateCenter(1)-2 ...
            minc+templateCenter(2)+mind-2 ...
            1 maxd-mind+1];
        
        % Lookup proper TemplateMatcher object; create if empty.
        if isempty(tmats{size(template,1),size(template,2)})
            tmats{size(template,1),size(template,2)} = ...
                vision.TemplateMatcher('ROIInputPort',true);
        end
        thisTemplateMatcher = tmats{size(template,1),size(template,2)};
        
        % Run TemplateMatcher object.
        loc = step(thisTemplateMatcher, leftI, template, roi);
        Dbasic(m,n) = loc(2) - roi(2) + mind;
    end
    waitbar(m/nRowsLeft, hWaitBar);
end

close(hWaitBar);
%%
% In the results below, the basic block matching does well, as the correct
% shape of the stereo scene is recovered. However, there are noisy patches
% and bad depth estimates everywhere, especially on the ceiling. These are
% caused when no strong image features appear inside of the 7-by-7-pixel
% windows being compared. Then the matching process is subject to
% noise since each pixel chooses its disparity independently of all the
% other pixels.
%
% For display purposes, we saturate the depth map to have only positive
% values. In general, slight angular misalignment of the stereo cameras
% used for image acquisition can allow both positive and negative
% disparities to appear validly in the depth map. In this case, however,
% the stereo cameras were near perfectly parallel, so the true disparities
% have only one sign. Thus this correction is valid.
figure(3), clf;
imshow(Dbasic,[]), axis image, colormap('jet'), colorbar;
caxis([0 disparityRange]);
title('Depth map from basic block matching');
end