object LoadingForm: TLoadingForm
  Left = 198
  Top = 122
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Chargement ...'
  ClientHeight = 53
  ClientWidth = 281
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object HeaderLbl: TLabel
    Left = 8
    Top = 8
    Width = 268
    Height = 14
    Caption = 'Votre application est en cours de chargement ...'
  end
  object Bar: TProgressBar
    Left = 8
    Top = 28
    Width = 266
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 0
  end
  object LoadTimer: TTimer
    Enabled = False
    Interval = 40
    OnTimer = LoadTimerTimer
    Left = 216
    Top = 24
  end
end
