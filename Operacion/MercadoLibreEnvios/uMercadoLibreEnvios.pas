unit uMercadoLibreEnvios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfMercadoLibreEnvios = class(TForm)
    ProgressBar1: TProgressBar;
    tProgressBar: TTimer;
    Timer1: TTimer;
    pPreparar: TPanel;
    pPrepararMensajes: TPanel;
    lTituloPrepararMensajes: TLabel;
    lVentasPrepararMensajes: TLabel;
    pPrepararEnvios: TPanel;
    lTituloPrepararEnvios: TLabel;
    lVentasPrepararEnvios: TLabel;
    pPrepararFlex: TPanel;
    lTituloPrepararFlex: TLabel;
    lVentasPrepararFlex: TLabel;
    pPrepararAcordar: TPanel;
    lTituloPrepararAcordar: TLabel;
    lVentasPrepararAcordar: TLabel;
    pTituloPreparar: TPanel;
    lPreparar: TLabel;
    lVentasPreparar: TLabel;
    pDespachar: TPanel;
    pDespacharDemoradas: TPanel;
    lTituloDespacharDemoradas: TLabel;
    lVentasDespacharDemoradas: TLabel;
    pDespacharMensajes: TPanel;
    lTituloDespacharMensajes: TLabel;
    lVentasDespacharMensajes: TLabel;
    pDespacharFlex: TPanel;
    lTituloDespacharFlex: TLabel;
    lVentasDespacharFlex: TLabel;
    pDespacharColecta: TPanel;
    lTituloDespacharColecta: TLabel;
    lVentasDespacharColecta: TLabel;
    pTituloDespachar: TPanel;
    lDespachar: TLabel;
    lVentasDespachar: TLabel;
    Panel1: TPanel;
    pTransitoCamino: TPanel;
    lTituloTransitoCamino: TLabel;
    lVentasTransitoCamino: TLabel;
    pTransitoMensajes: TPanel;
    lTituloTransitoMensajes: TLabel;
    lVentasTransitoMensajes: TLabel;
    pTransitoEsperandoRetiro: TPanel;
    lTituloTransitoEsperandoRetiro: TLabel;
    lVentasTransitoEsperandoRetiro: TLabel;
    Panel6: TPanel;
    lTransito: TLabel;
    lVentasTransito: TLabel;
    pDespacharAcordar: TPanel;
    lTituloDespacharAcordar: TLabel;
    lVentasDespacharAcordar: TLabel;
    pPrepararDemoradas: TPanel;
    lTituloPrepararDemoradas: TLabel;
    lVentasPrepararDemoradas: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tProgressBarTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pPrepararEnviosClick(Sender: TObject);
    procedure pPrepararFlexClick(Sender: TObject);
    procedure pPrepararAcordarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure pDespacharColectaClick(Sender: TObject);
    procedure pDespacharFlexClick(Sender: TObject);
    procedure pPrepararMensajesClick(Sender: TObject);
    procedure pDespacharMensajesClick(Sender: TObject);
    procedure pTransitoMensajesClick(Sender: TObject);
    procedure pDespacharDemoradasClick(Sender: TObject);
    procedure pTransitoEsperandoRetiroClick(Sender: TObject);
    procedure pTransitoCaminoClick(Sender: TObject);
    procedure Preparar;
  private
    { Private declarations }
    procedure actualizarEtiquetas;
    procedure AbrirfOrders(sql,sql1:string;imprimir:BOOL);
    procedure AbrirfOrder_items(sql:string);
  public
    { Public declarations }
  end;

var
  fMercadoLibreEnvios: TfMercadoLibreEnvios;

implementation

{$R *.dfm}

uses RestDM, udmMercadoLibre, uOrders, uOrder_items;

procedure TfMercadoLibreEnvios.FormCreate(Sender: TObject);
begin
  dmML := TdmML.Create(Self);
  DMR := TDMR.Create(Self);
  dmml.dbmain.ExecSQL('DELETE FROM orders');
  dmml.dbmain.ExecSQL('DELETE FROM shipments');
end;

procedure TfMercadoLibreEnvios.FormShow(Sender: TObject);
begin
//  actualizarEtiquetas;
  Timer1.Enabled:=True;
end;

procedure TfMercadoLibreEnvios.pPrepararAcordarClick(Sender: TObject);
begin
  AbrirfOrders(sqlPrepararAcordar,'',False);
end;

procedure TfMercadoLibreEnvios.pDespacharFlexClick(Sender: TObject);
begin
  AbrirfOrders(sqlDespacharFlex,'',True);
end;

procedure TfMercadoLibreEnvios.pDespacharMensajesClick(Sender: TObject);
begin
  AbrirfOrder_items(sqlDespacharMensajes);
end;

procedure TfMercadoLibreEnvios.pPrepararEnviosClick(Sender: TObject);
begin
  AbrirfOrders(sqlPrepararEnvios,sqlPrepararEnviosItems,True);
end;

procedure TfMercadoLibreEnvios.pDespacharColectaClick(Sender: TObject);
begin
    AbrirfOrders(sqlDespacharEnvios,'',True);
end;

procedure TfMercadoLibreEnvios.pDespacharDemoradasClick(Sender: TObject);
begin
  AbrirfOrders(sqlDespacharDemoradas,'',True);
end;

procedure TfMercadoLibreEnvios.pPrepararFlexClick(Sender: TObject);
begin
  AbrirfOrders(sqlPrepararFlex,'',True);
end;

procedure TfMercadoLibreEnvios.pPrepararMensajesClick(Sender: TObject);
begin
  AbrirfOrder_items(sqlPrepararMensajes);
end;

procedure TfMercadoLibreEnvios.pTransitoCaminoClick(Sender: TObject);
begin
  AbrirfOrders(sqlTransitoCamino,'',False);
end;

procedure TfMercadoLibreEnvios.pTransitoEsperandoRetiroClick(Sender: TObject);
begin
  AbrirfOrders(sqlTransitoEsperandoRetiro,'',False);
end;

procedure TfMercadoLibreEnvios.pTransitoMensajesClick(Sender: TObject);
begin
  AbrirfOrder_items(sqlTransitoMensajes);
end;

procedure TfMercadoLibreEnvios.Timer1Timer(Sender: TObject);
begin
  Preparar;
end;

procedure TfMercadoLibreEnvios.tProgressBarTimer(Sender: TObject);
begin
  ProgressBar1.StepIt;
  lVentasPreparar.Caption:='procesando '+IntToStr(dmr.pag)+' de '+IntToStr(dmr.tpag)+'...';
end;

procedure TfMercadoLibreEnvios.actualizarEtiquetas;
begin
  with dmML do
  begin
    lVentasPreparar.Caption := CantidadVentas(sqlPreparar);
//    lVentasPreparar.Visible:=(lVentasPreparar.Caption<>'0 ventas');
    lVentasPrepararEnvios.Caption:=CantidadVentas(sqlPrepararEnvios);
    pPrepararEnvios.Visible:=(lVentasPrepararEnvios.Caption<>'0 ventas');
    lVentasPrepararFlex.Caption := CantidadVentas(sqlPrepararFlex);
    pPrepararFlex.Visible:=(lVentasPrepararFlex.Caption<>'0 ventas');
    lVentasPrepararAcordar.Caption := CantidadVentas(sqlPrepararAcordar);
    pPrepararAcordar.Visible:=(lVentasPrepararAcordar.Caption<>'0 ventas');
    lVentasPrepararMensajes.Caption := CantidadVentas(sqlPrepararMensajes);
    pPrepararMensajes.Visible:=(lVentasPrepararMensajes.Caption<>'0 ventas');
    lVentasPrepararDemoradas.Caption := CantidadVentas(sqlPrepararDemoradas);
    pPrepararDemoradas.Visible:=(lVentasPrepararDemoradas.Caption<>'0 ventas');
    lVentasDespachar.Caption := CantidadVentas(sqlDespachar);
    pDespachar.Visible:=(lVentasDespachar.Caption<>'0 ventas');
    lVentasDespacharDemoradas.Caption := CantidadVentas(sqlDespacharDemoradas);
    pDespacharDemoradas.Visible:=(lVentasDespacharDemoradas.Caption<>'0 ventas');
    lVentasDespacharColecta.Caption := CantidadVentas(sqlDespacharEnvios);
    pDespacharColecta.Visible:=(lVentasDespacharColecta.Caption<>'0 ventas');
    lVentasDespacharFlex.Caption := CantidadVentas(sqlDespacharFlex);
    pDespacharFlex.Visible:=(lVentasDespacharFlex.Caption<>'0 ventas');
    lVentasDespacharMensajes.Caption := CantidadVentas(sqlDespacharMensajes);
    pDespacharMensajes.Visible:=(lVentasDespacharMensajes.Caption<>'0 ventas');
    lVentasDespacharAcordar.Caption := CantidadVentas(sqlDespacharAcordar);
    pDespacharAcordar.Visible:=(lVentasDespacharAcordar.Caption<>'0 ventas');
//    lVentasTransito.Caption := CantidadVentas(sqlTransito);
//    pTransito.Visible:=(lVentasTransito.Caption<>'0 ventas');
//    lVentasTransitoCamino.Caption := CantidadVentas(sqlTransitoCamino);
//    pTransitoCamino.Visible:=(lVentasTransitoCamino.Caption<>'0 ventas');
//    lVentasTransitoEsperandoRetiro.Caption := CantidadVentas(sqlTransitoEsperandoRetiro);
//    pTransitoEsperandoRetiro.Visible:=(lVentasTransitoEsperandoRetiro.Caption<>'0 ventas');
//    lVentasTransitoMensajes.Caption := CantidadVentas(sqlTransitoMensajes);
//    pTransitoMensajes.Visible:=(lVentasTransitoMensajes.Caption<>'0 ventas');
  end;
end;

procedure TfMercadoLibreEnvios.AbrirfOrders;
begin
  fOrders := TfOrders.Create(Self);
  with dmML do
    with fOrders do
    begin
      verImprimir:=imprimir;
      vsqlOrder_items:=sql1;
      if vsqlOrder_items='' then vsqlOrder_items:=sql;
      qOrders.Open(sql + groupBuyer);
      try
        ShowModal;
      finally
        Free;
        actualizarEtiquetas;
      end;
    end;
end;

procedure TfMercadoLibreEnvios.AbrirfOrder_items;
begin
  fOrder_items := TfOrder_items.Create(Self);
  with dmML do
    with fOrder_items do
    begin
      bImprimir.Visible:=False;
      qOrder_items.Open(sql);
      tMessages.Open(sql + groupText_plain);
      try
        ShowModal;
      finally
        Free;
      end;
    end;
end;

procedure TfMercadoLibreEnvios.Preparar;
begin
  Timer1.Interval:=((1000*60)*60);
  with dmr do
    with dmML do
      begin
        ProgressBar1.Visible:=True;
        tProgressBar.Enabled:=True;
        FDQuery1.Close;
        Application.ProcessMessages;
//        ObtenerOrderRecent;
        ObtenerOrder;
        while (teI<tfeI)and(tmI<tfmI) do begin
          Application.ProcessMessages;
        end;
        tProgressBar.Enabled:=False;
        ProgressBar1.StepBy(100);
        sleep(100);
        ProgressBar1.Visible:=False;
      end;
  actualizarEtiquetas;
end;

end.
