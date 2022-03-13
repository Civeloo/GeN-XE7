object FCancelOrderView: TFCancelOrderView
  Left = 0
  Top = 0
  Caption = 'Anular'
  ClientHeight = 310
  ClientWidth = 531
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RightPanel: TPanel
    Left = 456
    Top = 25
    Width = 75
    Height = 285
    Align = alRight
    TabOrder = 0
    object yesBitBtn: TBitBtn
      Left = 1
      Top = 184
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
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = yesBitBtnClick
    end
    object NoBitBtn: TBitBtn
      Left = 1
      Top = 234
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
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 2
      OnClick = NoBitBtnClick
    end
    object findBitBtn: TBitBtn
      Left = 1
      Top = 1
      Width = 73
      Height = 28
      Align = alTop
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = findBitBtnClick
    end
    object fechaDateTimePicker: TDateTimePicker
      Left = 1
      Top = 29
      Width = 73
      Height = 21
      Align = alTop
      Date = 43810.000000000000000000
      Time = 0.784737245368887700
      TabOrder = 3
    end
    object bRetPer: TButton
      Left = 1
      Top = 50
      Width = 73
      Height = 31
      Hint = 'Retenciones y Percepciones'
      Align = alTop
      Caption = 'Ret. y Percep.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      WordWrap = True
      OnClick = bRetPerClick
    end
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 531
    Height = 25
    Align = alTop
    TabOrder = 1
    object TitleLabel: TLabel
      Left = 1
      Top = 1
      Width = 193
      Height = 20
      Align = alTop
      Caption = 'Comprobante Asociado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object ClientPanel: TPanel
    Left = 0
    Top = 25
    Width = 456
    Height = 285
    Align = alClient
    TabOrder = 2
    object LetterLabel: TLabel
      Left = 1
      Top = 29
      Width = 16
      Height = 20
      Align = alTop
      Caption = '...'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object bonificarLabel: TLabel
      Left = 1
      Top = 236
      Width = 77
      Height = 20
      Align = alBottom
      Caption = 'Bonificar:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object compLabel: TLabel
      Left = 1
      Top = 188
      Width = 114
      Height = 20
      Align = alBottom
      Caption = 'Comprobante:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object nroEdit: TEdit
      Left = 1
      Top = 1
      Width = 454
      Height = 28
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object bonificarEdit: TEdit
      Left = 1
      Top = 256
      Width = 454
      Height = 28
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object compEdit: TEdit
      Left = 1
      Top = 208
      Width = 454
      Height = 28
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
  end
end
