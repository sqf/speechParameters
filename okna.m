function varargout = okna(varargin)
% OKNA MATLAB code for okna.fig
%      OKNA, by itself, creates a new OKNA or raises the existing
%      singleton*.
%
%      H = OKNA returns the handle to a new OKNA or the handle to
%      the existing singleton*.
%
%      OKNA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OKNA.M with the given input arguments.
%
%      OKNA('Property','Value',...) creates a new OKNA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before okna_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to okna_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help okna

% Last Modified by GUIDE v2.5 02-May-2015 09:01:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @okna_OpeningFcn, ...
                   'gui_OutputFcn',  @okna_OutputFcn, ...
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


% --- Executes just before okna is made visible.
function okna_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to okna (see VARARGIN)

% Choose default command line output for okna
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes okna wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = okna_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function listboxokna_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listboxokna (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
