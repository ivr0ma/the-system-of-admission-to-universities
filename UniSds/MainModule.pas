unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, uniGUIClasses, uniImageList;

type
  TUniMainModule = class(TUniGUIMainModule)
    UniImageList1: TUniImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
