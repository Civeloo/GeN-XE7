program MercadoLibreEnvios;

uses
  Vcl.Forms,
  uMercadoLibreEnvios in 'uMercadoLibreEnvios.pas' {fMercadoLibreEnvios},
  RestDM in '..\..\DataModule\RestDM.pas' {DMR: TDataModule},
  udmMercadoLibre in '..\..\DataModule\udmMercadoLibre.pas' {dmML: TDataModule},
  OperacionDM in '..\..\DataModule\OperacionDM.pas' {OperacionDataModule: TDataModule},
  DataModule in '..\..\DataModule\DataModule.pas' {DM: TDataModule},
  ImprimirDM in '..\..\DataModule\ImprimirDM.pas' {ImprimirDataModule: TDataModule},
  AfipDM in '..\..\DataModule\AfipDM.pas' {AfipDataModule: TDataModule},
  service in '..\..\DataModule\service.pas',
  LoginCms1 in '..\..\DataModule\LoginCms1.pas',
  uOrders in 'uOrders.pas' {fOrders},
  uOrder_items in 'uOrder_items.pas' {fOrder_items},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Civeloo Mercado Libre Envios';
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.CreateForm(TfMercadoLibreEnvios, fMercadoLibreEnvios);
  Application.Run;
end.
