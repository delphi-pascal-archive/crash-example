unit CrashMgr;

interface

uses
  Windows, SysUtils, Classes, Forms, Dialogs;

type
  TLanguage = (laFrench, laEnglish);

  TCrashMgr = class(TComponent)
  private
    { Déclarations privées }
    FChecked: Boolean;
    FOnCrashResume: TNotifyEvent;
    FOnCrashCancel: TNotifyEvent;
    FOnCrashHelp: TNotifyEvent;
    FHeader: String;
    FDetails: String;
    FLanguage: TLanguage;
    FShowLoading: Boolean;
    function GetCrashFlag: Boolean;
    procedure SetCrashFlag(Value: Boolean);
    procedure RunCrashReport;
  protected
    { Déclarations protégées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Déclarations publiées }
    property OnCrashResume: TNotifyEvent read FOnCrashResume write FOnCrashResume;
    property OnCrashCancel: TNotifyEvent read FOnCrashCancel write FOnCrashCancel;
    property OnCrashHelp: TNotifyEvent   read FOnCrashHelp   write FOnCrashHelp;
    property Header: String              read FHeader        write FHeader;
    property Details: String             read FDetails       write FDetails;
    property Language: TLanguage         read FLanguage      write FLanguage;
    property ShowLoading: Boolean        read FShowLoading   write FShowLoading;
    procedure Execute;
  end;

const
  DEFAULT_HEADER: array [TLanguage] of String = ('Votre application s''est fermée inopinément à sa dernière exécution.',
                                                 'This program closed unexpectedly at its last execution.');

  DEFAULT_DETAILS: array [TLanguage] of String = (
  'Plusieurs causes peuvent être à l''origine de cette erreur :' + chr(13)
  + chr(13)
  + '  - l''application a rencontré un problème l''empêchant de continuer' + chr(13)
  + '  - le système a rencontré une erreur et s''est arrêté' + chr(13)
  + '  - votre matériel a connu une défaillance conduisant à l''arrêt de l''ordinateur' + chr(13)
  + chr(13)
  + 'Que voulez-vous faire ?',
  'Various events may have caused this issue :' + chr(13)
  + chr(13)
  + '  - the program encountered an error preventing further execution' + chr(13)
  + '  - the system encountered an error and stopped' + chr(13)
  + '  - your hardware met an issue that led to computer failure' + chr(13)
  + chr(13)
  + 'What should the program do ?');

procedure Register;

implementation

uses CrashForm;

procedure Register;
begin
  RegisterComponents('Système', [TCrashMgr]);
end;

constructor TCrashMgr.Create(AOwner: TComponent);
begin
 inherited Create(AOwner);
 FHeader := '[Default]';
 FDetails := '[Default]';
 FLanguage := laFrench;
 FShowLoading := True;
end;

destructor TCrashMgr.Destroy;
begin
 SetCrashFlag(False);
 inherited Destroy;
end;

function TCrashMgr.GetCrashFlag: Boolean;
begin
 Result := FileExists(Format('%s%s', [ParamStr(0), '.dat']));
end;

procedure TCrashMgr.SetCrashFlag(Value: Boolean);
begin
 case Value of
  False: DeleteFile(Format('%s%s', [ParamStr(0), '.dat']));
  True: CloseHandle(FileCreate(Format('%s%s', [ParamStr(0), '.dat'])));
 end;
end;

procedure TCrashMgr.RunCrashReport;
Var
 Frm: TCrashReportForm;
begin
 if not (csDesigning in ComponentState) then
  begin
   Frm := TCrashReportForm.Create(nil);
   try
    Frm.ResumeEvent := FOnCrashResume;
    Frm.CancelEvent := FOnCrashCancel;
    Frm.HelpEvent := FOnCrashHelp;
    Frm.Header := FHeader;
    Frm.Details := FDetails;
    Frm.Language := FLanguage;
    Frm.ShowLoading := ShowLoading;
    Frm.ShowModal;
   finally
    Frm.Release;
   end;
  end;
end;

procedure TCrashMgr.Execute;
begin
 if not FChecked then
  begin
   FChecked := True;
   if GetCrashFlag then RunCrashReport else SetCrashFlag(True);
  end;
end;

end.
