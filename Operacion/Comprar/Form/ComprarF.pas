unit ComprarF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, OperacionDM,
  DBGrids, ValEdit, DateUtils, DataModule, ComCtrls,
  OleCtrls, SHDocVw, IBX.IBCustomDataSet, IBX.IBQuery, Math;

type
  TComprarForm = class(TForm)
    Panel4: TPanel;
    SGTotal: TStringGrid;
    SGFact: TStringGrid;
    QTemp: TIBQuery;
    Q: TIBQuery;
    Panel3: TPanel;
    SiBitBtn: TBitBtn;
    ProveedorBitBtn: TBitBtn;
    AgregarBitBtn: TBitBtn;
    NuevoBitBtn: TBitBtn;
    QuitarBitBtn: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Label25: TLabel;
    CodigoEdit: TEdit;
    FechaDateTimePicker: TDateTimePicker;
    FLEPorcDesc: TEdit;
    ProveedorLabel: TLabel;
    VendedorEdit: TEdit;
    CUITEdit: TEdit;
    Label17: TLabel;
    cbTipo: TComboBox;
    Label22: TLabel;
    PagareCheckBox: TCheckBox;
    DescuentoBitBtn: TBitBtn;
    procedure RJustifyEdit(var ThisEdit: TEdit);
    procedure NoBitBtnClick(Sender: TObject);
    procedure AgregarBitBtnClick(Sender: TObject);
    procedure Quicksort(Grid: TStringGrid; var List: array of integer;
      min, max, sortcol, datatype: integer);
    procedure Sortgrid(Grid: TStringGrid; sortcol, datatype: integer);
    procedure CalculaTotales;
    procedure QuitarBitBtnClick(Sender: TObject);
    procedure SGFactDblClick(Sender: TObject);
    procedure SiBitBtnClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbTipoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ProveedorBitBtnClick(Sender: TObject);
    procedure NuevoBitBtnClick(Sender: TObject);
    procedure DescuentoBitBtnClick(Sender: TObject);
    procedure CUITEditExit(Sender: TObject);
  private
    { Private declarations }
    procedure AgregarProducto;
  public
    Oculto: string;
    { Public declarations }
  end;

var
  ComprarForm: TComprarForm;
  Cuenta: integer;
  // CESubTotal, CEDesc, CEImpuesto, CETotal : TControlCanvas;
  subtotal, Impuesto, Flete, NG21, IVA21, NG105, IVA105, NGO, IVAO, desc, costo,
    reparaciones, Total, IIBB, NGIIBB, Exento: Double;
  code, Proveedor, CtaNombre, CtaTipo, CtaIIBB, CtaAnticipo: string;

implementation

uses UFSelProdFact, UFFormaPago, UFBuscaProve, servicio;

{$R *.dfm}

procedure TComprarForm.RJustifyEdit(var ThisEdit: TEdit);
var
  Left, Width: integer;
  GString: String;
  Rgn: TRect;
  TheCanvas: TControlCanvas;
begin
  TheCanvas := TControlCanvas.Create;
  try
    TheCanvas.Control := ThisEdit;
    GString := ThisEdit.Text;
    Rgn := ThisEdit.ClientRect;
    TheCanvas.FillRect(Rgn);
    Width := TheCanvas.TextWidth(GString);
    Left := Rgn.Right - Width - 1;
    TheCanvas.TextRect(Rgn, Left, 0, GString);
  finally
    TheCanvas.Free;
  end;
end;

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

procedure TComprarForm.CalculaTotales;
var
  i: Integer;
  NG,DSC,NGD,IVA: Double;
begin

  // Calcula los totales de la factura
//  subtotal := 0;
//  Impuesto := 0;
  desc := 0;
  Total := 0;
  costo := 0;
  reparaciones := 0;
  IVA21 := 0;
  IVA105 := 0;
  IVAO := 0;
//  UltCosto := 0;
  NG21 := 0;
  NG105 := 0;
  NGO := 0;
  NG := 0;
  DSC := 0;
  NGD :=0;
  IVA :=0;

  // Calcula el SubTotal
  For i := 1 to SGFact.RowCount - 1 do
  begin
    //total
    IF (SGFact.Cells[5, i] = '') then SGFact.Cells[5, i] := '0';
    //IVA
    IF (SGFact.Cells[6, i] = '') then SGFact.Cells[6, i] := '0';
    //NG
    IF (SGFact.Cells[8, i] = '') then SGFact.Cells[8, i] := '0';
    //
    IF (SGFact.Cells[9, i] = '') then SGFact.Cells[9, i] := '0';
    //
    IF (SGFact.Cells[11, i] = '') then SGFact.Cells[11, i] := '0';
    // SUBTOTAL
    subtotal := subtotal + StrToFloat(SGFact.Cells[5, i]);
    // Calcula el Neto
    IF SGFact.Cells[8, i] <> '0' then costo := costo + StrToFloat(SGFact.Cells[8, i]);
    //
//    IF SGFact.Cells[11, i] <> '0' then UltCosto := UltCosto + StrToFloat(SGFact.Cells[11, i]);
    // Calcula el Ultimo Costo
    IF SGFact.Cells[9, i] <> '0' then reparaciones := reparaciones + StrToFloat(SGFact.Cells[9, i]);

    // Calcula las reparaciones
  end;

  // Calcula el monto para cobrar el impuesto de ventas
  For i := 1 to SGFact.RowCount - 1 do
  begin
   NG := StrToFloat(SGFact.Cells[8, i]);
   DSC := (NG * StrToFloat(FLEPorcDesc.Text) / 100);
   NGD:= NG-DSC;
   with OperacionDataModule do
    begin
    If (SGFact.Cells[6, i] = '21') then
    begin
      NG21 := NG21 + NG;
      IVA := CalcularIVA((NGD),21)-NGD;
      IVA21 := IVA21 + IVA;
    end // IVA 21% 100 * 1.21 - 100 = 21
    else
    if (SGFact.Cells[6, i] = '105') then
      begin
        NG105 := NG105 + NG;
        IVA := CalcularIVA((NGD),10.5)-NGD;
        IVA105 := IVA105 + IVA;
      end // IVA 10.5% 100 * 1.105 - 100 = 10.5
      else
       begin
        NGO := NGO + NG; // NETO GRABADO
        IVA := CalcularIVA((NGD),StrToFloat(SGFact.Cells[6, i]))-NGD;
        IVAO := IVAO + IVA;
      end;
      desc:=  desc + DSC;
    end;
  end;

  Impuesto := IVA21 + IVA105 + IVAO;
  //subtotal := (subtotal - Impuesto);
  subtotal:= NG21 + NG105 + NGO;
  desc:=RoundTo(desc,-2);
  Total := ( subtotal + Impuesto - desc ); //+ Interes );

  // escribe los valores en las celdas
  SGTotal.Cells[1, 0] := Format('%8.2n', [subtotal]);
  SGTotal.Cells[1, 1] := Format('%8.2n', [desc]);
  SGTotal.Cells[1, 2] := Format('%8.2n', [Impuesto]);
//  SGTotal.Cells[1, 3] := Format('%8.2n', [Interes]);
  SGTotal.Cells[1, 4] := Format('%8.2n', [Total]);

//  if FEContado.Text = '' then FEContado.Text := '0';
//  if FECheque.Text = '' then FECheque.Text := '0';
//  if FETarjeta.Text = '' then FETarjeta.Text := '0';
//  if FEOtro.Text = '' then FEOtro.Text := '0';

//  Pagado := StrToFloat(FEContado.Text) + StrToFloat(FECheque.Text) +
//    StrToFloat(FETarjeta.Text) + StrToFloat(FEOtro.Text);
//  Saldo := Total - Pagado;
//  LbSaldo.Caption := FloatToStr(Saldo);

//  FEContado.Text := FloatToStr(Total);
{var
  i: integer;
begin
  // Calcula los totales de la factura
  subtotal := 0;
  Impuesto := 0;
  desc := 0;
  Total := 0;
  costo := 0;
  reparaciones := 0;
  IVA21 := 0;
  IVA105 := 0;
  IVAO := 0;

  // Calcula el SubTotal
  For i := 1 to SGFact.RowCount - 1 do
  begin
    IF (SGFact.Cells[5, i] = '') then
      SGFact.Cells[5, i] := '0';
    IF (SGFact.Cells[6, i] = '') then
      SGFact.Cells[6, i] := '0';
    IF (SGFact.Cells[8, i] = '') then
      SGFact.Cells[8, i] := '0';
    IF (SGFact.Cells[9, i] = '') then
      SGFact.Cells[9, i] := '0';
    IF (SGFact.Cells[11, i] = '') then
      SGFact.Cells[11, i] := '0';
    subtotal := subtotal + StrToFloat(SGFact.Cells[5, i]); // SUBTOTAL
    IF SGFact.Cells[8, i] <> '' then
      costo := costo + StrToFloat(SGFact.Cells[8, i]); // Calcula el Costo
    IF SGFact.Cells[9, i] <> '' then
      reparaciones := reparaciones + StrToFloat(SGFact.Cells[9, i]);
    // Calcula las reparaciones
  end;

  // Calcula el monto para cobrar el impuesto de ventas

  For i := 1 to SGFact.RowCount - 1 do
  begin
    IF (SGFact.Cells[5, i] = '') then
      SGFact.Cells[5, i] := '0';
    IF (SGFact.Cells[6, i] = '') then
      SGFact.Cells[6, i] := '0';
    If (StrToFloat(SGFact.Cells[6, i]) = 21) then
    begin
      NG21 := NG21 + StrToFloat(SGFact.Cells[5, i]); // NETO GRABADO 21%
      IVA21 := IVA21 + Abs(StrToFloat(SGFact.Cells[5, i]) * 0.21);//(StrToFloat(SGFact.Cells[5, i]) * 1.21) - StrToFloat(SGFact.Cells[5, i])));
    end // IVA 21% 100 * 1.21 - 100 = 21
    else
    IF (StrToFloat(SGFact.Cells[6, i]) = 10.50) then
    begin
      NG105 := NG105 + StrToFloat(SGFact.Cells[5, i]); // NETO GRABADO 10.5%
      IVA105 := IVA105 + Abs(StrToFloat(SGFact.Cells[5, i]) * 0.105);//StrToFloat((StrToFloat(SGFact.Cells[5, i]) * 1.105) - StrToFloat(SGFact.Cells[5, i])));
    end // IVA 10.5% 100 * 1.105 - 100 = 10.5
    else//IF (SGFact.Cells[6, i] <> '21') and (SGFact.Cells[6, i] <> '10.5') and (SGFact.Cells[6, i] <> '0') and (SGFact.Cells[6, i] <> '') then
    begin
      NGO := NGO + StrToFloat(SGFact.Cells[5, i]); // NETO GRABADO
      IVAO := IVAO + Abs(StrToFloat(SGFact.Cells[5, i]) * (StrToFloat(SGFact.Cells[6, i]) / 100));//(StrToFloat(SGFact.Cells[5, i]) / (StrToFloat(SGFact.Cells[6, i]) * 100 + 1)) - StrToFloat(SGFact.Cells[5, i]));
    end;
  end;

  Impuesto := IVA21 + IVA105 + IVAO;
  subtotal := (subtotal - Impuesto);
  desc := subtotal * (StrToFloat(FLEPorcDesc.Text) / 100);

  // if cbTipo.ItemIndex = 0 then   Total := (SubTotal - desc) else
  Total := (subtotal + Impuesto - desc);

  // escribe los valores en las celdas
  SGTotal.Cells[1, 0] := Format('%8.2n', [subtotal]);
  SGTotal.Cells[1, 1] := Format('%8.2n', [desc]);
  SGTotal.Cells[1, 2] := Format('%8.2n', [Impuesto]);
  SGTotal.Cells[1, 3] := Format('%8.2n', [StrToFloat('0.00')]);
  SGTotal.Cells[1, 4] := Format('%8.2n', [Total]);}
end;

procedure TComprarForm.cbTipoChange(Sender: TObject);
begin
  CalculaTotales;
end;

procedure TComprarForm.Quicksort(Grid: TStringGrid; var List: array of integer;
  min, max, sortcol, datatype: integer);
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

procedure TComprarForm.Sortgrid(Grid: TStringGrid; sortcol, datatype: integer);
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

procedure TComprarForm.NoBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TComprarForm.NuevoBitBtnClick(Sender: TObject);
begin
  ServForm := TServForm.Create(self);
  try
    ServForm.ShowModal;
  finally
    If ServForm.DescripcionEdit.Text <> '' then
    begin
      if Cuenta > 1 then
        SGFact.RowCount := SGFact.RowCount + 1;
      SGFact.Cells[0, Cuenta] := ServForm.cod;
      SGFact.Cells[1, Cuenta] := ServForm.DescripcionEdit.Text;
      SGFact.Cells[2, Cuenta] := '0';
      SGFact.Cells[3, Cuenta] := '1'; // cantidad
      SGFact.Cells[4, Cuenta] := ServForm.PrecioEdit.Text;
      SGFact.Cells[5, Cuenta] := FloatToStr(StrToFloat(SGFact.Cells[4, Cuenta])
        * StrToFloat(SGFact.Cells[3, Cuenta])); // total
      SGFact.Cells[6, Cuenta] := '21';
      SGFact.Cells[8, Cuenta] := ServForm.PrecioEdit.Text; // PRECIO DE COSTO
      SGFact.Cells[9, Cuenta] := '0';
      SGFact.Cells[10, Cuenta] := '0';
      SGFact.Cells[11, Cuenta] := '0'; // PRECIO DE COSTO
      Cuenta := Cuenta + 1;
    end;
    ServForm.Free;
  end;
  CalculaTotales;
  SiBitBtn.SetFocus;
end;

procedure TComprarForm.ProveedorBitBtnClick(Sender: TObject);
begin
  FBuscaProve := TFBuscaProve.Create(self);
  try
    FBuscaProve.ShowModal;
  finally
    CodigoEdit.Text := FBuscaProve.Tabla.FieldByName('CODIGO').AsString;
    with FBuscaProve do
    begin
      ProveedorLabel.Caption := Tabla.FieldByName('Nombre').AsString;
      Label3.Caption := Tabla.FieldByName('Direccion').AsString;
      Label4.Caption := Tabla.FieldByName('DireccionCOMERCIAL').AsString;
      // Label13.Caption := Tabla.FieldByName('Telefono').AsString;
      // Label14.Caption := Tabla.FieldByName('Celular').AsString;
      // Label15.Caption := Tabla.FieldByName('Rubro').AsString;
      // Label19.Caption := Tabla.FieldByName('Terminos').AsString;
      // Label23.Caption := DateToStr(IncDay(now,Tabla.FieldByName('DiasCredito').AsInteger));
      // Label21.Caption := Tabla.FieldByName('DiasCredito').AsString;
      // GerenteLabel.Caption := Tabla.FieldByName('Gerente').AsString;
      // CUITLabel.Caption := Tabla.FieldByName('CUIT').AsString;
      // CUENTA
      CtaNombre := Tabla.FieldByName('CtaNombre').AsString;
      CtaTipo := Tabla.FieldByName('CtaTipo').AsString;
      CtaAnticipo := Tabla.FieldByName('CtaAnticipo').AsString;

      PagareCheckBox.Checked := Tabla.FieldByName('PAGARE').AsBoolean;
      if (dm.ConfigQuery.FieldByName('IVA').AsString = 'Responsable Inscripto') and
        (Tabla.FieldByName('IVA').AsString = 'RI') then cbTipo.ItemIndex := 0
      else if (Tabla.FieldByName('IVA').AsString = 'RI') then
        cbTipo.ItemIndex := 1
      else
        cbTipo.ItemIndex := 2;
    end;
    FBuscaProve.Free;
  end;
  CalculaTotales;
end;

procedure TComprarForm.AgregarBitBtnClick(Sender: TObject);
{var
  i: integer;  }
begin
  {// ************ Boton de Agregar **************
  FSelProdFact := TFSelProdFact.Create(self);
  FSelProdFact.Precio := 'Costo';
  FSelProdFact.Proveedor := ProveedorLabel.Caption;
  // Filtra las series que ya estan en la factura
  If (SGFact.RowCount = 2) AND (SGFact.Cells[2, 1] = '') then
    FSelProdFact.Filtro := ''
  else
  begin
    FSelProdFact.Filtro := 'NumSerie <> ' + SGFact.Cells[2, 1];
    i := 2;
    While i < SGFact.RowCount do
    begin
      FSelProdFact.Filtro := FSelProdFact.Filtro + ' AND NumSerie <> ' +
        SGFact.Cells[2, i];
      i := i + 1;
    end;
  end;
  try
    FSelProdFact.ShowModal;
  finally
    If FSelProdFact.Cancela = False then
    Begin
      If Cuenta > 1 then
        SGFact.RowCount := SGFact.RowCount + 1;
      QTemp.Close;
      QTemp.SQL.Text := 'SELECT * FROM "Articulo" ' + 'WHERE CODIGO = ' +
        (FSelProdFact.Edit1.Text);
      QTemp.Open;


//      SGFact.Cells[0, Cuenta]
      codigo:= FSelProdFact.Edit1.Text; //CODIGO
      //SGFact.Cells[1, Cuenta]
      descr := QTemp.FieldByName('DESCRIPCION').AsString; //DESCRIPCION
//      SGFact.Cells[2, Cuenta] := QTemp.Fields.FieldByName('ImpOtros').AsString; //FLETE
//      SGFact.Cells[3, Cuenta]
      cantidad := FSelProdFact.CantidadEdit.Text;    //CANTIDAD
//      SGFact.Cells[6, Cuenta]
      iva := QTemp.FieldByName('Tasa').AsFloat; //IVA
      // IVA
//      SGFact.Cells[4, Cuenta] := Format('%8.2f', [StrToFloat(FSelProdFact.FloatEdit1.Text) * (StrToFloat(SGFact.Cells[6, Cuenta]) / 100 + 1) - StrToFloat(SGFact.Cells[2, Cuenta]) ]);  //NG
      precio := FSelProdFact.FloatEdit1.Text;
//      SGFact.Cells[5, Cuenta] := Format('%8.2f', [StrToFloat(SGFact.Cells[4, Cuenta]) * StrToFloat(SGFact.Cells[3, Cuenta])]); //SUBTOTAL
      subtotal := precio * cantidad;
//      SGFact.Cells[8, Cuenta] := Format('%8.2f', //[QTemp.FieldByName('Costo').AsFloat]); //COSTO
//      [StrToFloat(FSelProdFact.FloatEdit1.Text) *
//        (StrToFloat(SGFact.Cells[6, Cuenta]) / 100 + 1)
//        ]);
      costo := QTemp.FieldByName('Costo').AsFloat;
//      SGFact.Cells[9, Cuenta] := QTemp.FieldByName('IIBB').AsString;// ACTIVIDAD DE MONOTRIBUTO
      iibb := QTemp.FieldByName('IIBB').AsString;

      Q.SQL.Text := 'SELECT * FROM IIBB WHERE CODIGO=' +
//        QuotedStr(SGFact.Cells[9, Cuenta]);
      QuotedStr(iibb);
      Q.Open;
//      SGFact.Cells[10, Cuenta] :=
//        Format('%8.2f', [Q.FieldByName('Porcentaje').AsFloat]);
// PORCENTAJE DE INGRESOS BRUTOS
      ibb_porcentaje := Q.FieldByName('Porcentaje').AsFloat;


      Cuenta := Cuenta + 1;
      QTemp.Close;
      Sortgrid(SGFact, 0, 0);
      CalculaTotales;
    end;
    FSelProdFact.Free;
  end;
  SiBitBtn.SetFocus;  }
  AgregarProducto;
end;

procedure TComprarForm.QuitarBitBtnClick(Sender: TObject);
begin
  GridRemoveRow(SGFact, SGFact.Row);
  if Cuenta > 1 then
    Cuenta := Cuenta - 1;
  CalculaTotales;
end;

procedure TComprarForm.SGFactDblClick(Sender: TObject);
var
  i: integer;
begin
  FSelProdFact := TFSelProdFact.Create(self);
  // Filtra las series que ya estan en la factura
  If (SGFact.RowCount = 2) AND (SGFact.Cells[2, 1] = '') then
    FSelProdFact.Filtro := ''
  else
  begin
    FSelProdFact.Filtro := 'NumSerie <> ' + SGFact.Cells[2, 1];
    i := 2;
    While i < SGFact.RowCount do
    begin
      If i <> SGFact.Row then
        FSelProdFact.Filtro := FSelProdFact.Filtro + ' AND NumSerie <> ' +
          SGFact.Cells[2, i];
      i := i + 1;
    end;
  end;
  // Carga los datos de la linea en el form
  FSelProdFact.Edit1.Text := SGFact.Cells[0, SGFact.Row];
  FSelProdFact.FloatEdit1.Text := SGFact.Cells[4, SGFact.Row];
  If SGFact.Cells[6, SGFact.Row] = 'Si' then
    FSelProdFact.CBIV.Checked := True
  else
    FSelProdFact.CBIV.Checked := False;
  try
    FSelProdFact.ShowModal;
  finally
    If FSelProdFact.Cancela = False then
    Begin
      QTemp.Close;
      QTemp.SQL.Text :=
        'SELECT Descripcion+" "+Categoria+" "+SubCategoria AS Descr, Precio1 FROM Articulos '
        + 'WHERE CodParte = ' + (FSelProdFact.Edit1.Text);
      QTemp.Open;
      SGFact.Cells[0, SGFact.Row] := FSelProdFact.Edit1.Text;
      SGFact.Cells[1, SGFact.Row] := QTemp.Fields[0].AsString;
      SGFact.Cells[3, SGFact.Row] := '1';
      SGFact.Cells[4, SGFact.Row] :=
        Format('%8.2f', [StrToFloat(FSelProdFact.FloatEdit1.Text)]);
      SGFact.Cells[5, SGFact.Row] :=
        Format('%8.2f', [StrToFloat(SGFact.Cells[4, SGFact.Row]) *
        StrToFloat(SGFact.Cells[3, SGFact.Row])]);
      If FSelProdFact.CBIV.Checked then
        SGFact.Cells[6, SGFact.Row] := 'Si'
      else
        SGFact.Cells[6, SGFact.Row] := 'No';
      QTemp.Close;
      Sortgrid(SGFact, 0, 0);
      CalculaTotales;
    end;
    FSelProdFact.Free;
  end;
end;

procedure TComprarForm.SiBitBtnClick(Sender: TObject);
var
  r, c: integer;
begin
  // c:= 0;//columna i
  // r:= 0;//row j
  subtotal := 0;
  Impuesto := 0;
  OperacionDataModule := TOperacionDataModule.Create(self);
  FFormaPago := TFFormaPago.Create(self);
  FFormaPago.Valores(subtotal, Impuesto, Total);
  try
    FFormaPago.ShowModal;
  finally
    setlength(mat, SGFact.colcount, SGFact.RowCount);
    for r := 0 to SGFact.RowCount - 1 do
      for c := 0 to SGFact.colcount - 1 do
      begin
        mat[c, r] := SGFact.Cells[c, r];
      end;
    with FFormaPago do
    begin
      OperacionDataModule.ProcCompra(cbTipo.Text, CodigoEdit.Text,
      FormatDateTime('mm/dd/yyyy hh:mm:ss', FechaDateTimePicker.DateTime),
      VendedorEdit.Text, CUITEdit.Text, CtaNombre, CUITEdit.Text, PagareCheckBox.Checked,
      costo, Impuesto, StrToFloat(FECheque.Text),
      StrToFloat(ChequeTerceroEdit.Text), StrToFloat(FEContado.Text), Total,
      subtotal, desc, StrToFloat(FETarjeta.Text), StrToFloat(FEOtro.Text),
      Saldo, Pagado, NG105, NG21, IVA105, IVA21, Total - Saldo);
    end;
    FFormaPago.Free;
  end;
  OperacionDataModule.Free;
  Close;
end;

procedure TComprarForm.CheckBox1Click(Sender: TObject);
begin
  CalculaTotales;
end;

procedure TComprarForm.CUITEditExit(Sender: TObject);
begin
  SiBitBtn.SetFocus;
end;

procedure TComprarForm.DescuentoBitBtnClick(Sender: TObject);
begin
  CalculaTotales;
end;

procedure TComprarForm.FormCreate(Sender: TObject);
begin
  // dm := TDM.Create(self);
  dm.ConfigQuery.Open;
end;

procedure TComprarForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    ProveedorBitBtn.Click
  else if Key = VK_F4 then
    NuevoBitBtn.Click
  else if Key = VK_F5 then
    AgregarBitBtn.Click
  else if Key = VK_F6 then
    QuitarBitBtn.Click
  else if Key = VK_F12 then
    SiBitBtn.Click
  else if Key = VK_Escape then
    Close;
end;

procedure TComprarForm.FormShow(Sender: TObject);
begin
  SGFact.Cells[0, 0] := 'C�digo';
  SGFact.Cells[1, 0] := 'Descripci�n';
//  SGFact.Cells[2, 0] := 'Flete';
  SGFact.Cells[3, 0] := 'Cantidad';
  SGFact.Cells[4, 0] := 'Precio';
  SGFact.Cells[5, 0] := 'Total';
  SGFact.Cells[6, 0] := 'IVA';
  SGFact.Cells[3, 1] := '0';
  SGFact.Cells[4, 1] := '0.00';
  SGFact.Cells[5, 1] := '0.00';
  SGTotal.Cells[0, 0] := 'Sub Total';
  SGTotal.Cells[0, 1] := 'Descuento';
  SGTotal.Cells[0, 2] := 'Impuesto';
  SGTotal.Cells[0, 3] := 'Flete';
  SGTotal.Cells[0, 4] := 'Total';
  SGTotal.Cells[1, 0] := '0.00';
  SGTotal.Cells[1, 1] := '0.00';
  SGTotal.Cells[1, 2] := '0.00';
  SGTotal.Cells[1, 2] := '0.00';
  SGTotal.Cells[1, 4] := '0.00';
  Cuenta := 1;
  FechaDateTimePicker.DateTime := Now;
  subtotal := 0;
  Impuesto := 0;
  desc := 0;
  Total := 0;
  NG21 := 0;
  IVA21 := 0;
  NG105 := 0;
  IVA105 := 0;
  FLEPorcDesc.Text := '0.0';
  AgregarBitBtn.SetFocus;
  costo := 0;
  reparaciones := 0;
  ProveedorBitBtn.Click;
  AgregarBitBtn.Click;
  CUITEdit.SetFocus;
end;

procedure TComprarForm.AgregarProducto;
var
      codigo, descr, iibb :string;
      cantidad, i : integer;
      precio, subtotal, iva, costo, iibb_porcentaje, NG : Double;
begin
  // ************ Boton de Agregar **************
  FSelProdFact := TFSelProdFact.Create(self);
  FSelProdFact.Precio := 'Costo';
  FSelProdFact.Proveedor := ProveedorLabel.Caption;
  // Filtra las series que ya estan en la factura
  If (SGFact.RowCount = 2) AND (SGFact.Cells[2, 1] = '') then
    FSelProdFact.Filtro := ''
  else
  begin
    FSelProdFact.Filtro := 'NumSerie <> ' + SGFact.Cells[2, 1];
    i := 2;
    While i < SGFact.RowCount do
    begin
      FSelProdFact.Filtro := FSelProdFact.Filtro + ' AND NumSerie <> ' +
        SGFact.Cells[2, i];
      i := i + 1;
    end;
  end;
  try
    FSelProdFact.ShowModal;
  finally
    If FSelProdFact.Cancela = False then
    Begin
      If Cuenta > 1 then
        SGFact.RowCount := SGFact.RowCount + 1;
      QTemp.Close;
      QTemp.SQL.Text := 'SELECT * FROM "Articulo" ' + 'WHERE CODIGO = ' +
        (FSelProdFact.Edit1.Text);
      QTemp.Open;

      codigo:= FSelProdFact.Edit1.Text; //CODIGO
      descr := QTemp.FieldByName('DESCRIPCION').AsString; //DESCRIPCION
//      SGFact.Cells[2, Cuenta] := QTemp.Fields.FieldByName('ImpOtros').AsString; //FLETE
      cantidad := strtoint(FSelProdFact.CantidadEdit.Text);    //CANTIDAD
      iva := QTemp.FieldByName('Tasa').AsFloat;
//      SGFact.Cells[4, Cuenta] := Format('%8.2f', [StrToFloat(FSelProdFact.FloatEdit1.Text) {* (StrToFloat(SGFact.Cells[6, Cuenta]) / 100 + 1) - StrToFloat(SGFact.Cells[2, Cuenta]) }]);  //NG
      precio := StrToFloat(FSelProdFact.FloatEdit1.Text);
//      SGFact.Cells[5, Cuenta] := Format('%8.2f', [StrToFloat(SGFact.Cells[4, Cuenta]) * StrToFloat(SGFact.Cells[3, Cuenta])]); //SUBTOTAL
      subtotal := precio * cantidad;
//      SGFact.Cells[8, Cuenta] := Format('%8.2f', //[QTemp.FieldByName('Costo').AsFloat]); //COSTO
//      [StrToFloat(FSelProdFact.FloatEdit1.Text) *
//        (StrToFloat(SGFact.Cells[6, Cuenta]) / 100 + 1)
//        ]);
      costo := QTemp.FieldByName('Costo').AsFloat;
//      SGFact.Cells[9, Cuenta] := QTemp.FieldByName('IIBB').AsString;// ACTIVIDAD DE MONOTRIBUTO
      iibb := QTemp.FieldByName('IIBB').AsString;

      Q.SQL.Text := 'SELECT * FROM IIBB WHERE CODIGO=' +
//        QuotedStr(SGFact.Cells[9, Cuenta]);
      QuotedStr(iibb);
      Q.Open;
//      SGFact.Cells[10, Cuenta] :=
//        Format('%8.2f', [Q.FieldByName('Porcentaje').AsFloat]);
// PORCENTAJE DE INGRESOS BRUTOS
      iibb_porcentaje := Q.FieldByName('Porcentaje').AsFloat;

      SGFact.Cells[0, Cuenta] := codigo;
      SGFact.Cells[1, Cuenta] := descr;
      SGFact.Cells[3, Cuenta] := IntToStr(cantidad);
      SGFact.Cells[4, Cuenta] := Format('%8.2f', [precio]);
      SGFact.Cells[5, Cuenta] := Format('%8.2f', [subtotal]);
      SGFact.Cells[6, Cuenta] := Format('%8.2f', [iva]);
      SGFact.Cells[8, Cuenta] := Format('%8.2f', [precio]);
      SGFact.Cells[9, Cuenta] := iibb;
      SGFact.Cells[10, Cuenta] := Format('%8.2f', [iibb_porcentaje]);

      Cuenta := Cuenta + 1;
      QTemp.Close;
      Sortgrid(SGFact, 0, 0);
      CalculaTotales;
    end;
    FSelProdFact.Free;
  end;
  SiBitBtn.SetFocus;
end;

end.
