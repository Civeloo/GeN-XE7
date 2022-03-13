object mainForm: TmainForm
  Left = 354
  Top = 386
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 232
  ClientWidth = 247
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 247
    Height = 232
    Align = alClient
    Color = clWhite
    DragCursor = crHelp
    ParentBackground = False
    TabOrder = 0
    object Label5: TLabel
      Left = 9
      Top = 8
      Width = 74
      Height = 13
      Caption = 'Sistema GeN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
    object Label6: TLabel
      Left = 134
      Top = 8
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
    object Label7: TLabel
      Left = 9
      Top = 102
      Width = 109
      Height = 13
      Caption = 'Copyright Civeloo 2019'
      IsControl = True
    end
    object Label3: TLabel
      Left = 8
      Top = 128
      Width = 115
      Height = 13
      Cursor = crHandPoint
      Caption = 'http://www.civeloo.com'
      OnClick = Label3Click
    end
    object Label4: TLabel
      Left = 177
      Top = 192
      Width = 42
      Height = 24
      Cursor = crHandPoint
      Caption = 'Salir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Label4Click
    end
    object Label8: TLabel
      Left = 38
      Top = 56
      Width = 181
      Height = 13
      Caption = '"el sistema que lo tiene todo..."'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 144
      Width = 113
      Height = 13
      Cursor = crHandPoint
      Caption = 'consultas@civeloo.com'
      OnClick = emailLabelClick
    end
  end
end
