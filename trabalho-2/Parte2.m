function varargout = Parte2(varargin)
% PARTE2 MATLAB code for Parte2.fig
%      PARTE2, by itself, creates a new PARTE2 or raises the existing
%      singleton*.
%
%      H = PARTE2 returns the handle to a new PARTE2 or the handle to
%      the existing singleton*.
%
%      PARTE2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARTE2.M with the given input arguments.
%
%      PARTE2('Property','Value',...) creates a new PARTE2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Parte2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Parte2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Parte2

% Last Modified by GUIDE v2.5 06-Jun-2020 17:46:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Parte2_OpeningFcn, ...
                   'gui_OutputFcn',  @Parte2_OutputFcn, ...
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


% --- Executes just before Parte2 is made visible.
function Parte2_OpeningFcn(hObject, eventdata, handles, varargin)
cla(handles.movie,handles.grafico)
handles.valor_freq.String = '--';
% Choose default command line output for Parte2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Parte2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Parte2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
opt = get(handles.popupmenu1,'Value');
n = 0;
if opt == 2
    try
        load('dados1.mat');
    catch
    end
elseif opt == 3
    try
        load('dados2.mat');
    catch
    end 
elseif opt == 4
    try
        load('dados3.mat');
    catch
    end
elseif opt ==5
    try
        load('dados4.mat');
    catch
    end
end

if n ~= 0 && opt ~= 1
    mv=VideoReader('video1.mp4');
    if opt == 3
        dx=x(:,1)-x(:,2);
        value = dx;
    else
        theta=atan2(y(:,2)-y(:,1),x(:,2)-x(:,1));
        theta=unwrap(theta);
        value = theta;
    end
    
    t=transpose(linspace(ti,tf,length(x(:,1))));
    tint=linspace(t(1),t(end),length(t)*2*n);
    yint = interp1(t,value,tint,'cubic');
    [tmaxmin, ymaxmin, f, sf] = maxmin(tint,yint);
    
    f = f*pi/30;
    sf = sf*pi/30;
    
    string = sprintf('(%0.2f +- %0.2f) rad/s',f,sf);
    handles.valor_freq.String = string;
    axes(handles.grafico)
    hold off
    if opt == 3
        grafico(t,tint,yint,tmaxmin,ymaxmin,value,'Comprimento(pixels)')
    else
        grafico(t,tint,yint,tmaxmin,ymaxmin,value,'Ângulo(rad)')
    end

    dtframes=n/mv.FrameRate; i=0; t=ti;
    while (t <= tf)
        axes(handles.movie)
        mv.CurrentTime=t; mov=readFrame(mv); image(mov);
        t=t+dtframes; i=i+1;
        hold on
        plot(x(i,:),y(i,:),'-y')
        hold off
    end
end

% --- Executes on button press in aq_dados.
function aq_dados_Callback(hObject, eventdata, handles)
opt = get(handles.popupmenu1,'Value');
if opt ~= 1
    mv=VideoReader('video1.mp4');
    np = 2;
    if opt == 2
        n = 5;
        ti=3.3367;
        tf= 10.1674;
        name = 'dados1.mat';

    elseif opt == 3
        ti=11.0015;
        tf=14;
        n = 3;
        name = 'dados2.mat';

    elseif opt == 4
        ti=15.001;
        tf=17.0031;
        n = 5;
        name = 'dados3.mat';

    elseif opt == 5
        ti=19.3387;
        tf=23.3428;
        n = 3;
        name = 'dados4.mat';
    end

    dtframes=n/mv.FrameRate; i=0; t=ti;
    while (t <= tf)
        axes(handles.movie)
        mv.CurrentTime=t; mov=readFrame(mv); image(mov);
        t=t+dtframes; i=i+1;
        for ip=1:np
            title(strcat('Frame ',num2str(i),' Ponto ',num2str(ip) ));
            [x(i,ip) ,y(i,ip)]=ginput(1);
        end
    end

    save(name,'n','np','ti','tf','x','y');
end


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
