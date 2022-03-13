object OperacionForm: TOperacionForm
  Left = 321
  Top = 220
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Operacion'
  ClientHeight = 468
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
  object pPago: TPanel
    Left = 0
    Top = 25
    Width = 790
    Height = 73
    Align = alTop
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 1
    object Label40: TLabel
      Left = 28
      Top = 126
      Width = 60
      Height = 13
      Caption = 'Impresora:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 2
      Top = 33
      Width = 48
      Height = 13
      Caption = 'Contado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label29: TLabel
      Left = 998
      Top = 26
      Width = 44
      Height = 13
      Caption = 'Cheque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label30: TLabel
      Left = 998
      Top = 50
      Width = 41
      Height = 13
      Caption = 'Tarjeta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label32: TLabel
      Left = 1169
      Top = 9
      Width = 15
      Height = 13
      Caption = 'N'#186
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label33: TLabel
      Left = 1219
      Top = 9
      Width = 41
      Height = 13
      Caption = 'Detalle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label34: TLabel
      Left = 1300
      Top = 9
      Width = 37
      Height = 13
      Caption = 'Vence'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label31: TLabel
      Left = 1014
      Top = 5
      Width = 25
      Height = 13
      Caption = 'Otro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label2: TLabel
      Left = 205
      Top = 3
      Width = 48
      Height = 13
      Caption = 'Pagare?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label8: TLabel
      Left = 170
      Top = 25
      Width = 31
      Height = 13
      Caption = 'Email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 178
      Top = 50
      Width = 23
      Height = 13
      Caption = 'DNI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 422
      Top = 24
      Width = 44
      Height = 13
      Caption = 'Enviar?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 90
      Top = 126
      Width = 321
      Height = 21
      TabOrder = 0
    end
    object NroChequeEdit: TEdit
      Left = 1148
      Top = 22
      Width = 49
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object NroTarjetaEdit: TEdit
      Left = 1148
      Top = 46
      Width = 49
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object DetChequeEdit: TEdit
      Left = 1196
      Top = 22
      Width = 84
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
    object DetTarjetaEdit: TEdit
      Left = 1196
      Top = 46
      Width = 165
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = False
    end
    object FECheque: TEdit
      Left = 1043
      Top = 22
      Width = 106
      Height = 21
      TabOrder = 5
      Text = '0'
      Visible = False
      OnChange = FEChequeChange
    end
    object FETarjeta: TEdit
      Left = 1043
      Top = 46
      Width = 106
      Height = 21
      TabOrder = 6
      Text = '0'
      Visible = False
      OnChange = FETarjetaChange
    end
    object DiaChequeDateTimePicker: TDateTimePicker
      Left = 1279
      Top = 22
      Width = 82
      Height = 21
      Date = 43830.000000000000000000
      Time = 0.506836111111624600
      TabOrder = 7
      Visible = False
    end
    object FEContado: TEdit
      Left = 53
      Top = 30
      Width = 106
      Height = 21
      TabOrder = 8
      Text = '0'
      OnChange = FEContadoChange
      OnExit = FEContadoExit
    end
    object FEOtro: TEdit
      Left = 1043
      Top = 1
      Width = 106
      Height = 21
      TabOrder = 9
      Text = '0'
      Visible = False
      OnChange = FEOtroChange
    end
    object PagareCheckBox: TCheckBox
      Left = 252
      Top = 1
      Width = 14
      Height = 17
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 10
      Visible = False
    end
    object EmailEdit: TEdit
      Left = 205
      Top = 22
      Width = 211
      Height = 21
      TabOrder = 11
    end
    object CuitEdit: TEdit
      Left = 205
      Top = 47
      Width = 124
      Height = 21
      TabOrder = 12
    end
    object EnviarEmailCheckBox: TCheckBox
      Left = 472
      Top = 23
      Width = 14
      Height = 17
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 13
      OnClick = EnviarEmailCheckBoxClick
    end
    object TipoRadioGroup: TRadioGroup
      Left = 685
      Top = 1
      Width = 102
      Height = 71
      Caption = 'Tipo'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Venta'
        'Presupuesto'
        'Remito')
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 14
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 2
    object ClienteLabel: TLabel
      Left = 28
      Top = 4
      Width = 80
      Height = 13
      Caption = 'Consumidor Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 319
      Top = 5
      Width = 55
      Height = 13
      Caption = 'Vendedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object VendedorLabel: TLabel
      Left = 404
      Top = 5
      Width = 9
      Height = 13
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lPrecio: TLabel
      Left = 265
      Top = 5
      Width = 37
      Height = 13
      Caption = 'Precio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PrecioLabel: TLabel
      Left = 304
      Top = 5
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ClienteEdit: TEdit
      Left = 3
      Top = 1
      Width = 24
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '0'
    end
    object VendedorEdit: TEdit
      Left = 378
      Top = 1
      Width = 22
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
      Visible = False
    end
    object FechaDateTimePicker: TDateTimePicker
      Left = 684
      Top = 0
      Width = 103
      Height = 29
      Date = 43466.000000000000000000
      Time = 0.475039594908594200
      TabOrder = 2
    end
  end
  object SGFact: TStringGrid
    Left = 0
    Top = 98
    Width = 582
    Height = 313
    Align = alClient
    ColCount = 11
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 3
    ColWidths = (
      45
      274
      2
      52
      93
      84
      36
      64
      64
      64
      64)
    RowHeights = (
      24
      20)
  end
  object Panel3: TPanel
    Left = 0
    Top = 411
    Width = 790
    Height = 57
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    object ProcesarBitBtn: TBitBtn
      Left = 709
      Top = 1
      Width = 80
      Height = 55
      Hint = 'F12 - PROCESAR VENTA'
      Align = alRight
      Caption = 'GRABAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ProcesarBitBtnClick
    end
    object ClienteBitBtn: TBitBtn
      Left = 1
      Top = 1
      Width = 56
      Height = 55
      Hint = 'F1 SELECCIONAR CLIENTE'
      Align = alLeft
      Caption = 'Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ClienteBitBtnClick
    end
    object VendedorBitBtn: TBitBtn
      Left = 57
      Top = 1
      Width = 51
      Height = 55
      Hint = 'F3 SELECCIONAR VENDEDOR'
      Align = alLeft
      Caption = 'Vend'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
      OnClick = VendedorBitBtnClick
    end
    object AgregarBitBtn: TBitBtn
      Left = 225
      Top = 1
      Width = 74
      Height = 55
      Hint = 'F5 - AGREGAR ARTICULO'
      Align = alLeft
      Caption = '+Articulo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = AgregarBitBtnClick
    end
    object NuevoBitBtn: TBitBtn
      Left = 164
      Top = 1
      Width = 61
      Height = 55
      Hint = 'F8 - CREAR ARTICULO'
      Align = alLeft
      Caption = '*Nuevo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Visible = False
      OnClick = NuevoBitBtnClick
    end
    object QuitarBitBtn: TBitBtn
      Left = 299
      Top = 1
      Width = 60
      Height = 55
      Hint = 'F6 - QUITAR ARTICULO'
      Align = alLeft
      Caption = '-Quitar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = QuitarBitBtnClick
    end
    object CantidadBitBtn: TBitBtn
      Left = 359
      Top = 1
      Width = 74
      Height = 55
      Hint = 'F7 - AUMENTAR CANTIDAD DE ARTICULO'
      Align = alLeft
      Caption = 'Cantidad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = CantidadBitBtnClick
    end
    object DescuentoBitBtn: TBitBtn
      Left = 433
      Top = 1
      Width = 53
      Height = 55
      Hint = 'F8 - DESCUENTO SOBRE ARTICULO'
      Align = alLeft
      Caption = 'Desc'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = DescuentoBitBtnClick
    end
    object bRetPer: TButton
      Left = 108
      Top = 1
      Width = 56
      Height = 55
      Hint = 'Retenciones y Percepciones'
      Align = alLeft
      Caption = 'Ret. y percep.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      WordWrap = True
      OnClick = bRetPerClick
    end
    object NotasBitBtn: TBitBtn
      Left = 486
      Top = 1
      Width = 55
      Height = 55
      Align = alLeft
      Caption = 'Notas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = NotasBitBtnClick
    end
  end
  object Panel2: TPanel
    Left = 582
    Top = 98
    Width = 208
    Height = 313
    Align = alRight
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    object SGTotal: TStringGrid
      Left = 1
      Top = 160
      Width = 204
      Height = 151
      BiDiMode = bdRightToLeft
      ColCount = 2
      DefaultColWidth = 100
      RowCount = 6
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      ScrollBars = ssNone
      TabOrder = 1
      ColWidths = (
        100
        100)
      RowHeights = (
        24
        24
        24
        24
        24
        24)
    end
    object GroupBox5: TGroupBox
      Left = -1
      Top = 0
      Width = 208
      Height = 161
      Caption = 'Saldo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object LbSaldo: TLabel
        Left = 3
        Top = 19
        Width = 200
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object TotalLabel: TLabel
        Left = 7
        Top = 49
        Width = 198
        Height = 43
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox4: TGroupBox
        Left = 5
        Top = 93
        Width = 66
        Height = 62
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object cbTipo: TComboBox
          Left = 6
          Top = 15
          Width = 54
          Height = 37
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Text = 'C'
          OnChange = cbTipoChange
        end
      end
      object ComprobanteEdit: TEdit
        Left = 71
        Top = 129
        Width = 134
        Height = 25
        Alignment = taCenter
        AutoSize = False
        BevelInner = bvNone
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumbersOnly = True
        ParentFont = False
        TabOrder = 2
        Text = 'Nro.Comprobante'
        TextHint = 'Nro. Comprobante'
        OnExit = ComprobanteEditExit
      end
      object PuntoVentaEdit: TEdit
        Left = 71
        Top = 98
        Width = 134
        Height = 25
        Alignment = taCenter
        AutoSize = False
        BevelInner = bvNone
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumbersOnly = True
        ParentFont = False
        TabOrder = 1
        Text = 'Pto.Vta.'
        TextHint = 'Nro. Comprobante'
      end
    end
  end
end
