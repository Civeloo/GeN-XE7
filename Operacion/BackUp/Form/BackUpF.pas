unit BackUpF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, IniFiles,
  Buttons, ComCtrls, jpeg, DataModule, ShellApi;

type
  TBackUpForm = class(TForm)
    tor: TADOTable;
    tde: TADOTable;
    Servidor: TADOConnection;
    Cliente: TADOConnection;
    qo: TADOQuery;
    qd: TADOQuery;
    RadioGroup1: TRadioGroup;
    ListBox1: TListBox;
    UnidadRadioGroup: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    PB1: TProgressBar;
    procedure campos;
    procedure conecta;
    procedure TraerUnidades(Lista: TStrings);
    procedure Copiar;
    procedure sincroniza;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    unidad: string;
    procedure copiatodo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BackUpForm: TBackUpForm;

implementation

uses ConfigurarF;

{$R *.dfm}

procedure TBackUpForm.sincroniza;
var
  i, n: integer;
  tabla: string;
begin
  Servidor.GetTableNames(ListBox1.Items);
  for i := 0 to ListBox1.Items.Count - 1 do
  begin
    tabla := ListBox1.Items.Strings[i];
    if (tabla <> 'Factura') and (tabla <> 'FacturaItem') and (tabla <> 'Compra')
      and (tabla <> 'CompraItem') then
    begin
      if UnidadRadioGroup.ItemIndex = 0 then
      begin
        tor.TableName := tabla;
        tde.TableName := tabla;
      end
      else
      begin
        tor.TableName := tabla;
        tde.TableName := tabla;
      end;
      tor.Open;
      tde.Open;
      tor.Prior;
      tde.Prior;
      with tde do
      begin
        for n := 0 to tor.RecordCount - 1 do
        begin
          if tor.Fields.Fields[0].DataType = ftWideString then
            qd.SQL.Text := 'Select ' + tor.Fields.Fields[0].DisplayName +
              ' From ' + tabla + ' Where ' + tor.Fields.Fields[0].DisplayName +
              ' = ' + QuotedStr(VarToStr(tor.Fields.Fields[0].Value)) + ''
          else if tor.Fields.Fields[0].DataType = ftAutoInc then
            qd.SQL.Text := 'Select Fecha From ' + tabla + ' Where (Fecha = #' +
              DateToStr(tor.Fields.FieldByName('Fecha').AsDateTime) + '#)'
          else
            qd.SQL.Text := 'Select ' + tor.Fields.Fields[0].DisplayName +
              ' From ' + tabla + ' Where ' + tor.Fields.Fields[0].DisplayName +
              ' = ' + VarToStr(tor.Fields.Fields[0].Value) + '';
          if trim(VarToStr(tor.Fields.Fields[0].Value)) <> '' then
          begin
            qd.Open;
            if (qd.RecordCount = 0) then
            begin
              Append;
              campos;
            end
            else if RadioGroup1.ItemIndex = 1 then
            begin
              Edit;
              campos;
            end;
          end;
          if (State = dsEdit) or (State = dsInsert) then
            Post;
          tor.Next;
        end;
      end;
      tor.Close;
      tde.Close;
    end;
  end;
  showmessage('Proceso terminado con �xito');
  Close;
end;

procedure TBackUpForm.campos;
var
  i: integer;
begin
  with tde do
  begin
    for i := 0 to tor.FieldCount - 1 do
    begin
      if (Fields[i].AsString = '') and (Fields[i].DataType <> ftAutoInc) then
      begin
        if Assigned(tor.Fields[i]) then
        begin
          Fields[i].DataSet.Edit;
          if tor.Fields[i].IsNull then
          begin
            if Fields[i].Required and tor.Fields[i].IsNull then
              Fields[i].Value := 0;
            { ojo con esto
              ya que si hay campos vacios en una tabla y cambiamos esos
              campos a requeridos, puede haber problemas al convertirlos. }
          end
          else
            Fields[i] := tor.Fields[i];
        end;
      end;
    end;
  end;
end;

procedure TBackUpForm.TraerUnidades(Lista: TStrings);
var
  Buffer: Pchar;
  Largo: integer;
  i: integer;
  sTemp: String;
begin
  Buffer := '';
  Largo := GetLogicalDriveStrings(0, Buffer);
  GetMem(Buffer, Largo);
  GetLogicalDriveStrings(Largo, Buffer);
  sTemp := '';
  for i := 4 to Largo do
  begin
    if Buffer[i] <> #0 then
      sTemp := sTemp + Buffer[i]
    else
    begin
      Lista.Append(sTemp);
      sTemp := '';
    end;
  end;
  Freemem(Buffer);
end;

procedure TBackUpForm.conecta;
var
  IniFile: TIniFile;
begin
  // Obtiene la ruta del pendrive
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'DeG');
  unidad := IniFile.ReadString('Actualiza', 'Unidad', '');
  if unidad = '' then
    showmessage
      ('Verifique que este bien conectado el Pendrive. O que el sistema antiguo este copiado en el mismo');
end;

procedure TBackUpForm.BitBtn1Click(Sender: TObject);
begin
  ConfigurarForm := TConfigurarForm.Create(self);
  try
    ConfigurarForm.ShowModal;
  finally
    ConfigurarForm.Free;
  end;
end;

procedure TBackUpForm.BitBtn2Click(Sender: TObject);
begin
  conecta;
  if unidad <> '' then
    copiatodo; // Copiar;
end;

procedure TBackUpForm.Copiar;
var
  Origen, Destino: file of byte;
  Buffer: array [0 .. 4096] of char;
  Leidos: integer;
  Longitud: longint;
  O, D: string;
begin
  { Abrimos fichero Origen y Destino }
  if UnidadRadioGroup.ItemIndex = 0 then
  begin
    O := BaseDeDatos; // 'C:';
    D := unidad; // +'CiveLoo\GeN\'+DBase;
  end
  else
  begin
    O := unidad; // +'\CiveLoo\GeN\'+DBase;
    D := BaseDeDatos; // 'C:';
  end;
  AssignFile(Origen, O);
  // AssignFile(Origen,O+'\DeG\DistribuidoraCasadoro\DistribuidoraCasadoro.deg');
  reset(Origen);
  AssignFile(Destino, D);
  rewrite(Destino);
  { Hallamos la longitud del fichero a copiar }
  Longitud := FileSize(Origen);
  { Actualizamos limites de la ProgressBar }
  PB1.Max := Longitud;
  PB1.Min := 0;
  while Longitud > 0 do
  begin
    BlockRead(Origen, Buffer[0], SizeOf(Buffer), Leidos);
    Longitud := Longitud - Leidos;
    BlockWrite(Destino, Buffer[0], Leidos);
    PB1.Position := PB1.Position + Leidos;
  end;
  CloseFile(Origen);
  CloseFile(Destino);
  showmessage('Proceso terminado con �xito');
  Close;
end;

procedure TBackUpForm.copiatodo;
  function copiatodo(Origen, Destino: String): longint;
  var
    F: TShFileOpStruct;
    sOrigen, sDestino: String;
  begin
    Result := 0;
    sOrigen := Origen + #0;
    sDestino := Destino + #0;

    with F do
    begin
      Wnd := Application.Handle;
      wFunc := FO_COPY;
      pFrom := @sOrigen[1];
      pTo := @sDestino[1];
      fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION
    end;

    Result := ShFileOperation(F);
  end;

begin
  if UnidadRadioGroup.ItemIndex = 0 then
    copiatodo(BaseDeDatos, unidad)
  else
    copiatodo(Path, BaseDeDatos);
  // copiatodo(unidad + '\' + DBase, BaseDeDatos);
  showmessage('Proceso terminado con �xito');
  Close;
end;

procedure TBackUpForm.FormCreate(Sender: TObject);
begin
  // DM := TDM.Create(self);
end;

end.
