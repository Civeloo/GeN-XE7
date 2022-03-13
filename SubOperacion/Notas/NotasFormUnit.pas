unit NotasFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TNotasForm = class(TForm)
    Panel1: TPanel;
    SiBitBtn: TBitBtn;
    NoBitBtn: TBitBtn;
    NotasMemo: TMemo;
    ImprimirBitBtn: TBitBtn;
    procedure SiBitBtnClick(Sender: TObject);
    procedure NoBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    save :Boolean;
  end;

var
  NotasForm: TNotasForm;

implementation

{$R *.dfm}

procedure TNotasForm.NoBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TNotasForm.SiBitBtnClick(Sender: TObject);
begin
  save := true;
  Close;
end;

end.
