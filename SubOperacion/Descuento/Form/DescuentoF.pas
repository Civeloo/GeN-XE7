unit DescuentoF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TDescuentoForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DescuentoEdit: TEdit;
    Label33: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DescuentoForm: TDescuentoForm;

implementation

{$R *.dfm}

procedure TDescuentoForm.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TDescuentoForm.BitBtn2Click(Sender: TObject);
begin
  DescuentoEdit.Text := '0';
  Close;
end;

end.
