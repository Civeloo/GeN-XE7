unit NotaCreditoPlanF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, DB, Buttons, ImprimirDM,
  DataModule, ExtCtrls, OleCtrls, SHDocVw, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TNotaCreditoPlanForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    ClienteLabel: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit5: TEdit;
    ClienteBitBtn: TBitBtn;
    Edit2: TEdit;
    PlanBitBtn: TBitBtn;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    Edit3: TEdit;
    Button2: TButton;
    Label4: TLabel;
    TotalAplicadoEdit: TEdit;
    FechaDateTimePicker: TDateTimePicker;
    ImprimirCheckBox: TCheckBox;
    Label1: TLabel;
    SiBitBtn: TBitBtn;
    BitBtn5: TBitBtn;
    Label2: TLabel;
    Label6: TLabel;
    ImputarRadioGroup: TRadioGroup;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    StringGrid1: TStringGrid;
    QTemp: TIBQuery;
    Q: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Quicksort(Grid: TStringGrid; var List: array of integer;
      min, max, sortcol, datatype: integer);
    procedure Sortgrid(Grid: TStringGrid; sortcol, datatype: integer);
    procedure StringGrid1Click(Sender: TObject);
    procedure ClienteBitBtnClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure PlanBitBtnClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SiBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    CtaNombre, fecha: string;
    procedure DetalleCtaCte;
    { Public declarations }
  end;

var
  NotaCreditoPlanForm: TNotaCreditoPlanForm;

implementation

uses UFBuscaCliente, BuscarPlanFacturado;

{$R *.dfm}

Procedure GridRemoveRow(StrGrid: TStringGrid; DelRow: integer);
Var
  Row: integer;
begin
  If DelRow <= StrGrid.RowCount then
  Begin
    If (DelRow = StrGrid.RowCount - 1) AND (DelRow = 1) then
    begin
      StrGrid.Rows[DelRow].Clear;
      StrGrid.Cells[3, 1] := '0';
      StrGrid.Cells[4, 1] := '0.00';
      StrGrid.Cells[5, 1] := '0.00';
    end
    else if DelRow = StrGrid.RowCount - 1 then
      StrGrid.RowCount := StrGrid.RowCount - 1
    else
    begin
      For Row := DelRow To StrGrid.RowCount - 2 do
        StrGrid.Rows[Row].Assign(StrGrid.Rows[Row + 1]);
      StrGrid.RowCount := StrGrid.RowCount - 1;
    end;
  end;
end;

procedure TNotaCreditoPlanForm.Quicksort(Grid: TStringGrid;
  var List: array of integer; min, max, sortcol, datatype: integer);
{ List is a list of rownumbers in the grid being sorted }
var
  med_value: integer;
  hi, lo, i: integer;

  function compare(val1, val2: string): integer;
  var
    int1, int2: integer;
    float1, float2: extended;
    errcode: integer;
  begin
    case datatype of
      0:
        result := ANSIComparetext(val1, val2);
      1:
        begin
          int1 := strtointdef(val1, 0);
          int2 := strtointdef(val2, 0);
          if int1 > int2 then
            result := 1
          else if int1 < int2 then
            result := -1
          else
            result := 0;
        end;

      2:
        begin
          val(val1, float1, errcode);
          if errcode <> 0 then
            float1 := 0;
          val(val2, float2, errcode);
          if errcode <> 0 then
            float2 := 0;
          if float1 > float2 then
            result := 1
          else if float1 < float2 then
            result := -1
          else
            result := 0;
        end;
    else
      result := 0;
    end;
  end;

begin
  { If the list has <= 1 element, it's sorted }
  if (min >= max) then
    Exit;
  { Pick a dividing item randomly }
  i := min + Trunc(Random(max - min + 1));
  med_value := List[i];
  List[i] := List[min]; { Swap it to the front so we can find it easily }
  { Move the items smaller than this into the left
    half of the list. Move the others into the right }
  lo := min;
  hi := max;
  while (True) do
  begin
    // Look down from hi for a value < med_value.
    while compare(Grid.Cells[sortcol, List[hi]],
      Grid.Cells[sortcol, med_value]) >= 0 do
    (* ANSIComparetext(Grid.cells[sortcol,List[hi]]
      ,grid.cells[sortcol,med_value])>=0 do *)
    begin
      hi := hi - 1;
      if (hi <= lo) then
        Break;
    end;
    if (hi <= lo) then
    begin { We're done separating the items }
      List[lo] := med_value;
      Break;
    end;

    // Swap the lo and hi values.
    List[lo] := List[hi];
    inc(lo); { Look up from lo for a value >= med_value }
    while compare(Grid.Cells[sortcol, List[lo]],
      Grid.Cells[sortcol, med_value]) < 0 do
    begin
      inc(lo);
      if (lo >= hi) then
        Break;
    end;
    if (lo >= hi) then
    begin { We're done separating the items }
      lo := hi;
      List[hi] := med_value;
      Break;
    end;
    List[hi] := List[lo];
  end;
  { Sort the two sublists }
  Quicksort(Grid, List, min, lo - 1, sortcol, datatype);
  Quicksort(Grid, List, lo + 1, max, sortcol, datatype);
end;

procedure TNotaCreditoPlanForm.SiBitBtnClick(Sender: TObject);
var
  i: integer;
begin
  fecha := (FormatDateTime('mm/dd/yyyy hh:mm:ss', now));

  // Iniciar la Transaccion

  // Insertar en la tabla de CtaCte Item
  For i := 1 to StringGrid1.RowCount - 1 do
  begin
    if StringGrid1.Cells[3, i] = 'P' Then
    begin
      QTemp.SQL.Text := 'Update "CtaCteItem" Set "CtaCteItem".Pagado = ' +
        StringGrid1.Cells[4, i] + ' Where ' + '"CtaCteItem".CODIGO = ' +
        StringGrid1.Cells[0, i];
      QTemp.ExecSQL;
    end;
  end;
  For i := 1 to StringGrid1.RowCount - 1 do
  begin
    if StringGrid1.Cells[3, i] = 'P' Then
    begin
      QTemp.SQL.Text :=
        'Insert Into "RendidoCobrador" (VENTA, CUOTA, PAGADO, FECHA)  Values ('
        + Edit2.Text + ', ' + StringGrid1.Cells[1, i] + ', ' + StringGrid1.Cells
        [4, i] + ',' + QuotedStr(fecha) + ')';
      QTemp.ExecSQL;
    end;
  end;

  // CONTABILIDAD+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  // Insertar en la tabla LibroDiario
  // obtener el numero de asiento
  Q.SQL.Text := 'Select Max(ASIENTO) From "LibroDiario"';
  Q.Open;
  i := Q.Fields[0].AsInteger + 1;
  Q.Close;

  if strtofloat(TotalAplicadoEdit.Text) > 0.04 then // PAGO DE CUENTA CORRIENTE
  begin
    // renglon  - CAJA
    Q.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' +
      DM.ConfigQuery.FieldByName('CtaCaja').AsString;
    Q.Open;

    QTemp.SQL.Text :=
      'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
      + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(fecha) + ', ' +
      QuotedStr('Rendicion Cliente ' + ClienteLabel.Caption + '') + ', ' +
      QuotedStr(Q.FieldByName('Jerarquia').AsString) + ', ' +
      QuotedStr(Q.FieldByName('DESCRIPCION').AsString) + ', ' +
      TotalAplicadoEdit.Text + ', 0, ' + QuotedStr(Oculto) + ' )';
    QTemp.ExecSQL;

    // renglon  - DEUDORES POR VENTA

    Q.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' + CtaNombre;
    Q.Open;
    QTemp.SQL.Text :=
      'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
      + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(fecha) + ', ' +
      QuotedStr('Rendicion Cliente ' + ClienteLabel.Caption + '') + ', ' +
      QuotedStr(Q.FieldByName('Jerarquia').AsString) + ', ' +
      QuotedStr(Q.FieldByName('DESCRIPCION').AsString) + ', 0, ' +
      TotalAplicadoEdit.Text + ', ' + QuotedStr(Oculto) + ' )';
    QTemp.ExecSQL;
  end;
  // CONTABILIDAD------------------------------------------------------------------------------

  // Completa la Transaccion
  QTemp.Transaction.Commit;

  Edit3.Text := '';
  QTemp.Close;

  if ImprimirCheckBox.Checked = True then
  begin
    ImprimirDataModule := TImprimirDataModule.Create(self);
    ImprimirDataModule.SImpr('SELECT' + '  "RendidoCobrador".CUOTA,' +
      '  "RendidoCobrador".PAGADO,' + '  "RendidoCobrador".VENTA,' +
      '  "Cliente".NOMBRE,' + '  "RendidoCobrador".FECHA' + ' FROM' +
      '  "RendidoCobrador"' +
      '  INNER JOIN "CtaCte" ON ("RendidoCobrador".VENTA = "CtaCte".OPERACION)'
      + '  INNER JOIN "Cliente" ON ("CtaCte".CLIENTE = "Cliente".CODIGO)' +
      ' WHERE' + '  ("RendidoCobrador".VENTA = ' + Edit2.Text + ' ) AND' +
      '  ("CtaCte".CLIENTE = ' + Edit5.Text + ' ) AND' +
      '  ("RendidoCobrador".FECHA = ' + QuotedStr(fecha) + ' )', 'NotaCredito');
    ImprimirDataModule.Free;
  end;
  BitBtn4.Click;
  Close;
end;

procedure TNotaCreditoPlanForm.Sortgrid(Grid: TStringGrid;
  sortcol, datatype: integer);
var
  i: integer;
  tempgrid: TStringGrid;
  List: array of integer;
begin
  screen.cursor := crhourglass;
  tempgrid := TStringGrid.Create(self);
  with tempgrid do
  begin
    RowCount := Grid.RowCount;
    colcount := Grid.colcount;
    fixedrows := Grid.fixedrows;
  end;
  with Grid do
  begin
    setlength(List, RowCount - fixedrows);
    for i := fixedrows to RowCount - 1 do
    begin
      List[i - fixedrows] := i;
      tempgrid.Rows[i].Assign(Grid.Rows[i]);
    end;
    Quicksort(Grid, List, 0, RowCount - fixedrows - 1, sortcol, datatype);
    for i := 0 to RowCount - fixedrows - 1 do
    begin
      Rows[i + fixedrows].Assign(tempgrid.Rows[List[i]])
    end;
    Row := fixedrows;
  end;
  tempgrid.Free;
  setlength(List, 0);
  screen.cursor := crdefault;
end;

procedure TNotaCreditoPlanForm.FormShow(Sender: TObject);
begin
  StringGrid1.Cells[0, 0] := 'Codigo';
  StringGrid1.Cells[1, 0] := 'Cuota';
  StringGrid1.Cells[2, 0] := 'Vencimiento';
  StringGrid1.Cells[3, 0] := 'Importe';
  StringGrid1.Cells[4, 0] := 'Pagado';
  StringGrid1.Cells[5, 0] := 'A pagar';
  StringGrid1.Cells[6, 0] := 'Nombre';
  StringGrid1.Cells[7, 0] := 'Plan';
  ClienteBitBtn.Click;
end;

procedure TNotaCreditoPlanForm.DetalleCtaCte;
var
  cvencidas, cpagadas, cimpagas, cxvencer, i: integer;
  ipagado, simpago: Double;
  estado, UltimoPago: string;
  upago: TDate;
begin
  ipagado := 0;
  simpago := 0;
  cxvencer := 0;
  upago := 0;
  cvencidas := 0;
  cpagadas := 0;
  cimpagas := 0;

  QTemp.SQL.Text := '  "CtaCte".COBRADOR,' + '  "CtaCte".CLIENTE,' +
    '  "CtaCte".OPERACION,' + '  "CtaCteItem".CUOTA,' + '  "CtaCte".CUOTAS,' +
    '  "CtaCteItem".CODIGO,' + '  "Cliente".NOMBRE,' + '  "Cliente".TITULAR,' +
    '  "Cliente".DIRECCION,' + '  "CtaCteItem".IMPORTE,' +
    '  "CtaCteItem".VENCE,' + '  "CtaCteItem".PAGADO,' +
    '  "CtaCteItem".DESCRIPCION,' + '  "CtaCte".FECHA' +
    '  ("CtaCteItem".IMPORTE - "CtaCteItem".PAGADO) AS APAGAR,' + ' FROM' +
    '  "CtaCte"' +
    '  INNER JOIN "CtaCteItem" ON ("CtaCte".OPERACION = "CtaCteItem".OPERACION)'
    + '  INNER JOIN "Cliente" ON ("CtaCte".CLIENTE = "Cliente".CODIGO)' +
    '  INNER JOIN "Cobrador" ON ("CtaCte".COBRADOR = "Cobrador".CODIGO)' + '';
  QTemp.SQL.Add(' WHERE ("CtaCte".OPERACION =' + Edit2.Text +
    ') AND ("CtaCte".CLIENTE =' + Edit5.Text +
    ') ORDER BY "CtaCteItem".VENCE, "CtaCteItem".CODIGO');
  QTemp.Open;
  For i := 1 to QTemp.RecordCount do
  begin
    if (QTemp.FieldByName('VENCE').AsDateTime) < date then
      cvencidas := cvencidas + 1
    else
      cxvencer := cxvencer + 1;
    if (QTemp.FieldByName('APAGAR').AsFloat) > 0 then
    begin
      simpago := simpago + (QTemp.FieldByName('APAGAR').AsFloat);
      cimpagas := cimpagas + 1;
    end
    else
    begin
      ipagado := ipagado + (QTemp.FieldByName('APAGAR').AsFloat);
      cpagadas := cpagadas + 1;
      upago := (QTemp.FieldByName('FECHA').AsDateTime);
    end;
    QTemp.Next;
  end;
  FormatSettings.ShortDateFormat := 'mm/dd/yyyy';
  if cimpagas > 0 then
    estado := 'MOROSO';
  if upago = 0 then
    UltimoPago := ''
  else
    UltimoPago := DateToStr(upago);
  QTemp.SQL.Text := 'SELECT' + ' "' + IntToStr(cvencidas) +
    '" AS CuotasVencidas,' + ' "' + IntToStr(cpagadas) + '" AS CuotasPagadas,' +
    ' "' + IntToStr(cimpagas) + '" AS CuotasImpagas,' + ' "' +
    FloatToStr(ipagado) + '" AS ImportePagado,' + ' "' + FloatToStr(simpago) +
    '" AS SaldoImpago,' + ' "' + IntToStr(cxvencer) + '" AS CuotasPorVencer,' +
    ' "' + UltimoPago + '" AS UltimoPago,' + ' "' + estado +
    '" AS EstadoCredito,' + '  "CtaCte".COBRADOR,' + '  "CtaCte".CLIENTE,' +
    '  "CtaCte".OPERACION,' + '  "CtaCteItem".CUOTA,' + '  "CtaCte".CUOTAS,' +
    '  "CtaCteItem".CODIGO,' + '  "Cliente".NOMBRE,' + '  "Cliente".TITULAR,' +
    '  "Cliente".DIRECCION,' + '  "CtaCteItem".IMPORTE,' +
    '  "CtaCteItem".VENCE,' + '  "CtaCteItem".PAGADO,' +
    '  "CtaCteItem".DESCRIPCION,' + '  "CtaCte".FECHA' +
    '  ("CtaCteItem".IMPORTE - "CtaCteItem".PAGADO) AS APAGAR,' + ' FROM' +
    '  "CtaCte"' +
    '  INNER JOIN "CtaCteItem" ON ("CtaCte".OPERACION = "CtaCteItem".OPERACION)'
    + '  INNER JOIN "Cliente" ON ("CtaCte".CLIENTE = "Cliente".CODIGO)' +
    '  INNER JOIN "Cobrador" ON ("CtaCte".COBRADOR = "Cobrador".CODIGO)' +
    ' WHERE' + '  ("CtaCte".OPERACION = ' + Edit2.Text + ' ) AND' +
    '  ("CtaCte".CLIENTE = ' + Edit5.Text + ' )' + ' ORDER BY' +
    '  "CtaCteItem".VENCE,' + '  "CtaCteItem".CODIGO' + '';
  QTemp.Open;
end;

procedure TNotaCreditoPlanForm.Button2Click(Sender: TObject);
var
  n: integer;
begin
  n := 0;
  TotalAplicadoEdit.Text := Edit3.Text;

  while Edit3.Text <> '0' do
  begin
    n := n + 1;
    if (strtofloat(Edit3.Text) > strtofloat(StringGrid1.Cells[5, n])) OR
      (strtofloat(Edit3.Text) = strtofloat(StringGrid1.Cells[5, n])) then
    Begin
      StringGrid1.Cells[4, n] := FloatToStr(strtofloat(StringGrid1.Cells[4, n])
        + strtofloat(StringGrid1.Cells[5, n]));
      Edit3.Text := FloatToStr(strtofloat(Edit3.Text) -
        strtofloat(StringGrid1.Cells[5, n])); // entrega:= entrega-importe
      StringGrid1.Cells[5, n] := '0';
    end
    else
    Begin
      StringGrid1.Cells[4, n] := FloatToStr(strtofloat(StringGrid1.Cells[4, n])
        + strtofloat(Edit3.Text));
      StringGrid1.Cells[5, n] := FloatToStr(strtofloat(StringGrid1.Cells[5, n])
        - strtofloat(StringGrid1.Cells[4, n]));
      Edit3.Text := '0';
    end;
    StringGrid1.Cells[3, n] := 'P';
  end;
  SiBitBtn.SetFocus;
end;

procedure TNotaCreditoPlanForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(self);
  DM.ConfigQuery.Open;
end;

procedure TNotaCreditoPlanForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end;
end;

procedure TNotaCreditoPlanForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = VK_F1 then
    ClienteBitBtn.Click;
  IF Key = VK_F8 then
    PlanBitBtn.Click;
end;

procedure TNotaCreditoPlanForm.StringGrid1Click(Sender: TObject);
begin
  Edit3.Text := StringGrid1.Cells[5, StringGrid1.Row];
end;

procedure TNotaCreditoPlanForm.ClienteBitBtnClick(Sender: TObject);
begin
  FBuscaCliente := TFBuscaCliente.Create(self);
  try
    FBuscaCliente.ShowModal;
  finally
    with FBuscaCliente do
    begin
      Edit5.Text := Tabla.FieldByName('CODIGO').AsString;
      ClienteLabel.Caption := Tabla.FieldByName('NOMBRE').AsString + ' - ' +
        Tabla.FieldByName('TITULAR').AsString;
      CtaNombre := Tabla.FieldByName('CtaNombre').AsString;
    end;
    FBuscaCliente.Free;
  end;
  PlanBitBtn.Click;
end;

procedure TNotaCreditoPlanForm.BitBtn4Click(Sender: TObject);
var
  i: integer;
  i1, i2: string;
begin

  StringGrid1.RowCount := 2;

  FormatSettings.ShortDateFormat := 'mm/dd/yyyy';

  if ImputarRadioGroup.ItemIndex = 0 then
    i1 := ' ORDER BY "CtaCteItem".VENCE'
  else if ImputarRadioGroup.ItemIndex = 1 then
    i1 := ' ORDER BY "CtaCteItem".VENCE DESC'
  else
    i2 := ' AND ("CtaCteItem".VENCE >' + DateToStr(FechaDateTimePicker.date) +
      ') ORDER BY "CtaCteItem".VENCE';

  QTemp.SQL.Text := 'SELECT' + '  "CtaCte".COBRADOR,' + '  "CtaCte".OPERACION,'
    + '  "CtaCteItem".CUOTA,' + '  "CtaCteItem".VENCE,' +
    '  "CtaCteItem".IMPORTE,' + '  "CtaCteItem".PAGADO,' +
    '  ("CtaCteItem".IMPORTE - "CtaCteItem".PAGADO) AS APAGAR,' +
    '  "CtaCteItem".CODIGO,' + '  "CtaCte".CLIENTE,' +
    '  "Cobrador".NOMBRE AS COBRADORNOMBRE,' +
    '  "Cliente".NOMBRE AS CLIENTENOMBRE' + ' FROM' + ' "CtaCte"' +
    ' INNER JOIN "Cliente" ON ("CtaCte".CLIENTE = "Cliente".CODIGO)' +
    ' INNER JOIN "CtaCteItem" ON ("CtaCte".OPERACION = "CtaCteItem".OPERACION)'
    + ' INNER JOIN "Cobrador" ON ("CtaCte".COBRADOR = "Cobrador".CODIGO)' +
    ' WHERE' + '  ("CtaCteItem".PAGADO < "CtaCteItem".IMPORTE) AND' +
    '  ("CtaCteItem".OPERACION = ' + Edit2.Text + ' ) AND' +
    '  ("CtaCte".CLIENTE = ' + Edit5.Text + ' )' + i2 + i1 + '';
  QTemp.Open;
  i := 0;
  while QTemp.Eof = False do
  begin
    i := i + 1;
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
    StringGrid1.Cells[0, i] := QTemp.FieldByName('CODIGO').AsString;
    StringGrid1.Cells[1, i] := QTemp.FieldByName('CUOTA').AsString;
    StringGrid1.Cells[2, i] := QTemp.FieldByName('VENCE').AsString;
    StringGrid1.Cells[3, i] := QTemp.FieldByName('IMPORTE').AsString;
    StringGrid1.Cells[4, i] := QTemp.FieldByName('PAGADO').AsString;
    StringGrid1.Cells[5, i] := QTemp.FieldByName('APAGAR').AsString;
    StringGrid1.Cells[6, i] := QTemp.FieldByName('CLIENTENOMBRE').AsString;
    StringGrid1.Cells[7, i] := QTemp.FieldByName('OPERACION').AsString;
    QTemp.Next;
  end;
  Edit3.SetFocus;
end;

procedure TNotaCreditoPlanForm.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TNotaCreditoPlanForm.PlanBitBtnClick(Sender: TObject);
begin
  BuscarPlanFacturadoForm := TBuscarPlanFacturadoForm.Create(self);
  BuscarPlanFacturadoForm.Edit4.Text := Edit5.Text;
  try
    BuscarPlanFacturadoForm.ShowModal;
  finally
    Edit2.Text := BuscarPlanFacturadoForm.Tabla.FieldByName
      ('OPERACION').AsString;
    Label9.Caption := BuscarPlanFacturadoForm.Tabla.FieldByName
      ('DESCRIPCION').AsString;
    BuscarPlanFacturadoForm.Free;
  end;
  BitBtn4.SetFocus;
end;

procedure TNotaCreditoPlanForm.BitBtn2Click(Sender: TObject);
begin
  DetalleCtaCte;
end;

end.
