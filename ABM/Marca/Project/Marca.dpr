program Marca;

uses
  Forms,
  DataModule in '..\..\..\DataModule\DataModule.pas' {DM: TDataModule},
  MarcaF in '..\Form\MarcaF.pas' {MarcaForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Categor�a';
  Application.CreateForm(TMarcaForm, MarcaForm);
  Application.Run;
end.
