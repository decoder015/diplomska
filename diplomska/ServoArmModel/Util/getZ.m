function [vector]=getZ(frame)
vector(1,1) = frame(1,3);
vector(1,2) = frame(2,3);
vector(1,3) = frame(3,3);
vector(1,4) = frame(4,3);
end