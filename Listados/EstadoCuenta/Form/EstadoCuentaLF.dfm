object EstadoCuentaLForm: TEstadoCuentaLForm
  Left = 636
  Top = 160
  BorderStyle = bsSingle
  Caption = 'Estado de Cuenta de Clientes'
  ClientHeight = 468
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 794
    Height = 121
    Align = alTop
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    object Label3: TLabel
      Left = 19
      Top = 19
      Width = 40
      Height = 13
      Align = alCustom
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ClienteLabel: TLabel
      Left = 65
      Top = 38
      Width = 152
      Height = 25
      AutoSize = False
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label8: TLabel
      Left = 191
      Top = 19
      Width = 26
      Height = 13
      Caption = 'Plan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PlanLabel: TLabel
      Left = 223
      Top = 43
      Width = 9
      Height = 16
      Alignment = taCenter
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 177
      Top = 63
      Width = 40
      Height = 13
      Caption = 'Cuotas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 174
      Top = 91
      Width = 43
      Height = 13
      Caption = 'Importe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CuotasLabel: TLabel
      Left = 223
      Top = 63
      Width = 6
      Height = 13
      Alignment = taCenter
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TotalLabel: TLabel
      Left = 223
      Top = 91
      Width = 6
      Height = 13
      Alignment = taCenter
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 711
      Top = 7
      Width = 62
      Height = 13
      Caption = 'MOSTRAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 263
      Top = 63
      Width = 54
      Height = 13
      Align = alCustom
      Caption = 'Rendidas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RendidasLabel: TLabel
      Left = 323
      Top = 63
      Width = 6
      Height = 13
      Align = alCustom
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 400
      Top = 19
      Width = 210
      Height = 75
      BiDiMode = bdLeftToRight
      Caption = ' Fechas '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 75
        Top = 44
        Width = 22
        Height = 13
        Caption = 'Fin:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 61
        Top = 16
        Width = 36
        Height = 13
        Caption = 'Inicio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DTP1: TDateTimePicker
        Left = 98
        Top = 16
        Width = 93
        Height = 21
        Date = 40179.000000000000000000
        Time = 0.873243958296370700
        TabOrder = 0
        OnCloseUp = DTP1CloseUp
      end
      object DTP2: TDateTimePicker
        Left = 98
        Top = 44
        Width = 94
        Height = 21
        Date = 37668.000000000000000000
        Time = 0.873295891200541600
        TabOrder = 1
        OnCloseUp = DTP2CloseUp
      end
    end
    object ClienteEdit: TEdit
      Left = 65
      Top = 16
      Width = 40
      Height = 21
      Align = alCustom
      TabOrder = 1
      Text = '0'
    end
    object BuscarBitBtn: TBitBtn
      Left = 103
      Top = 14
      Width = 50
      Height = 25
      Align = alCustom
      Caption = 'F5...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BuscarBitBtnClick
    end
    object PlanEdit: TEdit
      Left = 223
      Top = 16
      Width = 41
      Height = 21
      TabOrder = 3
      Text = '0'
    end
    object PlanBitBtn: TBitBtn
      Left = 263
      Top = 14
      Width = 49
      Height = 24
      Caption = 'F8...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = PlanBitBtnClick
    end
    object BitBtn1: TBitBtn
      Left = 697
      Top = 26
      Width = 49
      Height = 24
      Caption = 'A...z'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 745
      Top = 26
      Width = 49
      Height = 24
      Caption = 'Z...a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 697
      Top = 56
      Width = 49
      Height = 24
      Caption = 'IMP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 697
      Top = 86
      Width = 97
      Height = 24
      Caption = 'TODAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 745
      Top = 56
      Width = 49
      Height = 24
      Caption = 'PAG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 409
      Top = 35
      Width = 49
      Height = 49
      Caption = 'Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = BitBtn6Click
    end
  end
  object Panel2: TPanel
    Left = 698
    Top = 121
    Width = 96
    Height = 347
    Align = alRight
    Color = clBlack
    ParentBackground = False
    TabOrder = 1
    object Image1: TImage
      Left = 8
      Top = 212
      Width = 80
      Height = 50
      Hint = 'EXPORTAR A EXCEL EN FORMATO CSV'
      Align = alCustom
      ParentShowHint = False
      Picture.Data = {
        0A544A504547496D61676537080000FFD8FFE000104A46494600010200006400
        640000FFEC00114475636B79000100040000003C0000FFEE000E41646F626500
        64C000000001FFDB0084000604040405040605050609060506090B080606080B
        0C0A0A0B0A0A0C100C0C0C0C0C0C100C0E0F100F0E0C1313141413131C1B1B1B
        1C1F1F1F1F1F1F1F1F1F1F010707070D0C0D181010181A1511151A1F1F1F1F1F
        1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
        1F1F1F1F1F1F1F1F1F1F1F1FFFC00011080032005003011100021101031101FF
        C400960000010403010000000000000000000000060001050702040803010100
        0301010100000000000000000000000103040205061000020201030106020706
        07010000000001020304050011061221314151130722326171914214151681A2
        B2D22373A1E17233244454171100020103020502040700000000000000000102
        1112032104314151220561327181A113F091B1C1D1E162FFDA000C0301000211
        0311003F00EA93DDA0352EDE8AB202DBB3B7C918DB73B78F6F86AB9C92D39864
        53E6ACB7689238878055EBFDE62BBFD9AE7B9F3A1CD5987E6F73FF004803FB4B
        FCDA525D7E8455989CB5E3FF006C6DFDA5FE6D4D25D7E84D599C193BE6DD7536
        564492508E8630A7660DE218F96A75EA137508477EAC3A047DDFBD7687B5DCA6
        ED1B1254B95F1B624AF660768E58DD6324323A90CA47983A02A4F6F792E22CE2
        B8D4D94E418D7B934145EF4B3F3FCB8B86474432B498E2A21F5BA89EAAE5FA7A
        BE0DF6EDD01D15A019BB8EA182BECE67835F917ABBF62DF42F7A2FD877FAC9D6
        783E65753C293646FA3C952269D63203952BDE47D3A4B3524D52A2A34F264E11
        BCD56645F0628DB7DA3B34FBF1EAFF002171A87348A7A4B807C46FB1FB35D2C9
        17CC5C893E3D7BF13938177DF6951BF886A5C95494CB041D5C766B651728F8EB
        0B8A960872450FE164B51BCB0093C3D448DE272BF530D014D70EF7C796F2DE51
        538752A78AA19BA2F37EA2C8CB31B54A68EBB741FCAA38A58E498C9F31EA6FE9
        8F9BAB405DFA019FE43F568C3282CE64CAE62CA6FF002B28FDD1AC2A7A228B8B
        2F8151965E1ACCAFE9CB90F55925DB7E9DC18D5B6FA36DF5D61EE4E5D59DC354
        0A61F233F1CC9A8301435B7AF90A91FDF503B194120161F329F2DFCF54FDDB59
        5A9519B563339BCD5DDA225669485AB45163911101EF7EB460761DACC7B0770E
        DD732C899354D9E9CBF3D8EE379A58E1E3A678844B2FE32B7541B124F66F1AED
        D800D61DDEF1E19DB433EE370A0FDB52438D7323978285EA496208A7C88A5341
        69FD5ECF49A42549DC8D6BD96F25964B8D3FA2EC39FEE6BAA27FDC1B5C56AF0E
        C9D8E593BD7E3C91119078E59E0631B109D01AB324A7ACB74F4A9F8B7DB5EB9A
        404923E117315C7A09FDBBCE52C263A68DB0190AB02AC95893F04C171D69F251
        2BFCCC5E21BF7BF6E80B70000003B876769DCFDA74033EDD0DBF76C750F80671
        E72BC97203CDF2B056B0427E242429D2A76251401DDE7AF9FCFB8719348C139E
        A74CDCCCD2E1BC4A8AD9479A58A28EB415E31F14B304EEDFE503B3727C06BD2C
        99E3B7C2A5235B9A846ACAAADDFE5999BD6B2F3ED1B74AB4914280C70C43B143
        13E5BF79D7C7E6F25973CA5382ED89E7CB2CA5AAE019FB5F9988CB731772354C
        9FFBD1CFB7499E11F7478FF4BCBFCF5EB787DEACD169FB8BF6D954950CF9645E
        E78CDD89B8ECEAF436511C1D709D8851D5F0C83CF7F1D59BA5B9BDD8F4FC7539
        CEB3DDD8CD8C03F239ABE0FF0050C0B5F23F9A484A2A2A6E8B5E5E96D90EDBEB
        5EC5CEE57F1ABFD0BB0B9D15FEE277DC8E33C6F92F09CAE1F925914B0B3C41ED
        5D322422011309565F524F817A1901F8BB3CF5ED1A4005CB6332A71789BDEF16
        224A15668B68B0F341432370A1022867B497A6DC3773886242FF00477680B934
        0339D918FD1A860E6AC4608647DD758D97743752593FD1122C87F875F29257EE
        D47D4F3695C942DCE6162A5AB62BDBACD2C74DFAA1911DA360CCA3ABC083F66B
        CDF39E5D3CB2C33C77638F0756BA7C89DDE7575AD5519E372584A1C66795A93A
        53327A130DD64794BA8DC9242EFD875BF61E4704368E565B8E32B695AD7D7913
        8B3C238EEB6D5507B8FBF1FF00D4B8F78AE3178A4610C5242CB2317464552E0B
        2F73769D79FE2B1E08EE2F84E5DD5EDB7857D6A55B7963BEA9BD48DE4FC73179
        0E417EDD4E575A9DC799BD5AD333445197E12BD4181F0D6FCF8632C9271C946C
        8CD86329B77D029E2B8EBB461E3956EDE5C8CC2CDB93F1492195587A526DB3B7
        6FDED7ADE3E0D4955D746FF636EDE0E3149BA933EE8E17279CF6EB91E1F170FE
        23237F1F3C1520EA44EB91D0855EA72A8373E24EBDA3480BC0F1DEE2E1309C77
        1D76B72D1F9656A75ED5346E22D47FE3C688F12BF50B660F84A83D7EA74F8F57
        6E80B8B40330DD48F3D001BFFCCF16961ADD4B96295F73DB7ABF42CDDC14EC4A
        B0ED51B1ECD625B1C6A77A5DDD4ABED2AD799EBFA539644368795CF320EE8EED
        4AB30FA8B4690B7F8EAE96054D5D7E2776FA9E5630BCD4C1E84C986C957EAEAF
        49E29EA92DE7F0B4EBBFECD67C9B1C738DAD45C7E1CFE470F1A7A323ABE12ED1
        BD15D6E223D6AE4BA494AF2C83A8823E49BD1F3D648F88C70929C22935D1FF00
        2571DBC53AA40D66786E02ED89ED5AAF9BC6CD3BB492192A8B11867249D8C21F
        CFCF5933788AC9CA92E35E4CCF3D8424F984BC317135A7C161B1F6CDB38F4B6F
        23346D0BECFBF6B46C06DF3EB7EC70BC7251A3F6BE5FE91AF0E3B15A14F39B16
        2B70AE4162BCAF0D8871B7248668D8A3A3A40E559586C41046E08D7AC5C007B2
        BEE9F139FDB7E370E7797D09790CB0745A8EF64616BAD334AC156412C9EA973D
        9B6FDBA02DAD00B402D00B402F1D00B5006F1D398313F30EEFDBDFA840CF5D01
        6805A03FFFD9}
      ShowHint = True
      OnClick = Image1Click
    end
    object ImprimirBitBtn: TBitBtn
      Left = 8
      Top = 14
      Width = 80
      Height = 50
      Caption = 'Imprimir'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 6
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = ImprimirBitBtnClick
    end
    object ConsultarBitBtn: TBitBtn
      Left = 8
      Top = 281
      Width = 80
      Height = 50
      Caption = 'mostrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Kind = bkYes
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = ConsultarBitBtnClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 121
    Width = 698
    Height = 347
    Align = alClient
    DataSource = DataSource
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CUOTA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUOTAS'
        Title.Caption = 'TOTAL'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RENDIDAS'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENCE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGADO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APAGAR'
        Title.Caption = 'A PAGAR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPERACION'
        Title.Caption = 'PLAN'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COBRADOR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 179
        Visible = True
      end>
  end
  object DataSource: TDataSource
    DataSet = Tabla
    Left = 409
    Top = 320
  end
  object Tabla: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT '
      '  "CtaCteItem".CODIGO,'
      '  "CtaCteItem".CUOTA,'
      '  "CtaCteItem".VENCE,'
      '  "CtaCteItem".IMPORTE,'
      '  "CtaCteItem".PAGADO,'
      '  ("CtaCteItem".IMPORTE - "CtaCteItem".PAGADO) AS APAGAR,'
      '  "Cliente".NOMBRE AS CLIENTE,'
      '  "CtaCte".OPERACION,'
      '  "Cobrador".NOMBRE AS COBRADOR,'
      '  "CtaCte".CUOTAS,'
      '  "CtaCte".SALDO,'
      '  "CtaCte".RENDIDAS'
      'FROM'
      '  "CtaCte"'
      
        '  INNER JOIN "CtaCteItem" ON ("CtaCte".OPERACION = "CtaCteItem".' +
        'OPERACION)'
      '  INNER JOIN "Cliente" ON ("CtaCte".CLIENTE = "Cliente".CODIGO)'
      
        '  INNER JOIN "Cobrador" ON ("CtaCte".COBRADOR = "Cobrador".CODIG' +
        'O)'
      'ORDER BY'
      '  "CtaCteItem".CUOTA DESC')
    Left = 360
    Top = 320
  end
end
