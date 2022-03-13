unit RetiroCajaF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, DB, DataModule,
  ComCtrls, OleCtrls, SHDocVw, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TRetiroCajaForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    SiBitBtn: TBitBtn;
    NoBitBtn: TBitBtn;
    ImporteEdit: TEdit;
    SocioDBLookupComboBox: TDBLookupComboBox;
    Label3: TLabel;
    FechaDateTimePicker: TDateTimePicker;
    Label9: TLabel;
    SocioT: TIBQuery;
    SocioDS: TDataSource;
    Label2: TLabel;
    DescripcionEdit: TEdit;
    procedure SiBitBtnClick(Sender: TObject);
    procedure NoBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ImporteEditExit(Sender: TObject);
  private
    { Private declarations }
  public
    CtaSocio, CtaAporte, CtaBien, Bien: string;
    { Public declarations }
  end;

var
  RetiroCajaForm: TRetiroCajaForm;

implementation

uses OperacionDM;

{$R *.dfm}

procedure TRetiroCajaForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(Self);
  DM.ConfigQuery.Open;
  SocioT.Open;
  SocioT.Last;
end;

procedure TRetiroCajaForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end;
end;

procedure TRetiroCajaForm.FormShow(Sender: TObject);
begin
  // FechaDateTimePicker.DateTime:=now;
end;

procedure TRetiroCajaForm.ImporteEditExit(Sender: TObject);
begin
  SiBitBtn.SetFocus;
end;

procedure TRetiroCajaForm.NoBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TRetiroCajaForm.SiBitBtnClick(Sender: TObject);
begin
  OperacionDataModule := TOperacionDataModule.Create(Self);
  OperacionDataModule.MovCaja('RETIRO',
    VarToStr(SocioDBLookupComboBox.KeyValue), ImporteEdit.Text,
    DescripcionEdit.Text);
  Close;
  { Fecha := FormatDateTime('mm/dd/yyyy hh:mm:ss', now);

    //Insertar en la tabla LibroDiario
    //obtener el numero de asiento
    q.SQL.Text := 'Select Max(ASIENTO) From "LibroDiario"';
    q.Open;
    i := q.Fields[0].AsInteger+1;
    q.Close;

    //RETIRO DE CAJA

    // renglon  - SOCIO XX
    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+SocioT.FieldByName('CTAANTICIPO').AsString;
    q.Open;
    Tabla.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+','+QuotedStr('COMPROMISO DE APORTE CAPITAL SOCIAL')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', '+ImporteEdit.Text+', 0, '+QuotedStr(Oculto)+
    ' )';
    Tabla.ExecSQL;

    if StrToFloat(ImporteEdit.Text) > 0 then // renglon  - CAJA
    begin
    q.SQL.Text:='select * from "Cuenta" where "Cuenta".CODIGO='+DM.ConfigQuery.FieldByName('CTACAJA').AsString;
    q.Open;
    Tabla.SQL.Text := 'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'+
    ' Values '+
    '( '+IntToStr(i)+', '+QuotedStr(Fecha)+', '+QuotedStr('APORTE CAPITAL SOCIAL')+', '+QuotedStr(q.FieldByName('Jerarquia').AsString)+', '+QuotedStr(q.FieldByName('DESCRIPCION').AsString)+', 0, '+ImporteEdit.Text+', '+QuotedStr(Oculto)+
    ' )';
    Tabla.ExecSQL;
    end; }

end;

end.
