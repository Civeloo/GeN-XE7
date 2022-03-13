unit OperacionF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, DataModule, Grids,
  DBGrids, ValEdit, DateUtils, ComCtrls, Printers, ImprimirDM, OperacionDM,
  IBX.IBCustomDataSet, IBX.IBQuery,Math;

type
  TOperacionForm = class(TForm)
    pPago: TPanel;
    Panel1: TPanel;
    ClienteLabel: TLabel;
    ClienteEdit: TEdit;
    VendedorEdit: TEdit;
    Label16: TLabel;
    VendedorLabel: TLabel;
    FechaDateTimePicker: TDateTimePicker;
    SGFact: TStringGrid;
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
    Panel3: TPanel;
    ProcesarBitBtn: TBitBtn;
    ClienteBitBtn: TBitBtn;
    VendedorBitBtn: TBitBtn;
    AgregarBitBtn: TBitBtn;
    NuevoBitBtn: TBitBtn;
    QuitarBitBtn: TBitBtn;
    CantidadBitBtn: TBitBtn;
    lPrecio: TLabel;
    PrecioLabel: TLabel;
    Panel2: TPanel;
    SGTotal: TStringGrid;
    GroupBox5: TGroupBox;
    LbSaldo: TLabel;
    GroupBox4: TGroupBox;
    cbTipo: TComboBox;
    Label31: TLabel;
    Label2: TLabel;
    FEOtro: TEdit;
    PagareCheckBox: TCheckBox;
    ComprobanteEdit: TEdit;
    DescuentoBitBtn: TBitBtn;
    TotalLabel: TLabel;
    Label8: TLabel;
    EmailEdit: TEdit;
    Label10: TLabel;
    CuitEdit: TEdit;
    EnviarEmailCheckBox: TCheckBox;
    Label11: TLabel;
    TipoRadioGroup: TRadioGroup;
    PuntoVentaEdit: TEdit;
    bRetPer: TButton;
    NotasBitBtn: TBitBtn;
    procedure ClienteBitBtnClick(Sender: TObject);
    procedure RJustifyEdit(var ThisEdit: TEdit);
    procedure AgregarBitBtnClick(Sender: TObject);
    procedure QuitarBitBtnClick(Sender: TObject);
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
    procedure PercEditExit(Sender: TObject);
    procedure DescuentoBitBtnClick(Sender: TObject);
    procedure EnviarEmailCheckBoxClick(Sender: TObject);
    procedure bRetPerClick(Sender: TObject);
    procedure ComprobanteEditExit(Sender: TObject);
    procedure NotasBitBtnClick(Sender: TObject);
  private
    { Private declarations }
    salir : Boolean;
    procedure Nuevo;
    procedure TraerRemito(codigo: string);
    procedure TraerArticulo(codigoArticulo:string; PR,CAN,DES:Double);
    procedure TraeNombreCliente;
    procedure CalculaTotales;
    function NetoGravado(costo,ganancia,flete:double):double;
  public
  { Public declarations }
    OK, Proveedor, FPagoOK, Compra, Pedido: Boolean;
    Cuenta, DiasCalculo, CuotasTotal, d, numfact, OrdTrans, wc: Integer;
     CMV, UltCosto, subtotal, Impuesto, NG21, IVA21, NG105, IVA105, NGO, IVAO,
     desc, costo, reparaciones, Total, IIBB, NGIIBB, Exento,
     ComisionVendedor, BalanceAnterior, Interes, BalanceTotal, Deuda, Saldo, Pagado,
     Comision, noGra, pagCueIva, pagCueOtr, perIIBB, perImpMun, impInt, otrTrib
    ,envio :Double;
    CtaNombre, CtaTipo, CtaAnticipo, CtaIIBB, code, Dia, Mes, Ano, TDocumento,
      Tiempo, T2, Precio, ChequeCodCheque, ChequeNumero, ChequeDetalle,
      ChequeCodFactura, ChequeMntCheque, ChequeFecha, ChequeDias, Fecha,
      FechaVence, iv, DetalleFactura, notas: string;
    Tipo: Char;
    FechaVencimiento: TDate;
    codRem : String;
    procedure TraerImpresora;
    procedure QuitarArticulos;
  end;

type
  TCompartido = record
    Numero: Integer;
    Cadena: String[20];
  end;

  PCompartido = ^TCompartido;

var
  OperacionForm: TOperacionForm;
  Compartido: PCompartido;
  FicheroM: THandle;

implementation

uses UFBuscaCliente, UFBuscaArticulos,
  AgregarCantidad, BuscarVendedor, UFBuscaProve, UFSelProdFact, DescuentoF,
  ufRetPerc, NotasFormUnit;
{$R *.dfm}

procedure TOperacionForm.QuitarArticulos;
begin
  while Cuenta > 1 do
    QuitarBitBtn.Click; // vaciar articulos
//  Nuevo;
end;

procedure TOperacionForm.TraerArticulo;
var
  TASA : String;
  p,c :Double;
begin
  if Cuenta > 1 then SGFact.RowCount := SGFact.RowCount + 1;
  dm.qOperacion.Close;
  dm.qOperacion.SQL.Text := 'SELECT * FROM "Articulo" WHERE CODIGO = ' + codigoArticulo;
  if codigoArticulo <> '' then dm.qOperacion.Open;
  if dm.qOperacion.RecordCount < 1 then
    begin
//      MessageDlg('¡El código no existe!', mtError, [mbOK], 0);
      ShowMessage('¡El código no existe!');
      AgregarBitBtn.SetFocus;
    end
  else
    begin
      {codigo}SGFact.Cells[0, Cuenta] := dm.qOperacion.FieldByName('CODIGO').AsString;
      {nombre}SGFact.Cells[1, Cuenta] := dm.qOperacion.FieldByName('DESCRIPCION').AsString;
      {cantidad}SGFact.Cells[3, Cuenta] := FloatToStr(CAN);
      if PR=0 then PR := dm.qOperacion.FieldByName('PRECIO' + PrecioLabel.Caption).AsFloat;
      {precio}SGFact.Cells[4, Cuenta] := Format('%8.2f', [(PR)]);
      TASA := dm.qOperacion.FieldByName('TASA').AsString;
      {iva}SGFact.Cells[6, Cuenta] := dm.TraerValor('Iva', 'TASA', TASA);
      {tot}SGFact.Cells[5, Cuenta] := Format('%8.2f', [(PR * CAN)]);
      {descuento}SGFact.Cells[7, Cuenta] := FloatToStr(DES);
      Cuenta := Cuenta + 1;
      FEContado.Text:='0';
      CalculaTotales;
    end;
end;

procedure TOperacionForm.Nuevo;
begin
  QuitarArticulos;
  SGFact.Cells[0, 0] := 'Codigo';
  SGFact.Cells[1, 0] := 'Descripcion';
  SGFact.Cells[2, 0] := '# Pieza';
  SGFact.Cells[3, 0] := 'Cantidad';
  SGFact.Cells[4, 0] := 'Precio';
  SGFact.Cells[5, 0] := 'Total';
  SGFact.Cells[6, 0] := 'Tasa';
  SGFact.Cells[7, 0] := 'Descuento';
  SGFact.Cells[8, 0] := 'NG';
  SGFact.Cells[9, 0] := 'IIBB';
  SGFact.Cells[10,0] := 'IVA';
  SGFact.Cells[3, 1] := '0';
  SGFact.Cells[4, 1] := '0.00';
  SGFact.Cells[5, 1] := '0.00';
  SGTotal.Cells[0, 0] := 'DESCUENTO';
  SGTotal.Cells[0, 1] := 'INTERES';
  SGTotal.Cells[0, 2] := 'ENVIO';
  SGTotal.Cells[0, 3] := 'NETO';
  SGTotal.Cells[0, 4] := 'IMPUESTO';
  SGTotal.Cells[0, 5] := 'TOTAL';
//  SGTotal.Cells[0, 6] := 'Saldo';
  SGTotal.Cells[1, 0] := '0.00';
  SGTotal.Cells[1, 1] := '0.00';
  SGTotal.Cells[1, 2] := '0.00';
  SGTotal.Cells[1, 3] := '0.00';
  SGTotal.Cells[1, 4] := '0.00';
  SGTotal.Cells[1, 5] := '0.00';
//  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  FechaDateTimePicker.DateTime := Date;
  subtotal := 0;
  Impuesto := 0;
  desc := 0;
  Total := 0;
  NG21 := 0;
  IVA21 := 0;
  NG105 := 0;
  IVA105 := 0;
  costo := 0;
  reparaciones := 0;
  ClienteEdit.Text := '0';
  ClienteLabel.Caption := 'Consumidor Final';
  CuitEdit.Text:='';
  EmailEdit.Text:='';
  ComprobanteEdit.Text:='';
  FEContado.Text := '0';
  FECheque.Text := '0';
  FETarjeta.Text := '0';
  FEOtro.Text := '0';
  Cuenta := 1;
  LbSaldo.Caption:='0.00';
  envEmail:=False;
  EnviarEmailCheckBox.Checked:=False;
  Comision := 0;
  envio := 0;
  notas := '';
  wc := 0;
end;

procedure TOperacionForm.NuevoBitBtnClick(Sender: TObject);
begin
//  ServForm := TServForm.Create(self);
//  try
//    ServForm.ShowModal;
//  finally
//    If ServForm.DescripcionEdit.Text <> '' then
//    begin
//      if Cuenta > 1 then
//        SGFact.RowCount := SGFact.RowCount + 1;
//      SGFact.Cells[0, Cuenta] := ServForm.cod;
//      SGFact.Cells[1, Cuenta] := ServForm.DescripcionEdit.Text;
//      SGFact.Cells[2, Cuenta] := '0';
//      SGFact.Cells[3, Cuenta] := '1'; // cantidad
//      SGFact.Cells[4, Cuenta] := ServForm.PrecioEdit.Text;
//      SGFact.Cells[5, Cuenta] := FloatToStr(StrToFloat(SGFact.Cells[4, Cuenta])
//        * StrToFloat(SGFact.Cells[3, Cuenta])); // total
//      SGFact.Cells[6, Cuenta] := '0';
//      SGFact.Cells[7, Cuenta] := '0';
//      SGFact.Cells[8, Cuenta] := '0'; // PRECIO DE COSTO
//      SGFact.Cells[9, Cuenta] := '0';
//      SGFact.Cells[10, Cuenta] := '0';
//      SGFact.Cells[11, Cuenta] := '0'; // PRECIO DE COSTO
//      Cuenta := Cuenta + 1;
//    end;
//    ServForm.Free;
//  end;
//  FEContado.Text:='0';
//  CalculaTotales;
//  FEContado.SetFocus;
end;

procedure TOperacionForm.bRetPerClick(Sender: TObject);
begin
  fRetPerc := TfRetPerc.Create(Self);
  with fRetPerc do begin
    try
      eNoGra.Text := FloatToStr(noGra);
      ePagCueIva.Text := FloatToStr(pagCueIva);
      ePagCueOtr.Text := FloatToStr(pagCueOtr);
      ePerIIBB.Text := FloatToStr(perIIBB);
      ePerImpMun.Text := FloatToStr(perImpMun);
      eImpInt.Text := FloatToStr(impInt);
      eOtrTrib.Text := FloatToStr(otrTrib);
      ShowModal;
    finally
      noGra := StrToFloat(eNoGra.Text);
      pagCueIva := StrToFloat(ePagCueIva.Text);
      pagCueOtr := StrToFloat(ePagCueOtr.Text);
      perIIBB := StrToFloat(ePerIIBB.Text);
      perImpMun := StrToFloat(ePerImpMun.Text);
      impInt := StrToFloat(eImpInt.Text);
      otrTrib := StrToFloat(eOtrTrib.Text);
      Free;
    end;
  end;
  FEContado.Text := '0';
  CalculaTotales;
end;

procedure TOperacionForm.CalculaTotales;
var
  i: Integer;
  NG,NE,DSC,NGD,IVA,CONT,PR,PRD,TOT,CAN,TIVA,RP : Double;
  des : string;
  esA, esB, esC : Boolean;
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
//  DSC := 0;
  NGD :=0;
  IVA :=0;
  if FEContado.Text='' then FEContado.Text:='0';
  CONT := StrToFloat( FEContado.Text );
  PR:=0;
//  if (cbTipo.ItemIndex<6) then esA := True;
  esA := (cbTipo.ItemIndex<5);
//  if (cbTipo.ItemIndex>5) and (cbTipo.ItemIndex<11) then esB:=true;
  esB := ((cbTipo.ItemIndex>4) and (cbTipo.ItemIndex<10));
//  if (cbTipo.ItemIndex>10) and (cbTipo.ItemIndex<15) then esC:=true;
  esC := ((cbTipo.ItemIndex>9) and (cbTipo.ItemIndex<14));
  dm.VaciarMtIVA;
  For i := 1 to SGFact.RowCount - 1 do
  begin
    //CANTIDAD
    if (SGFact.Cells[3, i] = '') then SGFact.Cells[3, i] := '1';
    CAN := StrToFloat(SGFact.Cells[3, i]);
    // TASA
    if (SGFact.Cells[6, i] = '') then TIVA := 0
    else TIVA := StrToFloat(SGFact.Cells[6, i]);
    //PRECIO
    if (SGFact.Cells[4, i] = '') then SGFact.Cells[4, i] := '0';
    PR := StrToFloat(SGFact.Cells[4, i]);
//    if not((cbTipo.ItemIndex = 29) or (cbTipo.ItemIndex = 11)) then PR := OperacionDataModule.CalcularIVA((PR),TIVA);
//    if esB then PR := dm.CalcularIVA((PR),TIVA);//es B
    //TOTAL
    if (SGFact.Cells[5, i] = '') then SGFact.Cells[5, i] := '0';
    TOT := StrToFloat(SGFact.Cells[5, i]);
    //DESCUENTO
    if (SGFact.Cells[7, i] = '') then SGFact.Cells[7, i] := '0';
    DSC := StrToFloat(SGFact.Cells[7, i]);
    //IVA
    if Compra then TOT := TOT - DSC;
    NG:=TOT;
    //CalcularDescuento
//    if DSC>0 then
    begin
      if (esA or esB) then
      begin

        //if esA then IVA := dm.CalcularIVA((NG),TIVA)-NG
        //else if esB then
        IVA := dm.CalcularIVA((NG),TIVA)-NG;//dm.SacarIVA((NG),TIVA);
 //       SGFact.Cells[10, i] := FloatToStr(IVA);

        TOT := NG+IVA;
        if not Compra then TOT := TOT-DSC;
        IVA := dm.SacarIVA((TOT),TIVA);
        NG := TOT-IVA;
      end
//      else if esB then
//      begin
//        TOT:=NG+IVA;
//        TOT:=TOT-DSC;
//        IVA := dm.SacarIVA((TOT),TIVA);
//        NG:=TOT-IVA;
//      end
      else if not Compra then NG := TOT-DSC;

      SGFact.Cells[10, i] := FloatToStr(IVA);
    end;
    // NG
    //if esB then NG := NG - IVA;
    SGFact.Cells[8, i] := FloatToStr(NG);
    //
    if (SGFact.Cells[9, i] = '') then SGFact.Cells[9, i] := '0';
    if SGFact.Cells[9, i] <> '0' then reparaciones := reparaciones + StrToFloat(SGFact.Cells[9, i]);
//    // Calcula el Ultimo Costo
//    if (SGFact.Cells[11, i] = '') then SGFact.Cells[11, i] := '0';
//    if SGFact.Cells[11, i] <> '0' then UltCosto := UltCosto + StrToFloat(SGFact.Cells[11, i]);
    if (not esC) then dm.AgregarMtIva(TIVA,RoundTo(NG,-2),RoundTo(IVA,-2));
  // Calcula el monto para cobrar el impuesto de ventas
    if ((cbTipo.ItemIndex = 28) or (cbTipo.ItemIndex = 10)) then
    begin
      NGO:= NGO + NG;
    end
    else
    begin
      If TIVA = 21 then
      begin
        NG21 := NG21 + NG;
        IVA21 := IVA21 + IVA;
      end
      else
      if TIVA = 10.5 then
        begin
          NG105 := NG105 + NG;
          IVA105 := IVA105 + IVA;
        end
        else
//        if TIVA = 0 then
//        begin
//          NE := NE + NG;
//        end
//        else
        begin
          NGO := NGO + NG;
          IVAO := IVAO + IVA;
        end;
    end;
    desc:= desc + DSC;
    end;

  if (Comision>0) then
  begin
    TOT := Comision;
    IVA := dm.SacarIVA(TOT,21);
    NG := TOT-IVA;
    NG21 := NG21 + NG;
    IVA21 := IVA21 + IVA;
    if (not esC) then dm.AgregarMtIva(TIVA,RoundTo(NG,-2),RoundTo(IVA,-2));
  end;

  if (envio>0) then
  begin
    TOT := envio;
    IVA := dm.SacarIVA(TOT,21);
    NG := TOT-IVA;
    NG21 := NG21 + NG;
    IVA21 := IVA21 + IVA;
    if (not esC) then dm.AgregarMtIva(TIVA,RoundTo(NG,-2),RoundTo(IVA,-2));
  end;

  Exento := RoundTo(NE,-2);
  NG21 := RoundTo(NG21,-2);
  NG105 := RoundTo(NG105,-2);
  NGO := RoundTo(NGO,-2);
  IVA21 := RoundTo(IVA21,-2);
  IVA105 := RoundTo(IVA105,-2);
  IVAO := RoundTo(IVAO,-2);
  desc :=  RoundTo((desc),-2);

  Interes := Comision;

  RP := RoundTo((pagCueIva + pagCueOtr + perIIBB + perImpMun + impInt + otrTrib + noGra),-2);

  subtotal:= RoundTo((NG21 + NG105 + NGO + Exento ),-2);

  Impuesto := RoundTo((IVA21 + IVA105 + IVAO),-2);

  Total := RoundTo((subtotal + Impuesto + RP),-2);

  // escribe los valores en las celdas
  SGTotal.Cells[1, 0] := Format('%8.2n', [desc]);
  SGTotal.Cells[1, 1] := Format('%8.2n', [Interes]);
  SGTotal.Cells[1, 2] := Format('%8.2n', [envio]);
  SGTotal.Cells[1, 3] := Format('%8.2n', [subtotal]);
  SGTotal.Cells[1, 4] := Format('%8.2n', [Impuesto]);
  SGTotal.Cells[1, 5] := Format('%8.2n', [Total]);

  if FEContado.Text = '' then FEContado.Text := '0';
  if FECheque.Text = '' then FECheque.Text := '0';
  if FETarjeta.Text = '' then FETarjeta.Text := '0';
  if FEOtro.Text = '' then FEOtro.Text := '0';

  if ((CONT = 0) or (CONT > Total)) then
    FEContado.Text := FloatToStr(Total);

  Pagado := StrToFloat(FEContado.Text) + StrToFloat(FECheque.Text) +
    StrToFloat(FETarjeta.Text) + StrToFloat(FEOtro.Text);
  Saldo := Total - Pagado;
  TotalLabel.Caption := FloatToStr(Total);
  LbSaldo.Caption := FloatToStr(Saldo);
end;

procedure TOperacionForm.cbTipoChange(Sender: TObject);
begin
  CalculaTotales;
end;

procedure TOperacionForm.RJustifyEdit(var ThisEdit: TEdit);
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

procedure TOperacionForm.TraeNombreCliente;
var cliIVA : string;
begin
If ClienteEdit.Text <> '' then
  begin
    dm.qOperacion.SQL.Text := 'Select * from "Cliente" where CODIGO = ' +
      ClienteEdit.Text;
    dm.qOperacion.Active := True;
    If dm.qOperacion.RecordCount < 1 then
    begin
      MessageDlg('¡Código de cliente no existe!', mtError, [mbOK], 0);
      ClienteEdit.SetFocus;
    end
    else
      begin
        ClienteLabel.Caption := dm.qOperacion.FieldByName('NOMBRE').AsString;
        // lPrecio.Caption := dm.qOperacion.FieldByName('DIRECCION').AsString;
        // DireccionLabel.Caption := dm.qOperacion.FieldByName('DIRECCIONCOMERCIAL').AsString;
        // Label13.Caption := dm.qOperacion.FieldByName('TELEFONO').AsString;
        // Label14.Caption := dm.qOperacion.FieldByName('CELULAR').AsString;
        Precio := dm.qOperacion.FieldByName('PRECIO').AsString;
        if (Precio='0') then Precio := '';
        PrecioLabel.Caption := Precio;
//        if PrecioLabel.Caption = '' then PrecioLabel.Caption := '0';
        // Label19.Caption := dm.qOperacion.FieldByName('TERMINOS').AsString;
        // Label23.Caption := DateToStr(IncDay(now,dm.qOperacion.FieldByName('DIASCREDITO').AsInteger));
        VendedorEdit.Text := dm.qOperacion.FieldByName('VENDEDOR').AsString;
        CuitEdit.Text := dm.qOperacion.FieldByName('CUIT').AsString;
        if CuitEdit.Text =''  then
          CuitEdit.Text := dm.qOperacion.FieldByName('DOCUMENTO').AsString;
          if CuitEdit.Text =''  then
            CuitEdit.Text := '20222222223';
        // DocumentoLabel.Caption := dm.qOperacion.FieldByName('DOCUMENTO').AsString;
        // CUENTA CLIENTE
        if ClienteEdit.Text<>'0' then
          EmailEdit.Text := dm.qOperacion.FieldByName('EMAIL').AsString;
        CtaNombre := dm.qOperacion.FieldByName('CTANOMBRE').AsString;
        CtaTipo := dm.qOperacion.FieldByName('CTATIPO').AsString;
        CtaAnticipo := dm.qOperacion.FieldByName('CTAANTICIPO').AsString;
        IF dm.qOperacion.FieldByName('PAGARE').AsString = 'SI' THEN
          PagareCheckBox.Checked := True;
        // IVA
        cliIVA := dm.qOperacion.FieldByName('IVA').AsString;
        if catIVA='Responsable Monotributo' then cbTipo.ItemIndex := 10
        else
          if catIVA='Responsable Inscripto' then
            if cliIVA='Responsable Inscripto' then cbTipo.ItemIndex := 0
            else cbTipo.ItemIndex := 5;

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
            SGFact.Cells[0, Cuenta] := '0'; // código
            Deuda := DM.Query.FieldByName('SALDO').AsFloat;
            if Deuda > 0 then
              SGFact.Cells[1, Cuenta] := 'Deuda CtaCte'
            else
              SGFact.Cells[1, Cuenta] := 'Saldo a Favor'; // descripción
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
          dm.qOperacion.Active := False;
        end;
      end;
  end;
end;

procedure TOperacionForm.ClienteBitBtnClick(Sender: TObject);
begin
  QuitarArticulos;
  Deuda := 0;
  if Compra then
  begin
    FBuscaProve := TFBuscaProve.Create(self);
    try
      FBuscaProve.ShowModal;
      salir := FBuscaProve.salir;
      if salir then Exit;
      with FBuscaProve do
      begin
        ClienteEdit.Text := dm.qProveedor.FieldByName('CODIGO').AsString;
        ClienteLabel.Caption := dm.qProveedor.FieldByName('Nombre').AsString;
        Label3.Caption := dm.qProveedor.FieldByName('Direccion').AsString;
        CUITEdit.Text := dm.qProveedor.FieldByName('CUIT').AsString;
        if CUITEdit.Text='' then CUITEdit.Text := dm.qProveedor.FieldByName('DOCUMENTO').AsString;
        EmailEdit.Text := dm.qProveedor.FieldByName('EMAIL').AsString;
        CtaNombre := dm.qProveedor.FieldByName('CtaNombre').AsString;
        CtaTipo := dm.qProveedor.FieldByName('CtaTipo').AsString;
        CtaAnticipo := dm.qProveedor.FieldByName('CtaAnticipo').AsString;
        PagareCheckBox.Checked := dm.qProveedor.FieldByName('PAGARE').AsBoolean;
        if (dm.ConfigQuery.FieldByName('IVA').AsString = 'Responsable Inscripto') and
          (dm.qProveedor.FieldByName('IVA').AsString = 'RI') then cbTipo.ItemIndex := 0
        else
        if (dm.qProveedor.FieldByName('IVA').AsString = 'RI') then
          cbTipo.ItemIndex := 5
        else
          cbTipo.ItemIndex := 10;
      end;
    finally
      FBuscaProve.Free;
    end;
  end
  else
  begin
    FBuscaCliente := TFBuscaCliente.Create(self);
    try
      FBuscaCliente.ShowModal;
        salir := FBuscaCliente.salir;
        if salir then Exit;
        ClienteEdit.Text := dm.qCliente.FieldByName('CODIGO').AsString;
        TraeNombreCliente;
    finally
      FBuscaCliente.Free;
      end;
  end;
  FEContado.Text:='0';
  CalculaTotales;
  AgregarBitBtn.Click;
end;

procedure TOperacionForm.ComprobanteEditExit(Sender: TObject);
begin
  ProcesarBitBtn.SetFocus;
end;

procedure TOperacionForm.DescuentoBitBtnClick(Sender: TObject);
var
 p,c,d
 ,t,td : Double;
 de : string;
begin
  p:=0;
  c:=0;
  d:=0;
  t:=0;
  td:=0;
  de:='';
DescuentoForm := TDescuentoForm.Create(self);
DescuentoForm.DescuentoEdit.Text := FloatToStr(Saldo) ;
  try
    DescuentoForm.ShowModal;
  finally
    if DescuentoForm.DescuentoEdit.Text <> ''  then
    begin
      //descuento por %
      de := DescuentoForm.DescuentoEdit.Text;
      if Pos( '%', de ) >0 then
      begin
        d := StrToFloat( StringReplace(de, '%', '', [rfReplaceAll, rfIgnoreCase]) )/100;
        t := StrToFloat(SGFact.Cells[5, SGFact.Row]);
        td := t-(t*d);
        d := t-td;
      end
      else
        d := StrToFloat(de);
      SGFact.Cells[7, SGFact.Row] := Format('%8.2f', [d]);
//      SGFact.Cells[7, SGFact.Row] := DescuentoForm.DescuentoEdit.Text;
      if cbTipo.ItemIndex<>0 then
      begin
        p:=StrToFloat(SGFact.Cells[4, SGFact.Row]);
        c:=StrToFloat(SGFact.Cells[3, SGFact.Row]);
        d:=StrToFloat(SGFact.Cells[7, SGFact.Row]);
        {total}SGFact.Cells[5, SGFact.Row] := FloatToStr((p*c));
      end;
      FEContado.Text:='0';
      CalculaTotales;
    end;
    DescuentoForm.Free;
  end;
end;

procedure TOperacionForm.EnviarEmailCheckBoxClick(Sender: TObject);
begin
  envEmail:=EnviarEmailCheckBox.Checked;
end;

function TOperacionForm.NetoGravado;
begin
  Result := costo + (costo * (flete/100)) + (costo * (ganancia/100));
end;

procedure TOperacionForm.NotasBitBtnClick(Sender: TObject);
begin
  NotasForm := TNotasForm.Create(self);
  with NotasForm do
  begin
    NotasMemo.Text := notas;
    try
      ShowModal;
    finally
      if save then notas := NotasMemo.Text;
      Free;
    end;
  end;
end;

procedure TOperacionForm.AgregarBitBtnClick(Sender: TObject);
var i : Integer;
begin
  if Compra then
  begin
    FSelProdFact := TFSelProdFact.Create(self);
    FSelProdFact.Precio := 'Costo';
    FSelProdFact.Proveedor := ClienteLabel.Caption;
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
      TraerArticulo(FSelProdFact.Edit1.Text,StrToFloat(FSelProdFact.FloatEdit1.Text),StrToFloat(FSelProdFact.CantidadEdit.Text),0);
    end;
  end
  else
  begin
    FBuscaArticulo := TFBuscaArticulo.Create(self);
    FBuscaArticulo.EnStockCheckBox.Checked := True;
    FBuscaArticulo.Precio := Precio;
    if (TipoRadioGroup.ItemIndex = 0) and
      (dm.ConfigQuery.FieldByName('CodigoBarra').AsString = 'SI') then
      FBuscaArticulo.cb := 'si';
    try
      FBuscaArticulo.ShowModal;
    finally
      If dm.qArticulo.Active = True then
      begin
        TraerArticulo(dm.qArticulo.FieldByName('CODIGO').AsString,0,1,0);
      end;
      FBuscaArticulo.Free;
      dm.qOperacion.Close;
      FEContado.SetFocus;
    end;
  end;

  //bajar el foco
  PostMessage(SGFact.Handle,WM_KEYDOWN,VK_END,0);
end;

procedure TOperacionForm.QuitarBitBtnClick(Sender: TObject);
begin
  SGFact.SetFocus;
  GridRemoveRow(SGFact, SGFact.Row);
  If Cuenta > 1 then
    Cuenta := Cuenta - 1;
  FEContado.Text:='0';
  CalculaTotales;
end;

procedure TOperacionForm.PercEditExit(Sender: TObject);
begin
  FEContado.Text:='0';
  CalculaTotales;
  FEContado.SetFocus;
end;

procedure TOperacionForm.ProcesarBitBtnClick(Sender: TObject);
var
  r, c: Integer;
  ok, impr : Boolean;
begin
  if Total>0 then
  begin
    screen.Cursor := crHourGlass;
    c := 0; // columna i
    r := 0; // row j
    if dm.ConfigQuery.FieldByName('Imprimir').AsString<>'NO' then impr := True;

    if (ClienteEdit.Text='0') and (EmailEdit.Text<>'') then
    begin
     with dm do begin
      ClienteEdit.Text := IntToStr(UltimoRegistro('Cliente', 'CODIGO'));
      AgregarValor('Cliente','CODIGO', ClienteEdit.Text);
      ActualizarValor('Cliente', 'NOMBRE', ClienteEdit.Text, QuotedStr(EmailEdit.Text));
      ActualizarValor('Cliente', 'EMAIL', ClienteEdit.Text, QuotedStr(EmailEdit.Text));
      ActualizarValor('Cliente', 'DOCUMENTO', ClienteEdit.Text, (CuitEdit.Text));
     end;
    end;

    OperacionDataModule := TOperacionDataModule.Create(self);
    with OperacionDataModule do
    begin
      SetLength(mat, SGFact.ColCount, SGFact.RowCount);
      for r := 0 to SGFact.RowCount - 1 do
        for c := 0 to SGFact.ColCount - 1 do
        begin
          mat[c, r] := SGFact.Cells[c, r];
        end;

//      if TipoRadioGroup.ItemIndex=2 then
//      begin
//        cbTipo.ItemIndex := 29;
//      end;

      if Compra then
      begin
        if (PuntoVentaEdit.Text='') or (ComprobanteEdit.Text='') then begin
          ShowMessage('COMPLETAR NRO. DE PUNTO DE VENTA y COMPROBANTE!!!');
          PuntoVentaEdit.SetFocus;
          exit
        end else
        ProcCompra(PuntoVentaEdit.Text, cbTipo.Text, ClienteEdit.Text,
          FormatDateTime('mm/dd/yyyy hh:mm:ss', FechaDateTimePicker.DateTime),
          VendedorEdit.Text, CuitEdit.Text, ComprobanteEdit.Text, CtaNombre, notas,
          PagareCheckBox.Checked, costo, Impuesto, StrToFloat(FECheque.Text),
          StrToFloat(FECheque.Text), StrToFloat(FEContado.Text), Total,
          subtotal, desc, StrToFloat(FETarjeta.Text), StrToFloat(FEOtro.Text),
          Saldo, Pagado, NG105, NG21, NGO, IVA105, IVA21, IVAO, Exento, Total - Saldo
          , noGra, pagCueIva, pagCueOtr, perIIBB, perImpMun, impInt, otrTrib)
      end
      else
      if TipoRadioGroup.ItemIndex=2 then
      ProcOPER('PED', cbTipo.Text, ClienteEdit.Text,
        FormatDateTime('mm/dd/yyyy hh:mm:ss', FechaDateTimePicker.DateTime),
        VendedorEdit.Text, '', CtaNombre, notas, False, PagareCheckBox.Checked, impr, costo,
        Comision, envio, Impuesto, StrToFloat(FECheque.Text), 0,
        StrToFloat(FEContado.Text), Total, subtotal, desc,
        StrToFloat(FETarjeta.Text), StrToFloat(FEOtro.Text), Saldo, Pagado,
        Interes, NG105, NG21, IVA105, IVA21, Deuda, UltCosto,
        noGra,pagCueIva,pagCueOtr,perIIBB,perImpMun,impInt,otrTrib)
      else
      if TipoRadioGroup.ItemIndex=1 then
        ProcPresup(cbTipo.Text, ClienteEdit.Text,
          FormatDateTime('mm/dd/yyyy hh:mm:ss', FechaDateTimePicker.DateTime),
          VendedorEdit.Text, CuitEdit.Text, CtaNombre, notas, True,
          PagareCheckBox.Checked, costo, Comision, envio, Impuesto,
          StrToFloat(FECheque.Text), 0, StrToFloat(FEContado.Text), Total,
          subtotal, desc, StrToFloat(FETarjeta.Text), StrToFloat(FEOtro.Text),
          Saldo, Pagado, Interes, NG105, NG21, IVA105, IVA21, Deuda, UltCosto)
      else
      if codRem<>'' then
        FactRem(codRem,cbTipo.Text, ClienteEdit.Text,
        FormatDateTime('mm/dd/yyyy hh:mm:ss', FechaDateTimePicker.DateTime),
        VendedorEdit.Text, CuitEdit.Text, CtaNombre, notas, TipoRadioGroup.ItemIndex=1,
        PagareCheckBox.Checked, impr, costo, Comision, envio, Impuesto,
        StrToFloat(FECheque.Text), 0, StrToFloat(FEContado.Text), Total,
        subtotal, desc, StrToFloat(FETarjeta.Text), StrToFloat(FEOtro.Text),
        Saldo, Pagado, Interes, NG105, NG21, IVA105, IVA21, Deuda, UltCosto,
        //noGra,pagCueIva,pagCueOtr,perIIBB,perImpMun,impInt,otrTrib)
        NGO , IVAO, Exento, noGra, pagCueIva, pagCueOtr, perIIBB, perImpMun, impInt, otrTrib, wc)
      else
        ok := ProcVTA
        (PuntoVentaEdit.Text, ComprobanteEdit.Text,
         cbTipo.Text, ClienteEdit.Text,
         FormatDateTime('mm/dd/yyyy hh:mm:ss', FechaDateTimePicker.DateTime),
         VendedorEdit.Text, CuitEdit.Text, CtaNombre, notas, TipoRadioGroup.ItemIndex=1,
         PagareCheckBox.Checked, impr, costo, Comision, envio, Impuesto,
         StrToFloat(FECheque.Text), 0, StrToFloat(FEContado.Text), Total,
         subtotal, desc, StrToFloat(FETarjeta.Text), StrToFloat(FEOtro.Text),
         Saldo, Pagado, Interes, NG105, NG21, IVA105, IVA21, Total - Saldo, UltCosto
         ,NGO , IVAO, Exento, noGra, pagCueIva, pagCueOtr, perIIBB, perImpMun, impInt, otrTrib);
      ActualizarArticulos;
    end;
    OperacionDataModule.Free;
    screen.Cursor := crDefault;
//    if ok then ClienteBitBtn.Click;
  end;
  if TipoRadioGroup.ItemIndex=1 then
    close
  else
  begin
    if (codRem = '') then
    begin
      Nuevo;
      ClienteBitBtn.Click;
    end
    else
      Close;
  end;
end;

procedure TOperacionForm.CheckBox1Click(Sender: TObject);
begin
  CalculaTotales;
end;

procedure TOperacionForm.FormShow(Sender: TObject);
begin
  Nuevo;
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
  if TipoRadioGroup.ItemIndex=2 then OperacionForm.Caption := 'PEDIDO';

  if Compra then
  begin
    OperacionForm.Caption := 'COMPRA';
    ClienteBitBtn.Caption := 'Proveedor';
//      Label1.Caption := ClienteBitBtn.Caption+':';
    TipoRadioGroup.ItemIndex := 0;
    pPago.Visible := False;
    lPrecio.Visible := False;
    cbTipo.Enabled := True;
    ClienteBitBtn.Click;
  end
  else
//  if TipoRadioGroup.ItemIndex=2 then
//  begin
//    OperacionForm.Caption := 'PEDIDO';
//    cbTipo.ItemIndex := 28;
//  end
  if codRem<>'' then
    TraerRemito(codRem)
  else//es vta
  begin
    PuntoVentaEdit.Text := PuntoVenta;
    ClienteBitBtn.Click;
    ComprobanteEdit.Text := dm.ObtenerNroComp(cbTipo.Text);
  end;
  if salir then
    PostMessage(Self.Handle, WM_CLOSE, 0, 0);
end;

procedure TOperacionForm.FormKeyUp(Sender: TObject; var Key: Word;
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
      else if Key = VK_Escape then
        Close;
end;

procedure TOperacionForm.FEContadoChange(Sender: TObject);
begin
//  if FEContado.Text <> '' then
//    CalculaTotales;
end;

procedure TOperacionForm.FEChequeChange(Sender: TObject);
begin
  if FECheque.Text <> '' then
    CalculaTotales;
end;

procedure TOperacionForm.FETarjetaChange(Sender: TObject);
begin
  if FETarjeta.Text <> '' then
    CalculaTotales;
end;

procedure TOperacionForm.FEOtroChange(Sender: TObject);
begin
  if FEOtro.Text <> '' then
    CalculaTotales;
end;

procedure TOperacionForm.FEContadoExit(Sender: TObject);
begin
//  if FEContado.Text = '' then
    CalculaTotales;
  ProcesarBitBtn.SetFocus;
end;

procedure TOperacionForm.FormCreate(Sender: TObject);
begin
  DM.TraerConfig;
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
  cbTipo.Items.Add('X'); //29
  dm.ConfigQuery.Open;
end;

procedure TOperacionForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
      Key := #0; { eat enter key }
      Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end;
end;

procedure TOperacionForm.CantidadBitBtnClick(Sender: TObject);
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
      FEContado.Text:='0';
      CalculaTotales;
    end;
    AgregarCantidadForm.Free;
  end;
end;

procedure TOperacionForm.VendedorBitBtnClick(Sender: TObject);
begin
  BuscarVendedorForm := TBuscarVendedorForm.Create(self);
  try
    BuscarVendedorForm.ShowModal;
  finally
    VendedorEdit.Text := dm.qVendedor.FieldByName('CODIGO')
      .AsString;
    VendedorLabel.Caption := dm.qVendedor.FieldByName
      ('NOMBRE').AsString;
    BuscarVendedorForm.Free;
  end;
end;

procedure TOperacionForm.TraerImpresora;
var
  i: Integer;
begin
  for i := 0 to Printer.Printers.Count - 1 do
    ComboBox1.Items.Add(Printer.Printers[i]);
end;

procedure TOperacionForm.TraerRemito;
begin
  with dm do
  with qRemito do
  begin
    Open('select CLIENTE, COMISION, ENVIO, NOTAS, WC from "Operacion" where CODIGO = '+codigo);
    ClienteEdit.Text := FieldByName('CLIENTE').AsString;
    Comision := FieldByName('COMISION').AsFloat;
    envio := FieldByName('ENVIO').AsFloat;
    notas := FieldByName('NOTAS').AsString;
    wc := FieldByName('WC').AsInteger;
    TraeNombreCliente;
    Open('SELECT ARTICULO, PRECIO, CANTIDAD, COSTO FROM "OperacionItem"'+
    ' WHERE OPERACION = '+codigo);
    First;
    while not Eof do
    begin
      TraerArticulo(
        FieldByName('ARTICULO').AsString,
        FieldByName('PRECIO').AsFloat,
        FieldByName('CANTIDAD').AsFloat,
        FieldByName('COSTO').AsFloat
      );
      Next;
    end;
  end;
end;

end.
