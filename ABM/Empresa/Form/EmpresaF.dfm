object EmpresaForm: TEmpresaForm
  Left = 150
  Top = 96
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSingle
  Caption = 'Datos de Empresa'
  ClientHeight = 468
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 701
    Height = 468
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Informaci'#243'n General'
      object Label4: TLabel
        Left = 93
        Top = 280
        Width = 40
        Height = 13
        Caption = 'Celular'
        FocusControl = DBEdit9
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 82
        Top = 304
        Width = 51
        Height = 13
        Caption = 'Tel'#233'fono'
        FocusControl = DBEdit10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 112
        Top = 328
        Width = 21
        Height = 13
        Caption = 'Fax'
        FocusControl = DBEdit12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 435
        Top = 118
        Width = 31
        Height = 13
        Caption = 'Email'
        FocusControl = DBEdit13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 45
        Top = 256
        Width = 88
        Height = 13
        Caption = 'Codigo de Area'
        FocusControl = DBEdit18
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label28: TLabel
        Left = 404
        Top = 142
        Width = 62
        Height = 13
        Caption = 'Messenger'
        FocusControl = DBEdit23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 17
        Top = 40
        Width = 116
        Height = 13
        Caption = 'Nombre de Fantas'#237'a'
        FocusControl = DBEdit2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 78
        Top = 112
        Width = 55
        Height = 13
        Caption = 'Direcci'#243'n'
        FocusControl = DBEdit3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 108
        Top = 136
        Width = 25
        Height = 13
        Caption = 'Pais'
        FocusControl = DBEdit5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 79
        Top = 160
        Width = 54
        Height = 13
        Caption = 'Provincia'
        FocusControl = DBEdit6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 53
        Top = 184
        Width = 80
        Height = 13
        Caption = 'Departamento'
        FocusControl = DBEdit7
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 93
        Top = 208
        Width = 40
        Height = 13
        Caption = 'Ciudad'
        FocusControl = DBEdit8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 31
        Top = 64
        Width = 102
        Height = 13
        Caption = 'Nombre de Titular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 7
        Top = 88
        Width = 126
        Height = 13
        Caption = 'Direcci'#243'n Facturaci'#243'n'
        FocusControl = DBEdit3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 54
        Top = 232
        Width = 79
        Height = 13
        Caption = 'Codigo Postal'
        FocusControl = DBEdit17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 462
        Top = 40
        Width = 5
        Height = 13
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label24: TLabel
        Left = 45
        Top = 353
        Width = 89
        Height = 13
        Caption = 'Ingresos Brutos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 436
        Top = 40
        Width = 30
        Height = 13
        Caption = 'CUIT'
        FocusControl = CUITDBEdit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label26: TLabel
        Left = 431
        Top = 67
        Width = 35
        Height = 13
        Caption = 'Rubro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label27: TLabel
        Left = 367
        Top = 91
        Width = 99
        Height = 13
        Caption = 'Condici'#243'n de IVA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label23: TLabel
        Left = 443
        Top = 166
        Width = 23
        Height = 13
        Caption = 'DNI'
        FocusControl = DBEdit19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Image1: TImage
        Left = 472
        Top = 247
        Width = 202
        Height = 127
        Hint = 'CLICK PARA CAMBIAR'
        Center = True
        ParentShowHint = False
        Picture.Data = {
          0A544A504547496D61676585070000FFD8FFE000104A46494600010200006400
          640000FFEC00114475636B79000100040000003C0000FFEE000E41646F626500
          64C000000001FFDB0084000604040405040605050609060506090B080606080B
          0C0A0A0B0A0A0C100C0C0C0C0C0C100C0E0F100F0E0C1313141413131C1B1B1B
          1C1F1F1F1F1F1F1F1F1F1F010707070D0C0D181010181A1511151A1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1FFFC00011080032005003011100021101031101FF
          C400710000020203010000000000000000000000000705080304060201010000
          0000000000000000000000000000100001030303030302040407000000000002
          01030411050600120721311341220851326171141581427233A15282B2234325
          110100000000000000000000000000000000FFDA000C03010002110311003F00
          B53A04B659F2C38EB17C92E38F4FB75DDD9B6C78A3BEE30CC6268887BA829C90
          254FCC53411F1BE67714BB201A7A0DE62815773EF468EA03D2BD51B90E1F5EDD
          0740D7C2F90B0DCD6014EC66E8D5C1A6E88FB63B81E6957B238D1A0B815F4A8D
          17D341D1680D01A0E179079B38EB0271235FAE5FFA443BC2D91415F92A2A9545
          211F686EF4DE435D073581FC9FC0736CB60E2F6BB7DD58B84FF2F85C94CC6065
          3C0C9BE5B89B90E97DAD2D282BD740DFD01A0A0BC856E85379F72A59E0AE418D
          3A44890D8AD14C5A4DDB6BE95FAE819513E38C199198BB1C866695C2304862DE
          AD14711F302188F951C77AA5695D9A05259EF53F8DB3C8F9158D1E61B812CA2D
          D6DC6552DA07B6445729ED245415A57B2A57BA682DC73073FE33C796B8A40DFE
          EB7AB937E6816E6CF6278953A3CF1D0B6057A274A92F44ECAA808D89F357901B
          98322763F6B7AD646B4619FD432F28D7B23E4E3C15A7AF8BF8681DF339EF1C9B
          C3B75CF2C4E279E24631185229BD99A4A2D36D3A89545FF91D05E9F70AE82A6E
          0188DF33ABD48BACC7167DE2E2F9232ECA25DA6F17B9D7DE3A17B1A1EBD13E88
          89A0B0BC4FF17570ECE6D9979E521717E07995E80DC2F1891C88CE30A82F2BE7
          D055DAA2F8FAD3D34160F406828766CFBA1CF599C76D114E64896C0097A918D1
          13AE81EC9CBB8862F68811262C99571851A336EDB988EEAB8AE0323ED470C41A
          A75F43D022E507EBEF12214D848FE53995D56625B1A5DC919253A46805D2BFF6
          556A9D052ABA0D4F90F1DA67954E249071A8CCC586DB2A7D6ACA322951FC37EE
          D07717EC26EFC82D5BF16C472AC6E35845A67F6DC7653A8DDC11D6184579C506
          E33CF254B792921D093412707E3FE798C718E658ECF7604F91728ED4D82D4037
          9D223846AF1051D699F71EC441A56ABA05CF0DF28DAF1A93146732A9FA727515
          5BA555B7C450A95F545015D046F335B1A9D7A9997C398DC8B75D9F5364101F07
          03DA3D0FCAD360ABFD045A0B63F17EFB75BCF0DD9DDB9193AEC437A1B2F1F522
          6187145AEBEBB07D9FE9D035B41553907E2BF25DFF00912F3945A6E9698EC4F9
          872A2A3CFCA0785097A6E408C628BF912E825F26E1BE5E76EA529CBB5AC6090B
          4012149F37C545A1025A7812BEE1554F7E83B1E2AE17C5F02577269538AFF964
          9154FDC1E1404695C4A1032D54946B5A11295553B51155341B3CABC2363E54B2
          4490EBCB6DC8ADE06D44B880A18A86E55F0BC154DEDEEEA945A8AAAAA7754504
          B33F1633AB0CF62E73B24836F5B69FEA21DE2293E6E368C2EF123036DA115144
          AFDF4FC740E4C4B96ED9985E52240897471CB7C722917B7620C782E146514749
          B3F2175DC55D8489A05D723FC73C7B2FB8B99061F39AB6CD9AAAEBD1813C901E
          756AAAE3641EE67717DC88849F444D06ADB7E2266D78931032DC822C6B3C4411
          6E3C0575F7943AEF44F336C836ABE8BEEFCBEA16731BC76D18DD8A158ECEC246
          B6DBDB4663329D6889D554957A91112A912AF755AE824B4068388E69CA2E38B7
          19DEAFB6D869366C36DB565B242200571D16D5D341542516D0F72FE5F4D02E38
          AAFD90DEC42F573CBE05F6D0FC3F2CB831638B4FC6985B490095285414DD5DE8
          8AABD93411F62CCF9AB3D5B8DCF19BBC4C371D84E9C7B4447E204A7A5287BB73
          E4E8B9B116A9B883B76445A574181FE41CE390789B20B3DC5E6AC391D8A49C5C
          85D0644D8950C5B700C477AAF8488D3DC42BFCBD3A1510342F16ACA4384A7AD8
          725F1E3A76F23286511821723803A8FB68E28EF1F319216FAD529F8AE83BEF8C
          963CBE2E096AB8DD2FC13EC92A10A5AED0311964A251C2AD6402791DE9FE6D03
          9B40680D01A081CE67E4B071B93231BB3B77EB98A8225ADD7418175A52447537
          9FB6BB2B445FF1EDA04C60D89668BC8936FE986B383E3F262F85FB50BCC48591
          216B531165051B45DC95A0A27B7A5555741ED1BE70C464CCB647C55BC8ED6E1A
          9DA674690C45DB5F68A3C0545FA57F1AD0953B06CDB389335638A7322BDA04BC
          CB246243816E8A43E36CC80901ADEAA8246A464AAB5DA9D93EAA13561E3FBDC9
          E026B0E94C241BFAD95F8BE275468124F7EC1321524A569554AF4D067F8F6E67
          D03166716C9F192B4316367C516E8B25A7524A93A6BB51A6EAA3B057EEDCA8BF
          8681B1A0340680D01A0F2BF7A76EDEBDF418A67F693FAC3FDC9A0CFA0F1FCCBD
          BF8F7D07889FDA5FB7EE5FB3B6833680D07FFFD9}
        ShowHint = True
        Stretch = True
        OnClick = Image1Click
      end
      object Label1: TLabel
        Left = 436
        Top = 247
        Width = 29
        Height = 13
        Caption = 'Logo'
        FocusControl = DBEdit19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 407
        Top = 193
        Width = 59
        Height = 13
        Caption = 'Inic.Activ.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 439
        Top = 220
        Width = 27
        Height = 13
        Caption = 'Web'
        FocusControl = DBEdit11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 350
        Top = 67
        Width = 4
        Height = 13
        Caption = '*'
      end
      object Label18: TLabel
        Left = 350
        Top = 91
        Width = 4
        Height = 13
        Caption = '*'
      end
      object Label29: TLabel
        Left = 674
        Top = 121
        Width = 4
        Height = 13
        Caption = '*'
      end
      object Label30: TLabel
        Left = 674
        Top = 43
        Width = 4
        Height = 13
        Caption = '*'
      end
      object Label31: TLabel
        Left = 674
        Top = 94
        Width = 4
        Height = 13
        Caption = '*'
      end
      object Label32: TLabel
        Left = 237
        Top = 160
        Width = 4
        Height = 13
        Caption = '*'
      end
      object Label33: TLabel
        Left = 237
        Top = 211
        Width = 4
        Height = 13
        Caption = '*'
      end
      object DBEdit9: TDBEdit
        Left = 140
        Top = 280
        Width = 209
        Height = 21
        DataField = 'Celular'
        DataSource = DM.dstEmpresa
        TabOrder = 10
      end
      object DBEdit10: TDBEdit
        Left = 140
        Top = 304
        Width = 209
        Height = 21
        DataField = 'Telefono'
        DataSource = DM.dstEmpresa
        TabOrder = 11
      end
      object DBEdit12: TDBEdit
        Left = 140
        Top = 328
        Width = 209
        Height = 21
        DataField = 'Fax'
        DataSource = DM.dstEmpresa
        TabOrder = 12
      end
      object DBEdit13: TDBEdit
        Left = 473
        Top = 118
        Width = 201
        Height = 21
        DataField = 'Email'
        DataSource = DM.dstEmpresa
        TabOrder = 13
      end
      object DBEdit18: TDBEdit
        Left = 140
        Top = 256
        Width = 97
        Height = 21
        DataField = 'CodigoArea'
        DataSource = DM.dstEmpresa
        TabOrder = 9
      end
      object DBEdit23: TDBEdit
        Left = 473
        Top = 142
        Width = 201
        Height = 21
        DataField = 'MSN'
        DataSource = DM.dstEmpresa
        TabOrder = 14
      end
      object DBEdit2: TDBEdit
        Left = 140
        Top = 40
        Width = 209
        Height = 21
        DataField = 'Nombre'
        DataSource = DM.dstEmpresa
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 140
        Top = 112
        Width = 209
        Height = 21
        DataField = 'Direccion'
        DataSource = DM.dstEmpresa
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 140
        Top = 88
        Width = 209
        Height = 21
        DataField = 'DireccionComercial'
        DataSource = DM.dstEmpresa
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 140
        Top = 136
        Width = 97
        Height = 21
        DataField = 'Pais'
        DataSource = DM.dstEmpresa
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 140
        Top = 160
        Width = 97
        Height = 21
        DataField = 'Provincia'
        DataSource = DM.dstEmpresa
        TabOrder = 5
      end
      object DBEdit7: TDBEdit
        Left = 140
        Top = 184
        Width = 97
        Height = 21
        DataField = 'Departamento'
        DataSource = DM.dstEmpresa
        TabOrder = 6
      end
      object DBEdit8: TDBEdit
        Left = 140
        Top = 208
        Width = 97
        Height = 21
        DataField = 'Ciudad'
        DataSource = DM.dstEmpresa
        TabOrder = 7
      end
      object DBEdit17: TDBEdit
        Left = 140
        Top = 232
        Width = 97
        Height = 21
        DataField = 'CP'
        DataSource = DM.dstEmpresa
        TabOrder = 8
      end
      object DBEdit1: TDBEdit
        Left = 140
        Top = 64
        Width = 209
        Height = 21
        DataField = 'Titular'
        DataSource = DM.dstEmpresa
        TabOrder = 1
      end
      object DBEdit21: TDBEdit
        Left = 473
        Top = 67
        Width = 201
        Height = 21
        DataField = 'Rubro'
        DataSource = DM.dstEmpresa
        TabOrder = 17
      end
      object CUITDBEdit: TDBEdit
        Left = 473
        Top = 40
        Width = 201
        Height = 21
        DataField = 'CUIT'
        DataSource = DM.dstEmpresa
        TabOrder = 16
      end
      object IVADBComboBox: TDBComboBox
        Left = 472
        Top = 91
        Width = 202
        Height = 21
        DataField = 'IVA'
        DataSource = DM.dstEmpresa
        TabOrder = 18
        OnChange = IVADBComboBoxChange
      end
      object DBEdit19: TDBEdit
        Left = 472
        Top = 166
        Width = 202
        Height = 21
        DataField = 'DOCUMENTO'
        DataSource = DM.dstEmpresa
        TabOrder = 15
      end
      object DateTimePicker1: TDateTimePicker
        Left = 472
        Top = 193
        Width = 202
        Height = 21
        Date = 43466.000000000000000000
        Time = 0.892104178237787000
        TabOrder = 19
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 140
        Top = 353
        Width = 209
        Height = 21
        DataField = 'IIBB'
        DataSource = DM.dstEmpresa
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dsqIIBB
        TabOrder = 20
      end
      object DBEdit11: TDBEdit
        Left = 471
        Top = 220
        Width = 203
        Height = 21
        DataField = 'WEB'
        DataSource = DM.dstEmpresa
        TabOrder = 21
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Notas'
      ImageIndex = 1
      object DBMemo1: TDBMemo
        Left = 0
        Top = 0
        Width = 693
        Height = 440
        Align = alClient
        DataField = 'Notas'
        DataSource = DM.dstEmpresa
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Contabilidad'
      ImageIndex = 2
      object Label52: TLabel
        Left = 142
        Top = 83
        Width = 37
        Height = 13
        Caption = 'Nombre'
      end
      object Label51: TLabel
        Left = 142
        Top = 123
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object Label54: TLabel
        Left = 142
        Top = 163
        Width = 38
        Height = 13
        Caption = 'Anticipo'
      end
      object Label50: TLabel
        Left = 191
        Top = 51
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
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 191
        Top = 163
        Width = 351
        Height = 21
        DataField = 'CtaAnticipo'
        DataSource = DM.dstEmpresa
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dstCuenta
        TabOrder = 0
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 191
        Top = 123
        Width = 351
        Height = 21
        DataField = 'CtaTipo'
        DataSource = DM.dstEmpresa
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dstCuenta
        TabOrder = 1
      end
      object CuentaDBLookupComboBox: TDBLookupComboBox
        Left = 191
        Top = 83
        Width = 351
        Height = 21
        DataField = 'CtaNombre'
        DataSource = DM.dstEmpresa
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = DM.dstCuenta
        TabOrder = 2
      end
    end
  end
  object Panel1: TPanel
    Left = 701
    Top = 0
    Width = 93
    Height = 468
    Align = alRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object Label14: TLabel
      Left = 1
      Top = 1
      Width = 91
      Height = 13
      Align = alTop
      Caption = 'Pto.Vta. Nro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 71
    end
    object SiBitBtn: TBitBtn
      Left = 1
      Top = 367
      Width = 91
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
      Top = 417
      Width = 91
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
      Top = 38
      Width = 91
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
      Visible = False
      OnClick = ImprimirBitBtnClick
    end
    object CodigoDBEdit: TDBEdit
      Left = 1
      Top = 14
      Width = 91
      Height = 24
      Align = alTop
      DataField = 'Codigo'
      DataSource = DM.dstEmpresa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 400
    Top = 396
  end
end
