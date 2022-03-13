object fRetPerc: TfRetPerc
  Left = 0
  Top = 0
  Caption = 'Retenciones y Percepciones'
  ClientHeight = 336
  ClientWidth = 244
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object eNoGra: TLabeledEdit
    Left = 48
    Top = 23
    Width = 145
    Height = 21
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = 'No Gravado'
    TabOrder = 0
    Text = '0'
  end
  object ePagCueIva: TLabeledEdit
    Left = 48
    Top = 63
    Width = 145
    Height = 21
    EditLabel.Width = 106
    EditLabel.Height = 13
    EditLabel.Caption = 'Pago a cuenta del IVA'
    TabOrder = 1
    Text = '0'
  end
  object ePagCueOtr: TLabeledEdit
    Left = 48
    Top = 103
    Width = 145
    Height = 21
    EditLabel.Width = 144
    EditLabel.Height = 13
    EditLabel.Caption = 'Pago a cta de otros Imp. Nac.'
    TabOrder = 2
    Text = '0'
  end
  object ePerIIBB: TLabeledEdit
    Left = 48
    Top = 143
    Width = 145
    Height = 21
    EditLabel.Width = 94
    EditLabel.Height = 13
    EditLabel.Caption = 'Percep. Ing. Brutos'
    TabOrder = 3
    Text = '0'
  end
  object ePerImpMun: TLabeledEdit
    Left = 48
    Top = 186
    Width = 145
    Height = 21
    EditLabel.Width = 108
    EditLabel.Height = 13
    EditLabel.Caption = 'Percep. Imp. Municipal'
    TabOrder = 4
    Text = '0'
  end
  object eImpInt: TLabeledEdit
    Left = 48
    Top = 231
    Width = 145
    Height = 21
    EditLabel.Width = 77
    EditLabel.Height = 13
    EditLabel.Caption = 'Imptos Internos'
    TabOrder = 5
    Text = '0'
  end
  object eOtrTrib: TLabeledEdit
    Left = 48
    Top = 276
    Width = 145
    Height = 21
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'Otros Tributos'
    TabOrder = 6
    Text = '0'
  end
  object bGrabar: TButton
    Left = 118
    Top = 303
    Width = 75
    Height = 25
    Caption = 'Grabar'
    TabOrder = 7
    OnClick = bGrabarClick
  end
end
