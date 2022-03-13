unit UFBuscaProve;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls,
  Buttons, DataModule, jpeg, ImprimirDM, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFBuscaProve = class(TForm)
    Panel2: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    SiBitBtn: TBitBtn;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    DescripcionEdit: TEdit;
    Image1: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SiBitBtnClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure NoBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DescripcionEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Buscar;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    salir : Boolean;
    Cod_Prove : string;
  end;

var
  FBuscaProve: TFBuscaProve;

implementation

{$R *.dfm}

Procedure TFBuscaProve.Buscar;
begin
  dm.qProveedor.SQL.Text := ' select * from "Proveedor" where ("Proveedor".NOMBRE LIKE '
    + QuotedStr(DescripcionEdit.Text + '%') + ')';
  dm.qProveedor.Open;
end;

procedure TFBuscaProve.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = VK_DOWN then
    DBGrid1.SetFocus;
end;

procedure TFBuscaProve.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Escape then
    begin
      salir := True;
      Close;
    end;
  end;

procedure TFBuscaProve.Image1Click(Sender: TObject);
begin
  ImprimirDataModule := TImprimirDataModule.Create(self);
  ImprimirDataModule.CSV(dm.qProveedor.SQL.Text, 'ARTICULOS');
  ImprimirDataModule.Free;
end;

procedure TFBuscaProve.SiBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFBuscaProve.DBGrid1DblClick(Sender: TObject);
begin
  SiBitBtnClick(DBGrid1);
end;

procedure TFBuscaProve.NoBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFBuscaProve.DescripcionEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Buscar;
end;

procedure TFBuscaProve.FormCreate(Sender: TObject);
begin
  dm.qProveedor.Open;
end;

end.
