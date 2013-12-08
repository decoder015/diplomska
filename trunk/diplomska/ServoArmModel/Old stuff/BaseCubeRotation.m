disp(baseCube.translation);% = [-.5, -.51, 0];
disp(baseCube.rotation);
for i=0:0.1:2*pi
    pause(0.1);
    baseCube.rotation = [0,1,0,i];
end
