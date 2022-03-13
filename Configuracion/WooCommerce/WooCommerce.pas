unit WooCommerce;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    PanelClient: TPanel;
    UsuarioLabel: TLabel;
    ContraseñaLabel: TLabel;
    SecretUsrLabel: TLabel;
    SecretKeyLabel: TLabel;
    UsuarioEdit: TEdit;
    ContraseñaEdit: TEdit;
    SecretUsrEdit: TEdit;
    SecretKeyEdit: TEdit;
    PanelRight: TPanel;
    SiBitBtn: TBitBtn;
    NoBitBtn: TBitBtn;
    RegistrarseBitBtn: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

end.
