unit UJSONTool;

interface
uses
  URecords, URest,
  System.Classes, System.Types, System.SysConst, System.SysUtils,
  System.StrUtils, System.Generics.Collections, System.JSON,
  System.JSON.Types, System.JSON.Converters, System.JSON.Builders;

type TJSONTool = class(TComponent)
  private
    BaseURL: string;
  public
    constructor Create(AOwner: TComponent); override;
    function ObtenerClientes: AClientes;
    function ObtenerProveedores: AProveedores;
    function ObtenerGerentes: AGerentes;
    function ObtenerProductos: AProductos;
    function CheckConnection: boolean;
    property URLServidor: string read BaseURL write BaseURL;
end;

implementation
uses
  Generales;

{ TJSONTool }

function TJSONTool.CheckConnection: boolean;
var
  REST: TREST;
begin
  REST:= TREST.Create(nil);
  try
    try
      REST.SetBaseURL(BaseURL);
      REST.GET('', 'checkconnection');
      Result:= REST.Respuesta.Code = 200;
    except on E: exception do
      begin
        EscribirLogExcepciones(E.ClassName + ': ' + E.Message);
        Result:= False;
      end;
    end;
  finally
    FreeAndNil(REST);
  end;
end;

constructor TJSONTool.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BaseURL:= string.Empty;
end;

function TJSONTool.ObtenerClientes: AClientes;
var
  REST: TREST;
  JSONObj: TJSONObject;
  JArray: TJSONArray;
  i: integer;
begin
  REST:= TREST.Create(nil);
  try
    try
      REST.SetBaseURL(BaseURL);
      REST.GET('', 'clientes');
      if REST.Respuesta.Code = 200 then
      begin
        SetLength(Result, 0);
        JSONObj:= TJSONObject.ParseJSONValue(REST.Respuesta.Mensaje) as TJSONObject;
        JArray:= JSONObj.Values['clientes'] as TJSONArray;

        if JArray.Count > 0 then
        begin
          for i:= 0 to JArray.Count - 1 do
          begin
            SetLength(Result, i + 1);
            Result[i].ID:= TJSONObject(JArray.Items[i]).Values['id'].Value.ToInteger;
            Result[i].Nombre:= TJSONObject(JArray.Items[i]).Values['nombre'].Value;
            Result[i].Apellido:= TJSONObject(JArray.Items[i]).Values['apellido'].Value;
            Result[i].Edad:= TJSONObject(JArray.Items[i]).Values['edad'].Value.ToInteger;
            Result[i].Sexo:= TJSONObject(JArray.Items[i]).Values['sexo'].Value;
          end;
        end;
      end else SetLength(Result, 0);
    except on E: exception do
      begin
        EscribirLogExcepciones(E.ClassName + ': ' + E.Message);
        SetLength(Result, 0);
      end;
    end;
  finally
    FreeAndNil(REST); //Liberar en memoria
    if Assigned(JSONObj) then
      FreeAndNil(JSONObj);
  end;
end;

function TJSONTool.ObtenerGerentes: AGerentes;
var
  REST: TREST;
  JSONObj: TJSONObject;
  JArray: TJSONArray;
  i: integer;
begin
  REST:= TREST.Create(nil);
  try
    try
      REST.SetBaseURL(BaseURL);
      REST.GET('', 'gerentes');
      if REST.Respuesta.Code = 200 then
      begin
        SetLength(Result, 0);
        JSONObj:= TJSONObject.ParseJSONValue(REST.Respuesta.Mensaje) as TJSONObject;
        JArray:= JSONObj.Values['gerentes'] as TJSONArray;

        if JArray.Count > 0 then
        begin
          for i:= 0 to JArray.Count - 1 do
          begin
            SetLength(Result, i + 1);
            Result[i].ID:= TJSONObject(JArray.Items[i]).Values['id'].Value.ToInteger;
            Result[i].Nombre:= TJSONObject(JArray.Items[i]).Values['nombre'].Value;
            Result[i].Apellido:= TJSONObject(JArray.Items[i]).Values['apellido'].Value;
            Result[i].Edad:= TJSONObject(JArray.Items[i]).Values['edad'].Value.ToInteger;
            Result[i].Sexo:= TJSONObject(JArray.Items[i]).Values['sexo'].Value;
          end;
        end;
      end else SetLength(Result, 0);
    except on E: exception do
      begin
        EscribirLogExcepciones(E.ClassName + ': ' + E.Message);
        SetLength(Result, 0);
      end;
    end;
  finally
    FreeAndNil(REST); //Liberar en memoria
    if Assigned(JSONObj) then
      FreeAndNil(JSONObj);
  end;
end;

function TJSONTool.ObtenerProductos: AProductos;
var
  REST: TREST;
  JSONObj: TJSONObject;
  JArray: TJSONArray;
  i: integer;
begin
  REST:= TREST.Create(nil);
  try
    try
      REST.SetBaseURL(BaseURL);
      REST.GET('', 'productos');
      if REST.Respuesta.Code = 200 then
      begin
        SetLength(Result, 0);
        JSONObj:= TJSONObject.ParseJSONValue(REST.Respuesta.Mensaje) as TJSONObject;
        JArray:= JSONObj.Values['productos'] as TJSONArray;

        if JArray.Count > 0 then
        begin
          for i:= 0 to JArray.Count - 1 do
          begin
            SetLength(Result, i + 1);
            Result[i].ID:= TJSONObject(JArray.Items[i]).Values['id'].Value.ToInteger;
            Result[i].Descripcion:= TJSONObject(JArray.Items[i]).Values['descripcion'].Value;
            Result[i].Existencia:= TJSONObject(JArray.Items[i]).Values['existencia'].Value.ToInteger;
            Result[i].Precio_Compra:= TJSONObject(JArray.Items[i]).Values['precio_compra'].Value.ToDouble;
            Result[i].Precio_Venta:= TJSONObject(JArray.Items[i]).Values['precio_venta'].Value.ToDouble;
          end;
        end;
      end else SetLength(Result, 0);
    except on E: exception do
      begin
        EscribirLogExcepciones(E.ClassName + ': ' + E.Message);
        SetLength(Result, 0);
      end;
    end;
  finally
    FreeAndNil(REST); //Liberar en memoria
    if Assigned(JSONObj) then
      FreeAndNil(JSONObj);
  end;
end;

function TJSONTool.ObtenerProveedores: AProveedores;
var
  REST: TREST;
  JSONObj: TJSONObject;
  JArray: TJSONArray;
  i: integer;
begin
  REST:= TREST.Create(nil);
  try
    try
      REST.SetBaseURL(BaseURL);
      REST.GET('', 'proveedores');
      if REST.Respuesta.Code = 200 then
      begin
        SetLength(Result, 0);
        JSONObj:= TJSONObject.ParseJSONValue(REST.Respuesta.Mensaje) as TJSONObject;
        JArray:= JSONObj.Values['proveedores'] as TJSONArray;

        if JArray.Count > 0 then
        begin
          for i:= 0 to JArray.Count - 1 do
          begin
            SetLength(Result, i + 1);
            Result[i].ID:= TJSONObject(JArray.Items[i]).Values['id'].Value.ToInteger;
            Result[i].Nombre:= TJSONObject(JArray.Items[i]).Values['nombre'].Value;
            Result[i].Apellido:= TJSONObject(JArray.Items[i]).Values['apellido'].Value;
            Result[i].Edad:= TJSONObject(JArray.Items[i]).Values['edad'].Value.ToInteger;
            Result[i].Sexo:= TJSONObject(JArray.Items[i]).Values['sexo'].Value;
          end;
        end;
      end else SetLength(Result, 0);
    except on E: exception do
      begin
        EscribirLogExcepciones(E.ClassName + ': ' + E.Message);
        SetLength(Result, 0);
      end;
    end;
  finally
    FreeAndNil(REST); //Liberar en memoria
    if Assigned(JSONObj) then
      FreeAndNil(JSONObj);
  end;
end;

end.
