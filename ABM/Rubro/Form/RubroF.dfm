object RubroForm: TRubroForm
  Left = 450
  Top = 246
  Caption = 'Rubro'
  ClientHeight = 389
  ClientWidth = 359
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 359
    Height = 389
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 177
      Width = 357
      Height = 13
      Align = alTop
      Caption = 'NOMBRE'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 54
    end
    object DBEdit1: TDBEdit
      Left = 1
      Top = 190
      Width = 357
      Height = 24
      Align = alTop
      DataField = 'DESCRIPCION'
      DataSource = DM.dstRubro
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 357
      Height = 176
      Align = alTop
      DataSource = DM.dstRubro
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Width = 207
          Visible = True
        end>
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 338
      Width = 357
      Height = 50
      DataSource = DM.dstRubro
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
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 139
      Top = 249
      Width = 80
      Height = 50
      Caption = 'Cerrar'
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 3
      OnClick = BitBtn1Click
    end
  end
end
