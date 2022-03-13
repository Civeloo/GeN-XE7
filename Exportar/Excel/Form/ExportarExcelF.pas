unit ExportarExcelF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  shellapi,
  Dialogs, StdCtrls, ExtCtrls, DataModule, DB, Buttons, IBX.IBCustomDataSet,
  IBX.IBQuery;

type
  TMenu1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Button2: TButton;
    Panel1: TPanel;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    CheckBox1: TCheckBox;
    T: TIBQuery;
    BitBtn1: TBitBtn;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Menu1: TMenu1;

implementation

uses Hoja_Calculo;

{$R *.dfm}

procedure TMenu1.BitBtn1Click(Sender: TObject);
var
  aa: string;
  FStream: TFileStream;
  J: Integer;
  c1, c2, c3: variant;
  I: Integer;
begin
  // INFORME REALISTA
  // --------------------
  T.SQL.Text := 'SELECT * FROM "Articulo"';
  T.Open;

  SaveDialog1.FileName := 'informe Excel - 13-3-2010' + '.xls';

  if not SaveDialog1.Execute then
  begin
    ShowMessage('Proceso cancelado.');
    exit;
  end
  else
  begin

    aa := SaveDialog1.FileName;

    randomize;

    try

      FStream := TFileStream.Create(aa, fmCreate);

      XlsBeginStream(FStream, 0);

      // Crear las cabeceras de las columnas

      for I := 0 to T.FieldCount - 1 do
      begin
        XlsWriteCellLabel(FStream, I, 3, T.Fields.Fields[I].DisplayName);
      end;

      // Crear los contenidos de cada l�nea
      for J := 4 to strtoint(Edit1.Text) + 3 do // Filas
      begin

        c1 := 25 - random * 25;
        c2 := c1 - random * c1;
        c3 := 25 - (c1 + c2);

        XlsWriteCellLabel(FStream, 1, J, 'Nombre n� ' + inttostr(J)); // Nombre
        XlsWriteCellNumber(FStream, 2, J, (random * 100) / 10); // Nota
        XlsWriteCellRk(FStream, 3, J, c1); // Aciertos
        XlsWriteCellRk(FStream, 4, J, c2); // Errores
        XlsWriteCellRk(FStream, 5, J, c3); // En blanco

      end;

      XlsEndStream(FStream);

    finally
      FStream.Free;
    end;

    if CheckBox1.Checked then // Carga la hoja de c�lculo recien creada
    begin

      ShellExecute(Handle, nil, PChar(aa), '', '', SW_SHOWNORMAL);

      ShowMessage('La hoja de c�lculo ha sido creada y se est� cargando.');

    end
    else
    begin
      ShowMessage('La hoja de c�lculo ha sido creada.' + #13 + #13 +
        'Nombre del archivo:' + #13 + aa);
    end;

  end;

end;

procedure TMenu1.Button1Click(Sender: TObject);
var
  aa: string;
  FStream: TFileStream;
  I, J: Integer;
begin

  aa := ExtractFilePath(Application.ExeName) + trim(Edit3.Text) + '.xls';

  FStream := TFileStream.Create(aa, fmCreate);
  // FStream := TFileStream.Create('J:\e.xls', fmCreate);
  try

    XlsBeginStream(FStream, 0);

    for I := 1 to strtoint(Edit2.Text) do // Columnas
      for J := 1 to strtoint(Edit1.Text) do // Filas
      begin

        case RadioGroup1.ItemIndex of
          0:
            XlsWriteCellNumber(FStream, I, J, 34.34);
          1:
            XlsWriteCellRk(FStream, I, J, 3434);
          2:
            XlsWriteCellLabel(FStream, I, J, Format('Cell: %d,%d', [I, J]));
        end;

      end;

    XlsEndStream(FStream);

  finally
    FStream.Free;
  end;

  ShellExecute(Handle, nil, PChar(aa), '', '', SW_SHOWNORMAL);

end;

procedure TMenu1.Button2Click(Sender: TObject);
begin

  close;

end;

procedure TMenu1.Button3Click(Sender: TObject);
var
  aa: string;
  FStream: TFileStream;
  J: Integer;
  c1, c2, c3: variant;
begin
  // INFORME REALISTA
  // --------------------

  SaveDialog1.FileName := 'informe Excel - 13-3-2010' + '.xls';

  if not SaveDialog1.Execute then
  begin
    ShowMessage('Proceso cancelado.');
    exit;
  end
  else
  begin

    aa := SaveDialog1.FileName;

    randomize;

    try

      FStream := TFileStream.Create(aa, fmCreate);

      XlsBeginStream(FStream, 0);

      // Crear las cabeceras de las columnas
      XlsWriteCellLabel(FStream, 1, 3, 'Nombre:');
      XlsWriteCellLabel(FStream, 2, 3, ' Columna1: ');
      XlsWriteCellLabel(FStream, 3, 3, ' Columna2: ');
      XlsWriteCellLabel(FStream, 4, 3, ' Columna3: ');
      XlsWriteCellLabel(FStream, 5, 3, ' Columna4: ');

      // Crear los contenidos de cada l�nea
      for J := 4 to strtoint(Edit1.Text) + 3 do // Filas
      begin

        c1 := 25 - random * 25;
        c2 := c1 - random * c1;
        c3 := 25 - (c1 + c2);

        XlsWriteCellLabel(FStream, 1, J, 'Nombre n� ' + inttostr(J)); // Nombre
        XlsWriteCellNumber(FStream, 2, J, (random * 100) / 10); // Nota
        XlsWriteCellRk(FStream, 3, J, c1); // Aciertos
        XlsWriteCellRk(FStream, 4, J, c2); // Errores
        XlsWriteCellRk(FStream, 5, J, c3); // En blanco

      end;

      XlsEndStream(FStream);

    finally
      FStream.Free;
    end;

    if CheckBox1.Checked then // Carga la hoja de c�lculo recien creada
    begin

      ShellExecute(Handle, nil, PChar(aa), '', '', SW_SHOWNORMAL);

      ShowMessage('La hoja de c�lculo ha sido creada y se est� cargando.');

    end
    else
    begin
      ShowMessage('La hoja de c�lculo ha sido creada.' + #13 + #13 +
        'Nombre del archivo:' + #13 + aa);
    end;

  end;

end;

procedure TMenu1.FormCreate(Sender: TObject);
begin
  SaveDialog1.InitialDir := ExtractFilePath(Application.ExeName);
  // dm := tdm.Create(self);
end;

end.
