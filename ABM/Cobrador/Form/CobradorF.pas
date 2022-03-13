unit CobradorF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataModule, ExtCtrls, StdCtrls, Mask, DBCtrls, ComCtrls, DB,
  ImprimirDM, Buttons, OleCtrls, SHDocVw, IBX.IBQuery, IBX.IBCustomDataSet,
  IBX.IBTable;

type
  TCobradorForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DataSource: TDataSource;
    DSUsuarios: TDataSource;
    DBMemo1: TDBMemo;
    Panel5: TPanel;
    AceptarBitBtn: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    CodigoDBEdit: TDBEdit;
    Label1: TLabel;
    VendedorLabel: TLabel;
    TabSheet3: TTabSheet;
    Label15: TLabel;
    CuentaDataSource: TDataSource;
    Label24: TLabel;
    DBEdit20: TDBEdit;
    TabSheet4: TTabSheet;
    Label19: TLabel;
    DBEdit16: TDBEdit;
    Label12: TLabel;
    DBEdit13: TDBEdit;
    DBEdit23: TDBEdit;
    Label28: TLabel;
    Label23: TLabel;
    DBEdit19: TDBEdit;
    DBEdit21: TDBEdit;
    Label26: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label10: TLabel;
    DBEdit17: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit18: TDBEdit;
    Label4: TLabel;
    DBEdit9: TDBEdit;
    TabSheet5: TTabSheet;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    VendedorBitBtn: TBitBtn;
    Label25: TLabel;
    DBEdit22: TDBEdit;
    Label38: TLabel;
    IVALabel: TLabel;
    IVADBComboBox: TDBComboBox;
    CtaNombreDBLookupComboBox: TDBLookupComboBox;
    Label54: TLabel;
    CtaAnticipoDBLookupComboBox: TDBLookupComboBox;
    CtaTipoDBLookupComboBox: TDBLookupComboBox;
    Label52: TLabel;
    Label51: TLabel;
    Label20: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit12: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    Label27: TLabel;
    DBEdit24: TDBEdit;
    DBEdit27: TDBEdit;
    Label14: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    DBEdit28: TDBEdit;
    Label34: TLabel;
    Tabla: TIBTable;
    UsuarioT: TIBQuery;
    CuentaT: TIBQuery;
    EmpresaQuery: TIBQuery;
    Query: TIBQuery;
    DBNavigator1: TDBNavigator;
    BitBtn3: TBitBtn;
    procedure AceptarBitBtnClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure TablaAfterInsert(DataSet: TDataSet);
    procedure IVADBComboBoxChange(Sender: TObject);
    procedure DBEdit24Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TablaAfterCancel(DataSet: TDataSet);
    procedure TablaAfterDelete(DataSet: TDataSet);
    procedure TablaAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    desc: string;
    { Public declarations }
  end;

var
  CobradorForm: TCobradorForm;

implementation

uses BuscarCobrador;

{$R *.dfm}

procedure TCobradorForm.AceptarBitBtnClick(Sender: TObject);
begin
  desc := CodigoDBEdit.text;
  If (Tabla.State = dsEdit) or (Tabla.State = dsInsert) then
    Tabla.Post;
  Close;
end;

procedure TCobradorForm.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TCobradorForm.BitBtn3Click(Sender: TObject);
begin
  TabSheet1.PageControl.ActivePageIndex := 0;
  Tabla.Cancel;
  BuscarCobradorForm := TBuscarCobradorForm.Create(self);
  try
    BuscarCobradorForm.ShowModal;
  finally
    Tabla.Locate('CODIGO', (BuscarCobradorForm.Tabla.FieldByName('CODIGO')
      .AsString), []);
    BuscarCobradorForm.Free;
  end;
  DBEdit2.SetFocus;
end;

procedure TCobradorForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(self);
  EmpresaQuery.Open;
  UsuarioT.Open;
  CuentaT.Open;
  Tabla.Open;
  Tabla.Insert;
end;

procedure TCobradorForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end;
end;

procedure TCobradorForm.FormShow(Sender: TObject);
begin
  TabSheet1.PageControl.ActivePageIndex := 0;
  DBEdit2.SetFocus;
end;

procedure TCobradorForm.IVADBComboBoxChange(Sender: TObject);
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

procedure TCobradorForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = VK_F3 then
    VendedorBitBtn.Click;
  IF Key = VK_F5 then
    BitBtn3.Click;
end;

procedure TCobradorForm.BitBtn4Click(Sender: TObject);
begin
  ImprimirDataModule := TImprimirDataModule.Create(self);
  ImprimirDataModule.SImpr('Select * From "Cobrador" WHERE Codigo=' +
    CodigoDBEdit.text, 'Cobrador');
  ImprimirDataModule.Free;
end;

procedure TCobradorForm.DBEdit24Exit(Sender: TObject);
begin
  AceptarBitBtn.SetFocus;
end;

procedure TCobradorForm.TablaAfterCancel(DataSet: TDataSet);
begin
  //Tabla.Transaction.RollbackRetaining;
end;

procedure TCobradorForm.TablaAfterDelete(DataSet: TDataSet);
begin
  //Tabla.Transaction.Commit;
end;

procedure TCobradorForm.TablaAfterInsert(DataSet: TDataSet);
begin
  Tabla.FieldByName('CtaNombre').AsString := '51';
  Tabla.FieldByName('CtaTipo').AsString := '51';
  Tabla.FieldByName('CtaAnticipo').AsString := '26';
end;

procedure TCobradorForm.TablaAfterPost(DataSet: TDataSet);
begin
  //Tabla.Transaction.Commit;
end;

end.
