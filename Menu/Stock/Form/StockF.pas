unit StockF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, ExtCtrls,
  DataModule, Menus, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TStockForm = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    CodigoEdit: TEdit;
    DescripcionEdit: TEdit;
    Label3: TLabel;
    DBText1: TDBText;
    DataSource: TDataSource;
    VerTodosBitBtn: TBitBtn;
    AgregarBitBtn: TBitBtn;
    QuitarBitBtn: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    ArticuloBitBtn: TBitBtn;
    ActualizarBitBtn: TBitBtn;
    MainMenu1: TMainMenu;
    Salir1: TMenuItem;
    Operaciones1: TMenuItem;
    N1: TMenuItem;
    Licencia1: TMenuItem;
    Agregar1: TMenuItem;
    Quitar1: TMenuItem;
    Modificaciones1: TMenuItem;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Tabla: TIBQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure QuitarBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DescripcionEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CodigoEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CodigoEditExit(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure VerTodosBitBtnClick(Sender: TObject);
    procedure ActualizarBitBtnClick(Sender: TObject);
    procedure Agregar1Click(Sender: TObject);
    procedure Quitar1Click(Sender: TObject);
    procedure Modificaciones1Click(Sender: TObject);
    procedure VaciarBase1Click(Sender: TObject);
    procedure Licencia1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AgregarBitBtnClick(Sender: TObject);
    procedure ArticuloBitBtnClick(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure DEMOS1Click(Sender: TObject);
    procedure TablaAfterCancel(DataSet: TDataSet);
    procedure TablaAfterDelete(DataSet: TDataSet);
    procedure TablaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    cb: String;
    Precio, Proveedor: string;
    procedure buscar;
  end;

var
  StockForm: TStockForm;

implementation

uses AgregarCantidad;

{$R *.dfm}

procedure TStockForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(self);
end;

procedure TStockForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = VK_DOWN then
    DBGrid1.SetFocus;
end;

procedure TStockForm.ActualizarBitBtnClick(Sender: TObject);
begin
  VerTodosBitBtn.Click;
end;

procedure TStockForm.Agregar1Click(Sender: TObject);
begin
  ArticuloBitBtn.Click;
end;

procedure TStockForm.AgregarBitBtnClick(Sender: TObject);
begin
  AgregarCantidadForm := TAgregarCantidadForm.Create(self);
  try
    AgregarCantidadForm.ShowModal;
  finally
    If AgregarCantidadForm.CAntidadEdit.Text <> '0' then
    begin
      Tabla.sql.Text := 'UPDATE "Articulo" set DISPONIBLE = DISPONIBLE +' +
        AgregarCantidadForm.CAntidadEdit.Text + ' WHERE CODIGO=' +
        Tabla.FieldByName('CODIGO').AsString;
      Tabla.ExecSQL;
      //Tabla.Transaction.Commit;
    end;
    AgregarCantidadForm.Free;
  end;
  ActualizarBitBtn.Click;
end;

procedure TStockForm.ArticuloBitBtnClick(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(Path + 'Articulos.exe')), SW_SHOWNORMAL);
end;

procedure TStockForm.Quitar1Click(Sender: TObject);
begin
  ArticuloBitBtn.Click;
end;

procedure TStockForm.QuitarBitBtnClick(Sender: TObject);
begin
  AgregarCantidadForm := TAgregarCantidadForm.Create(self);
  try
    AgregarCantidadForm.ShowModal;
  finally
    If AgregarCantidadForm.CAntidadEdit.Text <> '0' then
    begin
      Tabla.sql.Text := 'UPDATE "Articulo" set DISPONIBLE = DISPONIBLE -' +
        AgregarCantidadForm.CAntidadEdit.Text + ' WHERE CODIGO=' +
        Tabla.FieldByName('CODIGO').AsString;
      Tabla.ExecSQL;
      //Tabla.Transaction.Commit;
    end;
    AgregarCantidadForm.Free;
  end;
  ActualizarBitBtn.Click;
end;

procedure TStockForm.Salir1Click(Sender: TObject);
begin
  close;
end;

procedure TStockForm.TablaAfterCancel(DataSet: TDataSet);
begin
  //Tabla.Transaction.Rollback;
end;

procedure TStockForm.TablaAfterDelete(DataSet: TDataSet);
begin
  //Tabla.Transaction.Commit;
end;

procedure TStockForm.TablaBeforePost(DataSet: TDataSet);
begin
  //Tabla.Transaction.Commit;
end;

procedure TStockForm.DEMOS1Click(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(Path + 'InstalarGeN.exe')), SW_SHOWNORMAL);
end;

procedure TStockForm.FormShow(Sender: TObject);
begin
  StockForm.caption := 'GeN - [Modulo de Stock] - ' + Licencia;
  VerTodosBitBtn.Click;
  if cb = 'si' then
    CodigoEdit.SetFocus
  else
    DescripcionEdit.SetFocus;
end;

procedure TStockForm.Licencia1Click(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(Path + 'Licencia.exe')), SW_SHOWNORMAL);
end;

procedure TStockForm.DescripcionEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not DBGrid1.Focused = True) and (Length(DescripcionEdit.Text) > 0) then
    buscar;
end;

procedure TStockForm.buscar;
begin
  Tabla.sql.Text := 'SELECT *' + ' FROM' + ' "Articulo"' +
    ' INNER JOIN "Proveedor" ON ("Articulo".PROVEEDOR = "Proveedor".CODIGO)' +
    ' WHERE ' + '("Articulo".CODIGO like ' + QuotedStr(CodigoEdit.Text + '%') +
    ')' + 'AND ("Articulo".DESCRIPCION like ' +
    QuotedStr(DescripcionEdit.Text + '%') + ')' +
    'ORDER BY "Articulo".DESCRIPCION';
  Tabla.Open;
end;

procedure TStockForm.Modificaciones1Click(Sender: TObject);
begin
  ArticuloBitBtn.Click;
end;

procedure TStockForm.N1Click(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(Path + 'about.exe')), SW_SHOWNORMAL);
end;

procedure TStockForm.VaciarBase1Click(Sender: TObject);
begin
  WinExec(PAnsiChar(AnsiString(Path + 'VaciarBase.exe')), SW_SHOWNORMAL);
  close;
end;

procedure TStockForm.VerTodosBitBtnClick(Sender: TObject);
begin
  DescripcionEdit.Text := '';
  CodigoEdit.Text := '';
  Tabla.sql.Text := 'SELECT *' + ' FROM' + ' "Articulo"' +
    ' INNER JOIN "Proveedor" ON ("Articulo".PROVEEDOR = "Proveedor".CODIGO)' +
    ' ORDER BY' + ' "Articulo".DESCRIPCION';
  Tabla.Open;
  DescripcionEdit.SetFocus;
end;

procedure TStockForm.CodigoEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not DBGrid1.Focused = True) and (Length(CodigoEdit.Text) > 0) then
    buscar;
end;

procedure TStockForm.CodigoEditExit(Sender: TObject);
begin
  DescripcionEdit.SetFocus;
end;

procedure TStockForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // ++LICENCIA
  IF Key = VK_F1 then
    WinExec(PAnsiChar(AnsiString(Path + 'Licencia.exe')), SW_SHOWNORMAL);
  // --LICENCIA
  IF Key = VK_F4 then
    ArticuloBitBtn.Click;
  IF Key = VK_F5 then
    ActualizarBitBtn.Click;
  IF Key = VK_F8 then
    AgregarBitBtn.Click;
  IF Key = VK_F9 then
    QuitarBitBtn.Click;

end;

end.
