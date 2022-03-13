unit PagoComisionCobrador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, Buttons, DBGrids, DB, ADODB, DataModule,
  OleCtrls, SHDocVw, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TPagoComisionCobradorForm = class(TForm)
    FechaDateTimePicker: TDateTimePicker;
    Label1: TLabel;
    Button2: TButton;
    CheckBox1: TCheckBox;
    BitBtn2: TBitBtn;
    ComisionEdit: TEdit;
    Label4: TLabel;
    RendidoEdit: TEdit;
    Label5: TLabel;
    Label3: TLabel;
    PagadoEdit: TEdit;
    Label6: TLabel;
    Label2: TLabel;
    NombreLabel: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label7: TLabel;
    Query: TIBQuery;
    Q: TIBQuery;
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RendidoEditExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    codigo, CtaAnticipo, CtaNombre, Fecha: string;
    { Public declarations }
  end;

var
  PagoComisionCobradorForm: TPagoComisionCobradorForm;

implementation

uses BuscarCobrador, ImprimirDM;

{$R *.dfm}

procedure TPagoComisionCobradorForm.Button2Click(Sender: TObject);
var
  i: integer;
begin
  Fecha := (FormatDateTime('mm/dd/yyyy hh:mm:ss',
    FechaDateTimePicker.DateTime));

  // Iniciar la Transaccion

  // Insertar en Rendido Cobrador
  Query.SQL.Text :=
    'Insert Into "RendidoCobrador" (COBRADOR, FECHA , RENDIDO, PAGADO, PROCESADO)'
    + ' Values (' + Edit1.Text + ', ' + QuotedStr(Fecha) + ',' +
    RendidoEdit.Text + ', ' + PagadoEdit.Text + ', ''SI'')';
  Query.ExecSQL;

  // CONTABILIDAD++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  // Insertar en la tabla LibroDiario
  // obtener el numero de asiento
  Q.SQL.Text := 'Select Max(ASIENTO) From "LibroDiario"';
  Q.Open;
  i := Q.Fields[0].AsInteger + 1;
  Q.Close;

  if strtofloat(PagadoEdit.Text) > 0.04 then // COMISION COBRADOR
  begin
    // renglon  - COMISION COBRADOR
    Q.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' + CtaNombre;
    Q.Open;

    Query.SQL.Text :=
      'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
      + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(Fecha) + ', ' +
      QuotedStr('Rendicion Cliente ' + NombreLabel.Caption + '') + ', ' +
      QuotedStr(Q.FieldByName('Jerarquia').AsString) + ', ' +
      QuotedStr(Q.FieldByName('DESCRIPCION').AsString) + ', ' + PagadoEdit.Text
      + ', 0, ' + QuotedStr(Oculto) + ' )';
    Query.ExecSQL;

    // renglon  - COMISION COBRADOR A PAGAR

    Q.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' + CtaAnticipo;
    Q.Open;
    Query.SQL.Text :=
      'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
      + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(Fecha) + ', ' +
      QuotedStr('Rendicion Cliente ' + NombreLabel.Caption + '') + ', ' +
      QuotedStr(Q.FieldByName('Jerarquia').AsString) + ', ' +
      QuotedStr(Q.FieldByName('DESCRIPCION').AsString) + ', 0, ' +
      PagadoEdit.Text + ', ' + QuotedStr(Oculto) + ' )';
    Query.ExecSQL;

    // PAGO DE COMISION

    // renglon  - COMISION COBRADOR A PAGAR
    Q.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' + CtaAnticipo;
    Q.Open;

    Query.SQL.Text :=
      'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
      + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(Fecha) + ', ' +
      QuotedStr('Rendicion Cliente ' + NombreLabel.Caption + '') + ', ' +
      QuotedStr(Q.FieldByName('Jerarquia').AsString) + ', ' +
      QuotedStr(Q.FieldByName('DESCRIPCION').AsString) + ', ' + PagadoEdit.Text
      + ', 0, ' + QuotedStr(Oculto) + ' )';
    Query.ExecSQL;

    // renglon  - CAJA

    Q.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' +
      DM.ConfigQuery.FieldByName('CtaCaja').AsString;
    Q.Open;
    Query.SQL.Text :=
      'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
      + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(Fecha) + ', ' +
      QuotedStr('Rendicion Cliente ' + NombreLabel.Caption + '') + ', ' +
      QuotedStr(Q.FieldByName('Jerarquia').AsString) + ', ' +
      QuotedStr(Q.FieldByName('DESCRIPCION').AsString) + ', 0, ' +
      PagadoEdit.Text + ', ' + QuotedStr(Oculto) + ' )';
    Query.ExecSQL;
  end;

  // CONTABILIDAD------------------------------------------------------------------------------

  // Completa la Transaccion
  Query.Transaction.Commit;

  if CheckBox1.Checked = True then
  begin
    Query.SQL.Text := 'SELECT * FROM "RendidoCobrador"';
    Query.Open;
    Query.Last;
    codigo := Query.FieldByName('Codigo').AsString;
    Query.Close;
    ImprimirDataModule := TImprimirDataModule.Create(self);
    ImprimirDataModule.SImpr('SELECT * FROM' + ' "RendidoCobrador"' +
      ' INNER JOIN "Cobrador"' +
      ' ON "RendidoCobrador".Cobrador = "Cobrador".Codigo' +
      ' WHERE "RendidoCobrador".Codigo=' + codigo, 'PagoCobrador');
    ImprimirDataModule.Free;
  end;
  Close;
end;

procedure TPagoComisionCobradorForm.BitBtn1Click(Sender: TObject);
begin
  BuscarCobradorForm := TBuscarCobradorForm.Create(self);
  try
    BuscarCobradorForm.ShowModal;
  finally
    with BuscarCobradorForm do
    begin
      Edit1.Text := Tabla.FieldByName('Codigo').AsString;
      NombreLabel.Caption := Tabla.FieldByName('Nombre').AsString;
      ComisionEdit.Text := Tabla.FieldByName('Comision').AsString;
      CtaNombre := Tabla.FieldByName('CtaNombre').AsString;
      CtaAnticipo := Tabla.FieldByName('CtaAnticipo').AsString;
    end;
    BuscarCobradorForm.Free;
  end;
  RendidoEdit.SetFocus;
end;

procedure TPagoComisionCobradorForm.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TPagoComisionCobradorForm.FormShow(Sender: TObject);
begin
  FechaDateTimePicker.DateTime := Now;
  BitBtn1.Click;
end;

procedure TPagoComisionCobradorForm.RendidoEditExit(Sender: TObject);
begin
  PagadoEdit.Text := FloatToStr(strtofloat(RendidoEdit.Text) *
    (strtofloat(ComisionEdit.Text) / 100));
  Button2.SetFocus;
end;

procedure TPagoComisionCobradorForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(self);
  DM.ConfigQuery.Open;
end;

procedure TPagoComisionCobradorForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end;
end;

end.
