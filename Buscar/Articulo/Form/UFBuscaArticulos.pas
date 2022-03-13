unit UFBuscaArticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, ExtCtrls, DataModule,
  Mask, OleCtrls, SHDocVw, OleCtnrs, ExtDlgs,
  ImprimirDM,
  jpeg, GIFImg, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFBuscaArticulo = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    ProveedorEdit: TEdit;
    CodigoEdit: TEdit;
    DescripcionEdit: TEdit;
    RubroEdit: TEdit;
    CategoriaEdit: TEdit;
    MarcaEdit: TEdit;
    Label6: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    NetoDBText: TDBText;
    BitBtn1: TBitBtn;
    VerTodosBitBtn: TBitBtn;
    ivaLabel: TLabel;
    ivaDBText: TDBText;
    imprimir_exportarImage: TImage;
    EnStockCheckBox: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DescripcionEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MarcaEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RubroEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CodigoEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ProveedorEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CategoriaEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure VerTodosBitBtnClick(Sender: TObject);
    procedure imprimir_exportarImageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Stock: Boolean;
    cb: String;
    Precio, Proveedor, articulos: string;
    procedure buscar;
  end;

var
  FBuscaArticulo: TFBuscaArticulo;

implementation

{$R *.dfm}

procedure TFBuscaArticulo.FormCreate(Sender: TObject);
begin
  with dm do
  begin
    //if ConfigQuery.Active then ConfigQuery.Open;
    TraerConfig;
    if qArticulo.Active then qArticulo.Open;
  end;
end;

procedure TFBuscaArticulo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = VK_DOWN then
    DBGrid1.SetFocus;
end;

procedure TFBuscaArticulo.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFBuscaArticulo.DBGrid1DblClick(Sender: TObject);
begin
  BitBtn1Click(DBGrid1);
end;

procedure TFBuscaArticulo.FormShow(Sender: TObject);
begin
  if Stock then BitBtn1.Visible:=False;
  if (dm.ConfigQuery.FieldByName('IVA').AsString = 'Responsable Monotributo') then
  begin
    ivaLabel.Visible := False;
    ivaDBText.Visible := False;
  end;

  imprimir_exportarImage.Picture.LoadFromFile
    (Path + '\img\boton_imprimir_exportar.gif');
  if dm.qArticulo.Active then dm.qArticulo.Close;
  if (Proveedor <> '') then
    ProveedorEdit.Text := Proveedor;
  if (Precio <> 'Costo') and (Precio <> 'Precio1') and (Precio <> 'Precio2') and
    (Precio <> 'Precio3') and (Precio <> 'Precio4') and (Precio <> 'Precio5')
    and (Precio <> 'Precio6') and (Precio <> 'PrecioCtaCte') then
  begin
  if Precio = '0' then
      Precio := 'Precio'
    else
    if Precio = '' then
      Precio := 'Precio6'
    else
      Precio := 'Precio' + Precio;
    if Precio = 'Costo' then
      Precio := 'Costo';
  end;
  articulos := 'SELECT'
    //+ ' iif( "Articulo".Tasa = 105, "Articulo".Precio*1.105, "Articulo".Precio*1.21 ) as precioIVA,'
//    + '      iif( "Articulo".IVA < 100, "Articulo".Precio*("Articulo".IVA*0.01+1), "Articulo".Precio*("Articulo".IVA*0.001+1) ) as precioIVA,'
    + ' iif( "Articulo".IVA < 100, "Articulo".'+Precio+'*("Articulo".IVA*0.01+1), "Articulo".'+Precio+'*("Articulo".IVA*0.001+1) ) as precioIVA,'
    + ' "Articulo".'+Precio+' as precioNeto,'
    + ' "Articulo".DESCRIPCION,  "Articulo".CODIGO,'
    + ' "Articulo".COSTO,  "Articulo".ULTCOSTO,  "Articulo".PRECIO1,  "Articulo".PRECIO2,'
    + ' "Articulo".PRECIO3,  "Articulo".PRECIO4,  "Articulo".PRECIO5,  "Articulo".PRECIO6,'
    + ' "Articulo".PRECIO,  "Articulo".PORCENTAJE,  "Articulo".ULTPRECIO,  "Articulo".UBICACION,'
    + ' "Articulo".UNIDAD,  "Articulo".DISPONIBLE,  "Articulo".ENPRODUCCION,  "Articulo".NOTAS,'
    + ' "Articulo".IVA,  "Articulo".TASA,  "Articulo".IMPOTROS,  "Articulo".IIBB,'
    + ' "Articulo".STOCKMINIMO,  "Articulo".STOCKMAXIMO,  "Articulo".STOCKVENDIDO,  "Articulo".FECHACOMPULT,'
    + ' "Articulo".LISTA,  "Articulo".PROCEDENCIA,  "Articulo".CODIGOBARRA,  "Articulo".GARANTIA,'
    + ' "Articulo".FECHA,  "Articulo".PEDIDO,  "Articulo".STOCK,  "Articulo".EXISTENTE,'
    + ' "Articulo".ACTUAL,  "Articulo".MARCADOCONTADO,  "Articulo".MARCADOLISTA,  "Articulo".MARCADOFINAL,'
    + ' "Articulo".PREPARADO,  "Articulo".CTANOMBRE,  "Articulo".CTATIPO,  "Articulo".CTAANTICIPO,'
    + ' "Articulo".CTAIIBB,  "Articulo".ESTADO,  "Articulo".VENCE,  "Articulo".VENCIMIENTO,'
    + ' "Marca".DESCRIPCION AS MARCA,  "Color".DESCRIPCION AS COLOR,  "Categoria".DESCRIPCION AS CATEGORIA,'
    + ' "SubCategoria".DESCRIPCION AS SUBCATEGORIA,  "Rubro".DESCRIPCION AS RUBRO,  "Proveedor".NOMBRE AS PROVEEDOR'
    + ' FROM' + '  "Articulo"' +
    ' INNER JOIN "Marca" ON ("Articulo".MARCA = "Marca".CODIGO)' +
    ' INNER JOIN "Color" ON ("Articulo".COLOR = "Color".CODIGO)' +
    ' INNER JOIN "Categoria" ON ("Articulo".CATEGORIA = "Categoria".CODIGO)' +
    ' INNER JOIN "SubCategoria" ON ("Articulo".SUBCATEGORIA = "SubCategoria".CODIGO)'
    + ' INNER JOIN "Rubro" ON ("Articulo".RUBRO = "Rubro".CODIGO)' +
    ' INNER JOIN "Proveedor" ON ("Articulo".PROVEEDOR = "Proveedor".CODIGO)';
  dm.qArticulo.SQL.Text:= articulos
    +'  WHERE (PROVEEDOR like ' + QuotedStr(ProveedorEdit.Text + '%') + ')'
    +'  ORDER BY   "Articulo".DESCRIPCION';
  if (DM.ConfigQuery.FieldByName('CodigoBarra').AsString) = 'SI' then
    CodigoEdit.SetFocus
  else
    DescripcionEdit.SetFocus;
end;

procedure TFBuscaArticulo.imprimir_exportarImageClick(Sender: TObject);
begin
  ImprimirDataModule := TImprimirDataModule.Create(self);
  ImprimirDataModule.SImpr(dm.qArticulo.SQL.Text, 'Articulos');
  ImprimirDataModule.Free;
end;

procedure TFBuscaArticulo.DescripcionEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not DBGrid1.Focused = True) and (Length(DescripcionEdit.Text) > 2) then
    buscar;
end;

procedure TFBuscaArticulo.buscar;
begin
  with dm do begin
    qArticulo.SQL.Text:= articulos+' WHERE '+
    ' (upper("Articulo".DESCRIPCION) Containing '+QuotedStr(UpperCase(DescripcionEdit.Text))+')'+
    'AND ("Marca".DESCRIPCION like '+QuotedStr(MarcaEdit.Text + '%')+')'+
    'AND ("Rubro".DESCRIPCION like '+QuotedStr(RubroEdit.Text + '%')+')'+
    'AND ("Categoria".DESCRIPCION like '+QuotedStr(CategoriaEdit.Text + '%')+')'+
    'AND (upper("Proveedor".NOMBRE) Containing '+QuotedStr(UpperCase(ProveedorEdit.Text))+')';

    if CodigoEdit.Text<>'' then
      if (DM.ConfigQuery.FieldByName('CodigoBarra').AsString = 'SI') then
        qArticulo.SQL.Text := qArticulo.SQL.Text + 'AND (CODIGOBARRA like ' + QuotedStr('%'+CodigoEdit.Text+'%') + ')'
      else
        qArticulo.SQL.Text := qArticulo.SQL.Text + 'AND ("Articulo".CODIGO like ' + QuotedStr('%'+CodigoEdit.Text+'%') + ')';

    if EnStockCheckBox.Checked then qArticulo.SQL.Text := qArticulo.SQL.Text+'AND ("Articulo".Disponible > 0)';
    qArticulo.SQL.Text := qArticulo.SQL.Text+ ' ORDER BY   "Articulo".DESCRIPCION';
    qArticulo.Open;
  end;
end;

procedure TFBuscaArticulo.MarcaEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not DBGrid1.Focused = True) and (Length(MarcaEdit.Text) > 1) then
    buscar;
end;

procedure TFBuscaArticulo.RubroEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not DBGrid1.Focused = True) and (Length(RubroEdit.Text) > 1) then
    buscar;
end;

procedure TFBuscaArticulo.VerTodosBitBtnClick(Sender: TObject);
begin
  DescripcionEdit.Text := '';
  MarcaEdit.Text := '';
  CategoriaEdit.Text := '';
  RubroEdit.Text := '';
  ProveedorEdit.Text := '';
  CodigoEdit.Text := '';
  dm.qArticulo.SQL.Text:= articulos
    +'  ORDER BY   "Articulo".DESCRIPCION';
  dm.qArticulo.Open;
end;

procedure TFBuscaArticulo.CodigoEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not DBGrid1.Focused = True) and (Length(CodigoEdit.Text) > 2) then
    buscar;
end;

procedure TFBuscaArticulo.ProveedorEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not DBGrid1.Focused = True) and (Length(ProveedorEdit.Text) > 1) then
    buscar;
end;

procedure TFBuscaArticulo.CategoriaEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not DBGrid1.Focused = True) and (Length(CategoriaEdit.Text) > 1) then
    buscar;
end;

procedure TFBuscaArticulo.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not DBGrid1.Focused = True) then
    buscar;
  // if Key = VK_Escape then
  // Close;
end;

end.
