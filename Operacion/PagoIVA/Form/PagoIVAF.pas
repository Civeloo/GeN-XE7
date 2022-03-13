unit PagoIVAF;

interface

uses Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.Controls, System.Classes, Vcl.ExtCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DataModule, OleCtrls, SHDocVw;

type
  TPagoIVAForm = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    AceptarBitBtn: TBitBtn;
    SalirBitBtn: TBitBtn;
    CalcularBitBtn: TBitBtn;
    DesdeDateTimePicker: TDateTimePicker;
    HastaDateTimePicker: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CreditoEdit: TEdit;
    DebitoEdit: TEdit;
    SaldoEdit: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure AceptarBitBtnClick(Sender: TObject);
    procedure CalcularBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    fecha: string;
    { Public declarations }
  end;

var
  PagoIVAForm: TPagoIVAForm;

implementation

{$R *.dfm}

procedure TPagoIVAForm.AceptarBitBtnClick(Sender: TObject);
var
  i, c: integer;
begin
  fecha := (FormatDateTime('mm/dd/yyyy hh:mm:ss', now));

  // Iniciar la Transaccion

  // CONTABILIDAD++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  // Insertar en la tabla LibroDiario
  // obtener el numero de asiento
  dm.qQ.SQL.Text := 'Select Max(ASIENTO) From "LibroDiario"';
  dm.qQ.Open;
  i := dm.qQ.Fields[0].AsInteger + 1;
  dm.qQ.Close;

  // LIQUIDACION DE IVA

  // renglon  - IVA DEBITO FISCAL
  dm.qQ.SQL.Text := 'select * from "Cuenta" where CODIGO=' +
    dm.ConfigQuery.FieldByName('CtaIVADebitoFiscal').AsString;
  dm.qQ.Open;
  c := c + 1;
  dm.qTemp.SQL.Text :=
    'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
    + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(fecha) +
    ', ''LIQUIDACION DE IVA'', ' + QuotedStr(dm.qQ.FieldByName('Jerarquia')
    .AsString) + ', ' + QuotedStr(dm.qQ.FieldByName('DESCRIPCION').AsString) + ', '
    + DebitoEdit.Text + ', 0, ' + QuotedStr(Oculto) + ' )';
  dm.qTemp.ExecSQL;

  if StrToFloat(SaldoEdit.Text) < 0 then
  begin // renglon  - IVA REMANENTE
    dm.qQ.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' +
      dm.ConfigQuery.FieldByName('CtaIVARemanente').AsString;
    dm.qQ.Open;
    c := c + 1;
    dm.qTemp.SQL.Text :=
      'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
      + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(fecha) +
      ', ''LIQUIDACION DE IVA'', ' + QuotedStr(dm.qQ.FieldByName('Jerarquia')
      .AsString) + ', ' + QuotedStr(dm.qQ.FieldByName('DESCRIPCION').AsString) +
      ', ' + FloatToStr(abs(StrToFloat(SaldoEdit.Text))) + ', 0, ' +
      QuotedStr(Oculto) + ' )';
    dm.qTemp.ExecSQL;
  end;

  // renglon  - IVA CREDITO FISCAL
  dm.qQ.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' +
    dm.ConfigQuery.FieldByName('CtaIVACreditoFiscal').AsString;
  dm.qQ.Open;
  c := c + 1;
  dm.qTemp.SQL.Text :=
    'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
    + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(fecha) +
    ', ''LIQUIDACION DE IVA'', ' + QuotedStr(dm.qQ.FieldByName('Jerarquia')
    .AsString) + ', ' + QuotedStr(dm.qQ.FieldByName('DESCRIPCION').AsString) +
    ', 0, ' + CreditoEdit.Text + ', ' + QuotedStr(Oculto) + ' )';
  dm.qTemp.ExecSQL;

  if StrToFloat(SaldoEdit.Text) > 0 then
  begin // renglon  - IVA A PAGAR
    dm.qQ.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' +
      dm.ConfigQuery.FieldByName('CtaIVAAPagar').AsString;
    dm.qQ.Open;
    c := c + 1;
    dm.qTemp.SQL.Text :=
      'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
      + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(fecha) +
      ', ''LIQUIDACION DE IVA'', ' + QuotedStr(dm.qQ.FieldByName('Jerarquia')
      .AsString) + ', ' + QuotedStr(dm.qQ.FieldByName('DESCRIPCION').AsString) +
      ', 0, ' + SaldoEdit.Text + ', ' + QuotedStr(Oculto) + ' )';
    dm.qTemp.ExecSQL;

    // PAGO DE IVA
    // renglon  - IVA A PAGAR
    dm.qQ.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' +
      dm.ConfigQuery.FieldByName('CtaIVAAPagar').AsString;
    dm.qQ.Open;
    c := c + 1;
    dm.qTemp.SQL.Text :=
      'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
      + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(fecha) +
      ', ''PAGO DE IVA'', ' + QuotedStr(dm.qQ.FieldByName('Jerarquia').AsString) +
      ', ' + QuotedStr(dm.qQ.FieldByName('DESCRIPCION').AsString) + ', ' +
      SaldoEdit.Text + ', 0, ' + QuotedStr(Oculto) + ' )';
    dm.qTemp.ExecSQL;

    // renglon  - CAJA
    dm.qQ.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' +
      dm.ConfigQuery.FieldByName('CtaCaja').AsString;
    dm.qQ.Open;
    c := c + 1;
    dm.qTemp.SQL.Text :=
      'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
      + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(fecha) +
      ', ''PAGO DE IVA'', ' + QuotedStr(dm.qQ.FieldByName('Jerarquia').AsString) +
      ', ' + QuotedStr(dm.qQ.FieldByName('DESCRIPCION').AsString) + ', 0, ' +
      SaldoEdit.Text + ', ' + QuotedStr(Oculto) + ' )';
    dm.qTemp.ExecSQL;
  end;

  // CONTABILIDAD------------------------------------------------------------------------------

  // Completa la Transaccion
  dm.qTemp.Transaction.Commit;
  Close;
end;

procedure TPagoIVAForm.CalcularBitBtnClick(Sender: TObject);
begin
  // DEBITO
  dm.qTemp.SQL.Text := 'SELECT ' + '  "LibroIVAventa".IVA1,' +
    '  "LibroIVAventa".IVA2, IDERPYPAC, ' + '  "LibroIVAventa".FECHA ' + ' FROM ' +
    '  "LibroIVAventa"  ' + ' WHERE ' + '  ("LibroIVAventa".FECHA >= ' +
    QuotedStr(DateToStr(DesdeDateTimePicker.Date)) + ' ) AND' +
    '  ("LibroIVAventa".FECHA <= ' +
    QuotedStr(DateToStr(HastaDateTimePicker.Date)) + ' )' + '';
  dm.qTemp.Open;
  while dm.qTemp.Eof = False do
  begin
    CreditoEdit.Text := FloatToStr(StrToFloat(CreditoEdit.Text) +
      dm.qTemp.FieldByName('IVA1').AsFloat + dm.qTemp.FieldByName('IVA2').AsFloat + dm.qTemp.FieldByName('IDERPYPAC').AsFloat);
    dm.qTemp.Next;
  end;

  // CREDITO
  dm.qTemp.SQL.Text := 'SELECT ' + '  "LibroIVAcompra".IVA1,' +
    '  "LibroIVAcompra".IVA2, IDERPYPAC, ' + '  "LibroIVAcompra".FECHA ' + ' FROM ' +
    '  "LibroIVAcompra"  ' + ' WHERE ' + '  ("LibroIVAcompra".FECHA >= ' +
    QuotedStr(DateToStr(DesdeDateTimePicker.Date)) + ' ) AND' +
    '  ("LibroIVAcompra".FECHA <= ' +
    QuotedStr(DateToStr(HastaDateTimePicker.Date)) + ' )' + '';
  dm.qTemp.Open;
  while dm.qTemp.Eof = False do
  begin
    DebitoEdit.Text := FloatToStr(StrToFloat(DebitoEdit.Text) +
      dm.qTemp.FieldByName('IVA1').AsFloat + dm.qTemp.FieldByName('IVA2').AsFloat - dm.qTemp.FieldByName('IDERPYPAC').AsFloat);
    dm.qTemp.Next;
  end;


  SaldoEdit.Text := FloatToStr(StrToFloat(CreditoEdit.Text) -
    StrToFloat(DebitoEdit.Text));
end;

procedure TPagoIVAForm.FormCreate(Sender: TObject);
begin
  // dm := TDM.Create(Self);
  dm.ConfigQuery.Open;
end;

end.
