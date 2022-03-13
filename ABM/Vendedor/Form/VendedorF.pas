unit VendedorF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataModule, ExtCtrls, StdCtrls, Mask, DBCtrls, ComCtrls, DB,
  ImprimirDM, Buttons, OleCtrls, SHDocVw, IBX.IBQuery, IBX.IBCustomDataSet,
  IBX.IBTable;

type
  TVendedorForm = class(TForm)
    Panel5: TPanel;
    AceptarBitBtn: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label20: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label27: TLabel;
    Label14: TLabel;
    Label32: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit27: TDBEdit;
    TabSheet2: TTabSheet;
    DBMemo1: TDBMemo;
    TabSheet3: TTabSheet;
    Label15: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label38: TLabel;
    IVALabel: TLabel;
    Label54: TLabel;
    Label52: TLabel;
    Label51: TLabel;
    DBEdit20: TDBEdit;
    DBEdit22: TDBEdit;
    IVADBComboBox: TDBComboBox;
    CtaNombreDBLookupComboBox: TDBLookupComboBox;
    CtaAnticipoDBLookupComboBox: TDBLookupComboBox;
    CtaTipoDBLookupComboBox: TDBLookupComboBox;
    TabSheet4: TTabSheet;
    Label19: TLabel;
    Label12: TLabel;
    Label28: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    Label5: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    DBEdit16: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit8: TDBEdit;
    TabSheet5: TTabSheet;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    lPrecioTipo: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    CodigoDBEdit: TDBEdit;
    Label1: TLabel;
    pButton: TPanel;
    DBNavigator1: TDBNavigator;
    procedure AceptarBitBtnClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure IVADBComboBoxChange(Sender: TObject);
    procedure DBEdit24Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    desc: string;
    { Public declarations }
  end;

var
  VendedorForm: TVendedorForm;

implementation

uses BuscarVendedor;
{$R *.dfm}

procedure TVendedorForm.AceptarBitBtnClick(Sender: TObject);
begin
  desc := CodigoDBEdit.text;
  If (dm.tVendedor.State = dsEdit) or (dm.tVendedor.State = dsInsert) then
    dm.tVendedor.Post;
  Close;
end;

procedure TVendedorForm.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TVendedorForm.BitBtn3Click(Sender: TObject);
begin
  TabSheet1.PageControl.ActivePageIndex := 0;
  dm.tVendedor.Cancel;
  BuscarVendedorForm := TBuscarVendedorForm.Create(self);
  try
    BuscarVendedorForm.ShowModal;
  finally
    dm.tVendedor.Locate('CODIGO', (dm.qVendedor.FieldByName('CODIGO').AsString), []);
    BuscarVendedorForm.Free;
  end;
  DBEdit2.SetFocus;
end;

procedure TVendedorForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(self);
  dm.qEmpresa.Open;
  dm.qUsuario.Open;
  dm.qCuenta.Open;
  dm.tVendedor.Open;
  dm.tVendedor.Insert;
end;

procedure TVendedorForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end;
end;

procedure TVendedorForm.FormShow(Sender: TObject);
begin
  TabSheet1.PageControl.ActivePageIndex := 0;
  DBEdit2.SetFocus;
end;

procedure TVendedorForm.IVADBComboBoxChange(Sender: TObject);
begin
  if IVADBComboBox.ItemIndex = 0 then
    IVALabel.Caption := 'Consumidor Final'
  else if IVADBComboBox.ItemIndex = 1 then
    IVALabel.Caption := 'Responsable Monotributo'
  else if IVADBComboBox.ItemIndex = 2 then
    IVALabel.Caption := 'Responsable Inscripto'
  else if IVADBComboBox.ItemIndex = 3 then
    IVALabel.Caption := 'Exento'
  else
    IVALabel.Caption := 'No Responsable';
end;

procedure TVendedorForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = VK_F5 then
    BitBtn3.Click;
end;

procedure TVendedorForm.BitBtn4Click(Sender: TObject);
begin
  ImprimirDataModule := TImprimirDataModule.Create(self);
  ImprimirDataModule.SImpr('SELECT * FROM "Vendedor" WHERE CODIGO=' +
    CodigoDBEdit.text, 'VendedoresDetalle');
  ImprimirDataModule.Free;
end;

procedure TVendedorForm.DBEdit24Exit(Sender: TObject);
begin
  AceptarBitBtn.SetFocus;
end;

end.
