function [ang] = minRot(angle)
    i = 1;   
    while(abs(angle)>=2*pi)
        fprintf('angle: %6.4f\n',radtodeg(angle));
        angle = angle - (sign(angle)*2*pi);
        i = i+1;
    end
    ang= angle;
end