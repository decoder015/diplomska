function SFunctJointAnglesToVRRotations(block)
% Level-2 MATLAB file S-Function for times two demo.
%   Copyright 1990-2009 The MathWorks, Inc.
%   $Revision: 1.1.6.2 $ 

  setup(block);  
%endfunction

function setup(block)
  
  %% Register number of input and output ports
  block.NumInputPorts  = 4;
  block.NumOutputPorts = 8;

  %% Setup functional port properties to dynamically inherited.
  %% Setup functional port to default
  block.SetPreCompPortInfoToDefaults;

  %% Setup output port
  
  % joint 0
  block.OutputPort(1).Dimensions = 4; %rotation vector in axes angles representation
  block.OutputPort(2).Dimensions = 3; %translation x, y, z
  % joint 1
  block.OutputPort(3).Dimensions = 4; %rotation vector in axes angles representation
  block.OutputPort(4).Dimensions = 3; %translation x, y, z
  % joint 2
  block.OutputPort(5).Dimensions = 4; %rotation vector in axes angles representation
  block.OutputPort(6).Dimensions = 3; %translation x, y, z
  % joint 3
  block.OutputPort(7).Dimensions = 4; %rotation vector in axes angles representation
  block.OutputPort(8).Dimensions = 3; %translation x, y, z
  
  %% Set block sample time to inherited
  block.SampleTimes = [0 0];
  
   %% Register parameters
  block.NumDialogPrms = 0;
  
  %% Set the block simStateCompliance to default (i.e., same as a built-in block)
  block.SimStateCompliance = 'DefaultSimState';

  %% Run accelerator on TLC
  block.SetAccelRunOnTLC(true);
  
  %% Register methods
  block.RegBlockMethod('Outputs',                 @Output);    
  
%endfunction
function Output(block)
  
  % get inputs
  joint0Val = block.InputPort(1).Data;
  joint1Val = block.InputPort(2).Data;
  joint2Val = block.InputPort(3).Data;
  joint3Val = block.InputPort(4).Data;
  
  % get VR transformations 
  [vr_foreArmRotation, vr_foreArmTranslation,...
   vr_armRotation,     vr_armTranslation,...
   vr_gripperRotation, vr_gripperTranslation] = JointValuesToVRTranformations(joint0Val, joint1Val, joint2Val, joint3Val, false);

  
  % set output
  block.OutputPort(1).Data = vr_foreArmRotation;
  block.OutputPort(2).Data = vr_foreArmTranslation;
  block.OutputPort(3).Data = vr_armRotation; 
  block.OutputPort(4).Data = vr_armTranslation;
  
  block.OutputPort(5).Data = vr_gripperRotation; 
  block.OutputPort(6).Data = vr_gripperTranslation;
  block.OutputPort(7).Data = [0,0,0,0];
  block.OutputPort(8).Data = [0,0,0];
%endfunction