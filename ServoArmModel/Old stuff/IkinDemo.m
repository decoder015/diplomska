%%
%-------------------------------------------------------
%                     IkinDemo
%-------------------------------------------------------
%%
clc;
close all;
clear all;
%%
%           [theta, d,    a,   alpha]
L(1) = Link([ 0     0.2   0.0   pi/2],  'standard');
L(2) = Link([ 0     0     0.8   0],     'standard');
L(3) = Link([ 0     0     0.8   0],     'standard');
L(4) = Link([ 0     0.0   0    pi/2],   'standard');
L(5) = Link([ 0     0.3   0    pi/2],   'standard');
L(6) = Link([ 0     0.0   0.0  0],      'standard');
sixlink = SerialLink(L, 'name', 'Six Link')
%%

Target = [
          1,    0,  0,  1;
          0,    1,  0,  1.0;
          0,    0,  1,  1;
          0,    0,  0,  1
          ];
sol=sixlink.ikine(Target, zeros(1,6), [1 1 1 1 1 1]);
fprintf('Joint angles:\n');
disp(radtodeg(sol));
figure(5);
sixlink.plot(sol);
%twolink.ikine(TCP, zeros(1,5), [1 1 1 1 1 0]);
%twolink.fkine(TCP)Qsol
%%
demo = false;
if(demo)
    for i=0:0.01:pi/4
        twolink.plot([0,0,0,i,0,0]);
        pause(0.05)
    end
    
    
    for j=0:0.01:pi
        twolink.plot([0,0,0,i,j,0]);
        pause(0.05)
    end
end