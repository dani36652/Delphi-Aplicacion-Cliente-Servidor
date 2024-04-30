unit URecords;

interface
uses
  System.Classes, System.Types, System.SysConst, System.SysUtils,
  System.StrUtils, System.Generics.Collections;

type RCliente = record
  private
  public
    ID: integer;
    Nombre: string;
    Apellido: string;
    Edad: integer;
    Sexo: string;
end;

type AClientes = array of RCliente;

type RProveedor = record
  private
  public
    ID: integer;
    Nombre: string;
    Apellido: string;
    Edad: integer;
    Sexo: string;
end;

type AProveedores = array of RProveedor;

type RGerente = record
  private
  public
    ID: integer;
    Nombre: string;
    Apellido: string;
    Edad: integer;
    Sexo: string;
end;

type AGerentes = array of RGerente;

type RProducto = record
  private
  public
    ID: integer;
    Descripcion: string;
    Existencia: integer;
    Precio_Compra: Double;
    Precio_Venta: Double;
end;

type AProductos = array of RProducto;

implementation

end.
