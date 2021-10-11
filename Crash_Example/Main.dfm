object MainForm: TMainForm
  Left = 219
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Exemple TCrashMgr'
  ClientHeight = 174
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 17
  object HeaderLbl: TLabel
    Left = 10
    Top = 10
    Width = 378
    Height = 38
    Alignment = taCenter
    AutoSize = False
    Caption = 
      'Demonstration du composant TCrashMgr. Selectionnez un choix puis' +
      ' redemarrez l'#39'application.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object NormalBtn: TButton
    Left = 10
    Top = 63
    Width = 378
    Height = 32
    Caption = 'Fermer l'#39'application normalement (rien de special)'
    TabOrder = 0
    OnClick = NormalBtnClick
  end
  object HardBtn: TButton
    Left = 10
    Top = 105
    Width = 378
    Height = 32
    Caption = 'Fermer l'#39'application violemment (surprise au relancement)'
    TabOrder = 1
    OnClick = HardBtnClick
  end
  object HelpBox: TCheckBox
    Left = 10
    Top = 146
    Width = 333
    Height = 23
    Caption = 'Autoriser le programme a fournir son aide ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = HelpBoxClick
  end
  object Crash: TCrashMgr
    OnCrashResume = CrashCrashResume
    OnCrashCancel = CrashCrashCancel
    Header = '[Default]'
    Details = '[Default]'
    Language = laEnglish
    ShowLoading = True
    Left = 8
    Top = 8
  end
end
