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

% Last Modified by GUIDE v2.5 11-Nov-2012 12:20:23

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

global joint0Val;
global joint1Val;
global joint2Val;
global joint3Val;
global sixlink;

sixlink = ikinsolver();

%get vlue form slider
joint2Val = get(hObject,'Value');

% set value to tboJoint0Val text edit control using handles!!!
set(handles.m_tboJoint2Val, 'String', joint2Val);

%plot 
jointsInRad= joints2solver(joint0Val, joint1Val, joint2Val, joint3Val);
sixlink.plot(jointsInRad);

%get TCP
tcp = sixlink.fkine(jointsInRad);
[strPos, strOrnt]=tcp2str(tcp);
set(handles.m_lblPosition,    'String', strPos);
set(handles.m_lblOrientation, 'String', strOrnt);
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

global joint0Val;
global joint1Val;
global joint2Val;
global joint3Val;
global sixlink;

clear sixlink;
sixlink = ikinsolver();

%get vlue form slider
joint1Val = get(hObject,'Value');

% set value to tboJoint0Val text edit control using handles!!!
set(handles.m_tboJoint1Val, 'String', joint1Val);

%plot 
jointsInRad= joints2solver(joint0Val, joint1Val, joint2Val, joint3Val);
sixlink.plot(jointsInRad);

%get TCP
tcp = sixlink.fkine(jointsInRad);
[strPos, strOrnt]=tcp2str(tcp);
set(handles.m_lblPosition,    'String', strPos);
set(handles.m_lblOrientation, 'String', strOrnt);
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

global joint0Val;
global joint1Val;
global joint2Val;
global joint3Val;
global sixlink;

clear sixlink;
sixlink = ikinsolver();

%get vlue form slider
joint0Val = get(hObject,'Value');

% set value to tboJoint0Val text edit control using handles!!!
set(handles.m_tboJoint0Val, 'String', joint0Val);

%plot 
jointsInRad= joints2solver(joint0Val, joint1Val, joint2Val, joint3Val);
sixlink.plot(jointsInRad);

%get TCP
tcp = sixlink.fkine(jointsInRad);
[strPos, strOrnt]=tcp2str(tcp);
set(handles.m_lblPosition,    'String', strPos);
set(handles.m_lblOrientation, 'String', strOrnt);
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

global joint0Val;
global joint1Val;
global joint2Val;
global joint3Val;
global sixlink;

sixlink = ikinsolver();

%get vlue form slider
joint3Val = get(hObject,'Value');

% set value to tboJoint0Val text edit control using handles!!!
set(handles.m_tboJoint3Val, 'String', joint3Val);

jointsInRad= joints2solver(joint0Val, joint1Val, joint2Val, joint3Val);
figure(1);
sixlink.plot(jointsInRad);

%get TCP
tcp = sixlink.fkine(jointsInRad);
[strPos, strOrnt]=tcp2str(tcp);
set(handles.m_lblPosition,    'String', strPos);
set(handles.m_lblOrientation, 'String', strOrnt);
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
%%
%-------------------------------------------------------
%                     IkinDemo
%-------------------------------------------------------
%% Robot configuration
%           [theta, d,      a,   alpha]
%L(1) = Link([ 0,     0.6,   0.0,   pi/2],  'standard');
%L(2) = Link([ 0,     0.0,   1.0,   0],     'standard');
%L(3) = Link([ 0,     0.0,   1.0,   0],    'standard');
%L(4) = Link([ 0,     0.0,   0.0,   pi/2],  'standard');
%L(5) = Link([ 0,     0.9,   0.0,   pi/2],   'standard');
%L(6) = Link([ 0,     0.0,   0.0,   pi/2],    'standard');
%L(7) = Link([ 0,     0.0,   0.0,   0],    'standard');
%sixlink = SerialLink(L, 'name', 'Six Link');
%set joint limits
%JointLimits = [-45, 45; -45, 45; -45, 45; -45, 45; -90, 90; -90, 90; -90, 90];
%sixlink.qlim = degtorad(JointLimits);

%%


%get RX RY RZ from GUI
rx = str2double( get(handles.m_tboRx, 'String') );
ry = str2double( get(handles.m_tboRy, 'String') );
rz = str2double( get(handles.m_tboRz, 'String') );
rx=degtorad(rx);
ry=degtorad(ry);
rz=degtorad(rz);

%get X Y Z from GUI
x = str2double( get(handles.m_tboX, 'String') );
y = str2double( get(handles.m_tboY, 'String') );
z = str2double( get(handles.m_tboZ, 'String') );

%Set taget frame
target = RPY2TR(rx,ry,rz);
target(1,4) = x;
target(2,4) = y;
target(3,4) = z;

global joint0Val;
global joint1Val;
global joint2Val;
global joint3Val;
global sixlink;

%find inverse
sixlink = ikinsolver();
sol=sixlink.ikine(target); 
if( ~isnan(sol) )
    joint0Val = radtodeg(sol(1));
    joint1Val = radtodeg(sol(2));
    joint2Val = radtodeg(sol(3));
    joint3Val = radtodeg(sol(4));
    sixlink.plot(sol); %'workspace', W
else
    sixlink.plot([0, 0 ,0, 0, 0, 0, 0]);
end


% set value to tboJoint0Val text edit control using handles!!!
set(handles.m_tboJoint0Val, 'String', joint0Val);

% set value to tboJoint0Val text edit control using handles!!!
set(handles.m_tboJoint1Val, 'String', joint1Val);

% set value to tboJoint0Val text edit control using handles!!!
set(handles.m_tboJoint2Val, 'String', joint2Val);

% set value to tboJoint0Val text edit control using handles!!!
set(handles.m_tboJoint3Val, 'String', joint3Val);


%ang = [joint0Val, joint1Val, joint2Val,joint3Val, 0, 0];
%sixlink.plot(degtorad(ang));
%sixlink.fkine(ang)

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


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
