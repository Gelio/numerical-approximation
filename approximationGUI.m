function varargout = approximationGUI(varargin)
% APPROXIMATIONGUI MATLAB code for approximationGUI.fig
%      APPROXIMATIONGUI, by itself, creates a new APPROXIMATIONGUI or raises the existing
%      singleton*.
%
%      H = APPROXIMATIONGUI returns the handle to a new APPROXIMATIONGUI or the handle to
%      the existing singleton*.
%
%      APPROXIMATIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPROXIMATIONGUI.M with the given input arguments.
%
%      APPROXIMATIONGUI('Property','Value',...) creates a new APPROXIMATIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before approximationGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to approximationGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help approximationGUI

% Last Modified by GUIDE v2.5 28-Nov-2016 21:43:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @approximationGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @approximationGUI_OutputFcn, ...
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


% --- Executes just before approximationGUI is made visible.
function approximationGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to approximationGUI (see VARARGIN)

% Choose default command line output for approximationGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes approximationGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = approximationGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in addTableRow.
function addTableRow_Callback(hObject, eventdata, handles)
% hObject    handle to addTableRow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oldData = get(handles.dataTable, 'Data');
newData = [oldData; 0 0];
set(handles.dataTable, 'Data', newData);
set(handles.deleteTableRow, 'Enable', 'on');
set(handles.deleteTableRowWarning, 'Visible', 'off');


% --- Executes on button press in deleteTableRow.
function deleteTableRow_Callback(hObject, eventdata, handles)
% hObject    handle to deleteTableRow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oldData = get(handles.dataTable, 'Data');
newData = oldData(1:end-1, :);
set(handles.dataTable, 'Data', newData);

if (size(newData, 1) == 4)
    set(handles.deleteTableRow, 'Enable', 'off');
    set(handles.deleteTableRowWarning, 'Visible', 'on');
end


% --- Executes during object creation, after setting all properties.
function dataTable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dataTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
initialData = [1 1; 2 2; 3 3; 4 4];
set(hObject, 'Data', initialData);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pointsData = get(handles.dataTable, 'Data');
x = pointsData(:, 1);
f = pointsData(:, 2);

pointsCount = str2double(get(handles.pointsCountEdit, 'String'));
if pointsCount <= 0
    pointsCount = 500;
end
paddingMultiplier = str2double(get(handles.paddingMultiplierEdit, 'String'));
if (paddingMultiplier < 0)
    paddingMultiplier = 0;
end

plotApproximation(x, f, pointsCount, paddingMultiplier);



function pointsCountEdit_Callback(hObject, eventdata, handles)
% hObject    handle to pointsCountEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pointsCountEdit as text
%        str2double(get(hObject,'String')) returns contents of pointsCountEdit as a double


% --- Executes during object creation, after setting all properties.
function pointsCountEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pointsCountEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function paddingMultiplierEdit_Callback(hObject, eventdata, handles)
% hObject    handle to paddingMultiplierEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of paddingMultiplierEdit as text
%        str2double(get(hObject,'String')) returns contents of paddingMultiplierEdit as a double


% --- Executes during object creation, after setting all properties.
function paddingMultiplierEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to paddingMultiplierEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
