unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CrashMgr;

type
  TMainForm = class(TForm)
    HeaderLbl: TLabel;
    NormalBtn: TButton;
    HardBtn: TButton;
    HelpBox: TCheckBox;
    Crash: TCrashMgr;
    procedure HardBtnClick(Sender: TObject);
    procedure NormalBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HelpBoxClick(Sender: TObject);
    procedure CrashCrashCancel(Sender: TObject);
    procedure CrashCrashResume(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
    procedure ApplicationHelp(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.HardBtnClick(Sender: TObject);
begin
 { On ferme violemment }
 ExitProcess(0);
end;

procedure TMainForm.NormalBtnClick(Sender: TObject);
begin
 { On ferme normalement }
 Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;
 HelpBox.Checked := FileExists(Format('%s%s', [ExtractFilePath(ParamStr(0)), 'Doeshelp.dat']));
 if HelpBox.Checked then Crash.OnCrashHelp := ApplicationHelp;
 Crash.Execute;
end;

procedure TMainForm.HelpBoxClick(Sender: TObject);
begin
 case HelpBox.Checked of
  False: DeleteFile(Format('%s%s', [ExtractFilePath(ParamStr(0)), 'Doeshelp.dat']));
  True: CloseHandle(FileCreate(Format('%s%s', [ExtractFilePath(ParamStr(0)), 'Doeshelp.dat'])));
 end;
end;

procedure TMainForm.CrashCrashCancel(Sender: TObject);
begin
 MessageDlg('Ne vous inqui�tez pas ! Vous pouvez relancer l''application sans danger ...', mtInformation, [mbOK], 0);
end;

procedure TMainForm.CrashCrashResume(Sender: TObject);
begin
 MessageDlg('L''application est relanc�e ... l''erreur est d�j� oubli�e.', mtInformation, [mbOK], 0);
end;

procedure TMainForm.ApplicationHelp(Sender: TObject);
begin
 MessageDlg('Ceci est l''aide du logiciel (!) :' + chr(13) + chr(13) + 'Ce probl�me est tout � fait volontaire, et est en r�alit� d�clench� pour mieux explorer toutes les facettes du TCrashMgr.' + chr(13) + 'Vous devriez fermer cette fen�tre, maintenant, vous avez d�j� tout lu.', mtInformation, [mbOK], 0);
end;

end.
