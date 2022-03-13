unit SocioF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataModule, ExtCtrls, StdCtrls, Mask, DBCtrls, ComCtrls, ImprimirDM,
  Buttons, DB, OleCtrls, SHDocVw, IBX.IBQuery, IBX.IBCustomDataSet, IBX.IBTable;

type
  TSocioForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    CodigoDBEdit: TDBEdit;
    Label1: TLabel;
    VendedorLabel: TLabel;
    TabSheet3: TTabSheet;
    Label15: TLabel;
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
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit12: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    Label27: TLabel;
    DBEdit24: TDBEdit;
    Label18: TLabel;
    DBEdit1: TDBEdit;
    Panel1: TPanel;
    Label33: TLabel;
    SiBitBtn: TBitBtn;
    NoBitBtn: TBitBtn;
    ImprimirBitBtn: TBitBtn;
    Tabla: TIBTable;
    DataSource: TDataSource;
    UsuarioT: TIBQuery;
    DSUsuarios: TDataSource;
    CuentaT: TIBQuery;
    CuentaDataSource: TDataSource;
    EmpresaQuery: TIBQuery;
    Query: TIBQuery;
    DBNavigator1: TDBNavigator;
    BuscarBitBtn: TBitBtn;
    procedure SiBitBtnClick(Sender: TObject);
    procedure NoBitBtnClick(Sender: TObject);
    procedure BuscarBitBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ImprimirBitBtnClick(Sender: TObject);
    procedure TablaAfterInsert(DataSet: TDataSet);
    procedure IVADBComboBoxChange(Sender: TObject);
    procedure DBEdit24Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TablaAfterPost(DataSet: TDataSet);
    procedure TablaAfterDelete(DataSet: TDataSet);
    procedure TablaAfterCancel(DataSet: TDataSet);
  private
    { Private declarations }
  public
    desc: string;
    { Public declarations }
  end;

var
  SocioForm: TSocioForm;

implementation

uses BuscaSocioF;

{$R *.dfm}

procedure TSocioForm.SiBitBtnClick(Sender: TObject);
begin
  desc := CodigoDBEdit.text;
  If (Tabla.State = dsEdit) or (Tabla.State = dsInsert) then
    Tabla.Post;
  Close;
end;

procedure TSocioForm.NoBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TSocioForm.BuscarBitBtnClick(Sender: TObject);
begin
  TabSheet1.PageControl.ActivePageIndex := 0;
  Tabla.Cancel;
  BuscaSocioForm := TBuscaSocioForm.Create(self);
  try
    BuscaSocioForm.ShowModal;
  finally
    Tabla.Locate('CODIGO', (BuscaSocioForm.Tabla.FieldByName('CODIGO')
      .AsString), []);
    BuscaSocioForm.Free;
  end;
  DBEdit2.SetFocus;
end;

procedure TSocioForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(self);
  UsuarioT.Open;
  CuentaT.Open;
  Tabla.Open;
  Tabla.Insert;
end;

procedure TSocioForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end;
end;

procedure TSocioForm.FormShow(Sender: TObject);
begin
  TabSheet1.PageControl.ActivePageIndex := 0;
  DBEdit2.SetFocus;
end;

procedure TSocioForm.IVADBComboBoxChange(Sender: TObject);
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

procedure TSocioForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = VK_F5 then
    BuscarBitBtn.Click;
end;

procedure TSocioForm.ImprimirBitBtnClick(Sender: TObject);
begin
  ImprimirDataModule := TImprimirDataModule.Create(self);
  ImprimirDataModule.SImpr('SELECT * From "Socio" WHERE CODIGO=' +
    CodigoDBEdit.text, 'SociosDetalle');
  ImprimirDataModule.Free;
end;

procedure TSocioForm.DBEdit24Exit(Sender: TObject);
begin
  SiBitBtn.SetFocus;
end;

procedure TSocioForm.TablaAfterCancel(DataSet: TDataSet);
begin
  //Tabla.Transaction.RollbackRetaining;
end;

procedure TSocioForm.TablaAfterDelete(DataSet: TDataSet);
begin
  //Tabla.Transaction.Commit;
end;

procedure TSocioForm.TablaAfterInsert(DataSet: TDataSet);
begin
  Tabla.FieldByName('CtaNombre').AsString := '61';
  Tabla.FieldByName('CtaTipo').AsString := '41';
  Tabla.FieldByName('CtaAnticipo').AsString := '61';
end;

procedure TSocioForm.TablaAfterPost(DataSet: TDataSet);
begin
  //Tabla.Transaction.Commit;
end;

end.
