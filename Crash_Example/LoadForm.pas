unit LoadForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, CrashMgr;

type
  TLoadingForm = class(TForm)
    HeaderLbl: TLabel;
    Bar: TProgressBar;
    LoadTimer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure LoadTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    Language: TLanguage;
  end;

var
  LoadingForm: TLoadingForm;
  Time: Longword;

implementation

{$R *.dfm}

const
 PBS_MARQUEE = $08;
 PBS_SETMARQUEE = WM_USER + $A;

procedure TLoadingForm.FormCreate(Sender: TObject);
begin
 randomize;
 Time := GetTickCount;
 DoubleBuffered := True;
 SetWindowLong(Bar.Handle, GWL_STYLE, GetWindowLong(Bar.Handle, GWL_STYLE) or PBS_MARQUEE);
 SendMessage(Bar.Handle, PBS_SETMARQUEE, 1, 40);
 Bar.DoubleBuffered := True;
 LoadTimer.Enabled := True;
end;

procedure TLoadingForm.LoadTimerTimer(Sender: TObject);
begin
 Bar.Invalidate;

 if GetTickCount - Time > Longword(random(433) + 777) then
  begin
   LoadTimer.Enabled := False;
   Close;
  end;
end;

procedure TLoadingForm.FormShow(Sender: TObject);
begin
 case Language of
  laFrench: begin Caption := 'Chargement ...'; HeaderLbl.Caption := 'Votre application est en cours de chargement ...'; end;
  laEnglish: begin Caption := 'Loading ...'; HeaderLbl.Caption := 'Your program is currently loading ...'; end;
 end;
end;

end.
