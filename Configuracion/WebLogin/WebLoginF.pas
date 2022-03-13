unit WebLoginF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, DataModule, System.JSON;

type
  TWebLoginForm = class(TForm)
    PanelRight: TPanel;
    SiBitBtn: TBitBtn;
    NoBitBtn: TBitBtn;
    PanelClient: TPanel;
    UsuarioLabel: TLabel;
    UsuarioEdit: TEdit;
    ContraseaLabel: TLabel;
    ContraseaEdit: TEdit;
    RegistrarseBitBtn: TBitBtn;
    SecretUsrLabel: TLabel;
    SecretKeyLabel: TLabel;
    SecretUsrEdit: TEdit;
    SecretKeyEdit: TEdit;
    procedure RegistrarseBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SiBitBtnClick(Sender: TObject);
    procedure UsuarioEditExit(Sender: TObject);
    procedure ContraseaEditExit(Sender: TObject);
    procedure SecretUsrEditExit(Sender: TObject);
    procedure SecretKeyEditExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebLoginForm: TWebLoginForm;

implementation

{$R *.dfm}

uses EmpresaF, RestDM;

procedure TWebLoginForm.ContraseaEditExit(Sender: TObject);
begin
  webPsw := ContraseaEdit.Text;
end;

procedure TWebLoginForm.FormShow(Sender: TObject);
begin
  DM.LeerINI;
  if (webUrl='')then webUrl := 'https://gen.com.ar';
  if (webRes='')then webRes := '/app/api/';
  UsuarioEdit.Text := webUsr;
  ContraseaEdit.Text := webPsw;
  SecretUsrEdit.Text := webSecretUsr;
  SecretKeyEdit.Text := webSecretKey;
  RegistrarseBitBtn.Visible := (webPsw = '');
end;

procedure TWebLoginForm.RegistrarseBitBtnClick(Sender: TObject);
var response : TJSONValue;
begin
  //webUsr := UsuarioEdit.Text;
  //webPsw := ContraseaEdit.Text;
  //webUpd := '';
  ShowMessage('Por favor complete los campos...');
  EmpresaForm := TEmpresaForm.Create(self);
  try
    EmpresaForm.ShowModal;
  finally
    EmpresaForm.Free;
  end;
  DM.TraerConfig;
  if ( (catIVA='') OR (CUIT='') OR (EMAIL='') OR (TITULAR='') OR (PROVINCIA='') OR (CIUDAD='') OR (DIRECCIONCOMERCIAL='') )
  then ShowMessage('Por favor complete los campos...')
  else
  begin
    DMR := TDMR.Create(Self);
    try
      webUsr := CUIT;
      UsuarioEdit.Text := webUsr;
      webPsw := DM.GenerarContrasea(Fecha + Empresa + PuntoVenta + Titular + CUIT);
      ContraseaEdit.Text := webPsw;
      DMR.WebPago;
    finally
      DM.EscribirINI;
      DMR.Free;
      ShowMessage('Registro Exitoso!! recibira en su correo las instruccioes para realizar el pago y obtener las claves.');
    end;
  end;
end;

procedure TWebLoginForm.SecretKeyEditExit(Sender: TObject);
begin
  webSecretKey := SecretKeyEdit.Text;
end;

procedure TWebLoginForm.SecretUsrEditExit(Sender: TObject);
begin
  webSecretUsr := SecretUsrEdit.Text;
end;

procedure TWebLoginForm.SiBitBtnClick(Sender: TObject);
begin
  if ((webSecretUsr='') or (webSecretKey='')) then
    ShowMessage('Por favor complete Secret Usr y Key...')
  else
  begin
    DMR := TDMR.Create(Self);
    try
        begin
          DMR.WebLogin;
          if (webUpd='0') then
            ShowMessage('NO SE PUEDE INICIAR SESION, por favor comunicarse con el soporte')
          else
          begin
            if (webUsr <> '') then DMR.WebRegister;
            if (webUsr='0') then ShowMessage('EL USUARIO YA EXISTE!!! Por favor solicite sus credenciales, si las ha extraviado. COMUNIQUESE CON EL SOPORTE')
            else ShowMessage('Sesin iniciada correctamente');
          end;
        end;
    finally
      DMR.Free;
    end;
    Close;
  end;
end;

procedure TWebLoginForm.UsuarioEditExit(Sender: TObject);
begin
  webUsr := UsuarioEdit.Text;
end;

end.
