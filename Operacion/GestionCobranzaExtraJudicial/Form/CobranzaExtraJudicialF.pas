unit CobranzaExtraJudicialF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, ImprimirDM, Mask, DBCtrls, StdCtrls,
  Buttons, ComCtrls, DataModule, OleCtrls, SHDocVw, IBX.IBCustomDataSet,
  IBX.IBQuery;

type
  TCobranzaExtraJudicialForm = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    ImprimirBitBtn: TBitBtn;
    DS: TDataSource;
    CodigoDBText: TDBText;
    NombreDBText: TDBText;
    DiasEdit: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    JudicialBitBtn: TBitBtn;
    ExtraJudicialBitBtn: TBitBtn;
    DBGrid1: TDBGrid;
    GrillaQ: TIBQuery;
    Tabla: TIBQuery;
    procedure CancelarBitBtnClick(Sender: TObject);
    procedure SeleccionarBitBtnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure ImprimirBitBtnClick(Sender: TObject);
    procedure DiasEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ExtraJudicialBitBtnClick(Sender: TObject);
    procedure JudicialBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Fecha: string;
    procedure Consulta;
    { Public declarations }
  end;

var
  CobranzaExtraJudicialForm: TCobranzaExtraJudicialForm;

implementation

{$R *.dfm}

procedure TCobranzaExtraJudicialForm.CancelarBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TCobranzaExtraJudicialForm.DBGrid1DblClick(Sender: TObject);
begin
  SeleccionarBitBtnClick(DBGrid1);
end;

procedure TCobranzaExtraJudicialForm.DBGrid1Enter(Sender: TObject);
begin
  SeleccionarBitBtnClick(DBGrid1);
end;

procedure TCobranzaExtraJudicialForm.DiasEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if DiasEdit.Text <> '' then
    Consulta;
end;

procedure TCobranzaExtraJudicialForm.ExtraJudicialBitBtnClick(Sender: TObject);
begin
  Tabla.SQL.Text := 'Update "CtaCte" Set Cobranza = 1 Where ' +
    '("CtaCte".CLIENTE = ' + GrillaQ.FieldByName('CLIENTE').AsString +
    ') and ("CtaCte".OPERACION = ' + GrillaQ.FieldByName('OPERACION')
    .AsString + ')';
  Tabla.ExecSQL;
  //Tabla.Transaction.Commit;
  Consulta;
end;

procedure TCobranzaExtraJudicialForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(Self);
  DM.ConfigQuery.Open;
end;

procedure TCobranzaExtraJudicialForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = VK_DOWN then
    DBGrid1.SetFocus;
end;

procedure TCobranzaExtraJudicialForm.FormShow(Sender: TObject);
begin
  DiasEdit.Text := DM.ConfigQuery.FieldByName('GesCobExtraJudicial').AsString;
  Consulta;
end;

procedure TCobranzaExtraJudicialForm.ImprimirBitBtnClick(Sender: TObject);
begin
  ImprimirDataModule := TImprimirDataModule.Create(Self);
  ImprimirDataModule.SImpr(GrillaQ.SQL.Text, 'DeudoresPorCredito');
  ImprimirDataModule.Free;
end;

procedure TCobranzaExtraJudicialForm.JudicialBitBtnClick(Sender: TObject);
begin
  Tabla.SQL.Text := 'Update "CtaCte" Set COBRANZA = 3 Where ' +
    '("CtaCte".CLIENTE = ' + GrillaQ.FieldByName('CLIENTE').AsString +
    ') and ("CtaCte".OPERACION = ' + GrillaQ.FieldByName('OPERACION')
    .AsString + ')';
  Tabla.ExecSQL;
  //Tabla.Transaction.Commit;
  Consulta;
end;

procedure TCobranzaExtraJudicialForm.SeleccionarBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TCobranzaExtraJudicialForm.Consulta;
begin
  Fecha := FormatDateTime('mm/dd/yyyy', (now - StrToInt(DiasEdit.Text)));
  GrillaQ.SQL.Text := 'SELECT' + '  "CtaCteItem".VENCE,' + '  "Cliente".NOMBRE,'
    + '  "CtaCteItem".CUOTA,' + '  "CtaCteItem".PAGADO,' +
    '  "CtaCteItem".IMPORTE,' + '  "CtaCteItem".DESCRIPCION,' +
    '  "CtaCte".CLIENTE,' + '  "CtaCte".OPERACION' + ' FROM' + '  "CtaCte"' +
    '  INNER JOIN "Cliente" ON ("CtaCte".CLIENTE = "Cliente".CODIGO)' +
    '  INNER JOIN "CtaCteItem" ON ("CtaCte".OPERACION = "CtaCteItem".OPERACION)'
    + ' WHERE' + '  ("CtaCteItem".PAGADO < "CtaCteItem".IMPORTE) AND' +
    '  ("CtaCteItem".VENCE < ' + QuotedStr(Fecha) + ') AND' +
    '  ("CtaCte".COBRANZA = 2)' + ' ORDER BY' + '  "CtaCteItem".VENCE' + '';
  GrillaQ.Open;
end;

end.
