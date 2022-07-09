unit UnAddWish;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniButton, Main, uniBasicGrid,
  uniDBGrid, uniPanel, Data.DB, Data.Win.ADODB, uniPageControl, uniCheckBox,
  uniMultiItem, uniComboBox, uniEdit, uniDBComboBox, uniDBLookupComboBox,
  uniLabel;

type
  TFAddWish = class(TUniForm)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    AsetStudA: TADODataSet;
    AsetSubA: TADODataSet;
    AsetWishA: TADODataSet;
    DsStudA: TDataSource;
    DsSub: TDataSource;
    DsWishA: TDataSource;
    UniPanel3: TUniPanel;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniTabSheet2: TUniTabSheet;
    UniTabSheet3: TUniTabSheet;
    UbEnd: TUniButton;
    UniDBGrid1: TUniDBGrid;
    UniPanel4: TUniPanel;
    UniPanel5: TUniPanel;
    UniDBGrid2: TUniDBGrid;
    CbZm: TUniCheckBox;
    CbG: TUniCheckBox;
    CbV: TUniCheckBox;
    CbIs: TUniCheckBox;
    UniButton4: TUniButton;
    Aset1: TADODataSet;
    Ds1: TDataSource;
    UniPanel6: TUniPanel;
    UniDBGrid3: TUniDBGrid;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    CboxSub: TUniComboBox;
    ESub: TUniEdit;
    CboxWish: TUniComboBox;
    AsetVuz: TADODataSet;
    DsVuz: TDataSource;
    LpVuz: TUniDBLookupComboBox;
    Ub2d: TUniButton;
    LpFac: TUniDBLookupComboBox;
    LpDir: TUniDBLookupComboBox;
    AsetFac: TADODataSet;
    AsetDir: TADODataSet;
    DsFac: TDataSource;
    DsDir: TDataSource;
    UniButton3: TUniButton;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    procedure UbEndClick(Sender: TObject);
    procedure UniButton4Click(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure Ub2dClick(Sender: TObject);
    procedure LpVuzAjaxEvent(Sender: TComponent; EventName: string;
      Params: TStrings);
    procedure LpFacAjaxEvent(Sender: TComponent; EventName: string;
      Params: TStrings);
    procedure UniButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FAddWish: TFAddWish;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FAddWish: TFAddWish;
begin
  Result := TFAddWish(UniMainModule.GetFormInstance(TFAddWish));
end;

procedure TFAddWish.UbEndClick(Sender: TObject);
begin
    mainForm.LabReg.Caption:='Войти';
    self.Close;
end;

procedure TFAddWish.UniButton1Click(Sender: TObject);
var s,s1,s2,s3: string;
begin
    str(mainForm.AsetWork['student_id'],s1);
    str(trunc(mainForm.AsetWork['user0_id']),s);
    s2:=self.CboxSub.Text;
    s3:=self.ESub.Text;

    if s2='Ин. яз' then s2:='1';
    if s2='Биолог' then s2:='2';
    if s2='Химия' then s2:='3';
    if s2='Матем' then s2:='4';
    if s2='Рус. яз' then s2:='5';
    if s2='Физика' then s2:='6';
    if s2='Истор' then s2:='7';
    if s2='Литер' then s2:='8';
    if s2='Геогр' then s2:='9';
    if s2='Общест' then s2:='10';
    if s2='Информ' then s2:='11';

    self.AsetSubA.Active:=false;
    self.AsetSubA.CommandText:=
    'insert into student_subject(student_id,subject_id,count_of_points)'
    +'select  '+s1+', '+s2+', '+s3+' select top 0 * from student_subject';
    self.AsetSubA.Active:=true;

    self.AsetSubA.Active:=false;
    self.AsetSubA.CommandText:=
    'select ST.student_name, ST.user0_id, S.*, SS.count_of_points '+
    'from student_subject SS '+
    'left join Subjects S on S.subject_id=SS.subject_id '+
    'left join student ST on ST.student_id = SS.student_id '
    +'where ST.user0_id = '+s;
    self.AsetSubA.Active:=true;
end;

procedure TFAddWish.UniButton2Click(Sender: TObject);
var st_id, su_id, us_id: string;
begin
    str(mainForm.AsetWork['student_id'],st_id);
    str(trunc(self.AsetSubA['subject_id']),su_id);
    str(trunc(mainForm.AsetWork['user0_id']),us_id);

    self.AsetSubA.Active:=false;
    self.AsetSubA.CommandText:=
    'delete '+
    'from student_subject '+
    'where student_id='+st_id+' and subject_id='+su_id+
    ' select top 0 * from student_subject';
    self.AsetSubA.Active:=true;

    self.AsetSubA.Active:=false;
    self.AsetSubA.CommandText:=
    'select ST.student_name, ST.user0_id, S.*, SS.count_of_points '+
    'from student_subject SS '+
    'left join Subjects S on S.subject_id=SS.subject_id '+
    'left join student ST on ST.student_id = SS.student_id '
    +'where ST.user0_id = '+us_id;
    self.AsetSubA.Active:=true;
end;

procedure TFAddWish.UniButton3Click(Sender: TObject);
var s0,s,s1: string;
begin
    str(trunc(mainForm.AsetWork['student_id']),s);
    str(trunc(mainForm.AsetWork['user0_id']),s0);
    str(trunc(self.AsetWishA['direction_id']),s1);

    self.AsetWishA.Active:=false;
    self.AsetWishA.CommandText:='delete '
    +'from student_wish '
    +'where student_id = '+s+' and direction_id = '+s1+' select 0 as t';
    self.AsetWishA.Active:=true;

    self.AsetWishA.Active:=false;
    self.AsetWishA.CommandText:=
    'SELECT V.full_name, F.name_faculties, DL.direction_name, S.student_name, SW.student_id, SW.number_of_wish, S.user0_id, D.direction_id '
    +'FROM student_wish SW '
    +'left join student S on SW.student_id = S.student_id '
    +'left join direction D on D.direction_id = SW.direction_id '
    +'left join direction_list DL on DL.direction_list_id = D.direction_list_id '
    +'left join faculties F on D.faculties_id = F.faculties_id '
    +'left join vuz V on F.vuz_id = V.vuz_id '
    +'where S.user0_id = '+s0;
    self.AsetWishA.Active:=true;

end;

procedure TFAddWish.LpFacAjaxEvent(Sender: TComponent; EventName: string;
  Params: TStrings);
begin
    FAddWish.AsetDir.Active:=false;
    FAddWish.AsetDir.CommandText:='select * from direction '+
    'where faculties_id = '+inttostr(FAddWish.LpFac.KeyValue);
    //FAddWish.LpDir.KeyValue:=1;
    FAddWish.AsetDir.Active:=true;
end;

procedure TFAddWish.LpVuzAjaxEvent(Sender: TComponent; EventName: string;
  Params: TStrings);
begin
    FAddWish.AsetFac.Active:=false;
    FAddWish.AsetFac.CommandText:='select * from faculties '+
    'where vuz_id = '+inttostr(FAddWish.LpVuz.KeyValue);
    //FAddWish.LpFac.KeyValue:=1;
    FAddWish.AsetFac.Active:=true;
end;

procedure TFAddWish.Ub2dClick(Sender: TObject);
var s0,s,s1,s2: string;
begin
    //showmessage(inttostr(self.LpDir.KeyValue));
    str(trunc(mainForm.AsetWork['student_id']),s);
    str(trunc(mainForm.AsetWork['user0_id']),s0);
    s1:=inttostr(self.LpDir.KeyValue);
    s2:=self.CboxWish.Text;

    self.AsetWishA.Active:=false;
    self.AsetWishA.CommandText:='insert into student_wish(student_id, direction_id, number_of_wish) '
    +'select '+s+', '+s1+', '+s2+' select 0 as j';
    self.AsetWishA.Active:=true;

    self.AsetWishA.Active:=false;
    self.AsetWishA.CommandText:=
    'SELECT V.full_name, F.name_faculties, DL.direction_name, S.student_name, SW.student_id, SW.number_of_wish, S.user0_id, D.direction_id '
    +'FROM student_wish SW '
    +'left join student S on SW.student_id = S.student_id '
    +'left join direction D on D.direction_id = SW.direction_id '
    +'left join direction_list DL on DL.direction_list_id = D.direction_list_id '
    +'left join faculties F on D.faculties_id = F.faculties_id '
    +'left join vuz V on F.vuz_id = V.vuz_id '
    +'where S.user0_id = '+s0;
    self.AsetWishA.Active:=true;
end;

procedure TFAddWish.UniButton4Click(Sender: TObject);
var s, s1, s2, s3, s4: string;
begin
    if self.CbZm.Checked=false then s1:='0'
    else s1:='1';
    if self.CbG.Checked=false then s2:='0'
    else s2:='1';
    if self.CbV.Checked=false then s3:='0'
    else s3:='1';
    if self.CbIs.Checked=false then s4:='0'
    else s4:='1';

    self.AsetStudA.Active:=false;
    str(trunc(mainForm.AsetWork['user0_id']),s);
    self.AsetStudA.CommandText:=
    'update student '
    +'set golden_medal = '+s1+', '
    +'GTO = '+s2+', '
    +'voluntering = '+s3+', '
    +'final_essay = '+s4+'  '
    +'where user0_id = '+s+
    'select top 0 * from student';
    self.AsetStudA.Active:=true;


    self.AsetStudA.Active:=false;
    self.AsetStudA.CommandText:='select * from student '
    +'where user0_id = '+s;
    self.AsetStudA.Active:=true;
end;

end.
