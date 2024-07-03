program Query_Char;

uses
  Vcl.Forms,
  Query_Generator in 'Query_Generator.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
