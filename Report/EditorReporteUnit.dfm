object fEditorReporte: TfEditorReporte
  Left = 0
  Top = 0
  Caption = 'Editor Reporte'
  ClientHeight = 608
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 184
    Width = 720
    Height = 424
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 24
    Top = 112
  end
  object frxPDFExport1: TfrxPDFExport
    FileName = 'LibroIVAventasSiapDetalle.pdf'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 43671.000829733800000000
    DataOnly = False
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 24
    Top = 160
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'PTOVTA=PTOVTA'
      'EMPRESA=EMPRESA'
      'ETITULAR=ETITULAR'
      'EIVA=EIVA'
      'ECODIGOAREA=ECODIGOAREA'
      'ETELEFONO=ETELEFONO'
      'EDIRECCIONCOMERCIAL=EDIRECCIONCOMERCIAL'
      'ECP=ECP'
      'ECIUDAD=ECIUDAD'
      'EDEPARTAMENTO=EDEPARTAMENTO'
      'EPROVINCIA=EPROVINCIA'
      'ECUIT=ECUIT'
      'EWEB=EWEB'
      'EFECHA=EFECHA'
      'EIIBB=EIIBB'
      'CTIPO=CTIPO'
      'NCTIPO=NCTIPO'
      'NOMBRE=NOMBRE'
      'TITULAR=TITULAR'
      'DIRECCION=DIRECCION'
      'DIRECCIONCOMERCIAL=DIRECCIONCOMERCIAL'
      'CIVA=CIVA'
      'CCUIT=CCUIT'
      'EMAIL=EMAIL'
      'DESCRIPCION=DESCRIPCION'
      'UNIDAD=UNIDAD'
      'AIVA=AIVA'
      'ARTICULO=ARTICULO'
      'CANTIDAD=CANTIDAD'
      'VIDESCUENTO=VIDESCUENTO'
      'PRECIO=PRECIO'
      'OPERACION=OPERACION'
      'PREXCANT=PREXCANT'
      'VIIMPUESTO=VIIMPUESTO'
      'SERVICIO=SERVICIO'
      'DESCR=DESCR'
      'CODIGO=CODIGO'
      'LETRA=LETRA'
      'FECHA=FECHA'
      'CB=CB'
      'COMPROBANTE=COMPROBANTE'
      'TERMINOS=TERMINOS'
      'VDESC=VDESC'
      'TOTAL=TOTAL'
      'CONTADO=CONTADO'
      'CLIENTE=CLIENTE'
      'SUBTOTAL=SUBTOTAL'
      'DESCUENTO=DESCUENTO'
      'IMPUESTO=IMPUESTO'
      'IVA1=IVA1'
      'IVA2=IVA2'
      'IVA3=IVA3'
      'EXCENTO=EXCENTO'
      'SALDO=SALDO'
      'PAGADO=PAGADO'
      'COMISION=COMISION'
      'ENVIO=ENVIO')
    DataSet = OperacionFDQuery
    BCDToCurrency = False
    Left = 24
    Top = 16
  end
  object frxCSVExport1: TfrxCSVExport
    FileName = '.csv'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 43732.889505231480000000
    DataOnly = True
    Separator = ';'
    OEMCodepage = False
    UTF8 = True
    OpenAfterExport = True
    NoSysSymbols = True
    ForcedQuotes = False
    Left = 24
    Top = 208
  end
  object frxReport1: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39416.849051458300000000
    ReportOptions.LastChange = 43954.819448113400000000
    ReportOptions.Picture.Data = {
      0954474946496D61676547494638396150003200F70000FDFDFDFCFCFCFBFBFB
      F9F9F9030303FAFAFA010101F8F8F8020202040404F7F7F70606060505050707
      07080808F6F6F6090909F5F5F50A0A0A8585854141410D0D0DD0D0D0B9B9B9F3
      F3F30C0C0CF2F2F27B7B7BD7D7D7F0F0F0BFBFBFD4D4D4BABABAB5B5B5DEDEDE
      8282823F3F3F888888F4F4F4323232363636C9C9C95F5F5FA2A2A2B8B8B8C6C6
      C66262626969694C4C4CBEBEBE8C8C8CA5A5A5919191F1F1F16E6E6E8D8D8D24
      2424DCDCDCAEAEAE8A8A8AE4E4E49292927070707D7D7D8787872A2A2ACBCBCB
      2222228F8F8F5555554A4A4A3131317575757A7A7A3737371E1E1E8B8B8B1919
      199494941B1B1B1F1F1F434343C4C4C4D5D5D57C7C7C1A1A1AEDEDED90909012
      1212CDCDCD818181E2E2E25656568E8E8E939393C3C3C32C2C2C767676727272
      141414ACACACADADADB1B1B1CFCFCFB2B2B2E7E7E7DADADA6868689F9F9F4444
      444B4B4B585858161616717171D9D9D9404040525252A3A3A3E0E0E00E0E0E59
      5959B6B6B62121212020203434346D6D6D8383836464648989894F4F4F787878
      3C3C3CEBEBEBA8A8A80B0B0B1C1C1CECECEC656565EEEEEE3B3B3B4242429595
      95494949CECECEFEFEFE000000FEFAFAFFFFFF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000021FF0B584D50204461
      7461584D503C3F787061636B657420626567696E3D22EFBBBF222069643D2257
      354D304D7043656869487A7265537A4E54637A6B633964223F3E203C783A786D
      706D65746120786D6C6E733A783D2261646F62653A6E733A6D6574612F222078
      3A786D70746B3D2241646F626520584D5020436F726520352E302D6330363020
      36312E3133343737372C20323031302F30322F31322D31373A33323A30302020
      202020202020223E203C7264663A52444620786D6C6E733A7264663D22687474
      703A2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D7379
      6E7461782D6E7323223E203C7264663A4465736372697074696F6E207264663A
      61626F75743D222220786D6C6E733A786D703D22687474703A2F2F6E732E6164
      6F62652E636F6D2F7861702F312E302F2220786D6C6E733A786D704D4D3D2268
      7474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F2220
      786D6C6E733A73745265663D22687474703A2F2F6E732E61646F62652E636F6D
      2F7861702F312E302F73547970652F5265736F75726365526566232220786D70
      3A43726561746F72546F6F6C3D2241646F62652050686F746F73686F70204353
      352057696E646F77732220786D704D4D3A496E7374616E636549443D22786D70
      2E6969643A333037333134413332453239313145304241443846414239423037
      41414243352220786D704D4D3A446F63756D656E7449443D22786D702E646964
      3A33303733313441343245323931314530424144384641423942303741414243
      35223E203C786D704D4D3A4465726976656446726F6D2073745265663A696E73
      74616E636549443D22786D702E6969643A333037333134413132453239313145
      3042414438464142394230374141424335222073745265663A646F63756D656E
      7449443D22786D702E6469643A33303733313441323245323931314530424144
      38464142394230374141424335222F3E203C2F7264663A446573637269707469
      6F6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F7870
      61636B657420656E643D2272223F3E01FFFEFDFCFBFAF9F8F7F6F5F4F3F2F1F0
      EFEEEDECEBEAE9E8E7E6E5E4E3E2E1E0DFDEDDDCDBDAD9D8D7D6D5D4D3D2D1D0
      CFCECDCCCBCAC9C8C7C6C5C4C3C2C1C0BFBEBDBCBBBAB9B8B7B6B5B4B3B2B1B0
      AFAEADACABAAA9A8A7A6A5A4A3A2A1A09F9E9D9C9B9A99989796959493929190
      8F8E8D8C8B8A898887868584838281807F7E7D7C7B7A79787776757473727170
      6F6E6D6C6B6A696867666564636261605F5E5D5C5B5A59585756555453525150
      4F4E4D4C4B4A494847464544434241403F3E3D3C3B3A39383736353433323130
      2F2E2D2C2B2A292827262524232221201F1E1D1C1B1A19181716151413121110
      0F0E0D0C0B0A090807060504030201000021F90400000000002C000000005000
      320087FDFDFDFCFCFCFBFBFBF9F9F9030303FAFAFA010101F8F8F80202020404
      04F7F7F7060606050505070707080808F6F6F6090909F5F5F50A0A0A85858541
      41410D0D0DD0D0D0B9B9B9F3F3F30C0C0CF2F2F27B7B7BD7D7D7F0F0F0BFBFBF
      D4D4D4BABABAB5B5B5DEDEDE8282823F3F3F888888F4F4F4323232363636C9C9
      C95F5F5FA2A2A2B8B8B8C6C6C66262626969694C4C4CBEBEBE8C8C8CA5A5A591
      9191F1F1F16E6E6E8D8D8D242424DCDCDCAEAEAE8A8A8AE4E4E4929292707070
      7D7D7D8787872A2A2ACBCBCB2222228F8F8F5555554A4A4A3131317575757A7A
      7A3737371E1E1E8B8B8B1919199494941B1B1B1F1F1F434343C4C4C4D5D5D57C
      7C7C1A1A1AEDEDED909090121212CDCDCD818181E2E2E25656568E8E8E939393
      C3C3C32C2C2C767676727272141414ACACACADADADB1B1B1CFCFCFB2B2B2E7E7
      E7DADADA6868689F9F9F4444444B4B4B585858161616717171D9D9D940404052
      5252A3A3A3E0E0E00E0E0E595959B6B6B62121212020203434346D6D6D838383
      6464648989894F4F4F7878783C3C3CEBEBEBA8A8A80B0B0B1C1C1CECECEC6565
      65EEEEEE3B3B3B424242959595494949CECECEFEFEFE000000FEFAFAFFFFFF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000008FF0027091C48B0A0C18308132A5CC8B0A1C38710234A9C48B1A2C58B
      18336ADCC8B1A3C78F20438A1C49B2A4C9932853AA5CC9B2A5CB973031069824
      6012A499902001B0C97367809C05670ADCB973120005037722B5294028D14905
      6C1285343080D0A193ACEED42970668449030616A01A00C001B050BBD6CCBAB6
      C0CE02070EAC057B552055A36767AE157A372755484D01DCB51B74A087092818
      2488E420D2A1128DA81EA82150C0DD0E54C33A1D3B508164B403D60ED83AD868
      E901912211205074E903AA5F217120B1C040EAD40616A71E026260D89A7E6084
      B05B736E01CE46273D986482E7A4D859E97605BC5300EE48359F0A3C2B778EED
      062F5A6CFFCF11267502027226619874C0472404915880F589B52B5AA3570320
      D50B3A2CD69D9130404024DB09A4C0593C6D919A2191082594152A64A09A0F84
      5190DA026844C71F2403F85719553545459340050410566995FD741B8176F115
      D5008A0C1160242E5C2018244B35E79C0B033AB05863197C30501A315011047C
      A949A0C50C00CCD4C1570728D0C506B6DD3688136A60B5E27393B0A1476A0C50
      50064D342C108904AAA506880C135485562203AE089F083349C1C87BE6A5C940
      2441E4B19602203C91E662662E56010D3C9947C0003C44011F0170F440134E17
      1831207CF03530E3047660F5802317C650D34C5954D018016B886013211BA486
      80014250FF95027C8B5D21E20550D8E6000835A5098117915449072236DD35D3
      0190AC3002120668EAEAAB37D867616A1E6C15001E55463B222407CC70E11102
      09626624236890D6400270F680A6032A669B0153A02500006121B894721CC840
      816E6350A6410130A429DF4027A4E9415904E5C0586A54B5116C249256471369
      5181A95B240D1850410A3F09C44724663211DBBD05A89600021644A7049017B0
      3753119A66608369804D4204049124E0C67271B8DAC7244835090000F30A3440
      9C9104F2C10EB7E120425402905125013FC4CA56216F2C001F0568296043CE91
      009116248F800D810A3C34D58118155CF8854D1CE0CCD80B3C5980426A0D9490
      5524383BF0B0D40608BCBAC4004815504715B711B0E79917466244CA36154004
      029ABEBA800E467DB048CEABC5D958242488774054663401669A8C4792C47193
      D8B627BA45547982B9353DB0C20F382409DF025C0071867634957047C67CEB40
      9560214CB0C79E0B3080C50821ACB7954018ECF0C7AB981E318105CBA9579B6A
      68450586A61090F017419955C72D71EC1166AF9B1CB63FEFF19509F4955404F1
      85957FD317B553739208A0000748C0021AF080084CA00217C8C0063AF081108C
      A0042748C10A5AF08218CCA00637C8C10E7AF083200CA1084748C2129AF08428
      4CA10A57C8C216BAF085308CA10C6748C31A8A3020003B}
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 24
    Top = 64
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      PrintOnPreviousPage = True
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Top = 555.590910000000000000
        Width = 718.110700000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 275.905690000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 1
        Stretched = True
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Shape = skRoundRectangle
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 404.409710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'DESCRIPCION')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 461.882190000000000000
          Width = 30.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'UNIDAD')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAL')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Width = 56.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CANT.')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 491.338900000000000000
          Width = 75.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'P.UNIT.')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 589.606680000000000000
          Width = 52.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '$ IVA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Width = 22.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '% IVA')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Shape4: TfrxShapeView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
          Frame.BottomLine.Style = fsDot
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 404.409710000000000000
          Height = 18.897650000000000000
          DataSetName = 'FacturafrxDBDataset'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ARTICULO"] [frxDBDataset1."DESCRIPCION"]')
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 461.882190000000000000
          Width = 30.015770000000000000
          Height = 18.897650000000000000
          DataSetName = 'FacturafrxDBDataset'
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."UNIDAD"]')
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.370130000000000000
          Height = 18.897650000000000000
          DataSetName = 'FacturafrxDBDataset'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[(<frxDBDataset1."CANTIDAD">*<frxDBDataset1."PRECIO">)]')
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Width = 54.472480000000000000
          Height = 18.897650000000000000
          DataSetName = 'FacturafrxDBDataset'
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."CANTIDAD"]')
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 491.338900000000000000
          Width = 75.370130000000000000
          Height = 18.897650000000000000
          DataSetName = 'FacturafrxDBDataset'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."PRECIO"]')
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 589.606680000000000000
          Width = 52.692950000000000000
          Height = 18.897650000000000000
          DataSetName = 'FacturafrxDBDataset'
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."VIIMPUESTO"]')
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Width = 22.456710000000000000
          Height = 18.897650000000000000
          DataSetName = 'FacturafrxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."AIVA"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 136.063080000000000000
        Top = 359.055350000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Shape5: TfrxShapeView
          AllowVectorExport = True
          Top = 52.913420000000000000
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          Frame.Typ = []
        end
        object Shape3: TfrxShapeView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 52.913420000000000000
          Frame.Typ = []
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 453.543600000000000000
          Top = 26.456710000000000000
          Width = 264.567100000000000000
          Height = 26.456710000000000000
          DataSetName = 'FacturafrxDBDataset'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL: $[frxDBDataset1."TOTAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1IVA1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'IVA10,5%: [frxDBDataset1."IVA1"]')
          ParentFont = False
        end
        object frxDBDataset1IVA2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 30.236240000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'IVA21%: [frxDBDataset1."IVA2"]')
          ParentFont = False
        end
        object frxDBDataset1FECHA: TfrxMemoView
          AllowVectorExport = True
          Left = 385.512060000000000000
          Width = 68.031540000000000000
          Height = 52.913420000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'FECHA DE IMPRESION [Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1DESCUENTO: TfrxMemoView
          AllowVectorExport = True
          Left = 453.543600000000000000
          Top = 7.559060000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'DESCUENTO: [frxDBDataset1."DESCUENTO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 313.700990000000000000
          Top = 56.692950000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'CAE: [frxDBDataset1."VDESC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Top = 75.590600000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Fecha Vto.: [frxDBDataset1."TERMINOS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object BarCode1: TfrxBarCodeView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 56.692950000000000000
          Width = 64.000000000000000000
          Height = 41.574830000000000000
          BarType = bcCode_2_5_interleaved
          Expression = '<frxDBDataset1."CB">'
          Frame.Typ = []
          Rotation = 0
          TestLine = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
        object Memo100: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 30.236240000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Comisi'#243'n: $')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo101: TfrxMemoView
          AllowVectorExport = True
          Left = 265.126160000000000000
          Top = 30.236240000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[<frxDBDataset1."COMISION">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo102: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Envio: $')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo103: TfrxMemoView
          AllowVectorExport = True
          Left = 265.126160000000000000
          Top = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[<frxDBDataset1."ENVIO">]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 173.858380000000000000
        Top = 79.370130000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."OPERACION"'
        Stretched = True
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 173.858380000000000000
          Frame.Typ = []
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 321.260050000000000000
          Width = 75.590600000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -48
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."LETRA"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 397.850650000000000000
          Top = 24.788992000000000000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          DataSetName = 'FacturafrxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              'Pto.Vta. / Nro [frxDBDataset1."PTOVTA"]-[frxDBDataset1."COMPROBA' +
              'NTE"]')
          ParentFont = False
          Formats = <
            item
              FormatStr = '000'
              Kind = fkNumeric
            end
            item
              FormatStr = '00000000'
              Kind = fkNumeric
            end>
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 397.850650000000000000
          Top = 48.577984000000000000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          DataSetName = 'FacturafrxDBDataset'
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Fecha: [frxDBDataset1."FECHA"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 86.929190000000000000
          Top = 141.622140000000000000
          Width = 350.372913330000000000
          Height = 14.236240000000000000
          DataSetName = 'FacturafrxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NOMBRE"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 397.850650000000000000
          Top = 1.000000000000000000
          Width = 313.700990000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -21
          Font.Name = 'Bauhaus 93'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'ORIGINAL')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 2.779529999999990000
          Width = 192.756030000000000000
          Height = 71.811070000000000000
          Frame.Typ = []
          Picture.Data = {
            07544269746D6170162F0000424D162F00000000000036000000280000005000
            0000320000000100180000000000E02E0000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFDFDFDFCFCFCFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEF9F9F9E2E2E2F8F8F8FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCFCFCFCFDFDFDFFFF
            FFFFFFFFFFFFFFFEFEFEFCFCFCF5F5F5F8F8F8FFFFFFFFFFFFFEFEFEFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FEFEFEF8F8F8F6F6F6FAFAFAFDFDFDFDFDFDFFFFFFFFFFFFFEFEFEFFFFFFFEFE
            FEF9F9F9E2E2E2F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFEFEFEFAFAFAF8F8F8F9F9F9FAFAFAFCFCFCFCFCFCECECECE8E8E8
            F0F0F0FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFFFF
            FFFEFEFEFFFFFFFEFEFEFFFFFFFDFDFDFFFFFFEFEFEFF3F3F3ECECECEBEBEBFA
            FAFAF7F7F7FFFFFFFFFFFFF8F8F8FFFFFFFBFBFBE7E7E7FBFBFBFFFFFFF7F7F7
            FFFFFFFDFDFDFFFFFFFDFDFDFFFFFFFDFDFDFFFFFFF9F9F9F5F5F5EBEBEBF5F5
            F5F4F4F4FFFFFFF8F8F8EBEBEBE6E6E6FAFAFAF6F6F6FFFFFFFFFFFFFFFFFFFC
            FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFFFFFFF8F8F8CDCDCDBDBDBDB8B8B8
            BDBDBDF9F9F9EAEAEADFDFDFE6E6E6E2E2E2FAFAFAEFEFEFF2F2F2F3F3F3B0B0
            B0B8B8B8ACACACD4D4D4FCFCFCFCFCFCFFFFFFFDFDFDFFFFFFF9F9F9F2F2F2BA
            BABABCBCBCCDCDCDF9F9F9E6E6E6F7F7F7FFFFFFFFFFFFFAFAFAD9D9D9A7A7A7
            A8A8A8BFBFBFFFFFFFFFFFFFF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFAFAFAFFFF
            FFC9C9C92222220000000000000707070000001818187E7E7EE1E1E1CFCFCFE0
            E0E0D8D8D8D9D9D97070701414140A0A0A0000000707070404043C3C3CBABABA
            F7F7F7FFFFFFEEEEEEFFFFFFB2B2B2030303000000767676FEFEFEE7E7E7E5E5
            E5FBFBFBFDFDFDAEAEAE141414000000020202000000888888FCFCFCFFFFFFFC
            FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF9F9F9FFFFFFFCFCFC9E9E9E0A0A0A000000232323202020
            000000040404141414A0A0A0E1E1E1CACACADADADA3B3B3B0808080606060C0C
            0C2828282525250606060000000707079D9D9DFDFDFDFFFFFFFFFFFFB6B6B600
            00000000007C7C7CFDFDFDEEEEEEF1F1F1FFFFFFEFEFEF131313040404030303
            0D0D0D000000989898FFFFFFF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFFFFFFFFFFFF2F2F2FFFF
            FFEEEEEE7C7C7CCBCBCBFFFFFFFFFFFFB9B9B90909091C1C1C5A5A5ACFCFCFD2
            D2D2757575292929353535353535A8A8A8D3D3D3CDCDCD828282191919070707
            030303CBCBCBFFFFFFF1F1F1BBBBBB030303000000747474FCFCFCF4F4F4E8E8
            E8EFEFEFD1D1D10000000D0D0D252525D8D8D8FFFFFFF9F9F9FFFFFFFFFFFFFB
            FBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFEFEFEF8F8F8FFFFFFFCFCFCFDFDFDF6F6F6FFFFFFFDFDFDF7F7F7
            DADADA121212414141717171D6D6D6D8D8D86B6B6B606060464646BABABAD7D7
            D7CECECED3D3D3D2D2D26D6D6D3A3A3A2525255B5B5BE4E4E4EFEFEFB2B2B201
            0101070707717171FFFFFFF5F5F5EDEDEDEEEEEEAAAAAA0000000A0A0A575757
            FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
            FDFFFFFFFFFFFFFEFEFEFEFEFEB9B9B94242423838386B6B6BC7C7C7EBEBEBCF
            CFCF8F8F8FA7A7A7BDBDBDDDDDDDD9D9D9D5D5D5D4D4D4D3D3D3C3C3C3474747
            3D3D3D717171C3C3C3CECECEA8A8A8060606020202757575FFFFFFF0F0F0E2E2
            E2E9E9E9A0A0A00F0F0F0909096C6C6CFFFFFFFFFFFFFFFFFFFBFBFBFFFFFFF9
            F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFCFCFCFFFFFFF9F9F9FFFFFFFFFFFFFFFFFFFCFCFCACACAC333333070707
            0A0A0A323232777777CECECEE2E2E2BDBDBD7A7A7A878787A4A4A4D9D9D9E5E5
            E5D2D2D2D6D6D6DDDDDDCFCFCF5959594C4C4C585858DDDDDDD1D1D1A3A3A305
            0505030303707070E7E7E7EEEEEEDADADADCDCDCA3A3A30B0B0B050505747474
            FFFFFFF9F9F9FFFFFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFEFEFEFDFDFDFEFE
            FEFFFFFF7D7D7D0707070000000000001010105F5F5FBFBFBFCECECEC5C5C5AF
            AFAF3E3E3E3B3B3B7A7A7AD4D4D4CECECECBCBCBD8D8D8C8C8C8CCCCCC282828
            2525254E4E4ED3D3D3E5E5E5AEAEAE333333161616707070DBDBDBD9D9D9DADA
            DADEDEDEA7A7A7050505070707747474F9F9F9FFFFFFFDFDFDFDFDFDFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFEFAFAFAFFFFFFFFFFFFFFFFFFE7E7E70A0A0A000000000000777777
            BFBFBFDCDCDCC9C9C9CECECEE0E0E0B2B2B2212121111111323232CBCBCBDCDC
            DCD6D6D6D4D4D4D9D9D9A1A1A1060606111111474747CFCFCFCFCFCFBEBEBE6C
            6C6C464646797979D4D4D4D6D6D6D2D2D2D3D3D39D9D9D191919060606767676
            FDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFF5F5F5FCFCFCFDFD
            FDC8C8C80000000B0B0B595959E2E2E2E3E3E3D7D7D7D8D8D8EBEBEBD5D5D5D6
            D6D6282828060606060606818181F0F0F0EAEAEAE4E4E4E3E3E3343434010101
            000000747474E7E7E7D6D6D6A6A6A66C6C6C8B8B8B8F8F8FD6D6D6CFCFCFD1D1
            D1D1D1D1A8A8A80C0C0C010101747474FDFDFDFBFBFBFEFEFEFFFFFFFCFCFCFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFAFAFAFCFCFCFFFFFFFEFEFEFFFFFFEEEEEE1E1E1E000000111111A4A4A4
            C8C8C87C7C7C4E4E4EDCDCDCF5F5F5E8E8E8B6B6B60404040000000404045E5E
            5EC3C3C3B5B5B5353535000000000000171717ECECECF2F2F2B2B2B27F7F7F49
            4949868686B7B7B7BFBFBFB7B7B7BFBFBFAFAFAF7F7F7F0000000000005A5A5A
            D0D0D0CCCCCCE8E8E8FFFFFFF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FFFFFFF6F6F6FFFF
            FFFFFFFF8181810707070C0C0C101010151515070707000000B1B1B1F0F0F0E2
            E2E2F3F3F39797970D0D0D000000040404000000090909000000000000141414
            C4C4C4FFFFFFFFFFFF0000000A0A0A1A1A1A5A5A5A9090906B6B6B494949A1A1
            A1080808060606010101040404000000030303000000818181FAFAFAFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFBFBFBFBFBFBFFFFFFFFFFFFFBFBFB9E9E9E5454544B4B4B
            2828283B3B3B626262C5C5C5DEDEDED9D9D9EDEDEDFEFEFEDFDFDF6868682222
            220404040000003232327B7B7BEDEDEDFFFFFFFFFFFFF6F6F61C1C1C1C1C1C0D
            0D0D3939396262624848481C1C1C8F8F8F000000111111000000000000000000
            0101010000007B7B7BF1F1F1FFFFFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F5F5F5FFFFFFFDFDFDFCFC
            FCF0F0F0DCDCDCD1D1D1D9D9D9D2D2D2CDCDCDDADADAD7D7D7D7D7D7D5D5D5D4
            D4D4D6D6D6DEDEDEFFFFFFEEEEEEFAFAFAFFFFFFFFFFFFFDFDFDFCFCFCFFFFFF
            FFFFFFF4F4F4FFFFFFFFFFFFA0A0A01515152B2B2B868686C9C9C9D8D8D8F6F6
            F6FFFFFFB6B6B60505050202027D7D7DFDFDFDFAFAFAFEFEFEFFFFFFFCFCFCFE
            FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFAFAFAFFFFFFFFFFFFEDEDEDD2D2D2D4D4D4F6F6F6CFCFCF
            D6D6D6D4D4D4E1E1E1DBDBDBC9C9C9D3D3D3D1D1D1DDDDDDF5F5F5FFFFFFFAFA
            FAFFFFFFFCFCFCFFFFFFFEFEFEFFFFFFFEFEFEFFFFFFFBFBFBEFEFEFC3C3C31A
            1A1A2D2D2D454545DEDEDEE8E8E8FBFBFBFFFFFFBFBFBF000000000000727272
            E9E9E9E5E5E5EAEAEAF4F4F4FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFF
            FFFFFFFEFEFEFFFFFFFFFFFFFBFBFBFFFFFFFDFDFDFFFFFFFFFFFFFCFCFCFDFD
            FDE0E0E0D3D3D3D0D0D0CECECED9D9D9D6D6D6E9E9E9E3E3E3D9D9D9CDCDCDDB
            DBDBDADADACCCCCCEEEEEEFEFEFEFAFAFAFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
            FBFBFBFFFFFFE9E9E9DBDBDBD2D2D25555554141411313135E5E5EB4B4B49898
            98F5F5F5FCFCFCB3B3B35F5F5F888888C9C9C9D2D2D2D3D3D3D6D6D6E0E0E0E8
            E8E8FDFDFDFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFDFDFDFEFEFEFFFFFFFFFFFF
            F4F4F4FFFFFFFFFFFFFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFEFEFEFBFBFBFCFCFCFFFFFFFFFFFFFF
            FFFFFFFFFFFAFAFAFBFBFBF7F7F7EFEFEFDBDBDBCFCFCFCACACAD2D2D2DEDEDE
            FEFEFEFFFFFFF5F5F5EEEEEECFCFCFD7D7D7E2E2E2D5D5D5EDEDEDF5F5F5FFFF
            FFFFFFFFFFFFFFFCFCFCFFFFFFFCFCFCFFFFFFFBFBFBD9D9D9C3C3C3D8D8D8BF
            BFBF3A3A3A0C0C0C060606000000000000B2B2B2F8F8F8D5D5D5CDCDCDD5D5D5
            DADADACBCBCBCECECECDCDCDDADADAE2E2E2EEEEEEF1F1F1FFFFFFFCFCFCFFFF
            FFFAFAFAFFFFFFFCFCFCFFFFFFF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5
            FFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFFFFFFF6F6F6FFFFFFECECECEEEEEEE4E4
            E4D9D9D9D4D4D4E0E0E0DEDEDEFFFFFFFFFFFFF5F5F5FFFFFFFAFAFADDDDDDCE
            CECECDCDCDCCCCCCF7F7F7FFFFFFFCFCFCF7F7F7FAFAFAFFFFFFFFFFFFFFFFFF
            FFFFFFDFDFDFD1D1D1E4E4E4E8E8E8D5D5D5A7A7A75353530909090000002222
            22A8A8A8D2D2D2D0D0D0EAEAEAE1E1E1D3D3D3D4D4D4DBDBDBCBCBCBD6D6D6D5
            D5D5DBDBDBE6E6E6F2F2F2FFFFFFFFFFFFFFFFFFF9F9F9FFFFFFFFFFFFFFFFFF
            FFFFFFF7F7F7FFFFFFFCFCFCFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFBFBFB6B6B6B04040400000000000004040401010100
            00006E6E6E8181811414140000000606061C1C1C4040406F6F6FA6A6A6FFFFFF
            F9F9F9FFFFFFF4F4F4FDFDFDF9F9F9DCDCDCD1D1D1DCDCDCFCFCFCFDFDFDFFFF
            FFFCFCFCFFFFFF9797976868681111110000001212123C3C3C686868909090BF
            BFBFD8D8D8FAFAFAF5F5F5F4F4F4D7D7D7D3D3D3D4D4D4F6F6F6D4D4D4D4D4D4
            D4D4D4E4E4E4E4E4E4B5B5B57878781616161414140D0D0D0000000202027C7C
            7CBABABAEDEDEDFFFFFFFCFCFCFFFFFFFDFDFDFFFFFFFFFFFFFBFBFBFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC656565
            0707070202020202020000000000000707075A5A5A8989891515151A1A1A2525
            25222222202020181818070707191919A1A1A1F8F8F8FFFFFFFFFFFFFFFFFFDC
            DCDCD5D5D5DBDBDBFFFFFFFFFFFFFDFDFDC9C9C93B3B3B000000090909000000
            0B0B0B2323232727272A2A2A1616160707076E6E6EE9E9E9F3F3F3DBDBDBD3D3
            D3E0E0E0E0E0E0D9D9D9D0D0D0EEEEEEFCFCFCB8B8B83B3B3B00000010101000
            00001111112424240B0B0B0808080404040101013B3B3BC5C5C5FFFFFFFEFEFE
            F4F4F4FFFFFFF8F8F8FFFFFFFDFDFDFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFDFDFD6161610000000000000101010000000303030A
            0A0A6969699696963232324040403F3F3F3F3F3F4848482D2D2D040404020202
            000000494949E7E7E7F4F4F4FFFFFFFFFFFFE3E3E3F1F1F1FEFEFEFFFFFFAAAA
            AA0C0C0C0000000000000000000303031C1C1C2525251212120303030000000A
            0A0AA0A0A0FBFBFBF0F0F0D1D1D1D1D1D1D9D9D9DADADAD5D5D5F5F5F5FCFCFC
            7F7F7F0000000000000101010000000606061C1C1C2D2D2D2D2D2D0000000909
            09000000000000070707A0A0A0FFFFFFF7F7F7F9F9F9FDFDFDFFFFFFFFFFFFFD
            FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF636363
            0101010000000000000000000C0C0C262626828282B2B2B27777778383837474
            746B6B6B6A6A6A5858583D3D3D0E0E0E000000050505383838DFDFDFFDFDFDFF
            FFFFECECECF8F8F8F7F7F7D3D3D3000000000000030303070707050505181818
            1C1C1C0E0E0E040404000000060606717171FBFBFBFFFFFFF5F5F5DCDCDCD1D1
            D1C7C7C7CECECEFAFAFAFFFFFF63636307070700000004040400000000000005
            05052121213F3F3F4B4B4B303030060606010101030303000000070707BABABA
            FFFFFFFFFFFFFFFFFFF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF62626200000000000002020201010129292963
            6363C0C0C0D3D3D38686866F6F6F6464646767676F6F6F8484847979793B3B3B
            0E0E0E0000000000003B3B3BFCFCFCFFFFFFE8E8E8F5F5F5FFFFFF1F1F1F0000
            000606060000000000001313132E2E2E262626030303030303020202353535FE
            FEFEFFFFFFFFFFFFFFFFFFD5D5D5CCCCCCDFDFDFDEDEDEFFFFFF828282050505
            0000000404040101010000000404040E0E0E2323235959598A8A8A6363632626
            260000000404040000000000002B2B2BFCFCFCFFFFFFFAFAFAFFFFFFFBFBFBFE
            FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF696969
            0303030303030202020D0D0D4848487777779A9A9AA0A0A04B4B4B4E4E4E4242
            423535353B3B3B4D4D4D8484848E8E8E3232320F0F0F010101000000797979F5
            F5F5DDDDDDF1F1F18D8D8D0505050000000303030000000808082C2C2C3F3F3F
            1F1F1F000000000000282828EFEFEFFFFFFFFAFAFAFFFFFFFFFFFFDBDBDBD5D5
            D5E0E0E0F9F9F9CDCDCD0000000606060000000404040000000C0C0C1616161C
            1C1C2828285151517575759898985E5E5E1E1E1E000000000000010101000000
            C1C1C1FAFAFAFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFBFBFB6363630000000000000606061F1F1F55555569
            69697C7C7C8787872C2C2C2626262121211C1C1C1B1B1B1B1B1B3E3E3E7F7F7F
            8686863535351818180B0B0B020202C4C4C4D8D8D8D2D2D25252520000000000
            00030303000000131313575757646464B4B4B4FDFDFDE0E0E0C5C5C5FFFFFFFD
            FDFDFFFFFFF8F8F8FEFEFEE9E9E9CECECEE7E7E7FDFDFD414141000000060606
            0000000303031111112222222424242D2D2D2C2C2C3D3D3D4242425D5D5D4242
            422929290C0C0C0000000000000505058D8D8DF9F9F9FFFFFFFFFFFFFEFEFEFD
            FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE676767
            0303030000000404042B2B2B565656444444666666D2D2D2D2D2D2E2E2E2C9C9
            C99191914747470C0C0C1919193F3F3F8383837373732C2C2C1C1C1C09090974
            7474D1D1D1C6C6C62626260000000505050606060E0E0E2B2B2B767676C7C7C7
            D5D5D5F4F4F4FDFDFDFFFFFFFCFCFCFFFFFFFAFAFAFFFFFFFFFFFFDCDCDCD8D8
            D8DFDFDFC6C6C60000000000000101010505050F0F0F3131313535354343435D
            5D5D939393C5C5C5D6D6D6C5C5C55E5E5E161616010101080808000000070707
            6F6F6FFFFFFFFFFFFFFFFFFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFE6666660101010000000303033434345C5C5C2D
            2D2D616161DCDCDCD4D4D4CDCDCDD0D0D0D8D8D8D1D1D1BCBCBC0606060C0C0C
            4343438D8D8D7777773535352E2E2E3B3B3BD1D1D1DFDFDF2F2F2F1313130707
            07070707191919393939A8A8A8DFDFDF2E2E2E00000000000006060600000000
            0000000000010101000000121212ADADADD5D5D56F6F6F000000000000000000
            1313133A3A3A5C5C5C5656568A8A8AB6B6B6C9C9C97B7B7B1D1D1D1818181010
            10101010060606000000010101000000858585FFFFFFFCFCFCFEFEFEFBFBFBFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF656565
            0000000000000606063C3C3C6767672C2C2C636363E1E1E1D8D8D8CBCBCBCFCF
            CFD7D7D7E6E6E6EEEEEE8484840C0C0C1E1E1E616161A4A4A467676747474750
            5050CBCBCBEDEDED4242421B1B1B0606060303031313132C2C2CA0A0A0D6D6D6
            2B2B2B1818180000000000000C0C0C000000000000000000090909242424BFBF
            BFC9C9C93232320707070404040B0B0B2A2A2A6A6A6A707070727272C2C2C2DF
            DFDFD9D9D97D7D7D1616161212120909090505050000000303030A0A0A000000
            B6B6B6FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF6666660000000202020E0E0E49494976767634
            34345F5F5FD9D9D9D4D4D4D2D2D2D7D7D7C9C9C9DBDBDBFCFCFCEDEDED000000
            0C0C0C3C3C3C9191916E6E6E464646424242AEAEAED9D9D94747470E0E0E0505
            05020202090909161616757575DFDFDF5F5F5F13131308080800000000000003
            03030303030505050C0C0C3F3F3FD6D6D6D7D7D72929290505050E0E0E1E1E1E
            3E3E3E858585646464858585D3D3D3CFCFCFD3D3D37777770E0E0E0909090303
            03040404000000000000000000181818E8E8E8FDFDFDFFFFFFFFFFFFFFFFFFFC
            FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC636363
            0000000202021616165757578383833A3A3A616161D6D6D6CECECED3D3D3E8E8
            E8D6D6D6D6D6D6E9E9E9F7F7F71111110E0E0E2F2F2F7272724D4D4D30303036
            3636909090CBCBCB5F5F5F030303020202020202030303070707313131C0C0C0
            D6D6D6C9C9C9D7D7D76969690303030000000000000707070C0C0C505050DADA
            DAD8D8D81919190B0B0B0A0A0A1D1D1D4242428E8E8E5252529E9E9EDEDEDED4
            D4D4D7D7D77C7C7C121212090909010101040404020202010101030303878787
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF6A6A6A0000000202021616165757577E7E7E2B
            2B2B5E5E5EE2E2E2DADADACCCCCCDBDBDBCFCFCFD5D5D5E7E7E7EFEFEF0C0C0C
            0B0B0B3131315454543D3D3D1C1C1C070707878787D7D7D78787870505050000
            000000000000000000000A0A0A4B4B4BBCBCBCD4D4D49E9E9E19191900000000
            0000060606000000101010626262D4D4D4D1D1D1010101020202030303101010
            3A3A3A8989893D3D3DA2A2A2D7D7D7DDDDDDDEDEDE7C7C7C1010100B0B0B0404
            04020202000000000000353535FBFBFBFFFFFFFCFCFCFEFEFEFFFFFFFAFAFAFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB696969
            0000000202021010104545456D6D6D2424245C5C5CEAEAEAE5E5E5D2D2D2CFCF
            CFCFCFCFD5D5D5E9E9E9DFDFDF0000001515153939395151510F0F0F11111101
            0101969696EBEBEBE0E0E02121210000000A0A0A000000020202000000070707
            1B1B1B262626151515000000000000020202000000000000040404B8B8B8D3D3
            D3DDDDDD0000000303030000000808083131317979795757577F7F7FDFDFDFD9
            D9D9DCDCDCE0E0E0E4E4E4E6E6E6FDFDFDFBFBFBFCFCFCFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF6565650000000808080C0C0C3939396A6A6A31
            31315E5E5EEDEDEDE3E3E3D4D4D4D3D3D3D0D0D0DADADADFDFDF848484222222
            2121214747472828280E0E0E000000000000BEBEBEFDFDFDF5F5F5CDCDCD0404
            040000000808080101010303030404040D0D0D0D0D0D06060604040402020200
            0000000000080808878787ECECECD9D9D9FDFDFD3A3A3A000000060606000000
            1616165C5C5C686868525252BCBCBCEFEFEFFFFFFFEEEEEEE7E7E7FCFCFCFFFF
            FFFFFFFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF656565
            0101010000000303033939396C6C6C3838385E5E5EE8E8E8E0E0E0D1D1D1CECE
            CECECECECECECEACACAC2F2F2F22222249494942424214141412121200000005
            0505EDEDEDFFFFFFFFFFFFF3F3F3C3C3C30E0E0E030303000000070707000000
            000000080808060606030303000000030303040404686868FCFCFCFFFFFFF5F5
            F5FFFFFF7575750404040000000000000808083737378A8A8A565656555555DE
            DEDEF4F4F4FFFFFFFCFCFCFFFFFFF9F9F9FFFFFFFFFFFFFBFBFBFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFE6565650000000000000000002E2E2E6E6E6E67
            6767747474CCCCCCD5D5D5D8D8D8C9C9C9B0B0B08989894848484B4B4B5A5A5A
            4F4F4F202020040404000000010101545454FEFEFEFAFAFAFFFFFFFFFFFFFBFB
            FBC4C4C434343402020200000000000009090901010100000003030300000000
            0000969696F3F3F3FFFFFFF4F4F4FFFFFFF7F7F7B7B7B7000000000000050505
            0909091414145A5A5A8282822929292B2B2B8A8A8AF8F8F8FFFFFFFBFBFBFFFF
            FFEEEEEEFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF646464
            0000000202020000000F0F0F5A5A5A9F9F9F4949493232321D1D1D2929293B3B
            3B6868688C8C8C9292927E7E7E6363632C2C2C060606050505010101000000BE
            BEBEFFFFFFFFFFFFF4F4F4FFFFFFFBFBFBFFFFFFFFFFFFABABAB6D6D6D1A1A1A
            0000000000000C0C0C3B3B3B939393FDFDFDFFFFFFFFFFFFF4F4F4FFFFFFFDFD
            FDFCFCFCFFFFFF2626260505050101010000000707072B2B2B6B6B6B6060602C
            2C2C0303030303030404040000000000000D0D0DFDFDFDFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF68686804040401010102020200000030303079
            79796B6B6B4141413434343333333A3A3A6262627070706767674F4F4F1B1B1B
            0808080505050404040000004C4C4CF9F9F9FFFFFFFDFDFDFFFFFFFFFFFFFEFE
            FEFEFEFEFCFCFCFFFFFFFFFFFFF8F8F8FFFFFFFFFFFFFEFEFEFFFFFFFBFBFBFE
            FEFEFDFDFDF8F8F8FEFEFEFFFFFFF8F8F8FFFFFFFEFEFEA9A9A9000000000000
            0D0D0D0000000606062F2F2F5C5C5C3E3E3E0E0E0E0202020000000202020A0A
            0A000000FCFCFCF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD696969
            0404040000000303030101010B0B0B2929294E4E4E3838382828281313130E0E
            0E2828282D2D2D1B1B1B0E0E0E060606000000050505000000191919D2D2D2FF
            FFFFFEFEFEFFFFFFFFFFFFF5F5F5FFFFFFFBFBFBFFFFFFFBFBFBFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFFFFFFFFFFFFF4F4F4FFFF
            FFFFFFFFF8F8F8FFFFFF7B7B7B0000000000000707070000000B0B0B37373744
            4444222222070707000000000000010101010101FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF6464640000000000000606060101010000000F
            0F0F2727271F1F1F1212120E0E0E090909000000010101000000000000000000
            020202000000131313C8C8C8FFFFFFF8F8F8FFFFFFFEFEFEF8F8F8FFFFFFFFFF
            FFFFFFFFFDFDFDFFFFFFFFFFFFFCFCFCFDFDFDFFFFFFFEFEFEFBFBFBFFFFFFFF
            FFFFFFFFFFFCFCFCFEFEFEFFFFFFFDFDFDF7F7F7FFFFFFF4F4F4FEFEFE707070
            0000000000000000000202020707072222221E1E1E0909090000000101010101
            01020202F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD676767
            0404040000000000000000000404040000000D0D0D0D0D0D0505050303030303
            030000000000000000000000000404040000003D3D3DD1D1D1FFFFFFF7F7F7FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F87676760808080000000000000000000A
            0A0A070707010101080808000000020202000000FFFFFFFEFEFEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFE65656500000000000006060600000000000000
            0000000000020202000000070707000000000000060606000000000000252525
            999999F9F9F9FFFFFFFDFDFDFFFFFFF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFFFFFF
            FFFFFFB0B0B03636360000000505050000000E0E0E0404040000000000000000
            00020202FFFFFFF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE6F6F6F
            0000000000000303030505050202020000000202020808080000000000000000
            001515156B6B6B8A8A8ACECECEF6F6F6FFFFFFFFFFFFFBFBFBFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FAFAFAFFFFFFFCFCFCCFCFCF8C8C8C33
            3333000000010101000000010101000000101010EDEDEDFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FDFDFDFFFFFFFFFFFFF8F8F8FAFAFAFF
            FFFFFAFAFAFFFFFFFFFFFFFFFFFFFAFAFAF4F4F4FFFFFFFFFFFFFCFCFCFFFFFF
            FFFFFFFDFDFDFFFFFFFFFFFFF9F9F9FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FDFDFDFFFFFFFFFFFFFBFBFBFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFF
            FFF4F4F4FFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFF
            FEFEFEFCFCFCFDFDFDFFFFFFFFFFFFFBFBFBFFFFFFFDFDFDFEFEFEFEFEFEFFFF
            FFFFFFFFFEFEFEFEFEFEFFFFFFFCFCFCFFFFFFFFFFFFF6F6F6F8F8F8FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFB
            FBFBFCFCFCFDFDFDFFFFFFF9F9F9FFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFCFCFCFDFDFDFFFFFFFEFEFEFCFCFCFFFFFFF8F8F8FFFFFFF8F8F8FFFFFF
            FFFFFFF7F7F7FFFFFFFFFFFFFEFEFEFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFFFFF
            FFFFFFFFFFFFFBFBFBF9F9F9FEFEFEFFFFFFFFFFFFFFFFFFFAFAFAFFFFFFFDFD
            FDFDFDFDFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFAFAFA
            FCFCFCFDFDFDFCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFEFEFEFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F9F9F9FFFFFFFFFFFFFBFBFBFBFBFBFE
            FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFDFDFDFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFBFBFBFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFB
            FBFBFFFFFFFEFEFEFFFFFFFFFFFFFAFAFAF8F8F8FFFFFFFAFAFAFBFBFBFFFFFF
            FFFFFFFAFAFAFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7
            FFFFFFFFFFFFFAFAFAFFFFFFFFFFFFFDFDFDFDFDFDFEFEFEFFFFFFF8F8F8FEFE
            FEFFFFFFF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frxDBDataset1ECODIGOAREA: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 68.031540000000000000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Tel.([frxDBDataset1."ECODIGOAREA"]) [frxDBDataset1."ETELEFONO"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end>
        end
        object frxDBDataset1ECP: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 90.708720000000000000
          Width = 393.071120000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[frxDBDataset1."EDIRECCIONCOMERCIAL"] ([frxDBDataset1."ECP"]) [f' +
              'rxDBDataset1."ECIUDAD"] - [frxDBDataset1."EPROVINCIA"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 4.440940000000000000
          Top = 142.165430000000000000
          Width = 71.811070000000000000
          Height = 14.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Se'#241'or/es:')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 86.929190000000000000
          Top = 156.960730000000000000
          Width = 350.372913330000000000
          Height = 14.236240000000000000
          DataSetName = 'FacturafrxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."DIRECCION"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 4.440940000000000000
          Top = 156.960730000000000000
          Width = 71.811070000000000000
          Height = 14.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Domicilio:')
          ParentFont = False
          VAlign = vaBottom
        end
        object frxDBDataset1ECUIT: TfrxMemoView
          AllowVectorExport = True
          Left = 397.850650000000000000
          Top = 72.366976000000000000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'C.U.I.T. N'#186': [frxDBDataset1."ECUIT"]')
          ParentFont = False
        end
        object frxDBDataset1EIIBB: TfrxMemoView
          AllowVectorExport = True
          Left = 397.850650000000000000
          Top = 96.155968000000000000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'ING. BRUTO N'#186': [frxDBDataset1."EIIBB"]')
          ParentFont = False
        end
        object frxDBDataset1EFECHA: TfrxMemoView
          AllowVectorExport = True
          Left = 397.850650000000000000
          Top = 119.944960000000000000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'INIC. DE ACTIV. [frxDBDataset1."EFECHA"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 139.842610000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object frxDBDataset1CIVA: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 141.622140000000000000
          Width = 279.685220000000000000
          Height = 14.236240000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'I.V.A.: [frxDBDataset1."CIVA"]')
          ParentFont = False
        end
        object frxDBDataset1CCUIT: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 156.960730000000000000
          Width = 279.685220000000000000
          Height = 14.236240000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'C.U.I.T.: [frxDBDataset1."CCUIT"]')
          ParentFont = False
        end
        object frxDBDataset1ETITULAR: TfrxMemoView
          AllowVectorExport = True
          Left = 136.063080000000000000
          Top = 34.015770000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'de [frxDBDataset1."ETITULAR"]')
          ParentFont = False
        end
        object frxDBDataset1EIVA: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 117.165430000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'I.V.A.: [frxDBDataset1."EIVA"]')
          ParentFont = False
        end
        object frxDBDataset1EWEB: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 3.779529999999990000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = 'EWEB'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."EWEB"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object VentasFDQuery1: TFDQuery
    SQL.Strings = (
      'SELECT '
      
      
        '      "Cliente".NOMBRE,  "Cliente".TITULAR, "Cliente".DIRECCION,' +
        ' "Cliente".DIRECCIONCOMERCIAL, "Cliente".IVA as CIVA, "Cliente".' +
        'CUIT as CCUIT,'
      '      '#39'www.civeloo.com'#39' as EWEB,'
      #39'FACTURA'#39' as CTIPO, '#39'COD.6'#39' as NCTIPO,'
      '      '
      
        '      "Articulo".DESCRIPCION, "Articulo".UNIDAD, "Articulo".IVA ' +
        'as AIVA,'
      '      '
      
        '      "VentaItem".ARTICULO, "VentaItem".CANTIDAD, "VentaItem".CO' +
        'STO AS VIDESCUENTO,'
      
        '      "VentaItem".PRECIO, "VentaItem".OPERACION, ("VentaItem".PR' +
        'ECIO * "VentaItem".CANTIDAD ) as PREXCANT, '
      
        '      "VentaItem".SERVICIO, "VentaItem".DESCRIPCION AS DESCR, "V' +
        'entaItem".IMPUESTO as VIIMPUESTO,'
      '      "Venta".DESCRIPCION as VDESC,'
      '      "Venta".CODIGO,   "Venta".LETRA,   "Venta".FECHA,'
      
        '      "Venta".COMPROBANTE, "Venta".TERMINOS ,   "Venta".IVA3,   ' +
        '"Venta".TOTAL,'
      '      "Venta".CONTADO,   "Venta".CLIENTE,   "Venta".SUBTOTAL,'
      '      "Venta".DESCUENTO,   "Venta".IMPUESTO,   "Venta".IVA2,'
      '      "Venta".IVA1, "Venta".EXCENTO,   "Venta".SALDO,'
      '      "Venta".PAGADO, '#39'20121231237'#39'as CB'
      '  '
      'FROM   '
      #9'"Venta"'
      
        '      INNER JOIN "VentaItem" ON ("Venta".CODIGO = "VentaItem".OP' +
        'ERACION)'
      
        '      INNER JOIN "Articulo" ON ("VentaItem".ARTICULO = "Articulo' +
        '".CODIGO)'
      
        '      INNER JOIN "Cliente" ON ("Venta".CLIENTE = "Cliente".CODIG' +
        'O)'
      ''
      'WHERE'
      ' "Venta".CODIGO = 1')
    Left = 487
  end
  object FDQuery1: TFDQuery
    SQL.Strings = (
      '')
    Left = 487
    Top = 48
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'C:\Users\DeGsoft\Documents\Civeloo\GeN\db\GeN.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=3'
      'lc_ctype=WIN1252')
    LoginPrompt = False
    ServerType = 'IBServer'
    AllowStreamedConnected = False
    Left = 304
    Top = 24
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = db
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT '
      
            
        '      "Cliente".NOMBRE,  "Cliente".TITULAR, "Cliente".DIRECCION,' +
        ' "Cliente".DIRECCIONCOMERCIAL, "Cliente".IVA as CIVA, "Cliente".' +
        'CUIT as CCUIT,'
      #39'FACTURA'#39' AS CTIPO,'
      ''
      '      '
      
        '      "Articulo".DESCRIPCION, "Articulo".UNIDAD, "Articulo".IVA ' +
        'as AIVA,'
      '      '
      
        '      "VentaItem".ARTICULO, "VentaItem".CANTIDAD, "VentaItem".CO' +
        'STO AS VIDESCUENTO,'
      
        '      "VentaItem".PRECIO, "VentaItem".OPERACION, ("VentaItem".PR' +
        'ECIO * "VentaItem".CANTIDAD ) as PREXCANT, '
      
        '      "VentaItem".SERVICIO, "VentaItem".DESCRIPCION AS DESCR, "V' +
        'entaItem".IMPUESTO as VIIMPUESTO,'
      '      '
      
        '      "Venta".CODIGO, "Venta".LETRA, "Venta".DESCRIPCION as VDES' +
        'C, "Venta".FECHA,'
      
        '      "Venta".COMPROBANTE, "Venta".TERMINOS ,   "Venta".IVA3,   ' +
        '"Venta".TOTAL,'
      '      "Venta".CONTADO,   "Venta".CLIENTE,   "Venta".SUBTOTAL,'
      '      "Venta".DESCUENTO,   "Venta".IMPUESTO,   "Venta".IVA2,'
      '      "Venta".IVA1, "Venta".EXCENTO,   "Venta".SALDO,'
      '      "Venta".PAGADO, '#39'20121231237'#39'as CB'
      '  '
      'FROM   '
      #9'"Venta"'
      
        '      INNER JOIN "VentaItem" ON ("Venta".CODIGO = "VentaItem".OP' +
        'ERACION)'
      
        '      INNER JOIN "Articulo" ON ("VentaItem".ARTICULO = "Articulo' +
        '".CODIGO)'
      
        '      INNER JOIN "Cliente" ON ("Venta".CLIENTE = "Cliente".CODIG' +
        'O)'
      'WHERE "Venta".CODIGO = 2'
      '')
    Left = 304
    Top = 88
  end
  object db: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 304
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 304
    Top = 200
  end
  object OperacionFDQuery: TFDQuery
    Active = True
    Connection = GenConnection
    SQL.Strings = (
      'SELECT'
      
      #39'0'#39' As EIIBB, '#39'REMITO'#39' as CTIPO, '#39#39' as NCTIPO, "Cliente".NOMBRE,'
      
        '"Cliente".TITULAR, "Cliente".DIRECCION, "Cliente".DIRECCIONCOMER' +
        'CIAL,'
      '"Cliente".IVA as CIVA, "Cliente".CUIT as CCUIT, "Cliente".EMAIL,'
      
        '"Articulo".DESCRIPCION, "Articulo".UNIDAD, "Articulo".IVA as AIV' +
        'A,'
      '"OperacionItem".ARTICULO,  "OperacionItem".CANTIDAD,'
      '"OperacionItem".COSTO AS VIDESCUENTO,  "OperacionItem".PRECIO,'
      '"OperacionItem".OPERACION,'
      
        '("OperacionItem".PRECIO * "OperacionItem".CANTIDAD ) as PREXCANT' +
        ','
      
        '"OperacionItem".IMPUESTO as VIIMPUESTO,  "OperacionItem".SERVICI' +
        'O,'
      
        '"OperacionItem".DESCRIPCION AS DESCR, "Operacion".CODIGO,  "Oper' +
        'acion".LETRA,'
      
        '"Operacion".FECHA, "Operacion".COMPROBANTE AS CB, "Operacion".CO' +
        'MPROBANTE,'
      
        '"Operacion".TERMINOS, "Operacion".DESCRIPCION as VDESC, "Operaci' +
        'on".TOTAL,'
      '"Operacion".CONTADO,  "Operacion".CLIENTE, "Operacion".SUBTOTAL,'
      '"Operacion".DESCUENTO, "Operacion".IMPUESTO, "Operacion".IVA1,'
      '"Operacion".IVA2, "Operacion".IVA3, "Operacion".EXCENTO,'
      
        '"Operacion".SALDO, "Operacion".PAGADO, "Operacion".COMISION, "Op' +
        'eracion".ENVIO'
      'FROM  "Operacion"'
      
        'INNER JOIN "OperacionItem" ON ("Operacion".CODIGO = "OperacionIt' +
        'em".OPERACION)'
      
        'INNER JOIN "Articulo" ON ("OperacionItem".ARTICULO = "Articulo".' +
        'CODIGO)'
      'INNER JOIN "Cliente" ON ("Operacion".CLIENTE = "Cliente".CODIGO)'
      'WHERE'
      '("Operacion".CODIGO = 68)'
      'AND ("Operacion".TIPO = '#39'PED'#39' )'
      'AND ("Operacion".LETRA = '#39'X'#39' )')
    Left = 447
  end
  object tLibroIVAventa: TFDQuery
    SQL.Strings = (
      'SELECT * from "LibroIVAventa"')
    Left = 447
    Top = 48
  end
  object sdb: TFDConnection
    Params.Strings = (
      'Database=C:\Users\DeGsoft\Documents\Civeloo\GeN\db\db.sdb'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 608
  end
  object qSdb: TFDQuery
    Active = True
    Connection = sdb
    SQL.Strings = (
      'select * from'
      'SiapVtaCompAlicuota'
      
        'inner join SiapVtaComp on SiapVtaComp.Codigo=SiapVtaCompAlicuota' +
        '.Codigo'
      'where CbteFch >= 20190801 and CbteFch <= 20190831'
      'Order By SiapVtaCompAlicuota.Codigo')
    Left = 608
    Top = 48
  end
  object GenConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=GeN')
    Connected = True
    LoginPrompt = False
    Left = 445
    Top = 125
  end
end
