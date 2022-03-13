unit RendicionClienteLF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, StdCtrls, Buttons, ExtCtrls, DataModule, Grids,
  DBGrids, OleCtrls, SHDocVw, jpeg, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TRendicionClienteLForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    DTP1: TDateTimePicker;
    DTP2: TDateTimePicker;
    DBGrid1: TDBGrid;
    DataSource: TDataSource;
    Label3: TLabel;
    ClienteLabel: TLabel;
    ClienteEdit: TEdit;
    BuscarBitBtn: TBitBtn;
    ImprimirBitBtn: TBitBtn;
    ConsultarBitBtn: TBitBtn;
    Label8: TLabel;
    PlanLabel: TLabel;
    PlanEdit: TEdit;
    BuscarPlanProcesadoBitBtn: TBitBtn;
    Tabla: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure DTP1CloseUp(Sender: TObject);
    procedure DTP2CloseUp(Sender: TObject);
    procedure SalirBitBtnClick(Sender: TObject);
    procedure ConsultarBitBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ImprimirBitBtnClick(Sender: TObject);
    procedure BuscarBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BuscarPlanProcesadoBitBtnClick(Sender: TObject);
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
  RendicionClienteLForm: TRendicionClienteLForm;
  Compartido: PCompartido;
  FicheroM: THandle;

implementation

uses ImprimirDM, UFBuscaCliente, BuscarPlanFacturado;

{$R *.dfm}

Procedure TRendicionClienteLForm.EnvioRamTerminado;
begin
  UnmapViewOfFile(Compartido);
  CloseHandle(FicheroM);
end;

procedure TRendicionClienteLForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(Self);
  DTP2.DateTime := Now;
end;

procedure TRendicionClienteLForm.DTP1CloseUp(Sender: TObject);
begin
  If DTP1.Date > DTP2.Date then
  begin
    MessageDlg('Fecha de inicio no puede ser mayor que fecha de fin.', mtError,
      [mbOK], 0);
    DTP1.DateTime := DTP2.DateTime;
  end;
end;

procedure TRendicionClienteLForm.DTP2CloseUp(Sender: TObject);
begin
  If DTP2.Date < DTP1.Date then
  begin
    MessageDlg('Fecha de fin no puede ser menor que fecha de inicio.', mtError,
      [mbOK], 0);
    DTP2.DateTime := DTP1.DateTime;
  end;
end;

procedure TRendicionClienteLForm.SalirBitBtnClick(Sender: TObject);
begin
  Cancela := true;
  Close;
end;

procedure TRendicionClienteLForm.ConsultarBitBtnClick(Sender: TObject);
begin
  Tabla.SQL.Text := 'SELECT' + '  "CtaCteItem".CODIGO,  ' +
    '  "CtaCteItem".CUOTA,   ' + '  "CtaCteItem".VENCE,  ' +
    '  "CtaCteItem".IMPORTE, ' + '  "CtaCteItem".PAGADO,  ' +
    '  ("CtaCteItem".IMPORTE - "CtaCteItem".PAGADO) AS APAGAR,   ' +
    '  "Cliente".NOMBRE AS CLIENTE,     ' + '  "CtaCte".OPERACION, ' +
    '  "Cobrador".NOMBRE AS COBRADOR, ' + '  "CtaCte".CUOTAS, ' +
    '  "CtaCte".SALDO, ' + '  "CtaCte".RENDIDAS ' + ' FROM' + '  "CtaCte" ' +
    '  INNER JOIN "CtaCteItem" ON ("CtaCte".OPERACION = "CtaCteItem".OPERACION)'
    + '  INNER JOIN "Cliente" ON ("CtaCte".CLIENTE = "Cliente".CODIGO)' +
    '  INNER JOIN "Cobrador" ON ("CtaCte".COBRADOR = "Cobrador".CODIGO)' +
    ' WHERE ' + '  ("CtaCteItem".VENCE >= ' + QuotedStr(DateToStr(DTP1.Date)) +
    ') AND ' + '  ("CtaCteItem".VENCE <= ' + QuotedStr(DateToStr(DTP2.Date)) +
    ') AND ' + '  ("CtaCte".OPERACION = ' + PlanEdit.Text + '  ) AND ' +
    '  ("CtaCte".CLIENTE = ' + ClienteEdit.Text + ') ' +
    ' ORDER BY "CtaCteItem".CUOTA DESC' + '';
  Tabla.Open;
end;

procedure TRendicionClienteLForm.FormDestroy(Sender: TObject);
begin
  EnvioRamTerminado;
end;

procedure TRendicionClienteLForm.FormShow(Sender: TObject);
begin
  BuscarBitBtn.Click;
  BuscarPlanProcesadoBitBtn.Click;
end;

procedure TRendicionClienteLForm.ImprimirBitBtnClick(Sender: TObject);
begin
  ImprimirDataModule := TImprimirDataModule.Create(Self);
  ImprimirDataModule.SImpr(Tabla.SQL.Text, 'RendicionCliente');
  ImprimirDataModule.Free;
end;

procedure TRendicionClienteLForm.BuscarPlanProcesadoBitBtnClick
  (Sender: TObject);
begin
  BuscarPlanFacturadoForm := TBuscarPlanFacturadoForm.Create(Self);
  BuscarPlanFacturadoForm.Edit4.Text := ClienteEdit.Text;
  try
    BuscarPlanFacturadoForm.ShowModal;
  finally
    PlanEdit.Text := BuscarPlanFacturadoForm.Tabla.FieldByName
      ('OPERACION').AsString;
    PlanLabel.Caption := BuscarPlanFacturadoForm.Tabla.FieldByName
      ('DESCRIPCION').AsString;
    BuscarPlanFacturadoForm.Free;
  end;
end;

procedure TRendicionClienteLForm.BuscarBitBtnClick(Sender: TObject);
begin
  FBuscaCliente := TFBuscaCliente.Create(Self);
  try
    FBuscaCliente.ShowModal;
  finally
    with FBuscaCliente do
    begin
      ClienteEdit.Text := FBuscaCliente.Tabla.FieldByName('CODIGO').AsString;
      ClienteLabel.Caption := FBuscaCliente.Tabla.FieldByName('NOMBRE')
        .AsString;
    end;
    FBuscaCliente.Free;
  end;
  ConsultarBitBtn.Click;
end;

end.
