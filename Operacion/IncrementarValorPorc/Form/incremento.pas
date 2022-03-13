unit incremento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DataModule, ExtCtrls,
  IBX.IBCustomDataSet, IBX.IBQuery;

type
  TIncrementoForm = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    SiBitBtn: TBitBtn;
    NoBitBtn: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure SiBitBtnClick(Sender: TObject);
    procedure NoBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    art: array of integer;
    { Public declarations }
  end;

var
  IncrementoForm: TIncrementoForm;

implementation

uses UFBuscaArticulos;

{$R *.dfm}

procedure TIncrementoForm.NoBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TIncrementoForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(Self);
end;

procedure TIncrementoForm.FormShow(Sender: TObject);
var
  i: integer;
begin
  FBuscaArticulo := TFBuscaArticulo.Create(Self);
  try
    FBuscaArticulo.ShowModal;
  finally
    if not (FBuscaArticulo.DescripcionEdit.Text = FBuscaArticulo.MarcaEdit.Text)
     =
    (FBuscaArticulo.CategoriaEdit.Text = FBuscaArticulo.RubroEdit.Text)
     =
    (FBuscaArticulo.ProveedorEdit.Text = FBuscaArticulo.CodigoEdit.Text)
    then
    begin
      SetLength(art, dm.qArticulo.RecordCount + 1);
      For i := 1 to dm.qArticulo.RecordCount do
      begin
        art[i] := (dm.qArticulo.FieldByName('CODIGO').AsInteger);
        dm.qArticulo.Next;
      end;
    end;
    FBuscaArticulo.Free;
  end;
end;

procedure TIncrementoForm.SiBitBtnClick(Sender: TObject);
var
  porc,sql,where,codigo: string;
  i: integer;
begin
  porc := FloatToStr((StrToFloat(Edit1.Text) / 100) + 1);
  sql:='UPDATE "Articulo" SET ULTPRECIO = PRECIO' +
        ', PRECIO1 = PRECIO1 * ' + porc + ', PRECIO2 = PRECIO2 * ' + porc +
        ', PRECIO3 = PRECIO3 * ' + porc + ', PRECIO4 = PRECIO4 * ' + porc +
        ', PRECIO5 = PRECIO5 * ' + porc + ', PRECIO6 = PRECIO6 * ' + porc +
        ', COSTO = COSTO * ' + porc +
        ', PRECIO = ROUND( ( ( (COSTO*'+porc+')*(("Articulo".IMPOTROS)*0.01+1) )*("Articulo".PORCENTAJE*0.01+1) )*("Articulo".TASA*';
  if High(art) > 0 then
  begin
    for i := 1 to High(art) + 1 do
    begin
      where:= '+1) , 2) WHERE CODIGO =' + IntToStr(art[i])+ ' AND TASA';
      dm.qQ.SQL.Text := sql
        + '0.01'
        + where + ' <> 105';
      dm.qQ.ExecSQL;
      dm.qQ.SQL.Text := sql
        +'0.001'
        + where +' = 105 ';
      dm.qQ.ExecSQL;
    end;
  end
    else
      begin
        where:= '+1) , 2) WHERE TASA';
        dm.qQ.SQL.Text := sql
          + '0.01'
          + where + ' <> 105';
        dm.qQ.ExecSQL;
        dm.qQ.SQL.Text := sql
          +'0.001'
          + where +' = 105 ';
        dm.qQ.ExecSQL;
      end;

  dm.qQ.Transaction.Commit;
  Close;
end;

end.
