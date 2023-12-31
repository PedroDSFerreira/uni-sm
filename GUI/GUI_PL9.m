function varargout = GUI_PL9(varargin)
% GUI_PL9 MATLAB code for GUI_PL9.fig
%      GUI_PL9, by itself, creates a new GUI_PL9 or raises the existing
%      singleton*.
%
%      H = GUI_PL9 returns the handle to a new GUI_PL9 or the handle to
%      the existing singleton*.
%
%      GUI_PL9('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_PL9.M with the given input arguments.
%
%      GUI_PL9('Property','Value',...) creates a new GUI_PL9 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_PL9_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_PL9_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_PL9

% Last Modified by GUIDE v2.5 15-May-2020 14:45:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_PL9_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_PL9_OutputFcn, ...
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


% --- Executes just before GUI_PL9 is made visible.
function GUI_PL9_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_PL9 (see VARARGIN)

% Choose default command line output for GUI_PL9
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_PL9 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_PL9_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in acao.
function acao_Callback(hObject, eventdata, handles)
% hObject    handle to acao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


x=linspace(-2.5,2.5,100);
alfa=str2double(get(handles.alpha,'String'));
y = -alfa*x.^2+x.^4+6;
plot(handles.grafico,x,y)
ylim(handles.grafico,[min(y)-1 11])
xlabel(handles.grafico,'x/m')
ylabel(handles.grafico, 'f(x) /m')



function alpha_Callback(hObject, eventdata, handles)
% hObject    handle to alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha as text
%        str2double(get(hObject,'String')) returns contents of alpha as a double


% --- Executes during object creation, after setting all properties.
function alpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
