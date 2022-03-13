object VendedorForm: TVendedorForm
  Left = 182
  Top = 90
  Caption = 'Altas, Bajas y Modificaciones de Vendedores'
  ClientHeight = 488
  ClientWidth = 577
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
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel5: TPanel
    Left = 502
    Top = 0
    Width = 75
    Height = 463
    Align = alRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 51
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
    object AceptarBitBtn: TBitBtn
      Left = 1
      Top = 412
      Width = 73
      Height = 50
      Align = alBottom
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
      OnClick = AceptarBitBtnClick
    end
    object BitBtn2: TBitBtn
      Left = 1
      Top = 362
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
      OnClick = BitBtn2Click
    end
    object BitBtn4: TBitBtn
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
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn4Click
    end
    object BitBtn3: TBitBtn
      Left = 1
      Top = 1
      Width = 73
      Height = 25
      Align = alTop
      Caption = 'Buscar F5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn3Click
    end
    object CodigoDBEdit: TDBEdit
      Left = 1
      Top = 67
      Width = 73
      Height = 24
      Align = alTop
      DataField = 'Codigo'
      DataSource = DM.dstVendedor
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 502
    Height = 463
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Informaci'#243'n General'
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 494
        Height = 16
        Align = alTop
        Caption = 'Nombre'
        FocusControl = DBEdit2
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
        Top = 40
        Width = 494
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
      object Label4: TLabel
        Left = 0
        Top = 200
        Width = 494
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
      object Label20: TLabel
        Left = 0
        Top = 80
        Width = 494
        Height = 16
        Align = alTop
        Alignment = taRightJustify
        Caption = 'Trabajo'
        FocusControl = DBEdit3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 438
        ExplicitWidth = 56
      end
      object Label9: TLabel
        Left = 0
        Top = 120
        Width = 494
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
        Width = 494
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
        Top = 240
        Width = 494
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
        Top = 280
        Width = 494
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
        Top = 360
        Width = 494
        Height = 16
        Align = alTop
        Caption = 'Comisi'#243'n'
        FocusControl = DBEdit24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 65
      end
      object Label14: TLabel
        Left = 0
        Top = 320
        Width = 494
        Height = 16
        Align = alTop
        Caption = 'Ciudad'
        FocusControl = DBEdit27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 50
      end
      object Label32: TLabel
        Left = 0
        Top = 400
        Width = 494
        Height = 16
        Align = alTop
        Alignment = taRightJustify
        Caption = '%'
        FocusControl = DBEdit24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 480
        ExplicitWidth = 14
      end
      object DBEdit2: TDBEdit
        Left = 0
        Top = 16
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'Nombre'
        DataSource = DM.dstVendedor
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
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'Direccion'
        DataSource = DM.dstVendedor
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
        Top = 216
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'Celular'
        DataSource = DM.dstVendedor
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
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'DIRECCIONCOMERCIAL'
        DataSource = DM.dstVendedor
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
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'Telefono'
        DataSource = DM.dstVendedor
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
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'Fax'
        DataSource = DM.dstVendedor
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
        Top = 256
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'Provincia'
        DataSource = DM.dstVendedor
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
        Top = 296
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'Departamento'
        DataSource = DM.dstVendedor
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
        Top = 376
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'COMISION'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnExit = DBEdit24Exit
      end
      object DBEdit27: TDBEdit
        Left = 0
        Top = 336
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'CIUDAD'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Notas'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 24
      ExplicitWidth = 640
      ExplicitHeight = 438
      object DBMemo1: TDBMemo
        Left = 0
        Top = 0
        Width = 494
        Height = 432
        Align = alClient
        DataField = 'Notas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 640
        ExplicitHeight = 438
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Contabilidad'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 24
      ExplicitWidth = 640
      ExplicitHeight = 438
      object Label15: TLabel
        Left = 0
        Top = 136
        Width = 494
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
        ExplicitLeft = 296
        ExplicitWidth = 198
      end
      object Label24: TLabel
        Left = 0
        Top = 40
        Width = 494
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
        Width = 494
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
        Width = 494
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
        Width = 494
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
        Width = 494
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
        Width = 494
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
        Width = 494
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
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'IIBB'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitTop = 53
        ExplicitWidth = 709
      end
      object DBEdit22: TDBEdit
        Left = 0
        Top = 16
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'CUIT'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 709
      end
      object IVADBComboBox: TDBComboBox
        Left = 0
        Top = 96
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'IVA'
        DataSource = DM.dstVendedor
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
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'CtaNombre'
        DataSource = DM.dstVendedor
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
        ExplicitTop = 165
        ExplicitWidth = 709
      end
      object CtaAnticipoDBLookupComboBox: TDBLookupComboBox
        Left = 0
        Top = 208
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'CtaAnticipo'
        DataSource = DM.dstVendedor
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
        ExplicitWidth = 709
      end
      object CtaTipoDBLookupComboBox: TDBLookupComboBox
        Left = 0
        Top = 248
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'CtaTipo'
        DataSource = DM.dstVendedor
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
        ExplicitWidth = 709
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Datos Secundarios'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 24
      ExplicitWidth = 640
      ExplicitHeight = 438
      object Label19: TLabel
        Left = 0
        Top = 0
        Width = 126
        Height = 16
        Align = alTop
        Caption = 'Nombre de Titular'
        FocusControl = DBEdit16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 0
        Top = 240
        Width = 40
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
      end
      object Label28: TLabel
        Left = 0
        Top = 280
        Width = 78
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
      end
      object Label23: TLabel
        Left = 0
        Top = 40
        Width = 27
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
      end
      object Label26: TLabel
        Left = 0
        Top = 80
        Width = 43
        Height = 16
        Align = alTop
        Caption = 'Rubro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 0
        Top = 320
        Width = 32
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
      end
      object Label21: TLabel
        Left = 0
        Top = 120
        Width = 99
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
      end
      object Label22: TLabel
        Left = 0
        Top = 160
        Width = 110
        Height = 16
        Align = alTop
        Caption = 'Codigo de Area'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 0
        Top = 200
        Width = 68
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
      end
      object Label8: TLabel
        Left = 0
        Top = 360
        Width = 50
        Height = 16
        Align = alTop
        Caption = 'Ciudad'
        FocusControl = DBEdit8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit16: TDBEdit
        Left = 0
        Top = 16
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'TITULAR'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 709
      end
      object DBEdit13: TDBEdit
        Left = 0
        Top = 256
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'Email'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        ExplicitTop = 241
        ExplicitWidth = 709
      end
      object DBEdit23: TDBEdit
        Left = 0
        Top = 296
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'MSN'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        ExplicitTop = 281
        ExplicitWidth = 709
      end
      object DBEdit19: TDBEdit
        Left = 0
        Top = 56
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'Documento'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitWidth = 709
      end
      object DBEdit21: TDBEdit
        Left = 0
        Top = 96
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'Rubro'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        ExplicitWidth = 709
      end
      object DBEdit5: TDBEdit
        Left = 0
        Top = 336
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'Pais'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        ExplicitTop = 327
        ExplicitWidth = 709
      end
      object DBEdit17: TDBEdit
        Left = 0
        Top = 136
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'CP'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        ExplicitWidth = 709
      end
      object DBEdit11: TDBEdit
        Left = 0
        Top = 216
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'Extencion'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        ExplicitTop = 213
        ExplicitWidth = 709
      end
      object DBEdit18: TDBEdit
        Left = 0
        Top = 176
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'CodigoArea'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        ExplicitWidth = 709
      end
      object DBEdit8: TDBEdit
        Left = 0
        Top = 376
        Width = 494
        Height = 24
        Align = alTop
        DataField = 'Ciudad'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        ExplicitWidth = 709
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Parametros'
      ImageIndex = 4
      ExplicitLeft = 3
      ExplicitTop = 23
      ExplicitWidth = 709
      ExplicitHeight = 435
      object Label13: TLabel
        Left = 0
        Top = 0
        Width = 494
        Height = 16
        Align = alTop
        BiDiMode = bdLeftToRight
        Caption = 'T'#233'rminos del contrato'
        FocusControl = DBEdit14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ExplicitWidth = 152
      end
      object Label16: TLabel
        Left = 0
        Top = 40
        Width = 494
        Height = 16
        Align = alTop
        BiDiMode = bdLeftToRight
        Caption = 'L'#237'mite Cr'#233'dito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ExplicitWidth = 96
      end
      object Label17: TLabel
        Left = 0
        Top = 120
        Width = 494
        Height = 16
        Align = alTop
        BiDiMode = bdLeftToRight
        Caption = 'Precio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ExplicitWidth = 46
      end
      object Label18: TLabel
        Left = 0
        Top = 80
        Width = 494
        Height = 16
        Align = alTop
        BiDiMode = bdLeftToRight
        Caption = 'Dias Cr'#233'dito'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ExplicitWidth = 87
      end
      object Label29: TLabel
        Left = 0
        Top = 176
        Width = 494
        Height = 16
        Align = alTop
        BiDiMode = bdLeftToRight
        Caption = 'Promociones'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ExplicitWidth = 92
      end
      object Label30: TLabel
        Left = 0
        Top = 216
        Width = 494
        Height = 16
        Align = alTop
        BiDiMode = bdLeftToRight
        Caption = 'Almanaques'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ExplicitWidth = 87
      end
      object lPrecioTipo: TLabel
        Left = 0
        Top = 160
        Width = 494
        Height = 16
        Align = alTop
        BiDiMode = bdRightToLeft
        Caption = '0=Lista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        ExplicitLeft = 452
        ExplicitWidth = 42
      end
      object DBEdit14: TDBEdit
        Left = 0
        Top = 16
        Width = 494
        Height = 24
        Align = alTop
        BiDiMode = bdLeftToRight
        DataField = 'TERMINOS'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
        ExplicitTop = 13
        ExplicitWidth = 709
      end
      object DBEdit15: TDBEdit
        Left = 0
        Top = 56
        Width = 494
        Height = 24
        Align = alTop
        BiDiMode = bdLeftToRight
        DataField = 'LIMITECREDITO'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 1
        ExplicitTop = 47
        ExplicitWidth = 709
      end
      object DBComboBox1: TDBComboBox
        Left = 0
        Top = 136
        Width = 494
        Height = 24
        Align = alTop
        BiDiMode = bdLeftToRight
        DataField = 'PRECIO'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '0')
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit1: TDBEdit
        Left = 0
        Top = 96
        Width = 494
        Height = 24
        Align = alTop
        BiDiMode = bdLeftToRight
        DataField = 'DiasCredito'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 2
        ExplicitTop = 87
        ExplicitWidth = 709
      end
      object DBCheckBox1: TDBCheckBox
        Left = 0
        Top = 256
        Width = 494
        Height = 17
        Align = alTop
        BiDiMode = bdLeftToRight
        Caption = 'Suspendido'
        DataField = 'Suspendido'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 6
        ExplicitLeft = -2
        ExplicitTop = 240
        ExplicitWidth = 709
      end
      object DBEdit25: TDBEdit
        Left = 0
        Top = 192
        Width = 494
        Height = 24
        Align = alTop
        BiDiMode = bdLeftToRight
        DataField = 'Promociones'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 4
        ExplicitTop = 174
        ExplicitWidth = 709
      end
      object DBEdit26: TDBEdit
        Left = 0
        Top = 232
        Width = 494
        Height = 24
        Align = alTop
        BiDiMode = bdLeftToRight
        DataField = 'Almanaques'
        DataSource = DM.dstVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 5
        ExplicitTop = 208
        ExplicitWidth = 709
      end
    end
  end
  object pButton: TPanel
    Left = 0
    Top = 463
    Width = 577
    Height = 25
    Align = alBottom
    TabOrder = 2
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 575
      Height = 23
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
