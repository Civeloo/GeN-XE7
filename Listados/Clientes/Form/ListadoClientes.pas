unit ListadoClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ImprimirDM, StdCtrls, Buttons, ExtCtrls, DataModule, jpeg;

type
  TListadoClientesForm = class(TForm)
    SiBitBtn: TBitBtn;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    procedure SiBitBtnClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    excel: boolean;
    { Public declarations }
  end;

var
  ListadoClientesForm: TListadoClientesForm;

implementation

{$R *.dfm}

procedure TListadoClientesForm.SiBitBtnClick(Sender: TObject);
var
  sql, r: string;
begin
  sql := 'Select * From "Cliente"';
  If RadioGroup2.ItemIndex = 0 { N�mero } then
    sql := sql + (' Order By CODIGO')
  else If RadioGroup2.ItemIndex = 1 { Nombre } then
    sql := sql + (' Order By NOMBRE')
  else If RadioGroup2.ItemIndex = 2 { Titular } then
    sql := sql + (' Order By TITULAR')
  else If RadioGroup2.ItemIndex = 3 { IVA } then
    sql := sql + (' Order By IVA');
  If RadioGroup1.ItemIndex = 0 then
    r := 'Clientes'
  else
    r := 'ClientesDetalle';
  ImprimirDataModule := TImprimirDataModule.Create(self);
  ImprimirDataModule.SImpr(sql, r);
  ImprimirDataModule.Free;
end;

procedure TListadoClientesForm.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TListadoClientesForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(self);
end;

end.
