object WooCommerceForm: TWooCommerceForm
  Left = 0
  Top = 0
  Caption = 'WooCommerce'
  ClientHeight = 341
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelClient: TPanel
    Left = 0
    Top = 0
    Width = 396
    Height = 341
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object wpSiteLabel: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 388
      Height = 21
      Align = alTop
      Caption = 'Site:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 39
    end
    object wooCommerceKeyLabel: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 66
      Width = 388
      Height = 21
      Align = alTop
      Caption = 'Consumer Key:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 129
    end
    object WooCommerceSecretLabel: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 128
      Width = 388
      Height = 21
      Align = alTop
      Caption = 'Consumer Secret:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 151
    end
    object wPUsernameLabel: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 190
      Width = 388
      Height = 21
      Align = alTop
      Caption = 'User name:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 97
    end
    object WPPasswordLabel: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 252
      Width = 388
      Height = 21
      Align = alTop
      Caption = 'Password:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 89
    end
    object wpSiteEdit: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 31
      Width = 388
      Height = 29
      Align = alTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = 'https://miempresa.com.ar/'
      TextHint = 'https://miempresa.com.ar/'
    end
    object wooCommerceKeyEdit: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 93
      Width = 388
      Height = 29
      Align = alTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = 'ck_'
      TextHint = 'ck_***************************************'
    end
    object WooCommerceSecretEdit: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 155
      Width = 388
      Height = 29
      Align = alTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = 'cs_'
      TextHint = 'cs_***************************************'
    end
    object wPUsernameEdit: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 217
      Width = 388
      Height = 29
      Align = alTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object wPPasswordEdit: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 279
      Width = 388
      Height = 29
      Align = alTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object AutoSincronizarCheckBox: TCheckBox
      AlignWithMargins = True
      Left = 4
      Top = 320
      Width = 388
      Height = 17
      Align = alBottom
      Caption = 'Auto Sincronizar'
      TabOrder = 5
    end
  end
  object PanelRight: TPanel
    Left = 396
    Top = 0
    Width = 93
    Height = 341
    Align = alRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object SiBitBtn: TBitBtn
      AlignWithMargins = True
      Left = 4
      Top = 231
      Width = 85
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
      OnClick = SiBitBtnClick
    end
    object NoBitBtn: TBitBtn
      AlignWithMargins = True
      Left = 4
      Top = 287
      Width = 85
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
    object SincronizarBitBtn: TBitBtn
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 85
      Height = 50
      Align = alTop
      Caption = 'Sincronizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = SincronizarBitBtnClick
    end
  end
end
