unit UnAvtor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniButton, uniBitBtn, uniGUIBaseClasses,
  uniPanel, uniLabel, uwFunc, uniCheckBox;

type
  TFAvtor = class(TUniForm)
    EditPasword: TUniEdit;
    UniLabel1: TUniLabel;
    EditLogin: TUniEdit;
    UniLabel2: TUniLabel;
    BtOpen: TUniButton;
    UniButton1: TUniButton;
    UniLabel3: TUniLabel;
    UniCheckBox1: TUniCheckBox;
    procedure BtOpenClick(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniCheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FAvtor: TFAvtor;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication,main, UnRegistr;

function FAvtor: TFAvtor;
begin
  Result := TFAvtor(UniMainModule.GetFormInstance(TFAvtor));
end;

procedure TFAvtor.BtOpenClick(Sender: TObject);
//==============================================================================
//======= кнопка войти =========================================================
//==============================================================================
begin

   mainForm.AsetWork.Active:=false;

   mainForm.AsetWork.CommandText:=
     ' SELECT U.*, S.student_id '+
     ' FROM users U '+
     'left join student S on S.user0_id = U.user0_id '+
     ' where user_pasword collate Cyrillic_General_CS_AS ='+
     #39 + EditPasword.Text + #39 +
     'and user_login collate Cyrillic_General_CS_AS ='+
     #39 + EditLogin.Text + #39;

    //showmessage(mainForm.AsetWork.CommandText);

  mainForm.AsetWork.Active:=true;

  if mainForm.AsetWork.RecordCount > 0 then
    begin
      showmessage('Вы успешно вошли в систему');
      mainform.LabReg.Caption:=mainForm.AsetWork['user_name']+' '+
      mainForm.AsetWork['user_surname']+' '+
      mainForm.AsetWork['user_patronymic'];
      if mainForm.AsetWork['user_role']='admin' then
            mainForm.tabAdmin.TabVisible :=True
      else
            mainForm.tabAdmin.TabVisible :=false;
      self.Close;
    end

  else
    begin
      showmessage('Неправильный логин или пароль');
    end;





end;

procedure TFAvtor.UniButton1Click(Sender: TObject);
begin
  FRegistr.ShowModal;
end;

procedure TFAvtor.UniCheckBox1Click(Sender: TObject);
begin
if self.UniCheckBox1.Checked = true then
    self.EditPasword.PasswordChar := #0;
if self.UniCheckBox1.Checked = false then
    self.EditPasword.PasswordChar := '*'
end;

end.
