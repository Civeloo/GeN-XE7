program Migrar;

uses
  Forms,
  MigrarF in '..\form\MigrarF.pas' {MigrarForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'MIGRAR';
  Application.CreateForm(TMigrarForm, MigrarForm);
  Application.Run;
end.
