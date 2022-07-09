object FAvtor: TFAvtor
  Left = 0
  Top = 0
  Caption = 'FAvtor'
  ClientHeight = 286
  ClientWidth = 289
  Color = clBtnFace
  Font.Height = -13
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  RTL = False
  PixelsPerInch = 120
  TextHeight = 16
  object EditPasword: TUniEdit
    Left = 36
    Top = 150
    Width = 213
    ParentShowHint = False
    PasswordChar = '*'
    CharCase = ecNormal
    MaxLength = 0
    CharEOL = #0
    TabOrder = 0
    Color = clWindow
  end
  object UniLabel1: TUniLabel
    Left = 36
    Top = 127
    Width = 102
    Height = 17
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100':'
    ParentFont = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Times New Roman'
    TabOrder = 1
  end
  object EditLogin: TUniEdit
    Left = 36
    Top = 95
    Width = 213
    PasswordChar = #0
    CharCase = ecNormal
    MaxLength = 0
    CharEOL = #0
    TabOrder = 2
    Color = clWindow
  end
  object UniLabel2: TUniLabel
    Left = 36
    Top = 72
    Width = 94
    Height = 17
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1083#1086#1075#1080#1085':'
    ParentFont = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Times New Roman'
    TabOrder = 3
  end
  object BtOpen: TUniButton
    Left = 36
    Top = 207
    Width = 213
    Height = 27
    Caption = #1042#1086#1081#1090#1080
    ParentFont = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Times New Roman'
    TabOrder = 4
    OnClick = BtOpenClick
  end
  object UniButton1: TUniButton
    Left = 36
    Top = 240
    Width = 213
    Height = 27
    Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100#1089#1103
    ParentFont = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Times New Roman'
    TabOrder = 5
    OnClick = UniButton1Click
  end
  object UniLabel3: TUniLabel
    Left = 36
    Top = 16
    Width = 204
    Height = 22
    Caption = #1042#1093#1086#1076' '#1074' '#1083#1080#1095#1085#1099#1081' '#1082#1072#1073#1080#1085#1077#1090' '
    ParentFont = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Times New Roman'
    TabOrder = 6
  end
  object UniCheckBox1: TUniCheckBox
    Left = 36
    Top = 178
    Width = 133
    Height = 17
    Checked = False
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1088#1086#1083#1100
    ParentFont = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Times New Roman'
    TabOrder = 7
    OnClick = UniCheckBox1Click
  end
end
