object CajaLForm: TCajaLForm
  Left = 636
  Top = 160
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Resumen de Caja'
  ClientHeight = 466
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 70
    Align = alTop
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 25
      Top = 9
      Width = 362
      Height = 48
      Caption = ' Fechas '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 192
        Top = 21
        Width = 22
        Height = 13
        Caption = 'Fin:'
      end
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 36
        Height = 13
        Caption = 'Inicio:'
      end
      object DTP1: TDateTimePicker
        Left = 58
        Top = 16
        Width = 121
        Height = 21
        Date = 42005.000000000000000000
        Time = 0.873243958296370700
        TabOrder = 0
        OnCloseUp = DTP1CloseUp
      end
      object DTP2: TDateTimePicker
        Left = 226
        Top = 16
        Width = 121
        Height = 21
        Date = 42051.000000000000000000
        Time = 0.873295891200541600
        TabOrder = 1
        OnCloseUp = DTP2CloseUp
      end
    end
    object BitBtn3: TBitBtn
      Left = 701
      Top = 8
      Width = 80
      Height = 50
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Kind = bkAll
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn3Click
    end
  end
  object Panel2: TPanel
    Left = 687
    Top = 70
    Width = 105
    Height = 396
    Align = alRight
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object Saldo: TLabel
      Left = 14
      Top = 184
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label3: TLabel
      Left = 14
      Top = 22
      Width = 44
      Height = 20
      Caption = 'Debe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 14
      Top = 94
      Width = 50
      Height = 20
      Caption = 'Haber'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 14
      Top = 158
      Width = 47
      Height = 20
      Caption = 'Saldo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Debe: TLabel
      Left = 14
      Top = 48
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Haber: TLabel
      Left = 14
      Top = 120
      Width = 6
      Height = 13
      Caption = '0'
    end
    object SiBitBtn: TBitBtn
      Left = 14
      Top = 325
      Width = 80
      Height = 50
      Caption = 'mostrar'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
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
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = SiBitBtnClick
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 70
    Width = 687
    Height = 396
    Align = alClient
    Color = clWhite
    DataSource = DM.dsqCaja
    FixedColor = clWhite
    GradientEndColor = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ASIENTO'
        Title.Caption = 'A'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 12
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LEYENDA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JERARQUIA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 185
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HABER'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 65
        Visible = True
      end>
  end
end
