object MigrarForm: TMigrarForm
  Left = 0
  Top = 0
  Caption = 'Migrar '
  ClientHeight = 312
  ClientWidth = 290
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 2
    Width = 55
    Height = 13
    Caption = 'URL (REST)'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 45
    Height = 13
    Caption = 'Resource'
  end
  object Label3: TLabel
    Left = 8
    Top = 92
    Width = 69
    Height = 13
    Caption = 'Consumer Key'
  end
  object Label4: TLabel
    Left = 8
    Top = 136
    Width = 82
    Height = 13
    Caption = 'Consumer Secret'
  end
  object ImportarButton: TButton
    Left = 209
    Top = 235
    Width = 80
    Height = 50
    Caption = 'Importar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = ImportarButtonClick
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 236
    Width = 201
    Height = 50
    TabOrder = 1
  end
  object EditUrl: TEdit
    Left = 8
    Top = 21
    Width = 281
    Height = 21
    TabOrder = 2
    Text = 'https://mysite.com.ar/wp-json/wc/v2/'
  end
  object EditResource: TEdit
    Left = 8
    Top = 65
    Width = 281
    Height = 21
    TabOrder = 3
    Text = 'products/?'
  end
  object EditUser: TEdit
    Left = 8
    Top = 109
    Width = 281
    Height = 21
    TabOrder = 4
    Text = 'ck'
  end
  object EditPassword: TEdit
    Left = 8
    Top = 153
    Width = 281
    Height = 21
    TabOrder = 5
    Text = 'cs'
  end
  object BorrarArticulosCheckBox: TCheckBox
    Left = 8
    Top = 292
    Width = 129
    Height = 17
    Caption = 'Borrar Articulos Viejos'
    TabOrder = 6
  end
  object DesdeRadioGroup: TRadioGroup
    Left = 8
    Top = 180
    Width = 201
    Height = 49
    Caption = 'Desde'
    ItemIndex = 0
    Items.Strings = (
      'CSV'
      'WEB - WooCommerce')
    TabOrder = 7
  end
  object StringGrid1: TStringGrid
    Left = 295
    Top = 0
    Width = 721
    Height = 522
    Align = alCustom
    TabOrder = 8
  end
  object ActualizarCB: TCheckBox
    Left = 222
    Top = 291
    Width = 65
    Height = 17
    Hint = 
      'Actualizar Articulos en la Web, cuando se realizan modificacione' +
      's.'
    Caption = 'Actualizar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    Visible = False
  end
  object ExportarButton: TButton
    Left = 211
    Top = 179
    Width = 78
    Height = 50
    Caption = 'Exportar'
    TabOrder = 10
    OnClick = ExportarButtonClick
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 45
    Top = 237
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 264
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    DefaultExt = '.csv'
    FileName = 'Articulos.csv'
    Filter = 'CSV files only|*.csv'
    EncodingIndex = 4
    Left = 146
    Top = 237
  end
end
