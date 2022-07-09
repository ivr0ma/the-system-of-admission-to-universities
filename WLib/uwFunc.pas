
unit uwFunc;
{$H+}
interface

uses sysutils,classes,controls,stdctrls,dbtables,DB,dbgrids,Forms
     ,ADOdb,menus,extctrls, math,Variants
     ,OleDB, URLMon, StrUtils , shellApi
     ,IdHTTP, windows, SHDocVw, mshtml,ComObj;


const
  wPS=#10;     //-- перевод строки ( как вариант - #10#13 )  -----------------
  wKV=#39;     //-- кавычка для снятия конфликта появления ' внутри строки ---

  wYELLOW=$00D5FFFF;
  wGREEN =$00CCFFCC;
  wROZE  =$00C1C1FF;
  wVIOLET=$00B49191;

Const
  wMonthNames : array [1..12,1..3] of string =
 (
 ('Январь'   ,'January'  , 'Января'),
 ('Февраль'  ,'February' , 'Февраля'),
 ('Март'     ,'March'    , 'Марта'),
 ('Апрель'   ,'April'    , 'Апреля'),
 ('Май'      ,'May'      , 'Мая'),
 ('Июнь'     ,'June'     , 'Июня'),
 ('Июль'     ,'July'     , 'Июля'),
 ('Август'   ,'August'   , 'Августа'),
 ('Сентябрь' ,'September', 'Сентября'),
 ('Октябрь'  ,'October'  , 'Октября'),
 ('Ноябрь'   ,'November' , 'Ноября'),
 ('Декабрь'  ,'December' , 'Декабря')
 );


type
  TExecState = (esNormal, esMinimized, esMaximized, esHidden);
     
const
  ShowCommands: array[TExecState] of Integer =
    (SW_SHOWNORMAL, SW_MINIMIZE, SW_SHOWMAXIMIZED, SW_HIDE);
     

type
  TwErr = class(Exception);
  TwServerType=(stMSSQL,stAccess);

type
  TwStringListFifo = class(TStringList)
  //============================================================================
  //== Объект Список FIFO ======================================================
  //============================================================================
  private
    FMaxCount : integer;
    FTestVal : string;

  public
    property MaxCount: integer read FMaxCount write FMaxCount;
    constructor Create(AMaxCount: integer); overload;
    procedure AddStr(AStr: string);

  end;



 var
  wStartTime     : TDateTime;
  wXLApplication : Variant; //-- Переменная OLE для Exell
  wXLBook        : Variant; //-- Переменная OLE для Exell книги
  wXLSheet       : Variant; //-- Переменная OLE для Exell страницы

//==============================================================================
//====== Разное
//==============================================================================

Function wGetMonthNumber(AMonth: String; ATypeName: integer): Integer;
//====== По имени месяца (русс или англ) выдать номер

//==============================================================================
//====== Файлы, файловая система
//==============================================================================
procedure wCopyFile(FileIn,FileOut : string ; OverWrite:boolean;Var Err: integer);
//======= Копировать файл

function wCheckFileName(aFileName: string): boolean;
//====== Проверить корректность имени файла

function wGetFileSize(aFileName: widestring): integer;
//====== Размер файла в байтах

function wDelDir(DirName: string): boolean;
//====== Удалить директорий с вложенными папками и файлами

function wFileSetDateTime(AFileName: string; ADt: TDatetime): integer;
//====== Установить дату-время файла

function wFileGetDateTime(AFileName: string): TDateTime;
//====== Прочитать дату-время файла

//==============================================================================
//====== Excel =================================================================
//==============================================================================
procedure wStartXL(ExFile:string);
//======= Стартовать Exell с файлом ============================================

procedure wCloseXL;
//======= Закрыть Excell =======================================================

//==============================================================================
//====== CxGrid
//==============================================================================
function wCxFilterCorrect(aFilter: widestring; aMode: integer): widestring;

//==============================================================================
//====== Интернет ==============================================================
//==============================================================================
function DownloadFile(SourceFile, DestFile: string): Boolean;
//====== загрузить с адреса ====================================================

function wDownLoadIndy(AUrl, AFileName: string; ATimeOut: integer ): boolean;
//====== загрузить с адреса с помощью INDY с указанием TimeOut =================

procedure wGetFileNameAndSizeByURL(sURL: String; var sFileName: String; var iFileSize: Int64);
//======= получить размер файла на адресе ======================================
//======= для тек версии Delphi - имя файла не определяется  ===================

//==============================================================================
//======= SQL сервер ===========================================================
//==============================================================================
procedure wGetSQLDataSourceList(var aServerList: TStringList);
//======= получить список MS SQL серверов ======================================

procedure wGetProviderProperties(aList: TStrings);
//======= получить список свойств провайдера ===================================

function wUdlToStr(FileName : widestring): widestring;
//====== Получение строки соединения из файла UDL  =============================


//==============================================================================
//======= Работа с текстовыми строками =========================================
//==============================================================================
procedure wToOneStr(var aStrIn:wideString);
//======= Возврат каретки, Перевод строки, табуляция - заменяются на пробелы
//======= Двойные пробелы - на одинарные

procedure wSeparateStr(aSeparator:string; aStrIn:wideString; aListOut:TStringList);
//======= Разбить строку aStrIn на подстроки по разделителю aSeparator =========

procedure wSeparateStr2(aStr, aStrStart, aStrEnd: wideString; var aListOut:TStringList);
//======= Разбить строку по началу и концу строки ==============================

function wGetXmlValue(aStr, aElementName: widestring): widestring;
//====== Получить значение элемента ============================================

function wCenterPartStr(AStr, APartStart, APartEnd: widestring): widestring;
//====== Получить центральную часть строки между двумя подстроками  ============

function wXmlPartStr(AStr: widestring): widestring;
//====== Получить часть XML строки между ">" и "</" при условии, ===============
//====== что открывающий и закрывающий тэг - в одной строке      ===============

function wCountPos(SubStr: widestring; Str: widestring): Integer;
//====== Количество вхождений подстроки в строку ===============================

function wHTMLDecode(const AStr: String): String;
//====== перекодировать из HTML ================================================


//==============================================================================
//======= Преобразование типов =================================================
//==============================================================================
function wIfVarNull(aV1, aV2: Variant): variant;
function wBlankToSql(aSss: string): string;

function wStToSQL(SSS:String): string;
//======== преобразовать строку содержащую число ===============================
//======== в строку с числом с точкой для SQL-запросов  ========================

function wVarToSQL(aVvv: Variant; aServerType: TwServerType): string; overload;
function wVarToSQL(aVvv: Variant): string; overload;
//====== Преобразовать Variant в строку SQL ====================================

function wFloatToSQL(aDdd: Double; aServerType: TwServerType): string; overload;
function wFloatToSQL(aDdd: Double): string; overload;
//====== Преобразовать вещественное в строку SQL ===============================

function wDateTimeToSQL(aDtm: TDateTime; aServerType: TwServerType): string; overload;
function wDateTimeToSQL(aDtm: TDateTime): string; overload;
//====== Преобразовать Дату в строку SQL =======================================

function wStToFL(S:String): double;
//====== преобразовать строку в число, заменяя в строке "," или "." ==========
//====== на установленный в системе разделитель ==============================

procedure wShowServiceForm;

procedure wCloseAdoDataSet(ASet:TAdoDataSet);overload;
procedure wCloseAdoDataSet(ASet:TAdoDataSet; IsCheckBrowse: boolean);overload;
procedure wCloseAdoDataSetForm(AForm: TForm);

procedure CloseAdoDataSet(AForm: TForm);
//======= Сохранить ВСЕ AdoDataSet на форме (CheckBrowseMode + Close)

procedure wStartPeriod;
procedure wEndPeriod;

function wExecuteFile(const FileName, Params, DefaultDir: string; ShowCmd: Integer): THandle;

function wFindForm(ATypeName: string): TForm;
procedure wShowBasicVariantType(varVar: Variant);

procedure wShowType(varVar: Variant);

function wFileExecuteWait(const FileName, Params, StartDir: string;
  InitialState: TExecState): Integer;

//-- WebBrowser
//-------------
procedure wNavigateGIS(AWebBrowser: TWebBrowser; aWidth,AHeight,AZoom: word; aDl,aSh: string);
//======= Вывести карту по долготе и широте

procedure wGenerateJPEGfromBrowser(browser: iWebBrowser2; jpegFQFilename: string;
   srcHeight: Integer; srcWidth: Integer; tarHeight: Integer; tarWidth: Integer);
//======= Вспомогательная для получения изображения всей HTML страницы

procedure wHtmlToJPEG(aWebBrowser: TWebBrowser; FileOut: string);
//======= Изображение на HTML-странице в aWebBrowser сохранить в файле FileOut

implementation


uses Dialogs,mmSystem,BDE, FileCtrl ,
     comctrls,graphics, uwServiceForm, JPEG, ActiveX;

function wDelDir(DirName: string): boolean;
//==============================================================================
//====== Удалить директорий с вложенными папками и файлами
//==============================================================================
var
  fos: TSHFileOpStruct;
begin
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc := FO_DELETE;
    fFlags := FOF_SILENT or FOF_NOCONFIRMATION;
    pFrom := PChar(DirName + #0);
  end;
  Result := (0 = ShFileOperation(fos));
end;

procedure wHtmlToJPEG(aWebBrowser: TWebBrowser; FileOut: string);
//==============================================================================
//======= Изображение на HTML - странице в aWebBrowser
//======= сохранить в файле FileOut
//============================================================================
var
  IDoc1: IHTMLDocument2;
  Web: IWebBrowser2;
  tmpX, tmpY: Integer;
begin
  with aWebBrowser do
  begin
    Document.QueryInterface(IHTMLDocument2, iDoc1);
    Web := ControlInterface;
    tmpX := Height;
    tmpY := Width;
    TControl(aWebBrowser).Visible := Boolean(0);
    Height := aWebBrowser.OleObject.Document.Body.ScrollHeight;//2000;//OleObject.Document.ParentWindow.Screen.Height;
    Width := aWebBrowser.OleObject.Document.Body.ScrollWidth;//2000; //OleObject.Document.ParentWindow.Screen.Width;
    wGenerateJPEGfromBrowser(Web,FileOut,Height, Width, Height, Width);
    Height := tmpX;
    Width := tmpY;
    TControl(aWebBrowser).Visible := Boolean(1);
  end;
end;

procedure wGenerateJPEGfromBrowser(browser: iWebBrowser2; jpegFQFilename: string;
   srcHeight: Integer; srcWidth: Integer; tarHeight: Integer; tarWidth: Integer);
//==============================================================================
//======= Вспомогательная для получения изображения всей HTML страницы
//==============================================================================
 var
   sourceDrawRect: TRect;
   targetDrawRect: TRect;
   sourceBitmap: TBitmap;
   targetBitmap: TBitmap;
   jpeg: TJPEGImage;
   viewObject: IViewObject;
 begin
   sourceBitmap := TBitmap.Create;
   targetBitmap := TBitmap.Create;
   jpeg := TJPEGImage.Create;
   try
     try
       sourceDrawRect := Rect(0, 0, srcWidth, srcHeight);
       sourceBitmap.Width  := srcWidth;
       sourceBitmap.Height := srcHeight;

       viewObject := browser as IViewObject;

       if viewObject = nil then
         Exit;

       OleCheck(viewObject.Draw(DVASPECT_CONTENT, 1, nil, nil, Application.Handle,
         sourceBitmap.Canvas.Handle, @sourceDrawRect, nil, nil, 0));

       // Resize the src bitmap to the target bitmap
       targetDrawRect := Rect(0, 0, tarWidth, tarHeight);
       targetBitmap.Height := tarHeight;
       targetBitmap.Width  := tarWidth;
       targetBitmap.Canvas.StretchDraw(targetDrawRect, sourceBitmap);

       // Create a JPEG from the Bitmap and save it
      jpeg.Assign(targetBitmap);
      jpeg.SaveToFile(jpegFQFilename);
     finally
       jpeg.Free;
       sourceBitmap.Free;
       targetBitmap.Free;
     end;
   except
     // Error Code
  end;
 end;


procedure wNavigateGIS(AWebBrowser: TWebBrowser; aWidth,AHeight, AZoom: word; aDl,aSh: string);
//==============================================================================
//======= Вывести карту 2ГИС с координатами в центре
//======= aDl- долгота   aSh- широта
//=======
//======= !!! В геосервисах обычно передают сначала долготу, затем широту
//=======
//=======      aSh = 0          - экватор
//=======  aDl,aSh =37.606,55.6 - Москва
//=======  aDl,aSh =37.606,65.6 - Белое море
//==============================================================================
var
  Sss : widestring;
  Doc : Variant;
begin

  //-- Формируем шаблон для ГИС карты
  //---------------------------------
  SSS:=
    wps+'<!DOCTYPE html>'+
    wps+'<html>'+
    wps+'<head>'+
    wps+'<title>API карт 2ГИС</title>'+
    wps+'<script src="http://maps.api.2gis.ru/2.0/loader.js?pkg=full"></script>'+
    wps+'<script type="text/javascript">'+
    wps+'var map;'+
    wps+'DG.then(function ()'+
    wps+'{map = DG.map('+wkv+'map'+wkv+','+
    wps+'{center: [DDDD,SSSS], zoom: ZZZZ });'+
    wps+'DG.marker([DDDD,SSSS]).addTo(map).bindPopup('+wkv+'Геокоординаты указывают сюда'+wkv+'); });'+
    wps+'</script>'+
    wps+'</head>'+
    wps+'<body>'+
    wps+'<div id="map" style="width:XXXXpx; height:YYYYpx"></div>'+
    wps+'</body>'+
    wps+'</html>'
    ;
  //-- Заменяем на переданные координаты
  //------------------------------------
  Sss:= StringReplace(Sss,'DDDD',aDl,[rfReplaceAll, rfIgnoreCase]);
  Sss:= StringReplace(Sss,'SSSS',aSh,[rfReplaceAll, rfIgnoreCase]);
  Sss:= StringReplace(Sss,'XXXX',IntToStr(awidth),[rfReplaceAll, rfIgnoreCase]);
  Sss:= StringReplace(Sss,'YYYY',IntToStr(aHeight),[rfReplaceAll, rfIgnoreCase]);
  Sss:= StringReplace(Sss,'ZZZZ',IntToStr(aZoom),[rfReplaceAll, rfIgnoreCase]);

  //-- Чистим броузер и передаем в него строку HTML
  //-----------------------------------------------
  if not Assigned(AWebBrowser.Document) then
    AWebBrowser.Navigate('about:blank');
  Doc := AWebBrowser.Document;
  Doc.Clear;
  Doc.Write(SSS);
  Doc.Close;



end;


function wFileGetDateTime(AFileName: string): TDateTime;
//==============================================================================
//====== Прочитать дату-время у файла
//==============================================================================
begin
  result:= FileDateToDateTime(FileAge(AFileName));
end;

function wFileSetDateTime(AFileName: string; ADt: TDatetime): integer;
//==============================================================================
//====== Установить дату-время у файла
//==============================================================================
begin
  Result:= FileSetDate(afileName, DateTimeToFileDate(ADt));
end;


function wFileExecuteWait(const FileName, Params, StartDir: string;
  InitialState: TExecState): Integer;
//==============================================================================
//====== Выполнить EXE файл и дождаться окончания выполнения
//======
//====== В отличие от ShellExecute дожидается окончания
//====== !!! Закоментарил Application.ProcessMessages;
//======     так как дает выполнять другие действия (нажимать кнопки и тд)
//==============================================================================
var
  Info: TShellExecuteInfo;
  ExitCode: DWORD;
begin
  FillChar(Info, SizeOf(Info), 0);
  Info.cbSize := SizeOf(TShellExecuteInfo);

  with Info do
  begin
    fMask:= SEE_MASK_NOCLOSEPROCESS;
    Wnd:= Application.Handle;
    lpFile := PChar(FileName);
    lpParameters := PChar(Params);
    lpDirectory := PChar(StartDir);
    nShow := ShowCommands[InitialState];
  end;

  //-- Если код возврата = -1, то это ошибка запуска
  //-- В простейшем случае = 0  - это норма
  //-- Можно ли отловить другие коды возврата - надо посмотреть
  //-- на примере WinRara
  //===========================================================

// while WaitForSingleObject(Info.hProcess,50) <> WAIT_OBJECT_0 do
//    Application.ProcessMessages;



  if ShellExecuteEx(@Info) then
  begin
    repeat
      //Application.ProcessMessages;
      GetExitCodeProcess(Info.hProcess, ExitCode);
    until (ExitCode <> STILL_ACTIVE) or Application.Terminated;
    Result := ExitCode;
  end
  else
    Result := -1;

    
end;

procedure wshowType;
begin

end;



procedure wShowBasicVariantType(varVar: Variant);
 var
   typeString : string;
   basicType  : Integer;

 begin
  // Получение основного типа Variant :
  // это означает, исключение массива или косвенных модификаторов
  basicType := VarType(varVar) and VarTypeMask;

  // Установка строки для согласования типа
  case basicType of
     varEmpty     : typeString := 'varEmpty';
     varNull      : typeString := 'varNull';
     varSmallInt  : typeString := 'varSmallInt';
     varInteger   : typeString := 'varInteger';
     varSingle    : typeString := 'varSingle';
     varDouble    : typeString := 'varDouble';
     varCurrency  : typeString := 'varCurrency';
     varDate      : typeString := 'varDate';
     varOleStr    : typeString := 'varOleStr';
     varDispatch  : typeString := 'varDispatch';
     varError     : typeString := 'varError';
     varBoolean   : typeString := 'varBoolean';
     varVariant   : typeString := 'varVariant';
     varUnknown   : typeString := 'varUnknown';
     varByte      : typeString := 'varByte';
     varWord      : typeString := 'varWord';
     varLongWord  : typeString := 'varLongWord';
     varInt64     : typeString := 'varInt64';
     varStrArg    : typeString := 'varStrArg';
     varString    : typeString := 'varString';
     varAny       : typeString := 'varAny';
     varTypeMask  : typeString := 'varTypeMask';
   end;

  // Показ типа Variant
   ShowMessage('Variant тип = '+typeString);
 end;

Function wGetMonthNumber(AMonth: String; ATypeName: integer): Integer;
//==============================================================================
//======= По имени месяца (русс или англ) выдать номер месяца
//======= ATypeName = 1- русский, 2- англ, 3- русский в род.падеже
//==============================================================================
var
  k: Integer;
begin
  AMonth:= Trim(AnsiUpperCase(AMonth));
  Result:=0;

  for k:=1 to 12 do
  begin
    if AMonth = AnsiUppercase(wMonthNames[k,ATypeName]) then
    begin
      Result:= k;
      exit;
    end;
  end;

end;


procedure wToOneStr(var aStrIn:wideString);
//==============================================================================
//======= В текстовой aStrIn :
//======= Возврат каретки, Перевод строки, табуляция - заменяются на пробелы
//======= Двойные пробелы, как исходные, так и формирующиеся заменяются
//======= на одиночные
//==============================================================================
var
  K, K2: Integer;
  L: Integer;
  S2: widestring;

begin

  L:= Length(aStrIn);
  SetLength(S2,L);

  //-- Первый символ отдельно
  //-------------------------
  if aStrIn[1]=char(10) then  S2[1]:=' ';
  if aStrIn[1]=char(13) then  S2[1]:=' ';
  if aStrIn[1]=char(9)  then  S2[1]:=' ';
  if aStrIn[1]=' '      then  S2[11]:=' ';
  if ((aStrIn[1]<>char(10)) and (aStrIn[1]<>char(13)) and (aStrIn[1]<>char(9)) and (aStrIn[1]<>' ') ) then  S2[1]:=aStrIn[1];

  K2:=2;

  //-- цикл перебора
  //----------------
  for k:=2 to L do
  begin

    //-- Если предыдущий не пробел
    //----------------------------
    if (S2[k2-1] <> ' ') then
    begin
      //-- если текущий ВК ПС ТАБ или пробел
      //------------------------------------
      if ((aStrIn[k] = char(10)) or (aStrIn[k] = char(13)) or (aStrIn[k] = char(9)) or (aStrIn[k] = ' ') ) then
      begin
        S2[k2]:=' ';
        K2:=K2+1;
      end
      else
      //-- текущий не ВК ПС ТАБ и не пробел
      //-----------------------------------
      begin
        S2[k2]:= aStrIn[k];
        K2:=K2+1;
      end;

    end

    else

    //-- Если предыдущий - пробел
    //----------------------------
    begin
      //-- текущий ВК ПС ТАБ или пробел (ничего не делаем)
      //-----------------------------------------------------
      if ((aStrIn[k] = char(10)) or (aStrIn[k] = char(13)) or (aStrIn[k] = char(9)) or (aStrIn[k] = ' ')) then
      begin
      end
      else
      //-- текущий не ВК ПС ТАБ и не пробел
      //-----------------------------------------------------
      begin
        S2[k2]:= aStrIn[k];
        K2:=K2+1;
      end;

    end;

  end;

  SetLength(S2,K2-1);
  aStrIn:=S2;

end;

function wGetFileSize(aFileName: widestring): integer;
//==============================================================================
//====== Размер файла
//==============================================================================
var
  hFile : Integer;
begin
    hFile := FileOpen(aFileName, fmOpenRead);
    Result:= GetFileSize(hFile, nil);
    FileClose(hFile);
end;


procedure wGetFileNameAndSizeByURL(sURL: String; var sFileName: String;
   var iFileSize: Int64);
//==============================================================================
//======= Получить исходный размер файла на URL-адресе     =====================
//======= -------------------------------------------------=====================
//======= !!!  Для текущей веерсии Delphi некоторые методы не работают
//=======      Их пришлось закоментить. Соответственно, имя файла не опред-ся
//==============================================================================
var
  Http: TIdHTTP;
  sWwwFileName: STring;
begin

  try
    Http := TIdHTTP.Create(nil);
    Http.Head(sURL);

    (*
    Http.Request.CharSet := 'UTF-8';

    sFileName := Http.Response.ContentDisposition;
    sFileName := SubStr(sFileName, Pos('="', sFileName) + Length('="'));
    sFileName := SubStr(sFileName, 1, Pos('"', sFileName) - 1);
    sFileName := TIdURI.URLDecode(sFileName);
    *)
    
    iFileSize := Http.Response.ContentLength;

  finally
    Http.Free;
  end;
end;



function wGetXmlValue(aStr, aElementName: widestring): widestring;
//==============================================================================
//====== Получить значение элемента ============================================
//==============================================================================
var
  PosStart, Pos1, Pos2 : integer;
begin
  PosStart:=Pos(aElementName, aStr);
  if PosStart = 0 then
  begin
    result:='';
    exit;
  end;

  PosStart:= PosStart + Length(aElementName);
  Pos1:= PosEx('"',aStr, PosStart);
  Pos2:= PosEx('"',aStr, Pos1+1);
  Result:= Copy(aStr,Pos1+1,Pos2-Pos1-1);


end;

procedure wSeparateStr2(aStr, aStrStart, aStrEnd:wideString; var aListOut:TStringList);
//==============================================================================
//======= Разбить строку по началу и концу строки ==============================
//==============================================================================
var
  PosCur   : integer;
  PosStart : integer;
  PosEnd   : integer;
  StrCur   : widestring;

begin
  PosCur:=1;
  aListOut.Clear;

  while PosCur <> 0 do
  begin
    PosStart:= PosEx(aStrStart, aStr, PosCur);
    PosEnd:= PosEx(aStrEnd, aStr, PosCur);
    if PosEnd = 0 then
      break;
    StrCur:= Copy(aStr, PosStart, PosEnd - PosStart + Length(aStrEnd));

    aListOut.Add(StrCur);

    PosCur:= PosEnd + Length(aStrEnd);
  end;

end;



function wHTMLDecode(const AStr: String): String;
//==============================================================================
//====== Перекодировать из HTML
//====== Из текста вида &#x410;&#x41D;&#x410;
//==============================================================================
var
  Sp, Rp, Cp, Tp: PChar;
  S: String;
  I, Code: Integer;
begin
  SetLength(Result, Length(AStr));
  Sp := PChar(AStr);
  Rp := PChar(Result);
  try
    while Sp^ <> #0 do
    begin
      case Sp^ of
        '&': begin
               Inc(Sp);
               case Sp^ of
                 'a': if AnsiStrPos(Sp, 'amp;') = Sp then  { do not localize }
                      begin
                        Inc(Sp, 3);
                        Rp^ := '&';
                      end;
                 'l',
                 'g': if (AnsiStrPos(Sp, 'lt;') = Sp) or (AnsiStrPos(Sp, 'gt;') = Sp) then { do not localize }
                      begin
                        Cp := Sp;
                        Inc(Sp, 2);
                        while (Sp^ <> ';') and (Sp^ <> #0) do
                          Inc(Sp);
                        if Cp^ = 'l' then
                          Rp^ := '<'
                        else
                          Rp^ := '>';
                      end;
                 'q': if AnsiStrPos(Sp, 'quot;') = Sp then  { do not localize }
                      begin
                        Inc(Sp,4);
                        Rp^ := '"';
                      end;
                 '#': begin
                        Tp := Sp;
                        Inc(Tp);
                        while (Sp^ <> ';') and (Sp^ <> #0) do
                          Inc(Sp);
                        SetString(S, Tp, Sp - Tp);
                        Val(S, I, Code);
                        if I >= $100 then
                        begin
                          S := WideChar(I);
                          Rp^ := S[1];
                        end
                        else
                          Rp^ := Chr((I));
                      end;
               end;
           end
      else
        Rp^ := Sp^;
      end;
      Inc(Rp);
      Inc(Sp);
    end;
  except
  end;
  SetLength(Result, Rp - PChar(Result));
end;

function wCountPos(SubStr: widestring; Str: widestring): Integer;
//==============================================================================
//====== Количество вхождений подстроки в строку
//==============================================================================
begin
//SubStr:='уточн.';

  if (Length(SubStr) = 0) or (Length(Str) = 0) or (Pos(SubStr, Str) = 0) then
  begin;
    Result := 0
  end
  else
  begin
    Result := (Length(Str) - Length(StringReplace(Str, SubStr, '', [rfReplaceAll]))) div
      Length(SubStr);
  end;
end;




function wXmlPartStr(AStr: widestring): widestring;
//==============================================================================
//====== Получить часть XML строки между ">" и "</" при условии, ===============
//====== что открывающий и закрывающий тэг - в одной строке      ===============
//==============================================================================
begin
  result:= wCenterPartStr(AStr, '>', '</');
end;

function wCenterPartStr(AStr, APartStart, APartEnd: widestring): widestring;
//==============================================================================
//======= Получить центральную часть строки между двумя подстроками  ===========
//======= 1.APartEnd - ищется как положено, т.е. после APartStart
//======= 2.Если APartStart='', то берем от начала строки до APartEnd
//======= 3.Если APartEnd='', то берем от APartStart и до конца строки
//==============================================================================
var
  PosStart0, PosStart, PosEnd : integer;

begin


  if APartStart= '' then
    PosStart:= 1
  else
  begin
    PosStart0:= Pos(APartStart, AStr);
    if PosStart0 = 0 then
    begin
      //showmessage('Ошибка: Не найдено ='+ APartStart);
      result:='';
      exit;
    end;

    PosStart:= PosStart0 + Length(APartStart);

  end;

  if APartEnd= '' then
    PosEnd:= Length(AStr)+1
  else
    PosEnd:= PosEx(APartEnd, AStr, PosStart);

    if PosEnd = 0 then
    begin
      //showmessage('Ошибка: Не найдено ='+ APartEnd);
      result:='';
      exit;
    end;


  Result:= Copy(AStr, PosStart, PosEnd - PosStart);

//function PosEx(const SubStr, S: string; Offset: Cardinal = 1): Integer;
end;


function wCheckFileName(aFileName: string): boolean;
//==============================================================================
//========= Проверить Имя файла на корректные символы (стандартный набор) ======
//==============================================================================
var
  I: integer;
begin

  Result:=False;
  if Trim(aFileName)='' then
    exit;
  for i:=1 to Length(aFileName) do
  begin
//showmessage('SSS='+aFileName[i]+'=SSS');
    //if aFileName[i] not in [' ','0'..'9','a'..'z','A'..'Z','а'..'я','А'..'Я','!','@','#','$','%','^','&','(',')','_','-','+','=','[',']',';'] then
    if aFileName[i] in ['\','/',':','*','?','"','<','>','|'] then
      exit;
  end;

  Result:=True;

end;



procedure wCopyFile(FileIn,FileOut: String; OverWrite: Boolean; Var Err: Integer);
//==============================================================================
//========= Копировать файл ====================================================
//==============================================================================
BEGIN
   Err:=0;
//showmessage('in='+PChar(FileIN)+'   Out='+PChar(FileOUT));
   try
     CopyFile(PChar(FileIN), PChar(FileOUT), not (OverWrite));
     Err := GetLastError();
   except
     Err := 1;
   end;
END;


function wBlankToSql(aSss: string): string;
//==============================================================================
//====== Если строка пустая или с пробелами, то выдать строковое 'NULL' ========
//====== Если НЕпустая, то убрать в кавычки
//==============================================================================
begin
  aSss:= Trim(aSss);
  if aSss='' then
    Result:='NULL'
  else
    Result:= wkv + aSss + wkv;
end;

function wFindForm(ATypeName: string): TForm;
//==============================================================================
//====== Существует ли форма с именем ==========================================
//==============================================================================
var
  i: integer;
begin
  ATypeName := AnsiUpperCase(ATypeName);
  result:=nil;
  for i := 0 to Application.ComponentCount - 1 do
  begin
    if (Application.Components[i] is TForm) and ( AnsiUpperCase((Application.Components[i] as TForm).ClassName) = ATypeName) then
    begin
      result:= (Application.Components[i] as TForm);
      break;
    end;
  end;



end;




function wStToSQL(SSS: string): String;
//==============================================================================
//======== преобразовать строку содержащую число ===============================
//======== в строку с точкой для SQL-запросов    ===============================
//==============================================================================
var
  k: integer;
begin
  k:=Pos(',',SSS);
  if k>0 then
    SSS[k]:='.';
  Result:=SSS;
end;

procedure wCloseXL;
//==============================================================================
//======= Закрыть Excell =======================================================
//==============================================================================
begin
  if not VarIsEmpty(wXLApplication) then
  begin
    wXLApplication.DisplayAlerts := False;//-- не спрашивать о сохранении файла
    wXLApplication.Quit;
  end;
end;

procedure wStartXL(ExFile:string);
//==============================================================================
//========= Стартовать Exell с открытием файла =================================
//==============================================================================
(* Чтобы получить справку по Excell необходимо:
   1. При установке Excell включить установку Visual Basic
   2. Стартовать Excell, вызвать Visual Basic (Сервис-Макрос-Редактор VBasic)
   3. В редакторе вызвать справку ( F1)
   4. В Мастере ответов  по слову "Application" найти раздел
      " Application object" и раскрыть его

--- Пример по шагам.
 var
  zXLApplication : Variant; //-- Переменная OLE для Exell
  zXLBook        : Variant; //-- Переменная OLE для Exell книги
  zXLSheet       : Variant; //-- Переменная OLE для Exell страницы
 Begin
   zXLApplication := CreateOleObject('Excel.Application'); //-- создаем
   zXLApplication.Visible := True;           //-- показываем на экране
   zXLApplication.Workbooks.Add('c:\1.xls'); //-- открываем файл (книгу)

//-- для удобства обращения к книге и странице ставим их в соответствие
//-- с переменными ( обращаться можно по индексу или по имени)
//------------------------------------------------------------------------------
   zXLBook :=zXLApplication.Workbooks[1];
   zXLSheet:=zXLApplication.Workbooks[1].WorkSheets['Страница А'];

//-- присваиваем ячейке(1-я строка,7-й столб) --
   zXLSheet.Cells[1,7]:='Москва';

//-- устанавливаем свойства диапазонов --
   zXLSheet.range['A1','E1'].interior.color    :=clGreen;
   zXLSheet.range['A1','E1'].Borders.LineStyle :=xlSingle;

//-- сохранить на диске --
   zXLApplication.zXLBook.SaveAs('C:\2.xls');

//-- закрыть Excell (полезно вставлять и перед открытием,
//-- чтобы не образовывалось несколько экземпляров Excell )
   if not VarIsEmpty(XLApplication) then
      begin
      zXLApplication.DisplayAlerts := False;
      zXLApplication.Quit;

      end;
 END;
*)
begin
  wCloseXL;
  wXLApplication := CreateOleObject('Excel.Application');
  wXLApplication.Visible := false; //True;
  wXLApplication.Workbooks.Add(ExFile);
  wXLBook :=wXLApplication.Workbooks[1];
  wXLSheet:=wXLApplication.Workbooks[1].WorkSheets[1];
end;


function wExecuteFile(const FileName, Params, DefaultDir: string; ShowCmd: Integer): THandle;
begin
   Result := ShellExecute(Application.MainForm.Handle, nil, PChar(FileName), PChar(Params),
     PChar(DefaultDir), ShowCmd);
end;



procedure wStartPeriod;
//==============================================================================
//======= Запомнить начало периода =============================================
//==============================================================================
begin
  wStartTime:=now;
end;

procedure wEndPeriod;
//==============================================================================
//======= Закончить период и вывести его продолжительность =====================
//==============================================================================
begin
  showmessage('Продолжительность периода ='+FormatDateTime('hh:nn:ss zzz',now - wStartTime));
end;



function wStToFL(S:String): double;
//==============================================================================
//======== Преобразовать строку в число, заменяя в строке "," или "." ==========
//======== на установленный в системе разделитель для дробных чисел   ==========
//======== (пробелы или пусто преобразуются в "0")                    ==========
//==============================================================================
 Var
  k : integer;
 BEGIN
  S:=Trim(S);
  if S='' then Result:=0;
  if S='' then Exit;
  if decimalSeparator=',' then //-- точку исправляем на запятую
     begin
     k:=Pos('.',S);
     if k>0 then S[k]:=',';
     end;
  if decimalSeparator='.' then //-- запятую исправляем на точку
     begin
     k:=Pos(',',S);
     if k>0 then S[k]:='.';
     end;
  Result:=StrToFloat(S);
 END;

function wCxFilterCorrect(aFilter: widestring; aMode: integer): widestring;
//==============================================================================
//====== Скорректировать строку фильтра для CxGrid
//======------------------------------------------------------------------------
//======  aMode =1 - True и False - в кавычки
//======  aMode =2 - кавычки меняем на двойные
//==============================================================================
begin
  aFilter := Trim(aFilter);

  //-- замена на двойные кавычки
  //----------------------------
  if aMode = 2 then
    aFilter:=StringReplace(aFilter,wKV,wKV+wKV,[rfReplaceAll, rfIgnoreCase]);

  //-- замена для True
  //----------------------------
  if aMode = 1 then
    aFilter:=StringReplace(aFilter,'True',wkv+'True'+wkv,[rfReplaceAll, rfIgnoreCase]);
    aFilter:=StringReplace(aFilter,'False',wkv+'False'+wkv,[rfReplaceAll, rfIgnoreCase]);

  //-- заменяем на is null
  //----------------------
  aFilter:=StringReplace(aFilter,'= NULL',' is null ',[rfReplaceAll, rfIgnoreCase]);
  aFilter:=StringReplace(aFilter,'= NULL',' is null ',[rfReplaceAll, rfIgnoreCase]);
  aFilter:=StringReplace(aFilter,'<> NULL',' is not null ',[rfReplaceAll, rfIgnoreCase]);
  aFilter:=StringReplace(aFilter,'<> NULL',' is not null ',[rfReplaceAll, rfIgnoreCase]);

  result := aFilter;
end;


procedure wShowServiceForm;
//==============================================================================
//======= Показать сервисную форму =============================================
//==============================================================================
var
  SrvForm : TwServiceForm;
begin
  SrvForm := TwServiceForm.Create(application);
  SrvForm.ShowModal;
  SrvForm := nil;

end;

procedure wCloseAdoDataSet(ASet:TAdoDataSet);
//==============================================================================
//======= Сохранить и закрыть AdoDataSet =======================================
//==============================================================================
begin
  wCloseAdoDataSet(ASet, False);
end;

procedure wCloseAdoDataSet(ASet:TAdoDataSet; IsCheckBrowse: boolean);
//==============================================================================
//======= Сохранить и закрыть AdoDataSet =======================================
//==============================================================================
begin
  if ASet.Active then
  begin
    if IsCheckBrowse then
      ASet.CheckBrowseMode;
    ASet.Close;
  end;

end;

procedure wCloseAdoDataSetForm(AForm: TForm);
//==============================================================================
//======= Сохранить и закрыть все AdoDataSet на форме ==========================
//==============================================================================
var
  k : integer;
begin
  for k:= 0 to AForm.ComponentCount-1 do
  begin
    if AForm.Components[k].ClassNameIs('TAdoDataSet') then
      wCloseAdoDataSet((AForm.Components[k] as TAdoDataSet), True);
  end; // for

end;


procedure CloseAdoDataSet(AForm: TForm);
//==============================================================================
//======= Сохранить изакрыть ВСЕ AdoDataSet на форме (CheckBrowseMode + Close)  =========
//==============================================================================
var
  k : integer;
begin
    for k:= 0 to AForm.ComponentCount-1 do
    begin
      if AForm.Components[k].ClassNameIs('TAdoDataSet') then
      begin
        //showmessage(AForm.Components[k].ClassName + ' == ' +AForm.Components[k].Name );
        if (AForm.Components[k] as TAdoDataSet).Active then
          (AForm.Components[k] as TAdoDataSet).CheckBrowseMode;
        if (AForm.Components[k] as TAdoDataSet).Active then
          (AForm.Components[k] as TAdoDataSet).Close;
      end;
    end;

end;


function wIfVarNull(aV1, aV2: Variant): variant;
//==============================================================================
//====== Если NULL =============================================================
//==============================================================================
begin
  if varType(aV1) = varNull then
    result := aV2
  else
    result := aV1

end;




function DownloadFile(SourceFile, DestFile: string): Boolean;
//==============================================================================
//====== загрузить с адреса ====================================================
//==============================================================================
begin
  try
    Result := UrlDownloadToFile(nil, PChar(SourceFile), PChar(DestFile), 0,
        nil) = 0;
  except
    Result := False;
  end;
end;

function wDownLoadIndy(AUrl, AFileName: string; ATimeOut: integer ): boolean;
//==============================================================================
//====== Загрузить файл с адреса AUrl в файл AFileName
//====== с прерыванием по таймауту
//==============================================================================
var
  LoadStream: TMemoryStream;
  Code      : Integer;
  idHTTP1   : TidHttp;
begin
  idHTTP1:= TIDHttp.Create(application);
  IdHTTP1.ReadTimeout:= ATimeOut;
  result:=false;

  try
    LoadStream := TMemoryStream.Create; // выделение памяти под переменную
    idHTTP1.Get(AUrl, LoadStream);      // загрузка в поток данных из сети
    LoadStream.SaveToFile(AFileName);   // сохраняем данные из потока на жестком диске
    LoadStream.Free;                    // освобождаем память
    Code := idHTTP1.ResponseCode;
    result:=true;
  except
    showmessage('Превышено время ожидания');
    (*
    on E: EIdHTTPProtocolException do
    begin
      code := idHTTP1.ResponseCode; // or: code := E.ErrorCode;
    end;
    *)
  end;

  idHTTP1.Free;

end;


procedure wSeparateStr(aSeparator:string; aStrIn:wideString; aListOut:TStringList);
//==============================================================================
//======= Разбить строку aStrIn на подстроки по разделителю aSeparator =========
//==============================================================================
var
  S : widestring; //-- текущая подстрока
  I : Integer;
begin

  aListOut.Clear;
  if aStrIn = '' then exit;

  //-- перебираем строку если не разделитель, то накапливаем
  //-- если разделитель, то заканчиваем подстроку и начинаем следующую
  //------------------------------------------------------------------
  S := '';
  for i := 1 to Length(aStrIn) do
  begin
    if aStrIn[i] <> aSeparator then
      S := S + aStrIn[i]
    else
    begin
      aListOut.Add(S);
      S := '';
    end;
  end;

  //-- Добавляем последнюю накопленную подстроку
  //--------------------------------------------
  if S <> '' then
    aListOut.Add(S);
end;



function wUdlToStr(FileName : widestring): widestring;
//==============================================================================
//====== Получение строки соединения из файла UDL ==============================
//==============================================================================
var
  DI : IDataInitialize;
  CS : PWideChar;
begin
  DI:=CreateComObject(CLSID_DataLinks) as IDataInitialize;
  OleCheck(DI.LoadStringFromStorage(PWideChar(fileName),CS)) ;
  result:=CS;
end;


constructor  TwStringListFifo.Create(AMaxCount : integer);
//==============================================================================
//==============================================================================
begin
  inherited Create;
  FMaxCount:=AMaxCount;
end;

function wDateTimeToSQL(aDtm: TDateTime; aServerType:TwServerType): string;
//==============================================================================
//======== преобразовать дату в строку SQL с кавычками =========================
//==============================================================================
begin
  if aServerType = stMSSQL then
    Result := wKV + FormatDateTime('yyyymmdd hh:nn:ss',aDtm)+wKV;
  if aServerType = stAccess then
    showmessage('DateTimeToSQL Не определено');
end;

function wDateTimeToSQL(aDtm: TDateTime): string;
//==============================================================================
//======== преобразовать дату в строку SQL с кавычками =========================
//==============================================================================
begin
  Result := wDateTimeToSQL(aDtm, stMSSQL);
end;

function wFloatToSQL(aDdd: Double; aServerType: TwServerType): String;
//==============================================================================
//====== Преобразовать вещественное в строку SQL ===============================
//==============================================================================
var
  k: Integer;
begin
  if aServerType = stMSSQL then
    begin
    Result := FloatToStr(aDDD);
    k := Pos(',',Result);
    if k > 0 then Result[k] := '.';
    end;
  if aServerType = stAccess then
    begin
    showmessage('Не определено');
    end;
end;

function wFloatToSQL(aDdd: Double): String;
//==============================================================================
//====== Преобразовать вещественное в строку SQL ===============================
//==============================================================================
begin
  result := wFloatToSQL(aDdd, stMSSQL);
end;

function wVarToSQL(aVvv: Variant; aServerType: TwServerType): string;
//==============================================================================
//====== Преобразовать в строку SQL
//==============================================================================
//====== - если NULL, то в строку  'NULL'
//====== - если Дата, то в строку даты с кавычками
//====== - целое в целое и т д
//==============================================================================
var
 sss : widestring;
begin
  case VarType(aVVV) of
    varNull                         : result := 'NULL';
    varSmallint,varInteger,VarByte  : result := IntToStr(aVvv);
    varSingle,varDouble,varCurrency : result := wFloatToSQL(aVvv);
    varBoolean                      : result := IntToStr(aVvv);
    varDate                         : result := wDateTimeToSql(aVvv,aServerType);
    varString,varStrArg,varOleSTR   : begin
                                      sss := aVvv;
                                      // Если внутри уже есть кавычки,
                                      // то преобразуем в двойные кавычки
                                      result := wKv+stringReplace(sss,wKV,wKV+wKV,
                                        [rfReplaceAll, rfIgnoreCase])+wKV;
                                      end

  else
    showmessage('VarToSQL: Не определен тип для преобразованиЯ');
  end; // case

end;

function wVarToSQL(aVvv: Variant): string;
//==============================================================================
//====== Преобразовать в строку SQL
//==============================================================================
begin
  Result := wVarToSQL(aVvv, stMSSQL);
end;

procedure TwStringListFifo.AddStr(AStr: string);
//==============================================================================
//======= Добавить строку ======================================================
//==============================================================================
var
  Ind: Integer;
begin
  // Если есть такая строка в списке, то удаляем. Вставляем вверх списка.
  // Еcли превышает макс длину списка, то удаляем лишние строки
  //---------------------------------------------------------------------
  ind:=self.IndexOf(AStr);
  if ind <> -1 then
    begin
    self.Delete(Ind);
    end;
  self.Insert(0,AStr);
  while self.Count-1 > self.MaxCount do self.Delete(self.Count-1)
end;

procedure wGetSQLDataSourceList(var aServerList: TStringList);
//==============================================================================
//======= Получить список Серверов MS SQL ======================================
//==============================================================================
var
  v: variant;
  I: Integer;
begin

  try
    try
      v := CreateOleObject('SQLDMO.SQLServer');
      v := v.Application;
      v := v.ListAvailableSQLServers;
      aServerList.Clear;
      for I := 1 to v.Count do
      begin
        aServerList.Add(v.item(I));
      end;
    except
    end;
  finally
    v := Unassigned;
  end;

end;

procedure wGetProviderProperties(aList: TStrings);
//==============================================================================
//======= Получить список свойств провайдера ===================================
//==============================================================================
var
  i : Integer;
  s : string;
begin
   (*
 with self.aconBase do
 begin
   for i:=0 to Properties.Count-2 do
     begin
     s:=VarToStr(properties.Item[i].Name)+'='+
       vartoStr(properties.Item[i].Value);
     s:=s+inttostr(Properties[i].Attributes);
     aList.Add(s);
     end;
     *)
 end;


initialization

finalization

end.
