unit NoHelpForm;

interface

uses
  Classes, Forms, ExtCtrls, StdCtrls, Controls, Graphics, CrashMgr;

type
  THelpForm = class(TForm)
    WarningIcon: TImage;
    HeaderLbl: TLabel;
    InfoLbl: TLabel;
    CloseBtn: TButton;
    VistaBox: TShape;
    procedure FormCreate(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
    Language: TLanguage;
  end;

var
  HelpForm: THelpForm;

implementation

{$R *.dfm}

procedure THelpForm.FormCreate(Sender: TObject);
begin
 DoubleBuffered := True;
end;

procedure THelpForm.CloseBtnClick(Sender: TObject);
begin
 Close;
end;

procedure THelpForm.FormShow(Sender: TObject);
begin
 case Language of
  laFrench:
   begin
    Caption := 'Obtenir de l''aide';
    CloseBtn.Caption := 'Fermer';
    CloseBtn.Hint := 'Fermer cette bo�te de dialogue';
    HeaderLbl.Caption := 'Ce logiciel ne propose aucune aide sur ce probl�me.';
    InfoLbl.Caption := 'Vous pouvez tenter de contacter le service client�le de votre logiciel, ou de vous rendre sur son site internet, afin d''obtenir des renseignements suppl�mentaires sur votre probl�me.';
   end;
  laEnglish:
   begin
    Caption := 'Obtain help';
    CloseBtn.Caption := 'Close';
    CloseBtn.Hint := 'Close this dialog box';
    HeaderLbl.Caption := 'This program does not provide any help on this issue.';
    InfoLbl.Caption := 'You can visit the program''s website and contact the Customer Service Departement to get further information and obtain solutions on the issue you are currently dealing with.';
   end;
 end;
end;

end.
