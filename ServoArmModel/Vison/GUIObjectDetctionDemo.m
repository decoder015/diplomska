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

% Last Modified by GUIDE v2.5 15-Nov-2012 00:19:43

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


% --- Executes on button press in m_btnStart.
function m_btnStart_Callback(hObject, eventdata, handles)
% hObject    handle to m_btnStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

imgObj = imread('Objects1.png');

global refImg;
detectObjects(refImg, imgObj, handles.m_axesObjects);
%******************************END*****************************************

% --- Executes on button press in m_btnCaptureRefImage.
function m_btnCaptureRefImage_Callback(hObject, eventdata, handles)
% hObject    handle to m_btnCaptureRefImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%global stopCapture;
%open video
%cam =  videoinput('winvideo', 1, 'RGB24_640x480');
%pause(3);
%for i=1:1:10000
%    refImg = getsnapshot(cam);
%    hImage = image(refImg, 'parent', handles.m_axesRefImg);
%    imshow(refImg, 'parent', handles.m_axesRefImg);
%    pause(0.05);
%end
%delete(cam);
%clear cam;

global refImg;
refImg = imread('Blank1.png');
%hImage = image(refImg, 'parent', handles.m_axesRefImg);
imshow(refImg, 'parent', handles.m_axesRefImg);
%****************************END*******************************************


% --- Executes during object deletion, before destroying properties.
function m_axesRefImg_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to m_axesRefImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in m_btnStop.
function m_btnStop_Callback(hObject, eventdata, handles)
% hObject    handle to m_btnStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global stopCapture;
stopCapture = 0;

filename = 'viptraffic.avi';
hvfr = vision.VideoFileReader(filename, 'ImageColorSpace', 'RGB');

  fg_image = step(hfdet, y); % Detect foreground

  hfdet = vision.ForegroundDetector('NumTrainingFrames', 5, ...     
                                    'InitialVariance', (30/255)^2);
     % initial standard deviation of 30/255
    % only 5 because of short video
%****************************END*******************************************


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
