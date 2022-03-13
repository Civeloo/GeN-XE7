unit LibrosF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ImprimirDM, ComCtrls, StdCtrls, Buttons, ExtCtrls, DataModule,
  Grids, DBGrids, OleCtrls, SHDocVw, jpeg, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TLibrosForm = class(TForm)
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    bProcesar: TBitBtn;
    bImprimir: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    DTP1: TDateTimePicker;
    DTP2: TDateTimePicker;
    iExp: TImage;
    bSiap: TButton;
    procedure FormCreate(Sender: TObject);
    procedure DTP1CloseUp(Sender: TObject);
    procedure DTP2CloseUp(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bProcesarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bImprimirClick(Sender: TObject);
    procedure iExpClick(Sender: TObject);
    procedure bSiapClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sql, rpt, siap, tabla : string;
    procedure EnvioRamTerminado;
//    function FechaDesdeHasta(tabla:string):string;
  public
    Cancela, Venta, Compra: Boolean;
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
  LibrosForm: TLibrosForm;
  Compartido: PCompartido;
  FicheroM: THandle;

implementation

{$R *.dfm}

uses OperacionDM;

Procedure TLibrosForm.EnvioRamTerminado;
begin
//  UnmapViewOfFile(Compartido);
//  CloseHandle(FicheroM);
end;

//function TLibrosForm.FechaDesdeHasta(tabla: string): string;
//begin
//  result:=' WHERE'
//    +' ("'+tabla+'".FECHA > ' + QuotedStr(DateToStr(DTP1.Date-1)) + ' ) AND '
//    +' ("'+tabla+'".FECHA < ' + QuotedStr(DateToStr(DTP2.Date+1)) + ' )   ';
//end;

procedure TLibrosForm.FormCreate(Sender: TObject);
begin
  DM.ConfigQuery.Open;
  DTP2.DateTime := Now;
end;

procedure TLibrosForm.DTP1CloseUp(Sender: TObject);
begin
  If DTP1.Date > DTP2.Date then
  begin
    MessageDlg('Fecha de inicio no puede ser mayor que fecha de fin.', mtError,
      [mbOK], 0);
    DTP1.DateTime := DTP2.DateTime;
  end;
end;

procedure TLibrosForm.DTP2CloseUp(Sender: TObject);
begin
  If DTP2.Date < DTP1.Date then
  begin
    MessageDlg('Fecha de fin no puede ser menor que fecha de inicio.', mtError,
      [mbOK], 0);
    DTP2.DateTime := DTP1.DateTime;
  end;
end;

procedure TLibrosForm.BitBtn2Click(Sender: TObject);
begin
  Cancela := true;
  Close;
end;

procedure TLibrosForm.bProcesarClick(Sender: TObject);
begin
  OperacionDataModule := TOperacionDataModule.Create(self);
  with OperacionDataModule do begin
    try
      if Venta then
      begin
        ActualizarSiap
          ('Vta',
            DateToStr(DTP1.Date),
            DateToStr(DTP2.Date)
          );
      end
      else if Compra then ActualizarSiap
        ('Cmp',
          DateToStr(DTP1.Date),
          DateToStr(DTP2.Date)
        );
    finally
      Free;
    end;
  end;
  dm.qLibro.SQL.Text := 'SELECT ' +
  QuotedStr(DM.ConfigQuery.FieldByName('Nombre').AsString) + ' AS Empresa, ' +
//  QuotedStr(DateToStr(DTP1.Date)) + ' AS Desde,  ' +
//  QuotedStr(DateToStr(DTP2.Date)) + ' AS Hasta, ' +
  sql + ' WHERE'
  +' (FECHA >= ' + QuotedStr(DateToStr(DTP1.Date)) + ' ) AND '
  +' (FECHA <= ' + QuotedStr(DateToStr(DTP2.Date)) + ' )   '
  + 'ORDER BY CODIGO';
  dm.qLibro.Open;
end;

procedure TLibrosForm.FormDestroy(Sender: TObject);
begin
//  EnvioRamTerminado;
  dm.qLibro.Close;
end;

procedure TLibrosForm.FormShow(Sender: TObject);
begin
  if Venta then  begin
    tabla:='Venta';
    Caption := 'Libro IVA Ventas';
    sql:=
    '  "LibroIVAventa".FECHA, '+
    '  "LibroIVAventa".NG1, "LibroIVAventa".NG2,      ' +
    '  "LibroIVAventa".NG3, "LibroIVAventa".IVA1,    ' +
    '  "LibroIVAventa".IVA2, "LibroIVAventa".IVA3,     ' +
    '  "LibroIVAventa".OEIIBB, "LibroIVAventa".IDERPYPAC,  ' +
    '  "LibroIVAventa".ITF, "LibroIVAventa".FACTURA, '+
    ' "LibroIVAventa".CLIENTE,  ' +
    '  "LibroIVAventa".CUIT, "LibroIVAventa".CONDICION, "LibroIVAventa".CODIGO'+
    ' FROM "LibroIVAventa"';
    rpt := 'libroIVAVentas';
    siap := 'SiapVtaComp';
  end
  else if Compra then begin
    tabla:='Compra';
    Caption:='Libro IVA Compras';
    sql:= '  "LibroIVAcompra".FECHA,    '+
    '  "LibroIVAcompra".NG1,      ' + '  "LibroIVAcompra".NG2,      ' +
    '  "LibroIVAcompra".NG3,     ' + '  "LibroIVAcompra".IVA1,    ' +
    '  "LibroIVAcompra".IVA2,    ' + '  "LibroIVAcompra".IVA3,     ' +
    '  "LibroIVAcompra".OEIIBB,    ' + '  "LibroIVAcompra".IDERPYPAC,  ' +
    '  "LibroIVAcompra".ITF,     ' +'  "LibroIVAcompra".FACTURA,   '+
    '  "LibroIVAcompra".PROVEEDOR,  '+'  "LibroIVAcompra".CUIT,      '+
    '  "LibroIVAcompra".CONDICION, ' + ' "LibroIVAcompra".CODIGO  '+
    ' FROM                    ' +
    '  "LibroIVAcompra" ';
    rpt := 'LibroIVACompras';
    siap := 'SiapCmpComp';
  end;
end;

procedure TLibrosForm.iExpClick(Sender: TObject);
begin
  ImprimirDataModule := TImprimirDataModule.Create(Self);
  with ImprimirDataModule do begin
    CSV(dm.qLibro.SQL.Text, 'LIBRO IVA VENTAS');
    Free;
  end;
end;

procedure TLibrosForm.bImprimirClick(Sender: TObject);
begin
  if dm.qLibro.Active = true then
  begin
    ImprimirDataModule := TImprimirDataModule.Create(Self);
    with ImprimirDataModule do begin
      SImpr(dm.qLibro.SQL.Text, rpt);
      Free;
    end;
  end;
end;

procedure TLibrosForm.bSiapClick(Sender: TObject);
var w,s:string;
begin
  s:='select * from ';
  w := ' where'
   +' CbteFch >= '+FormatDateTime('yyyymmdd',DTP1.Date)
   +' and CbteFch <= '+FormatDateTime('yyyymmdd',DTP2.Date);
  ImprimirDataModule := TImprimirDataModule.Create(Self);
  try
    with ImprimirDataModule do
    begin
      frxDBDataset1.DataSet:=dm.qSdbReporte;
      dm.qSdbReporte.Open(s + siap + w );
      ExportarReporteTXT(siap);
      s:=
      s + siap+'Alicuota'
       +' inner join '+ siap +' on '+ siap +'.Codigo='+ siap +'Alicuota.Codigo'
       + w
       +' Order By '+ siap +'Alicuota.Codigo';

      dm.qSdbReporte.Open(s);
      ExportarReporteTXT(siap+'Alicuota');
    end;
  finally
    ImprimirDataModule.Free;
  end;
end;

end.
