function SFunctToRobot(block)
% Level-2 MATLAB file S-Function for times two demo.
  setup(block);
  
%endfunction

function setup(block)
  
  %% Register number of input and output ports
  block.NumInputPorts  = 5;
  block.NumOutputPorts = 0;

  %% Setup functional port properties to dynamically
  %% inherited.
  %block.SetPreCompInpPortInfoToDynamic;
  %block.SetPreCompOutPortInfoToDynamic;
  %% Setup functional port to default
  block.SetPreCompPortInfoToDefaults;

 % block.InputPort(5).Complexity  = 2;
  %% Setup output port
  
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
  
  
  tmp_joint0Val = block.InputPort(1).Data;
  tmp_joint1Val = block.InputPort(2).Data;
  tmp_joint2Val = block.InputPort(3).Data;
  tmp_joint3Val = block.InputPort(4).Data;
  
  sendCommand = block.InputPort(5).Data;
  %fprintf('Servo 0: %d\n', tmp_joint0Val);
  %fprintf('Servo 1: %d\n', tmp_joint1Val);
  %fprintf('Servo 2: %d\n', tmp_joint2Val);
  %fprintf('Servo 3: %d\n', tmp_joint3Val);
  
  %get robot com port status
  robotOnline = evalin('base', 'robotOnline');
  if(robotOnline)
      serialPort = evalin('base', 'serialPort');
      %send commands to servo
      %if(sendCommand)
      RotateServo(serialPort, 0, tmp_joint0Val);
      RotateServo(serialPort, 1, tmp_joint1Val);
      RotateServo(serialPort, 2, tmp_joint2Val);
      RotateServo(serialPort, 3, tmp_joint3Val);
      %end
  end
%endfunction