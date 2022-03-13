unit PedidoLF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGrids,
  DataModule, jpeg, ImprimirDM, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TPedidoLForm = class(TForm)
    Panel1: TPanel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn8: TBitBtn;
    Edit3: TEdit;
    Label16: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    siBitBtn: TBitBtn;
    BitBtn2: TBitBtn;
    StringGrid1: TStringGrid;
    Tabla: TIBQuery;
    Q: TIBQuery;
    Image1: TImage;
    procedure siBitBtnClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PedidoLForm: TPedidoLForm;

implementation

uses BuscarVendedor;

{$R *.dfm}

procedure TPedidoLForm.siBitBtnClick(Sender: TObject);
var
  i: integer;
begin
  StringGrid1.Cells[0, 1] := '';
  StringGrid1.Cells[1, 1] := '';
  StringGrid1.Cells[2, 1] := '';
  StringGrid1.RowCount := 1;
  Tabla.SQL.Text :=
    'SELECT "Operacion".CODIGO, "OperacionItem".DESCRIPCION, Sum("OperacionItem".CANTIDAD) as Cant'
    + ' FROM "Operacion"' +
    ' INNER JOIN "OperacionItem" ON ("Operacion".CODIGO = "OperacionItem".OPERACION)'
    + ' WHERE ("Operacion".TIPO = ''PED'')' +
  // ' AND ("Operacion".Pasivo = False)'+
    ' AND ("Operacion".VENDEDOR = ' + Edit3.Text + ')' +
    ' AND ("Operacion".FECHA >= ' + QuotedStr(DateToStr(DateTimePicker1.Date)) +
    ')' + ' AND ("Operacion".FECHA <= ' +
    QuotedStr(DateToStr(DateTimePicker2.Date)) + ')' +
    ' GROUP BY "Operacion".CODIGO, "OperacionItem".DESCRIPCION';
  Tabla.Open;
  for i := 1 to Tabla.RecordCount do
  begin
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
    StringGrid1.Cells[0, i] := Tabla.FieldByName('CODIGO').AsString;
    StringGrid1.Cells[1, i] := Tabla.FieldByName('Cant').AsString;
    StringGrid1.Cells[2, i] := Tabla.FieldByName('DESCRIPCION').AsString;
    Tabla.Next;
  end;
  if StringGrid1.RowCount = 1 then
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
  StringGrid1.FixedRows := 1;
end;

procedure TPedidoLForm.BitBtn2Click(Sender: TObject);
var
  i: integer;
begin
  // RvProject1.ProjectFile:=Path+'Report\Pedidos.rav';
  // RvProject1.Execute;
  // Iniciar la Transaccion
  Q.SQL.Text :=
    'SELECT "Operacion".CODIGO, "OperacionItem".DESCRIPCION, Sum("OperacionItem".CANTIDAD) as Cant'
    + ' FROM "Operacion"' +
    ' INNER JOIN "OperacionItem" ON ("Operacion".CODIGO = "OperacionItem".OPERACION)'
    + ' WHERE ("Operacion".TIPO = ''PED'')' +
  // ' AND ("Operacion".Pasivo = False)'+
    ' AND ("Operacion".VENDEDOR = ' + Edit3.Text + ')' +
    ' AND ("Operacion".FECHA >= ' + QuotedStr(DateToStr(DateTimePicker1.Date)) +
    ')' + ' AND ("Operacion".FECHA <= ' +
    QuotedStr(DateToStr(DateTimePicker2.Date)) + ')' +
    ' GROUP BY  "Operacion".CODIGO, "OperacionItem".DESCRIPCION';
  Q.Open;
  for i := 1 to Q.RecordCount do
  begin
    Tabla.SQL.Text := 'Update "Operacion" Set TIPO = ''LIB'' Where ' +
      'CODIGO = ' + Q.FieldByName('CODIGO').AsString;;
    Tabla.ExecSQL;
    Q.Next;
  end;
  // Completa la Transaccion
  //Tabla.Transaction.Commit;
  CLOSE;
end;

procedure TPedidoLForm.FormShow(Sender: TObject);
begin
  // DM := TDM.Create(Self);
  DateTimePicker2.Date := Date + 1;
  StringGrid1.Cells[0, 0] := 'CODIGO';
  StringGrid1.Cells[1, 0] := 'CANTIDAD';
  StringGrid1.Cells[2, 0] := 'DETALLE';
end;

procedure TPedidoLForm.Image1Click(Sender: TObject);
begin
  siBitBtn.Click;
  ImprimirDataModule := TImprimirDataModule.Create(Self);
  ImprimirDataModule.CSV(Tabla.SQL.Text, 'PEDIDOS');
  ImprimirDataModule.Free;
end;

procedure TPedidoLForm.BitBtn8Click(Sender: TObject);
begin
  BuscarVendedorForm := TBuscarVendedorForm.Create(Self);
  try
    BuscarVendedorForm.ShowModal;
  finally
    Edit3.Text := BuscarVendedorForm.Tabla.FieldByName('CODIGO').AsString;
    BuscarVendedorForm.Free;
  end;
end;

procedure TPedidoLForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = VK_F3 then
    BitBtn8.Click; // CLIENTES
end;

end.
