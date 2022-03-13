unit ImprimirDM;

interface

uses
  SysUtils, Classes, DataModule, Dialogs, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxClass, frxDBSet, frxExportPDF, frxBarcode, frxExportCSV,
  frxExportBaseDialog, shellapi, windows;
type
  TImprimirDataModule = class(TDataModule)
    frxBarCodeObject1: TfrxBarCodeObject;
    frxPDFExport1: TfrxPDFExport;
    frxDBDataset1: TfrxDBDataset;
    frxCSVExport1: TfrxCSVExport;
    frxReport1: TfrxReport;
    Function VTA(nro, let: string): string;
    Function COMP(nro, let: string): string;
    Function OPER(nro, tipo, let: string): string;
    Function PRE(nro, let: string): string;
    Function PlanillaCobrador(nro, let: string): string;
    Function Contrato(nro, let: string): string;
    Function EAN(nro: string): string;
    Procedure Impr(vsql, rpt: string);
    Procedure CSV(sql, n: string);
    Procedure SImpr(vsql, reporte: string);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function DigitoVerificador(Numero: string): string;
  public
    { Public declarations }
//    clienteSql, articuloSql, ventaItemSql, ivaVtaSql, presupuestoSql, presupuestoTSql, vtaSql, ventaTSql, OperSql, OperacionSql, OperacionItemSql: string;
    function CodigoBarraElectronico(cuit,tipo,pvta,cae,vto:string):string;
    procedure ExportarReporteTXT(vRpt: string);
  end;

var
  ImprimirDataModule: TImprimirDataModule;



implementation

{$R *.dfm}

uses OperacionDM;

Procedure TImprimirDataModule.SImpr;
begin
  dm.Query.sql.Text := vsql;
  dm.Query.Open;
  with frxReport1 do
  begin
    LoadFromFile(path + 'rpt\' + reporte + '.fr3');
    try
      ShowReport(True);
    finally
      Free;
    end;
  end;
end;

Procedure TImprimirDataModule.CSV; // exporta consulta a excel
var
  m: TStringList;
  g: TSaveDialog;
  CSV: TextFile;
  col: string;
  // ? f,c :integer;
  c: Integer;
begin
  dm.Query.sql.Text := sql;
  dm.Query.Open;
  try
    m := TStringList.Create;
    g := TSaveDialog.Create(Self);
  finally
    g.Filter := 'Ficheros Excel (*.csv)|*.csv|Todos los ficheros|*.*';
    g.Title := n;
    g.DefaultExt := 'csv';
    g.FileName := n;
    // ingresa los campos
    for c := 0 to dm.Query.FieldCount - 1 do // columnas
    begin
      col := col + '"' + dm.Query.Fields.Fields[c].DisplayName + '",';
    end;
    m.Append(col);
    // ingresa el contenido
    while not dm.Query.Eof do // filas
    begin
      col := '';
      for c := 0 to dm.Query.FieldCount - 1 do // columnas
      begin
        col := col + '"' + dm.Query.Fields.Fields[c].AsString + '",';
      end;
      m.Append(col);
      dm.Query.Next;
    end;
    if g.Execute then
    begin
      assignFile(CSV, g.FileName);
      rewrite(CSV);
      write(CSV, m.Text);
      closeFile(CSV);
    end;
  end;
  m.Free;
  g.Free;
end;

procedure TImprimirDataModule.DataModuleCreate(Sender: TObject);
begin
  dm.ConfigQuery.Open;
end;

procedure TImprimirDataModule.Impr;
var
  Pict, Pict2, Pict3, Pict4 :TfrxPictureView;
  tipo_cbte :Integer;
  oExportfilter :TfrxCustomExportFilter;
  archivoPDF,
  ctipo,nctipo :string;
begin
//  if rpt='X' then
//  begin
//    ctipo := '';//'REMITO';
//    rpt := 'COriginal';//reporte;
  if ((rpt='X') or (rpt='PEDX') or (rpt='PEDA') or (rpt='PEDB') or (rpt='PEDC')) then
  begin
    ctipo := 'REMITO';
    rpt := StringReplace(rpt, 'PED', '', [rfReplaceAll]);
    if (rpt='X') then rpt:='B';
  end else
  if ((rpt='A') or (rpt='B') or (rpt='C')) then
  begin
    ctipo := 'FACTURA';
    nctipo := '';
    //rpt := reporte;
  end
  else
  if ((rpt='NCA') or (rpt='NCB') or (rpt='NCC')) then
  begin
    ctipo := 'NOTA DE CREDITO';
    rpt := StringReplace(rpt, 'NC', '', [rfReplaceAll]);
  end
  else
  if ((rpt='PA') or (rpt='PB') or (rpt='PC')) then
  begin
    ctipo := 'PRESUPUESTO';
    rpt := StringReplace(rpt, 'P', '', [rfReplaceAll]);
  end;
  if not(rpt='CTicket') and ((reporte='TElectronica') or (reporte='CTicket')) then rpt := reporte;
  dm.Query.sql.Text := 'SELECT '+
    QuotedStr(PuntoVenta) + ' As PtoVta,' +
    QuotedStr(dm.ConfigQuery.FieldByName('NOMBRE').AsString) + ' As Empresa,' +
    QuotedStr(dm.ConfigQuery.FieldByName('TITULAR').AsString) + ' As ETITULAR,'
    + QuotedStr(dm.ConfigQuery.FieldByName('IVA').AsString) + ' As EIVA,' +
    QuotedStr(dm.ConfigQuery.FieldByName('CODIGOAREA').AsString) +
    ' As ECODIGOAREA,' + QuotedStr(dm.ConfigQuery.FieldByName('TELEFONO')
    .AsString) + ' As ETELEFONO,' +
    QuotedStr(dm.ConfigQuery.FieldByName('DIRECCIONCOMERCIAL').AsString) +
    ' As EDIRECCIONCOMERCIAL,' + QuotedStr(dm.ConfigQuery.FieldByName('CP')
    .AsString) + ' As ECP,' + QuotedStr(dm.ConfigQuery.FieldByName('CIUDAD')
    .AsString) + ' As ECIUDAD,' +
    QuotedStr(dm.ConfigQuery.FieldByName('DEPARTAMENTO').AsString) +
    ' As EDEPARTAMENTO,' + QuotedStr(dm.ConfigQuery.FieldByName('PROVINCIA')
    .AsString) + ' As EPROVINCIA,' +
    QuotedStr(dm.ConfigQuery.FieldByName('CUIT').AsString) + ' As ECUIT,' +
    QuotedStr(dm.ConfigQuery.FieldByName('WEB').AsString) + ' As EWEB,' +
    QuotedStr(FormatDateTime('dd/mm/yyyy', dm.ConfigQuery.FieldByName('FECHA')
    .AsDateTime)) + ' As EFECHA,' + QuotedStr(dm.ConfigQuery.FieldByName('IIBB')
    .AsString) + ' As EIIBB, '
    +QuotedStr(ctipo)+' as CTIPO, '+QuotedStr(nctipo)+' as NCTIPO,'
    + vsql;
  dm.Query.Open;
  with frxReport1 do
  begin
    LoadFromFile(path + 'rpt\' + rpt + '.fr3');
    if (reporte = 'COriginal') or (reporte = 'Presupuesto')
    or (reporte = 'FElectronica')
    then
    begin
      Pict := TfrxPictureView(frxReport1.FindObject('Picture1'));
      if Assigned(Pict) then
        Pict.Picture.LoadFromFile(path + 'img\empresa.BMP');
//      if (reporte = 'FElectronica') then // wsfev1
//      begin
//         {
//         Campo CbteTipo sea:
//          - 01, 02, 03, 04, 05,34,39,60, 63 para los clase A
//          - 06, 07, 08, 09, 10, 35, 40,64, 61 para los clase B.
//          - 11, 12, 13, 15 para los clase C.
//          - 51, 52, 53, 54 para los clase M.
//          - 49 para los Bienes Usados
//          Consultar método FEParamGetTiposCbte.
//         }
//         Case IndexStr(dm.Query.FieldByName('LETRA').AsString, ['A', 'B', 'C']) of
//          0: tipo_cbte := 1;//A
//          1: tipo_cbte := 6;//B
//          2: tipo_cbte := 11;//C
//          end;
//
//          AfipWsfev1(
//          tipo_cbte// tipo_cbte
//          ,dm.Query.FieldByName('PtoVta').AsInteger// punto_vta
//          ,80// tipo_doc
//          ,0// presta_serv
//          ,0// id
//          ,0// cbt_desde
//          ,0// cbt_hasta : Integer;
//          ,dm.Query.FieldByName('FECHA').AsString// fecha
//          ,dm.Query.FieldByName('CCUIT').AsString// nro_doc
//          ,dm.Query.FieldByName('TOTAL').AsString// imp_total
//          ,'0.00'// imp_tot_conc
//          ,dm.Query.FieldByName('SUBTOTAL').AsString// imp_neto
//          ,dm.Query.FieldByName('IMPUESTO').AsString// impto_liq
//          ,'0.00'// impto_liq_rni
//          ,'0.00'// imp_op_ex
//          ,'20170425'// fecha_cbte
//          ,'20170425'// fecha_venc_pago
//          ,'20170425'// fecha_serv_desde
//          ,'20170425'// fecha_serv_hasta
//          ,'20170425'// venc : String;
//          ,'PES'// moneda_id
//          ,'1.000'// moneda_ctz : String ;
//          ,dm.Query.FieldByName('NG2').AsString// bi21
//          ,dm.Query.FieldByName('IVA2').AsString// i21
//          ,dm.Query.FieldByName('NG1').AsString// bi105
//          ,dm.Query.FieldByName('IVA1').AsString// i105: String;
//          );
//      end
    end
    else
      if reporte = 'CDuplicado' then
    begin
      Pict := TfrxPictureView(frxReport1.FindObject('Picture1'));
      if Assigned(Pict) then
        Pict.Picture.LoadFromFile(path + 'img\empresa.BMP');
      Pict2 := TfrxPictureView(frxReport1.FindObject('Picture2'));
      if Assigned(Pict2) then
        Pict2.Picture.LoadFromFile(path + 'img\empresa.BMP');
    end
    else if reporte = 'CTriplicado' then
    begin
      Pict := TfrxPictureView(frxReport1.FindObject('Picture1'));
      if Assigned(Pict) then
        Pict.Picture.LoadFromFile(path + 'img\empresa.BMP');
      Pict2 := TfrxPictureView(frxReport1.FindObject('Picture2'));
      if Assigned(Pict2) then
        Pict2.Picture.LoadFromFile(path + 'img\empresa.BMP');
      Pict3 := TfrxPictureView(frxReport1.FindObject('Picture3'));
      if Assigned(Pict3) then
        Pict3.Picture.LoadFromFile(path + 'img\empresa.BMP');
    end
    else if reporte = 'CCuadriplicado' then
    begin
      Pict := TfrxPictureView(frxReport1.FindObject('Picture1'));
      if Assigned(Pict) then
        Pict.Picture.LoadFromFile(path + 'img\empresa.BMP');
      Pict2 := TfrxPictureView(frxReport1.FindObject('Picture2'));
      if Assigned(Pict2) then
        Pict2.Picture.LoadFromFile(path + 'img\empresa.BMP');
      Pict3 := TfrxPictureView(frxReport1.FindObject('Picture3'));
      if Assigned(Pict3) then
        Pict3.Picture.LoadFromFile(path + 'img\empresa.BMP');
      Pict4 := TfrxPictureView(frxReport1.FindObject('Picture4'));
      if Assigned(Pict4) then
        Pict4.Picture.LoadFromFile(path + 'img\empresa.BMP');
    end;

    if envEmail then
    begin
      archivoPDF := Path + 'db\'
        +dm.Query.FieldByName('PtoVta').AsString
        +dm.Query.FieldByName('LETRA').AsString
        +dm.Query.FieldByName('COMPROBANTE').AsString
        +'.pdf';
      if not FileExists(archivoPDF) then
      begin
        oExportfilter := TfrxCustomExportFilter(frxPDFExport1);
        oExportFilter.ShowDialog := False;
        oExportFilter.FileName := archivoPDF;
        PrepareReport(True);
        Export(oExportFilter);
      end;
      dm.EnviarEmail(
        dm.Query.FieldByName('EMAIL').AsString,
        'FACTURA '+dm.Query.FieldByName('Empresa').AsString,
        'Adjunto factura&#44 que disfrutes tu compra.<br>'+dm.Query.FieldByName('EWEB').AsString,
        archivoPDF
      );
    end;

    try
      if DM.ObtenerConfig('ImprimirMostrar')='NO ' then
      begin
        PrepareReport;
        PrintOptions.ShowDialog := False;
        Print;
      end else ShowReport(True);
    finally
      Free;
      // FreeAndNil(pict);
    end;
  end;
end;

Function TImprimirDataModule.PRE;
begin
  Result := presupuestoSql + '  WHERE' + '  ("Presupuesto".CODIGO = ' + nro +
    '  ) AND' + '  ("Presupuesto".LETRA = ' + QuotedStr(let) + '  )' + '';
end;

Function TImprimirDataModule.VTA;
var
  w,cb,tipo,cae,vto : string;
begin
  w := ' WHERE ("Venta".CODIGO = '+nro+') AND ("Venta".LETRA = '+QuotedStr(let)+')';
  dm.Query.sql.Text:='Select "Venta".DESCRIPCION, "Venta".TERMINOS  From "Venta" '+w;
  dm.Query.Open;
  tipo := DM.TraerTipoCbte(let);
  cae := dm.Query.FieldByName('DESCRIPCION').AsString;
  vto := dm.Query.FieldByName('TERMINOS').AsString;
  dm.Query.Close;
  cb := CodigoBarraElectronico(CUIT,tipo,PuntoVenta,cae,vto);
  Result := QuotedStr(cb)+' as CB, '+vtaSql+w;
end;

function TImprimirDataModule.OPER;
var
  w,cb,cae,vto : string;
begin
  w := ' WHERE ("Operacion".CODIGO = '+nro+') AND ("Operacion".LETRA = '+QuotedStr(let)+')';
  dm.Query.sql.Text:='Select "Operacion".DESCRIPCION, "Operacion".TERMINOS  From "Operacion" '+w;
  dm.Query.Open;
  tipo := DM.TraerTipoCbte(let);
  cae := dm.Query.FieldByName('DESCRIPCION').AsString;
  vto := dm.Query.FieldByName('TERMINOS').AsString;
  dm.Query.Close;
  cb := CodigoBarraElectronico(CUIT,tipo,PuntoVenta,cae,vto);
  Result := QuotedStr(cb)+' as CB, '+operSql+w;
//  Result := operSql
//    +' WHERE' + '  ("Operacion".CODIGO = ' + nro + ' )'
//    +' AND ("Operacion".TIPO = ' + QuotedStr(tipo) + ' )'
//    +' AND ("Operacion".LETRA = ' + QuotedStr(let) + ' )';
end;

Function TImprimirDataModule.PlanillaCobrador;
begin
  Result := '"Cobrador".NOMBRE AS COBRADOR, "Cliente".ZONA,' +
    ' "CtaCte".FECHA, "CtaCte".SALDO, "Cliente".NOMBRE AS CLIENTE,' +
    ' "CtaCteItem".IMPORTE, "CtaCte".ARTICULO as CB, "CtaCteItem".VENCE,' +
    ' "CtaCteItem".CUOTA, "CtaCte".OPERACION' + ' FROM "CtaCte"' +
    ' INNER JOIN "CtaCteItem" ON ("CtaCte".CLIENTE = "CtaCteItem".CLIENTE) AND ("CtaCte".OPERACION = "CtaCteItem".OPERACION)'
    + ' INNER JOIN "Cliente" ON ("CtaCteItem".CLIENTE = "Cliente".CODIGO)' +
    ' INNER JOIN "Cobrador" ON ("CtaCte".COBRADOR = "Cobrador".CODIGO)' +
    ' WHERE ("CtaCte".OPERACION = ' + nro + ')' +
    ' ORDER BY "CtaCteItem".CUOTA';
end;

function TImprimirDataModule.COMP(nro, let: string): string;
var
  w,cb,tipo,cae,vto : string;
begin
  w := ' WHERE ("Compra".CODIGO = '+nro+') AND ("Compra".LETRA = '+QuotedStr(let)+')';
  dm.Query.sql.Text:='Select "Compra".DESCRIPCION, "Compra".TERMINOS  From "Compra" '+w;
  dm.Query.Open;
  tipo := DM.TraerTipoCbte(let);
  cae := dm.Query.FieldByName('DESCRIPCION').AsString;
  vto := dm.Query.FieldByName('TERMINOS').AsString;
  dm.Query.Close;
  cb := CodigoBarraElectronico(CUIT,tipo,PuntoVenta,cae,vto);
  Result := QuotedStr(cb)+' as CB, '+compSql+w;
end;

Function TImprimirDataModule.Contrato;
begin
  Result := 'CODIGO, NUMERO, FECHA, TIPO, DIA, DESCRITO, MES, MESCRITO, ANO, AESCRITO, '
    + 'CANONES, CIMPORTE, CIESCRITO, IMPORTETOTAL, ITESCRITO, TIEMPO, T2, BIEN, '
    + 'DADOR, DTIPO, DNOMBRE, DAPELLIDO, DDOCUMENTO, DDTIPO, DDOMICILIO, DDNUMERO, '
    + 'DCIUDAD, DPROVINCIA, DPAIS, TOMADOR, TTIPO, TNOMBRE, TAPELLIDO, TDOCUMENTO, '
    + 'TDTIPO, TDOMICILIO, TDTRABAJO, TCIUDAD, TPROVINCIA, TPAIS ' +
    'FROM "Contrato" WHERE NUMERO=' + nro;
end;

Function TImprimirDataModule.EAN;
begin
  Result := nro + 'as CODIGOBARRA FROM "Empresa"';
end;

function TImprimirDataModule.DigitoVerificador;
var
  i, par, non, sum : Integer;
begin
  par:= 0;
  non:= 0;
  for i:= 1 to Length(Numero) do
    if i mod 2 = 0 then
      Inc(par, StrToInt(Numero[i]))
    else
      Inc(non, StrToInt(Numero[i]));

  non:= non * 3;
  sum:= non + par;

  for i:= 0 to 9 do
    if (sum + i) mod 10 = 0 then
    begin
      Result:= Numero + IntToStr(i);//Result:= IntToStr(i); (si queres solo el díg.)
      Exit;
    end;
end;

function TImprimirDataModule.CodigoBarraElectronico;
var
  cb : string;
begin
  cb := cuit+'0'+tipo+'0000'+pvta+cae+vto;
  result := DigitoVerificador(cb);
end;

procedure TImprimirDataModule.ExportarReporteTXT;
begin
    with frxReport1 do
    begin
      LoadFromFile(path + 'rpt\' + vRpt + '.fr3');
      try
        PrepareReport(True);
        frxCSVExport1.FileName := vRpt+'.txt';
        Export(frxCSVExport1);
      finally
//        Free;
      end;
  end;
end;

end.
