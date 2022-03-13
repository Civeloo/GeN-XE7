unit CategoriaFomUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataModule, StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, DB,
  Mask, OleCtrls, SHDocVw, IBX.IBCustomDataSet, IBX.IBTable, Vcl.Imaging.jpeg,
  Vcl.ExtDlgs, Vcl.ComCtrls, System.StrUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCategoriaForm = class(TForm)
    DescripcionLabel: TLabel;
    DescripcionDBEdit: TDBEdit;
    DBNavigator1: TDBNavigator;
    DerechoPanel: TPanel;
    Label2: TLabel;
    SaveBitBtn: TBitBtn;
    NoBitBtn: TBitBtn;
    CodigoDBEdit: TDBEdit;
    PadreDBLookupComboBox: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    PadreLabel: TLabel;
    Image1: TImage;
    ImagenLabel: TLabel;
    VisualizarDBComboBox: TDBComboBox;
    OrdenDBComboBox: TDBComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    HtmlDBMemo: TDBMemo;
    HtmlLabel: TLabel;
    VisualizarLabel: TLabel;
    OrdenLabel: TLabel;
    FDTable: TFDTable;
    DataSource: TDataSource;
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SaveBitBtnClick(Sender: TObject);
    procedure PadreDBLookupComboBoxEnter(Sender: TObject);
    procedure NoBitBtnClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    _imagen :string;
    procedure Obtener;
    procedure Nuevo;
    procedure Grabar;
    procedure Cargar;
  public
    { Public declarations }
    tabla,desc :string;
  end;

var
  CategoriaForm: TCategoriaForm;

implementation

{$R *.dfm}

procedure TCategoriaForm.FormShow(Sender: TObject);
begin
  if (tabla='') then tabla:='Categoria';
  Cargar;
end;

procedure TCategoriaForm.Cargar;
begin
  CategoriaForm.Caption := tabla;
    if FDTable.Active then FDTable.Active := False;
    if FDTable1.Active then FDTable1.Active := False;
    FDTable.TableName := '"'+tabla+'"';
    FDTable.Active := True;
    case IndexStr(tabla, ['Categoria', 'Subcategoria']) of
    0 : FDTable1.TableName := '"Rubro"';
    1 : FDTable1.TableName := '"Categoria"';
    else
      begin
        PadreDBLookupComboBox.Visible:=False;
        PadreLabel.Visible:=False;
      end;
    end;
    if (FDTable1.TableName<>'') then FDTable1.Active := True;
  PageControl1.TabIndex:=0;
  Obtener;
end;

procedure TCategoriaForm.DBGrid1CellClick(Column: TColumn);
begin
  Obtener;
end;

procedure TCategoriaForm.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  case Button of
    nbFirst : Obtener;
    nbPrior : Obtener;
    nbNext : Obtener;
    nbLast : Obtener;
    nbInsert : Nuevo;
//    nbDelete : nuevo;
//    nbEdit : Edit;
//    nbPost : Grabar;
//    nbCancel : Cancel;
//    nbRefresh: Obtener;
  end;
  DescripcionDBEdit.SetFocus;
end;

procedure TCategoriaForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDTable.Active := False;
  with FDTable1 do if Active then Active := False;
end;

procedure TCategoriaForm.Grabar;
begin
  desc := DescripcionDBEdit.Text;
  if (desc <> '') then
  with FDTable do
    if (State = dsEdit) or (State = dsInsert) then
    begin
      // guardar imagen
      if ((_imagen<>'') and (Image1.Picture.Graphic <> nil)) then Image1.Picture.SaveToFile(_imagen);
      //
      Post;
      if (wpSync) then dm.WooCommerceGeN('Categoria', desc);
      if Dialogs.MessageDlg('Grabado con éxito.  Salir?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
        CategoriaForm.Close
      else
        Cargar;
    end
  else
    ShowMessage('COMPLETE TODOS LOS CAMPOS');
end;

procedure TCategoriaForm.Image1Click(Sender: TObject);
begin
  Image1.Picture.LoadFromFile(dm.AbrirImagen)
end;

procedure TCategoriaForm.NoBitBtnClick(Sender: TObject);
begin
  FDTable.Cancel;
  Close;
end;

procedure TCategoriaForm.PadreDBLookupComboBoxEnter(Sender: TObject);
begin
  with FDTable1 do
    begin
      Close;
      Open;
      Last;
    end;
end;

procedure TCategoriaForm.SaveBitBtnClick(Sender: TObject);
begin
  Grabar;
end;

procedure TCategoriaForm.Obtener;
begin
  //imagen
  _imagen := '';
  Image1.Picture := nil;
  _imagen := DM.ObtenerImagenDirectorio(tabla,CodigoDBEdit.Text);
  if (FileExists(_imagen)) then Image1.Picture.LoadFromFile(_imagen);
end;

Procedure TCategoriaForm.Nuevo;
begin
  CodigoDBEdit.Text := IntToStr(DM.SiguienteCodigo(tabla));
  Obtener;
end;

end.
