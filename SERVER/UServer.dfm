object Server: TServer
  Left = 271
  Top = 114
  Caption = 'Server'
  ClientHeight = 235
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object lblPort: TLabel
    Left = 24
    Top = 66
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object ButtonStart: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object ButtonStop: TButton
    Left = 105
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = ButtonStopClick
  end
  object EditPort: TEdit
    Left = 24
    Top = 85
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '50710'
  end
  object ButtonOpenBrowser: TButton
    Left = 24
    Top = 128
    Width = 107
    Height = 25
    Caption = 'Open Browser'
    TabOrder = 3
    OnClick = ButtonOpenBrowserClick
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 216
    Width = 399
    Height = 19
    Panels = <
      item
        Text = 'Current IP Address:'
        Width = 110
      end
      item
        Text = '127.0.0.1'
        Width = 50
      end>
    ExplicitTop = 215
    ExplicitWidth = 395
  end
  object ApplicationEvents: TApplicationEvents
    OnIdle = ApplicationEventsIdle
    Left = 288
    Top = 24
  end
  object Conexion: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 264
    Top = 112
  end
end
