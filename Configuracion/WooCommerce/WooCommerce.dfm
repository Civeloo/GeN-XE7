object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 202
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PanelClient: TPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 202
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = -94
    ExplicitTop = -240
    ExplicitWidth = 539
    ExplicitHeight = 442
    object UsuarioLabel: TLabel
      Left = 1
      Top = 1
      Width = 350
      Height = 21
      Align = alTop
      Caption = 'Usuario:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 72
    end
    object ContraseñaLabel: TLabel
      Left = 1
      Top = 51
      Width = 350
      Height = 21
      Align = alTop
      Caption = 'Contrase'#241'a:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 103
    end
    object SecretUsrLabel: TLabel
      Left = 1
      Top = 101
      Width = 350
      Height = 21
      Align = alBottom
      Caption = 'Secret Usr:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 341
      ExplicitWidth = 94
    end
    object SecretKeyLabel: TLabel
      Left = 1
      Top = 151
      Width = 350
      Height = 21
      Align = alBottom
      Caption = 'Secret Key:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 391
      ExplicitWidth = 97
    end
    object UsuarioEdit: TEdit
      Left = 1
      Top = 22
      Width = 350
      Height = 29
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 537
    end
    object ContraseñaEdit: TEdit
      Left = 1
      Top = 72
      Width = 350
      Height = 29
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 537
    end
    object SecretUsrEdit: TEdit
      Left = 1
      Top = 122
      Width = 350
      Height = 29
      Align = alBottom
      TabOrder = 2
      ExplicitTop = 362
      ExplicitWidth = 537
    end
    object SecretKeyEdit: TEdit
      Left = 1
      Top = 172
      Width = 350
      Height = 29
      Align = alBottom
      TabOrder = 3
      ExplicitTop = 412
      ExplicitWidth = 537
    end
  end
  object PanelRight: TPanel
    Left = 352
    Top = 0
    Width = 93
    Height = 202
    Align = alRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    ExplicitTop = -240
    ExplicitHeight = 442
    object SiBitBtn: TBitBtn
      Left = 1
      Top = 101
      Width = 91
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
      ExplicitTop = 341
    end
    object NoBitBtn: TBitBtn
      Left = 1
      Top = 151
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
      ExplicitTop = 391
    end
    object RegistrarseBitBtn: TBitBtn
      Left = 1
      Top = 1
      Width = 91
      Height = 50
      Align = alTop
      Caption = 'Registrarse'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
  end
end
