object AporteCapitalForm: TAporteCapitalForm
  Left = 0
  Top = 0
  Caption = 'Aportes de Capital'
  ClientHeight = 317
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 368
    Height = 317
    Align = alClient
    BevelOuter = bvLowered
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 69
      Width = 33
      Height = 13
      Caption = 'Socio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 102
      Top = 253
      Width = 66
      Height = 13
      Caption = 'En efectivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 137
      Width = 38
      Height = 13
      Caption = 'Aporte'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 209
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Fecha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 102
      Top = 163
      Width = 57
      Height = 13
      Caption = 'En bienes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SocioLabel: TLabel
      Left = 177
      Top = 100
      Width = 13
      Height = 13
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ArticuloLabel: TLabel
      Left = 177
      Top = 214
      Width = 13
      Height = 13
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 132
      Top = 185
      Width = 43
      Height = 13
      Caption = 'unidades'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ImporteEdit: TEdit
      Left = 79
      Top = 272
      Width = 121
      Height = 21
      TabOrder = 5
      Text = '0'
      OnExit = ImporteEditExit
    end
    object FechaDateTimePicker: TDateTimePicker
      Left = 255
      Top = 13
      Width = 79
      Height = 21
      Date = 40110.000000000000000000
      Time = 0.475039594908594200
      TabOrder = 6
    end
    object BienDBCheckBox: TCheckBox
      Left = 79
      Top = 162
      Width = 20
      Height = 17
      TabOrder = 1
    end
    object EfectivoDBCheckBox: TCheckBox
      Left = 79
      Top = 252
      Width = 16
      Height = 17
      TabOrder = 4
    end
    object SocioBitBtn: TBitBtn
      Left = 132
      Top = 95
      Width = 42
      Height = 25
      Caption = '+'
      TabOrder = 0
      OnClick = SocioBitBtnClick
    end
    object SocioEdit: TEdit
      Left = 79
      Top = 97
      Width = 50
      Height = 21
      TabOrder = 7
      Text = '0'
    end
    object ArticuloBitBtn: TBitBtn
      Left = 132
      Top = 209
      Width = 42
      Height = 25
      Caption = '+'
      TabOrder = 3
      OnClick = ArticuloBitBtnClick
    end
    object ArticuloEdit: TEdit
      Left = 79
      Top = 211
      Width = 50
      Height = 21
      TabOrder = 8
      Text = '0'
    end
    object CantidadEdit: TEdit
      Left = 79
      Top = 182
      Width = 50
      Height = 21
      TabOrder = 2
      Text = '0'
    end
  end
  object Panel2: TPanel
    Left = 368
    Top = 0
    Width = 94
    Height = 317
    Align = alRight
    BevelOuter = bvLowered
    Color = clBlack
    ParentBackground = False
    TabOrder = 1
    object Label7: TLabel
      Left = 23
      Top = 152
      Width = 46
      Height = 13
      Caption = 'Grabar?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SiBitBtn: TBitBtn
      Left = 6
      Top = 96
      Width = 80
      Height = 50
      Caption = 'Si'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 6
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = SiBitBtnClick
    end
    object NoBitBtn: TBitBtn
      Left = 6
      Top = 173
      Width = 80
      Height = 50
      Caption = 'No'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Kind = bkNo
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = NoBitBtnClick
    end
  end
  object Tabla: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 264
    Top = 200
  end
  object Q: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 264
    Top = 248
  end
end
