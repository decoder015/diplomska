%% Step 3. Sub-pixel Estimation
% The disparity estimates returned by block matching are all
% integer-valued, so the above depth map exhibits contouring effects where
% there are no smooth transitions between regions of different disparity.
% This can be ameliorated by incorporating sub-pixel computation into the
% matching metric. Previously we only took the location of the minimum cost
% as the disparity, but now we take into consideration the minimum cost and
% the two neighboring cost values. We fit a parabola to these three values,
% and analytically solve for the minimum to get the sub-pixel correction.
function SubPixelEstimation(leftI, rightI)
disparityRange = 15;

% Selects (2*halfBlockSize+1)-by-(2*halfBlockSize+1) block.
halfBlockSize = 3;
blockSize = 2*halfBlockSize+1;

% Initialize progress bar
hWaitBar = waitbar(0, 'Performing basic block matching...');
nRowsLeft = size(leftI, 1);

DbasicSubpixel= zeros(size(leftI), 'single');
tmats = cell(2*halfBlockSize+1);

hWaitBar=waitbar(0,'Performing sub-pixel estimation...');
for m=1:nRowsLeft
    % Set min/max row bounds for image block.
    minr = max(1,m-halfBlockSize);
    maxr = min(nRowsLeft,m+halfBlockSize);
    % Scan over all columns.
    for n=1:size(leftI,2)
        minc = max(1,n-halfBlockSize);
        maxc = min(size(leftI,2),n+halfBlockSize);
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
                vision.TemplateMatcher('ROIInputPort',true,...
                'BestMatchNeighborhoodOutputPort',true);
        end
        thisTemplateMatcher = tmats{size(template,1),size(template,2)};
        
        % Run TemplateMatcher object.
        [loc,a2] = step(thisTemplateMatcher, leftI, template, roi);
        ix = single(loc(2) - roi(2) + mind);
        
        % Subpixel refinement of index.
        DbasicSubpixel(m,n) = ix - 0.5 * (a2(2,3) - a2(2,1)) ...
            / (a2(2,1) - 2*a2(2,2) + a2(2,3));
    end
    waitbar(m/nRowsLeft,hWaitBar);
end

close(hWaitBar);
%%
% Re-running basic block matching, we achieve the result below where the
% contouring effects are mostly removed and the disparity estimates are
% correctly refined. This is especially evident along the walls.

figure(1), clf;
imshow(DbasicSubpixel,[]), axis image, colormap('jet'), colorbar;
caxis([0 disparityRange]);
title('Basic block matching with sub-pixel accuracy');

end