function varargout = GUIObjectDetctionDemo(varargin)
% GUIOBJECTDETCTIONDEMO MATLAB code for GUIObjectDetctionDemo.fig
%      GUIOBJECTDETCTIONDEMO, by itself, creates a new GUIOBJECTDETCTIONDEMO or raises the existing
%      singleton*.
%
%      H = GUIOBJECTDETCTIONDEMO returns the handle to a new GUIOBJECTDETCTIONDEMO or the handle to
%      the existing singleton*.
%
%      GUIOBJECTDETCTIONDEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIOBJECTDETCTIONDEMO.M with the given input arguments.
%
%      GUIOBJECTDETCTIONDEMO('Property','Value',...) creates a new GUIOBJECTDETCTIONDEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIObjectDetctionDemo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIObjectDetctionDemo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIObjectDetctionDemo

% Last Modified by GUIDE v2.5 18-Nov-2012 01:12:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIObjectDetctionDemo_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIObjectDetctionDemo_OutputFcn, ...
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


% --- Executes just before GUIObjectDetctionDemo is made visible.
function GUIObjectDetctionDemo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIObjectDetctionDemo (see VARARGIN)

% Choose default command line output for GUIObjectDetctionDemo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIObjectDetctionDemo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIObjectDetctionDemo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in m_btnDetect.
function m_btnDetect_Callback(hObject, eventdata, handles)
% hObject    handle to m_btnDetect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% global vars
global cam;
global refImg;

%get image form camera
imgObj = getsnapshot(cam);

%stop recording
stop(cam);
delete(cam);

detectObjects(refImg, imgObj, handles.m_axesObjects);
%******************************END*****************************************

% --- Executes on button press in m_btnCaptureRefImage.
function m_btnCaptureRefImage_Callback(hObject, eventdata, handles)
% hObject    handle to m_btnCaptureRefImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% global vars
global cam;
global refImg;

%get image form camera
refImg = getsnapshot(cam);

%stop recording
stop(cam);
delete(cam);

%show captured image
imshow(refImg, 'parent', handles.m_axesRefImg);

%enable/disable buttons
set(handles.m_btnCaptureRefImage, 'Enable', 'Off');
set(handles.m_btnCamPreview, 'Enable', 'on');
%****************************END*******************************************

% --- Executes during object deletion, before destroying properties.
function m_axesRefImg_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to m_axesRefImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in m_getNewImage.
function m_getNewImage_Callback(hObject, eventdata, handles)
% hObject    handle to m_getNewImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%global vars
global cam;

%get video object
cam =  videoinput('winvideo', 1, 'RGB24_640x480');

%get video resolution
vidRes = get(cam, 'VideoResolution');
nBands = get(cam, 'NumberOfBands');

%set image handle to gui axes
emptyImg = zeros(vidRes(2),vidRes(1), nBands);
hImage = image(emptyImg, 'Parent', handles.m_axesObjects);
preview(cam, hImage);
%****************************END*******************************************


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on mouse press over axes background.
function m_axesObjects_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to m_axesObjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in m_btnCamPreview.
function m_btnCamPreview_Callback(hObject, eventdata, handles)
% hObject    handle to m_btnCamPreview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%open video
global cam;
cam =  videoinput('winvideo', 1, 'RGB24_640x480');

%get video resolution
vidRes = get(cam, 'VideoResolution');
nBands = get(cam, 'NumberOfBands');

%set handle to 
emptyImg = zeros(vidRes(2),vidRes(1), nBands);
hImage = image(emptyImg, 'Parent', handles.m_axesRefImg);
preview(cam, hImage);

set(handles.m_btnCaptureRefImage, 'Enable', 'On');
set(handles.m_btnCamPreview, 'Enable', 'off');
%******************************END*****************************************


% --- Executes on mouse press over axes background.
function m_axesRefImg_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to m_axesRefImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hold on;
[x, y] = ginput(1);
fprintf('x=%d, y=%d',x,y);
hold off;


% --------------------------------------------------------------------
function uipanel1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hold on;
[x, y] = ginput(1);
x = floor(x);
y = floor(y);
world = cam2world(x,y);
fprintf('panel x=%4.1f, y=%4.1f\n',x,y)

fprintf('wx:%6.4f wy:%6.4f, wz:%6.4f\n',world(1),world(2),world(3));
hold off;
