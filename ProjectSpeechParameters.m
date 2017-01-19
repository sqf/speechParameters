function varargout = ProjectSpeechParameters(varargin)
% PROJECTSPEECHPARAMETERS MATLAB code for ProjectSpeechParameters.fig
%      PROJECTSPEECHPARAMETERS, by itself, creates a new PROJECTSPEECHPARAMETERS or raises the existing
%      singleton*.
%
%      H = PROJECTSPEECHPARAMETERS returns the handle to a new PROJECTSPEECHPARAMETERS or the handle to
%      the existing singleton*.
%
%      PROJECTSPEECHPARAMETERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTSPEECHPARAMETERS.M with the given input arguments.
%
%      PROJECTSPEECHPARAMETERS('Property','Value',...) creates a new PROJECTSPEECHPARAMETERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProjectSpeechParameters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProjectSpeechParameters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text2 to modify the response to help ProjectSpeechParameters

% Last Modified by GUIDE v2.5 19-Jan-2017 00:32:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProjectSpeechParameters_OpeningFcn, ...
                   'gui_OutputFcn',  @ProjectSpeechParameters_OutputFcn, ...
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


% --- Executes just before ProjectSpeechParameters is made visible.
function ProjectSpeechParameters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProjectSpeechParameters (see VARARGIN)

% Choose default command line output for ProjectSpeechParameters
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ProjectSpeechParameters wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ProjectSpeechParameters_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Wczytaj.
function Wczytaj_Callback(hObject, eventdata, handles)
% hObject    handle to Wczytaj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
[filename, pathname]=uigetfile({'*.wav'},'File Selector');
fullpathname = strcat(pathname,filename)

text1 = fileread(fullpathname);
set(handles.text2,'String',fullpathname)

global signal
global Fs
[stereoSignal,Fs]=audioread(get(handles.text2,'String'));
signal = stereoSignal(:,1)';

updateSignalPlot(handles);

% --- Executes on button press in Analiza_widma.
function Analiza_widma_Callback(hObject, eventdata, handles)
% hObject    handle to Analiza_widma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal
global Fs
spectrum(getCroppedSignal(handles),Fs);

% --- Executes on button press in Czestotliwosci_formantowe.
function Czestotliwosci_formantowe_Callback(hObject, eventdata, handles)
% hObject    handle to Czestotliwosci_formantowe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Czestotliwosci_antyformantowe.
function Czestotliwosci_antyformantowe_Callback(hObject, eventdata, handles)
% hObject    handle to Czestotliwosci_antyformantowe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Banki_filtrow.
function Banki_filtrow_Callback(hObject, eventdata, handles)
% hObject    handle to Banki_filtrow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal
global Fs
cepstralAnalysis(getCroppedSignal(handles),Fs);

% --- Executes on button press in Interwaly_czasowe.
function Interwaly_czasowe_Callback(hObject, eventdata, handles)
% hObject    handle to Interwaly_czasowe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal
global Fs
 plotZeroCrossIntervalsHistogram(getCroppedSignal(handles),Fs,50);

% --- Executes on button press in Obwiednia.
function Obwiednia_Callback(hObject, eventdata, handles)
% hObject    handle to Obwiednia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal
global Fs
 plotEnvelope(getCroppedSignal(handles),Fs);

% --- Executes on button press in Gestosc_przejsc_przez_0.
function Gestosc_przejsc_przez_0_Callback(hObject, eventdata, handles)
global signal
global Fs
 plotZeroCrossDensityHistogram(getCroppedSignal(handles),Fs,50);

% hObject    handle to Gestosc_przejsc_przez_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Start_nagranie.
function Start_nagranie_Callback(hObject, eventdata, handles)
% hObject    handle to Start_nagranie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global recObj 
recObj = audiorecorder;
disp('Zacznij m�wi�')
recordblocking(recObj,100); %nagranie trwa 100 sek
disp('Koniec nagrania')
signal = myRecording'
Fs = recObj.SampleRate

% --- Executes on button press in Stop_nagranie.
function Stop_nagranie_Callback(hObject, eventdata, handles)
% hObject    handle to Stop_nagranie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global recObj 
stop(recObj);
myRecording = getaudiodata(recObj);
global signal
global Fs
signal = myRecording'
Fs = recObj.SampleRate

updateSignalPlot(handles);

% --- Executes on button press in Zapisz_nagranie.
function Zapisz_nagranie_Callback(hObject, eventdata, handles)
% hObject    handle to Zapisz_nagranie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global recObj 
myRecording = getaudiodata(recObj);


% --- Executes on button press in Odtworz_nagranie.
function Odtworz_nagranie_Callback(hObject, eventdata, handles)
% hObject    handle to Odtworz_nagranie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global recObj 
play(recObj);


function Wybierz_poczatek_nagrania_Callback(hObject, eventdata, handles)
% hObject    handle to Wybierz_poczatek_nagrania (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wybierz_poczatek_nagrania as text
%        str2double(get(hObject,'String')) returns contents of Wybierz_poczatek_nagrania as a double



% --- Executes during object creation, after setting all properties.
function Wybierz_poczatek_nagrania_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wybierz_poczatek_nagrania (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function wybierz_koniec_nagrania_Callback(hObject, eventdata, handles)
% hObject    handle to wybierz_koniec_nagrania (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wybierz_koniec_nagrania as text
%        str2double(get(hObject,'String')) returns contents of wybierz_koniec_nagrania as a double


% --- Executes during object creation, after setting all properties.
function wybierz_koniec_nagrania_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wybierz_koniec_nagrania (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderWindowWidth_Callback(hObject, eventdata, handles)
% hObject    handle to sliderWindowWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
updateSignalPlot(handles)

% --- Executes during object creation, after setting all properties.
function sliderWindowWidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderWindowWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderWindowStart_Callback(hObject, eventdata, handles)
% hObject    handle to sliderWindowStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
updateSignalPlot(handles)

% --- Executes during object creation, after setting all properties.
function sliderWindowStart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderWindowStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function croppedSignal  = getCroppedSignal(handles)
global signal
windowWidth = round(get(handles.sliderWindowWidth, 'Value') * (size(signal,2)-1))
startingSample = round((size(signal,2) -windowWidth )* get(handles.sliderWindowStart, 'Value'))+1
croppedSignal = signal(startingSample :startingSample +windowWidth-1)


function updateSignalPlot(handles)
global signal

windowWidth = round(get(handles.sliderWindowWidth, 'Value') * (size(signal,2)-1))
startingSample = round((size(signal,2) - windowWidth )* get(handles.sliderWindowStart, 'Value'))+1
endSample = startingSample + windowWidth - 1

axes(handles.signalAxes);
plot(signal);
vline(startingSample,'r-')
vline(endSample,'r-')
axes(handles.mainAxes);
