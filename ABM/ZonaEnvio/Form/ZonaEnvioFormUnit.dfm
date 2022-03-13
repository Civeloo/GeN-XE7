object ZonaEnvioForm: TZonaEnvioForm
  Left = 0
  Top = 0
  Caption = 'Envio'
  ClientHeight = 442
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DerechoPanel: TPanel
    Left = 549
    Top = 0
    Width = 75
    Height = 442
    Align = alRight
    ParentBackground = False
    TabOrder = 0
    object ZonaCodigoLabel: TLabel
      Left = 1
      Top = 1
      Width = 73
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 33
    end
    object GrabarBitBtn: TBitBtn
      Left = 1
      Top = 341
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
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = GrabarBitBtnClick
    end
    object NoBitBtn: TBitBtn
      Left = 1
      Top = 391
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
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = NoBitBtnClick
    end
    object ZonaCodigoDBEdit: TDBEdit
      Left = 1
      Top = 14
      Width = 73
      Height = 32
      Align = alTop
      DataField = 'CODIGO'
      DataSource = ZonaEnvioDataSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object RegionCodigoDBEdit: TDBEdit
      Left = 1
      Top = 46
      Width = 73
      Height = 32
      Align = alTop
      DataField = 'CODIGO'
      DataSource = ZERegionDataSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
    object MetodoCodigoDBEdit: TDBEdit
      Left = 1
      Top = 78
      Width = 73
      Height = 32
      Align = alTop
      DataField = 'CODIGO'
      DataSource = ZEMetodoDataSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = False
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 549
    Height = 442
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 1
    object ZonaTabSheet: TTabSheet
      Caption = 'Zona'
      object ZonaDescripcionLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 535
        Height = 13
        Align = alTop
        Caption = 'Nombre:'
        FocusControl = ZonaDescripcionDBEdit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 48
      end
      object ZonaOrdenLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 49
        Width = 535
        Height = 13
        Align = alTop
        Caption = 'Orden:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 39
      end
      object ZonaDBGrid: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 95
        Width = 535
        Height = 260
        Align = alClient
        DataSource = ZonaEnvioDataSource
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object ZonaDBNavigator: TDBNavigator
        AlignWithMargins = True
        Left = 3
        Top = 361
        Width = 535
        Height = 50
        DataSource = ZonaEnvioDataSource
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit]
        Align = alBottom
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
        OnClick = ZonaDBNavigatorClick
      end
      object ZonaDescripcionDBEdit: TDBEdit
        AlignWithMargins = True
        Left = 3
        Top = 22
        Width = 535
        Height = 21
        Align = alTop
        DataField = 'DESCRIPCION'
        DataSource = ZonaEnvioDataSource
        TabOrder = 1
      end
      object ZonaOrdenDBEdit: TDBEdit
        AlignWithMargins = True
        Left = 3
        Top = 68
        Width = 535
        Height = 21
        Align = alTop
        DataField = 'ORDEN'
        DataSource = ZonaEnvioDataSource
        TabOrder = 2
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Region'
      ImageIndex = 1
      object RegionTipoLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 76
        Width = 535
        Height = 13
        Align = alTop
        Caption = 'Tipo:'
        FocusControl = RegionTipoDBComboBox
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        ExplicitWidth = 30
      end
      object RegionDescripcionLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 30
        Width = 535
        Height = 13
        Align = alTop
        Caption = 'Nombre:'
        FocusControl = RegionDescripcionDBEdit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        ExplicitWidth = 48
      end
      object RegionContinenteLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 122
        Width = 535
        Height = 13
        Align = alTop
        Caption = 'Continente:'
        FocusControl = RegionContinenteDBEdit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 66
      end
      object RegionPaisLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 168
        Width = 535
        Height = 13
        Align = alTop
        Caption = 'Pais:'
        FocusControl = RegionPaisDBEdit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 29
      end
      object RegionProvinciaLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 214
        Width = 535
        Height = 13
        Align = alTop
        Caption = 'RegionProvincia:'
        FocusControl = RegionProvinciaDBEdit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 98
      end
      object RegionCiudadLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 260
        Width = 535
        Height = 13
        Align = alTop
        Caption = 'RegionCiudad:'
        FocusControl = RegionCiudadDBEdit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        ExplicitWidth = 84
      end
      object RegionDBGrid: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 306
        Width = 535
        Height = 49
        Align = alClient
        DataSource = ZERegionDataSource
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object RegionDBNavigator: TDBNavigator
        AlignWithMargins = True
        Left = 3
        Top = 361
        Width = 535
        Height = 50
        DataSource = ZERegionDataSource
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit]
        Align = alBottom
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
        TabOrder = 8
        OnClick = RegionDBNavigatorClick
      end
      object RegionTipoDBComboBox: TDBComboBox
        AlignWithMargins = True
        Left = 3
        Top = 95
        Width = 535
        Height = 21
        Align = alTop
        DataField = 'TIPO'
        DataSource = ZERegionDataSource
        Items.Strings = (
          'codigo postal'
          'provincia'
          'pais'
          'continente')
        TabOrder = 3
        Visible = False
      end
      object RegionDescripcionDBEdit: TDBEdit
        AlignWithMargins = True
        Left = 3
        Top = 49
        Width = 535
        Height = 21
        Align = alTop
        DataField = 'DESCRIPCION'
        DataSource = ZERegionDataSource
        TabOrder = 2
        Visible = False
      end
      object RegionZonaEnvioDBEdit: TDBEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 535
        Height = 21
        Align = alTop
        DataField = 'ZONAENVIO'
        DataSource = ZERegionDataSource
        TabOrder = 1
        Visible = False
      end
      object RegionContinenteDBEdit: TDBEdit
        AlignWithMargins = True
        Left = 3
        Top = 141
        Width = 535
        Height = 21
        Align = alTop
        DataField = 'CONTINENTE'
        DataSource = ZERegionDataSource
        TabOrder = 4
      end
      object RegionPaisDBEdit: TDBEdit
        AlignWithMargins = True
        Left = 3
        Top = 187
        Width = 535
        Height = 21
        Align = alTop
        DataField = 'PAIS'
        DataSource = ZERegionDataSource
        TabOrder = 5
      end
      object RegionProvinciaDBEdit: TDBEdit
        AlignWithMargins = True
        Left = 3
        Top = 233
        Width = 535
        Height = 21
        Align = alTop
        DataField = 'PROVINCIA'
        DataSource = ZERegionDataSource
        TabOrder = 6
      end
      object RegionCiudadDBEdit: TDBEdit
        AlignWithMargins = True
        Left = 3
        Top = 279
        Width = 535
        Height = 21
        Align = alTop
        DataField = 'CIUDAD'
        DataSource = ZERegionDataSource
        TabOrder = 7
        Visible = False
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Metodo'
      ImageIndex = 2
      object MetodoCostoLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 214
        Width = 535
        Height = 13
        Align = alTop
        Caption = 'Costo:'
        FocusControl = MetodoCostoDBEdit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 37
      end
      object MetodoImpuestoLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 168
        Width = 535
        Height = 13
        Align = alTop
        Caption = 'Impuesto:'
        FocusControl = MetodoImpuestoDBComboBox
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 56
      end
      object MetodoDescripcionLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 76
        Width = 535
        Height = 13
        Align = alTop
        Caption = 'Nombre:'
        FocusControl = MetodoCostoDBEdit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 48
      end
      object MetodoOrdenLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 122
        Width = 535
        Height = 13
        Align = alTop
        Caption = 'Orden:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 39
      end
      object MetodoLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 30
        Width = 535
        Height = 13
        Align = alTop
        Caption = 'Metodo:'
        FocusControl = MetodoDBComboBox
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 47
      end
      object MetodoDBNavigator: TDBNavigator
        AlignWithMargins = True
        Left = 3
        Top = 361
        Width = 535
        Height = 50
        DataSource = ZEMetodoDataSource
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit]
        Align = alBottom
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
        TabOrder = 7
      end
      object MetodoDBGrid: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 260
        Width = 535
        Height = 95
        Align = alClient
        DataSource = ZEMetodoDataSource
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object MetodoDescripcionDBEdit: TDBEdit
        AlignWithMargins = True
        Left = 3
        Top = 95
        Width = 535
        Height = 21
        Align = alTop
        DataField = 'DESCRIPCION'
        DataSource = ZEMetodoDataSource
        TabOrder = 3
      end
      object MetodoCostoDBEdit: TDBEdit
        AlignWithMargins = True
        Left = 3
        Top = 233
        Width = 535
        Height = 21
        Align = alTop
        DataField = 'DESCRIPCION'
        DataSource = ZEMetodoDataSource
        TabOrder = 6
      end
      object MetodoZonaEnvioDBEdit: TDBEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 535
        Height = 21
        Align = alTop
        DataField = 'ZONAENVIO'
        DataSource = ZERegionDataSource
        TabOrder = 1
        Visible = False
      end
      object MetodoOrdenDBEdit: TDBEdit
        AlignWithMargins = True
        Left = 3
        Top = 141
        Width = 535
        Height = 21
        Align = alTop
        DataField = 'DESCRIPCION'
        DataSource = ZEMetodoDataSource
        TabOrder = 4
      end
      object MetodoDBComboBox: TDBComboBox
        AlignWithMargins = True
        Left = 3
        Top = 49
        Width = 535
        Height = 21
        Align = alTop
        DataField = 'METODO'
        DataSource = ZEMetodoDataSource
        Items.Strings = (
          'precio fijo'
          'envio gratuito'
          'recogida local')
        TabOrder = 2
      end
      object MetodoImpuestoDBComboBox: TDBComboBox
        AlignWithMargins = True
        Left = 3
        Top = 187
        Width = 535
        Height = 21
        Align = alTop
        DataField = 'IMPUESTO'
        DataSource = ZEMetodoDataSource
        Items.Strings = (
          'imponible'
          'ninguno')
        TabOrder = 5
      end
    end
  end
  object ZonaEnvioDataSource: TDataSource
    DataSet = ZonaEnvioFDTable
    Left = 588
    Top = 207
  end
  object ZonaEnvioFDTable: TFDTable
    IndexFieldNames = 'CODIGO'
    Connection = DM.BaseDatosFB
    Transaction = DM.TransactionFB
    UpdateOptions.UpdateTableName = '"ZonaEnvio"'
    TableName = '"ZonaEnvio"'
    Left = 560
    Top = 207
  end
  object ZERegionDataSource: TDataSource
    DataSet = ZERegionFDTable
    Left = 588
    Top = 255
  end
  object ZERegionFDTable: TFDTable
    IndexFieldNames = 'CODIGO'
    Connection = DM.BaseDatosFB
    Transaction = DM.TransactionFB
    UpdateOptions.UpdateTableName = '"ZERegion"'
    TableName = '"ZERegion"'
    Left = 560
    Top = 255
  end
  object ZEMetodoDataSource: TDataSource
    DataSet = ZEMetodoFDTable
    Left = 588
    Top = 303
  end
  object ZEMetodoFDTable: TFDTable
    IndexFieldNames = 'CODIGO'
    Connection = DM.BaseDatosFB
    Transaction = DM.TransactionFB
    UpdateOptions.UpdateTableName = '"ZEMetodo"'
    TableName = '"ZEMetodo"'
    Left = 560
    Top = 303
  end
end
