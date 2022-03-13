unit uOrder_items;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TfOrder_items = class(TForm)
    StringGridBindSourceDB1: TStringGrid;
    qOrder_items: TFDQuery;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Panel1: TPanel;
    Memo1: TMemo;
    bImprimir: TButton;
    sgMessage: TStringGrid;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    LinkPropertyToFieldtext_plain: TLinkPropertyToField;
    procedure StringGridBindSourceDB1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure ActualizarEtiquetaComprador;
  public
    { Public declarations }
  end;

var
  fOrder_items: TfOrder_items;

implementation

{$R *.dfm}

uses udmMercadoLibre, RestDM;

procedure TfOrder_items.bImprimirClick(Sender: TObject);
begin
  DMR.ImprimirEtiqueta(qOrder_items.FieldByName('shipping').AsString);
  qOrder_items.First;
  while not qOrder_items.Eof do
  begin
    dmML.AgregarDespachados(qOrder_items.FieldByName('order_id').AsString,'S');
    qOrder_items.Next;
  end;
  Close;
end;

procedure TfOrder_items.FormShow(Sender: TObject);
begin
//  dmML.tMessages.Open(sqlMensajes+' WHERE buyer='+qOrder_items.FieldByName('buyer').AsString);
  ActualizarEtiquetaComprador;
end;

procedure TfOrder_items.StringGridBindSourceDB1Click(Sender: TObject);
begin
  if qOrder_items.RowsAffected>0 then
  begin
    dmML.tMessages.Open(sqlMensajes+' AND order_items.order_id='+qOrder_items.FieldByName('order_id').AsString + groupText_plain);
    ActualizarEtiquetaComprador;
  end
  else
    Close;
end;

procedure TfOrder_items.ActualizarEtiquetaComprador;
begin
    Panel1.Caption:=qOrder_items.FieldByName('first_name').AsString+' '+qOrder_items.FieldByName('last_name').AsString+' ['+qOrder_items.FieldByName('nickname').AsString+'] ';
end;

end.
