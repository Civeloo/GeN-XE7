object fOrder_items: TfOrder_items
  Left = 0
  Top = 0
  Caption = 'Detalle de Ordenes x Cliente'
  ClientHeight = 567
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object StringGridBindSourceDB1: TStringGrid
    Tag = 4
    Left = 0
    Top = 0
    Width = 584
    Height = 420
    Align = alClient
    ColCount = 4
    DrawingStyle = gdsGradient
    FixedCols = 0
    RowCount = 2
    TabOrder = 0
    OnClick = StringGridBindSourceDB1Click
    ColWidths = (
      330
      100
      40
      100)
  end
  object Panel1: TPanel
    Left = 0
    Top = 508
    Width = 792
    Height = 59
    Align = alBottom
    Caption = 'Panel1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object bImprimir: TButton
      Left = 584
      Top = 5
      Width = 200
      Height = 50
      Caption = 'IMPRIMIR ETIQUETA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = bImprimirClick
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 420
    Width = 792
    Height = 88
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object sgMessage: TStringGrid
    Tag = 1
    Left = 584
    Top = 0
    Width = 208
    Height = 420
    Align = alRight
    ColCount = 1
    DrawingStyle = gdsGradient
    FixedCols = 0
    RowCount = 2
    ScrollBars = ssVertical
    TabOrder = 3
    ColWidths = (
      300)
  end
  object qOrder_items: TFDQuery
    Connection = dmML.dbMain
    SQL.Strings = (
      
        'SELECT order_items.title AS TITULO, order_items.full_unit_price ' +
        'AS PRECIO, order_items.quantity AS CANTIDAD, order_items.seller_' +
        'sku AS SKU, buyer.first_name AS NOMBRE, buyer.last_name AS APELL' +
        'IDO, buyer.nickname AS NIK, "imprimir" AS ETIQUETA'
      ' FROM orders'
      ' INNER JOIN order_items ON orders.id = order_items.order_id'
      ' INNER JOIN buyer ON orders.buyer = buyer.id'
      ' GROUP BY orders.buyer')
    Left = 448
    Top = 65534
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = qOrder_items
    ScopeMappings = <>
    Left = 24
    Top = 16
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 12
    Top = 13
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = StringGridBindSourceDB1
      Columns = <
        item
          MemberName = 'title'
          Header = 'PRODUCTO'
          Width = 330
        end
        item
          MemberName = 'full_unit_price'
          Header = 'PRECIO'
          Width = 100
        end
        item
          MemberName = 'quantity'
          Header = 'CANTIDAD'
          Width = 40
        end
        item
          MemberName = 'seller_sku'
          Header = 'SKU'
          Width = 100
        end>
    end
    object LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB2
      GridControl = sgMessage
      Columns = <
        item
          MemberName = 'text_plain'
          Header = 'MENSAJES'
          Width = 300
        end>
    end
    object LinkPropertyToFieldtext_plain: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB2
      FieldName = 'text_plain'
      Component = Memo1
      ComponentProperty = 'Text'
    end
  end
  object BindSourceDB2: TBindSourceDB
    DataSet = dmML.tMessages
    ScopeMappings = <>
    Left = 624
    Top = 360
  end
end
