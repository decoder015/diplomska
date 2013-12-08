function SFunctGUIJointJog(block)
% Level-2 MATLAB file S-Function for times two demo.
%   Copyright 1990-2009 The MathWorks, Inc.
%   $Revision: 1.1.6.2 $ 

  setup(block);
  
%endfunction

function setup(block)
  
  %% Register number of input and output ports
  block.NumInputPorts  = 0;
  block.NumOutputPorts = 4;

  %% Setup functional port properties to dynamically
  %% inherited.
  %block.SetPreCompInpPortInfoToDynamic;
  %block.SetPreCompOutPortInfoToDynamic;
  %% Setup functional port to default
  block.SetPreCompPortInfoToDefaults;

  %% Setup output port
  block.OutputPort(1).Dimensions = 1;
  
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

%  handle_JointJog = UIJointJog;
  %get(handle_JointJog,'m_tboJoint0Val');
  
  tmpJ0 = evalin('base', 'joint0Val');
  tmpJ1 = evalin('base', 'joint1Val');
  tmpJ2 = evalin('base', 'joint2Val');
  tmpJ3 = evalin('base', 'joint3Val');
  
  block.OutputPort(1).Data = tmpJ0; %*block.InputPort(1).Data;
  block.OutputPort(2).Data = tmpJ1;
  block.OutputPort(3).Data = tmpJ2;
  block.OutputPort(4).Data = tmpJ3;
  
%endfunction