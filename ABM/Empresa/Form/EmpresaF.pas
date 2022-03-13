unit EmpresaF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataModule, ExtCtrls, StdCtrls, Mask, DBCtrls, ComCtrls, DB, ADODB,
  Buttons, OleCtrls, SHDocVw, ExtDlgs, jpeg, IBX.IBQuery, IBX.IBCustomDataSet,
  IBX.IBTable, OperacionDM;

type
  TEmpresaForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label22: TLabel;
    Label28: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit23: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit1: TDBEdit;
    Label13: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit21: TDBEdit;
    CUITDBEdit: TDBEdit;
    IVADBComboBox: TDBComboBox;
    DBEdit19: TDBEdit;
    Label23: TLabel;
    TabSheet3: TTabSheet;
    Label52: TLabel;
    Label51: TLabel;
    Label54: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    CuentaDBLookupComboBox: TDBLookupComboBox;
    Label50: TLabel;
    Panel1: TPanel;
    SiBitBtn: TBitBtn;
    NoBitBtn: TBitBtn;
    ImprimirBitBtn: TBitBtn;
    Image1: TImage;
    Label1: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    Label10: TLabel;
    DateTimePicker1: TDateTimePicker;
    CodigoDBEdit: TDBEdit;
    Label14: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label15: TLabel;
    DBEdit11: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    procedure NoBitBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ImprimirBitBtnClick(Sender: TObject);
    procedure IVADBComboBoxChange(Sender: TObject);
    procedure SiBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmpresaForm: TEmpresaForm;

implementation

{$R *.dfm}

procedure TEmpresaForm.SiBitBtnClick(Sender: TObject);
// var e:string;
begin
  // guardar imagen
  Image1.Picture.SaveToFile(path + 'img\empresa.bmp');
  //
  If (dm.tEmpresa.State = dsEdit) or (dm.tEmpresa.State = dsInsert) then
  begin
    dm.tEmpresa.FieldByName('Fecha').AsDateTime := DateTimePicker1.Date;
    dm.tEmpresa.Post;
    // e:=CodigoDBEdit.Text;
    dm.Query.SQL.Text := 'Update "Config" Set "Empresa" = (' +
      QuotedStr(CodigoDBEdit.Text) + ')';
    dm.Query.ExecSQL;
    dm.BaseDatosFB.Commit;
  end;
//  dm.ConfigQuery.Close;
//  dm.ConfigQuery.Open;
  DM.TraerConfig;
  Close;
end;

procedure TEmpresaForm.NoBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TEmpresaForm.FormCreate(Sender: TObject);
var i:integer;
begin
  // DM := TDM.Create(Self);
  dm.tCuenta.Open;
  dm.tEmpresa.Open;
  dm.qIIBB.Open;
  Image1.Picture.LoadFromFile(path + 'img\empresa.bmp');
  DateTimePicker1.Date := dm.tEmpresa.FieldByName('Fecha').AsDateTime;
  for i := 1 to 3 do IVADBComboBox.Items.Add(OperacionDM.tipoIVA[i]);
end;

procedure TEmpresaForm.FormDestroy(Sender: TObject);
begin
  with dm do begin
    tCuenta.Close;
    tEmpresa.Close;
    qIIBB.Close;
  end;
end;

procedure TEmpresaForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    Key := #0; { eat enter key }
    Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
  end;
end;

procedure TEmpresaForm.FormShow(Sender: TObject);
begin
  IVADBComboBoxChange(Sender);
  TabSheet1.PageControl.ActivePageIndex := 0;
  dm.tEmpresa.Edit;
  DBEdit2.SetFocus;
end;

procedure TEmpresaForm.IVADBComboBoxChange(Sender: TObject);
begin
  {
    if IVADBComboBox.Text = 'CF' then
    IVALabel.Caption := 'Consumidor Final'
    else if IVADBComboBox.Text = 'MT' then
    IVALabel.Caption := 'Responsable Monotributo'
    else if IVADBComboBox.Text = 'RI' then
    IVALabel.Caption := 'Responsable Inscripto'
    else if IVADBComboBox.Text = 'EX' then
    IVALabel.Caption := 'Exento'
    else
    IVALabel.Caption := 'No Responsable';
  }
end;

procedure TEmpresaForm.Image1Click(Sender: TObject);
begin
  OpenPictureDialog1.Execute();
  if OpenPictureDialog1.FileName<>'' then Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TEmpresaForm.ImprimirBitBtnClick(Sender: TObject);
begin
  { ListadoClientesForm:=TListadoClientesForm.Create(self);
    try
    ListadoClientesForm.ADOQuery1.SQL.Text:='Select "'+DataModule1.Empresa+'" As Empresa, * From Clientes WHERE CodCliente='+DBEdit24.Text;
    ListadoClientesForm.ADOQuery1.Open;
    //ListadoClientesForm.frxReport2.ShowReport(True);
    //ListadoClientesForm.ADOQuery1.Close;
    finally
    ListadoClientesForm.Free;
    end; }
end;

end.
