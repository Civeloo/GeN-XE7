unit VaciarBaseF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles, IBX.IBScript, DataModule;

type
  TVaciarBaseForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ListBox1: TListBox;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VaciarBaseForm: TVaciarBaseForm;

implementation

{$R *.dfm}

procedure TVaciarBaseForm.BitBtn1Click(Sender: TObject);
begin
  DM.VaciarBase;
end;

end.
