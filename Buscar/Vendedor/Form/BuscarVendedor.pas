unit BuscarVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, DB, ImprimirDM, Grids, DBGrids, ExtCtrls,
  Buttons, DataModule, jpeg, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TBuscarVendedorForm = class(TForm)
    Panel2: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    DescripcionEdit: TEdit;
    Image1: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Buscar;
    procedure DescripcionEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Codigo, Nombre: string;
  end;

var
  BuscarVendedorForm: TBuscarVendedorForm;

implementation

{$R *.dfm}

procedure TBuscarVendedorForm.Buscar;
begin
  dm.qVendedor.SQL.Text := ' select * from "Vendedor" where   ("Vendedor".NOMBRE LIKE '
    + QuotedStr(DescripcionEdit.Text + '%') + ')';
  dm.qVendedor.Open;
end;

procedure TBuscarVendedorForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = VK_DOWN then
    DBGrid1.SetFocus;
end;

procedure TBuscarVendedorForm.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TBuscarVendedorForm.DBGrid1DblClick(Sender: TObject);
begin
  BitBtn1Click(DBGrid1);
end;

procedure TBuscarVendedorForm.DescripcionEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Buscar;
end;

procedure TBuscarVendedorForm.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TBuscarVendedorForm.FormShow(Sender: TObject);
begin
  if dm.qVendedor.Active = True then
    dm.qVendedor.Close;
  dm.qVendedor.Active := True;
end;

procedure TBuscarVendedorForm.Image1Click(Sender: TObject);
begin
  ImprimirDataModule := TImprimirDataModule.Create(self);
  ImprimirDataModule.CSV(dm.qVendedor.SQL.Text, 'VENDEDORES');
  ImprimirDataModule.Free;
end;

end.
