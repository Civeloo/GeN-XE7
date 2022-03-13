unit ufRetPerc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfRetPerc = class(TForm)
    eNoGra: TLabeledEdit;
    ePagCueIva: TLabeledEdit;
    ePagCueOtr: TLabeledEdit;
    ePerIIBB: TLabeledEdit;
    ePerImpMun: TLabeledEdit;
    eImpInt: TLabeledEdit;
    eOtrTrib: TLabeledEdit;
    bGrabar: TButton;
    procedure bGrabarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRetPerc: TfRetPerc;

implementation

{$R *.dfm}

procedure TfRetPerc.bGrabarClick(Sender: TObject);
begin
  Close;
end;

end.
