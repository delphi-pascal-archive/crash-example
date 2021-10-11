object CrashReportForm: TCrashReportForm
  Left = 355
  Top = 143
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Votre application s'#39'est termin'#233'e de fa'#231'on impr'#233'vue'
  ClientHeight = 210
  ClientWidth = 433
  Color = 15790320
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
  object VistaBox: TShape
    Left = -1
    Top = -1
    Width = 435
    Height = 172
    Pen.Color = 14540253
  end
  object ProgIcon: TImage
    Left = 4
    Top = 4
    Width = 32
    Height = 32
    Transparent = True
  end
  object HeaderLbl: TLabel
    Left = 8
    Top = 40
    Width = 372
    Height = 14
    Caption = 
      'Votre application s'#39'est ferm'#233'e inopin'#233'ment '#224' sa derni'#232're ex'#233'cuti' +
      'on.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object InfoLbl: TLabel
    Left = 8
    Top = 68
    Width = 416
    Height = 98
    Caption = 
      'Plusieurs causes peuvent '#234'tre '#224' l'#39'origine de cette erreur :'#13#10#13#10' ' +
      ' - l'#39'application a rencontr'#233' un probl'#232'me l'#39'emp'#234'chant de continue' +
      'r'#13#10'  - le syst'#232'me a rencontr'#233' une erreur et s'#39'est arr'#234't'#233#13#10'  - vo' +
      'tre mat'#233'riel a connu une d'#233'faillance conduisant '#224' l'#39'arr'#234't de l'#39'o' +
      'rdinateur'#13#10#13#10'Que voulez-vous faire ?'
    Transparent = True
  end
  object HelpBtn: TButton
    Left = 82
    Top = 177
    Width = 115
    Height = 25
    Hint = 'Obtenir de l'#39'aide sur ce probl'#232'me'
    Caption = 'Obtenir de l'#39'aide'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = HelpBtnClick
  end
  object StartBtn: TButton
    Left = 286
    Top = 177
    Width = 141
    Height = 25
    Hint = 'Continuer '#224' utiliser l'#39'application'
    Caption = 'D'#233'marrer l'#39'application'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = StartBtnClick
  end
  object CancelBtn: TButton
    Left = 6
    Top = 177
    Width = 71
    Height = 25
    Hint = 'Fermer et ne pas d'#233'marrer l'#39'application'
    Cancel = True
    Caption = 'Annuler'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = CancelBtnClick
  end
end
