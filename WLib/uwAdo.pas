unit uwAdo;
{$H+}
{.$D-}
interface

uses AdoDB,classes,Math,variants,
  uwFunc, uwTextForm;


type
  TWAdo= class

protected
  FTextForm    : TwTextForm;
//  FCon         : TADoConnection; // ������� TAdoConnection
  FSet         : TAdoDataSet;    // ���������� AdoDataSet
  FSetLog      : TAdoDataSet;    // AdoDataSet ��� ������������

  FServerType  : integer;        // ��� ������� 0=MsSQL, 1=Access
  FLastError   : integer;
  FLastSql     : widestring;

  FIsLog       : boolean;

public

  FCon         : TADoConnection; // ������� TAdoConnection
  
  constructor Create(ACon: TAdoConnection; ServerType: integer);
  destructor  Destroy; override;

  property IsLog : boolean read FIsLog  write FIsLog;

  property LastErr : Integer read FLastError  write FLastError;
  property LastSql : widestring read FLastSql  write FLastSql;

  property Con     : TADoConnection read FCon;
  property DataSet : TAdoDataSet    read FSet;

  function Exec(SQlStr:wideString): _Recordset;overLoad;
  //====== ��������� ������ SQL ================================================

  function Exec(ASet: TADODataSet; SQlStr:wideString): integer;overLoad;
  //====== ��������� ������ SQL �� ASet ========================================

  procedure DropTMP( TableName:string);

  //======= ������� ��������� �������, ���� ��� ���������� =====================


 end;


implementation

uses Windows,DB,Dialogs,SysUtils,forms,controls;

constructor TWAdo.Create(ACon: TAdoConnection; ServerType: integer);
//==============================================================================
//========= ����������� ========================================================
//==============================================================================
begin
  inherited Create;
  self.FCon                := ACon;
  self.FSet                := TAdoDataSet.Create(self.FCon.Owner);
  self.FSet.CommandType    := cmdText;
  self.FSet.Connection     := ACon;

  self.FSetLog             := TAdoDataSet.Create(self.FCon.Owner);
  self.FSetLog.Connection  := ACon;

  self.FServerType         := ServerType;
  self.FSet.CommandTimeout := 5000;
  self.FLastSql:= '';
  self.IsLog:= false;
end;

destructor TWAdo.Destroy;
//==============================================================================
//==============================================================================
begin
  inherited Destroy;
end;

procedure TWAdo.DropTMP(TableName:string);
//==============================================================================
//======= ������� ��������� ������� ============================================
//==============================================================================
var
  SQL : widestring;
begin
  SQL := ' if Object_id('+wKV+'TempDB..'+TableName+wKV+') is Not null '+
    ' Drop Table '+TableName;
  Self.Con.Execute(SQL);
end;

function TWAdo.Exec(SQLStr:widestring):_RecordSet;
//==============================================================================
//====== ��������� ������ SQL �� ADOConnection, ���� �� ��������� ==============
//==============================================================================
var
  I           : integer;
  ErrorString : string;

begin
  Screen.Cursor:=crSQLWait;
  LastErr := 0;
  ErrorString := '';
  self.LastSql:=SQLStr;

  try
    Result:=self.Con.Execute(SQLStr);
    Screen.Cursor:=crDefault;
  except
    ErrorString := '';
    for I := 0 to self.DataSet.Connection.ConnectionObject.Errors.Count - 1 do
    begin
      ErrorString := ErrorString
        + wPS
        + wPS + 'SQL state=' + self.Con.ConnectionObject.Errors[I].SQLState
        + wPS + 'Source='    + self.Con.ConnectionObject.Errors[I].Source
        + wPS + 'Description=' + self.Con.ConnectionObject.Errors[I].Description
        + wPS + 'Number='    + IntToStr(self.Con.ConnectionObject.Errors[I].Number);
    end;
    Result:=Nil;
    Application.Restore;
    Screen.Cursor:=crDefault;
    FTextForm := TwTextForm.CreateViewString(application,SqlStr+wPS+'������:'+ErrorString);
    LastErr := 1;
    self.LastSql:=' ������ !!!=' + SQLStr;

  end; // try

  if self.IsLog then
  begin
    self.FSetLog.CommandText:='select top(1) * from dbo.a_log_app';
    self.FSetLog.Open;
    self.FSetLog.Insert;
    self.FSetLog['Action_name']:='DSQL';
    self.FSetLog['Action_comment']:=SQLStr;
    self.FSetLog['code_rez']:= LastErr;
    self.FSetLog.Post;
  end;

end;

function TWAdo.Exec(ASet: TADODataSet;SQLStr:widestring): integer;
//==============================================================================
//====== ��������� ������ SQL ��� AdoDATASet ===================================
//==============================================================================
var
  K,I         : integer;
  ErrorString : string;

begin
  Result:=0;
  Screen.Cursor:=crSQLWait;
  LastErr := 0;
  self.LastSql:= SQLStr;


  try
    ASet.Close;
    ASet.CommandText:=SqlStr;
    ASet.Open;
    ASet.First;
    Screen.Cursor:=crDefault;
    self.LastSql:= SQLStr;
  except
    ErrorString := '';
    for I := 0 to ASet.Connection.ConnectionObject.Errors.Count - 1 do
      begin
      ErrorString := ErrorString
        + wPS
        + wPS + 'SQL state=' +ASet.Connection.ConnectionObject.Errors[I].SQLState
        + wPS + 'Source=' +ASet.Connection.ConnectionObject.Errors[I].Source
        + wPS + 'Description=' +ASet.Connection.ConnectionObject.Errors[I].Description
        + wPS + 'Number=' +IntToStr(ASet.Connection.ConnectionObject.Errors[I].Number);
      end;
    Result:=1;
    Application.Restore;
    Screen.Cursor:=crDefault;
    FTextForm := TwTextForm.CreateViewString(application,SqlStr+wPS+'������:'+ErrorString);
    LastErr := 1;
    self.LastSql:=' ������ !!!=' + SQLStr;
  end; // try

  if self.IsLog then
  begin
    self.FSetLog.CommandText:='select top(1) * from dbo.a_log_app';
    self.FSetLog.Open;
    self.FSetLog.Insert;
    self.FSetLog['Action_name']:='DSQL';
    self.FSetLog['Action_comment']:=SQLStr;
    self.FSetLog['code_rez']:= LastErr;
    self.FSetLog.Post;
  end;


end;


end.
