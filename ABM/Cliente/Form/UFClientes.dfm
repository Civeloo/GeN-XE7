object FClientes: TFClientes
  Left = 182
  Top = 90
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSingle
  Caption = 'Altas, Bajas y Modificaciones de Clientes'
  ClientHeight = 454
  ClientWidth = 634
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 559
    Height = 429
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Informaci'#243'n General'
      object Label2: TLabel
        Left = 50
        Top = 39
        Width = 44
        Height = 13
        Caption = 'Nombre'
        FocusControl = DBEdit2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 42
        Top = 147
        Width = 55
        Height = 13
        Caption = 'Direcci'#243'n'
        FocusControl = DBEdit3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object VendedorLabel: TLabel
        Left = 632
        Top = 64
        Width = 9
        Height = 13
        Caption = '...'
      end
      object Label9: TLabel
        Left = 43
        Top = 120
        Width = 51
        Height = 13
        Caption = 'Tel'#233'fono'
        FocusControl = DBEdit10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 40
        Top = 228
        Width = 54
        Height = 13
        Caption = 'Provincia'
        FocusControl = DBEdit6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 63
        Top = 93
        Width = 31
        Height = 13
        Caption = 'Email'
        FocusControl = DBEdit13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 54
        Top = 201
        Width = 40
        Height = 13
        Caption = 'Ciudad'
        FocusControl = DBEdit8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label23: TLabel
        Left = 71
        Top = 66
        Width = 23
        Height = 13
        Caption = 'DNI'
        FocusControl = DBEdit19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 15
        Top = 174
        Width = 79
        Height = 13
        Caption = 'Codigo Postal'
        FocusControl = DBEdit17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit2: TDBEdit
        Left = 103
        Top = 39
        Width = 226
        Height = 21
        DataField = 'NOMBRE'
        DataSource = DM.dstCliente
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 103
        Top = 147
        Width = 226
        Height = 21
        DataField = 'Direccion'
        DataSource = DM.dstCliente
        TabOrder = 4
      end
      object DBEdit10: TDBEdit
        Left = 103
        Top = 120
        Width = 122
        Height = 21
        DataField = 'Telefono'
        DataSource = DM.dstCliente
        TabOrder = 3
      end
      object DBEdit6: TDBEdit
        Left = 103
        Top = 228
        Width = 226
        Height = 21
        DataField = 'Provincia'
        DataSource = DM.dstCliente
        TabOrder = 7
      end
      object DBEdit13: TDBEdit
        Left = 103
        Top = 93
        Width = 226
        Height = 21
        DataField = 'Email'
        DataSource = DM.dstCliente
        TabOrder = 2
      end
      object DBEdit8: TDBEdit
        Left = 103
        Top = 201
        Width = 122
        Height = 21
        DataField = 'Ciudad'
        DataSource = DM.dstCliente
        TabOrder = 6
      end
      object DBEdit19: TDBEdit
        Left = 103
        Top = 66
        Width = 122
        Height = 21
        DataField = 'Documento'
        DataSource = DM.dstCliente
        TabOrder = 1
      end
      object DBEdit17: TDBEdit
        Left = 103
        Top = 174
        Width = 122
        Height = 21
        DataField = 'CP'
        DataSource = DM.dstCliente
        TabOrder = 5
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Notas'
      ImageIndex = 1
      object DBMemo1: TDBMemo
        Left = 0
        Top = 0
        Width = 551
        Height = 401
        Align = alClient
        DataField = 'Notas'
        DataSource = DM.dstCliente
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Contabilidad'
      ImageIndex = 2
      object Label15: TLabel
        Left = 105
        Top = 158
        Width = 162
        Height = 13
        Caption = 'Cuenta Contable Asociada a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label24: TLabel
        Left = 26
        Top = 80
        Width = 73
        Height = 13
        Caption = 'Ingresos Brutos'
        FocusControl = DBEdit20
      end
      object Label25: TLabel
        Left = 74
        Top = 42
        Width = 25
        Height = 13
        Caption = 'CUIT'
        FocusControl = DBEdit22
      end
      object Label38: TLabel
        Left = 0
        Top = 119
        Width = 99
        Height = 13
        Caption = 'Categor'#237'a de IVA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label54: TLabel
        Left = 61
        Top = 283
        Width = 38
        Height = 13
        Caption = 'Anticipo'
      end
      object Label52: TLabel
        Left = 62
        Top = 185
        Width = 37
        Height = 13
        Caption = 'Nombre'
      end
      object Label51: TLabel
        Left = 78
        Top = 230
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object DBEdit20: TDBEdit
        Left = 105
        Top = 80
        Width = 201
        Height = 21
        DataField = 'IIBB'
        DataSource = DM.dstCliente
        TabOrder = 1
      end
      object DBEdit22: TDBEdit
        Left = 105
        Top = 42
        Width = 201
        Height = 21
        DataField = 'CUIT'
        DataSource = DM.dstCliente
        TabOrder = 0
      end
      object IVADBComboBox: TDBComboBox
        Left = 105
        Top = 116
        Width = 201
        Height = 21
        DataField = 'IVA'
        DataSource = DM.dstCliente
        TabOrder = 2
        OnChange = IVADBComboBoxChange
      end
      object CuentaDBLookupComboBox: TDBLookupComboBox
        Left = 105
        Top = 185
        Width = 351
        Height = 21
        DataField = 'CTANOMBRE'
        DataSource = DM.dstCliente
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dstCuenta
        TabOrder = 3
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 105
        Top = 275
        Width = 351
        Height = 21
        DataField = 'CTAANTICIPO'
        DataSource = DM.dstCliente
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dstCuenta
        TabOrder = 4
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 105
        Top = 230
        Width = 351
        Height = 21
        DataField = 'CTATIPO'
        DataSource = DM.dstCliente
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dstCuenta
        TabOrder = 5
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Datos Secundarios'
      ImageIndex = 3
      object Label19: TLabel
        Left = 16
        Top = 39
        Width = 84
        Height = 13
        Caption = 'Nombre de Titular'
        FocusControl = DBEdit16
      end
      object Label28: TLabel
        Left = 48
        Top = 174
        Width = 52
        Height = 13
        Caption = 'Messenger'
        FocusControl = DBEdit23
      end
      object Label26: TLabel
        Left = 71
        Top = 66
        Width = 29
        Height = 13
        Caption = 'Rubro'
      end
      object Label5: TLabel
        Left = 80
        Top = 255
        Width = 20
        Height = 13
        Caption = 'Pais'
        FocusControl = DBEdit5
      end
      object Label22: TLabel
        Left = 27
        Top = 93
        Width = 73
        Height = 13
        Caption = 'Codigo de Area'
      end
      object Label10: TLabel
        Left = 53
        Top = 120
        Width = 47
        Height = 13
        Caption = 'Extenci'#243'n'
        FocusControl = DBEdit11
      end
      object Label20: TLabel
        Left = 1
        Top = 147
        Width = 99
        Height = 13
        Caption = 'Direcci'#243'n de Trabajo'
        FocusControl = DBEdit3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 83
        Top = 201
        Width = 17
        Height = 13
        Caption = 'Fax'
        FocusControl = DBEdit12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 30
        Top = 228
        Width = 70
        Height = 13
        Caption = 'Telefono M'#243'vil'
        FocusControl = DBEdit9
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 33
        Top = 282
        Width = 67
        Height = 13
        Caption = 'Departamento'
        FocusControl = DBEdit7
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label27: TLabel
        Left = 73
        Top = 309
        Width = 27
        Height = 13
        Caption = 'Barrio'
        FocusControl = DBEdit24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label32: TLabel
        Left = 75
        Top = 336
        Width = 25
        Height = 13
        Caption = 'Zona'
        FocusControl = DBEdit27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label33: TLabel
        Left = 62
        Top = 363
        Width = 38
        Height = 13
        Caption = 'Garante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object GaranteLabel: TLabel
        Left = 527
        Top = 446
        Width = 9
        Height = 13
        Caption = '...'
      end
      object DBEdit16: TDBEdit
        Left = 106
        Top = 39
        Width = 209
        Height = 21
        DataField = 'TITULAR'
        DataSource = DM.dstCliente
        TabOrder = 0
      end
      object DBEdit23: TDBEdit
        Left = 106
        Top = 174
        Width = 209
        Height = 21
        DataField = 'MSN'
        DataSource = DM.dstCliente
        TabOrder = 5
      end
      object DBEdit21: TDBEdit
        Left = 106
        Top = 66
        Width = 209
        Height = 21
        DataField = 'Rubro'
        DataSource = DM.dstCliente
        TabOrder = 1
      end
      object DBEdit5: TDBEdit
        Left = 106
        Top = 255
        Width = 97
        Height = 21
        DataField = 'Pais'
        DataSource = DM.dstCliente
        TabOrder = 8
      end
      object DBEdit11: TDBEdit
        Left = 106
        Top = 120
        Width = 82
        Height = 21
        DataField = 'Extencion'
        DataSource = DM.dstCliente
        TabOrder = 3
      end
      object DBEdit18: TDBEdit
        Left = 106
        Top = 93
        Width = 82
        Height = 21
        DataField = 'CodigoArea'
        DataSource = DM.dstCliente
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 106
        Top = 147
        Width = 226
        Height = 21
        DataField = 'DIRECCIONCOMERCIAL'
        DataSource = DM.dstCliente
        TabOrder = 4
      end
      object DBEdit12: TDBEdit
        Left = 106
        Top = 201
        Width = 76
        Height = 21
        DataField = 'Fax'
        DataSource = DM.dstCliente
        TabOrder = 6
      end
      object DBEdit9: TDBEdit
        Left = 106
        Top = 228
        Width = 76
        Height = 21
        DataField = 'Celular'
        DataSource = DM.dstCliente
        TabOrder = 7
      end
      object DBEdit7: TDBEdit
        Left = 106
        Top = 282
        Width = 226
        Height = 21
        DataField = 'Departamento'
        DataSource = DM.dstCliente
        TabOrder = 9
      end
      object DBEdit24: TDBEdit
        Left = 106
        Top = 309
        Width = 226
        Height = 21
        DataField = 'Barrio'
        DataSource = DM.dstCliente
        TabOrder = 10
      end
      object DBEdit27: TDBEdit
        Left = 106
        Top = 336
        Width = 76
        Height = 21
        DataField = 'Zona'
        DataSource = DM.dstCliente
        TabOrder = 11
      end
      object GaranteDBEdit: TDBEdit
        Left = 106
        Top = 363
        Width = 76
        Height = 21
        DataField = 'Garante'
        DataSource = DM.dstCliente
        TabOrder = 12
      end
      object BuscarGaranteBitBtn: TBitBtn
        Left = 182
        Top = 362
        Width = 17
        Height = 22
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        OnClick = BuscarGaranteBitBtnClick
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Parametros'
      ImageIndex = 4
      object Label13: TLabel
        Left = 2
        Top = 34
        Width = 102
        Height = 13
        Alignment = taRightJustify
        Caption = 'T'#233'rminos del contrato'
        FocusControl = DBEdit14
      end
      object Label14: TLabel
        Left = 58
        Top = 58
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vendedor'
      end
      object Label16: TLabel
        Left = 39
        Top = 82
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = 'L'#237'mite Cr'#233'dito'
      end
      object Label17: TLabel
        Left = 74
        Top = 134
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Precio'
      end
      object Label18: TLabel
        Left = 47
        Top = 106
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dias Cr'#233'dito'
        FocusControl = DBEdit1
      end
      object Label29: TLabel
        Left = 43
        Top = 186
        Width = 61
        Height = 13
        Caption = 'Promociones'
      end
      object Label30: TLabel
        Left = 46
        Top = 218
        Width = 58
        Height = 13
        Caption = 'Almanaques'
      end
      object Label31: TLabel
        Left = 162
        Top = 134
        Width = 34
        Height = 13
        Caption = '0=Lista'
      end
      object DBEdit14: TDBEdit
        Left = 110
        Top = 34
        Width = 145
        Height = 21
        DataField = 'Terminos'
        DataSource = DM.dstCliente
        TabOrder = 0
      end
      object DBEdit15: TDBEdit
        Left = 110
        Top = 82
        Width = 145
        Height = 21
        DataField = 'LimiteCredito'
        DataSource = DM.dstCliente
        TabOrder = 2
      end
      object DBComboBox1: TDBComboBox
        Left = 110
        Top = 133
        Width = 49
        Height = 21
        DataField = 'PRECIO'
        DataSource = DM.dstCliente
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '0')
        TabOrder = 4
      end
      object DBEdit1: TDBEdit
        Left = 110
        Top = 106
        Width = 145
        Height = 21
        DataField = 'DiasCredito'
        DataSource = DM.dstCliente
        TabOrder = 3
      end
      object DBCheckBox1: TDBCheckBox
        Left = 110
        Top = 160
        Width = 121
        Height = 17
        Caption = 'Cr'#233'dito Suspendido'
        DataField = 'Suspendido'
        DataSource = DM.dstCliente
        TabOrder = 5
      end
      object DBEdit25: TDBEdit
        Left = 110
        Top = 186
        Width = 121
        Height = 21
        DataField = 'Promociones'
        DataSource = DM.dstCliente
        TabOrder = 6
      end
      object DBEdit26: TDBEdit
        Left = 110
        Top = 213
        Width = 121
        Height = 21
        DataField = 'Almanaques'
        DataSource = DM.dstCliente
        TabOrder = 7
      end
      object VendedorDBEdit: TDBEdit
        Left = 110
        Top = 57
        Width = 41
        Height = 21
        DataField = 'Vendedor'
        DataSource = DM.dstCliente
        TabOrder = 1
      end
      object VendedorBitBtn: TBitBtn
        Left = 150
        Top = 56
        Width = 49
        Height = 24
        Caption = 'F3...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnClick = VendedorBitBtnClick
      end
    end
  end
  object Panel1: TPanel
    Left = 559
    Top = 0
    Width = 75
    Height = 429
    Align = alRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 1
      Top = 51
      Width = 73
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Nro. Cta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 48
    end
    object SiBitBtn: TBitBtn
      Left = 1
      Top = 328
      Width = 73
      Height = 50
      Align = alBottom
      Caption = 'Grabar'
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
      Left = 1
      Top = 378
      Width = 73
      Height = 50
      Align = alBottom
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
    object ImprimirBitBtn: TBitBtn
      Left = 1
      Top = 85
      Width = 73
      Height = 50
      Align = alTop
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ImprimirBitBtnClick
    end
    object BuscarBitBtn: TBitBtn
      Left = 1
      Top = 1
      Width = 73
      Height = 50
      Align = alTop
      Caption = 'Buscar F5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BuscarBitBtnClick
    end
    object CodigoDBEdit: TDBEdit
      Left = 1
      Top = 64
      Width = 73
      Height = 21
      Align = alTop
      DataField = 'CODIGO'
      DataSource = DM.dstCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
  object pButton: TPanel
    Left = 0
    Top = 429
    Width = 634
    Height = 25
    Align = alBottom
    TabOrder = 2
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 632
      Height = 23
      DataSource = DM.dstCliente
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete]
      Align = alClient
      Hints.Strings = (
        'Primer registro'
        'Registro anterior'
        'Registro siguiente'
        #218'ltimo registro'
        'Insertar registro'
        'Eliminar registro'
        'Editar registro'
        'Guardar cambios'
        'Cancelar edici'#243'n'
        'Refrescar datos')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
end
