unit CrashForm;

interface

uses
  Windows, Classes, Forms, ExtCtrls, StdCtrls, Messages, Graphics, Controls, CrashMgr;

type
  TCrashReportForm = class(TForm)
    ProgIcon: TImage;
    HeaderLbl: TLabel;
    InfoLbl: TLabel;
    HelpBtn: TButton;
    StartBtn: TButton;
    CancelBtn: TButton;
    VistaBox: TShape;
    procedure FormCreate(Sender: TObject);
    procedure StartBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure HelpBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    Header, Details: String;
    Language: TLanguage;
    ResumeEvent, CancelEvent, HelpEvent: TNotifyEvent;
    ShowLoading: Boolean;
    procedure DefaultHelpEvent;
    procedure DrawAppTitle(var Message: TMessage); message WM_PAINT;
  end;

var
  CrashReportForm: TCrashReportForm;

implementation

uses NoHelpForm, LoadForm;

{$R *.dfm}

procedure TCrashReportForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;
 ProgIcon.Picture.Icon.Assign(Application.Icon);
end;

procedure TCrashReportForm.StartBtnClick(Sender: TObject);
Var
 Frm: TLoadingForm;
begin
 if ShowLoading then
  begin
   Frm := TLoadingForm.Create(nil);
   try
    Frm.Language := Language;
    Frm.ShowModal;
   finally
    Frm.Release;
   end;
  end;

 if Assigned(ResumeEvent) then ResumeEvent(nil);

 Close;
end;

procedure TCrashReportForm.CancelBtnClick(Sender: TObject);
begin
 if Assigned(CancelEvent) then CancelEvent(nil);
 { On va fermer l'application maintenant, hein ... }
 Application.Terminate;
end;

procedure TCrashReportForm.HelpBtnClick(Sender: TObject);
begin
 if Assigned(HelpEvent) then HelpEvent(nil) else DefaultHelpEvent;
end;

procedure TCrashReportForm.DefaultHelpEvent;
Var
 Frm: THelpForm;
begin
 { On explique gentiment qu'aucune aide n''a été fournie ... }
 Frm := THelpForm.Create(nil);
 try
  Frm.Language := Language;
  Frm.ShowModal;
 finally
  Frm.Release;
 end;
end;

procedure TCrashReportForm.DrawAppTitle(var Message: TMessage);
Var
 R: TRect;
begin
 inherited;

 R := Rect(44, 4, 425, 36);
 Canvas.Font.Size := 12;
 Canvas.Brush.Style := bsClear;
 DrawText(Canvas.Handle, PChar(Application.Title), -1, R, DT_VCENTER or DT_SINGLELINE or DT_END_ELLIPSIS);
end;

procedure TCrashReportForm.FormShow(Sender: TObject);
begin
 if Header = '[Default]' then HeaderLbl.Caption := DEFAULT_HEADER[Language] else HeaderLbl.Caption := Header;
 if Details = '[Default]' then Infolbl.Caption := DEFAULT_DETAILS[Language] else Infolbl.Caption := Details;
 case Language of
  laFrench:
   begin
    Caption := 'Votre application s''est terminée de façon imprévue';
    CancelBtn.Caption := 'Annuler';
    CancelBtn.Hint := 'Fermer et ne pas démarrer l''application';
    HelpBtn.Caption := 'Obtenir de l''aide';
    HelpBtn.Hint := 'Obtenir de l''aide sur ce problème';
    StartBtn.Caption := 'Démarrer l''application';
    StartBtn.Hint := 'Continuer à utiliser l''application';
   end;
  laEnglish:
   begin
    Caption := 'Your program closed unexpectedly';
    CancelBtn.Caption := 'Cancel';
    CancelBtn.Hint := 'Close this window and do not resume program';
    HelpBtn.Caption := 'Obtain help';
    HelpBtn.Hint := 'Obtain help on this issue';
    StartBtn.Caption := 'Resume the program';
    StartBtn.Hint := 'Resume use of the program';
   end;
 end;
end;

end.
