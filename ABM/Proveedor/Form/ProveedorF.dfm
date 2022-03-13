object ProveedorForm: TProveedorForm
  Left = 182
  Top = 90
  BorderIcons = [biMaximize]
  BorderStyle = bsSingle
  Caption = 'Altas, Bajas y Modificaciones de Proveedores'
  ClientHeight = 475
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 435
    Height = 475
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Informaci'#243'n General'
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Nombre'
        FocusControl = dbeNombre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 56
      end
      object Label3: TLabel
        Left = 0
        Top = 80
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Direcci'#243'n Comercial'
        FocusControl = DBEdit3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 141
      end
      object VendedorLabel: TLabel
        Left = 632
        Top = 64
        Width = 9
        Height = 16
        Caption = '...'
      end
      object Label4: TLabel
        Left = 0
        Top = 320
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Celular'
        FocusControl = DBEdit9
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 50
      end
      object Label9: TLabel
        Left = 0
        Top = 120
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Tel'#233'fono'
        FocusControl = DBEdit10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 63
      end
      object Label11: TLabel
        Left = 0
        Top = 160
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Fax'
        FocusControl = DBEdit12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 26
      end
      object Label6: TLabel
        Left = 0
        Top = 200
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Provincia'
        FocusControl = DBEdit6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 66
      end
      object Label7: TLabel
        Left = 0
        Top = 240
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Departamento'
        FocusControl = DBEdit7
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 99
      end
      object Label27: TLabel
        Left = 0
        Top = 280
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Localidad'
        FocusControl = DBEdit24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 70
      end
      object Label13: TLabel
        Left = 0
        Top = 40
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Direcci'#243'n'
        FocusControl = DBEdit3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 67
      end
      object dbeNombre: TDBEdit
        Left = 0
        Top = 16
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'Nombre'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 0
        Top = 56
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'DIRECCION'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit9: TDBEdit
        Left = 0
        Top = 336
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'Celular'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object DBEdit4: TDBEdit
        Left = 0
        Top = 96
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'DIRECCIONCOMERCIAL'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit10: TDBEdit
        Left = 0
        Top = 136
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'Telefono'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit12: TDBEdit
        Left = 0
        Top = 176
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'Fax'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 0
        Top = 216
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'Provincia'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object DBEdit7: TDBEdit
        Left = 0
        Top = 256
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'Departamento'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object DBEdit24: TDBEdit
        Left = 0
        Top = 296
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'Ciudad'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnExit = DBEdit24Exit
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Notas'
      ImageIndex = 1
      object DBMemo1: TDBMemo
        Left = 0
        Top = 0
        Width = 427
        Height = 444
        Align = alClient
        DataField = 'Notas'
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Contabilidad'
      ImageIndex = 2
      object Label15: TLabel
        Left = 0
        Top = 136
        Width = 427
        Height = 16
        Align = alTop
        Alignment = taRightJustify
        Caption = 'Cuenta Contable Asociada a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 229
        ExplicitWidth = 198
      end
      object Label24: TLabel
        Left = 0
        Top = 40
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Ingresos Brutos'
        FocusControl = DBEdit20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 109
      end
      object Label25: TLabel
        Left = 0
        Top = 0
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'CUIT'
        FocusControl = DBEdit22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 36
      end
      object Label38: TLabel
        Left = 0
        Top = 80
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Categor'#237'a de IVA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 119
      end
      object IVALabel: TLabel
        Left = 0
        Top = 120
        Width = 427
        Height = 16
        Align = alTop
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 9
      end
      object Label54: TLabel
        Left = 0
        Top = 192
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Anticipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 57
      end
      object Label52: TLabel
        Left = 0
        Top = 152
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Nombre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 56
      end
      object Label51: TLabel
        Left = 0
        Top = 232
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 33
      end
      object DBEdit20: TDBEdit
        Left = 0
        Top = 56
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'IIBB'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit22: TDBEdit
        Left = 0
        Top = 16
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'CUIT'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object IVADBComboBox: TDBComboBox
        Left = 0
        Top = 96
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'IVA'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Items.Strings = (
          'CF'
          'MT'
          'RI'
          'EX'
          'NR')
        ParentFont = False
        TabOrder = 2
        OnChange = IVADBComboBoxChange
      end
      object CtaNombreDBLookupComboBox: TDBLookupComboBox
        Left = 0
        Top = 168
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'CtaNombre'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dstCuenta
        ParentFont = False
        TabOrder = 3
      end
      object CtaAnticipoDBLookupComboBox: TDBLookupComboBox
        Left = 0
        Top = 208
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'CtaAnticipo'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dstCuenta
        ParentFont = False
        TabOrder = 5
      end
      object CtaTipoDBLookupComboBox: TDBLookupComboBox
        Left = 0
        Top = 248
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'CtaTipo'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dstCuenta
        ParentFont = False
        TabOrder = 4
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Datos Secundarios'
      ImageIndex = 3
      object Label19: TLabel
        Left = 0
        Top = 0
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Nombre del Titular'
        FocusControl = DBEdit16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 130
      end
      object Label12: TLabel
        Left = 0
        Top = 240
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Email'
        FocusControl = DBEdit13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 40
      end
      object Label28: TLabel
        Left = 0
        Top = 280
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Messenger'
        FocusControl = DBEdit23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 78
      end
      object Label23: TLabel
        Left = 0
        Top = 40
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'DNI'
        FocusControl = DBEdit19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 27
      end
      object Label26: TLabel
        Left = 0
        Top = 80
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Rubro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 43
      end
      object Label5: TLabel
        Left = 0
        Top = 360
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Pais'
        FocusControl = DBEdit5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 32
      end
      object Label21: TLabel
        Left = 0
        Top = 120
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Codigo Postal'
        FocusControl = DBEdit17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 99
      end
      object Label22: TLabel
        Left = 0
        Top = 160
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Codigo de Area'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 110
      end
      object Label10: TLabel
        Left = 0
        Top = 200
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Extenci'#243'n'
        FocusControl = DBEdit11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 68
      end
      object Label8: TLabel
        Left = 261
        Top = 288
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 0
        Top = 320
        Width = 427
        Height = 16
        Align = alTop
        Caption = 'Dias Cr'#233'dito'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 87
      end
      object DBEdit16: TDBEdit
        Left = 0
        Top = 16
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'Gerente'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit13: TDBEdit
        Left = 0
        Top = 256
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'Email'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object DBEdit23: TDBEdit
        Left = 0
        Top = 296
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'MSN'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object DBEdit19: TDBEdit
        Left = 0
        Top = 56
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'Documento'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit21: TDBEdit
        Left = 0
        Top = 96
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'Rubro'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 0
        Top = 376
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'Pais'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object DBEdit17: TDBEdit
        Left = 0
        Top = 136
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'CP'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit11: TDBEdit
        Left = 0
        Top = 216
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'Extencion'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object DBEdit18: TDBEdit
        Left = 0
        Top = 176
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'CodigoArea'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit1: TDBEdit
        Left = 0
        Top = 336
        Width = 427
        Height = 24
        Align = alTop
        DataField = 'DiasCredito'
        DataSource = DM.dstProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
    end
  end
  object Panel1: TPanel
    Left = 435
    Top = 0
    Width = 75
    Height = 475
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
      Top = 101
      Width = 73
      Height = 16
      Align = alTop
      Caption = 'Nro. Cta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 57
    end
    object SiBitBtn: TBitBtn
      Left = 1
      Top = 374
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
      Top = 424
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
      Top = 26
      Width = 73
      Height = 25
      Align = alTop
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = ImprimirBitBtnClick
    end
    object DBNavigator1: TDBNavigator
      Left = 9
      Top = 486
      Width = 120
      Height = 32
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete]
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
      TabOrder = 3
    end
    object BuscarBitBtn: TBitBtn
      Left = 1
      Top = 1
      Width = 73
      Height = 25
      Align = alTop
      Caption = 'Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BuscarBitBtnClick
    end
    object bExportar: TButton
      Left = 1
      Top = 51
      Width = 73
      Height = 25
      Align = alTop
      Caption = 'Exportar'
      TabOrder = 5
      OnClick = bExportarClick
    end
    object bImportar: TButton
      Left = 1
      Top = 76
      Width = 73
      Height = 25
      Align = alTop
      Caption = 'Importar'
      TabOrder = 6
      OnClick = bImportarClick
    end
    object CodigoDBEdit: TDBEdit
      Left = 1
      Top = 117
      Width = 73
      Height = 24
      Align = alTop
      DataField = 'CODIGO'
      DataSource = DM.dstProveedor
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
  end
end
