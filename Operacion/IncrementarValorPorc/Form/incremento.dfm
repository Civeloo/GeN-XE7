object IncrementoForm: TIncrementoForm
  Left = 424
  Top = 174
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Incrementar Importe'
  ClientHeight = 221
  ClientWidth = 406
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 180
    Top = 81
    Width = 22
    Height = 29
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 57
    Top = 78
    Width = 121
    Height = 37
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 248
    Top = 0
    Width = 158
    Height = 221
    Align = alRight
    TabOrder = 1
    object SiBitBtn: TBitBtn
      Left = 41
      Top = 43
      Width = 75
      Height = 50
      Caption = 'Si'
      Kind = bkYes
      NumGlyphs = 2
      TabOrder = 0
      OnClick = SiBitBtnClick
    end
    object NoBitBtn: TBitBtn
      Left = 41
      Top = 130
      Width = 75
      Height = 50
      Caption = 'No'
      Kind = bkNo
      NumGlyphs = 2
      TabOrder = 1
      OnClick = NoBitBtnClick
    end
  end
end
