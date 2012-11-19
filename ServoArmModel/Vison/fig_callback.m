%% callbacks
function fig_callback(src, evnt)
    [x, y] = ginput(1);
    w = cam2world(x,y);
    fprintf('wx:%6.4f wy:%6.4f wz:%6.4f\n', w(1), w(2), w(3));
end