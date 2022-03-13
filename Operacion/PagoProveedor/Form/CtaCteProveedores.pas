unit CtaCteProveedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls,
  DataModule, OleCtrls, SHDocVw, OperacionDM, jpeg, ImprimirDM,
  IBX.IBCustomDataSet, IBX.IBQuery;

type
  TCtaCteProveedoresForm = class(TForm)
    DS: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label10: TLabel;
    Label13: TLabel;
    Label4: TLabel;
    Label16: TLabel;
    CancelarBitBtn: TBitBtn;
    SaldoDBEdit: TDBEdit;
    ImprimirBitBtn: TBitBtn;
    Tabla: TIBQuery;
    Q: TIBQuery;
    Query: TIBQuery;
    Label1: TLabel;
    CodigoEdit: TEdit;
    ProveedorBitBtn: TBitBtn;
    NombreLabel: TLabel;
    Label3: TLabel;
    GerenteLabel: TLabel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CancelarBitBtnClick(Sender: TObject);
    procedure ProveedorBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
  private
    { Private declarations }
  public
    Codigo, CtaNombre, CtaTipo, CtaAnticipo, CtaIIBB: String;
    Entrega, SubTotal, Impuesto, Total: Double;
    New: Boolean;
    procedure Pago;
    { Public declarations }
  end;

var
  CtaCteProveedoresForm: TCtaCteProveedoresForm;

implementation

uses Entrega,
  UFBuscaProve, UFFormaPago;

{$R *.dfm}

procedure TCtaCteProveedoresForm.Pago;
begin
  OperacionDataModule := TOperacionDataModule.Create(self);
  SubTotal := 0;
  Impuesto := 0;
  if SaldoDBEdit.Text = '' then
    SaldoDBEdit.Text := '0';
  Total := StrToFloat(SaldoDBEdit.Text);
  FFormaPago := TFFormaPago.Create(self);
  FFormaPago.Valores(SubTotal, Impuesto, Total);
  try
    FFormaPago.ShowModal;
  finally
    OperacionDataModule.CtaCte('PROVEEDOR', CodigoEdit.Text, CtaNombre,
      FFormaPago.Pagado, StrToFloat(FFormaPago.FECheque.Text),
      StrToFloat(FFormaPago.ChequeTerceroEdit.Text),
      StrToFloat(FFormaPago.FEContado.Text),
      StrToFloat(FFormaPago.FETarjeta.Text), FFormaPago.Saldo);
    FFormaPago.Free;
  end;
  OperacionDataModule.Free;
  Close;
  { var c, i, OrdTrans : integer;
    Fecha, FechaVence, iv: String;
    FPagoOK : Boolean;
    MntContado, MntCheque, MntCheque3ro, NroCheque, DetCheque, DiaCheque, MntTarjeta, NroTarjeta, DetTarjeta, MntOtros, Saldo :String;
    BalanceAnterior, BalanceTotal, Pagado, Deuda : Double;
    Tipo :char;
    begin
    SubTotal:=0;
    Impuesto:=0;
    Total:=-StrToFloat(SaldoDBEdit.Text);
    FFormaPago:=TFFormaPago.Create(self);
    FFormaPago.Proveedor:=True;
    FFormaPago.Valores(SubTotal, Impuesto, Total);
    try
    FFormaPago.ShowModal;
    finally
    FPagoOK    := FFormaPago.OK;
    MntContado := Format('%8.2f',[StrToFloat(FFormaPago.FEContado.Text)]);
    MntCheque  := Format('%8.2f',[StrToFloat(FFormaPago.FECheque.Text)]);
    MntCheque3ro  := Format('%8.2f',[StrToFloat(FFormaPago.ChequeTerceroEdit.Text)]);
    NroCheque  := FFormaPago.Edit1.Text;
    DetCheque  := FFormaPago.Edit3.Text;
    DiaCheque  := FFormaPago.Edit5.Text;
    MntTarjeta := FFormaPago.FETarjeta.Text;
    NroTarjeta := FFormaPago.Edit2.Text;
    DetTarjeta := FFormaPago.Edit4.Text;
    MntOtros   := Format('%8.2f',[StrToFloat(FFormaPago.FEOtro.Text)]);
    Saldo      := Format('%8.2f',[FFormaPago.Saldo]);
    Pagado     := FFormaPago.Pagado;
    FFormaPago.Free;
    end;

    if FPagoOK = True then
    begin
    deuda := strtofloat(SaldoDBEdit.Text);
    Fecha := (FormatDateTime('mm/dd/yyyy hh:mm:ss', now));

    //  CONSULTAR SI YA TIENE CTACTE
    Query.SQL.Text := 'SELECT * FROM "CtaCte" WHERE "CtaCte".PROVEEDOR  = '+Codigo;
    Query.Open;
    if Query.RecordCount = 0 then New:=True;

    // Iniciar la Transaccion

    // Insertar en la tabla de Cheque
    if NroCheque <> '' then
    begin
    Query.SQL.Text := 'Insert Into "Cheque" (NUMERO, DESCRIPCION, FACTURA, IMPORTE, FECHA, DIAS) Values'+
    ' ('+NroCheque+', '+QuotedStr(DetCheque)+', '+MntCheque+', '+QuotedStr(Fecha)+', '+DiaCheque+')';
    Query.ExecSQL;
    end;

    // Insertar en la tabla de Tarjeta
    if NroTarjeta <> '' then
    begin
    Query.SQL.Text := 'Insert Into "Tarjeta" (NUMERO, DESCRIPCION, FACTURA, IMPORTE, FECHA) Values'+
    ' ('+NroTarjeta+', '+QuotedStr(DetTarjeta)+', '+MntTarjeta+', '+QuotedStr(Fecha)+')';
    Query.ExecSQL;
    end;

    // Insertar en la tabla de CtaCte
    begin
    if New = False then Query.SQL.Text := 'Update "CtaCte" Set Saldo = '+FloatToStr(Pagado+Deuda)+' , Fecha = '+QuotedStr(Fecha)+' Where PROVEEDOR = '+Codigo
    else Query.SQL.Text := 'Insert Into "CtaCte" (PROVEEDOR, FECHA, SALDO) Values'+
    Codigo+','+QuotedStr(Fecha)+', '+Saldo+')';
    Query.ExecSQL;
    end;

    // Insertar en la tabla de CtaCte Item
    begin
    Query.SQL.Text := 'Insert Into "CtaCteItem" (DESCRIPCION, PAGADO) Values'+
    '( ''Entrega de Dinero'','+FloatToStr(Pagado)+')';
    Query.ExecSQL;
    end;

    //--CONTABILIDAD

    //Insertar en la tabla LibroDiario
    //obtener el numero de asiento
    q.SQL.Text := 'Select Max(ASIENTO) From "LibroDiario"';
    q.Open;
    i := q.Fields[0].AsInteger+1;
    q.Close;

    // renglon  - PROVEEDORES
    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+CtaNombre;
    q.Open;

    Query.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('CTACTE PROVEEDOR '+(ProveedorLabel.Caption)+' - '+(GerenteLabel.Caption)+'')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', '+FloatToStr(Pagado)+', 0, '+QuotedStr(Oculto)+
    ' )';
    Query.ExecSQL;

    if StrToFloat(Saldo) < 0 then //PAGO POR ADELANTADO
    begin
    // renglon  - ANTICIPO A PROVEEDORES
    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+CtaAnticipo;
    q.Open;

    Query.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('CTACTE PROVEEDOR '+(ProveedorLabel.Caption)+' - '+(GerenteLabel.Caption)+'')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', '+Saldo+', 0, '+QuotedStr(Oculto)+
    ' )';
    Query.ExecSQL;
    end;

    if strtofloat(MntCheque3ro) > 0.04 then //PAGO CON CHEQUE DE TERCEROS
    begin
    // renglon  - VALORES AL COBRO

    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+DM.ConfigQuery.FieldByName('CtaValorAlCobro').AsString;
    q.Open;
    Query.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('CTACTE PROVEEDOR '+(ProveedorLabel.Caption)+' - '+(GerenteLabel.Caption)+'')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', 0, '+MntCheque3ro+', '+QuotedStr(Oculto)+
    ' )';
    Query.ExecSQL;
    end;

    if strtofloat(MntCheque) > 0.04 then //PAGO CON CHEQUE PROPIO
    begin    // renglon  - BANCO XX CUENTA CORRIENTE
    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+DM.ConfigQuery.FieldByName('CtaBanco').AsString;
    q.Open;
    Query.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('CTACTE PROVEEDOR '+(ProveedorLabel.Caption)+' - '+(GerenteLabel.Caption)+'')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', 0, '+(MntCheque)+', '+QuotedStr(Oculto)+
    ' )';
    Query.ExecSQL;
    end;

    if StrToFloat(MntContado) > 0.04 then //PAGO CON CHEQUE PROPIO
    begin // renglon  - CAJA
    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+DM.ConfigQuery.FieldByName('CtaCaja').AsString;
    q.Open;
    Query.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('CTACTE PROVEEDOR '+(ProveedorLabel.Caption)+' - '+(GerenteLabel.Caption)+'')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', 0, '+(MntContado)+', '+QuotedStr(Oculto)+
    ' )';
    Query.ExecSQL;
    end;

    q.Close;

    // Completa la Transaccion
    Query.Transaction.Commit;

    Tabla.Close;
    Tabla.Open;
    CancelarBitBtn.SetFocus;
    end; }
end;

procedure TCtaCteProveedoresForm.FormShow(Sender: TObject);
begin
  ProveedorBitBtn.Click;
end;

procedure TCtaCteProveedoresForm.Image1Click(Sender: TObject);
begin
  ImprimirDataModule := TImprimirDataModule.Create(self);
  ImprimirDataModule.CSV(Tabla.SQL.Text, 'CTACTEPROVEEDOR');
  ImprimirDataModule.Free;
end;

procedure TCtaCteProveedoresForm.Label13Click(Sender: TObject);
begin
  Pago
end;

procedure TCtaCteProveedoresForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(self);
  DM.ConfigQuery.Open;
end;

procedure TCtaCteProveedoresForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F8 then
    Pago;
  if Key = VK_F9 then
    ImprimirBitBtn.Click;
end;

procedure TCtaCteProveedoresForm.ProveedorBitBtnClick(Sender: TObject);
begin
  FBuscaProve := TFBuscaProve.Create(self);
  try
    FBuscaProve.ShowModal;
  finally
    CodigoEdit.Text := FBuscaProve.Tabla.FieldByName('CODIGO').AsString;
    Tabla.SQL.Text := 'SELECT' + '  "CtaCte".FECHA, ' +
      '  "CtaCte".PROVEEDOR,   ' + '  "CtaCte".SALDO,   ' +
      '  "CtaCteItem".DESCRIPCION, ' + '  "Proveedor".NOMBRE,   ' +
      '  "Proveedor".GERENTE, ' + '  "Proveedor".CTANOMBRE, ' +
      '  "Proveedor".CTATIPO,  ' + '  "Proveedor".CTAANTICIPO, ' +
      '  "CtaCteItem".OPERACION ' + ' FROM       ' + '  "CtaCte"   ' +
      '  INNER JOIN "CtaCteItem" ON ("CtaCte".PROVEEDOR = "CtaCteItem".PROVEEDOR) '
      + '  INNER JOIN "Proveedor" ON ("CtaCteItem".PROVEEDOR = "Proveedor".CODIGO) '
      + '  WHERE "CtaCte".PROVEEDOR =' + CodigoEdit.Text;
    Tabla.Open;
    NombreLabel.Caption := FBuscaProve.Tabla.FieldByName('Nombre').AsString;
    GerenteLabel.Caption := FBuscaProve.Tabla.FieldByName('Gerente').AsString;
    // CUENTA
    CtaNombre := FBuscaProve.Tabla.FieldByName('CtaNombre').AsString;
    CtaTipo := FBuscaProve.Tabla.FieldByName('CtaTipo').AsString;
    CtaAnticipo := FBuscaProve.Tabla.FieldByName('CtaAnticipo').AsString;
  end;
end;

procedure TCtaCteProveedoresForm.CancelarBitBtnClick(Sender: TObject);
begin
  Close;
end;

end.
