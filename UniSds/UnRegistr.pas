unit UnRegistr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Main, Data.DB, Data.Win.ADODB, uniEdit, uniDBEdit,
  uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn, uniLabel,
  Vcl.Imaging.pngimage, uniImage, uniCheckBox, uniMemo;

type
  TFRegistr = class(TUniForm)
    UniPanel1: TUniPanel;
    DsUsers: TDataSource;
    AsetUsers: TADODataSet;
    UniBitBtn1: TUniBitBtn;
    UniBitBtn2: TUniBitBtn;
    UniLabel1: TUniLabel;
    UniPanel2: TUniPanel;
    UniDBEdit3: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniLabel2: TUniLabel;
    UniImage1: TUniImage;
    UniPanel3: TUniPanel;
    UniDBEdit1: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniDBEdit4: TUniDBEdit;
    UniDBEdit5: TUniDBEdit;
    UniDBEdit6: TUniDBEdit;
    UniDBEdit7: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniCheckBox1: TUniCheckBox;
    procedure UniFormShow(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniBitBtn2Click(Sender: TObject);
    procedure UniCheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FRegistr: TFRegistr;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FRegistr: TFRegistr;
begin
  Result := TFRegistr(UniMainModule.GetFormInstance(TFRegistr));
end;

procedure TFRegistr.UniBitBtn1Click(Sender: TObject);
begin
  self.AsetUsers.Post;
  self.Close;
end;

procedure TFRegistr.UniBitBtn2Click(Sender: TObject);
begin
  self.AsetUsers.Cancel;
  self.Close;
end;

procedure TFRegistr.UniCheckBox1Click(Sender: TObject);
begin
if self.UniCheckBox1.Checked = true then
    self.UniDBEdit1.PasswordChar := #0;
if self.UniCheckBox1.Checked = false then
    self.UniDBEdit1.PasswordChar := '*'
end;

procedure TFRegistr.UniFormShow(Sender: TObject);
begin
  self.AsetUsers.Open;
  self.AsetUsers.Insert;
end;

end.
