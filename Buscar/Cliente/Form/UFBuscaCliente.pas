unit UFBuscaCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataModule, DBCtrls, StdCtrls, DB, Grids, DBGrids, ExtCtrls,
  Buttons, jpeg, ImprimirDM, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFBuscaCliente = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    DescripcionEdit: TEdit;
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
    Image1: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SiBitBtnClick(Sender: TObject);
    procedure NoBitBtnClick(Sender: TObject);
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
  end;

var
  FBuscaCliente: TFBuscaCliente;

implementation

{$R *.dfm}

Procedure TFBuscaCliente.Buscar;
begin
  dm.qCliente.SQL.Text := ' select * from "Cliente" where '+
  ' upper("Cliente".NOMBRE) LIKE '+QuotedStr(UpperCase(DescripcionEdit.Text)+'%');
  dm.qCliente.Open;
end;

procedure TFBuscaCliente.DescripcionEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  { if (not DbGrid1.Focused = True) and (Length(DescripcionEdit.Text) > 0) then }
  Buscar;
end;

procedure TFBuscaCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = VK_DOWN then
    DBGrid1.SetFocus;
end;

procedure TFBuscaCliente.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_Escape then
  begin
    salir := True;
    Close;
  end;
end;

procedure TFBuscaCliente.SiBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFBuscaCliente.DBGrid1DblClick(Sender: TObject);
begin
  SiBitBtnClick(DBGrid1);
end;

procedure TFBuscaCliente.FormShow(Sender: TObject);
begin
  if dm.qCliente.Active = True then
    dm.qCliente.Close;
  dm.qCliente.Active := True;
end;

procedure TFBuscaCliente.Image1Click(Sender: TObject);
begin
  ImprimirDataModule := TImprimirDataModule.Create(self);
  ImprimirDataModule.CSV(dm.qCliente.SQL.Text, 'CLIENTES');
  ImprimirDataModule.Free;
end;

procedure TFBuscaCliente.NoBitBtnClick(Sender: TObject);
begin
  Close;
end;

end.
