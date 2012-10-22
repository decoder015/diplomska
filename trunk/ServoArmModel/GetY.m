function [vector] = GetY(frame)
    vector(1,1) = frame(1,2);
    vector(1,2) = frame(2,2);
    vector(1,3) = frame(3,2);
    vector(1,4) = frame(4,2);
end
