unit RubroF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataModule, StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, DB,
  Mask, OleCtrls, SHDocVw, IBX.IBCustomDataSet, IBX.IBTable;

type
  TRubroForm = class(TForm)
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
    procedure tRubroAfterCancel(DataSet: TDataSet);
    procedure tRubroAfterDelete(DataSet: TDataSet);
    procedure tRubroAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    desc: string;
    { Public declarations }
  end;

var
  RubroForm: TRubroForm;

implementation

{$R *.dfm}

procedure TRubroForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(Self);
  dm.tRubro.Active := true;
end;

procedure TRubroForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.tRubro.Active := false;
end;

procedure TRubroForm.BitBtn1Click(Sender: TObject);
begin
  desc := DBEdit1.Text;
  If (dm.tRubro.State = dsEdit) or (dm.tRubro.State = dsInsert) then
    If DBEdit1.Text <> '' then
    begin
      dm.tRubro.Post;
    end;
  Close;
end;

procedure TRubroForm.FormShow(Sender: TObject);
begin
  dm.tRubro.Insert;
end;

procedure TRubroForm.tRubroAfterCancel(DataSet: TDataSet);
begin
  //dm.tRubro.Transaction.RollbackRetaining;
end;

procedure TRubroForm.tRubroAfterDelete(DataSet: TDataSet);
begin
  //dm.tRubro.Transaction.Commit;
end;

procedure TRubroForm.tRubroAfterPost(DataSet: TDataSet);
begin
  //dm.tRubro.Transaction.Commit;
end;

end.
