unit VenderF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, DataModule, Grids,
  DBGrids, ValEdit, DateUtils, ComCtrls, Printers, ImprimirDM, OperacionDM,
  IBX.IBCustomDataSet, IBX.IBQuery,Math;

type
  TVenderForm = class(TForm)
    Panel4: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    ClienteLabel: TLabel;
    Label9: TLabel;
    ClienteEdit: TEdit;
    VendedorEdit: TEdit;
    Label16: TLabel;
    VendedorLabel: TLabel;
    FechaDateTimePicker: TDateTimePicker;
    SGFact: TStringGrid;
    TipoRadioGroup: TRadioGroup;
    Label40: TLabel;
    ComboBox1: TComboBox;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    NroChequeEdit: TEdit;
    NroTarjetaEdit: TEdit;
    DetChequeEdit: TEdit;
    DetTarjetaEdit: TEdit;
    FECheque: TEdit;
    FETarjeta: TEdit;
    DiaChequeDateTimePicker: TDateTimePicker;
    FEContado: TEdit;
    Tabla: TIBQuery;
    Q: TIBQuery;
    Panel3: TPanel;
    ProcesarBitBtn: TBitBtn;
    ClienteBitBtn: TBitBtn;
    VendedorBitBtn: TBitBtn;
    AgregarBitBtn: TBitBtn;
    NuevoBitBtn: TBitBtn;
    QuitarBitBtn: TBitBtn;
    CantidadBitBtn: TBitBtn;
    Label24: TLabel;
    FLEPorcDesc: TEdit;
    Label10: TLabel;
    Label3: TLabel;
    PrecioLabel: TLabel;
    Panel2: TPanel;
    SGTotal: TStringGrid;
    GroupBox5: TGroupBox;
    LbSaldo: TLabel;
    GroupBox4: TGroupBox;
    cbTipo: TComboBox;
    Label31: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    FEOtro: TEdit;
    PagareCheckBox: TCheckBox;
    Presupuesto: TCheckBox;
    procedure ClienteBitBtnClick(Sender: TObject);
    procedure RJustifyEdit(var ThisEdit: TEdit);
    procedure TraeNombreCliente;
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
    procedure cbTipoChange(Sender: TObject);
    procedure NuevoBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TraerArticulo(codigoArticulo:string);
    function NetoGravado(costo,ganancia,flete:double):double;
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
    procedure QuitarArticulos;
    { Public declarations }
  end;

type
  TCompartido = record
    Numero: Integer;
    Cadena: String[20];
  end;

  PCompartido = ^TCompartido;

var
  VenderForm: TVenderForm;
  Compartido: PCompartido;
  FicheroM: THandle;

implementation

uses UFBuscaCliente, BuscarCheques, UFBuscaArticulos,
  AgregarCantidad, BuscarVendedor, servicio;
{$R *.dfm}

procedure TVenderForm.QuitarArticulos;
begin
  while Cuenta > 1 do
    QuitarBitBtn.Click; // vaciar articulos
  Nuevo;
end;
procedure TVenderForm.TraerArticulo;
var
NG,IVA,PR : double;
begin
  If Cuenta > 1 then
        SGFact.RowCount := SGFact.RowCount + 1;
      Tabla.Close;
      Tabla.SQL.Text := 'SELECT * FROM "Articulo" ' + 'WHERE CODIGO = ' +
        (codigoArticulo);
      Tabla.Open;
      if PrecioLabel.Caption = '0' then
        PrecioLabel.Caption := '';
      SGFact.Cells[0, Cuenta] := FBuscaArticulo.Tabla.FieldByName('CODIGO').AsString;
      SGFact.Cells[1, Cuenta] := Tabla.FieldByName('DESCRIPCION').AsString;
      // nombre
      SGFact.Cells[2, Cuenta] := '0';
      if  SGFact.Cells[3, Cuenta] ='0' then SGFact.Cells[3, Cuenta] := '1'; // cantidad
      PR := Tabla.FieldByName('PRECIO' + PrecioLabel.Caption).AsFloat;
      SGFact.Cells[4, Cuenta] := FloatToStr(PR);

      // IVA
      IVA := Tabla.FieldByName('TASA').AsFloat;
      SGFact.Cells[6, Cuenta] := FloatToStr(IVA);

      //NETO
//        if IVA = 105 then NG:=RoundTo((100*PR)/110.5,-2) else NG:=RoundTo((100*PR)/(100+IVA),-2);
//        SGFact.Cells[8, Cuenta] := FloatToStr(NG);

//      if FLEPorcDesc.Text<>'0' then  SGFact.Cells[7, Cuenta] :=  FloatToStr( StrToFloat(SGFact.Cells[8, Cuenta]) * (StrToFloat(FLEPorcDesc.Text)/100) )
//      else  SGFact.Cells[7, Cuenta] := '0';

      //Total
       SGFact.Cells[5, Cuenta] := FloatToStr(StrToFloat(SGFact.Cells[4, Cuenta]) * StrToFloat(SGFact.Cells[3, Cuenta]));


      // INGRESOS BRUTOS
      SGFact.Cells[9, Cuenta] := Tabla.FieldByName('IIBB').AsString;
      Q.SQL.Text := 'SELECT * FROM "IIBB" WHERE CODIGO=' +
        QuotedStr(SGFact.Cells[9, Cuenta]);
      Q.Open;

      // PORCENTAJE DE INGRESOS BRUTOS
//      SGFact.Cells[10, Cuenta] :=
//        Format('%8.2f', [Q.FieldByName('PORCENTAJE').AsFloat]);

      //ULTIMO NETO
      SGFact.Cells[11, Cuenta] :=
        FloatToStr(Tabla.FieldByName('ULTCOSTO').AsFloat *
        StrToFloat(SGFact.Cells[3, SGFact.Row])); // PRECIO DE COSTO
      Cuenta := Cuenta + 1;
      CalculaTotales;
end;

procedure TVenderForm.Nuevo;
begin
  SGFact.Cells[0, 0] := 'Codigo';
  SGFact.Cells[1, 0] := 'Descripcion';
  SGFact.Cells[2, 0] := '# Pieza';
  SGFact.Cells[3, 0] := 'Cantidad';
  SGFact.Cells[4, 0] := 'Precio';
  SGFact.Cells[5, 0] := 'Total';
  SGFact.Cells[6, 0] := 'IVA';
  SGFact.Cells[7, 0] := '';
  SGFact.Cells[8, 0] := 'NG';
  SGFact.Cells[9, 0] := 'IIBB';
  SGFact.Cells[10,0] := 'IIBB';
   SGFact.Cells[10,0] := 'UC';
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
  // CUITLabel.Caption := 'C.F.';
  // Label21.Caption := '0';
  FLEPorcDesc.Text := '0';
  costo := 0;
  reparaciones := 0;
  ClienteEdit.Text := '0';
  ClienteLabel.Caption := 'Consumidor Final';
  FEContado.Text := '0';
  FECheque.Text := '0';
  FETarjeta.Text := '0';
  FEOtro.Text := '0';
  Cuenta := 1;
  // si es venta
//  if TipoRadioGroup.ItemIndex = 0 then
//    AgregarBitBtn.Click
//  else
//    // si es Presupuesto
//    if TipoRadioGroup.ItemIndex = 1 then
//    begin
//      ClienteBitBtn.Click;
//      AgregarBitBtn.Click;
//    end
//    else
//      // si es Financiacin
//      if TipoRadioGroup.ItemIndex = 2 then
//      begin
//        ClienteBitBtn.Click;
//        VendedorBitBtn.Click;
//        AgregarBitBtn.Click;
//      end;
//  if Proveedor = True then
//  begin
//    // Label13.Visible := True;
//    // Label14.Visible := True;
//    // Cuenta := 1;
//  end;
  AgregarBitBtn.SetFocus;
end;

procedure TVenderForm.NuevoBitBtnClick(Sender: TObject);
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
      SGFact.Cells[6, Cuenta] := '0';
      SGFact.Cells[8, Cuenta] := '0'; // PRECIO DE COSTO
      SGFact.Cells[9, Cuenta] := '0';
      SGFact.Cells[10, Cuenta] := '0';
      SGFact.Cells[11, Cuenta] := '0'; // PRECIO DE COSTO
      Cuenta := Cuenta + 1;
    end;
    ServForm.Free;
  end;
  CalculaTotales;
  FEContado.SetFocus;
end;

procedure TVenderForm.CalculaTotales;
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
  UltCosto := 0;
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
    IF SGFact.Cells[11, i] <> '0' then UltCosto := UltCosto + StrToFloat(SGFact.Cells[11, i]);
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
  Total := (subtotal + Impuesto - desc + Interes);

  // escribe los valores en las celdas
  SGTotal.Cells[1, 0] := Format('%8.2n', [subtotal]);
  SGTotal.Cells[1, 1] := Format('%8.2n', [desc]);
  SGTotal.Cells[1, 2] := Format('%8.2n', [Impuesto]);
  SGTotal.Cells[1, 3] := Format('%8.2n', [Interes]);
  SGTotal.Cells[1, 4] := Format('%8.2n', [Total]);

  if FEContado.Text = '' then FEContado.Text := '0';
  if FECheque.Text = '' then FECheque.Text := '0';
  if FETarjeta.Text = '' then FETarjeta.Text := '0';
  if FEOtro.Text = '' then FEOtro.Text := '0';

  Pagado := StrToFloat(FEContado.Text) + StrToFloat(FECheque.Text) +
    StrToFloat(FETarjeta.Text) + StrToFloat(FEOtro.Text);
  Saldo := Total - Pagado;
  LbSaldo.Caption := FloatToStr(Saldo);

  FEContado.Text := FloatToStr(Total);
end;

procedure TVenderForm.cbTipoChange(Sender: TObject);
begin
  CalculaTotales;
end;

procedure TVenderForm.RJustifyEdit(var ThisEdit: TEdit);
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

procedure TVenderForm.TraeNombreCliente;
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

procedure TVenderForm.ClienteBitBtnClick(Sender: TObject);
begin
  QuitarArticulos;
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
      // DireccionLabel.Caption := Tabla.FieldByName('DIRECCIONCOMERCIAL').AsString;
      // Label13.Caption := Tabla.FieldByName('TELEFONO').AsString;
      // Label14.Caption := Tabla.FieldByName('CELULAR').AsString;
      PrecioLabel.Caption := Tabla.FieldByName('PRECIO').AsString;
      if PrecioLabel.Caption = '' then
        PrecioLabel.Caption := '0';
      // Label19.Caption := Tabla.FieldByName('TERMINOS').AsString;
      // Label23.Caption := DateToStr(IncDay(now,Tabla.FieldByName('DIASCREDITO').AsInteger));
      VendedorEdit.Text := Tabla.FieldByName('VENDEDOR').AsString;
      // CUITLabel.Caption := Tabla.FieldByName('CUIT').AsString;
      // DocumentoLabel.Caption := Tabla.FieldByName('DOCUMENTO').AsString;
      // CUENTA CLIENTE
      CtaNombre := Tabla.FieldByName('CTANOMBRE').AsString;
      CtaTipo := Tabla.FieldByName('CTATIPO').AsString;
      CtaAnticipo := Tabla.FieldByName('CTAANTICIPO').AsString;
      IF Tabla.FieldByName('PAGARE').AsString = 'SI' THEN
        PagareCheckBox.Checked := True;
      // IVA
      // if (dm.ConfigQuery.FieldByName('IVA').AsString = 'RI') and
      // (Tabla.FieldByName('IVA').AsString = 'RI') then
      // cbTipo.ItemIndex := 0
      // else if (dm.ConfigQuery.FieldByName('IVA').AsString = 'RI') and
      // (Tabla.FieldByName('IVA').AsString <> 'RI') then
      // cbTipo.ItemIndex := 1
      // else if (dm.ConfigQuery.FieldByName('IVA').AsString = 'NR') then
      // cbTipo.ItemIndex := 4
      // else
      // cbTipo.ItemIndex := 2;
      // if ((Tabla.FieldByName('IVA').AsString = 'Responsable Inscripto') or (Tabla.FieldByName('IVA').AsString = 'S.R.L.') or (Tabla.FieldByName('IVA').AsString = 'S.A.') or (Tabla.FieldByName('IVA').AsString = 'Cooperativa')) and (cbTipo.ItemIndex = 1) then cbTipo.ItemIndex := 1;
      if (((Tabla.FieldByName('IVA').AsString = 'Responsable Monotributo') or
        (Tabla.FieldByName('IVA').AsString = 'Exento') or
        (Tabla.FieldByName('IVA').AsString = 'S.A.') or
        (Tabla.FieldByName('IVA').AsString = 'No Responsable')) and
        (cbTipo.ItemIndex = 1)) then
        cbTipo.ItemIndex := 6;

      if TipoRadioGroup.ItemIndex = 0 then
      begin
        DM.Query.Close;
        DM.Query.SQL.Text := 'SELECT * FROM "CtaCte" WHERE CLIENTE=' +
          ClienteEdit.Text;
        DM.Query.Open;
        if Abs(DM.Query.FieldByName('SALDO').AsFloat) > 0.4 then
        begin
          If Cuenta > 1 then
            SGFact.RowCount := SGFact.RowCount + 1;
          SGFact.Cells[0, Cuenta] := '0'; // cdigo
          Deuda := DM.Query.FieldByName('SALDO').AsFloat;
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
          DM.Query.Close;
          FEContado.Text := FloatToStr(Total);
        end;
        Tabla.Active := False;
      end;
      FBuscaCliente.Free;
    end;
    TraeNombreCliente;
    CalculaTotales;
    AgregarBitBtn.SetFocus;
  end;
end;

function TVenderForm.NetoGravado;
begin
  Result := costo + (costo * (flete/100)) + (costo * (ganancia/100));
end;

procedure TVenderForm.AgregarBitBtnClick(Sender: TObject);
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
      TraerArticulo(FBuscaArticulo.Tabla.FieldByName('CODIGO').AsString);
    end;
    FBuscaArticulo.Free;
    Tabla.Close;
    FEContado.SetFocus;
  end;

  //bajar el foco
  PostMessage(SGFact.Handle,WM_KEYDOWN,VK_END,0);
end;

procedure TVenderForm.QuitarBitBtnClick(Sender: TObject);
begin
  SGFact.SetFocus;
  GridRemoveRow(SGFact, SGFact.Row);
  If Cuenta > 1 then
    Cuenta := Cuenta - 1;
  CalculaTotales;
end;

procedure TVenderForm.FLEPorcDescExit(Sender: TObject);
begin
  CalculaTotales;
  FEContado.SetFocus;
end;

procedure TVenderForm.ProcesarBitBtnClick(Sender: TObject);
var
  r, c: Integer;
begin
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

    if Presupuesto.Checked then
      ProcPresup(cbTipo.Text, ClienteEdit.Text,
        FormatDateTime('mm/dd/yyyy hh:mm:ss', FechaDateTimePicker.DateTime),
        VendedorEdit.Text, '', CtaNombre, Presupuesto.Checked,
        PagareCheckBox.Checked, costo, Comision, Impuesto,
        StrToFloat(FECheque.Text), 0, StrToFloat(FEContado.Text), Total,
        subtotal, desc, StrToFloat(FETarjeta.Text), StrToFloat(FEOtro.Text),
        Saldo, Pagado, Interes, NG105, NG21, IVA105, IVA21, Deuda, UltCosto)
    else
      ProcVTA(cbTipo.Text, ClienteEdit.Text,
        FormatDateTime('mm/dd/yyyy hh:mm:ss', FechaDateTimePicker.DateTime),
        VendedorEdit.Text, '', CtaNombre, Presupuesto.Checked,
        PagareCheckBox.Checked, costo, Comision, Impuesto,
        StrToFloat(FECheque.Text), 0, StrToFloat(FEContado.Text), Total,
        subtotal, desc, StrToFloat(FETarjeta.Text), StrToFloat(FEOtro.Text),
        Saldo, Pagado, Interes, NG105, NG21, IVA105, IVA21, Deuda, UltCosto);
  end;
  OperacionDataModule.Free;
  QuitarArticulos;
end;

procedure TVenderForm.CheckBox1Click(Sender: TObject);
begin
  CalculaTotales;
end;

procedure TVenderForm.FormShow(Sender: TObject);
begin

if (reporte='COriginal') or (reporte='CDupicado') or (reporte='CTriplicado')
or (reporte='CCuadruplicado') or (reporte='Ticket')then
  cbTipo.ItemIndex := 0
  else
    begin
      if (dm.ConfigQuery.FieldByName('IVA').AsString = 'Responsable Monotributo')
      then
        cbTipo.ItemIndex := 11
      else if (dm.ConfigQuery.FieldByName('IVA').AsString = 'Responsable Inscripto')
      then
        cbTipo.ItemIndex := 6
      else if (dm.ConfigQuery.FieldByName('IVA').AsString = 'Exento') then
        cbTipo.ItemIndex := 11
      else if (dm.ConfigQuery.FieldByName('IVA').AsString = 'No Responsable') then
        cbTipo.ItemIndex := 14
      else if (dm.ConfigQuery.FieldByName('IVA').AsString = 'S.R.L.') then
        cbTipo.ItemIndex := 6
      else if (dm.ConfigQuery.FieldByName('IVA').AsString = 'S.A.') then
        cbTipo.ItemIndex := 6
      else if (dm.ConfigQuery.FieldByName('IVA').AsString = 'Cooperativa') then
        cbTipo.ItemIndex := 6;
    end;
  Nuevo;
end;

procedure TVenderForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    ClienteBitBtn.Click
  else
    // IF Key = VK_F2 then PlanBitBtn.Click
    // else
    if Key = VK_F3 then
      VendedorBitBtn.Click
    else
      // IF Key = VK_F4 then CobradorBitBtn.Click
      // else
      if Key = VK_F5 then
        AgregarBitBtn.Click
      else if Key = VK_F6 then
        QuitarBitBtn.Click
      else if Key = VK_F7 then
        CantidadBitBtn.Click
      else if Key = VK_F8 then
        NuevoBitBtn.Click
      else if Key = VK_F12 then
        ProcesarBitBtn.Click
//      else if Key = VK_Escape then
//        Close
        ;
end;

procedure TVenderForm.FEContadoChange(Sender: TObject);
begin
  if FEContado.Text <> '' then
    CalculaTotales;
end;

procedure TVenderForm.FEChequeChange(Sender: TObject);
begin
  if FECheque.Text <> '' then
    CalculaTotales;
end;

procedure TVenderForm.FETarjetaChange(Sender: TObject);
begin
  if FETarjeta.Text <> '' then
    CalculaTotales;
end;

procedure TVenderForm.FEOtroChange(Sender: TObject);
begin
  if FEOtro.Text <> '' then
    CalculaTotales;
end;

procedure TVenderForm.FEContadoExit(Sender: TObject);
begin
  ProcesarBitBtn.SetFocus;
end;

procedure TVenderForm.FormCreate(Sender: TObject);
begin
  cbTipo.Items.Add('A'); // 1	Factura A	20100917	NULL
  cbTipo.Items.Add('A'); // 2	Nota de Débito A	20100917	NULL
  cbTipo.Items.Add('A'); // 3	Nota de Crédito A	20100917	NULL
  cbTipo.Items.Add('A'); // 4	Recibos A	20100917	NULL
  cbTipo.Items.Add('A'); // 5	Notas de Venta al contado A	20100917	NULL
  cbTipo.Items.Add('B'); // 6	Factura B	20100917	NULL
  cbTipo.Items.Add('B'); // 7	Nota de Débito B	20100917	NULL
  cbTipo.Items.Add('B'); // 8	Nota de Crédito B	20100917	NULL
  cbTipo.Items.Add('B'); // 9	Recibos B	20100917	NULL
  cbTipo.Items.Add('B'); // 10	Notas de Venta al contado B	20100917	NULL
  cbTipo.Items.Add('C'); // 11	Factura C	20110330	NULL
  cbTipo.Items.Add('C'); // 12	Nota de Débito C	20110330	NULL
  cbTipo.Items.Add('C'); // 13	Nota de Crédito C	20110330	NULL
  cbTipo.Items.Add('X'); // 14	REMITO
  cbTipo.Items.Add('P'); // 14	PRESUPUESTO
  cbTipo.Items.Add('A'); // 63	Liquidacion A	20100917	NULL
  cbTipo.Items.Add('B'); // 64	Liquidacion B	20100917	NULL
  cbTipo.Items.Add('A');
  // 34	Cbtes. A del Anexo I, Apartado A,inc.f),R.G.Nro. 1415	20100917	NULL
  cbTipo.Items.Add('B');
  // 35	Cbtes. B del Anexo I,Apartado A,inc. f),R.G. Nro. 1415	20100917	NULL
  cbTipo.Items.Add('A');
  // 39	Otros comprobantes A que cumplan con R.G.Nro. 1415	20100917	NULL
  cbTipo.Items.Add('B');
  // 40	Otros comprobantes B que cumplan con R.G.Nro. 1415	20100917	NULL
  cbTipo.Items.Add('A'); // 60	Cta de Vta y Liquido prod. A	20100917	NULL
  cbTipo.Items.Add('B'); // 61	Cta de Vta y Liquido prod. B	20100917	NULL
  cbTipo.Items.Add('C'); // 15	Recibo C	20110330	NULL
  cbTipo.Items.Add('C');
  // 49	Comprobante de Compra de Bienes Usados a Consumidor Final	20130904	NULL
  cbTipo.Items.Add('M'); // 51	Factura M	20150522	NULL
  cbTipo.Items.Add('M'); // 52	Nota de Débito M	20150522	NULL
  cbTipo.Items.Add('M'); // 53	Nota de Crédito M	20150522	NULL
  cbTipo.Items.Add('M'); // 54	Recibo M
  dm.ConfigQuery.Open;
end;

procedure TVenderForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end;
end;

procedure TVenderForm.CantidadBitBtnClick(Sender: TObject);
begin
  AgregarCantidadForm := TAgregarCantidadForm.Create(self);
  try
    AgregarCantidadForm.ShowModal;
  finally
    if AgregarCantidadForm.CantidadEdit.Text <> '' then
    begin

      // cantidad
      SGFact.Cells[3, SGFact.Row] := AgregarCantidadForm.CantidadEdit.Text;

      // total
      SGFact.Cells[5, SGFact.Row] :=
      Format('%8.2f', [StrToFloat(SGFact.Cells[4, SGFact.Row]) * StrToFloat(SGFact.Cells[3, SGFact.Row])]);

      // PRECIO DE COSTO
      SGFact.Cells[8, SGFact.Row] :=
        FloatToStr(StrToFloat(SGFact.Cells[8, SGFact.Row]) *
        StrToFloat(SGFact.Cells[3, SGFact.Row]));

      CalculaTotales;
    end;
    AgregarCantidadForm.Free;
  end;
end;

procedure TVenderForm.VendedorBitBtnClick(Sender: TObject);
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

procedure TVenderForm.TraerImpresora;
var
  i: Integer;
begin
  for i := 0 to Printer.Printers.Count - 1 do
    ComboBox1.Items.Add(Printer.Printers[i]);
end;

end.
