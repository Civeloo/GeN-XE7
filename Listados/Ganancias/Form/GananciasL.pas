unit GananciasL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, StdCtrls, Buttons, ExtCtrls, DataModule, Grids,
  DBGrids, ImprimirDM, DBCtrls, jpeg, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TGanaciaxVtaLForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    DTP1: TDateTimePicker;
    DTP2: TDateTimePicker;
    SiBitBtn: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Debe: TLabel;
    Haber: TLabel;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    Saldo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DTP1CloseUp(Sender: TObject);
    procedure DTP2CloseUp(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SiBitBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    Procedure EnvioRamTerminado;
    { Private declarations }
  public
    Cancela: Boolean;
    Reporte, Cuenta: String;
    { Public declarations }
  end;

type
  TCompartido = record
    Numero: Integer;
    Cadena: String[20];
  end;

  PCompartido = ^TCompartido;

var
  GanaciaxVtaLForm: TGanaciaxVtaLForm;
  Compartido: PCompartido;
  FicheroM: THandle;

implementation

{$R *.dfm}

Procedure TGanaciaxVtaLForm.EnvioRamTerminado;
begin
  UnmapViewOfFile(Compartido);
  CloseHandle(FicheroM);
end;

procedure TGanaciaxVtaLForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(self);
  dm.qCuenta.Open;
  DTP2.DateTime := Now + 1;
  DM.ConfigQuery.Open;
end;

procedure TGanaciaxVtaLForm.DTP1CloseUp(Sender: TObject);
begin
  If DTP1.Date > DTP2.Date then
  begin
    MessageDlg('Fecha de inicio no puede ser mayor que fecha de fin.', mtError,
      [mbOK], 0);
    DTP1.DateTime := DTP2.DateTime;
  end;
end;

procedure TGanaciaxVtaLForm.DTP2CloseUp(Sender: TObject);
begin
  If DTP2.Date < DTP1.Date then
  begin
    MessageDlg('Fecha de fin no puede ser menor que fecha de inicio.', mtError,
      [mbOK], 0);
    DTP2.DateTime := DTP1.DateTime;
  end;
end;

procedure TGanaciaxVtaLForm.BitBtn2Click(Sender: TObject);
begin
  Cancela := true;
  Close;
end;

procedure TGanaciaxVtaLForm.SiBitBtnClick(Sender: TObject);
var
  i: Integer;
begin
  Debe.Caption := '0';
  Haber.Caption := '0';
  Saldo.Caption := '0';
  dm.qGanancia.SQL.Text := 'SELECT ' + QuotedStr(DM.ConfigQuery.FieldByName('Nombre')
    .AsString) + ' AS Empresa, ' + QuotedStr(DateToStr(DTP1.Date)) +
    ' AS Desde,  ' + QuotedStr(DateToStr(DTP2.Date)) + ' AS Hasta, ' +
    ' "LibroDiario".ASIENTO, ' + ' "LibroDiario".FECHA, ' +
    ' "LibroDiario".LEYENDA, ' + ' "LibroDiario".JERARQUIA, ' +
    ' "LibroDiario".CUENTA, ' + ' "LibroDiario".DEBE, ' +
    ' "LibroDiario".HABER, ' +
    ' ("LibroDiario".DEBE - "LibroDiario".HABER) AS "SubTotal", ' +
    ' "LibroDiario".OCULTO, ' + ' "Cuenta".CODIGO, ' + ' "Cuenta".RUBRO, ' +
    ' "Cuenta".CAPITULO, ' + ' "Cuenta".TIPOGASTO, ' + ' "Cuenta".DESCRIPCION, '
    + ' "Cuenta".SALDO, ' + ' "Cuenta".LEYENDADEUDORA, ' +
    ' "Cuenta".LEYENDAHACREEDORA ' + ' FROM ' + ' "LibroDiario" ' +
    ' INNER JOIN "Cuenta" ON ("LibroDiario".CUENTA = "Cuenta".DESCRIPCION)' +
    ' WHERE        ' + ' ("LibroDiario".FECHA >= ' +
    QuotedStr(DateToStr(DTP1.Date)) + ' ) AND ' + ' ("LibroDiario".FECHA <= ' +
    QuotedStr(DateToStr(DTP2.Date)) + ' ) AND  ' + ' ( ("Cuenta".CODIGO = ' +
    DM.ConfigQuery.FieldByName('CTAVENTA').AsString + ') OR ' +
    ' ("Cuenta".CODIGO = ' + DM.ConfigQuery.FieldByName('CtaCMV').AsString +
    ') )' + '';
  {
    // ShortDateFormat := '#yyyy/mm/dd#';
    dm.qGanancia.SQL.Add(' WHERE (FECHA >= '+QuotedStr(DateToStr(DTP1.Date))+') AND (FECHA <= '+QuotedStr(DateToStr(DTP2.Date))+')');
    dm.qGanancia.SQL.Add(' AND (("Cuenta".CODIGO = '+DM.ConfigQuery.FieldByName('CTAVENTA').AsString+') OR ("Cuenta".CODIGO = '+DM.ConfigQuery.FieldByName('CtaCMV').AsString+'))');

    // ShortDateFormat := 'dd/mm/yyyy';
  }
  dm.qGanancia.Open;
  for i := 1 to dm.qGanancia.RecordCount do
  begin
    Debe.Caption := FloatToStr(StrToFloat(Debe.Caption) +
      dm.qGanancia.FieldByName('Debe').AsFloat);
    Haber.Caption := FloatToStr(StrToFloat(Haber.Caption) +
      dm.qGanancia.FieldByName('Haber').AsFloat);
    Saldo.Caption := FloatToStr(StrToFloat(Haber.Caption) -
      StrToFloat(Debe.Caption));
    dm.qGanancia.Next;
  end;
end;

procedure TGanaciaxVtaLForm.FormDestroy(Sender: TObject);
begin
  EnvioRamTerminado;
end;

procedure TGanaciaxVtaLForm.BitBtn3Click(Sender: TObject);
begin
  ImprimirDataModule := TImprimirDataModule.Create(self);
  ImprimirDataModule.SImpr(dm.qGanancia.SQL.Text, 'GananciaXvta');
  ImprimirDataModule.Free;
end;

end.
