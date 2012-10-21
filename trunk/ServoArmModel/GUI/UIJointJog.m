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

% Last Modified by GUIDE v2.5 20-Oct-2012 17:16:28

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

% Hints: get(hObject,'String') returns contents of m_tboJoint0Val as text
%        str2double(get(hObject,'String')) returns contents of m_tboJoint0Val as a double


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

% Hints: get(hObject,'String') returns contents of m_tboJoint1Val as text
%        str2double(get(hObject,'String')) returns contents of m_tboJoint1Val as a double


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

% Hints: get(hObject,'String') returns contents of m_tboJoint2Val as text
%        str2double(get(hObject,'String')) returns contents of m_tboJoint2Val as a double


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

% Hints: get(hObject,'String') returns contents of m_tboJoint3Val as text
%        str2double(get(hObject,'String')) returns contents of m_tboJoint3Val as a double


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
