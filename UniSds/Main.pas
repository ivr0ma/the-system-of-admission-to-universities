unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniButton, Data.DB,
  Data.Win.ADODB, uniSplitter, uniDBNavigator, uniBasicGrid, uniDBGrid,
  uniToolBar, uniPageControl, uniLabel, uniPanel, uniEdit, uniCheckBox,
  uniMultiItem, uniComboBox;

type
  TMainForm = class(TUniForm)
    AConMain: TADOConnection;
    ASetWork: TADODataSet;
    panReg: TUniPanel;
    LabReg: TUniLabel;
    PageGontrolMain: TUniPageControl;
    TABsPRAV: TUniTabSheet;
    PageControlSprav: TUniPageControl;
    tabSpravSubject: TUniTabSheet;
    gridSpravSubject: TUniDBGrid;
    tabSpravDirect: TUniTabSheet;
    tabVuz: TUniTabSheet;
    tabAbit: TUniTabSheet;
    tabAuto: TUniTabSheet;
    tabAdmin: TUniTabSheet;
    DsDirList: TDataSource;
    ASetDirList: TADODataSet;
    ASetSubject: TADODataSet;
    DsSubject: TDataSource;
    AVuz: TADODataSet;
    DsVuz: TDataSource;
    AFacult: TADODataSet;
    DsFacult: TDataSource;
    ADirect: TADODataSet;
    DsDirect: TDataSource;
    ADirSub: TADODataSet;
    ADirSubdirect_subject_id: TAutoIncField;
    ADirSubdirection_id: TIntegerField;
    ADirSubsubject_id: TIntegerField;
    ADirSubLSubName: TStringField;
    DsDirSub: TDataSource;
    DsAbitur: TDataSource;
    AAbitur: TADODataSet;
    UniDBGrid4: TUniDBGrid;
    UniPanel11: TUniPanel;
    UniPanel12: TUniPanel;
    UniDBGrid5: TUniDBGrid;
    DsRaspred: TDataSource;
    ARaspred: TADODataSet;
    UniButton1: TUniButton;
    UniDBGrid6: TUniDBGrid;
    ASetUsers: TADODataSet;
    DsUsers: TDataSource;
    UniPanel13: TUniPanel;
    UniButton2: TUniButton;
    tabDir: TUniTabSheet;
    UniPanel14: TUniPanel;
    UniPanel15: TUniPanel;
    UniPanel16: TUniPanel;
    UniDBGrid7: TUniDBGrid;
    UniPanel17: TUniPanel;
    UniPanel18: TUniPanel;
    UniDBGrid8: TUniDBGrid;
    UniPanel19: TUniPanel;
    UniDBGrid9: TUniDBGrid;
    UniPanel21: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    UniPanel1: TUniPanel;
    UlPos: TUniLabel;
    UniButton3: TUniButton;
    AsetVuzR: TADODataSet;
    DsVuzR: TDataSource;
    UniDBGrid2: TUniDBGrid;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    UniDBGrid3: TUniDBGrid;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    Ecode: TUniEdit;
    UniLabel8: TUniLabel;
    Ename: TUniEdit;
    UniButton4: TUniButton;
    UniPanel4: TUniPanel;
    Edirname: TUniEdit;
    UniLabel11: TUniLabel;
    UniButton5: TUniButton;
    Edircod: TUniEdit;
    UniLabel10: TUniLabel;
    UniLabel9: TUniLabel;
    UniPanel5: TUniPanel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    Estucode: TUniEdit;
    UniLabel12: TUniLabel;
    Estuname: TUniEdit;
    UniLabel2: TUniLabel;
    UniLabel13: TUniLabel;
    Estucode2: TUniEdit;
    UniLabel14: TUniLabel;
    Estuname2: TUniEdit;
    UniLabel3: TUniLabel;
    UeCodVuz: TUniEdit;
    UniLabel1: TUniLabel;
    Uecodefac: TUniEdit;
    UniLabel15: TUniLabel;
    UecodeDir: TUniEdit;
    UniButton6: TUniButton;
    UniButton7: TUniButton;
    procedure UniToolButton1Click(Sender: TObject);
    procedure UniToolButton2Click(Sender: TObject);
    procedure LabRegClick(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure UniDBGrid7AjaxEvent(Sender: TComponent; EventName: string;
      Params: TStrings);
    procedure UniDBGrid8AjaxEvent(Sender: TComponent; EventName: string;
      Params: TStrings);
    procedure UniDBGrid9AjaxEvent(Sender: TComponent; EventName: string;
      Params: TStrings);
    procedure UniButton3Click(Sender: TObject);
    procedure UniButton4Click(Sender: TObject);
    procedure UniButton5Click(Sender: TObject);
    procedure UniButton6Click(Sender: TObject);
    procedure UniButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, UnAvtor, UnAddWish;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.LabRegClick(Sender: TObject);
var s,s1: string;       //s1 - ‘»Œ ‡·ËÚÛËÂÌÚ‡, s - ID ‡·ËÚÛËÂÌÚ‡
begin
  if self.LabReg.Caption = '¬ÓÈÚË' then FAvtor.ShowModal();
  if self.LabReg.Caption <> '¬ÓÈÚË' then
  begin
  FAddWish.ShowModal();

  str(trunc(self.AsetWork['user0_id']),s);
  FAddWish.AsetStudA.Active:=false;
  FAddWish.AsetStudA.CommandText:=
  'select * from student '+
  'where user0_id = '+s;
  FAddWish.AsetStudA.Active:=true;

  if FAddWish.AsetStudA.RecordCount = 0 then
  begin
      //showmessage('student created');
      FAddWish.AsetStudA.Active:=false;
      s1:=mainform.AsetWork['user_name']+' '+
      mainForm.AsetWork['user_surname']+' '+
      mainForm.AsetWork['user_patronymic'];
      FAddWish.AsetStudA.CommandText:=
      'insert into dbo.student(student_name, user0_id) '
      +'select '+#39+s1+#39+','+s+
      'select 0';
      FAddWish.AsetStudA.Active:=true;
  end;

  //ÓÚÍ˚‚‡ÂÏ Ú‡·ÎËˆ˚
  FAddWish.AsetWishA.Active:=false;
  str(trunc(self.AsetWork['user0_id']),s);
  FAddWish.AsetWishA.CommandText:=
  'SELECT SW.*, S.user0_id, DL.direction_name, F.name_faculties, V.full_name '
  +'FROM student_wish SW '
  +'left join student S on SW.student_id = S.student_id '
  +'left join direction D on D.direction_id = SW.direction_id '
  +'left join direction_list DL on DL.direction_list_id = D.direction_list_id '
  +'left join faculties F on D.faculties_id = F.faculties_id '
  +'left join vuz V on F.vuz_id = V.vuz_id '
  +'where S.user0_id = '+s;
  FAddWish.AsetWishA.Active:=true;

  FAddWish.AsetStudA.Active:=false;
  FAddWish.AsetStudA.CommandText:='select * from student '
  +'where user0_id = '+s;
  FAddWish.AsetStudA.Active:=true;

  FAddWish.AsetSubA.Active:=false;
  //showmessage('where ST.user0_id = '+s);
  FAddWish.AsetSubA.CommandText:=
  'select ST.student_name, ST.user0_id, S.*, SS.count_of_points '+
  'from student_subject SS '+
  'left join Subjects S on S.subject_id=SS.subject_id '+
  'left join student ST on ST.student_id = SS.student_id '
  +'where ST.user0_id = '+s;
  FAddWish.AsetSubA.Active:=true;

  FAddWish.AsetWishA.Active:=false;
  FAddWish.AsetWishA.CommandText:=
  'SELECT V.full_name, F.name_faculties, DL.direction_name, S.student_name, SW.student_id, SW.number_of_wish, S.user0_id, D.direction_id '
  +'FROM student_wish SW '
  +'left join student S on SW.student_id = S.student_id '
  +'left join direction D on D.direction_id = SW.direction_id '
  +'left join direction_list DL on DL.direction_list_id = D.direction_list_id '
  +'left join faculties F on D.faculties_id = F.faculties_id '
  +'left join vuz V on F.vuz_id = V.vuz_id '
  +'where S.user0_id = '+s;
  FAddWish.AsetWishA.Active:=true;


  FAddWish.AsetVuz.Active:=true;

  FAddWish.AsetFac.Active:=true;

  FAddWish.AsetDir.Active:=true;

  end;

end;

procedure TMainForm.UniButton1Click(Sender: TObject);
var
  SWhere: string;
begin
  SWhere:= '  and 1=1 ';
  if Self.Estuname2.Text <> '' then
    SWhere:= SWhere + ' and ST.student_name like '+#39+'%' + Self.Estuname2.Text+'%'+#39;
  if Self.Estucode2.Text <> '' then
    SWhere:= SWhere + ' and MN.student_id = ' + Self.Estucode2.Text;

  self.ARaspred.Close;
  self.ARaspred.CommandText:=
  'select '
	+'MN.* '
	+',ST.student_name '
	+',DL.direction_name '
	+',F.faculties_id '
	+',F.name_faculties '
	+',VZ.vuz_id '
	+',VZ.full_name '
  +'from main_result MN '
  +'left join student ST on ST.student_id = MN.student_id '
  +'left join direction DR on MN.direction_id = DR.direction_id '
  +'Left join direction_list DL on DL.direction_list_id = DR.direction_list_id '
  +'left join faculties F on F.faculties_id = DR.faculties_id '
  +'left join vuz VZ on VZ.vuz_id = F.vuz_id '
  +'where serial_number<= MN.count_budget_places '+ SWhere
  +'order by ST.student_name, VZ.full_name, F.name_faculties, DL.direction_name, MN.count_all_points desc ';

  self.ARaspred.Open;

end;

procedure TMainForm.UniButton2Click(Sender: TObject);
var
  SWhere: string;
begin
  SWhere:= '  Where 1=1 ';
  if Self.Estuname.Text <> '' then
    SWhere:= SWhere + ' and student_name like '+#39+'%' + Self.Estuname.Text+'%'+#39;
  if Self.Estucode.Text <> '' then
    SWhere:= SWhere + ' and student_id = ' + Self.Estucode.Text;

  self.AAbitur.Close;
  self.AAbitur.CommandText:=
     ' select * from student ' + SWhere;

  self.AAbitur.Open;
end;

procedure TMainForm.UniButton3Click(Sender: TObject);
var
  SWhere: string;
begin
  SWhere:= '  Where 1=1 ';
  if Self.UeCodVuz.Text <> '' then
    SWhere:= SWhere + ' and vuz_id = '+  Self.UeCodVuz.Text;

  self.AVuz.Close;
  self.AVuz.CommandText:=
     ' select * from vuz ' + SWhere;

  self.AVuz.Open;
end;

procedure TMainForm.UniButton4Click(Sender: TObject);
var
  SWhere: string;
begin
  SWhere:= ' 1=1 ';
  if Self.Ecode.Text <> '' then
    SWhere:= SWhere + ' and vuz_id = '+  Self.Ecode.Text;
  if Self.Ename.Text <> '' then
    SWhere:= SWhere + ' and full_name like '+#39+'%'+ Self.Ename.Text+'%'+#39;


  self.AsetVuzR.Close;
  self.AsetVuzR.CommandText:=
  ' SELECT * '+
  'FROM vuz '+
  'where vuz_top is not Null and '+SWhere+
  ' order by vuz_top ';

  self.AsetVuzR.Open;

end;

procedure TMainForm.UniButton5Click(Sender: TObject);
var
  SWhere: string;
begin
  SWhere:= 'where 1=1 ';
  if Self.Edircod.Text <> '' then
    SWhere:= SWhere + ' and direction_list_id = '+  Self.Edircod.Text;
  if Self.Edirname.Text <> '' then
    SWhere:= SWhere + ' and direction_name like '+#39+'%'+ Self.Edirname.Text+'%'+#39;


  self.ASetDirList.Close;
  self.ASetDirList.CommandText:=
  ' select * from direction_list '+SWhere;

  self.ASetDirList.Open;

end;

procedure TMainForm.UniButton6Click(Sender: TObject);
var
  SWhere: string;
begin
  SWhere:= '  Where 1=1 ';
  if Self.Uecodefac.Text <> '' then
    SWhere:= SWhere + ' and faculties_id = '+  Self.Uecodefac.Text;

  self.AFacult.Close;
  self.AFacult.CommandText:=
     ' select * from faculties ' + SWhere;

  self.AFacult.Open;

end;

procedure TMainForm.UniButton7Click(Sender: TObject);
var
  SWhere: string;
begin
  SWhere:= '  Where 1=1 ';
  if Self.UecodeDir.Text <> '' then
    SWhere:= SWhere + ' and direction_id = '+  Self.UecodeDir.Text;

  self.ADirect.Close;
  self.ADirect.CommandText:=
     ' select * from direction ' + SWhere;

  self.ADirect.Open;

end;

procedure TMainForm.UniDBGrid7AjaxEvent(Sender: TComponent; EventName: string;
  Params: TStrings);
begin
    //self.UlPos.Caption:='¬”«: '+self.AVuz['full_name']+
    //';    ‘¿ ”À‹“≈“: '+self.AFacult['name_faculties']+
    //';    Õ¿œ–¿¬À≈Õ»≈: '+self.ADirect['direction_name'];
end;

procedure TMainForm.UniDBGrid8AjaxEvent(Sender: TComponent; EventName: string;
  Params: TStrings);
begin
    //self.UlPos.Caption:='¬”«: '+self.AVuz['full_name']+
    //';    ‘¿ ”À‹“≈“: '+self.AFacult['name_faculties']+
    //';    Õ¿œ–¿¬À≈Õ»≈: '+self.ADirect['direction_name'];
end;

procedure TMainForm.UniDBGrid9AjaxEvent(Sender: TComponent; EventName: string;
  Params: TStrings);
begin
    //self.UlPos.Caption:='¬”«: '+self.AVuz['full_name']+
    //';    ‘¿ ”À‹“≈“: '+self.AFacult['name_faculties']+
    //';    Õ¿œ–¿¬À≈Õ»≈: '+self.ADirect['direction_name'];
end;

procedure TMainForm.UniToolButton1Click(Sender: TObject);
begin
self.ASetSubject.Insert;
end;

procedure TMainForm.UniToolButton2Click(Sender: TObject);
begin
  self.ASetSubject.Edit;
end;

initialization
  RegisterMainFormClass(TMainForm);

end.
