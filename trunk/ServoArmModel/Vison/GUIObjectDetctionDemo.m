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

% Last Modified by GUIDE v2.5 20-Nov-2012 09:34:09

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
%****************************END*******************************************

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
%****************************END*******************************************

% --- Outputs from this function are returned to the command line.
function varargout = GUIObjectDetctionDemo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%****************************END*******************************************

% --- Executes on button press in m_btnDetect.
function m_btnDetect_Callback(hObject, eventdata, handles)
% hObject    handle to m_btnDetect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% global vars
global refImg;
global objImg;

global target;

%get coridnates in image, 
%and image with bounding boxes around detected objects
[img_cord, objImg]= detectObjects(refImg, objImg, handles.m_axesObjects);

fprintf('Object cordinates in picture:\n');
disp(img_cord);

str = '';
[m, n] = size(img_cord);
for i=1:1:m    
    %convert picure points to world frame points
    %format: img_x,         img_y cord
    tmp = cam2world(img_cord(i,1), img_cord(i,2));
    world_cord(i,1) = tmp(1);
    world_cord(i,2) = tmp(2);
    world_cord(i,3) = tmp(3);
    
    % add object positions in combo
    tmp_str = sprintf('X:%3.1f, Y:%3.1f\n, Z:%3.1f', ...
                      world_cord(i,1), world_cord(i,2), world_cord(i,3));
    
    %add world cordinates in combo
    str = [str, {tmp_str}];
    set(handles.m_lboTargetsCord, 'String', str);   
end

% get postion on first object
point_world =  cam2world(img_cord(1,1), img_cord(1,2));

fprintf('point world:\n');
disp(point_world);

target = world2robotfr([point_world,1]);
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
%****************************END*******************************************

% --- Executes on button press in m_jumpToLoc.
function m_jumpToLoc_Callback(hObject, eventdata, handles)
% hObject    handle to m_jumpToLoc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global joint0Val;
global joint1Val;
global joint2Val;
global joint3Val;
global sixlink;
global target

clear sixlink;
sixlink = ikinsolver();

%get RX RY RZ from GUI
rx = 0;
ry = 0;
rz = 0;
rx=degtorad(rx);
ry=degtorad(ry);
rz=degtorad(rz);

%get X Y Z from target vector
% scale cordinates to fit in kinematic model
objectOffset = 5;

x = target(1)/10;
y = target(2)/10;
z = (target(3)+objectOffset)/10;

%Set taget frame
target_fr = rpy2tr(rx,ry,rz);
target_fr(1,4) = x;
target_fr(2,4) = y;
target_fr(3,4) = z;

fprintf('target:\n');
disp(target_fr);

%find inverse
%use options with bigger tollerance and pinv!!!!
%tollerance is set to 0.01;
sol = sixlink.ikine(target_fr, 'tol', 0.01);  

%if inverse is not found try to use different method
if( isnan(sol) )
     sol = sixlink.ikine(target, 'tol', 0.01, 'pinv');
end

% try to find inverse with pinv
if( ~isnan(sol) ) 
    
    % find min angle in case where angles are more then 360 deg    
    sol = minRot(sol); 
    
    % set joint angles in label
    dsol = radtodeg(sol);
    strJoints = joints2str(dsol(1), dsol(2), dsol(3), dsol(4), dsol(5), dsol(6));
    set(handles.m_lblJointValues, 'String', strJoints);
    
    % kinematic model angles to linx robot angles
    linxJoints = kin2linx(sol(1), sol(2), sol(3), sol(4));
    
    %set linx joint limits if solution is above joint limits
    linxJoints = linxJointLimis(linxJoints(1), linxJoints(2), ...
                                linxJoints(3), linxJoints(4));
    
    %set joint values for robot
    joint0Val = radtodeg(linxJoints(1));
    joint1Val = radtodeg(linxJoints(2));
    joint2Val = radtodeg(linxJoints(3));
    joint3Val = radtodeg(linxJoints(4));
    sixlink.plot(sol);
else
    get(handles.m_axesRobotKinematics);
    sixlink.plot([0, 0, 0, 0, 0, 0]);
end
%****************************END*******************************************


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
%****************************END*******************************************

% --- Executes on mouse press over axes background.
function m_axesObjects_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to m_axesObjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%****************************END*******************************************

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

%[x, y] = ginput(1);
%fprintf('x=%d, y=%d',x,y);
%****************************END*******************************************

% --------------------------------------------------------------------
function uipanel1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hold on;
[x, y] = ginput(1);

world = cam2world(x,y);
fprintf('panel x=%4.1f, y=%4.1f\n',x,y)

fprintf('wx:%6.4f wy:%6.4f, wz:%6.4f\n',world(1),world(2),world(3));
hold off;
%****************************END*******************************************

% --- Executes on button press in m_btnRefBrowse.
function m_btnRefBrowse_Callback(hObject, eventdata, handles)
% hObject    handle to m_btnRefBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global refImg;
global objImg;

% show file dialog
filter  = {'*.png'; '*.jpg'; '*.bmp'; '*.*'};
title   = 'Slect image';
[fileName, pathName, FilterIndex] = uigetfile(filter, title);

%get full path
fullPath = strcat(pathName, fileName);

%read reference image
refImg = imread(fullPath);
imshow(refImg, 'Parent', handles.m_axesRefImg);
set(handles.m_lblRefImg, 'String', sprintf('File name:%s', fileName));
%*****************************END******************************************


% --- Executes on button press in m_btnObjBrowse.
function m_btnObjBrowse_Callback(hObject, eventdata, handles)
% hObject    handle to m_btnObjBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global objImg;

% show file dialog
filter  = {'*.png'; '*.jpg'; '*.bmp'; '*.*'};
title   = 'Slect image with objects';
[fileName, pathName, FilterIndex] = uigetfile(filter, title);

%get full path
fullPath = strcat(pathName, fileName);

%read reference image
objImg = imread(fullPath);

%display image
imshow(objImg, 'Parent', handles.m_axesObjects);
set(handles.m_lblObjImg, 'String', sprintf('File name:%s', fileName) );

%enable detect objects button
set(handles.m_btnDetect, 'Enable', 'On');
%*********************************END**************************************


% --- Executes on button press in m_btnCamPreviewObjects.
function m_btnCamPreviewObjects_Callback(hObject, eventdata, handles)
% hObject    handle to m_btnCamPreviewObjects (see GCBO)
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
hImage = image(emptyImg, 'Parent', handles.m_axesObjects);
preview(cam, hImage);

%enable disable GUI buttons
set(handles.m_btnCaptureObjects,    'Enable', 'On');
set(handles.m_btnCamPreviewObjects, 'Enable', 'off');
set(handles.m_btnDetect,            'Enable', 'Off');
%*******************************END****************************************

% --- Executes on button press in m_btnCaptureObjects.
function m_btnCaptureObjects_Callback(hObject, eventdata, handles)
% hObject    handle to m_btnCaptureObjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%global vriables
global cam;
global objImg;

%get image form camera
objImg = getsnapshot(cam);

%stop recording
stop(cam);
delete(cam);

%show captured image
imshow(objImg, 'parent', handles.m_axesObjects);

%enable disable GUI buttons
set(handles.m_btnCaptureObjects,    'Enable', 'Off');
set(handles.m_btnCamPreviewObjects, 'Enable', 'On');
set(handles.m_btnDetect,            'Enable', 'On');
%*********************************END**************************************


% --- Executes on selection change in m_lboTargetsCord.
function m_lboTargetsCord_Callback(hObject, eventdata, handles)
% hObject    handle to m_lboTargetsCord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns m_lboTargetsCord contents as cell array
%        contents{get(hObject,'Value')} returns selected item from m_lboTargetsCord


% --- Executes during object creation, after setting all properties.
function m_lboTargetsCord_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_lboTargetsCord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%****************************END*******************************************

% --- Executes on button press in m_btnEnlarge.
function m_btnEnlarge_Callback(hObject, eventdata, handles)
% hObject    handle to m_btnEnlarge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% global var
global objImg;

%show enlarged image with objects
figure(1);
imshow(objImg);
%****************************END*******************************************

% --------------------------------------------------------------------
function uipanel2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 [x, y] = ginput(1);
    w = cam2world(x,y);
    fprintf('wx:%6.4f wy:%6.4f wz:%6.4f\n', w(1), w(2), w(3));
%****************************END*******************************************

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%****************************END*******************************************