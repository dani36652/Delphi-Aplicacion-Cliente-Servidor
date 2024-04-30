(*
  ESTA APP HACE USO DE SKIA4DELPHI: https://skia4delphi.org/
  AUTOR: DANIEL RODRIGUEZ HERNANDEZ
  FECHA: 25/04/2024
*)

unit UPrincipal;

interface

uses
  {$IFDEF ANDROID}
  Androidapi.JNI.Webkit, FMX.VirtualKeyboard,
  Androidapi.JNI.Print, Androidapi.JNI.Util,
  fmx.Platform.Android,
  Androidapi.jni,fmx.helpers.android, Androidapi.Jni.app,
  Androidapi.Jni.GraphicsContentViewText, Androidapi.JniBridge,
  Androidapi.JNI.Os, Androidapi.Jni.Telephony,
  Androidapi.JNI.JavaTypes,Androidapi.Helpers,
  Androidapi.JNI.Widget,System.Permissions,
  FMX.DialogService,Androidapi.Jni.Provider,Androidapi.Jni.Net,
  fmx.TextLayout,AndroidAPI.JNI.Support,
 {$ENDIF}
  UStyles, UJSONTool, UCustomProgressBar, System.Threading,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Layouts, System.Skia, FMX.Skia, FMX.Controls.Presentation, URecords,
  FMX.Edit, FMX.Effects, FMX.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.DApt,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView;

type
  TfrmPrincipal = class(TForm)
    Pantallas: TTabControl;
    Clientes: TTabItem;
    Proveedores: TTabItem;
    Gerentes: TTabItem;
    Productos: TTabItem;
    Login: TTabItem;
    rectFondoLogin: TRectangle;
    LYContenedorDatosLogin: TLayout;
    SVGClient: TSkSvg;
    StyleBook1: TStyleBook;
    RRIngresar_Login: TRoundRect;
    btnIngresar_Login: TButton;
    Menu_Principal: TTabItem;
    ShadowEffect1: TShadowEffect;
    SombraIngresar_Login: TShadowEffect;
    lblTituloInsercionBD_Login: TLabel;
    RdBtnUnoAUno_Login: TRadioButton;
    RdBtnTodos_Login: TRadioButton;
    RRURLServidor_Login: TRoundRect;
    SVGURLServidor_Login: TSkSvg;
    edtURLServidor_Login: TEdit;
    SombraURLServidor_Login: TShadowEffect;
    RRPuertoServidor_Login: TRoundRect;
    SVGPuertoServidor_Login: TSkSvg;
    edtPuertoServidor_Login: TEdit;
    SombraPuertoServidor_Login: TShadowEffect;
    RectFondoMenuPrincipal: TRectangle;
    RectFondoClientes: TRectangle;
    RectFondoProveedores: TRectangle;
    RectFondoGerentes: TRectangle;
    RectFondoProductos: TRectangle;
    rectToolbar_MenuPrincipal: TRectangle;
    btnAtras_MenuPrincipal: TButton;
    SVGAtras_MenuPrincipal: TSkSvg;
    lblTitulo_MenuPrincipal: TLabel;
    rectToolBar_Clientes: TRectangle;
    btnAtras_Clientes: TButton;
    SVGAtras_Clientes: TSkSvg;
    lblTitulo_Clientes: TLabel;
    rectToolBar_Proveedores: TRectangle;
    btnAtras_Proveedores: TButton;
    SVGAtras_Proveedores: TSkSvg;
    lblTitulo_Proveedores: TLabel;
    rectToolBar_Gerentes: TRectangle;
    btnAtras_Gerentes: TButton;
    SVGAtras_Gerentes: TSkSvg;
    lblTitulo_Gerentes: TLabel;
    rectToolBar_Productos: TRectangle;
    btnAtras_Productos: TButton;
    SVGAtras_Productos: TSkSvg;
    lblTitulo_Productos: TLabel;
    Conexion: TFDConnection;
    Qry: TFDQuery;
    ProgressDialog: TRectangle;
    RectProgressDialog: TRectangle;
    lblTituloProgressDialog: TLabel;
    lblMensajeProgressDialog: TLabel;
    LYProgressIndicator: TLayout;
    lblProgressPorcentaje: TLabel;
    lblProgressCantidad: TLabel;
    LYBotonesMenu: TGridPanelLayout;
    rectClientes_MPrincipal: TRectangle;
    btnClientes_MPrincipal: TButton;
    rectProveedores_MPrincipal: TRectangle;
    btnProveedores_MPrincipal: TButton;
    rectGerentes_MPrincipal: TRectangle;
    btnGerentes_MPrincipal: TButton;
    rectProductos_MPrincipal: TRectangle;
    btnProductos_MPrincipal: TButton;
    LoadingDialog: TRectangle;
    rectLoadingDialog: TRectangle;
    LoadingIndicator: TSkAnimatedImage;
    lblCargando: TLabel;
    LVProveedores: TListView;
    LVGerentes: TListView;
    LVProductos: TListView;
    LVClientes: TListView;
    procedure FormCreate(Sender: TObject);
    procedure edtURLServidor_LoginChangeTracking(Sender: TObject);
    procedure btnIngresar_LoginClick(Sender: TObject);
    procedure edtURLServidor_LoginExit(Sender: TObject);
    procedure btnClientes_MPrincipalClick(Sender: TObject);
    procedure btnProveedores_MPrincipalClick(Sender: TObject);
    procedure btnGerentes_MPrincipalClick(Sender: TObject);
    procedure PantallasChange(Sender: TObject);
    procedure btnAtras_MenuPrincipalClick(Sender: TObject);
    procedure btnAtras_ClientesClick(Sender: TObject);
    procedure btnProductos_MPrincipalClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Insercion_Multiple;
    procedure InsercionPorRegistro;
    procedure FinTask;
    procedure FinLoadingDlg;
    procedure ThreadOnTerminate(Sender: TObject);
    {$IFDEF ANDROID}
    function VerificarIgnoraOptimizacionesBateria(
    PackageName: JString): boolean;
    {$ENDIF}
    var
      URLServidor: string;
      ProgressBar: TCustomProgressBar;
  public
    { Public declarations }
    var
      ArrClientes: AClientes;
      ArrProveedores: AProveedores;
      ArrGerentes: AGerentes;
      ArrProductos: AProductos;
      JSON: TJSONTool;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
uses
  DB_Actions, Generales;

{$R *.fmx}

procedure TfrmPrincipal.btnAtras_ClientesClick(Sender: TObject);
begin
  Pantallas.ActiveTab:= Menu_Principal;
end;

procedure TfrmPrincipal.btnAtras_MenuPrincipalClick(Sender: TObject);
begin
  Pantallas.ActiveTab:= Login;
end;

procedure TfrmPrincipal.btnClientes_MPrincipalClick(Sender: TObject);
var
  ThreadClientes: TThread;
begin
  LoadingIndicator.Animation.Enabled:= True;
  LoadingDialog.Visible:= True;
  LoadingDialog.BringToFront;
  ThreadClientes:= TThread.CreateAnonymousThread(
  procedure
  var
    i: integer;
  begin
    SetLength(ArrClientes, 0);
    ArrClientes:= ObtenerClientes_DB(Conexion);

    if Length(ArrClientes) > 0 then
    begin
      Sincronizar(
      procedure
      begin
        LVClientes.Items.Clear;
        LVClientes.BeginUpdate;
      end);

      for i:= 0 to Length(ArrClientes) - 1 do
      begin
        Sincronizar(
        procedure
        var
          LVItem: TListViewItem;
        begin
          LVItem:= LVClientes.Items.Add;
          LVItem.Text:= ArrClientes[i].Nombre + ' ' + ArrClientes[i].Apellido;
          LVItem.Detail:= ArrClientes[i].Edad.ToString + ' años';
        end);
      end;

      Sincronizar(
      procedure
      begin
        LVClientes.EndUpdate;
        FinLoadingDlg;
        Pantallas.ActiveTab:= Clientes;
      end);
    end;
  end);
  ThreadClientes.FreeOnTerminate:= True;
  ThreadClientes.OnTerminate:= ThreadOnTerminate;
  {$IFDEF MSWINDOWS}
  ThreadClientes.Priority:= tpHigher;
  {$ENDIF}
  ThreadClientes.Start;
end;

procedure TfrmPrincipal.btnGerentes_MPrincipalClick(Sender: TObject);
var
  ThreadGerentes: TThread;
begin
  LoadingIndicator.Animation.Enabled:= True;
  LoadingDialog.Visible:= True;
  LoadingDialog.BringToFront;

  ThreadGerentes:= TThread.CreateAnonymousThread(
  procedure
  var
    i: integer;
  begin
    SetLength(ArrGerentes, 0);
    ArrGerentes:= ObtenerGerentes_DB(Conexion);

    if Length(ArrGerentes) > 0 then
    begin

      Sincronizar(
      procedure
      begin
        LVGerentes.Items.Clear;
        LVGerentes.BeginUpdate;
      end);

      for i:= 0 to Length(ArrGerentes) - 1 do
      begin
        Sincronizar(
        procedure
        var
          LVItem: TListViewItem;
        begin
          LVItem:= LVGerentes.Items.Add;
          LVItem.Text:= ArrGerentes[i].Nombre + ' ' + ArrGerentes[i].Apellido;
          LVItem.Detail:= ArrGerentes[i].Edad.ToString + ' años';
        end);
      end;

      Sincronizar(
      procedure
      begin
        LVGerentes.EndUpdate;
        FinLoadingDlg;
        Pantallas.ActiveTab:= Gerentes;
      end);
    end;
  end);
  ThreadGerentes.FreeOnTerminate:= True;
  ThreadGerentes.OnTerminate:= ThreadOnTerminate;
  {$IFDEF MSWINDOWS}
  ThreadGerentes.Priority:= tpHigher;
  {$ENDIF}
  ThreadGerentes.Start;
end;

procedure TfrmPrincipal.btnIngresar_LoginClick(Sender: TObject);
var 
  ThreadLogin: TThread;
begin
  URLServidor:= edtURLServidor_Login.Text + ':' + edtPuertoServidor_Login.Text;
  JSON.URLServidor:= URLServidor.Trim;

  LoadingIndicator.Animation.Enabled:= True;
  LoadingDialog.Visible:= True;
  LoadingDialog.BringToFront;

  ThreadLogin:= TThread.CreateAnonymousThread(
  procedure
  begin
    if JSON.CheckConnection then
    begin
      //Obtención de los datos provenientes del servidor
      ArrClientes:= JSON.ObtenerClientes;
      ArrProveedores:= JSON.ObtenerProveedores;
      ArrGerentes:= JSON.ObtenerGerentes;
      ArrProductos:= JSON.ObtenerProductos;

      LimpiarTabla(Conexion, 'clientes');
      LimpiarTabla(Conexion, 'proveedores');
      LimpiarTabla(Conexion, 'gerentes');
      LimpiarTabla(Conexion, 'productos');

      Sincronizar(
      procedure
      begin
        LoadingIndicator.Animation.Enabled:= False;
        LoadingDialog.Visible:= False;

        lblMensajeProgressDialog.Text:= 'Sincronizando...';
        lblProgressCantidad.Text:= '0/0';
        lblProgressPorcentaje.Text:= '0%';
        ProgressBar.Value:= 0;
        ProgressDialog.Visible:= True;
        ProgressDialog.BringToFront;
      end);

      if RdBtnUnoAUno_Login.IsChecked then
        InsercionPorRegistro
      else
      if RdBtnTodos_Login.IsChecked then
        Insercion_Multiple;

      Sincronizar(
      procedure
      begin
        FinLoadingDlg;
        FinTask;
        edtURLServidor_Login.Text:= string.Empty;
        Pantallas.ActiveTab:= Menu_Principal;
      end);
    end else
    begin
      Sincronizar(
      procedure
      begin
        FinLoadingDlg;
        FinTask;
        ShowMessage('Revise su conexión con el servidor');
      end);
    end;
  end);
  ThreadLogin.FreeOnTerminate:= True;
  ThreadLogin.OnTerminate:= ThreadOnTerminate;
  {$IFDEF MSWINDOWS}
  ThreadLogin.Priority:= tpHigher;
  {$ENDIF}
  ThreadLogin.Start;
end;

procedure TfrmPrincipal.btnProductos_MPrincipalClick(Sender: TObject);
var
  ThreadProductos: TThread;
begin
  LoadingIndicator.Animation.Enabled:= True;
  LoadingDialog.Visible:= True;
  LoadingDialog.BringToFront;
  ThreadProductos:= TThread.CreateAnonymousThread(
  procedure
  var
    i: integer;
  begin
    SetLength(ArrProductos, 0);
    ArrProductos:= ObtenerProductos_DB(Conexion);

    if Length(ArrProductos) > 0 then
    begin
      Sincronizar(
      procedure
      begin
        LVProductos.Items.Clear;
        LVProductos.BeginUpdate;
      end);

      for i:= 0 to Length(ArrProductos) - 1 do
      begin
        Sincronizar(
        procedure
        var
          LVItem: TListViewItem;
        begin
          LVItem:= LVProductos.Items.Add;
          LVItem.Text:= ArrProductos[i].Descripcion;
          LVItem.Detail:= '$' + ArrProductos[i].Precio_Venta.ToString;
        end);
      end;

      Sincronizar(
      procedure
      begin
        LVProductos.EndUpdate;
        FinLoadingDlg;
        Pantallas.ActiveTab:= Productos;
      end);
    end;
  end);
  ThreadProductos.FreeOnTerminate:= True;
  ThreadProductos.OnTerminate:= ThreadOnTerminate;
  {$IFDEF MSWINDOWS}
  ThreadProductos.Priority:= tpHigher;
  {$ENDIF}
  ThreadProductos.Start;
end;

procedure TfrmPrincipal.btnProveedores_MPrincipalClick(Sender: TObject);
var
  ThreadProveedores: TThread;
begin
  LoadingIndicator.Animation.Enabled:= True;
  LoadingDialog.Visible:= True;
  LoadingDialog.BringToFront;
  ThreadProveedores:= TThread.CreateAnonymousThread(
  procedure
  var
    i: integer;
  begin
    SetLength(ArrProveedores, 0);
    ArrProveedores:= ObtenerProveedores_DB(Conexion);
    if Length(ArrProveedores) > 0 then
    begin
      Sincronizar(
      procedure
      begin
        LVProveedores.Items.Clear;
        LVProveedores.BeginUpdate;
      end);

      for i:= 0 to Length(ArrProveedores) - 1 do
      begin
        Sincronizar(
        procedure
        var
          LVItem: TListViewItem;
        begin
          LVItem:= LVProveedores.Items.Add;
          LVItem.Text:= ArrProveedores[i].Nombre + ' ' + ArrProveedores[i].Apellido;
          LVItem.Detail:= 'ID: ' + ArrProveedores[i].ID.ToString;
        end);
      end;

      Sincronizar(
      procedure
      begin
        LVProveedores.EndUpdate;
        FinLoadingDlg;
        Pantallas.ActiveTab:= Proveedores;
      end);
    end;
  end);
  ThreadProveedores.FreeOnTerminate:= True;
  ThreadProveedores.OnTerminate:= ThreadOnTerminate;
  {$IFDEF MSWINDOWS}
  ThreadProveedores.Priority:= tpHigher;
  {$ENDIF}
  ThreadProveedores.Start;
end;

procedure TfrmPrincipal.edtURLServidor_LoginChangeTracking(Sender: TObject);
begin
  btnIngresar_Login.Enabled:= (not edtURLServidor_Login.Text.Trim.IsEmpty) and
  (not edtPuertoServidor_Login.Text.Trim.IsEmpty) and
  (edtURLServidor_Login.Text.Trim.StartsWith('http://') or
  edtURLServidor_Login.Text.Trim.StartsWith('https://')) and
  (RdBtnUnoAUno_Login.IsChecked or RdBtnTodos_Login.IsChecked);
end;

procedure TfrmPrincipal.edtURLServidor_LoginExit(Sender: TObject);
begin
  if (not (edtURLServidor_Login.Text.Trim.StartsWith('http://') or
  edtURLServidor_Login.Text.Trim.StartsWith('https://'))) and
  (not edtURLServidor_Login.Text.Trim.IsEmpty) then
  begin
    ShowMessage('URL incorrecta, falta protocolo (http:// ó https://)');
  end;
end;

procedure TfrmPrincipal.FinLoadingDlg;
begin
  LoadingIndicator.Animation.Enabled:= False;
  LoadingDialog.Visible:= False;
end;

{$IFDEF ANDROID}
function TfrmPrincipal.VerificarIgnoraOptimizacionesBateria(
PackageName: JString): boolean;
var PowerManager:JPowerManager;
begin
  PowerManager:=TJPowerManager.Wrap((TAndroidHelper.Context.getSystemService(
  TJContext.JavaClass.POWER_SERVICE)as ILocalObject).GetObjectID);
  Result:= PowerManager.isIgnoringBatteryOptimizations(PackageName);
end;
{$ENDIF}

procedure TfrmPrincipal.FinTask;
begin
  ProgressDialog.Visible:= False;
  lblMensajeProgressDialog.Text:= 'Sincronizando...';
  lblProgressCantidad.Text:= '0/0';
  lblProgressPorcentaje.Text:= '0%';
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
{$IFDEF ANDROID}
var
  Intent: JIntent;
{$ENDIF}
begin
  if CrearTablas(Conexion) then
  begin
    ProgressBar:= TCustomProgressBar.Create(Self);
    ProgressBar.Parent:= RectProgressDialog;
    ProgressBar.Align:= TAlignLayout.VertCenter;
    ProgressBar.Margins.Left:= 20;
    ProgressBar.Margins.Right:= 20;
    ProgressBar.Color:= TAlphaColors.Salmon;
    ProgressBar.X_Radius:= 5;
    ProgressBar.Y_Radius:= 5;
    JSON:= TJSONTool.Create(Self);
    SetLength(ArrClientes, 0);
    SetLength(ArrProveedores, 0);
    SetLength(ArrGerentes, 0);
    SetLength(ArrProductos, 0);
    Pantallas.ActiveTab:= Login;
    {$IFDEF ANDROID}
    setStatusBarColor($FFF96B5B);
    {$ENDIF}
    FondoRectangulos(Self);
    Pantallas.ActiveTab:= Login;
    {$IFDEF ANDROID}
    if not VerificarIgnoraOptimizacionesBateria(
    TAndroidHelper.Activity.getPackageName) then
    begin
      Intent:=TJIntent.Create;
      Intent.setAction(TJSettings.JavaClass.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS);
      Intent.setData(TJnet_Uri.JavaClass.fromParts(StringToJString('package'),
      TAndroidHelper.Activity.getPackageName, nil));
      TAndroidHelper.Activity.startActivity(Intent);
    end;
    {$ENDIF}
  end else Application.Terminate;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    case Pantallas.TabIndex of
      1:
        begin
          Pantallas.ActiveTab:= Login;
          Key:= 0;
        end;

      2..5:
        begin
          Pantallas.ActiveTab:= Menu_Principal;
          Key:= 0;
        end;
    end;
  end;
end;

procedure TfrmPrincipal.InsercionPorRegistro;
var   
  i: integer;
begin
  (* 
    Aquí los arreglos de datos son accesibles pero todo dependerá
    del contexto, funcionalidad y finalidad de su app.
  *)  
  Conexion.StartTransaction;
  if Length(ArrClientes) > 0 then 
  begin
    Sincronizar(
    procedure
    begin
      ProgressBar.Value:= 0;
      ProgressBar.Min:= 0;
      ProgressBar.Max:= Length(ArrClientes);
      lblMensajeProgressDialog.Text:= 'Sincronizando Clientes';
      lblProgressCantidad.Text:= '0/' + IntToStr(Length(ArrClientes));
      lblProgressPorcentaje.Text:= '0%';
    end);

    for i:= 0 to Length(ArrClientes) - 1 do 
    begin 
      if InsertarCliente(Qry, ArrClientes[i].ID, ArrClientes[i].Nombre, ArrClientes[i].Apellido,
      ArrClientes[i].Edad, ArrClientes[i].Sexo) then
      begin
        Sincronizar(
        procedure
        begin
          ProgressBar.Value:= ProgressBar.Value + 1;
          lblProgressCantidad.Text:= IntToStr(i + 1) + '/' + IntToStr(Length(ArrClientes));
          (*
            PUEDE MODIFICAR EL ÚLTIMO PARÁMETRO DE FLOATTOSTRF() PARA MOSTRAR EL AVANCE
            CON EL NÚMERO DE DECIMALES QUE DESEE; EN ESTE CASO YO LO ESTABLECÍ EN 0
          *)
          lblProgressPorcentaje.Text:= FloatToStrF(ProgressBar.Percent, ffNumber, 3, 0) + '%';
        end);
      end else
      begin
        Sincronizar(
        procedure
        begin
          ShowMessage('Fallo de inserción en la tabla "cleintes"');
        end);
        break;
      end;
    end;
  end;

  if Length(ArrProveedores) > 0 then 
  begin
    Sincronizar(
    procedure
    begin
      ProgressBar.Value:= 0;
      ProgressBar.Min:= 0;
      ProgressBar.Max:= Length(ArrProveedores);
      lblMensajeProgressDialog.Text:= 'Sincronizando Proveedores';
      lblProgressCantidad.Text:= '0/' + IntToStr(Length(ArrProveedores));
      lblProgressPorcentaje.Text:= '0%';
    end);

    for i:= 0 to Length(ArrProveedores) - 1 do 
    begin
      if InsertarProveedor(Qry, ArrProveedores[i].ID, ArrProveedores[i].Nombre,
      ArrProveedores[i].Apellido, ArrProveedores[i].Edad, ArrProveedores[i].Sexo) then
      begin
        Sincronizar(
        procedure
        begin
          ProgressBar.Value:= ProgressBar.Value + 1;
          lblProgressCantidad.Text:= IntToStr(i + 1) + '/' + IntToStr(Length(ArrProveedores));
          lblProgressPorcentaje.Text:= FloatToStrF(ProgressBar.Percent, ffNumber, 3, 0) + '%';
        end);
      end else
      begin
        Sincronizar(
        procedure
        begin
          ShowMessage('Error de inserción en la tabla "proveedores"');
        end);
        break;
      end;
    end;
  end;

  if Length(ArrGerentes) > 0 then 
  begin
    Sincronizar(
    procedure
    begin
      ProgressBar.Value:= 0;
      ProgressBar.Min:= 0;
      ProgressBar.Max:= Length(ArrGerentes);
      lblMensajeProgressDialog.Text:= 'Sincronizando Gerentes';
      lblProgressCantidad.Text:= '0/' + IntToStr(Length(ArrGerentes));
      lblProgressPorcentaje.Text:= '0%';
    end);

    for i:= 0 to Length(ArrGerentes) - 1 do 
    begin
      if InsertarGerente(Qry, ArrGerentes[i].ID, ArrGerentes[i].Nombre,
      ArrGerentes[i].Apellido, ArrGerentes[i].Edad, ArrGerentes[i].Sexo) then
      begin
        Sincronizar(
        procedure
        begin
          ProgressBar.Value:= ProgressBar.Value + 1;
          lblProgressCantidad.Text:= IntToStr(i + 1) + '/' + IntToStr(Length(ArrGerentes));
          lblProgressPorcentaje.Text:= FloatToStrF(ProgressBar.Percent, ffNumber, 3, 0) + '%';
        end);
      end else
      begin
        Sincronizar(
        procedure
        begin
          ShowMessage('Error de inserción en la tabla "gerentes"');
        end);
        break;
      end;
    end;
  end;

  if Length(ArrProductos) > 0 then 
  begin
    Sincronizar(
    procedure
    begin
      ProgressBar.Value:= 0;
      ProgressBar.Min:= 0;
      ProgressBar.Max:= Length(ArrProductos);
      lblMensajeProgressDialog.Text:= 'Sincronizando Productos';
      lblProgressCantidad.Text:= '0/' + IntToStr(Length(ArrProductos));
      lblProgressPorcentaje.Text:= '0%';
    end);

    for i:= 0 to Length(ArrProductos) - 1 do 
    begin
      if InsertarProducto(Qry, ArrProductos[i].ID, ArrProductos[i].Descripcion,
      ArrProductos[i].Existencia, ArrProductos[i].Precio_Compra, ArrProductos[i].Precio_Venta) then
      begin
        Sincronizar(
        procedure
        begin
          ProgressBar.Value:= ProgressBar.Value + 1;
          lblProgressCantidad.Text:= IntToStr(i + 1) + '/' + IntToStr(Length(ArrProductos));
          lblProgressPorcentaje.Text:= FloatToStrF(ProgressBar.Percent, ffNumber, 3, 0) + '%';
        end);
      end else
      begin
        Sincronizar(
        procedure
        begin
          ShowMessage('Error de inserción en la tabla "productos"');
        end);
        break;
      end;
    end;

    Sleep(500); //Esta pausa permite ver la finalización de las inserciones cuando llega al 100%
  end;
  Conexion.Commit;
end;

procedure TfrmPrincipal.Insercion_Multiple;
var
  SQL: string;
  i: integer;
begin
  {
    En éste método el progreso de inserción está quemado por código
    para darle más simplicidad al ejemplo.
  }
  Conexion.StartTransaction;
  (*
    AQUÍ HAY QUE ARMAR EL SQL PARA LA INSERCIÓN MÚLTIPLE MAS O MENOS CON ESTA ESTRUCTURA
    INSERT INTO tabla (campo1, campo2, campo3) VALUES
    (valor1, valor2, valor3),
    (valor1, valor2, valor3),
    (valor1, valor2, valor3)
  *)
  Sincronizar(
  procedure
  begin
    ProgressBar.Value:= 0;
    ProgressBar.Min:= 0;
    ProgressBar.Max:= 100;
  end);

  //INSERCIÓN CLIENTES
  if Length(ArrClientes) > 0 then
  begin
    SQL:= string.Empty;
    SQL:= 'INSERT INTO clientes (id, nombre, apellido, edad, sexo) VALUES ';

    for i:= 0 to Length(ArrClientes) - 1 do
    begin
      if i < Length(ArrClientes) - 1 then
        SQL:= SQL + '(NULL, "' + ArrClientes[i].Nombre + '", "' +
        ArrClientes[i].Apellido + '", ' + ArrClientes[i].Edad.ToString + ', ' +
        '"Unknown"),' + sLineBreak else
      if i = Length(ArrClientes) - 1 then
        SQL:= SQL + '(NULL, "' + ArrClientes[i].Nombre + '", "' +
        ArrClientes[i].Apellido + '", ' + ArrClientes[i].Edad.ToString + ', ' +
        '"Unknown")';
    end;

    if InsercionMultiple(Conexion, SQL) then
    begin
      Sincronizar(
      procedure
      begin
        lblMensajeProgressDialog.Text:= 'Sincronizando Clientes';
        ProgressBar.Value:= 25;
        lblProgressCantidad.Text:= '1/4';
        lblProgressPorcentaje.Text:= '25%';
      end);
    end else
    begin
      Sincronizar(
      procedure
      begin
        ShowMessage('Fallo de inserción en la tabla "clientes"');
      end);
    end;
  end;

  //INSERCIÓN PROVEEDORES
  if Length(ArrProveedores) > 0 then
  begin
    SQL:= string.Empty;
    SQL:= 'INSERT INTO proveedores (id, nombre, apellido, edad, sexo) VALUES ';

    for i:= 0 to Length(ArrProveedores) - 1 do
    begin
      if i < Length(ArrProveedores) - 1 then
        SQL:= SQL + '(NULL, "' + ArrProveedores[i].Nombre + '", "' +
        ArrProveedores[i].Apellido + '", ' + ArrProveedores[i].Edad.ToString +
        ', "Unknown"),' + sLineBreak else
      if i = Length(ArrProveedores) - 1 then
        SQL:= SQL + '(NULL, "' + ArrProveedores[i].Nombre + '", "' +
        ArrProveedores[i].Apellido + '", ' + ArrProveedores[i].Edad.ToString +
        ', "Unknown")';
    end;

    if InsercionMultiple(Conexion, SQL) then
    begin
      Sincronizar(
      procedure
      begin
        lblMensajeProgressDialog.Text:= 'Sincronizando Proveedores';
        ProgressBar.Value:= 50;
        lblProgressCantidad.Text:= '2/4';
        lblProgressPorcentaje.Text:= '50%';
      end);
    end else
    begin
      Sincronizar(
      procedure
      begin
        ShowMessage('Fallo de inserción en la tabla "proveedores"');
      end);
    end;
  end;

  //INSERCIÓN GERENTES
  if Length(ArrGerentes) > 0 then
  begin
    SQL:= string.Empty;
    SQL:= 'INSERT INTO gerentes (id, nombre, apellido, edad, sexo) VALUES ';

    for i:= 0 to Length(ArrGerentes) - 1 do
    begin
      if i < Length(ArrGerentes) - 1 then
        SQL:= SQL + '(NULL, "' + ArrGerentes[i].Nombre + '", "' +
        ArrGerentes[i].Apellido + '", ' + ArrGerentes[i].Edad.ToString +
        ', "Unknown"),' + sLineBreak else
      if i = Length(ArrGerentes) - 1 then
        SQL:= SQL + '(NULL, "' + ArrGerentes[i].Nombre + '", "' +
        ArrGerentes[i].Apellido + '", ' + ArrGerentes[i].Edad.ToString +
        ', "Unknown")';
    end;

    if InsercionMultiple(Conexion, SQL) then
    begin
      Sincronizar(
      procedure
      begin
        lblMensajeProgressDialog.Text:= 'Sincronizando Gerentes';
        ProgressBar.Value:= 75;
        lblProgressCantidad.Text:= '3/4';
        lblProgressPorcentaje.Text:= '75%';
      end);
    end else
    begin
      Sincronizar(
      procedure
      begin
        ShowMessage('Fallo de inserción en la tabla "gerentes"');
      end);
    end;
  end;

  //INSERCIÓN PRODUCTOS
  if Length(ArrProductos) > 0 then
  begin
    SQL:= string.Empty;
    SQL:= 'INSERT INTO productos (id, descripcion, existencia, precio_compra, ' +
    'precio_venta) VALUES ';

    for i:= 0 to Length(ArrProductos) - 1 do
    begin
      if i < Length(ArrProductos) - 1 then
        SQL:= SQL + '(NULL, "' + ArrProductos[i].Descripcion + '", ' +
        ArrProductos[i].Existencia.ToString + ', ' + ArrProductos[i].Precio_Compra.ToString +
        ', ' + ArrProductos[i].Precio_Venta.ToString + '),' + sLineBreak else
      if i = Length(ArrProductos) - 1 then
        SQL:= SQL + '(NULL, "' + ArrProductos[i].Descripcion + '", ' +
        ArrProductos[i].Existencia.ToString + ', ' + ArrProductos[i].Precio_Compra.ToString +
        ', ' + ArrProductos[i].Precio_Venta.ToString + ')';
    end;

    if InsercionMultiple(Conexion, SQL) then
    begin
      Sincronizar(
      procedure
      begin
        lblMensajeProgressDialog.Text:= 'Sincronizando Productos';
        ProgressBar.Value:= 100;
        lblProgressCantidad.Text:= '4/4';
        lblProgressPorcentaje.Text:= '100%';
      end);
    end else
    begin
      Sincronizar(
      procedure
      begin
        ShowMessage('Fallo de inserción en la tabla "productos"');
      end);
    end;
  end;

  Conexion.Commit;
end;

procedure TfrmPrincipal.PantallasChange(Sender: TObject);
begin
  {$IFDEF MSWINDOWS}
  Self.Caption:= TTabControl(Sender).ActiveTab.Text;
  {$ENDIF}
end;

procedure TfrmPrincipal.ThreadOnTerminate(Sender: TObject);
begin
  Sincronizar(
  procedure
  begin
    FinLoadingDlg;
    FinTask;
  end);
end;

end.
