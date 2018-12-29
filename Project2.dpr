program Project2;

uses
  Vcl.Forms,
  Unit2 in '..\2\Unit2.pas' {Form2},
  PASSWORD in 'C:\Program Files (x86)\Embarcadero\Studio\20.0\ObjRepos\en\DelphiWin32\PASSWORD.PAS' {PasswordDlg};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TPasswordDlg, PasswordDlg);
  Application.CreateForm(TPasswordDlg, PasswordDlg);
  Application.Run;
end.
