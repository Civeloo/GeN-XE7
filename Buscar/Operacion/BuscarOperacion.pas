unit BuscarOperacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGrids, DataModule, ExtCtrls,
  jpeg, ImprimirDM, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TBuscarOperacionForm = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    ventaEdit: TEdit;
    Panel2: TPanel;
    SiBitBtn: TBitBtn;
    LetraEdit: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    FacturarBitBtn: TBitBtn;
    Image1: TImage;
    todoBitBtn: TBitBtn;
    EnviarEmailCheckBox: TCheckBox;
    AnuladaCheckBox: TCheckBox;
    TipoRadioGroup: TRadioGroup;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure NoBitBtnClick(Sender: TObject);
    procedure SiBitBtnClick(Sender: TObject);
    procedure todoBitBtnClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActualizarGrilla(nro,letra:string);
    procedure FormShow(Sender: TObject);
    procedure FacturarBitBtnClick(Sender: TObject);
    procedure TipoRadioGroupClick(Sender: TObject);
    procedure EnviarEmailCheckBoxClick(Sender: TObject);
  private
    procedure TraerPedidos;
    { Private declarations }
  public
    { Public declarations }
    Codigo, CodProve, Tipo: String;
    salir, Cancela, anular, esCompra, esNotaCredito, esPedido: boolean;
  end;

var
  BuscarOperacionForm: TBuscarOperacionForm;

implementation

{$R *.dfm}

uses OperacionF;

procedure TBuscarOperacionForm.ActualizarGrilla;
var sql, where,anulada,buscar:string;
begin
  if (not AnuladaCheckBox.Checked) then anulada := ' (ANULADA IS NULL) ';
  if ((nro <> '') or (letra <> '')) then
    buscar := ' (CODIGO like ' + QuotedStr(nro + '%') + '  ) '
    + ' AND (LETRA like ' + QuotedStr(letra + '%') + ' )';
  if (buscar = '') then
  begin
    if anulada<>'' then where := anulada;
  end
  else
  begin
    where := buscar;
    if anulada<>'' then
    begin
      if where<>'' then where := where +' AND ';
      where := where + anulada;
    end;
  end;
  if TipoRadioGroup.ItemIndex=1 then//esRemito
  begin
    if where<>'' then where := where +' AND ';
    where := where + '(TIPO=''PED'')';
  end 
  else
    if TipoRadioGroup.ItemIndex=4 then//esNotadeCredito
    begin
      if where<>'' then where := where +' AND ';
      where := where + '(TIPO like ''NC%'')';
    end;  
  case TipoRadioGroup.ItemIndex of
    0 : sql := 'SELECT ' + ventaTSql;
    1 : sql := 'SELECT ' + OperacionSql;
    2 : sql := 'SELECT ' + presupuestoTSql;
    3 : sql := 'SELECT ' + compraTSql;
    4 : sql := 'SELECT ' + OperacionSql;
  end;
  if where<>'' then where := ' WHERE ' + where;
  dm.qOperacion.Open(sql + where);
  dm.qOperacion.Last;
end;

procedure TBuscarOperacionForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Escape then
  begin
    salir := True;
    Close;
  end;
  if not DBGrid1.Focused = True then
  begin
    ActualizarGrilla(ventaEdit.Text,LetraEdit.Text);
  end;
end;

procedure TBuscarOperacionForm.FormShow(Sender: TObject);
begin
  if anular then
  begin
    SiBitBtn.Caption := 'Seleccionar';
    Image1.Visible := False;
  end;
  if esCompra then TipoRadioGroup.ItemIndex:=3
  else if esNotaCredito then TipoRadioGroup.ItemIndex:=4
  else if (esPedido) then TipoRadioGroup.ItemIndex := 1;
  todoBitBtn.Click;
end;

procedure TBuscarOperacionForm.Image1Click(Sender: TObject);
begin
  ImprimirDataModule := TImprimirDataModule.Create(self);
  ImprimirDataModule.CSV(dm.qOperacion.SQL.Text, 'VENTAS');
  ImprimirDataModule.Free;
end;

procedure TBuscarOperacionForm.NoBitBtnClick(Sender: TObject);
begin
  Cancela := True;
  Codigo := '';
  Close;
end;

procedure TBuscarOperacionForm.SiBitBtnClick(Sender: TObject);
var
  nro, letra: string;
begin
  Codigo := dm.qOperacion.FieldByName('CODIGO').AsString;
  // IMPRIMIR
  if (not anular) and (dm.ConfigQuery.FieldByName('Imprimir').AsString = 'SI') then
  begin
    nro := dm.qOperacion.FieldByName('CODIGO').AsString;
    letra := dm.qOperacion.FieldByName('LETRA').AsString;
    ImprimirDataModule := TImprimirDataModule.Create(self);
    with ImprimirDataModule do
      case TipoRadioGroup.ItemIndex of
        0 : Impr(ImprimirDataModule.VTA(nro, letra), letra);
        1 : Impr(oper(nro, 'PED', letra), 'PED'+letra);//'CTicket');
        2 : Impr(ImprimirDataModule.PRE(nro, letra), 'P'+letra);
        3 : Impr(ImprimirDataModule.COMP(nro, letra), letra);
        4 : Impr(oper(nro, 'NC' + letra, letra), 'NC' + letra);
      end;
    ImprimirDataModule.Free;
  end;
  envEmail:=False;
  Close;
end;

procedure TBuscarOperacionForm.TipoRadioGroupClick(Sender: TObject);
begin
  if (TipoRadioGroup.ItemIndex=1) then TraerPedidos;
  todoBitBtn.Click;
end;

procedure TBuscarOperacionForm.TraerPedidos;
begin
    if (wpSync) then dm.WooCommerceGeN('GetOrders','');
    FacturarBitBtn.Visible := True;
end;

procedure TBuscarOperacionForm.todoBitBtnClick(Sender: TObject);
var sql:string;
begin
  ActualizarGrilla('','');
end;

procedure TBuscarOperacionForm.DBGrid1DblClick(Sender: TObject);
begin
  SiBitBtnClick(DBGrid1);
end;

procedure TBuscarOperacionForm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = VK_DOWN then
    DBGrid1.SetFocus;
end;

procedure TBuscarOperacionForm.EnviarEmailCheckBoxClick(Sender: TObject);
begin
  envEmail:=EnviarEmailCheckBox.Checked;
end;

procedure TBuscarOperacionForm.FacturarBitBtnClick(Sender: TObject);
var codRem : string;
begin
  if (TipoRadioGroup.ItemIndex=1) and (dm.qOperacion.RecordCount>0) then
  begin
    codRem := dm.qOperacion.FieldByName('CODIGO').AsString;
    dm.qOperacion.SQL.Text:='SELECT "Venta".REMITO FROM "Venta" WHERE "Venta".REMITO='+QuotedStr(codRem);
    dm.qOperacion.Open;
    If dm.qOperacion.RecordCount > 0 then
    begin
      ShowMessage('¡Remito ya facturado!');
      todoBitBtn.Click;
    end
    else
    begin
      OperacionForm := TOperacionForm.Create(self);
      OperacionForm.codRem := codRem;
      try
        OperacionForm.ShowModal;
      finally
        OperacionForm.Free;
      end;
    end;
  end;
end;

procedure TBuscarOperacionForm.FormCreate(Sender: TObject);
begin
  dm.ConfigQuery.Open;
end;

procedure TBuscarOperacionForm.FormDestroy(Sender: TObject);
begin
  dm.qOperacion.Close;
end;

end.
