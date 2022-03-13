unit AporteCapitalF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, DB, DataModule,
  ComCtrls, OleCtrls, SHDocVw, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TAporteCapitalForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    SiBitBtn: TBitBtn;
    NoBitBtn: TBitBtn;
    Tabla: TIBQuery;
    ImporteEdit: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Q: TIBQuery;
    FechaDateTimePicker: TDateTimePicker;
    Label9: TLabel;
    Label4: TLabel;
    BienDBCheckBox: TCheckBox;
    EfectivoDBCheckBox: TCheckBox;
    SocioBitBtn: TBitBtn;
    SocioEdit: TEdit;
    SocioLabel: TLabel;
    ArticuloBitBtn: TBitBtn;
    ArticuloEdit: TEdit;
    ArticuloLabel: TLabel;
    CantidadEdit: TEdit;
    Label5: TLabel;
    procedure SiBitBtnClick(Sender: TObject);
    procedure NoBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ImporteEditExit(Sender: TObject);
    procedure SocioBitBtnClick(Sender: TObject);
    procedure ArticuloBitBtnClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    CtaSocio, CtaAporte, CtaBien, SocioCtaTipo, SocioCtaNombre, ArticuloCtaTipo,
      ArticuloCtaNombre: string;
    aporte, ArticuloCosto: Double;
    { Public declarations }
  end;

var
  AporteCapitalForm: TAporteCapitalForm;

implementation

uses BuscaSocioF, UFBuscaArticulos;

{$R *.dfm}

procedure TAporteCapitalForm.ArticuloBitBtnClick(Sender: TObject);
begin
  FBuscaArticulo := TFBuscaArticulo.Create(self);
  try
    FBuscaArticulo.ShowModal;
  finally
    ArticuloEdit.Text := dm.qArticulo.FieldByName('CODIGO').AsString;
    ArticuloLabel.Caption := dm.qArticulo.FieldByName
      ('DESCRIPCION').AsString;
    ArticuloCtaTipo := dm.qArticulo.FieldByName('CTATIPO').AsString;
    ArticuloCtaNombre := dm.qArticulo.FieldByName('CTANOMBRE').AsString;
    ArticuloCosto := dm.qArticulo.FieldByName('COSTO').AsFloat;
    FBuscaArticulo.Free;
  end;
end;

procedure TAporteCapitalForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(self);
  DM.ConfigQuery.Open;
end;

procedure TAporteCapitalForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end;
end;

procedure TAporteCapitalForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Escape then
    Close;
end;

procedure TAporteCapitalForm.FormShow(Sender: TObject);
begin
  FechaDateTimePicker.DateTime := now;
end;

procedure TAporteCapitalForm.ImporteEditExit(Sender: TObject);
begin
  SiBitBtn.SetFocus;
end;

procedure TAporteCapitalForm.NoBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TAporteCapitalForm.SiBitBtnClick(Sender: TObject);
var
  i: integer;
begin
  Fecha := (FormatDateTime('mm/dd/yyyy hh:mm:ss',
    FechaDateTimePicker.DateTime));
  if BienDBCheckBox.Checked = True then
    aporte := ArticuloCosto * strtofloat(CantidadEdit.Text);
  if EfectivoDBCheckBox.Checked = True then
    aporte := aporte + strtofloat(ImporteEdit.Text);
  // Actualizar la tabla de Articulos
  Tabla.SQL.Text := 'Update "Articulo" Set Disponible = Disponible + ' +
    CantidadEdit.Text + ', Costo = ' + FloatToStr(ArticuloCosto) + ' Where ' +
    'CODIGO = ' + ArticuloEdit.Text;
  Tabla.ExecSQL;
  // Insertar en la tabla LibroDiario
  // obtener el numero de asiento
  Q.SQL.Text := 'Select Max(ASIENTO) From "LibroDiario"';
  Q.Open;
  i := Q.Fields[0].AsInteger + 1;
  Q.Close;
  // COMPRIMISO DE APORTE
  // renglon  - SOCIO XX
  Q.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' + SocioCtaTipo;
  Q.Open;
  Tabla.SQL.Text :=
    'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
    + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(Fecha) + ',' +
    QuotedStr('COMPROMISO DE APORTE CAPITAL SOCIAL') + ', ' +
    QuotedStr(Q.FieldByName('Jerarquia').AsString) + ', ' +
    QuotedStr(Q.FieldByName('DESCRIPCION').AsString) + ', ' + FloatToStr(aporte)
    + ', 0 ,' + QuotedStr(Oculto) + ' )';
  Tabla.ExecSQL;
  // renglon  - CAPITAL SOCIAL
  Q.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' +
    DM.ConfigQuery.FieldByName('CTACAPITALSOC').AsString;
  Q.Open;
  Tabla.SQL.Text :=
    'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
    + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(Fecha) + ', ' +
    QuotedStr('COMPROMISO DE APORTE CAPITAL SOCIAL') + ', ' +
    QuotedStr(Q.FieldByName('Jerarquia').AsString) + ', ' +
    QuotedStr(Q.FieldByName('DESCRIPCION').AsString) + ', 0, ' +
    FloatToStr(aporte) + ' ,' + QuotedStr(Oculto) + ' )';
  Tabla.ExecSQL;
  // APORTE
  i := i + 1;
  if BienDBCheckBox.Checked = True then // renglon  - BIENES
  begin
    Q.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' +
      ArticuloCtaTipo;
    Q.Open;
    Tabla.SQL.Text :=
      'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
      + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(Fecha) + ', ' +
      QuotedStr('APORTE CAPITAL SOCIAL') + ', ' +
      QuotedStr(Q.FieldByName('Jerarquia').AsString) + ', ' +
      QuotedStr(Q.FieldByName('DESCRIPCION').AsString) + ', ' +
      FloatToStr(ArticuloCosto * strtofloat(CantidadEdit.Text)) + ', 0 ,' +
      QuotedStr(Oculto) + ' )';
    Tabla.ExecSQL;
  end;
  if EfectivoDBCheckBox.Checked = True then // renglon  - CAJA
  begin
    Q.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' +
      DM.ConfigQuery.FieldByName('CTACAJA').AsString;
    Q.Open;
    Tabla.SQL.Text :=
      'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
      + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(Fecha) + ', ' +
      QuotedStr('APORTE CAPITAL SOCIAL') + ', ' +
      QuotedStr(Q.FieldByName('Jerarquia').AsString) + ', ' +
      QuotedStr(Q.FieldByName('DESCRIPCION').AsString) + ', ' + ImporteEdit.Text
      + ', 0 ,' + QuotedStr(Oculto) + ' )';
    Tabla.ExecSQL;
  end;
  // renglon  - SOCIO XX CTA APORTE
  Q.SQL.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' +
    SocioCtaNombre;
  Q.Open;
  Tabla.SQL.Text :=
    'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
    + ' Values ' + '( ' + IntToStr(i) + ', ' + QuotedStr(Fecha) + ', ' +
    QuotedStr('APORTE CAPITAL SOCIAL') + ', ' +
    QuotedStr(Q.FieldByName('Jerarquia').AsString) + ', ' +
    QuotedStr(Q.FieldByName('DESCRIPCION').AsString) + ', 0, ' +
    FloatToStr(aporte) + ' ,' + QuotedStr(Oculto) + ' )';
  Tabla.ExecSQL;
  //Tabla.Transaction.Commit;
  Close;
end;

procedure TAporteCapitalForm.SocioBitBtnClick(Sender: TObject);
begin
  BuscaSocioForm := TBuscaSocioForm.Create(self);
  try
    BuscaSocioForm.ShowModal;
  finally
    SocioEdit.Text := BuscaSocioForm.Tabla.FieldByName('CODIGO').AsString;
    SocioLabel.Caption := BuscaSocioForm.Tabla.FieldByName('NOMBRE').AsString;
    SocioCtaTipo := BuscaSocioForm.Tabla.FieldByName('CTATIPO').AsString;
    SocioCtaNombre := BuscaSocioForm.Tabla.FieldByName('CTANOMBRE').AsString;
    BuscaSocioForm.Free;
  end;
end;

end.
