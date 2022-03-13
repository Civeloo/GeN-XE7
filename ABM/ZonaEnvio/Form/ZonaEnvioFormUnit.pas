unit ZonaEnvioFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, DataModule,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TZonaEnvioForm = class(TForm)
    DerechoPanel: TPanel;
    ZonaCodigoLabel: TLabel;
    GrabarBitBtn: TBitBtn;
    NoBitBtn: TBitBtn;
    ZonaCodigoDBEdit: TDBEdit;
    PageControl1: TPageControl;
    ZonaTabSheet: TTabSheet;
    ZonaDescripcionLabel: TLabel;
    ZonaDBGrid: TDBGrid;
    ZonaDBNavigator: TDBNavigator;
    ZonaDescripcionDBEdit: TDBEdit;
    TabSheet2: TTabSheet;
    ZonaOrdenLabel: TLabel;
    TabSheet3: TTabSheet;
    RegionDBGrid: TDBGrid;
    MetodoDBNavigator: TDBNavigator;
    RegionDBNavigator: TDBNavigator;
    MetodoDBGrid: TDBGrid;
    MetodoCostoLabel: TLabel;
    MetodoDescripcionDBEdit: TDBEdit;
    MetodoImpuestoLabel: TLabel;
    MetodoDescripcionLabel: TLabel;
    MetodoCostoDBEdit: TDBEdit;
    MetodoOrdenLabel: TLabel;
    RegionTipoDBComboBox: TDBComboBox;
    RegionTipoLabel: TLabel;
    RegionDescripcionLabel: TLabel;
    RegionDescripcionDBEdit: TDBEdit;
    ZonaEnvioDataSource: TDataSource;
    ZonaEnvioFDTable: TFDTable;
    ZERegionDataSource: TDataSource;
    ZERegionFDTable: TFDTable;
    ZEMetodoDataSource: TDataSource;
    ZEMetodoFDTable: TFDTable;
    RegionCodigoDBEdit: TDBEdit;
    MetodoCodigoDBEdit: TDBEdit;
    RegionZonaEnvioDBEdit: TDBEdit;
    MetodoZonaEnvioDBEdit: TDBEdit;
    MetodoOrdenDBEdit: TDBEdit;
    RegionContinenteDBEdit: TDBEdit;
    RegionContinenteLabel: TLabel;
    RegionPaisDBEdit: TDBEdit;
    RegionPaisLabel: TLabel;
    RegionProvinciaDBEdit: TDBEdit;
    RegionProvinciaLabel: TLabel;
    RegionCiudadLabel: TLabel;
    RegionCiudadDBEdit: TDBEdit;
    ZonaOrdenDBEdit: TDBEdit;
    MetodoLabel: TLabel;
    MetodoDBComboBox: TDBComboBox;
    MetodoImpuestoDBComboBox: TDBComboBox;
    procedure FormShow(Sender: TObject);
    procedure ZonaDBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure NoBitBtnClick(Sender: TObject);
    procedure RegionDBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure GrabarBitBtnClick(Sender: TObject);
  private
    procedure Cargar;
    procedure Nuevo;
    procedure RegionNuevo;
    procedure MetodoNuevo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZonaEnvioForm: TZonaEnvioForm;

implementation

{$R *.dfm}

procedure TZonaEnvioForm.Cargar;
begin
  with ZonaEnvioFDTable do
    if not Active then Active:= True;
  with ZERegionFDTable do
    if not Active then Active:= True;
  with ZEMetodoFDTable do
    if not Active then Active:= True;
  PageControl1.TabIndex:=0;
end;

procedure TZonaEnvioForm.FormShow(Sender: TObject);
begin
  Cargar;
end;

procedure TZonaEnvioForm.GrabarBitBtnClick(Sender: TObject);
var cod : string;
begin
  cod := ZonaCodigoDBEdit.Text;
  with ZEMetodoFDTable do
    if (State = dsEdit) or (State = dsInsert) then Post;
  with ZERegionFDTable do
    if (State = dsEdit) or (State = dsInsert) then Post;
  with ZonaEnvioFDTable do
    if (State = dsEdit) or (State = dsInsert) then Post;
  if (wpSync) then dm.WooCommerceGeN('ZonaEnvio', cod);
  if Dialogs.MessageDlg('Grabado con éxito.  Salir?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
      Close
    else
      Cargar;
end;

procedure TZonaEnvioForm.NoBitBtnClick(Sender: TObject);
begin
  ZonaEnvioFDTable.Cancel;
  ZERegionFDTable.Cancel;
  ZEMetodoFDTable.Cancel;
  Close;
end;

Procedure TZonaEnvioForm.Nuevo;
begin
  ZonaCodigoDBEdit.Text := IntToStr(DM.SiguienteCodigo('ZonaEnvio'));
  if (ZonaCodigoDBEdit.Text='1') then ZonaDescripcionDBEdit.Text:='Argentina';
  ZonaOrdenDBEdit.Text := ZonaCodigoDBEdit.Text;
  ZERegionFDTable.Insert;
  RegionNuevo;
  ZEMetodoFDTable.Insert;
  MetodoNuevo;
end;

procedure TZonaEnvioForm.RegionNuevo;
begin
  RegionZonaEnvioDBEdit.Text := ZonaCodigoDBEdit.Text;
  RegionCodigoDBEdit.Text := IntToStr(DM.SiguienteCodigo('ZERegion'));
  RegionContinenteDBEdit.Text := 'Argentina';
  RegionPaisDBEdit.Text := 'Argentina';
  RegionProvinciaDBEdit.Text := 'Ciudad Autónoma de Buenos Aires';
end;

procedure TZonaEnvioForm.MetodoNuevo;
begin
  MetodoZonaEnvioDBEdit.Text := ZonaCodigoDBEdit.Text;
  MetodoCodigoDBEdit.Text := IntToStr(DM.SiguienteCodigo('ZEMetodo'));
  MetodoDBComboBox.Field.Text := 'precio fijo';
  MetodoDescripcionDBEdit.Text := 'Precio Fijo';
  MetodoImpuestoDBComboBox.Field.Text := 'imponible';
  MetodoOrdenDBEdit.Text := MetodoCodigoDBEdit.Text;
  MetodoCostoDBEdit.Text := '0';
end;

procedure TZonaEnvioForm.RegionDBNavigatorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbInsert : RegionNuevo;
  end;
end;

procedure TZonaEnvioForm.ZonaDBNavigatorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
//    nbFirst : Obtener;
//    nbPrior : Obtener;
//    nbNext : Obtener;
//    nbLast : Obtener;
    nbInsert : Nuevo;
//    nbDelete : nuevo;
//    nbEdit : Edit;
//    nbPost : Grabar;
//    nbCancel : Cancel;
//    nbRefresh: Obtener;
  end;
  //ZonaDescripcionDBEdit.SetFocus;
end;

end.
