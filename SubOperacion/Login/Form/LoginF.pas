unit LoginF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DataModule, DB, Buttons,
  OleCtrls, SHDocVw, ExtCtrls, UrLMon, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    nombreEdit: TEdit;
    passwordEdit: TEdit;
    AceptarBitBtn: TBitBtn;
    CancelarBitBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure AceptarBitBtnClick(Sender: TObject);
    procedure CancelarBitBtnClick(Sender: TObject);
    procedure passwordEditExit(Sender: TObject);
    procedure WebBrowser1StatusTextChange(ASender: TObject;
      const Text: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;
  Cuenta: integer;

implementation

{$R *.dfm}

procedure TFLogin.AceptarBitBtnClick(Sender: TObject);
begin
  LoginOK := False;
  dm.qQ.SQL.Text := 'select * from "Usuario" where NOMBRE=' +
    QuotedStr(nombreEdit.Text);
  dm.qQ.Open;
  If dm.qQ.RecordCount = 0 then
  Begin
    Cuenta := Cuenta + 1;
    MessageDlg('Usuario no encontrado', mtError, [mbOK], 0);
    nombreEdit.Text := '';
    passwordEdit.Text := '';
    dm.qQ.Active := False;
    If Cuenta = 3 then
      Close;
  end
  else If dm.qQ.FieldByName('password').AsString = passwordEdit.Text then
  Begin
    LoginOK := True;
    Usuario := dm.qQ.FieldByName('CODIGO').AsString;
    Permiso := dm.qQ.FieldByName('PERMISO').AsInteger;
    dm.qQ.Active := False;
    dm.qQ.SQL.Text := 'insert into "Control" (USUARIO, MAQUINA) values (' +
      Usuario + ', ' + QuotedStr(Maquina) + ')';
    dm.qQ.ExecSQL;
    dm.qQ.Transaction.Commit;
  end
  else
  Begin
    Cuenta := Cuenta + 1;
    MessageDlg('Clave Inv�lida', mtError, [mbOK], 0);
    passwordEdit.Text := '';
    dm.qQ.Active := False;
    If Cuenta = 3 then
  end;
  Close;
end;

procedure TFLogin.CancelarBitBtnClick(Sender: TObject);
begin
  LoginOK := False;
  Close;
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
  Usuario := 'L';
  Cuenta := 0;
end;

procedure TFLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end;
end;

procedure TFLogin.passwordEditExit(Sender: TObject);
begin
  AceptarBitBtn.Click;
end;

procedure TFLogin.WebBrowser1StatusTextChange(ASender: TObject;
  const Text: WideString);
begin
  { if (text <> 'Buscando www.degsoft.com.ar') and (text <> '') then
    begin
    ShowMessage(text);
    HlinkNavigateString(Nil, PChar(text) );
    end; }

end;

end.
