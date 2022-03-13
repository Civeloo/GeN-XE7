program Vender;

uses
  Forms,
  VenderF in '..\Form\VenderF.pas' {VenderForm},
  DataModule in '..\..\..\DataModule\DataModule.pas' {DM: TDataModule},
  UFBuscaCliente in '..\..\..\Buscar\Cliente\Form\UFBuscaCliente.pas' {FBuscaCliente},
  BuscarCheques in '..\..\..\Buscar\Cheque\Form\BuscarCheques.pas' {BuscarChequesForm},
  AgregarCantidad in '..\..\..\SubOperacion\AgregarCantidad\Form\AgregarCantidad.pas' {AgregarCantidadForm},
  UFBuscaArticulos in '..\..\..\Buscar\Articulo\Form\UFBuscaArticulos.pas' {FBuscaArticulo},
  BuscarVendedor in '..\..\..\Buscar\Vendedor\Form\BuscarVendedor.pas' {BuscarVendedorForm},
  ImprimirDM in '..\..\..\DataModule\ImprimirDM.pas' {ImprimirDataModule: TDataModule},
  OperacionDM in '..\..\..\DataModule\OperacionDM.pas' {OperacionDataModule: TDataModule},
  servicio in '..\..\..\SubOperacion\ManoObra\Form\servicio.pas' {ServForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Vender';
  Application.CreateForm(TVenderForm, VenderForm);
  Application.CreateForm(TOperacionDataModule, OperacionDataModule);
  Application.CreateForm(TServForm, ServForm);
  Application.Run;
end.
