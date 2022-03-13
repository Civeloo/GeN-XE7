unit WooCommerceFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, DataModule;

type
  TWooCommerceForm = class(TForm)
    PanelClient: TPanel;
    wpSiteLabel: TLabel;
    wooCommerceKeyLabel: TLabel;
    WooCommerceSecretLabel: TLabel;
    wPUsernameLabel: TLabel;
    wpSiteEdit: TEdit;
    wooCommerceKeyEdit: TEdit;
    WooCommerceSecretEdit: TEdit;
    wPUsernameEdit: TEdit;
    PanelRight: TPanel;
    SiBitBtn: TBitBtn;
    NoBitBtn: TBitBtn;
    SincronizarBitBtn: TBitBtn;
    wPPasswordEdit: TEdit;
    WPPasswordLabel: TLabel;
    AutoSincronizarCheckBox: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure SiBitBtnClick(Sender: TObject);
    procedure NoBitBtnClick(Sender: TObject);
    procedure SincronizarBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Save;
  public
    { Public declarations }
  end;

var
  WooCommerceForm: TWooCommerceForm;

implementation

{$R *.dfm}

procedure TWooCommerceForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   with dm do
    if (BaseDatosFB.Connected = False) then BaseDatosFB.Connected:=True;
end;

procedure TWooCommerceForm.FormShow(Sender: TObject);
begin
  DM.LeerINI;
  wpSiteEdit.Text := wpSite;
  wooCommerceKeyEdit.Text := wooCommerceKey;
  wooCommerceSecretEdit.Text := wooCommerceSecret;
  wPUsernameEdit.Text := wPUsername;
  wPPasswordEdit.Text := wPPassword;
  AutoSincronizarCheckBox.Checked := wpSync;
end;

procedure TWooCommerceForm.NoBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TWooCommerceForm.Save;
begin
  if ((wooCommerceKeyEdit.Text='') or (wPUsernameEdit.Text='')) then
    ShowMessage('Por favor complete todos los campos...')
  else
  begin
    wpSite := wpSiteEdit.Text;
    wooCommerceKey := wooCommerceKeyEdit.Text;
    wooCommerceSecret := wooCommerceSecretEdit.Text;
    wPUsername := wPUsernameEdit.Text;
    wPPassword := wPPasswordEdit.Text;
    wpSync := AutoSincronizarCheckBox.Checked;
    DM.EscribirINI;
  end;

end;

procedure TWooCommerceForm.SiBitBtnClick(Sender: TObject);
begin
  Save;
  Close;
end;

procedure TWooCommerceForm.SincronizarBitBtnClick(Sender: TObject);
begin
  with dm do
  begin
    WooCommerceGeN('Articulo','');
    WooCommerceGeN('GetOrders','');
  end;
end;

end.
