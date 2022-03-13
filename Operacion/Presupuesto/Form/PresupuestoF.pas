unit PresupuestoF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, DataModule, Grids,
  DBGrids, ValEdit, DateUtils, ComCtrls, Printers,
  ImprimirDM, OperacionDM, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TPresupuestoForm = class(TForm)
    Panel4: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    ClienteLabel: TLabel;
    Label3: TLabel;
    DireccionLabel: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    PrecioLabel: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    CUITLabel: TLabel;
    ClienteEdit: TEdit;
    ClienteBitBtn: TBitBtn;
    VendedorBitBtn: TBitBtn;
    VendedorEdit: TEdit;
    Label16: TLabel;
    VendedorLabel: TLabel;
    FechaDateTimePicker: TDateTimePicker;
    DocumentoLabel: TLabel;
    SGFact: TStringGrid;
    TipoRadioGroup: TRadioGroup;
    Label40: TLabel;
    ComboBox1: TComboBox;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    NroChequeEdit: TEdit;
    NroTarjetaEdit: TEdit;
    DetChequeEdit: TEdit;
    DetTarjetaEdit: TEdit;
    FECheque: TEdit;
    FETarjeta: TEdit;
    FEOtro: TEdit;
    DiaChequeDateTimePicker: TDateTimePicker;
    FEContado: TEdit;
    SGTotal: TStringGrid;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    QuitarBitBtn: TBitBtn;
    AgregarBitBtn: TBitBtn;
    Label37: TLabel;
    Label38: TLabel;
    CantidadBitBtn: TBitBtn;
    BitBtn7: TBitBtn;
    GroupBox2: TGroupBox;
    NoBitBtn: TBitBtn;
    ProcesarBitBtn: TBitBtn;
    PagareCheckBox: TCheckBox;
    Tabla: TIBQuery;
    Q: TIBQuery;
    Label2: TLabel;
    Label24: TLabel;
    FLEPorcDesc: TEdit;
    Label10: TLabel;
    BitBtn10: TBitBtn;
    GroupBox4: TGroupBox;
    cbTipo: TComboBox;
    GroupBox5: TGroupBox;
    LbSaldo: TLabel;
    Presupuesto: TCheckBox;
    Label4: TLabel;
    procedure ClienteBitBtnClick(Sender: TObject);
    procedure RJustifyEdit(var ThisEdit: TEdit);
    procedure TraeNombreCliente;
    procedure NoBitBtnClick(Sender: TObject);
    procedure AgregarBitBtnClick(Sender: TObject);
    procedure CalculaTotales;
    procedure QuitarBitBtnClick(Sender: TObject);
    procedure FLEPorcDescExit(Sender: TObject);
    procedure ProcesarBitBtnClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FEContadoChange(Sender: TObject);
    procedure FEChequeChange(Sender: TObject);
    procedure FETarjetaChange(Sender: TObject);
    procedure FEOtroChange(Sender: TObject);
    procedure FEContadoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CantidadBitBtnClick(Sender: TObject);
    procedure VendedorBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure cbTipoChange(Sender: TObject);
  private
    { Private declarations }
  public
    OK, Proveedor, FPagoOK: Boolean;
    Cuenta, DiasCalculo, CuotasTotal, d, numfact, OrdTrans: Integer;
    CMV, UltCosto, subtotal, Impuesto, NG21, IVA21, NG105, IVA105, NGO, IVAO,
      desc, costo, reparaciones, Total, IIBB, NGIIBB, Exento,
      ComisionVendedor: Double;
    CtaNombre, CtaTipo, CtaAnticipo, CtaIIBB, code, Dia, Mes, Ano, TDocumento,
      Tiempo, T2, Precio, ChequeCodCheque, ChequeNumero, ChequeDetalle,
      ChequeCodFactura, ChequeMntCheque, ChequeFecha, ChequeDias, Fecha,
      FechaVence, iv, DetalleFactura: string;
    BalanceAnterior, Interes, BalanceTotal, Deuda, Saldo, Pagado,
      Comision: Double;
    Tipo: Char;
    FechaVencimiento: TDate;
    procedure Nuevo;
    procedure TraerImpresora;
    { Public declarations }
  end;

type
  TCompartido = record
    Numero: Integer;
    Cadena: String[20];
  end;

  PCompartido = ^TCompartido;

var
  PresupuestoForm: TPresupuestoForm;
  Compartido: PCompartido;
  FicheroM: THandle;

implementation

uses UFBuscaCliente, BuscarCheques, UFBuscaArticulos,
  AgregarCantidad, BuscarVendedor;
{$R *.dfm}

procedure TPresupuestoForm.Nuevo;
begin
  SGFact.Cells[0, 0] := 'Cdigo';
  SGFact.Cells[1, 0] := 'Descripcin';
  SGFact.Cells[2, 0] := '# Pieza';
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
  SGTotal.Cells[0, 3] := 'Interes';
  SGTotal.Cells[0, 4] := 'TOTAL';
  SGTotal.Cells[0, 5] := 'Saldo';
  SGTotal.Cells[1, 0] := '0.00';
  SGTotal.Cells[1, 1] := '0.00';
  SGTotal.Cells[1, 2] := '0.00';
  SGTotal.Cells[1, 3] := '0.00';
  SGTotal.Cells[1, 4] := '0.00';
  SGTotal.Cells[1, 5] := '0.00';
  Cuenta := 1;
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  FechaDateTimePicker.DateTime := Date;
  subtotal := 0;
  Impuesto := 0;
  desc := 0;
  Total := 0;
  NG21 := 0;
  IVA21 := 0;
  NG105 := 0;
  IVA105 := 0;
  CUITLabel.Caption := 'C.F.';
  Label21.Caption := '0';
  FLEPorcDesc.Text := '0';
  costo := 0;
  reparaciones := 0;
  ClienteEdit.Text := '0';
  ClienteLabel.Caption := 'Consumidor Final';

  FEContado.Text := '0';
  FECheque.Text := '0';
  FETarjeta.Text := '0';
  FEOtro.Text := '0';
  while Cuenta > 1 do
    QuitarBitBtn.Click; // vaciar articulos
  // si es venta
  if TipoRadioGroup.ItemIndex = 0 then
    AgregarBitBtn.Click
  else
    // si es Presupuesto
    if TipoRadioGroup.ItemIndex = 1 then
    begin
      ClienteBitBtn.Click;
      AgregarBitBtn.Click;
    end
    else
      // si es Financiacin
      if TipoRadioGroup.ItemIndex = 2 then
      begin
        ClienteBitBtn.Click;
        VendedorBitBtn.Click;
        AgregarBitBtn.Click;
      end;
  if Proveedor = True then
  begin
    Label13.Visible := True;
    Label14.Visible := True;
    Cuenta := 1;
  end;
end;

procedure TPresupuestoForm.CalculaTotales;
var
  i: Integer;
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
  UltCosto := 0;

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
    IF SGFact.Cells[11, i] <> '' then
      UltCosto := UltCosto + StrToFloat(SGFact.Cells[11, i]);
    // Calcula el Ultimo Costo
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
    If (SGFact.Cells[6, i] = '21') then
    begin
      NG21 := NG21 + StrToFloat(SGFact.Cells[5, i]); // NETO GRABADO 21%
      IVA21 := (IVA21 + Abs((StrToFloat(SGFact.Cells[5, i]) * 1.21) -
        StrToFloat(SGFact.Cells[5, i])));
    end; // IVA 21% 100 * 1.21 - 100 = 21
    IF (SGFact.Cells[6, i] = '10.5') then
    begin
      NG105 := NG105 + StrToFloat(SGFact.Cells[5, i]); // NETO GRABADO 10.5%
      IVA105 := (IVA105 + Abs((StrToFloat(SGFact.Cells[5, i]) * 1.105) -
        StrToFloat(SGFact.Cells[5, i])));
    end; // IVA 10.5% 100 * 1.105 - 100 = 10.5
    IF (SGFact.Cells[6, i] <> '21') and (SGFact.Cells[6, i] <> '10.5') and
      (SGFact.Cells[6, i] <> '0') and (SGFact.Cells[6, i] <> '') then
    begin
      NGO := NGO + StrToFloat(SGFact.Cells[5, i]); // NETO GRABADO
      IVAO := (IVAO + Abs((StrToFloat(SGFact.Cells[5, i]) /
        (StrToFloat(SGFact.Cells[6, i]) * 100 + 1)) -
        StrToFloat(SGFact.Cells[5, i])));
    end; // IVA
  end;

  Impuesto := IVA21 + IVA105 + IVAO;
  subtotal := (subtotal - Impuesto);
  desc := (subtotal * StrToFloat(FLEPorcDesc.Text) / 100);
  Total := (subtotal + Impuesto - desc + Interes);

  // escribe los valores en las celdas
  SGTotal.Cells[1, 0] := Format('%8.2n', [subtotal]);
  SGTotal.Cells[1, 1] := Format('%8.2n', [desc]);
  SGTotal.Cells[1, 2] := Format('%8.2n', [Impuesto]);
  SGTotal.Cells[1, 3] := Format('%8.2n', [Interes]);
  SGTotal.Cells[1, 4] := Format('%8.2n', [Total]);

  if FEContado.Text = '' then
    FEContado.Text := '0';
  if FECheque.Text = '' then
    FECheque.Text := '0';
  if FETarjeta.Text = '' then
    FETarjeta.Text := '0';
  if FEOtro.Text = '' then
    FEOtro.Text := '0';
  Pagado := StrToFloat(FEContado.Text) + StrToFloat(FECheque.Text) +
    StrToFloat(FETarjeta.Text) + StrToFloat(FEOtro.Text);
  Saldo := Total - Pagado;
  LbSaldo.Caption := FloatToStr(Saldo);
end;

procedure TPresupuestoForm.cbTipoChange(Sender: TObject);
begin
  CalculaTotales;
  FEContado.Text := FloatToStr(Total);
end;

procedure TPresupuestoForm.RJustifyEdit(var ThisEdit: TEdit);
var
  Left, Width: Integer;
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

Procedure GridRemoveRow(StrGrid: TStringGrid; DelRow: Integer);
Var
  Row: Integer;
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

procedure TPresupuestoForm.TraeNombreCliente;
begin
  If ClienteEdit.Text <> '' then
  begin
    Tabla.SQL.Text := 'Select * from "Cliente" where CODIGO = ' +
      ClienteEdit.Text;
    Tabla.Active := True;
    If Tabla.RecordCount < 1 then
    begin
      MessageDlg('Cdigo de cliente no existe!', mtError, [mbOK], 0);
      ClienteEdit.SetFocus;
    end;
  end;
end;

procedure TPresupuestoForm.ClienteBitBtnClick(Sender: TObject);
begin
  Deuda := 0;
  FBuscaCliente := TFBuscaCliente.Create(self);
  try
    FBuscaCliente.ShowModal;
  finally
    ClienteEdit.Text := FBuscaCliente.Tabla.FieldByName('CODIGO').AsString;
    with FBuscaCliente do
    begin
      ClienteLabel.Caption := Tabla.FieldByName('NOMBRE').AsString;
      Label3.Caption := Tabla.FieldByName('DIRECCION').AsString;
      DireccionLabel.Caption := Tabla.FieldByName('DIRECCIONCOMERCIAL')
        .AsString;
      Label13.Caption := Tabla.FieldByName('TELEFONO').AsString;
      Label14.Caption := Tabla.FieldByName('CELULAR').AsString;
      PrecioLabel.Caption := Tabla.FieldByName('PRECIO').AsString;
      if PrecioLabel.Caption = '' then
        PrecioLabel.Caption := '0';
      Label19.Caption := Tabla.FieldByName('TERMINOS').AsString;
      Label23.Caption :=
        DateToStr(IncDay(now, Tabla.FieldByName('DIASCREDITO').AsInteger));
      VendedorEdit.Text := Tabla.FieldByName('VENDEDOR').AsString;
      CUITLabel.Caption := Tabla.FieldByName('CUIT').AsString;
      DocumentoLabel.Caption := Tabla.FieldByName('DOCUMENTO').AsString;
      // CUENTA CLIENTE
      CtaNombre := Tabla.FieldByName('CTANOMBRE').AsString;
      CtaTipo := Tabla.FieldByName('CTATIPO').AsString;
      CtaAnticipo := Tabla.FieldByName('CTAANTICIPO').AsString;
      IF Tabla.FieldByName('PAGARE').AsString = 'SI' THEN
        PagareCheckBox.Checked := True;
      // IVA
      if (dm.ConfigQuery.FieldByName('IVA').AsString = 'RI') and
        (Tabla.FieldByName('IVA').AsString = 'RI') then
        cbTipo.ItemIndex := 0
      else if (dm.ConfigQuery.FieldByName('IVA').AsString = 'RI') and
        (Tabla.FieldByName('IVA').AsString <> 'RI') then
        cbTipo.ItemIndex := 1
      else if (dm.ConfigQuery.FieldByName('IVA').AsString = 'NR') then
        cbTipo.ItemIndex := 4
      else
        cbTipo.ItemIndex := 2;
    end;

    if TipoRadioGroup.ItemIndex = 0 then
    begin
      Tabla.Close;
      Tabla.SQL.Text := 'SELECT * FROM "CtaCte" WHERE CLIENTE=' +
        ClienteEdit.Text;
      Tabla.Open;
      if Abs(Tabla.FieldByName('SALDO').AsFloat) > 0.4 then
      begin
        If Cuenta > 1 then
          SGFact.RowCount := SGFact.RowCount + 1;
        SGFact.Cells[0, Cuenta] := '0'; // cdigo
        Deuda := Tabla.FieldByName('SALDO').AsFloat;
        if Deuda > 0 then
          SGFact.Cells[1, Cuenta] := 'Deuda CtaCte'
        else
          SGFact.Cells[1, Cuenta] := 'Saldo a Favor'; // descripcin
        SGFact.Cells[2, Cuenta] := '0'; // serie
        SGFact.Cells[3, Cuenta] := '1'; // cantidad
        SGFact.Cells[4, Cuenta] := Format('%8.2f', [Deuda]); // precio
        SGFact.Cells[5, Cuenta] :=
          Format('%8.2f', [StrToFloat(SGFact.Cells[4, Cuenta]) *
          StrToFloat(SGFact.Cells[3, Cuenta])]); // total
        SGFact.Cells[6, Cuenta] := '0'; // IVA
        SGFact.Cells[9, Cuenta] := '0'; // ACTIVIDAD DE MONOTRIBUTO
        SGFact.Cells[10, Cuenta] := '0'; // PORCENTAJE DE INGRESOS BRUTOS
        Cuenta := Cuenta + 1;
        Tabla.Close;
        FEContado.Text := FloatToStr(Total);
      end;
      Tabla.Active := False;
    end;
    FBuscaCliente.Free;
  end;
  TraeNombreCliente;
  CalculaTotales;
  FEContado.Text := FloatToStr(Total);
  FEContado.SetFocus;
end;

procedure TPresupuestoForm.NoBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPresupuestoForm.AgregarBitBtnClick(Sender: TObject);
begin
  FBuscaArticulo := TFBuscaArticulo.Create(self);
  FBuscaArticulo.Precio := Precio;
  if (TipoRadioGroup.ItemIndex = 0) and
    (dm.ConfigQuery.FieldByName('CodigoBarra').AsString = 'SI') then
    FBuscaArticulo.cb := 'si';
  try
    FBuscaArticulo.ShowModal;
  finally
    If FBuscaArticulo.Tabla.Active = True then
    begin
      If Cuenta > 1 then
        SGFact.RowCount := SGFact.RowCount + 1;
      Tabla.Close;
      Tabla.SQL.Text := 'SELECT * FROM "Articulo" ' + 'WHERE CODIGO = ' +
        (FBuscaArticulo.Tabla.FieldByName('CODIGO').AsString);
      Tabla.Open;
      if PrecioLabel.Caption = '0' then
        PrecioLabel.Caption := '';
      SGFact.Cells[0, Cuenta] := FBuscaArticulo.Tabla.FieldByName
        ('CODIGO').AsString;
      SGFact.Cells[1, Cuenta] := Tabla.FieldByName('DESCRIPCION').AsString;
      // nombre
      SGFact.Cells[2, Cuenta] := '0';
      SGFact.Cells[3, Cuenta] := '1'; // cantidad
      SGFact.Cells[4, Cuenta] :=
        Tabla.FieldByName('PRECIO' + PrecioLabel.Caption).AsString;
      // Format('%8.2f',[StrToFloat(Tabla.FieldByName('Precio'+PrecioLabel.Caption).AsString)]);//precio
      SGFact.Cells[5, Cuenta] := FloatToStr(StrToFloat(SGFact.Cells[4, Cuenta])
        * StrToFloat(SGFact.Cells[3, Cuenta])); // total
      SGFact.Cells[6, Cuenta] := FloatToStr(Tabla.FieldByName('TASA').AsFloat);
      // IVA
      SGFact.Cells[8, Cuenta] := FloatToStr(Tabla.FieldByName('COSTO').AsFloat *
        StrToFloat(SGFact.Cells[3, SGFact.Row])); // PRECIO DE COSTO
      SGFact.Cells[9, Cuenta] := Tabla.FieldByName('IIBB').AsString;
      // INGRESOS BRUTOS
      Q.SQL.Text := 'SELECT * FROM "IIBB" WHERE CODIGO=' +
        QuotedStr(SGFact.Cells[9, Cuenta]);
      Q.Open;
      SGFact.Cells[10, Cuenta] :=
        Format('%8.2f', [Q.FieldByName('PORCENTAJE').AsFloat]);
      // PORCENTAJE DE INGRESOS BRUTOS
      SGFact.Cells[11, Cuenta] :=
        FloatToStr(Tabla.FieldByName('ULTCOSTO').AsFloat *
        StrToFloat(SGFact.Cells[3, SGFact.Row])); // PRECIO DE COSTO
    end;
    FBuscaArticulo.Free;
    Cuenta := Cuenta + 1;
    Tabla.Close;
    CalculaTotales;
    FEContado.Text := FloatToStr(Total);
    FEContado.SetFocus;
  end;
end;

procedure TPresupuestoForm.QuitarBitBtnClick(Sender: TObject);
begin
  GridRemoveRow(SGFact, SGFact.Row);
  If Cuenta > 1 then
    Cuenta := Cuenta - 1;
  CalculaTotales;
  FEContado.Text := FloatToStr(Total);
end;

procedure TPresupuestoForm.FLEPorcDescExit(Sender: TObject);
begin
  CalculaTotales;
end;

procedure TPresupuestoForm.ProcesarBitBtnClick(Sender: TObject);
var
  r, c: Integer;
  impr : Boolean;
begin
  if dm.ConfigQuery.FieldByName('Imprimir').AsString<>'NO' then impr := True;
  c := 0; // columna i
  r := 0; // row j
  OperacionDataModule := TOperacionDataModule.Create(self);
  with OperacionDataModule do
  begin
    SetLength(mat, SGFact.ColCount, SGFact.RowCount);

    for r := 0 to SGFact.RowCount - 1 do
      for c := 0 to SGFact.ColCount - 1 do
      begin
        mat[c, r] := SGFact.Cells[c, r];
      end;
    ProcVTA
//     (cbTipo.Text, ClienteEdit.Text, FormatDateTime('mm/dd/yyyy hh:mm:ss',
//      FechaDateTimePicker.DateTime), VendedorEdit.Text, DocumentoLabel.Caption,
//      CtaNombre, Presupuesto.Checked, PagareCheckBox.Checked, impr, costo, Comision,
//      Impuesto, StrToFloat(FECheque.Text), 0, StrToFloat(FEContado.Text), Total,
//      subtotal, desc, StrToFloat(FETarjeta.Text), StrToFloat(FEOtro.Text),
//      Saldo, Pagado, Interes, NG105, NG21, IVA105, IVA21, Deuda, UltCosto);
      (PuntoVenta, '',
       cbTipo.Text, ClienteEdit.Text,
       FormatDateTime('mm/dd/yyyy hh:mm:ss', FechaDateTimePicker.DateTime),
       VendedorEdit.Text, DocumentoLabel.Caption, CtaNombre, TipoRadioGroup.ItemIndex=1,
       PagareCheckBox.Checked, impr, costo, Comision, Impuesto,
       StrToFloat(FECheque.Text), 0, StrToFloat(FEContado.Text), Total,
       subtotal, desc, StrToFloat(FETarjeta.Text), StrToFloat(FEOtro.Text),
       Saldo, Pagado, Interes, NG105, NG21, IVA105, IVA21, Total - Saldo, UltCosto
       ,NGO , IVAO, Exento, 0, 0, 0, 0, 0, 0, 0)
  end;
  Nuevo;
  { f:= 0;
    c:= 0;
    for c:= 1 to 4 do
    for f:= 1 to 4 do
    begin
    //mat[f,c]:= strtoint(inputbox('Ingrese un Numero','','0'));
    SGFact.s.Cells[f -1 , c -1]:= inttostr(mat[f,c]);
    carga:= mat[f,c];
    end;

    Fecha := (FormatDateTime('mm/dd/yyyy hh:mm:ss', FechaDateTimePicker.DateTime));

    {       // Obtener el numero de factura
    Tabla.SQL.Text := 'Select Max(CODIGO) From "Venta"';
    Tabla.Open;
    If (Tabla.RecordCount = 0) or (Tabla.Fields[0].AsInteger = 0 ) then
    NumFact:=DM.ConfigQuery.FieldByName('NroFactura').AsInteger+1
    else NumFact := Tabla.Fields[0].AsInteger+1;
    Tabla.Close;

    Tabla.SQL.Text := 'Insert Into "Venta" (CODIGO, LETRA, CLIENTE, '+
    ' SUBTOTAL, DESCUENTO, FECHA, '+
    ' IMPUESTO, TOTAL, CONTADO, CHEQUE,'+
    ' TARJETA, OTROS, SALDO, PAGADO '+
    ') Values '+
    '( '+IntToStr(numfact)+', '+QuotedStr(cbTipo.Text)+', '+ClienteEdit.Text+', '+
    ' '+FloatToStr(SubTotal)+', '+QuotedStr(SGTotal.Cells[1,1])+', '+QuotedStr(Fecha)+', '+
    FloatToStr(Impuesto)+', '+FloatToStr(Total)+', '+QuotedStr(FEContado.Text)+', '+QuotedStr(FECheque.Text)+', '+
    QuotedStr(FETarjeta.Text)+', '+QuotedStr(FEOtro.Text)+', '+FloatToStr(Saldo)+', '+FloatToStr(Pagado)+
    ')';
    Tabla.ExecSQL;

    // Insertar en la tabla de VENTAITEM
    For i := 1 to SgFact.RowCount-1 do
    begin

    //CALCULAR IIBB
    q.SQL.Text:='SELECT * FROM "IIBB" WHERE CODIGO='+QuotedStr(SGFact.Cells[9,i]);
    q.Open;
    if Total-Impuesto > q.FieldByName('MONTO').AsFloat then IIBB:=(Total-Impuesto) * (q.FieldByName('COEF1').AsFloat*q.FieldByName('COEF2').AsFloat*q.FieldByName('PORCENTAJE').AsFloat);

    if SGFact.Cells[6,i] = 'Si' then iv:='True)' else iv:='False)';
    Tabla.SQL.Text := 'Insert Into "VentaItem" (VENTA, ARTICULO, CANTIDAD, PRECIO, IMPUESTO, SERVICIO, DESCRIPCION) Values'+
    ' ( '+IntToStr(numfact)+', '+(SGFact.Cells[0,i])+', '+(SGFact.Cells[3,i])+', '+(SGFact.Cells[4,i])+', '+SGFact.Cells[6,i]+', '+IntToStr(numfact)+', '+QuotedStr( SGFact.Cells[1,i])+');';
    Tabla.ExecSQL;
    end;

    if Presupuesto.Checked = False then
    begin
    // Insertar en la tabla de CtaCte
    Q.SQL.Text := 'SELECT * FROM "CtaCte" WHERE CLIENTE = '+ClienteEdit.Text;
    Q.open;
    if (Tabla.RecordCount > 0) and (saldo < 0.05) then Tabla.SQL.Text := 'Update "CtaCte" Set SALDO = '+floattostr(Saldo)+', FECHA = '+QuotedStr(Fecha)+' Where CLIENTE = '+ClienteEdit.Text
    else Tabla.SQL.Text := 'Insert Into "CtaCte" (CLIENTE, SALDO, OPERACION,'+
    ' DESCUENTO, INTERES, FECHA, RENDIDAS) Values ('+
    ClienteEdit.Text+', '+FloatToStr(Saldo)+', '+IntToStr(NumFact)+', '+
    FLEPorcDesc.Text+', '+FloatToStr(Interes)+', '+
    QuotedStr(Fecha)+', 0'+
    ')';
    Tabla.ExecSQL;

    // Insertar en la tabla de CtaCte Item
    if saldo > 0.04 then
    begin
    For i := 1 to SgFact.RowCount-1 do
    begin
    if SGFact.Cells[0,i] <> '1' then detalle:= SGFact.Cells[1,i] else detalle := memo;
    Tabla.SQL.Text := 'Insert Into "CtaCteItem" (OPERACION, CLIENTE,'+
    ' DESCRIPCION, IMPORTE, '+
    ' PAGADO) Values '+
    '( '+IntToStr(NumFact)+','+ClienteEdit.Text+', '+
    QuotedStr(detalle)+','+(SGFact.Cells[5,i])+
    ', 0)';
    Tabla.ExecSQL;
    end;
    end;

    // Insertar en RendidoVendedor
    if VendedorEdit.Text <> '' then
    begin
    Comision:=  round(Total * (Comision/100));
    if Comision = 0 then Comision := 0;
    Tabla.SQL.Text := 'Insert Into "RendidoVendedor" (Vendedor, Venta, Fecha,'+
    ' Importe) Values'+
    ' ('+VendedorEdit.Text+', '+IntToStr(NumFact)+', '+QuotedStr(Fecha)+', '+
    FloatToStr(Comision)+')';
    Tabla.ExecSQL;
    end;
    Comision:=  round(Total * (Comision/100));
    Tabla.SQL.Text := 'Insert Into "RendidoVendedor" (VENDEDOR, VENTA, IMPORTE, FECHA) Values'+
    ' ('+QuotedStr(VendedorEdit.Text)+', '+IntToStr(numfact)+', '+Format('%8.2f', [Comision])+', '+QuotedStr(Fecha)+')';
    Tabla.ExecSQL;

    // Actualizar la tabla de Articulos
    For i := 1 to SgFact.RowCount-1 do
    begin
    Tabla.SQL.Text := 'Update "Articulo" Set DISPONIBLE = DISPONIBLE - '+SGFact.Cells[3,i]+' Where '+
    ' "Articulo".CODIGO = '+(SGFact.Cells[0,i]);
    Tabla.ExecSQL;
    end;

    //CONTABILIDAD+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    // Insertar en el Libro IVA Ventas
    if cbTipo.ItemIndex <> 4 then //en blanco
    begin
    Tabla.SQL.Text := 'Insert Into "LibroIVAventa" (FECHA, FACTURA, CLIENTE, CUIT, NG1, NG2, IVA1, IVA2, ITF) Values ( '+
    QuotedStr(Fecha)+', '+QuotedStr(IntToStr(NumFact))+', '+QuotedStr(ClienteLabel.Caption)+', '+QuotedStr(DocumentoLabel.Caption)+', '+FloatToStr(NG105)+', '+FloatToStr(NG21)+', '+FloatToStr(IVA105)+', '+FloatToStr(IVA21)+', '+(FloatToStr(Total))+')' ;
    Tabla.ExecSQL;
    end;

    //Insertar en la tabla LibroDiario
    //obtener el numero de asiento
    q.SQL.Text := 'Select Max(ASIENTO) From "LibroDiario"';
    q.Open;
    i := q.Fields[0].AsInteger+1;
    q.Close;

    if strtofloat(FEContado.Text) > 0.04 then //PAGO CON EFECTIVO
    begin
    // renglon  - CAJA
    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+dm.ConfigQuery.FieldByName('CtaCaja').AsString;
    q.Open;
    Tabla.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('Venta N'+IntToStr(NumFact)+' - '+(cbTipo.Text)+' - '+(ClienteLabel.Caption)+' - '+(DocumentoLabel.Caption)+'')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', '+FloatToStr(Pagado)+', 0, '+QuotedStr(Oculto)+
    ' )';
    Tabla.ExecSQL;
    end;

    // if strtofloat(FEContado.Text) > 0.04 then //PAGO CON EFECTIVO
    begin
    // renglon  - CAJA
    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+DM.ConfigQuery.FieldByName('CtaCaja').AsString;
    q.Open;

    Tabla.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('Venta N'+IntToStr(NumFact)+' - '+(cbTipo.Text)+' - '+(ClienteLabel.Caption)+' - '+(DocumentoLabel.Caption))+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', '+FEContado.Text+', 0, '+QuotedStr(Oculto)+
    ' )';
    Tabla.ExecSQL;
    //  end;

    if ((Pagado) < Total) AND (PagareCheckBox.Checked<>TRUE)then //CUENTA CORRIENTE
    begin
    // renglon  - DEUDORES POR VENTA

    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+CtaNombre;
    q.Open;
    Tabla.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('Venta N'+IntToStr(NumFact)+' - '+(cbTipo.Text)+' - '+(ClienteLabel.Caption)+' - '+(DocumentoLabel.Caption)+'')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', '+FloatToStr(Total-Pagado)+', 0, '+QuotedStr(Oculto)+
    ' )';
    Tabla.ExecSQL;
    end;

    if (Pagado < Total) AND (PagareCheckBox.Checked=TRUE) then //CON DOCUMENTOS (PAGARE)
    begin
    // renglon  - DOCUMENTOS A COBRAR

    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+DM.ConfigQuery.FieldByName('CtaDocumentoACobrar').AsString;
    q.Open;
    Tabla.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('Venta N'+IntToStr(NumFact)+' - '+(cbTipo.Text)+' - '+(ClienteLabel.Caption)+' - '+(DocumentoLabel.Caption)+'')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', '+FloatToStr(Total-(Pagado))+', 0, '+QuotedStr(Oculto)+
    ' )';
    Tabla.ExecSQL;
    end;

    if strtofloat(FECheque.Text) > 0.04 then //PAGO CON CHEQUE
    begin
    // renglon  - VALORES AL COBRO

    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+DM.ConfigQuery.FieldByName('CtaValorAlCobro').AsString;
    q.Open;
    Tabla.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('Venta N'+IntToStr(NumFact)+' - '+(cbTipo.Text)+' - '+(ClienteLabel.Caption)+' - '+(DocumentoLabel.Caption)+'')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', '+FECheque.Text+', 0, '+QuotedStr(Oculto)+
    ' )';
    Tabla.ExecSQL;
    end;

    if cbTipo.ItemIndex = 0 then //si es factura A
    begin
    // renglon  - IVA DEBITO FISCAL

    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+DM.ConfigQuery.FieldByName('CtaIVADebitoFiscal').AsString;
    q.Open;
    Tabla.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('Venta N'+IntToStr(NumFact)+' - '+(cbTipo.Text)+' - '+(ClienteLabel.Caption)+' - '+(DocumentoLabel.Caption)+'')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', 0, '+FloatToStr(Impuesto)+', '+QuotedStr(Oculto)+
    ' )';
    Tabla.ExecSQL;
    end;

    if (( pagado ) > (total-Deuda)) then //PAGO DE CUENTA CORRIENTE
    begin
    // renglon  - DEUDORES POR VENTA

    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+CtaNombre;
    q.Open;
    Tabla.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('Venta N'+IntToStr(NumFact)+' - '+(cbTipo.Text)+' - '+(ClienteLabel.Caption)+' - '+(DocumentoLabel.Caption)+'')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', 0, '+FloatToStr( pagado -(total-Deuda))+', '+QuotedStr(Oculto)+
    ' )';
    Tabla.ExecSQL;
    end;

    // renglon  - VENTAS
    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+dm.ConfigQuery.FieldByName('CtaVenta').AsString;
    q.Open;
    Tabla.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('Venta N'+IntToStr(NumFact)+' - '+(cbTipo.Text)+' - '+(ClienteLabel.Caption)+' - '+(DocumentoLabel.Caption)+'')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', 0, '+FloatToStr(Total)+', '+QuotedStr(Oculto)+
    ' )';
    Tabla.ExecSQL;

    //COSTO DE MERCADERIAS VENDIDAS
    if dm.ConfigQuery.FieldByName('CMV').AsString = 'PPP' then CMV := ((UltCosto + Costo) / 2)
    else if dm.ConfigQuery.FieldByName('CMV').AsString = 'FIFO' then CMV := UltCosto
    else {if CostoMercaderiaVendida = 'LIFO' then CMV := Costo;

    // renglon  - CMV
    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+dm.ConfigQuery.FieldByName('CtaCMV').AsString;
    q.Open;
    c:=c+1;
    Tabla.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('Venta N'+IntToStr(NumFact)+' - '+(cbTipo.Text)+' - '+(ClienteLabel.Caption)+' - '+(DocumentoLabel.Caption)+'')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', '+FloatToStr(CMV)+', 0, '+QuotedStr(Oculto)+
    ' )';
    Tabla.ExecSQL;

    // renglon  - MERCADERIAS DE REVENTA
    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+dm.ConfigQuery.FieldByName('CtaMercaderia').AsString;
    q.Open;
    c:=c+1;
    Tabla.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('Venta N'+IntToStr(NumFact)+' - '+(cbTipo.Text)+' - '+(ClienteLabel.Caption)+' - '+(DocumentoLabel.Caption)+'')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', 0, '+FloatToStr(CMV)+', '+QuotedStr(Oculto)+
    ' )';
    Tabla.ExecSQL;

    //CALCULO DE COMISION VENDEDOR

    // renglon  - COMISION VENDEDOR
    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+DM.ConfigQuery.FieldByName('CtaComisionVendedor').AsString;
    q.Open;

    Tabla.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('Venta N'+IntToStr(NumFact)+' - '+(cbTipo.Text)+' - '+(ClienteLabel.Caption)+' - '+(DocumentoLabel.Caption)+'')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', '+FloatToStr(Comision)+', 0, '+QuotedStr(Oculto)+
    ' )';
    Tabla.ExecSQL;

    // renglon  - COMISION VENDEDOR A PAGAR
    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+DM.ConfigQuery.FieldByName('CtaComisionVendedorAPagar').AsString;
    q.Open;

    Tabla.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('Venta N'+IntToStr(NumFact)+' - '+(cbTipo.Text)+' - '+(ClienteLabel.Caption)+' - '+(DocumentoLabel.Caption)+'')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', 0, '+FloatToStr(Comision)+', '+QuotedStr(Oculto)+
    ' )';
    Tabla.ExecSQL;

    end;
    //CONTABILIDAD---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    // Completa la Transaccion
    //Tabla.Transaction.Commit;

    // Imprime la factura si el usuario quiere
    if ((dm.ConfigQuery.FieldByName('Imprimir').AsString) <> 'NO') then
    begin
    ImprimirDataModule:=TImprimirDataModule.Create(self);
    with ImprimirDataModule do
    begin

    ImprimirDataModule.Query.SQL.Text:='SELECT '+QuotedStr(dm.ConfigQuery.FieldByName('NOMBRE').AsString)+' As Empresa,'+
    '  "Cliente".NOMBRE,'+
    '  "Cliente".TITULAR,'+
    '  "Cliente".DIRECCION,'+
    '  "Cliente".DIRECCIONCOMERCIAL,'+
    '  "Articulo".DESCRIPCION,'+
    '  "VentaItem".VENTA,'+
    '  "VentaItem".ARTICULO,'+
    '  "VentaItem".CANTIDAD,'+
    '  "VentaItem".PRECIO,'+
    '  ("VentaItem".PRECIO * "VentaItem".CANTIDAD ) as PREXCANT,'+
    '  "VentaItem".SERVICIO,'+
    '  "VentaItem".DESCRIPCION AS DESCR,'+
    '  "Venta".CODIGO,'+
    '  "Venta".LETRA,'+
    '  "Venta".FECHA,'+
    '  "Venta".COMPROBANTE,'+
    '  "Venta".IVA3,'+
    '  "Venta".TOTAL,'+
    '  "Venta".CONTADO,'+
    '  "Venta".CLIENTE,'+
    '  "Venta".SUBTOTAL,'+
    '  "Venta".DESCUENTO,'+
    '  "Venta".IMPUESTO,'+
    '  "Venta".IVA2,'+
    '  "Venta".IVA1,'+
    '  "Venta".EXCENTO,'+
    '  "Venta".SALDO,'+
    '  "Venta".PAGADO'+
    ' FROM'+
    '  "Venta"'+
    '  INNER JOIN "VentaItem" ON ("Venta".CODIGO = "VentaItem".VENTA)'+
    '  INNER JOIN "Articulo" ON ("VentaItem".ARTICULO = "Articulo".CODIGO)'+
    '  INNER JOIN "Cliente" ON ("Venta".CLIENTE = "Cliente".CODIGO)'+
    ' WHERE'+
    '  ("Venta".CODIGO = '+IntToStr(numfact)+' ) AND'+
    '  ("Venta".LETRA = '+QuotedStr(cbTipo.Text)+' )'+
    '';
    ImprimirDataModule.Query.Open;
    RvProject.ProjectFile:=Path+dm.ConfigQuery.FieldByName('Reporte').AsString;
    RvProject.Execute;
    RvProject.Close;
    ImprimirDataModule.Free;
    end;
    end;

  }
  // Imprime la factura si el usuario quiere
end;

procedure TPresupuestoForm.CheckBox1Click(Sender: TObject);
begin
  CalculaTotales;
end;

procedure TPresupuestoForm.FormShow(Sender: TObject);
begin
  if (dm.ConfigQuery.FieldByName('IVA').AsString = 'RI') then
    cbTipo.ItemIndex := 1
  else
    cbTipo.ItemIndex := 2;
  Nuevo;
end;

procedure TPresupuestoForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = VK_F1 then
    ClienteBitBtn.Click;

  IF Key = VK_F3 then
    VendedorBitBtn.Click;

  IF Key = VK_F5 then
    AgregarBitBtn.Click;
  IF Key = VK_F6 then
    QuitarBitBtn.Click;
  IF Key = VK_F7 then
    CantidadBitBtn.Click;

  IF Key = VK_F12 then
    ProcesarBitBtn.Click;
  IF Key = VK_Escape then
    NoBitBtn.Click;
end;

procedure TPresupuestoForm.FEContadoChange(Sender: TObject);
begin
  if FEContado.Text <> '' then
    CalculaTotales;
end;

procedure TPresupuestoForm.FEChequeChange(Sender: TObject);
begin
  if FECheque.Text <> '' then
    CalculaTotales;
end;

procedure TPresupuestoForm.FETarjetaChange(Sender: TObject);
begin
  if FETarjeta.Text <> '' then
    CalculaTotales;
end;

procedure TPresupuestoForm.FEOtroChange(Sender: TObject);
begin
  if FEOtro.Text <> '' then
    CalculaTotales;
end;

procedure TPresupuestoForm.FEContadoExit(Sender: TObject);
begin
  ProcesarBitBtn.SetFocus;
end;

procedure TPresupuestoForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end;
end;

procedure TPresupuestoForm.CantidadBitBtnClick(Sender: TObject);
begin
  AgregarCantidadForm := TAgregarCantidadForm.Create(self);
  try
    AgregarCantidadForm.ShowModal;
  finally
    if AgregarCantidadForm.CantidadEdit.Text <> '' then
    begin
      SGFact.Cells[3, SGFact.Row] := AgregarCantidadForm.CantidadEdit.Text;
      // cantidad
      SGFact.Cells[5, SGFact.Row] :=
        Format('%8.2f', [StrToFloat(SGFact.Cells[4, SGFact.Row]) *
        StrToFloat(SGFact.Cells[3, SGFact.Row])]); // total
      SGFact.Cells[8, SGFact.Row] :=
        FloatToStr(StrToFloat(SGFact.Cells[8, SGFact.Row]) *
        StrToFloat(SGFact.Cells[3, SGFact.Row])); // PRECIO DE COSTO
      CalculaTotales;
      FEContado.Text := FloatToStr(Total);
    end;
    AgregarCantidadForm.Free;
  end;
end;

procedure TPresupuestoForm.VendedorBitBtnClick(Sender: TObject);
begin
  BuscarVendedorForm := TBuscarVendedorForm.Create(self);
  try
    BuscarVendedorForm.ShowModal;
  finally
    VendedorEdit.Text := BuscarVendedorForm.Tabla.FieldByName('CODIGO')
      .AsString;
    VendedorLabel.Caption := BuscarVendedorForm.Tabla.FieldByName
      ('NOMBRE').AsString;
    Comision := BuscarVendedorForm.Tabla.FieldByName('COMISION').AsFloat;
    BuscarVendedorForm.Free;
  end;
end;

procedure TPresupuestoForm.TraerImpresora;
var
  i: Integer;
begin
  for i := 0 to Printer.Printers.Count - 1 do
    ComboBox1.Items.Add(Printer.Printers[i]);
end;

procedure TPresupuestoForm.FormCreate(Sender: TObject);
begin
  // dm := TDM.Create(self);
  dm.ConfigQuery.Open;
end;

procedure TPresupuestoForm.BitBtn10Click(Sender: TObject);
begin
  CalculaTotales;
  FEContado.Text := FloatToStr(Total);
end;

end.
