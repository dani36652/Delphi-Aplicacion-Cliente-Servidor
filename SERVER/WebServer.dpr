program WebServer;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  UServer in 'UServer.pas' {Server},
  WebModule in 'WebModule.pas' {ServerWebModule: TWebModule},
  Generales in 'Units\Generales.pas',
  DB_Actions in 'Units\DB_Actions.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TServer, Server);
  Application.Run;
end.
