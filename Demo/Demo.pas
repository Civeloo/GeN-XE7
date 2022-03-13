unit demo;

interface

uses
  SysUtils, Classes, DB, DataModule, Windows, IBCustomDataSet, IBQuery;

type
  TDemoDM = class(TDataModule)
    Query: TIBQuery;
    Procedure verify;
  private
    { Private declarations }
  public
    frstDay, toDay: TDate;
    week: integer;
    procedure EnvioRamTerminado;
    function EnviarRam(enviar: ShortString; tipo: PWideChar): String;
    { Public declarations }
  end;

type
  TCompartido = record
    Numero: integer;
    Cadena: String[20];
  end;

  PCompartido = ^TCompartido;

var
  DemoDM: TDemoDM;
  L: ShortString;
  M: PWChar;
  Compartido: PCompartido;
  FicheroM: THandle;
  enviar: string;

implementation

{$R *.dfm}

procedure TDemoDM.EnvioRamTerminado;
begin
  UnmapViewOfFile(Compartido);
  CloseHandle(FicheroM);
end;

function TDemoDM.EnviarRam(enviar: ShortString; tipo: PWideChar): String;
begin
  { Creamos el fichero de memoria }
  FicheroM := CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0,
    SizeOf(TCompartido), tipo);
  { Si no se cre� el fichero, lo llenamos de ceros }
  if FicheroM = 0 then
    raise Exception.Create('Error al crear el fichero' +
      '/Error while create file');

  { Direccionamos nuestra estructura al fichero de memoria }
  Compartido := MapViewOfFile(FicheroM, FILE_MAP_WRITE, 0, 0, 0);

  { Escribimos datos en el fichero de memoria }
  Compartido^.Numero := 111;
  Compartido^.Cadena := enviar;
end;

Procedure TDemoDM.verify;
var
  c, r: integer;
begin
  M := 'DeG';
  // CHEQUEO
  if ('2025-329D' = Maquina) then
    Licencia := 'LICENCIA DE USO PARA KNOEPFLI'
  else if ('0464-3080' = Maquina) then
    Licencia := 'LICENCIA DE USO PARA LOPEZ'
  else if ('D803-4016' = Maquina) then
    Licencia := 'LICENCIA DE USO PARA DAGOSTINO'
    // else  if ('5CDC-43D4'= Maquina) then Licencia:= 'LICENCIA DE USO REGISTRADA PARA GUILLEN'
  else if ('8095-B051' = Maquina) then
    Licencia := 'LICENCIA DE USO PARA ABELLAN'
  else if ('0AE0-8A6A' = Maquina) then
    Licencia := 'LICENCIA DE USO PARA LOESCHBOR'
  else if ('121C-6D80' = Maquina) then
    Licencia := 'LICENCIA DE USO PARA MARTINEZ DE GIORGI'
  else if ('A4D0-BDF6' = Maquina) then
    Licencia := 'LICENCIA DE USO PARA VALDERREY'
  else if ('A434-6A29' = Maquina) then
    Licencia := 'LICENCIA DE USO PARA BOCCHIA'
  else if ('C816-D617' = Maquina) then
    Licencia := 'LICENCIA DE USO PARA BULONERIA SARMIENTO'
  else if ('8831-12CF' = Maquina) then
    Licencia := 'LICENCIA DE USO PARA GALVAN'
  else if ('9496-F834' = Maquina) then
    Licencia := 'LICENCIA DE USO PARA JUAREZ'
  else if ('6060-3FD7' = Maquina) then
    Licencia := 'LICENCIA DE USO PARA SERVDOR!!!'
  else if ('3C67-839A' = Maquina) then
    Licencia := 'LICENCIA DE USO REGISTRADA PARA PEN DRIVE'
  else if ('E0FD-1813' = Maquina) then
    Licencia := 'LICENCIA DE USO REGISTRADA PARA PEN DRIVE'
  else if ('1C90-D981' = Maquina) then
    Licencia := 'LICENCIA DE USO REGISTRADA PARA NETBOOK'
  else
    Licencia := 'Versi�n Demostraci�n';
  L := 'Try';
  EnviarRam(L, M);
  if Licencia = 'Versi�n Demostraci�n' then
  begin
    DM := TDM.Create(self);
    frstDay := StrToDate('01/12/2010');
    mode := '';
    toDay := now;
    week := Trunc(toDay - frstDay);
    if week = 0 then
      mode := 'Read'
    else if week > 0 then
      mode := 'Read';
    week := 30;
    c := 0;
    r := 0;
    DM.connection;
    Query.SQL.Text := 'SELECT * FROM "Venta" ORDER BY Fecha';
    Query.Open;
    while not Query.Eof do
    begin
      if Query.FieldByName('Fecha').AsDateTime <> frstDay then
        c := c + 1;
      frstDay := Query.FieldByName('Fecha').AsDateTime;
      r := r + 1;
      Query.Next;
    end;
    if (c > week) or (r > week * 90) then
      L := 'Rea';
    Query.Close;
  end
  else
    DM := TDM.Create(self);
end;

end.
