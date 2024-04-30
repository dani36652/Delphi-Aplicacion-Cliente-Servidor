program Client;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  UStyles in 'Units\UStyles.pas',
  Generales in 'Units\Generales.pas',
  URest in 'Units\URest.pas',
  UJSONTool in 'Units\UJSONTool.pas',
  URecords in 'Units\URecords.pas',
  DB_Actions in 'Units\DB_Actions.pas',
  UCustomProgressBar in 'Units\UCustomProgressBar.pas';

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
