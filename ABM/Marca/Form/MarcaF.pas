unit MarcaF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataModule, StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, DB,
  Mask, OleCtrls, SHDocVw, IBX.IBCustomDataSet, IBX.IBTable;

type
  TMarcaForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tMarcaAfterCancel(DataSet: TDataSet);
    procedure tMarcaAfterDelete(DataSet: TDataSet);
    procedure tMarcaAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    desc: string;
    { Public declarations }
  end;

var
  MarcaForm: TMarcaForm;

implementation

{$R *.dfm}

procedure TMarcaForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(Self);
  dm.tEmpresa.Active := true;
end;

procedure TMarcaForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.tEmpresa.Active := false;
end;

procedure TMarcaForm.BitBtn1Click(Sender: TObject);
begin
  desc := DBEdit1.Text;
  If (dm.tMarca.State = dsEdit) or (dm.tEmpresa.State = dsInsert) then
    If DBEdit1.Text <> '' then
    begin
      dm.tEmpresa.Post;
    end;
  Close;
end;

procedure TMarcaForm.FormShow(Sender: TObject);
begin
  dm.tEmpresa.Insert;
end;

procedure TMarcaForm.tMarcaAfterCancel(DataSet: TDataSet);
begin
  //dm.tEmpresa.Transaction.RollbackRetaining;
end;

procedure TMarcaForm.tMarcaAfterDelete(DataSet: TDataSet);
begin
  //dm.tEmpresa.Transaction.Commit;
end;

procedure TMarcaForm.tMarcaAfterPost(DataSet: TDataSet);
begin
  //dm.tEmpresa.Transaction.Commit;
end;

end.
