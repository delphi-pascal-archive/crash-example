program CrashExample;

uses
  Forms,
  Main in 'Main.pas' {MainForm};

{$R *.res}
{$R WindowsXP.res}

begin
  Application.Initialize;
  Application.Title := 'Exemple Crash Manager';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
