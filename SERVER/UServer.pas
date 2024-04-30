unit UServer;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, IdGlobal, Web.HTTPApp,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  FireDAC.DApt, Data.DB, FireDAC.Comp.Client;

type
  TServer = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    EditPort: TEdit;
    lblPort: TLabel;
    ApplicationEvents: TApplicationEvents;
    ButtonOpenBrowser: TButton;
    StatusBar: TStatusBar;
    Conexion: TFDConnection;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonOpenBrowserClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FServer: TIdHTTPWebBrokerBridge;
    procedure StartServer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Server: TServer;

implementation

{$R *.dfm}

uses
DB_Actions,
{$IFDEF MSWINDOWS}
  WinApi.Windows, Winapi.ShellApi,
{$ENDIF}
  Generales, System.Generics.Collections, System.IOUtils;

procedure TServer.ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
begin
  ButtonStart.Enabled := not FServer.Active;
  ButtonStop.Enabled := FServer.Active;
  EditPort.Enabled := not FServer.Active;
end;

procedure TServer.ButtonOpenBrowserClick(Sender: TObject);
{$IFDEF MSWINDOWS}
var
  LURL: string;
{$ENDIF}
begin
  StartServer;
{$IFDEF MSWINDOWS}
  LURL := Format('http://localhost:%s', [EditPort.Text]);
  ShellExecute(0,
        nil,
        PChar(LURL), nil, nil, SW_SHOWNOACTIVATE);
{$ENDIF}
end;

procedure TServer.ButtonStartClick(Sender: TObject);
begin
  StartServer;
end;

procedure TServer.ButtonStopClick(Sender: TObject);
begin
  FServer.Active := False;
  FServer.Bindings.Clear;
  StatusBar.Panels.Items[1].Text:= string.Empty;
end;

procedure TServer.FormCreate(Sender: TObject);
begin
  if CrearTablas(Conexion) then
  begin
    IngresarInfoDePrueba(Conexion);
    StatusBar.Panels.Items[1].Text:= GetLocalIPAddress;
    FServer := TIdHTTPWebBrokerBridge.Create(Self);
  end else Application.Terminate;
end;

procedure TServer.FormDestroy(Sender: TObject);
begin
  if Assigned(FServer) then
  begin
    FServer.Active := False;
    FServer.Bindings.Clear;
    FreeAndNil(FServer);
  end;
end;

procedure TServer.StartServer;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.DefaultPort := StrToInt(EditPort.Text);
    FServer.Active := True;
    StatusBar.Panels.Items[1].Text:= GetLocalIPAddress;
  end;
end;

end.
