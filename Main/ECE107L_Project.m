function varargout = ECE107L_Project(varargin)
% ECE107L_Project MATLAB code for ECE107L_Project.fig
%      ECE107L_Project, by itself, creates a new ECE107L_Project or raises the existing
%      singleton*.
%
%      H = ECE107L_Project returns the handle to a new ECE107L_Project or the handle to
%      the existing singleton*.
%
%      ECE107L_Project('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ECE107L_Project.M with the given input arguments.
%
%      ECE107L_Project('Property','Value',...) creates a new ECE107L_Project or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ECE107L_Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ECE107L_Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ECE107L_Project

% Last Modified by GUIDE v2.5 31-Mar-2019 14:12:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ECE107L_Project_OpeningFcn, ...
                   'gui_OutputFcn',  @ECE107L_Project_OutputFcn, ...
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


% --- Executes just before ECE107L_Project is made visible.
function ECE107L_Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ECE107L_Project (see VARARGIN)

% Choose default command line output for ECE107L_Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ECE107L_Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ECE107L_Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in select.
function select_Callback(hObject, eventdata, handles)
[Filename, Pathname] = uigetfile('*.*', 'Choose an image');
% Open standard dialog box for retrieving files
CI = fullfile(Pathname, Filename);
IMG = imread(CI); 
handles.Pic = IMG;
axes(handles.original);
imshow (IMG);
guidata(hObject, handles);
% hObject    handle to select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in binaryFilter.
function binaryFilter_Callback(hObject, eventdata, handles)
BINARY = get(hObject, 'Value');
H = handles.Pic;
K = H;
BI = im2bw(K,0.4); %Convert image to binary image, based on threshold
axes(handles.filtered)
imshow(BI);
% hObject    handle to binaryFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in indexedFilter.
function indexedFilter_Callback(hObject, eventdata, handles)
F = get(hObject, 'Value');
R = handles.Pic;
K = R;
[X,MAP]=rgb2ind(K,32); %Convert RGB image to indexed image
axes(handles.filtered)
imshow(X,MAP);
% hObject    handle to indexedFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in intensityFilter.
function intensityFilter_Callback(hObject, eventdata, handles)
F = get(hObject, 'Value');
R = handles.Pic;
K = R;
K = rgb2gray(K);
axes(handles.filtered)
imshow(K);
% hObject    handle to intensityFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in redOnly.
function redOnly_Callback(hObject, eventdata, handles)
F = get(hObject, 'Value');
R = handles.Pic;
K = R;
redChannel = K(:,:,1);
allBlack = zeros(size(K, 1), size(K, 2), 'uint8');
just_red = cat(3, redChannel, allBlack, allBlack);
axes(handles.filtered)
imshow(just_red);
% hObject    handle to redOnly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in blueOnly.
function blueOnly_Callback(hObject, eventdata, handles)
F = get(hObject, 'Value');
R = handles.Pic;
K = R;
blueChannel = K(:,:,3);
allBlack = zeros(size(K, 1), size(K, 2), 'uint8');
just_blue = cat(3, allBlack, allBlack, blueChannel);
axes(handles.filtered)
imshow(just_blue);
% hObject    handle to blueOnly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in greenOnly.
function greenOnly_Callback(hObject, eventdata, handles)
F = get(hObject, 'Value');
R = handles.Pic;
K = R;
greenChannel = K(:,:,2);
allBlack = zeros(size(K, 1), size(K, 2), 'uint8');
just_green = cat(3, allBlack, greenChannel, allBlack);
axes(handles.filtered)
imshow(just_green);
% hObject    handle to greenOnly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in firFilter.
function firFilter_Callback(hObject, eventdata, handles)
F = get(hObject, 'Value');
R = handles.Pic;
K = R;
fs = 5000;
b = fir1(6, (2000 / (fs / 2)), 'bandpass');
F = imfilter(K,b); 
axes(handles.filtered)
imshow(F);
% hObject    handle to firFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in morphFilter.
function morphFilter_Callback(hObject, eventdata, handles)
MOR = get(hObject, 'Value');
RP = handles.Pic;
K = RP;
BCKGRND = imopen(K,strel('disk',10));
axes(handles.filtered)
imshow(BCKGRND); 
% hObject    handle to morphFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in subBack.
function subBack_Callback(hObject, eventdata, handles)
MO = get(hObject, 'Value');
Rp = handles.Pic;
K=Rp;
background = imopen(K,strel('disk',15));
I2 = K - background;
axes(handles.filtered);
imshow(I2)
% hObject    handle to subBack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in thresh.
function thresh_Callback(hObject, eventdata, handles)
MOR = get(hObject, 'Value');
RP = handles.Pic;
K = RP;
%background = imopen(K,strel('disk',10)); %Morphologically open image
%Create morphological structuring element (STREL)
%M = K - background;
BW1 = im2bw(K);
BW2 = bwareaopen(BW1, str2double(handles.threshValue.String));
axes(handles.filtered)
imshow(BW2)
% hObject    handle to thresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function threshValue_Callback(hObject, eventdata, handles)
% hObject    handle to threshValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of threshValue as text
%        str2double(get(hObject,'String')) returns contents of threshValue as a double


% --- Executes during object creation, after setting all properties.
function threshValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to threshValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function contrastSilder_Callback(hObject, eventdata, handles)
T = [get(hObject, 'Value'), 1];
J = handles.Pic;
K = imadjust(J, stretchlim(J, T), [0 1]); %Find limits to contrast stretch image
axes(handles.filtered)
imshow(K);  %Display image
guidata(hObject, handles);
% hObject    handle to contrastSilder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function contrastSilder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to contrastSilder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
