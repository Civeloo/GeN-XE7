object FSelOrden: TFSelOrden
  Left = 361
  Top = 306
  Caption = 'Seleccione Orden'
  ClientHeight = 297
  ClientWidth = 582
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 200
    Top = 8
    Width = 193
    Height = 24
    Caption = 'Seleccione la Orden'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 48
    Width = 44
    Height = 13
    Caption = 'Cliente:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 88
    Width = 497
    Height = 113
    DataSource = DSOrdenes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CodOrden'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodCliente'
        Title.Caption = 'Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NombreCliente'
        Title.Caption = 'Nombre'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 176
    Top = 227
    Width = 80
    Height = 50
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
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 304
    Top = 228
    Width = 80
    Height = 50
    Caption = 'No'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Kind = bkNo
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object Edit1: TEdit
    Left = 90
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object AQOrdenes: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Distinct OrdenProd.CodOrden, Clientes.CodCliente, Cliente' +
        's.NombreCliente, Series.Estado'
      
        'FROM (Clientes RIGHT JOIN OrdenProd ON Clientes.CodCliente = Ord' +
        'enProd.CodCliente) LEFT JOIN Series ON OrdenProd.CodOrden = Seri' +
        'es.CodOrdenProd'
      '')
    Left = 544
    Top = 72
    object AQOrdenesCodOrden: TIntegerField
      FieldName = 'CodOrden'
    end
    object AQOrdenesCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object AQOrdenesNombreCliente: TWideStringField
      FieldName = 'NombreCliente'
      Size = 50
    end
    object AQOrdenesEstado: TWideStringField
      FieldName = 'Estado'
      Size = 10
    end
  end
  object DSOrdenes: TDataSource
    DataSet = AQOrdenes
    Left = 544
    Top = 112
  end
end
