function varargout = Projet(varargin)
% PROJET MATLAB code for Projet.fig
%      PROJET, by itself, creates a new PROJET or raises the existing
%      singleton*.
%
%      H = PROJET returns the handle to a new PROJET or the handle to
%      the existing singleton*.
%
%      PROJET('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJET.M with the given input arguments.
%
%      PROJET('Property','Value',...) creates a new PROJET or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Projet_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Projet_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Projet

% Last Modified by GUIDE v2.5 30-Jan-2020 15:32:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Projet_OpeningFcn, ...
                   'gui_OutputFcn',  @Projet_OutputFcn, ...
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


% --- Executes just before Projet is made visible.
function Projet_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Projet (see VARARGIN)

% Choose default command line output for Projet
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Projet wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Projet_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imBN
axes(handles.axes3);
imshow(imBN);
imsave
% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imBNM
axes(handles.axes3);
imshow(imBNM);
imsave






% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imBNM imBNMR
imBNMR=imBNM;
index_selected = get(handles.listbox2,'Value');
switch index_selected
    case 1 
        imBNM=miroirVertical(imBNM);
    case 2
        imBNM=miroirHorizontal(imBNM);
end

axes(handles.axes3);
imshow(imBNM);

axes(handles.axes6);
x=1:1:256;
bar(x,histogramme(imBNM));

axes(handles.axes7);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(imBNM)));



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ongle=get(handles.edit4,'String');
global im
if ~strcmp(ongle,'')
    ongle=str2double(ongle);
    im=rotation(im,ongle);
    set(handles.edit4,'string','');
    axes(handles.axes3);
imshow(im);
end
if strcmp(ongle,'')
    msgbox('Vous avez oublie de saisir l"ongle','erreur');
    return;
end





function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(handles.edit3,'String');

global imBNM imBNMR
imBNMR=imBNM;
if ~strcmp(val,'')
    val=str2double(val);
    imBNM=seuillage(imBNM,val);
    set(handles.edit3,'string','');
end
if strcmp(val,'')
    msgbox('Vous avez oublie de saisir le seuil!','erreur');
    return;
end

axes(handles.axes3);
imshow(imBNM);

axes(handles.axes6);
x=1:1:256;
bar(x,histogramme(imBNM));

axes(handles.axes7);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(imBNM)));


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imBNM imBNMR
imBNMR=imBNM;
index_selected = get(handles.listbox1,'Value');

switch index_selected
    case 1
        h=waitBar();
        imBNM=robert(imBNM);
        delete(h);
    case 2
        h=waitBar();
        imBNM=perwitt(imBNM);
        delete(h);
    case 3 
        h=waitBar();
        imBNM=sobel(imBNM);
        delete(h);
end

axes(handles.axes3);
imshow(imBNM);

axes(handles.axes6);
x=1:1:256;
bar(x,histogramme(imBNM));

axes(handles.axes7);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(imBNM)));




function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(handles.edit2,'String');
global imBNM imBNMR
imBNMR=imBNM;
if ~strcmp(val,'')
    val=str2double(val);
k=ones(val);
I=rgb2gray(imBNM);
imBNM=filtre_moyen(I,k);

set(handles.edit2,'string','');
axes(handles.axes3);
imshow(imBNM);
axes(handles.axes6);
x=1:1:256;
bar(x,histogramme(imBNM));

axes(handles.axes7);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(imBNM)));

end
if strcmp(val,'')
    msgbox('Vous avez oublie de saisir le filtre moyen.','erreur');
    return;
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes3);
global imBNM imBNMR
imBNMR=imBNM;
s = 0.8;
for i=1:3
    for j=1:3
        imBNM(i,j)=(1/(2*pi*s*s))*exp(-1*((i-2)*(i-2)+(j-2)*(j-2))/(2*s*s));
    end
end
 imshow(imBNM);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes3);

global imBNM imBNMR
imBNMR=imBNM;

[l,c]=size(imBNMR);

for i=1:l
    for j=1:c
        if i==1 || i==l || j==1 || j==c
            filtreMedian(i,j)=0;
      
        else
            for k=1:9
                t(k)=im(i-1,j-1);
            end
            sort(t);
            filtreMedian(i,j)=t(5);
        end
    end

end
imshow(imBNMR);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(handles.edit1,'String');
global imBNM imBNMR
imBNMR=imBNM;
if ~strcmp(val,'')
    val=str2double(val);
%     imBNM=rgb2gray(imBNM);
        imBNM=imnoise(imBNM,'gaussian',val);
set(handles.edit1,'string','');
axes(handles.axes3);
imshow(imBNM);
axes(handles.axes6);
x=1:1:256;
bar(x,histogramme(imBNM));

axes(handles.axes7);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(imBNM)));

end
if strcmp(val,'')
    msgbox('Vous avez oublie de saisir le bruit gaussian.','erreur');
    return;
end

    




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(handles.edit1,'String');
global imBNM imBNMR
imBNMR=imBNM;
if ~strcmp(val,'')
    val=str2double(val);
%     imBNM=rgb2gray(imBNM);
        imBNM=imnoise(imBNM,'salt & pepper',val);
set(handles.edit1,'string','');
axes(handles.axes3);
imshow(imBNM);
axes(handles.axes6);
x=1:1:256;
bar(x,histogramme(imBNM));

axes(handles.axes7);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(imBNM)));

end
if strcmp(val,'')
    msgbox('Vous avez oublie de saisir le bruit impulsionel.','erreur');
    return;
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Error'),'Error','Error');
    return
end
im=imread(path);
axes(handles.axes1);
imshow(im);
axes(handles.axes6);
x=1:1:256;
bar(x,histogramme(im));

axes(handles.axes7);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(im)));




% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im imBN imBNM ;
imBN=rgb2gray(im);
axes(handles.axes3);
imBN=uint8(imBN);
imshow(imBN);

imBNM=imBN;
axes(handles.axes3);
imshow(imBNM);

axes(handles.axes6);
x=1:1:256;
bar(x,histogramme(imBN));

axes(handles.axes7);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(imBN)));

axes(handles.axes6);
x=1:1:256;
bar(x,histogramme(imBNM));

axes(handles.axes7);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(imBNM)));


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imBNM imBNMR
imBNM=imBNMR;

axes(handles.axes3);
imshow(imBNM);

axes(handles.axes6);
x=1:1:256;
bar(x,histogramme(imBNM));

axes(handles.axes7);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(imBNM)));


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
axes(handles.axes3);
global imBNM imBNMR
imBNM=imBNMR;
% [f,p]=uigetfile('*','selection de fichier');
% S = imread(fullfile(p,f));
% subplot(3,1,1); imshow(S);
FS = fft2(double(imBNM));
module = abs(fftshift(FS));
Max = max(max(max(abs(module))));
% subplot(3,1,2);
imshow(module/100000);colormap gray
 

% phase = angle(fftshift(FS));
% subplot(3,1,3);
% imshow(phase,[-pi,pi]);colormap gray


% --- Executes on fkey press with focus on pushbutton13 and none of its controls.
function pushbutton13_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on pushbutton3 and none of its controls.
function pushbutton3_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global imBNM imBNMR lumnc lumncR
lumncR=lumnc;
lumnc=get(hObject,'Value');
imBNMR=imBNM;
    if lumnc>lumncR
    imBNM=luminancePlus(imBNM,lumnc);
    else
    imBNM=luminanceMoins(imBNM,lumnc);
    end
axes(handles.axes3);
imshow(imBNM);

axes(handles.axes6);
x=1:1:256;
bar(x,histogramme(imBNM));

axes(handles.axes7);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(imBNM)));



function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imBNM imBNMR
imBNMR=imBNM;
index_selected_1 = get(handles.listbox2,'Value');
index_selected_2 = get(handles.listbox3,'Value');

switch index_selected_1
    case 1
        if index_selected_2 == 1
        k=[1,2,1;2,4,2;1,2,1];
        h=waitBar();
        imBNM=filtres(imBNM,k);
        delete(h);
        else
        k=[1,4,6,4,1;4,16,24,16,4;6,24,36,24,6;4,16,24,16,4;1,4,6,4,1];
        h=waitBar();
        imBNM=filtres(imBNM,k);
        delete(h);
        end
    case 2
        autreType=get(handles.edit5,'String');
        if ~strcmp(autreType,'')
            autreType = str2double(autreType);
            if mod(autreType,2)==0
                set(handles.edit5,'string','');
                msgbox('Operation impossible, vous avez saisi un nombre impair','erreur');
                return
            else
                k=ones(autreType);
                h=waitBar();
                imBNM=filtres(imBNM,k);
                delete(h);
                set(handles.edit5,'string','');
            end
        else
            if index_selected_2 == 1
                k=ones(3);
                h=waitBar();
                imBNM=filtres(imBNM,k);
                delete(h);
            else
                k=ones(5);
                h=waitBar();
                imBNM=filtres(imBNM,k);
                delete(h);
            end
        end
    case 3 
        h=waitBar();
        imBNM=filtreMedian(imBNM);
        delete(h);
end

axes(handles.axes3);
imshow(imBNM);

axes(handles.axes6);
x=1:1:256;
bar(x,histogramme(imBNM));

axes(handles.axes7);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(imBNM)));

% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_35_Callback(hObject, eventdata, handles)
global img imBN imBNM %hisBN hisBNM
[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Error'),'Error','Error');
    return
end
img=imread(path);
%im=im2double(im);
imBN=rgb2gray(img);
axes(handles.axes8);
imshow(img);

axes(handles.axes2);
imBN=uint8(imBN);
imshow(imBN);

imBNM=imBN;
axes(handles.axes3);
imshow(imBNM);

axes(handles.axes4);
x=1:1:256;
bar(x,histogramme(imBN));

axes(handles.axes5);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(imBN)));

axes(handles.axes6);
x=1:1:256;
bar(x,histogramme(imBNM));

axes(handles.axes7);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(imBNM)));


% --------------------------------------------------------------------
function Untitled_12_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_15_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_18_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_19_Callback(hObject, eventdata, handles)

global imBNM imBNMR
imBNMR=imBNM;

imBNM=egalisation(imBNM);

axes(handles.axes3);
imshow(imBNM);

axes(handles.axes6);
x=1:1:256;
bar(x,histogramme(imBNM));

axes(handles.axes7);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(imBNM)));



% --------------------------------------------------------------------
function Untitled_20_Callback(hObject, eventdata, handles)
global imBNM imBNMR
imBNMR=imBNM;
%if get(handles.edit6,'string')=='' && get(handles.edit7,'string')==''

min=get(handles.edit8,'string');
max=get(handles.edit9,'string');
if strcmp(min,'') && strcmp(max,'')
    imBNM=etirement(imBNM);
    set(handles.edit8,'string','');
    set(handles.edit9,'string','');
end
if ~strcmp(min,'') && ~strcmp(max,'')
    min=str2double(min);
    max=str2double(max);
    imBNM=etirementParMorc(imBNM,min,max);
    set(handles.edit8,'string','');
    set(handles.edit9,'string','');
end
if strcmp(min,'') && ~strcmp(max,'')
        set(handles.edit8,'string','');
        set(handles.edit9,'string','');
        msgbox('Vous avez oublie de saissir le min','erreur');
        return;
end
if ~strcmp(min,'') && strcmp(max,'')
            set(handles.edit8,'string','');
            set(handles.edit9,'string','');
            msgbox('Vous avez oublie de saissir le max','erreur');
            return;
end 

axes(handles.axes3);
imshow(imBNM);

axes(handles.axes6);
x=1:1:256;
bar(x,histogramme(imBNM));

axes(handles.axes7);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(imBNM)));


% --------------------------------------------------------------------
function Untitled_16_Callback(hObject, eventdata, handles)
global im
% creer un element structurant en forme de ligne vertical
se = strel('line',11,90);
im = imerode(im,se);
axes(handles.axes3);
imshow(im);
title('Image erosiner');


% --------------------------------------------------------------------
function Untitled_17_Callback(hObject, eventdata, handles)
global im
% creer un element structurant en forme de ligne vertical
se = strel('line',11,90);
im = imdilate(im,se);
axes(handles.axes3);
imshow(im);
title('Image dilater');


% --------------------------------------------------------------------
function Untitled_13_Callback(hObject, eventdata, handles)
axes(handles.axes3);
global im
% x=imread('maroc.jpg');
b=im2bw(im);
imshow(b);


% --------------------------------------------------------------------
function Untitled_27_Callback(hObject, eventdata, handles)
global imBNM imBNMR
imBNMR=imBNM;

    imBNM=negatif(imBNM);

axes(handles.axes3);
imshow(imBNM);

axes(handles.axes6);
x=1:1:256;
bar(x,histogramme(imBNM));

axes(handles.axes7);
x=1:1:256;
plot(x,histogrammeCumule(histogramme(imBNM)));



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
