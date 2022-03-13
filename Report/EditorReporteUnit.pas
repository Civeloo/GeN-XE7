unit EditorReporteUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, frxClass, frxExportCSV, frxDBSet, frxExportBaseDialog,
  frxExportPDF, frxBarcode, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs;

type
  TfEditorReporte = class(TForm)
    frxBarCodeObject1: TfrxBarCodeObject;
    frxPDFExport1: TfrxPDFExport;
    frxDBDataset1: TfrxDBDataset;
    frxCSVExport1: TfrxCSVExport;
    frxReport1: TfrxReport;
    VentasFDQuery1: TFDQuery;
    FDQuery1: TFDQuery;
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    db: TIBTransaction;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    OperacionFDQuery: TFDQuery;
    tLibroIVAventa: TFDQuery;
    sdb: TFDConnection;
    qSdb: TFDQuery;
    GenConnection: TFDConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEditorReporte: TForm;

implementation

{$R *.dfm}

end.
