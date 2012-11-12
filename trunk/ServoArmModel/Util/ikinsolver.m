function [solver] = ikinsolver()
%% Robot configuration
%           [theta, d,      a,   alpha]
L(1) = Link([ 0,     0.6,   0.0,   pi/2],  'standard');
L(2) = Link([ 0,     0.0,   1.0,   pi],     'standard');
L(3) = Link([ 0,     0.0,   1.0,   0],     'standard');
L(4) = Link([ 0,     0.0,   0.95,  -pi/2],  'standard'); % gripper
L(5) = Link([ 0,     0.0,   0.0,   pi/2],  'standard');
L(6) = Link([ 0,     0.0,   0.0,   0],  'standard');
%L(7) = Link([ 0,     0.0,   0.0,   0],     'standard');
sixlink = SerialLink(L, 'name', 'Six Link');
%set joint limits, does not work!!!
JointLimits = [-45, 45; -45, 45; -45, 45; -45, 45; -180, 180; -180, 180;];
%sixlink.qlim = degtorad(JointLimits);

%offset along Z axe and 
%rotation along X axe by 180
 TCPF =  [
            1,  0,  0, 0;
            0,  0,  -1,  0.350;
            0,  1,  0, 0;
            0,  0,  0, 1
          ];
      
sixlink.tool = TCPF;           
% return kinmeatic link
solver = sixlink;
end