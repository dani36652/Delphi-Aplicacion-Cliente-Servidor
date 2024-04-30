unit UStyles;

interface
Uses
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
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.UIConsts, FMX.Forms,
  FMX.Objects, FMX.Types, FMX.Edit, FMX.Memo, FMX.ListBox, FMX.StdCtrls,
  FMX.Controls, FMX.Graphics, FMX.Grid, FMX.Header;

{$IFDEF ANDROID}
procedure setStatusBarColor(AColor: TAlphaColor);
{$ENDIF}
procedure FondoRectangulos(ObjetoRect: TRectangle); overload;
procedure FondoRectangulos(AOwner: TForm); overload;

implementation

{$IFDEF ANDROID}
procedure setStatusBarColor(AColor: TAlphaColor);
var
  window: JWindow;
begin
  try
    window:= TAndroidHelper.Activity.getWindow;
    if Assigned(window) then
    begin
      window.setStatusBarColor(TAndroidHelper.AlphaColorToJColor(AColor));
    end;
  except

  end;
end;
{$ENDIF}

procedure FondoRectangulos(ObjetoRect: TRectangle);
begin
  {
    APLICAR COLORES GRADIENTES A BOTONES
  }
  //Color azul marino
  if ObjetoRect.Fill.Color = TAlphaColors.Salmon then
  begin
    ObjetoRect.Fill.Kind := TBrushKind.Gradient;
    ObjetoRect.Fill.Gradient.Points.Points[0].Color := TAlphaColors.Salmon;
    ObjetoRect.Fill.Gradient.Points.Points[0].Offset := 0.000000000000000000;
    ObjetoRect.Fill.Gradient.Points.Points[1].Color := $FFF96B5B;
    ObjetoRect.Fill.Gradient.Points.Points[1].Offset := 1.000000000000000000;
  end;
end;

procedure FondoRectangulos(AOwner: TForm);
var
  i: integer;
begin
  for i:= 0 to AOwner.ComponentCount - 1 do
  begin
    if AOwner.Components[i].ClassType = TRectangle then
    begin
      if TRectangle(AOwner.Components[i]).Fill.Color = TAlphaColors.Salmon then
      begin
        TRectangle(AOwner.Components[i]).Fill.Kind := TBrushKind.Gradient;
        TRectangle(AOwner.Components[i]).Fill.Gradient.Points.Points[0].Color := TAlphaColors.Salmon;
        TRectangle(AOwner.Components[i]).Fill.Gradient.Points.Points[0].Offset := 0.000000000000000000;
        TRectangle(AOwner.Components[i]).Fill.Gradient.Points.Points[1].Color := $FFF96B5B;
        TRectangle(AOwner.Components[i]).Fill.Gradient.Points.Points[1].Offset := 1.000000000000000000;
      end;
    end;
  end;
end;

end.
