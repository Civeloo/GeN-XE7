unit PagoF;

interface

uses Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.Controls, System.Classes, Vcl.ExtCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DataModule, OleCtrls, SHDocVw;

type
  TPagoForm = class(TForm)
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
    SaldoEdit: TEdit;
    Label6: TLabel;
    TotalEdit: TEdit;
    Label4: TLabel;
    procedure AceptarBitBtnClick(Sender: TObject);
    procedure CalcularBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    fecha: string;
    { Public declarations }
  end;

var
  PagoForm: TPagoForm;

implementation

{$R *.dfm}

procedure TPagoForm.AceptarBitBtnClick(Sender: TObject);
var
  i, c: integer;
begin
  fecha := (FormatDateTime('mm/dd/yyyy hh:mm:ss', now));

  // Iniciar la Transaccion
  dm.BaseDatosFB.StartTransaction;
  // CONTABILIDAD++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  // Insertar en la tabla LibroDiario
  // obtener el numero de asiento
  dm.Query.SQL.Text := 'Select Max(ASIENTO) From "LibroDiario"';
  dm.Query.Open;
  i := dm.Query.Fields[0].AsInteger + 1;
  dm.Query.Close;

  // LIQUIDACION DE

  if StrToFloat(SaldoEdit.Text) > 0 then
  begin
    // PAGO DE IIBB
    // renglon  -  A PAGAR
    dm.Query.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' +
      dm.ConfigQuery.FieldByName('CtaIIBB').AsString;
    dm.Query.Open;
    c := c + 1;
    dm.QTemp.SQL.Text :=
      'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
      + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(fecha) +
      ', ''PAGO DE IIBB'', ' + QuotedStr(dm.Query.FieldByName('Jerarquia').AsString) +
      ', ' + QuotedStr(dm.Query.FieldByName('DESCRIPCION').AsString) + ', ' +
      SaldoEdit.Text + ', 0, ' + QuotedStr(Oculto) + ' )';
    dm.QTemp.ExecSQL;

    // renglon  - CAJA
    dm.Query.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' +
      dm.ConfigQuery.FieldByName('CtaCaja').AsString;
    dm.Query.Open;
    c := c + 1;
    dm.QTemp.SQL.Text :=
      'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
      + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(fecha) +
      ', ''PAGO DE IIBB'', ' + QuotedStr(dm.Query.FieldByName('Jerarquia').AsString) +
      ', ' + QuotedStr(dm.Query.FieldByName('DESCRIPCION').AsString) + ', 0, ' +
      SaldoEdit.Text + ', ' + QuotedStr(Oculto) + ' )';
    dm.QTemp.ExecSQL;
  end;

  // CONTABILIDAD------------------------------------------------------------------------------

  // Completa la Transaccion
  dm.BaseDatosFB.Commit;
  Close;
end;

procedure TPagoForm.CalcularBitBtnClick(Sender: TObject);
var iibb, tot : Double;
begin
  iibb:=0;
  tot:=0;
  dm.QTemp.SQL.Text := 'SELECT IIBB, TOTAL FROM "Venta" WHERE ("Venta".FECHA >= ' +
    QuotedStr(DateToStr(DesdeDateTimePicker.Date)) + ' ) AND' +
    '  ("Venta".FECHA <= ' +
    QuotedStr(DateToStr(HastaDateTimePicker.Date)) + ' )' + '';
  dm.QTemp.Open;
  while dm.QTemp.Eof = False do
  begin
    iibb := iibb + dm.QTemp.FieldByName('IIBB').AsFloat;
    tot := tot + dm.QTemp.FieldByName('TOTAL').AsFloat;
    dm.QTemp.Next;
  end;
  SaldoEdit.Text := FloatToStr(iibb);
  TotalEdit.Text := FloatToStr(tot);
end;

procedure TPagoForm.FormCreate(Sender: TObject);
begin
  // dm := TDM.Create(Self);
  dm.ConfigQuery.Open;
end;

procedure TPagoForm.FormShow(Sender: TObject);
begin
  DesdeDateTimePicker.DateTime:=(now-30);
  HastaDateTimePicker.DateTime:=now;
end;

end.
