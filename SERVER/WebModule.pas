unit WebModule;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp;

type
  TServerWebModule = class(TWebModule)
    procedure ServerWebModuleobtener_clientesAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure ServerWebModuleobtener_proveedoresAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure ServerWebModuleDefaultActionAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure ServerWebModuleobtener_gerentesAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure ServerWebModuleobtener_productosAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure ServerWebModuleconexion_disponibleAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TServerWebModule;

implementation
uses
  DB_Actions, UServer;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TServerWebModule.ServerWebModuleconexion_disponibleAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  Response.Title:= 'OK';
  Response.StatusCode:= 200;
  Response.ContentEncoding:= 'utf-8';
  Response.ContentType:= 'text/plain; charset=utf-8';
  Response.Content:= 'Connected succesfully';
  Response.SendResponse;
end;

procedure TServerWebModule.ServerWebModuleDefaultActionAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content:= 'WEBSERVICE';
  Response.SendResponse;
end;

procedure TServerWebModule.ServerWebModuleobtener_clientesAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  jstr: string;
begin
  if Request.MethodType = TMethodType.mtGet then
  begin
    jstr:= getClientesJSONString(Server.Conexion);
    if not jstr.IsEmpty then
    begin
      Response.Title:= 'OK';
      Response.StatusCode:= 200;
      Response.ContentEncoding:= 'utf-8';
      Response.ContentType:= 'application/json; charset=utf-8';
      Response.Content:= jstr;
      Response.SendResponse;
    end else
    begin
      Response.Title:= 'No Content';
      Response.StatusCode:= 204;
      Response.Content:= string.Empty;
      Response.SendResponse;
    end;
  end else
  begin
    Response.StatusCode:= 400;
    Response.Title:= 'bad request';
    Response.SendResponse;
  end;
end;

procedure TServerWebModule.ServerWebModuleobtener_gerentesAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  jstr: string;
begin
  if Request.MethodType = TMethodType.mtGet then
  begin
    jstr:= getGerentesJSONString(Server.Conexion);
    if not jstr.IsEmpty then
    begin
      Response.Title:= 'OK';
      Response.StatusCode:= 200;
      Response.ContentEncoding:= 'utf-8';
      Response.ContentType:= 'application/json; charset=utf-8';
      Response.Content:= jstr;
      Response.SendResponse;
    end else
    begin
      Response.Title:= 'No Content';
      Response.StatusCode:= 204;
      Response.Content:= string.Empty;
      Response.SendResponse;
    end;
  end else
  begin
    Response.StatusCode:= 400;
    Response.Title:= 'bad request';
    Response.SendResponse;
  end;
end;

procedure TServerWebModule.ServerWebModuleobtener_productosAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  jstr: string;
begin
  if Request.MethodType = TMethodType.mtGet then
  begin
    jstr:= getProductosJSONString(Server.Conexion);
    if not jstr.IsEmpty then
    begin
      Response.Title:= 'OK';
      Response.StatusCode:= 200;
      Response.ContentEncoding:= 'utf-8';
      Response.ContentType:= 'application/json; charset=utf-8';
      Response.Content:= jstr;
      Response.SendResponse;
    end else
    begin
      Response.Title:= 'No Content';
      Response.StatusCode:= 204;
      Response.Content:= string.Empty;
      Response.SendResponse;
    end;
  end else
  begin
    Response.StatusCode:= 400;
    Response.Title:= 'bad request';
    Response.SendResponse;
  end;
end;

procedure TServerWebModule.ServerWebModuleobtener_proveedoresAction(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  jstr: string;
begin
  if Request.MethodType = TMethodType.mtGet then
  begin
    jstr:= getProveedoresJSONString(Server.Conexion);
    if not jstr.IsEmpty then
    begin
      Response.Title:= 'OK';
      Response.StatusCode:= 200;
      Response.ContentEncoding:= 'utf-8';
      Response.ContentType:= 'application/json; charset=utf-8';
      Response.Content:= jstr;
      Response.SendResponse;
    end else
    begin
      Response.Title:= 'No Content';
      Response.StatusCode:= 204;
      Response.Content:= string.Empty;
      Response.SendResponse;
    end;
  end else
  begin
    Response.StatusCode:= 400;
    Response.Title:= 'bad request';
    Response.SendResponse;
  end;
end;

end.
