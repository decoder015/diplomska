function varargout = UIJointJog(varargin)
% UIJOINTJOG MATLAB code for UIJointJog.fig
%      UIJOINTJOG, by itself, creates a new UIJOINTJOG or raises the existing
%      singleton*.
%
%      H = UIJOINTJOG returns the handle to a new UIJOINTJOG or the handle to
%      the existing singleton*.
%
%      UIJOINTJOG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UIJOINTJOG.M with the given input arguments.
%
%      UIJOINTJOG('Property','Value',...) creates a new UIJOINTJOG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UIJointJog_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UIJointJog_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UIJointJog

% Last Modified by GUIDE v2.5 09-Nov-2012 10:10:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UIJointJog_OpeningFcn, ...
                   'gui_OutputFcn',  @UIJointJog_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before UIJointJog is made visible.
function UIJointJog_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UIJointJog (see VARARGIN)

% Choose default command line output for UIJointJog
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UIJointJog wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UIJointJog_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function m_sliderJoint2_Callback(hObject, eventdata, handles)
% hObject    handle to m_sliderJoint2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get vlue form slider
global joint2Val;
joint2Val = get(hObject,'Value');

% set value to tboJoint0Val text edit control using handles!!!
set(handles.m_tboJoint2Val, 'String', joint2Val);

toRobot = get(handles.m_cboToRobot, 'Value');
%fprintf ('to robot: %d\n', toRobot);
if(toRobot)
        RotateServo('COM13', 2, joint2Val);
end
%*********************************END*********************************

% --- Executes during object creation, after setting all properties.
function m_sliderJoint2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_sliderJoint2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function m_sliderJoint1_Callback(hObject, eventdata, handles)
% hObject    handle to m_sliderJoint1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get vlue form slider
global joint1Val;
joint1Val = get(hObject,'Value');

% set value to tboJoint0Val text edit control using handles!!!
set(handles.m_tboJoint1Val, 'String', joint1Val);

toRobot = get(handles.m_cboToRobot, 'Value');
%fprintf ('to robot: %d\n', toRobot);
if(toRobot)
        RotateServo('COM13', 1, joint1Val);
end
%*********************************END*********************************


% --- Executes during object creation, after setting all properties.
function m_sliderJoint1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_sliderJoint1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function m_sliderJoint0_Callback(hObject, eventdata, handles)
% hObject    handle to m_sliderJoint0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get vlue form slider
global joint0Val;
joint0Val = get(hObject,'Value');

% set value to tboJoint0Val text edit control using handles!!!
set(handles.m_tboJoint0Val, 'String', joint0Val);

toRobot = get(handles.m_cboToRobot, 'Value');
%sfprintf ('to robot: %d\n', toRobot);
if(toRobot)
        RotateServo('COM13', 0, joint0Val);
end
%*********************************END*********************************

% --- Executes during object creation, after setting all properties.
function m_sliderJoint0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_sliderJoint0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function m_sliderJoint3_Callback(hObject, eventdata, handles)
% hObject    handle to m_sliderJoint3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get vlue form slider
global joint3Val;
joint3Val = get(hObject,'Value');

% set value to tboJoint0Val text edit control using handles!!!
set(handles.m_tboJoint3Val, 'String', joint3Val);

toRobot = get(handles.m_cboToRobot, 'Value');
%fprintf ('to robot: %d\n', toRobot);
if(toRobot)
        RotateServo('COM13', 3, joint3Val);
end

%*********************************END*********************************


% --- Executes during object creation, after setting all properties.
function m_sliderJoint3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_sliderJoint3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function m_tboJoint0Val_Callback(hObject, eventdata, handles)
% hObject    handle to m_tboJoint0Val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get vlue form slider
global joint0Val;
joint0Val = str2double(get(hObject,'String'));

% set limit to +/-90 deg
if(joint0Val > 45 )
    joint0Val = 45;
    set(handles.m_tboJoint0Val, 'String', joint0Val);
end

if(joint0Val < -45)
    joint0Val = -45;
    set(handles.m_tboJoint0Val, 'String', joint0Val);
end

% set value to tboJoint0Val text edit control using handles!!!
set(handles.m_sliderJoint0, 'Value', joint0Val);

toRobot = get(handles.m_cboToRobot, 'Value');
%fprintf ('to robot: %d\n', toRobot);
if(toRobot)
        RotateServo('COM13', 0, joint0Val);
end
%*********************************END*********************************

% --- Executes during object creation, after setting all properties.
function m_tboJoint0Val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_tboJoint0Val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m_tboJoint1Val_Callback(hObject, eventdata, handles)
% hObject    handle to m_tboJoint1Val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get vlue form slider
global joint1Val;
joint1Val = str2double(get(hObject,'String'));

% set limit to +/-90 deg
if(joint1Val > 45 )
    joint1Val = 45;
    set(handles.m_tboJoint1Val, 'String', joint1Val);
end

if(joint1Val < -45)
    joint1Val = -45;
    set(handles.m_tboJoint1Val, 'String', joint1Val);
end

% set value to tboJoint0Val text edit control using handles!!!
set(handles.m_sliderJoint1, 'Value', joint1Val);

toRobot = get(handles.m_cboToRobot, 'Value');
%fprintf ('to robot: %d\n', toRobot);
if(toRobot)
        RotateServo('COM13', 1, joint1Val);
end

% --- Executes during object creation, after setting all properties.
function m_tboJoint1Val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_tboJoint1Val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m_tboJoint2Val_Callback(hObject, eventdata, handles)
% hObject    handle to m_tboJoint2Val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get vlue form slider
global joint2Val;
joint2Val = str2double(get(hObject,'String'));

% set limit to +/-90 deg
if(joint2Val > 45 )
    joint2Val = 45;
    set(handles.m_tboJoint2Val, 'String', joint2Val);
end

if(joint2Val < -45)
    joint2Val = -45;
    set(handles.m_tboJoint2Val, 'String', joint2Val);
end

% set value to tboJoint0Val text edit control using handles!!!
set(handles.m_sliderJoint2, 'Value', joint2Val);

toRobot = get(handles.m_cboToRobot, 'Value');
%fprintf ('to robot: %d\n', toRobot);
if(toRobot)
        RotateServo('COM13', 2, joint2Val);
end

% --- Executes during object creation, after setting all properties.
function m_tboJoint2Val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_tboJoint2Val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m_tboJoint3Val_Callback(hObject, eventdata, handles)
% hObject    handle to m_tboJoint3Val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get vlue form slider
global joint3Val;
joint3Val = str2double(get(hObject,'String'));

% set limit to +/-90 deg
if(joint3Val > 45 )
    joint3Val = 45;
    set(handles.m_tboJoint0Val, 'String', joint3Val);
end

if(joint3Val < -45)
    joint3Val = -45;
    set(handles.m_tboJoint0Val, 'String', joint3Val);
end

% set value to tboJoint0Val text edit control using handles!!!
set(handles.m_sliderJoint3, 'Value', joint3Val);

toRobot = get(handles.m_cboToRobot, 'Value');
%fprintf ('to robot: %d\n', toRobot);
if(toRobot)
        RotateServo('COM13', 3, joint3Val);
end

% --- Executes during object creation, after setting all properties.
function m_tboJoint3Val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_tboJoint3Val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in m_cboToRobot.
function m_cboToRobot_Callback(hObject, eventdata, handles)
% hObject    handle to m_cboToRobot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of m_cboToRobot


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%kinamatic

%%
%-------------------------------------------------------
%                     IkinDemo
%-------------------------------------------------------
%% Robot configuration
%           [theta, d,    a,   alpha]
L(1) = Link([ 0     0.2   0.0   pi/2],  'standard');
L(2) = Link([ 0     0     0.8   0],     'standard');
L(3) = Link([ 0     0     0.8   0],     'standard');
L(4) = Link([ 0     0.0   0    pi/2],   'standard');
L(5) = Link([ 0     0.3   0    pi/2],   'standard');
L(6) = Link([ 0     0.0   0.0  0],      'standard');
sixlink = SerialLink(L, 'name', 'Six Link');
%%

%get RX RY RZ from GUI
rx = str2double( get(handles.m_tboRx, 'String') );
ry = str2double( get(handles.m_tboRy, 'String') );
rz = str2double( get(handles.m_tboRz, 'String') );

%get X Y Z from GUI
x = str2double( get(handles.m_tboX, 'String') );
y = str2double( get(handles.m_tboY, 'String') );
z = str2double( get(handles.m_tboZ, 'String') );

%Set taget frame
target = RPY2TR(rx,ry,rz);
target(1,4) = x;
target(2,4) = y;
target(3,4) = z;
sol=sixlink.ikine(target, zeros(1,6), [1 1 1 1 1 1]);
%fprintf('Joint angles:\n');
%disp(radtodeg(sol));
sixlink.plot(sol);

% Create frequency plot in proper axes
%x=1:1:10;
%y=ones(1,10);
%z=1:1:10;
%plot(handles.kinamatic,x, y);
%h1=sixlink.plot(sol);
%====================END=============================


function m_tboZ_Callback(hObject, eventdata, handles)
% hObject    handle to m_tboZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m_tboZ as text
%        str2double(get(hObject,'String')) returns contents of m_tboZ as a double


% --- Executes during object creation, after setting all properties.
function m_tboZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_tboZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m_tboY_Callback(hObject, eventdata, handles)
% hObject    handle to m_tboY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m_tboY as text
%        str2double(get(hObject,'String')) returns contents of m_tboY as a double


% --- Executes during object creation, after setting all properties.
function m_tboY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_tboY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m_tboX_Callback(hObject, eventdata, handles)
% hObject    handle to m_tboX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m_tboX as text
%        str2double(get(hObject,'String')) returns contents of m_tboX as a double


% --- Executes during object creation, after setting all properties.
function m_tboX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_tboX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m_tboRz_Callback(hObject, eventdata, handles)
% hObject    handle to m_tboRz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m_tboRz as text
%        str2double(get(hObject,'String')) returns contents of m_tboRz as a double


% --- Executes during object creation, after setting all properties.
function m_tboRz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_tboRz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m_tboRy_Callback(hObject, eventdata, handles)
% hObject    handle to m_tboRy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m_tboRy as text
%        str2double(get(hObject,'String')) returns contents of m_tboRy as a double


% --- Executes during object creation, after setting all properties.
function m_tboRy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_tboRy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m_tboRx_Callback(hObject, eventdata, handles)
% hObject    handle to m_tboRx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m_tboRx as text
%        str2double(get(hObject,'String')) returns contents of m_tboRx as a double


% --- Executes during object creation, after setting all properties.
function m_tboRx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_tboRx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
