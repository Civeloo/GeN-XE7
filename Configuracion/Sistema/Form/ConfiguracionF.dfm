object ConfiguracionForm: TConfiguracionForm
  Left = 51
  Top = 169
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Configuraci'#243'n del Sistema'
  ClientHeight = 572
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 717
    Top = 0
    Width = 75
    Height = 572
    Align = alRight
    ParentBackground = False
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 1
      Top = 471
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
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 1
      Top = 521
      Width = 73
      Height = 50
      Align = alBottom
      Cancel = True
      Caption = 'No'
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
        3333333333333FFFFF333333000033333388888833333333333F888888FFF333
        000033338811111188333333338833FFF388FF33000033381119999111833333
        38F338888F338FF30000339119933331111833338F388333383338F300003391
        13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
        33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
        33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
        000039183811193333918338F8F833F83333838F000039118111933339118338
        F3833F83333833830000339111193333391833338F33F8333FF838F300003391
        11833338111833338F338FFFF883F83300003339111888811183333338FF3888
        83FF83330000333399111111993333333388FFFFFF8833330000333333999999
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      ModalResult = 7
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 717
    Height = 572
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet3: TTabSheet
      Caption = 'Contabilidad'
      ImageIndex = 2
      object Label43: TLabel
        Left = 3
        Top = 3
        Width = 162
        Height = 13
        Caption = 'Cuenta Contable Asociada a'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label44: TLabel
        Left = 5
        Top = 146
        Width = 150
        Height = 13
        Caption = 'Costo de Mercaderias Vendidas'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label46: TLabel
        Left = 5
        Top = 104
        Width = 21
        Height = 13
        Caption = 'Caja'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label47: TLabel
        Left = 5
        Top = 192
        Width = 91
        Height = 13
        Caption = 'Comisi'#243'n Vendedor'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label48: TLabel
        Left = 5
        Top = 234
        Width = 131
        Height = 13
        Caption = 'Comisi'#243'n Vendedor a Pagar'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label45: TLabel
        Left = 5
        Top = 61
        Width = 130
        Height = 13
        Caption = 'Banco XX Cuenta Corriente'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label19: TLabel
        Left = 5
        Top = 23
        Width = 110
        Height = 13
        Caption = 'Anticipo a Proveedores'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label20: TLabel
        Left = 3
        Top = 282
        Width = 138
        Height = 13
        Caption = 'Deudores en Gesti'#243'n Judicial'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label21: TLabel
        Left = 242
        Top = 20
        Width = 95
        Height = 13
        Caption = 'Deudores por Venta'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label22: TLabel
        Left = 242
        Top = 61
        Width = 103
        Height = 13
        Caption = 'Documentos a Cobrar'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label23: TLabel
        Left = 242
        Top = 104
        Width = 91
        Height = 13
        Caption = 'Honorarios Legales'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label24: TLabel
        Left = 242
        Top = 150
        Width = 131
        Height = 13
        Caption = 'Honorarios Legales a Pagar'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label25: TLabel
        Left = 3
        Top = 372
        Width = 89
        Height = 13
        Caption = 'Deudores Morosos'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label26: TLabel
        Left = 3
        Top = 326
        Width = 104
        Height = 13
        Caption = 'Deudores Incobrables'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label27: TLabel
        Left = 242
        Top = 193
        Width = 57
        Height = 13
        Caption = 'IVA a Pagar'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label28: TLabel
        Left = 242
        Top = 324
        Width = 184
        Height = 13
        Caption = 'Mercader'#237'a Recuperada Judicialmente'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label29: TLabel
        Left = 242
        Top = 369
        Width = 119
        Height = 13
        Caption = 'Mercader'#237'as de Reventa'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label30: TLabel
        Left = 474
        Top = 20
        Width = 101
        Height = 13
        Caption = 'Obligaciones a Pagar'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label31: TLabel
        Left = 474
        Top = 61
        Width = 94
        Height = 13
        Caption = 'Pago de Honorarios'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label32: TLabel
        Left = 242
        Top = 278
        Width = 81
        Height = 13
        Caption = 'IVA Debito Fiscal'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label33: TLabel
        Left = 242
        Top = 232
        Width = 83
        Height = 13
        Caption = 'IVA Credito Fiscal'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label35: TLabel
        Left = 474
        Top = 234
        Width = 38
        Height = 13
        Caption = 'Servicio'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label36: TLabel
        Left = 475
        Top = 281
        Width = 78
        Height = 13
        Caption = 'Servicio a Pagar'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label37: TLabel
        Left = 474
        Top = 373
        Width = 77
        Height = 13
        Caption = 'Valores al Cobro'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label39: TLabel
        Left = 474
        Top = 191
        Width = 85
        Height = 13
        Caption = 'Recupero Judicial'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label40: TLabel
        Left = 474
        Top = 149
        Width = 60
        Height = 13
        Caption = 'Proveedores'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label41: TLabel
        Left = 474
        Top = 416
        Width = 33
        Height = 13
        Caption = 'Ventas'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label42: TLabel
        Left = 474
        Top = 327
        Width = 92
        Height = 13
        Caption = 'Valores a Depositar'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label34: TLabel
        Left = 474
        Top = 104
        Width = 84
        Height = 13
        Caption = 'Tarjeta de Credito'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object CuentaDBLookupComboBox: TDBLookupComboBox
        Left = 5
        Top = 80
        Width = 210
        Height = 21
        DataField = 'CtaBanco'
        DataSource = DM.dstConfiguracion
        KeyField = 'Codigo'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 0
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 5
        Top = 121
        Width = 209
        Height = 21
        DataField = 'CtaCaja'
        DataSource = DM.dstConfiguracion
        KeyField = 'Codigo'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 1
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 5
        Top = 210
        Width = 209
        Height = 21
        DataField = 'CtaComisionVendedor'
        DataSource = DM.dstConfiguracion
        KeyField = 'Codigo'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 2
      end
      object DBLookupComboBox4: TDBLookupComboBox
        Left = 5
        Top = 253
        Width = 209
        Height = 21
        DataField = 'CtaComisionVendedorAPagar'
        DataSource = DM.dstConfiguracion
        KeyField = 'Codigo'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 3
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 5
        Top = 165
        Width = 209
        Height = 21
        DataField = 'CtaCMV'
        DataSource = DM.dstConfiguracion
        KeyField = 'Codigo'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 4
      end
      object DBLookupComboBox5: TDBLookupComboBox
        Left = 5
        Top = 39
        Width = 209
        Height = 21
        DataField = 'CtaAnticipoAProveedor'
        DataSource = DM.dstConfiguracion
        KeyField = 'Codigo'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 5
      end
      object DBLookupComboBox6: TDBLookupComboBox
        Left = 3
        Top = 299
        Width = 209
        Height = 21
        DataField = 'CtaDeudorEnGestionJudicial'
        DataSource = DM.dstConfiguracion
        KeyField = 'Codigo'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 6
      end
      object DBLookupComboBox7: TDBLookupComboBox
        Left = 3
        Top = 390
        Width = 209
        Height = 21
        DataField = 'CtaDeudorMoroso'
        DataSource = DM.dstConfiguracion
        KeyField = 'Codigo'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 7
      end
      object DBLookupComboBox8: TDBLookupComboBox
        Left = 242
        Top = 39
        Width = 209
        Height = 21
        DataField = 'CtaDeudorPorVenta'
        DataSource = DM.dstConfiguracion
        KeyField = 'Codigo'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 8
      end
      object DBLookupComboBox9: TDBLookupComboBox
        Left = 242
        Top = 123
        Width = 209
        Height = 21
        DataField = 'CtaHonorarioLegal'
        DataSource = DM.dstConfiguracion
        KeyField = 'Codigo'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 9
      end
      object DBLookupComboBox10: TDBLookupComboBox
        Left = 243
        Top = 166
        Width = 209
        Height = 21
        DataField = 'CtaHonorarioLegalApagar'
        DataSource = DM.dstConfiguracion
        KeyField = 'Codigo'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 10
      end
      object DBLookupComboBox11: TDBLookupComboBox
        Left = 242
        Top = 80
        Width = 209
        Height = 21
        DataField = 'CtaDocumentoACobrar'
        DataSource = DM.dstConfiguracion
        KeyField = 'Codigo'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 11
      end
      object DBLookupComboBox12: TDBLookupComboBox
        Left = 3
        Top = 345
        Width = 209
        Height = 21
        DataField = 'CtaDeudorIncobrable'
        DataSource = DM.dstConfiguracion
        KeyField = 'Codigo'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 12
      end
      object DBLookupComboBox13: TDBLookupComboBox
        Left = 242
        Top = 208
        Width = 209
        Height = 21
        DataField = 'CtaIVAAPagar'
        DataSource = DM.dstConfiguracion
        KeyField = 'Codigo'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 13
      end
      object DBLookupComboBox14: TDBLookupComboBox
        Left = 242
        Top = 297
        Width = 209
        Height = 21
        DataField = 'CtaIVADebitoFiscal'
        DataSource = DM.dstConfiguracion
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 14
      end
      object DBLookupComboBox15: TDBLookupComboBox
        Left = 243
        Top = 343
        Width = 209
        Height = 21
        DataField = 'CtaMerRecJudicialmente'
        DataSource = DM.dstConfiguracion
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 15
      end
      object DBLookupComboBox16: TDBLookupComboBox
        Left = 475
        Top = 39
        Width = 209
        Height = 21
        DataField = 'CtaObligacionAPagar'
        DataSource = DM.dstConfiguracion
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 16
      end
      object DBLookupComboBox17: TDBLookupComboBox
        Left = 474
        Top = 80
        Width = 209
        Height = 21
        DataField = 'CtaPagoDeHonorario'
        DataSource = DM.dstConfiguracion
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 17
      end
      object DBLookupComboBox18: TDBLookupComboBox
        Left = 243
        Top = 388
        Width = 209
        Height = 21
        DataField = 'CtaMercaderiaDeReventa'
        DataSource = DM.dstConfiguracion
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 18
      end
      object DBLookupComboBox19: TDBLookupComboBox
        Left = 242
        Top = 251
        Width = 209
        Height = 21
        DataField = 'CtaIVACreditoFiscal'
        DataSource = DM.dstConfiguracion
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 19
      end
      object DBLookupComboBox21: TDBLookupComboBox
        Left = 474
        Top = 210
        Width = 209
        Height = 21
        DataField = 'CtaRecuperoJudicial'
        DataSource = DM.dstConfiguracion
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 20
      end
      object DBLookupComboBox22: TDBLookupComboBox
        Left = 474
        Top = 253
        Width = 209
        Height = 21
        DataField = 'CtaServicio'
        DataSource = DM.dstConfiguracion
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 21
      end
      object DBLookupComboBox23: TDBLookupComboBox
        Left = 474
        Top = 390
        Width = 209
        Height = 21
        DataField = 'CtaValorAlCobro'
        DataSource = DM.dstConfiguracion
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 22
      end
      object DBLookupComboBox25: TDBLookupComboBox
        Left = 475
        Top = 300
        Width = 209
        Height = 21
        DataField = 'CtaServicioAPAgar'
        DataSource = DM.dstConfiguracion
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 23
      end
      object DBLookupComboBox26: TDBLookupComboBox
        Left = 474
        Top = 168
        Width = 209
        Height = 21
        DataField = 'CtaProveedor'
        DataSource = DM.dstConfiguracion
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 24
      end
      object DBLookupComboBox27: TDBLookupComboBox
        Left = 474
        Top = 435
        Width = 209
        Height = 21
        DataField = 'CtaVenta'
        DataSource = DM.dstConfiguracion
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 25
      end
      object DBLookupComboBox24: TDBLookupComboBox
        Left = 474
        Top = 346
        Width = 209
        Height = 21
        DataField = 'CtaValorADepositar'
        DataSource = DM.dstConfiguracion
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 26
      end
      object DBLookupComboBox20: TDBLookupComboBox
        Left = 474
        Top = 125
        Width = 209
        Height = 21
        DataField = 'CtaTarjetaDeCredito'
        DataSource = DM.dstConfiguracion
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqCuenta
        TabOrder = 27
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Parametros'
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 113
        Height = 13
        Caption = 'N'#250'mero de Factura:'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label17: TLabel
        Left = 16
        Top = 72
        Width = 102
        Height = 13
        Caption = 'Codigo de Barras:'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label49: TLabel
        Left = 16
        Top = 112
        Width = 79
        Height = 13
        Caption = 'Comprobante:'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label50: TLabel
        Left = 16
        Top = 149
        Width = 48
        Height = 13
        Caption = 'Imprimir:'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label51: TLabel
        Left = 16
        Top = 187
        Width = 73
        Height = 13
        Caption = 'Vista Previa:'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 144
        Top = 24
        Width = 193
        Height = 21
        DataField = 'NroFactura'
        DataSource = DM.dstConfiguracion
        TabOrder = 0
      end
      object ReporteDBLookupComboBox: TDBLookupComboBox
        Left = 144
        Top = 111
        Width = 193
        Height = 21
        DataField = 'ImprimirTipo'
        DataSource = DM.dstConfiguracion
        KeyField = 'Codigo'
        ListField = 'Descripcion'
        ListSource = DM.dsqImprimir
        TabOrder = 1
        OnClick = ReporteDBLookupComboBoxClick
      end
      object DBComboBox1: TDBComboBox
        Left = 144
        Top = 149
        Width = 57
        Height = 21
        DataField = 'Imprimir'
        DataSource = DM.dstConfiguracion
        Items.Strings = (
          'SI'
          'NO')
        TabOrder = 2
      end
      object DBComboBox2: TDBComboBox
        Left = 144
        Top = 184
        Width = 57
        Height = 21
        DataField = 'ImprimirMostrar'
        DataSource = DM.dstConfiguracion
        Items.Strings = (
          'SI'
          'NO')
        TabOrder = 3
      end
      object DBComboBox3: TDBComboBox
        Left = 144
        Top = 72
        Width = 57
        Height = 21
        DataField = 'CodigoBarra'
        DataSource = DM.dstConfiguracion
        Items.Strings = (
          'SI'
          'NO')
        TabOrder = 4
      end
      object ConfigurarFEButton: TButton
        Left = 343
        Top = 110
        Width = 57
        Height = 25
        Caption = 'Configurar'
        TabOrder = 5
        Visible = False
        OnClick = ConfigurarFEButtonClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Lista de Precios'
      ImageIndex = 2
      object Label2: TLabel
        Left = 47
        Top = 56
        Width = 42
        Height = 13
        Caption = 'Precio 1:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 47
        Top = 96
        Width = 42
        Height = 13
        Caption = 'Precio 2:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 47
        Top = 136
        Width = 42
        Height = 13
        Caption = 'Precio 3:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 50
        Top = 176
        Width = 39
        Height = 13
        Caption = 'Precio4:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 47
        Top = 216
        Width = 42
        Height = 13
        Caption = 'Precio 5:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 47
        Top = 256
        Width = 42
        Height = 13
        Caption = 'Precio 6:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 64
        Top = 296
        Width = 25
        Height = 13
        Caption = 'Lista:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 96
        Top = 32
        Width = 62
        Height = 13
        Caption = 'Porcentaje'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 164
        Top = 56
        Width = 8
        Height = 13
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 164
        Top = 96
        Width = 8
        Height = 13
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 164
        Top = 136
        Width = 8
        Height = 13
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 164
        Top = 176
        Width = 8
        Height = 13
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 164
        Top = 216
        Width = 8
        Height = 13
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 164
        Top = 256
        Width = 8
        Height = 13
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 164
        Top = 296
        Width = 8
        Height = 13
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit2: TDBEdit
        Left = 96
        Top = 56
        Width = 65
        Height = 21
        DataField = 'PP1'
        DataSource = DM.dstConfiguracion
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 96
        Top = 96
        Width = 65
        Height = 21
        DataField = 'PP2'
        DataSource = DM.dstConfiguracion
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 96
        Top = 136
        Width = 65
        Height = 21
        DataField = 'PP3'
        DataSource = DM.dstConfiguracion
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 96
        Top = 176
        Width = 65
        Height = 21
        DataField = 'PP4'
        DataSource = DM.dstConfiguracion
        TabOrder = 3
      end
      object DBEdit6: TDBEdit
        Left = 95
        Top = 213
        Width = 65
        Height = 21
        DataField = 'PP5'
        DataSource = DM.dstConfiguracion
        TabOrder = 4
      end
      object DBEdit7: TDBEdit
        Left = 96
        Top = 256
        Width = 65
        Height = 21
        DataField = 'PP6'
        DataSource = DM.dstConfiguracion
        TabOrder = 5
      end
      object DBEdit8: TDBEdit
        Left = 96
        Top = 296
        Width = 65
        Height = 21
        DataField = 'Precio'
        DataSource = DM.dstConfiguracion
        TabOrder = 6
      end
    end
  end
end
