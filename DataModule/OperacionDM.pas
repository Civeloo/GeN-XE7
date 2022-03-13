// ******************************************************************************
// * DeGsoft GeN                                                                *
// * ===========                                                                *
// * GeN(tm) : ERP Software (http://www.civeloo.com)                            *
// * Copyright (c) 2002-2019 by the Civeloo                                     *
// * For more information visit: http://www.civeloo.com                         *
// * This program is free software. You can redistribute it and/or modify       *
// * it under the terms of the GNU General Public License as published by       *
// * the Free Software Foundation; either version 3 of the License.             *
// ******************************************************************************

unit OperacionDM;

interface

uses
  SysUtils, Classes, DB, DataModule, ImprimirDM, Dialogs, Controls, DateUtils,
  IBX.IBCustomDataSet, IBX.IBQuery, Math, AfipDM, System.JSON, RestDM,
  System.Ansistrings, System.MaskUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.Async, FireDAC.DApt;


type
  matriz = array of array of string;

  TOperacionDataModule = class(TDataModule)
    procedure fd(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    comp, a, pagare, cae, vto, mensaje//, ptovta, tipocbte
    : string;
    i: integer;
    IIBB, cmv: Double;
    jsResponse: TJSONValue;
    function ProcVTA(pvta, com,
      let, cod, fech, ven, cui, ctan, notas :string; pre, pgr, impr :Boolean;
      cost, comv, env, impu, cheq, ch3q, cont, tot, sbt, des, tarj, otr, sal, pag,
      int, n10, n21, i10, i21, deud, ulc,
      n3, i3, exc, noGra, pagCueIva, pagCueOtr, perIIBB, perImpMun, impInt, otrTrib
     :Double):Boolean;
    Procedure ProcOPER(tipo, let, cod, fech, ven, cui, ctan, notas: string;
      pre, pgr, impr: Boolean; cost, comv, env, impu, cheq, ch3q, cont, tot, sbt, des,
      tarj, otr, sal, pag, int, n10, n21, i10, i21, deud, ulc,
      noGra,pagCueIva,pagCueOtr,perIIBB,perImpMun,impInt,otrTrib: Double);
    Procedure ProcCompra(pvta, let, cod, fech, ven, cui, com, ctan, notas: string; pgr: Boolean;
      cost, impu, cheq, ch3q, cont, tot, sbt, des, tarj, otr, sal, pag, n10,
      n21, n3, i10, i21, i3, exc, deud , noGra, pagCueIva, pagCueOtr, perIIBB, perImpMun, impInt, otrTrib
      : Double);
    Procedure ProcPlan(let, cod, ven, cui, ctan, cuoimp, cuocant, cob: string;
      fecha: TDateTime; pre, pgr: Boolean; cost, comv, env, impu, cheq, ch3q, cont,
      tot, sbt, des, tarj, otr, sal, pag, inte, n10, n21, i10, i21, deud,
      ulc: Double);
    Procedure ProcPresup(let, cod, fec, ven, cui, cno, notas: string;
      pre, pgr: Boolean; cost, comv, env, impu, che, ch3q, cont, tot, sbt, des, tarj,
      otr, sal, pag, int, n10, n21, i10, i21, deud, ulc: Double);
    Procedure AnularVTA(nro: string);
    Procedure CtaCte(tipo, cod, ctan: string; pag, cheq, ch3q, cont, tarj,
      sald: Double);
    Procedure FormaPago(desc, vta, comp, ctac, pago, cont, cheq, chei, chen,
      ched, chedi, tarj, tarn, tarimp, otri, mone, meim, metc, sald, paga, fech,
      ch3q, ch3i, ch3n, ch3d, ch3di: string);
    Function ArtNuevo(prec, desc: string): string;
    procedure FactRem(codRem,let, cod, fech, ven, cui, ctan, notas: string; pre, pgr,impr: Boolean;
      cost, comv, env, impu, cheq, ch3q, cont, tot, sbt, des, tarj, otr, sal, pag,
      int, n10, n21, i10, i21, deud, ulc,
//      noGra,pagCueIva,pagCueOtr,perIIBB,perImpMun,impInt,otrTrib: Double);
      n3, i3, exc, noGra, pagCueIva, pagCueOtr, perIIBB, perImpMun, impInt, otrTrib
     : Double; wc :Integer);
    Procedure Asiento(ctan, nro, fech, det, d, h: string);
    Procedure LibroDiario(oper, nro, let, cod, fech: string; pgr: Boolean;
      tot, pag, cheq, ch3q, cont, tarj, impu, deud, cmv, comv: Double);
    Procedure LibroIVAvta(fec, nro, cli, cui, n10, n21, i10, i21, tot: string);
    Procedure LibroIVACompra(fec, nro, cli, com, n10, n21, n3, i10, i21, i3, per, ret, tot: string);
    Function MesLetra(fech: TDate): string;
    Function CostMercVend(ulc, cost: Double): Double;
    procedure VarCos(cod, cant: string; cost: Double);
    procedure ExpCSV(sql: string);
    Procedure MovCaja(tipo, soc, imp, desc: string);
    procedure CodigoBarra(cb: string);
    procedure BorrarArticulos;
    procedure ModificarArticulos(codigo, descripcion,
      ultcosto, costo, precio, precio1, precio2, disponible,
      porcentaje, impotros, unidad, tasa, iibb, ctanombre, ctatipo, ctaanticipo,ctaiibb,
      fecha, fechacompult, codigobarra,
      categoria, color, marca, proveedor, rubro, subcategoria : string);
    procedure ActualizarCantidadArticulo(codigo,cantidad:string);
    procedure DataSetToCsv(psRutaFichero : String);
//    procedure WSFE(cbteFecha, let, concepto, docTipo, docNro, cbte, impNeto, impIva, impTotal, asocTipo, asocNro, n10, n21, i10, i21, impEx :string);
    procedure WSFE(cbteFecha, let, concepto, docTipo, docNro, cbte, impNeto, impIva, impTotal, asocTipo, asocNro, impEx :string);
    procedure ActualizarSiapVtaComp(desde,hasta:string);
    procedure ActualizarSiapCmpComp(desde,hasta:string);
    function InsertarAlicIva:Integer;
    procedure AgregarAlicIva(cod,id: integer; bImp,imp: double);
    procedure ActualizarSiap(tipo,desde,hasta:string);
    procedure ActualizarArticulos;
  end;

var
  mat: matriz;
  OperacionDataModule: TOperacionDataModule;

const tipoIVA : array[1..3] of string = ('Responsable Monotributo','Responsable Inscripto','No Responsable');//,'Exento','S.R.L.','S.A.','Cooperativa');

implementation

{$R *.dfm}

Procedure TOperacionDataModule.MovCaja;
begin
with dm do begin
  qQ.sql.Text := 'INSERT INTO "MovCaja" (TIPO,SOCIO,IMPORTE,DESCRIPCION) ' +
    'VALUES (' + quotedstr(tipo) + ',' + soc + ',' + imp + ',' + quotedstr(desc)
    + '' + ')';
  qQ.ExecSQL;
  // Insertar en la tabla LibroDiario
  LibroDiario(tipo + ' CAJA', '', '', soc, '', false, strtofloat(imp), 0, 0, 0,
    0, 0, 0, 0, 0, 0);
  BaseDatosFB.Commit;
end;
end;

Procedure TOperacionDataModule.ExpCSV;
begin
with dm do begin
  qT.sql.Text := sql;
  qT.open;
end;
end;

Function TOperacionDataModule.ArtNuevo;
var
  nro: string;
begin
with dm do begin
  nro := inttostr(DM.UltimoRegistro('Articulo', 'CODIGO'));
  qQ.sql.Text := 'INSERT INTO "Articulo" (CODIGO, DESCRIPCION, COSTO, ULTCOSTO, '
    + ' PRECIO1, PRECIO2, PRECIO3, PRECIO4, ' +
    ' PRECIO5, PRECIO6, PRECIO, PORCENTAJE, ' +
    ' ULTPRECIO, MARCA, COLOR, CATEGORIA, ' +
    ' SUBCATEGORIA, UBICACION, UNIDAD, DISPONIBLE, ' +
    ' ENPRODUCCION, NOTAS, IVA, TASA, ' +
    ' IMPOTROS, IIBB, STOCKMINIMO, STOCKMAXIMO, ' +
    ' STOCKVENDIDO, FECHACOMPULT, LISTA, PROCEDENCIA, ' +
    ' CODIGOBARRA, RUBRO, PROVEEDOR, GARANTIA, ' +
    ' FECHA, PEDIDO, STOCK, EXISTENTE, ' +
    ' ACTUAL, MARCADOCONTADO, MARCADOLISTA, MARCADOFINAL, ' +
    ' PREPARADO, CTANOMBRE, CTATIPO, CTAANTICIPO, ' +
    ' CTAIIBB, ESTADO, VENCE, VENCIMIENTO) VALUES ' + ' (' + nro + ', ' +
    quotedstr(desc) + ', 0, 0, ' + ' ' + prec + ', ' + prec + ', ' + prec + ', '
    + prec + ', ' + ' ' + prec + ', ' + prec + ', ' + prec + ', 0, ' + ' ' +
    prec + ', 0, 0, 0, ' + ' 0, NULL, ''c/u'', 0, ' + ' NULL, NULL, NULL, 0, ' +
    ' 0, 1, NULL, NULL, ' + ' NULL, ' +
    quotedstr(FormatDateTime('mm/dd/yyyy hh:mm:ss', now)) + ', NULL, NULL, ' +
    ' '''', 0, 1, NULL, ' + ' ' +
    quotedstr(FormatDateTime('mm/dd/yyyy hh:mm:ss', now)) +
    ', NULL, NULL, NULL, ' + ' NULL, NULL, NULL, NULL, ' + ' NULL, 13, 13, 13, '
    + ' 66, NULL, NULL, NULL);';
  qQ.ExecSQL;
  result := nro;
end;
end;

procedure TOperacionDataModule.VarCos;

  function roundp(pp: Double): Double;
  begin
    if pp < 1 then
      result := (pp)
    else
      result := strtofloat(Format('%8.2f', [pp]));
  end;

var
  porc,
  fle,
  p1, p2, p3, p4, p5, p6, p, pp: Double;
begin
  with dm do
  begin
    p1 := ConfigQuery.FieldByName('PP1').AsFloat / 100 + 1;
    p2 := ConfigQuery.FieldByName('PP2').AsFloat / 100 + 1;
    p3 := ConfigQuery.FieldByName('PP3').AsFloat / 100 + 1;
    p4 := ConfigQuery.FieldByName('PP4').AsFloat / 100 + 1;
    p5 := ConfigQuery.FieldByName('PP5').AsFloat / 100 + 1;
    p6 := ConfigQuery.FieldByName('PP6').AsFloat / 100 + 1;
    pp := ConfigQuery.FieldByName('PP').AsFloat / 100 + 1;

  // VARIACION DE COSTO
  qT.sql.Text := 'SELECT * FROM "Articulo" WHERE CODIGO=' + cod;
  qT.open;
  //GANANCIA
  if qT.FieldByName('PORCENTAJE').AsFloat > 0 then
    pp := ((qT.FieldByName('PORCENTAJE').AsFloat) / 100+1)
  else
    pp := 1;
  //FLETE
  if qT.FieldByName('ImpOtros').AsFloat > 0 then
    fle := ((qT.FieldByName('ImpOtros').AsFloat) / 100+1)
  else
    fle :=1;
  //cost := cost * fle;
  // PROCENTAJE DE VARIACION (costo * 100 / ultcosto) / 100
  if qT.FieldByName('ULTCOSTO').AsFloat <> 0 then
    porc := ((cost * 100 / qT.FieldByName('ULTCOSTO').AsFloat) / 100)
  else
    porc := 1;
  // REDONDEAR SOLO SI ES MAYOR QUE 1
  if qT.FieldByName('PRECIO1').AsFloat <> 0 then
    p1 := roundp(qT.FieldByName('PRECIO1').AsFloat * porc)
  else
    p := roundp(cost * p1);
  if qT.FieldByName('PRECIO2').AsFloat <> 0 then
    p2 := roundp(qT.FieldByName('PRECIO2').AsFloat * porc)
  else
    p := roundp(cost * p2);
  if qT.FieldByName('PRECIO3').AsFloat <> 0 then
    p3 := roundp(qT.FieldByName('PRECIO3').AsFloat * porc)
  else
    p := roundp(cost * p3);
  if qT.FieldByName('PRECIO4').AsFloat <> 0 then
    p4 := roundp(qT.FieldByName('PRECIO4').AsFloat * porc)
  else
    p := roundp(cost * p4);
  if qT.FieldByName('PRECIO5').AsFloat <> 0 then
    p5 := roundp(qT.FieldByName('PRECIO5').AsFloat * porc)
  else
    p := roundp(cost * p5);
  if qT.FieldByName('PRECIO6').AsFloat <> 0 then
    p6 := roundp(qT.FieldByName('PRECIO6').AsFloat * porc)
  else
    p := roundp(cost * p6);
//  if qT.FieldByName('PRECIO').AsFloat <> 0 then
//    p := roundp(qT.FieldByName('PRECIO').AsFloat * porc)
//  else
    p := roundp(cost * pp);
  //
  qQ.sql.Text := 'Update "Articulo" Set DISPONIBLE = DISPONIBLE + ' + cant +
    ', ULTCOSTO = COSTO ' + ', COSTO = ' + floattostr(cost) + ', PRECIO = ' +
    floattostr(p) + ', PRECIO1 = ' + floattostr(p1) + ', PRECIO2 = ' +
    floattostr(p2) + ', PRECIO3 = ' + floattostr(p3) + ', PRECIO4 = ' +
    floattostr(p4) + ', PRECIO5 = ' + floattostr(p5) + ', PRECIO6 = ' +
    floattostr(p6) + ' Where ' + ' CODIGO = ' + cod;
  qQ.ExecSQL;
  end;
end;

Function TOperacionDataModule.CostMercVend;
begin
  // COSTO DE MERCADERIAS VENDIDAS
  if dm.ConfigQuery.FieldByName('CMV').AsString = 'PPP' then
    result := ((ulc + cost) / 2)
  else if dm.ConfigQuery.FieldByName('CMV').AsString = 'FIFO' then
    result := ulc
  else
    result := cost; // if cosMercaderiaVendida = 'LIFO' then
end;

Function TOperacionDataModule.MesLetra;
var
  mes: string;
begin
  mes := FormatDateTime('mm', fech);
  // fomula mes
  if mes = '01' then
    mes := 'Enero'
  else if mes = '02' then
    mes := 'Febrero'
  else if mes = '03' then
    mes := 'Marzo'
  else if mes = '04' then
    mes := 'Abril'
  else if mes = '05' then
    mes := 'Mayo'
  else if mes = '06' then
    mes := 'Junio'
  else if mes = '07' then
    mes := 'Julio'
  else if mes = '08' then
    mes := 'Agosto'
  else if mes = '09' then
    mes := 'Septiembre'
  else if mes = '10' then
    mes := 'Octubre'
  else if mes = '11' then
    mes := 'Noviembre'
  else if mes = '12' then
    mes := 'Diciembre';
  result := mes;
end;

Procedure TOperacionDataModule.ProcPlan;
var
  i, c, d, n, DiasCalculo: integer;
  Oculto, nro, mes, Dia, Ano, pagare, Tiempo, T2, codn, coddoc, coddirp,
    coddirt, fech: string;
  IIBB, cmv: Double;
  FechaVencimiento: TDate;
begin
with dm do begin
  fech := FormatDateTime('mm/dd/yyyy hh:mm:ss', fecha);
  // INFORMACION DE CLIENTES
  qT.sql.Text := 'SELECT * FROM "Cliente" WHERE CODIGO=' + cod;
  qT.open;
  codn := qT.FieldByName('NOMBRE').AsString;
  coddoc := qT.FieldByName('DOCUMENTO').AsString;
  coddirp := qT.FieldByName('DIRECCION').AsString;
  coddirt := qT.FieldByName('DIRECCIONCOMERCIAL').AsString;
  qT.Close;
  if let = 'X' then
    Oculto := 'S';
  // + formula día mes año
  Dia := FormatDateTime('dd', fecha);
  mes := MesLetra(fecha);
  Ano := FormatDateTime('yyyy', fecha);
  nro := inttostr(DM.UltimoRegistro('Venta', 'CODIGO'));
  if nro = '1' then
    nro := inttostr(dm.ConfigQuery.FieldByName('NroFactura').AsInteger + 1);
  cmv := CostMercVend(ulc, cost);
  // INSERTA EN LA TABLA VENTA
  qQ.sql.Text := 'Insert Into "Venta" (CODIGO, LETRA, CLIENTE, ' +
    ' SUBTOTAL, DESCUENTO, FECHA,' + ' IMPUESTO, TOTAL, CONTADO, CHEQUE,' +
    ' TARJETA, OTROS, SALDO, PAGADO' + ', PAGARE, COSTO, DEUDA, COMISION, ENVIO' +
    ') Values ' + '(' + nro + ', ' + quotedstr(let) + ', ' + cod + ', ' + ' ' +
    floattostr(sbt) + ', ' + floattostr(des) + ', ' + quotedstr(fech) + ', ' +
    floattostr(impu) + ', ' + floattostr(tot) + ', ' + floattostr(cont) + ', ' +
    floattostr(cheq) + ', ' + floattostr(tarj) + ', ' + floattostr(otr) + ', ' +
    floattostr(sal) + ', ' + floattostr(pag) + ',' + quotedstr(pagare) + ',' +
    floattostr(cmv) + ',' + floattostr(deud) + ',' + floattostr(comv) +', '+floattostr(env)+ ')';
  qQ.ExecSQL;
  // Insertar en la tabla de VENTAITEM
  for i := 1 to High(mat[0]) do
  begin
    // CALCULAR IIBB
    qQ.sql.Text := 'SELECT * FROM "IIBB" WHERE CODIGO=' + quotedstr(mat[9, i]);
    qQ.Open;
    if tot - impu > qQ.FieldByName('MONTO').AsFloat then
      IIBB := (tot - impu) * (qQ.FieldByName('COEF1').AsFloat *
        qQ.FieldByName('COEF2').AsFloat * qQ.FieldByName('PORCENTAJE').AsFloat);
    qQ.sql.Text :=
      'Insert Into "VentaItem" (OPERACION, ARTICULO, CANTIDAD, PRECIO, IMPUESTO, SERVICIO, DESCRIPCION) Values'
      + ' ( ' + nro + ', ' + (mat[0, i]) + ', ' + (mat[3, i]) + ', ' +
      (mat[4, i]) + ', ' + mat[6, i] + ', ' + nro + ', ' +
      quotedstr(mat[1, i]) + ');';
    qQ.ExecSQL;
  end;
  // Insertar en la tabla de CtaCte
  qQ.sql.Text := 'Insert Into "CtaCte" (CLIENTE, SALDO, CUOTAS, OPERACION,' +
    ' DESCUENTO, INTERES, FECHA, COBRADOR, RENDIDAS) Values (' + cod + ', ' +
    floattostr(sal) + ', ' + cuocant + ',' + nro + ', ' + floattostr(des) + ', '
    + floattostr(inte) + ', ' + quotedstr(fech) + ', ' + cob + ', 0' + ')';
  qQ.ExecSQL;
  // Insertar en la tabla de CtaCte Item
  if sal > 0.04 then
  begin
    d := 0;
    FechaVencimiento := fecha;
    For i := 1 to High(mat[0]) do
    begin
      if mat[0, i] <> '1' then
        detalle := mat[1, i]
      else
        detalle := memo;
      For n := 1 to StrToInt(cuocant) do // ingreso de cuota
      begin
        FechaVencimiento := (fecha + (n * DiasCalculo)) + d;
        if DayOfTheWeek(FechaVencimiento) = 7 then
        begin
          FechaVencimiento := FechaVencimiento + 1;
          d := d + 1;
        end;
        qQ.sql.Text := 'Insert Into "CtaCteItem" (CUOTA, OPERACION, CLIENTE,' +
          ' DESCRIPCION, IMPORTE, ' + ' VENCE, PAGADO) Values ' + '( ' +
          inttostr(n) + ', ' + nro + ',' + cod + ', ' + quotedstr(detalle) + ','
          + cuoimp + ', ' + quotedstr(FormatDateTime('mm/dd/yyyy',
          FechaVencimiento)) + ', 0)';
        qQ.ExecSQL;
      end;
    end;
  end;
  // Insertar en RendidoVendedor
  if ven <> '' then
  begin
    comv := round(tot * (comv / 100));
    if comv = 0 then
      comv := 0;
    qQ.sql.Text :=
      'Insert Into "RendidoVendedor" (VENDEDOR, VENTA, IMPORTE, FECHA) Values' +
      ' (' + quotedstr(ven) + ', ' + nro + ', ' + Format('%8.2f', [comv]) + ', '
      + quotedstr(fech) + ')';
    qQ.ExecSQL;
  end;
  // Actualizar la tabla de Articulos
  For i := 1 to High(mat[0]) do
  begin
    qQ.sql.Text := 'Update "Articulo" Set DISPONIBLE = DISPONIBLE - ' + mat[3, i]
      + ' Where ' + ' "Articulo".CODIGO = ' + (mat[0, i]);
    qQ.ExecSQL;
  end;
  // Insertar en RendidoVendedor
  if ven <> '' then
  begin
    comv := round(tot * (comv / 100));
    if comv = 0 then
      comv := 0;
    qQ.sql.Text :=
      'Insert Into "RendidoVendedor" (VENDEDOR, VENTA, IMPORTE, FECHA) Values' +
      ' (' + quotedstr(ven) + ', ' + nro + ', ' + Format('%8.2f', [comv]) + ', '
      + quotedstr(fech) + ')';
    qQ.ExecSQL;
  end;
  // Insertar en la tabla de Contrato
  if DiasCalculo = 7 then
  begin
    Tiempo := 'semanas';
    T2 := 'semanales';
  end
  else if DiasCalculo = 1 then
  begin
    Tiempo := 'das';
    T2 := 'diarios';
  end;
  // CONTRATO
  qQ.sql.Text := 'Insert Into "Contrato" (NUMERO, DIA, MESCRITO, CANONES,' +
    ' DNOMBRE, DDTIPO, DDOCUMENTO, DDOMICILIO,' +
    ' TOMADOR, TNOMBRE, TDOCUMENTO, ' + ' TDOMICILIO, TDTRABAJO, BIEN,' +
    ' TIEMPO, T2, CIMPORTE, IMPORTETOTAL, FECHA) Values' + ' (' + nro + ', ' +
    quotedstr(Dia) + ', ' + quotedstr(mes) + ', ' + cuocant + ',' + ' ' +
    quotedstr(dm.ConfigQuery.FieldByName('Titular').AsString) + ', ''DNI'', ' +
    quotedstr(dm.ConfigQuery.FieldByName('Documento').AsString) + ', ' +
    quotedstr(dm.ConfigQuery.FieldByName('DireccionComercial').AsString) + ',' +
    ' ' + quotedstr(cod) + ', ' + quotedstr(codn) + ', ' + quotedstr(coddoc) +
    ',' + ' ' + quotedstr(coddirp) + ', ' + quotedstr(coddirt) + ', ' +
    quotedstr(mat[1, 1]) + ',' + ' ' + quotedstr(Tiempo) + ', ' + quotedstr(T2)
    + ', ' + cuoimp + ', ' + floattostr(tot) + ', ' + quotedstr(fech) +
    '' + ')';
  qQ.ExecSQL;
  // Actualizar la tabla de Articulos
  For i := 1 to High(mat[0]) do
  begin
    qQ.sql.Text := 'Update "Articulo" Set DISPONIBLE = DISPONIBLE - ' + mat[3, i]
      + ' Where ' + ' "Articulo".CODIGO = ' + (mat[0, i]);
    qQ.ExecSQL;
  end;
  // CONTABILIDAD+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // LIBRO IVA VENTAS
  if (let = 'A') or (let = 'B') then
    LibroIVAvta(fech, nro, cod, cui, floattostr(n10), floattostr(n21),
      floattostr(i10), floattostr(i21), floattostr(tot)); // en blanco
  // Insertar en la tabla LibroDiario
  LibroDiario('VENTA', nro, let, cod, fech, pgr, tot, pag, cheq, ch3q, cont,
    tarj, impu, deud, cmv, comv);
  // Completa la Transaccion
  BaseDatosFB.Commit;
  // IMPRIMIR
  if (dm.ConfigQuery.FieldByName('Imprimir').AsString) <> 'NO' then
  begin
    ImprimirDataModule := TImprimirDataModule.Create(self);
    // VTA
    with ImprimirDataModule do
    begin
      Impr(vta(nro, let), '');
      ImprimirDataModule.Free;
      // Planes
      ImprimirDataModule := TImprimirDataModule.Create(self);
      Impr(Contrato(nro, let), 'ContratoLeasing');
      ImprimirDataModule.Free;
      // Planilla de Cobrador
      ImprimirDataModule := TImprimirDataModule.Create(self);
      Impr(PlanillaCobrador(nro, ''), 'Carton');
      ImprimirDataModule.Free;
    end;
  end;
end;
end;

Procedure TOperacionDataModule.CtaCte;
var
  nro: integer;
  new: Boolean;
begin
with dm do begin
  new := false;
  // CONSULTAR SI YA TIENE CTACTE
  qQ.sql.Text := 'SELECT * FROM "CtaCte" WHERE ' + tipo + ' = ' + cod;
  qQ.Open;
  if qQ.RecordCount = 0 then
    new := True;
  // Insertar en la tabla de CtaCte
  if new = false then
    qQ.sql.Text := 'Update "CtaCte" Set SALDO = SALDO - ' + floattostr(pag) +
      ' Where ' + tipo + ' = ' + cod
  else
    qQ.sql.Text := 'Insert Into "CtaCte" (' + tipo + ', SALDO) Values (' + cod +
      ',' + floattostr(sald) + ')';
  qQ.ExecSQL;
  // Insertar en la tabla de CtaCte Item
  begin
    qQ.sql.Text := 'Insert Into "CtaCteItem" (' + tipo +
      ', DESCRIPCION, PAGADO) Values' + '( ' + cod + ',''Entrega de Dinero'',' +
      floattostr(pag) + ')';
    qQ.ExecSQL;
  end;
  // --CONTABILIDAD***************************************************************
  LibroDiario(tipo, '0', '', cod, fecha, false, 0, pag, cheq, ch3q, cont,
    tarj, 0, 0, 0, 0);
  // --CONTABILIDAD **************************************************************
  BaseDatosFB.Commit;
end;
end;

procedure TOperacionDataModule.fd(Sender: TObject);
begin
  dm.ConfigQuery.Open;
  Oculto := '0';
end;

Procedure TOperacionDataModule.LibroIVAvta; // Insertar en el Libro IVA Ventas
begin
with dm do begin
  qQ.sql.Text :=
    'Insert Into "LibroIVAventa" (FECHA, FACTURA, CLIENTE, CUIT, NG1, NG2, IVA1, IVA2, ITF) Values ( '
    + quotedstr(fec) + ', ' + quotedstr(nro) + ', ' + quotedstr(cli) + ', ' +
    quotedstr(cui) + ', ' + n10 + ', ' + n21 + ', ' + (i10) + ', ' + (i21) +
    ', ' + (tot) + ')';
  qQ.ExecSQL;
end;
end;

Procedure TOperacionDataModule.LibroIVACompra;
// Insertar en el Libro IVA COMPRAS
begin
with dm do begin
  qQ.sql.Text :=
    'Insert Into "LibroIVAcompra" (FECHA, FACTURA, PROVEEDOR, CUIT, '+
    ' NG1, NG2, NG3, IVA1, IVA2, IVA3,'+
    ' OEIIBB, IDERPYPAC, ITF) Values ( '
    + quotedstr(fec) + ', ' + quotedstr(nro) + ', ' + quotedstr(cli) + ', ' +quotedstr(com)
    + ', ' + n10 + ', ' + n21 + ', ' + n3 + ', ' + (i10) + ', ' + (i21)+ ', ' + (i3)
    + ', ' + per + ', ' + (ret) + ', ' + (tot) + ')';
  qQ.ExecSQL;
end;
end;

Procedure TOperacionDataModule.Asiento; // ASIENTO CONTABLE
begin
with dm do begin
  if fech = '' then
    fech := FormatDateTime('mm/dd/yyyy hh:mm:ss', now);
  if ctan='' then exit;
  qT.sql.Text := 'select * from "Cuenta" where "Cuenta".CODIGO=' + ctan;
  qT.open;
  qQ.sql.Text :=
    'Insert Into "LibroDiario" (ASIENTO, FECHA, LEYENDA, JERARQUIA, CUENTA, DEBE, HABER, OCULTO)'
    + ' Values ' + '( ' + (nro) + ', ' + quotedstr(fech) + ', ' + quotedstr(det)
    + ', ' + quotedstr(qT.FieldByName('Jerarquia').AsString) + ', ' +
    quotedstr(qT.FieldByName('DESCRIPCION').AsString) + ', ' + d + ', ' + h +
    ', ' + quotedstr(Oculto) + ' )';
  qQ.ExecSQL;
end;
end;

Procedure TOperacionDataModule.AnularVTA;
var
  let, cod, fech, ven, cui, cno, a, cli, asocNro, CbteAsoc: string;
  pre, pgr: Boolean;
  cost, com, impu, cheq, cont, tot, sbt, des, tarj, otr, sal, pag, int, n10, n21,
    i10, i21, deud, ulc, comv, exc: Double;
  aIva: Integer;
begin
with dm do begin
  DM.FormatearFecha;
  cod := inttostr(DM.UltimoRegistro('Operacion', 'CODIGO'));
  // Verificar que la factura Exista y que no este anulada
  qT.sql.Text := 'Select * From "Venta" Where CODIGO = ' + nro;
  qT.open;
  IF qT.RecordCount = 0 then
  begin
    MessageDlg(' no existe.', mtError, [mbOK], 0);
    qT.Close;
    Exit;
  end;
  if qT.FieldByName('ANULADA').AsString = 'S' then
  begin
    MessageDlg(' ya esta anulada.', mtError, [mbOK], 0);
    qT.Close;
    Exit;
  end;
  FormatSettings.ShortDateFormat := 'mm';
//  If (DateToStr(now) > DateToStr(qT.Fields[2].AsDateTime+1)) then
  If ((now-30) > (qT.Fields[2].AsDateTime)) then
  begin
    MessageDlg(' no se puede anular por ser de un periodo anterior', mtError,
      [mbOK], 0);
    qT.Close;
    Exit;
  end;
  if MessageDlg('Está seguro que desea anular la venta ' + nro + '?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    fech := FormatDateTime('mm/dd/yyyy hh:mm:ss', now);
    cli := qT.FieldByName('CLIENTE').AsString;
    ven := qT.FieldByName('VENDEDOR').AsString;
    if ven='' then ven:='0';
    let := qT.FieldByName('LETRA').AsString;
    asocNro := qT.FieldByName('COMPROBANTE').AsString;
    sal := qT.FieldByName('SALDO').AsFloat;
    cont := qT.FieldByName('CONTADO').AsFloat;
    pag := qT.FieldByName('PAGADO').AsFloat;
    tot := RoundTo(qT.FieldByName('TOTAL').AsFloat,-2);
    cheq := qT.FieldByName('CHEQUE').AsFloat;
    tarj := qT.FieldByName('TARJETA').AsFloat;
    impu := RoundTo(qT.FieldByName('IMPUESTO').AsFloat,-2);
    aIva := qT.FieldByName('ALICIVA').AsInteger;
    if (let='A') or (let='B') then
    begin
      i10 := RoundTo(DM.TraerValor2('AlicIva', 'IMPORTE', IntToStr(aIva), 'ID', '4'),-2);
//      if i10=0 then i10 := qT.FieldByName('IVA1').AsFloat;
      n10 := RoundTo(DM.TraerValor2('AlicIva', 'BASEIMP', IntToStr(aIva), 'ID', '4'),-2);
//      if n10=0 then n10 := qT.FieldByName('SUBTOTAL').AsFloat;
      i21 := RoundTo(DM.TraerValor2('AlicIva', 'IMPORTE', IntToStr(aIva), 'ID', '5'),-2);
//      if i21=0 then i21 := qT.FieldByName('IVA2').AsFloat;
      n21 := RoundTo(DM.TraerValor2('AlicIva', 'BASEIMP', IntToStr(aIva), 'ID', '5'),-2);
//    if n21=0 then n21 := qT.FieldByName('SUBTOTAL').AsFloat;
    end;

    LlenarMtIva(IntToStr(aIva));

    comv := qT.FieldByName('COSTO').AsFloat;
    deud := qT.FieldByName('DEUDA').AsFloat;
    com := qT.FieldByName('COMISION').AsFloat;
    des := qT.FieldByName('DESCUENTO').AsFloat;
    sbt := RoundTo(qT.FieldByName('SUBTOTAL').AsFloat,-2);
//    tot := qT.FieldByName('TOTAL').AsFloat;
    if qT.FieldByName('PAGARE').AsString = 's' then
      pgr := True;
    qT.Close;
    // +++TRAER CLIENTE
    qT.sql.Text := 'select * from "Cliente" where CODIGO=' + cli;
    qT.open;
    cno := qT.FieldByName('CTANOMBRE').AsString;
    cui := qT.FieldByName('CUIT').AsString;
    if cui='' then cui := qT.FieldByName('DOCUMENTO').AsString;
    if cui='' then cui := '20222222223';
    qT.Close;
    CbteAsoc := IntToStr(DM.UltimoRegistro('CbtesAsoc','CODIGO'));
    // ---
    // ---Nota de credito electronica
    with dm do begin
      if (reporte = 'FElectronica') or (reporte = 'TElectronica') then
      begin
        LeerINI;
        comp:=ObtenerNroComp('NC'+let);
        WSFE(
          fech, 'NC'+let, '1', '96', cui, comp, FloatToStr(sbt), FloatToStr(impu), floattostr(tot), let, asocNro
        //, FloatToStr(n10), FloatToStr(n21), FloatToStr(i10), FloatToStr(i21)
        , FloatToStr(exc));
        if cae = '' then Exit;//if mensaje <> 'Ok' then Exit;
        if comp<>'' then ActualizarNroComp('NC'+let,comp);
      end;
    end;
    // Marcar la Factura como anulada y poner los saldos en cero
    qQ.sql.Text := 'Update "Venta" set ANULADA = ''S'' where CODIGO = ' + nro;
    qQ.ExecSQL;
    //AlicuotaIVA
    aIva := InsertarAlicIva;
    // INSERTA EN LA TABLA OPERACION
    qQ.sql.Text :=
    'Insert Into "Operacion" (COMPROBANTE, TERMINOS, CODIGO, TIPO, LETRA'+
    ', CLIENTE, VENDEDOR, SUBTOTAL' +
    ', DESCUENTO, FECHA, IMPUESTO, TOTAL, CONTADO, CHEQUE,' +
    ' TARJETA, OTROS, SALDO, PAGADO, PAGARE, COSTO, DEUDA, COMISION, DESCRIPCION' +
    ', CBTESASOC, ALICIVA'+
    ') Values ' + '(' +QuotedStr(comp)+ ', ' + quotedstr(vto) + ', ' + (cod) + ', ' + quotedstr('NC'+let) + ', ' + quotedstr(let) +
    ', ' + cli + ', ' + ven + ', ' + ' ' + floattostr(sbt) + ', ' +
    floattostr(des) + ', ' + quotedstr(fech) + ', ' + floattostr(impu) + ', ' +
    floattostr(tot) + ', ' + floattostr(cont) + ', ' + floattostr(cheq) + ', ' +
    floattostr(tarj) + ', ' + floattostr(otr) + ', ' + floattostr(sal) + ', ' +
    floattostr(pag) + ',' + quotedstr(pagare) + ',' + floattostr(cmv) + ',' +
    floattostr(deud) + ',' + floattostr(comv) + ',' + QuotedStr(cae) + ','
    + (CbteAsoc)+', '+IntToStr(aIva)+')';
    qQ.ExecSQL;
  // Insertar en la tabla de OPERACIONITEM
    qT.sql.Text := 'Select * From "VentaItem" Where CODIGO = ' + nro;
    qT.open;
    qT.First;
    while not qT.Eof do
    begin
      qQ.sql.Text :=
        'Insert Into "OperacionItem" (OPERACION, ARTICULO, CANTIDAD'+
        ', PRECIO, IMPUESTO, SERVICIO, DESCRIPCION) Values'
        + ' ( ' + cod + ', ' + qT.FieldByName('ARTICULO').AsString + ', ' + qT.FieldByName('CANTIDAD').AsString
        + ',' + qT.FieldByName('PRECIO').AsString + ', ' + qT.FieldByName('IMPUESTO').AsString + ', ' + nro + ', ' +
        QuotedStr(qT.FieldByName('DESCRIPCION').AsString) + ');';
      qQ.ExecSQL;
      // Actualizar la tabla de Articulos
      ActualizarCantidadArticulo(qT.FieldByName('ARTICULO').AsString, '+ '+qT.FieldByName('CANTIDAD').AsString);
      qT.Next;
    end;
    //
    qQ.sql.Text :=
      'Insert Into "CbtesAsoc" ('
      +' CODIGO, TIPO, PTOVTA, NRO, CUIT, CBTEFCH'
      +' ) Values'
      +' ('+CbteAsoc+', '+dm.TraerTipoCbte(let)+', '+PuntoVenta+', '+QuotedStr(asocNro)+', '
      +QuotedStr(cui)+', '+QuotedStr(fech)
      +')';
    qQ.ExecSQL;
    // Borrar los Items de la factura de la tabla "VentaItem"
//    qQ.sql.Text := 'DELETE FROM "VentaItem" WHERE "VentaItem".OPERACION=' + nro;
//    qQ.ExecSQL;
    // Borrar los Items de la factura de la tabla "CtaCteItem"
    qQ.sql.Text :=
      'DELETE FROM "CtaCteItem" WHERE "CtaCteItem".OPERACION=' + nro;
    qQ.ExecSQL;
    // ACTUALIZAR SALDOS
    qQ.sql.Text := 'Update "CtaCte" Set SALDO = SALDO - ' + floattostr(sal) +
      ' Where CLIENTE = ' + cli;
    qQ.ExecSQL;

    // CONTABILIDAD+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // LIBRO IVA VENTAS
    if (let = 'A') or (let = 'B') then//  if let <> 'X' then
    LibroIVAvta(fech, nro, cod, cui, floattostr(-n10), floattostr(-n21),
      floattostr(-i10), floattostr(-i21), floattostr(-tot)); // en blanco
    // en blanco
    // Insertar en la tabla LibroDiario
    a := inttostr(DM.UltimoRegistro('LibroDiario', 'ASIENTO')); // GENERAR INDICE

    // ------------------------------------------------------------------------------
    // VENTAS
    Asiento(dm.ConfigQuery.FieldByName('CtaVenta').AsString, a, fech,
      (nro + ' - ' + let + ' - ' + cod), floattostr(tot), '0');
    // renglon  - VENTAS
    // si es factura A
    if let = 'A' then
      Asiento(dm.ConfigQuery.FieldByName('CtaIVADebitoFiscal').AsString, a, fech,
        (nro + ' - ' + let + ' - ' + cod), floattostr(impu), '0');
    // renglon  - IVA DEBITO FISCAL
    // PAGO DE CUENTA CORRIENTE
    if ((pag) > (tot - deud)) then
      Asiento(cno, a, fech, (nro + ' - ' + let + ' - ' + cod + ' - ' + cui),
        floattostr(pag - (tot - deud)), '0'); // renglon  - DEUDORES POR VENTA
    // a
    // PAGO CON
    // CAJA (EFECTIVO)
    if (cont) > 0.04 then
      Asiento(dm.ConfigQuery.FieldByName('CtaCaja').AsString, a, fech,
        (nro + ' - ' + let + ' - ' + cod), '0', floattostr(pag));
    // DSXVTA (CUENTA CORRIENTE)
    if (sal > 0.04) AND (pgr <> True) then
      Asiento(cno, a, fech, (nro + ' - ' + let + ' - ' + cod), '0',
        floattostr(sal));
    // DOC A COBRAR (CON DOCUMENTOS (PAGARE))
    if (pag < tot) AND (pgr = True) then
      Asiento(dm.ConfigQuery.FieldByName('CtaDocumentoACobrar').AsString, a,
        fech, (nro + ' - ' + let + ' - ' + cod), floattostr(sal), '0');
    // VALOR AL COBRO (PAGO CON CHEQUE)
    if (cheq) > 0.04 then
      Asiento(dm.ConfigQuery.FieldByName('CtaValorAlCobro').AsString, a, fech,
        (nro + ' - ' + let + ' - ' + cod), '0', floattostr(cheq));
    // -----------------------------------1------------------------------------------
    // MERCADERIAS DE REVENTA
    Asiento(dm.ConfigQuery.FieldByName('CtaMercaderia').AsString, a, fech,
      (nro + ' - ' + let + ' - ' + cod), floattostr(cmv), '0');
    // a
    // CMV
    Asiento(dm.ConfigQuery.FieldByName('CtaCMV').AsString, a, fech,
      (nro + ' - ' + let + ' - ' + cod), '0', floattostr(cmv));
    // -----------------------------------2------------------------------------------
    if com > 0 then
    begin
      // COMISION VENDEDOR A PAGAR
      Asiento(dm.ConfigQuery.FieldByName('CtaComisionVendedorAPagar').AsString,
        a, fech, (nro + ' - ' + let + ' - ' + cod), floattostr(com), '0');
      // a
      // COMISION VENDEDOR
      Asiento(dm.ConfigQuery.FieldByName('CtaComisionVendedor').AsString, a,
        fech, (nro + ' - ' + let + ' - ' + cod), '0', floattostr(com));
    end;
    // -----------------------------------3------------------------------------------
    // CONTABILIDAD---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    BaseDatosFB.Commit;
    // IMPRIMIR
    if (dm.ConfigQuery.FieldByName('Imprimir').AsString) <> 'NO' then
    begin
      ImprimirDataModule := TImprimirDataModule.Create(self);
      if reporte = 'FElectronica' then reporte:='NCElectronica'
      else
        if reporte = 'TElectronica' then reporte:='NCTElectronica'
        else
          if reporte = 'CTicket' then reporte:='NCTicket'
          else
            if reporte = 'COriginal' then reporte:='CNCredito';
      with ImprimirDataModule do
        Impr(oper(cod, 'NC'+let, let), 'NC'+let);//reporte);
      ImprimirDataModule.Free;
    end;
  end;
end;
end;

Procedure TOperacionDataModule.ProcPresup; // PROCESA UN PRESUPUESTO
var
  nro, a: string;
  i, aIva: integer;
  IIBB, cmv: Double;
begin
with dm do begin
  BaseDatosFB.StartTransaction;
  nro := inttostr(DM.UltimoRegistro('Presupuesto', 'CODIGO'));
  //AlicuotaIVA
  aIva := InsertarAlicIva;
  // INSERTA EN LA TABLA PRESUPUESTO
  qQ.sql.Text := 'Insert Into "Presupuesto" (CODIGO, LETRA, CLIENTE, ' +
    ' SUBTOTAL, DESCUENTO, FECHA,' + ' IMPUESTO, TOTAL, CONTADO, CHEQUE,' +
    ' TARJETA, OTROS, SALDO, PAGADO, ALICIVA, ENVIO, NOTAS) Values ' + '( ' + (nro) + ', ' +
    quotedstr(let) + ', ' + cod + ', ' + ' ' + floattostr(sbt) + ', ' +
    floattostr(des) + ', ' + quotedstr(fec) + ', ' + floattostr(impu) + ', ' +
    floattostr(tot) + ', ' + floattostr(cont) + ', ' + floattostr(che) + ', ' +
    floattostr(tarj) + ', ' + floattostr(otr) + ', ' + floattostr(sal) + ', ' +
    floattostr(pag)+', '+IntToStr(aIva)+', '+floattostr(env)+ ', ' + quotedstr(notas)+')';
  qQ.ExecSQL;
  // Insertar en la tabla de PRESUPUESTOITEM
  for i := 1 to High(mat[0]) do
  begin
    // CALCULAR IIBB
//    qQ.sql.Text := 'SELECT * FROM "IIBB" WHERE CODIGO=' + quotedstr(mat[9, i]);
//    qQ.Open;
//    if tot - impu > qQ.FieldByName('MONTO').AsFloat then
//      IIBB := (tot - impu) * (qQ.FieldByName('COEF1').AsFloat *
//        qQ.FieldByName('COEF2').AsFloat * qQ.FieldByName('PORCENTAJE').AsFloat);
    qQ.sql.Text :=
      'Insert Into "PresupuestoItem" (OPERACION, ARTICULO, CANTIDAD, COSTO, PRECIO, IMPUESTO, SERVICIO, DESCRIPCION) Values'
      + ' ( ' + nro + ', ' + (mat[0, i]) + ', ' + (mat[3, i]) + ', ' +(mat[7, i])+', '+
      (mat[4, i]) + ', ' + mat[6, i] + ', ' + nro + ', ' +
      quotedstr(mat[1, i]) + ');';
    qQ.ExecSQL;
  end;
  // Completa la Transaccion
  BaseDatosFB.Commit;
  // IMPRIMIR
  if (dm.ConfigQuery.FieldByName('Imprimir').AsString) <> 'NO' then
  begin
    ImprimirDataModule := TImprimirDataModule.Create(self);
    ImprimirDataModule.Impr(ImprimirDataModule.pre(nro, let), 'P'+let);//'Presupuesto');
    ImprimirDataModule.Free;
  end;
end;
end;

function TOperacionDataModule.ProcVTA; // PROCESA UNA VENTA
var
  nro:string;
  i, aIva : Integer;
//  nro, comp, a, pagare, cae, vto, mensaje, ptovta, tipocbte: string;
  cmv: Double;
//  jsResponse: TJSONValue;
  ctaCte : boolean;
begin
  with dm do
  begin
    BaseDatosFB.StartTransaction;
    //  if webUpd='True' then RestDataModule := TRestDataModule.Create(self);
    DM.FormatearFecha;
    pagare := '0';
    nro := IntToStr(DM.UltimoRegistro('Venta', 'CODIGO'));
    comp:=dm.ObtenerNroComp(let);
    if pgr then
      pagare := 'S';
    cmv := CostMercVend(ulc, cost);
   // CALCULAR IIBB
    qQ.sql.Text := 'SELECT * FROM "IIBB" WHERE CODIGO=' + IngresosBrutos;
    qQ.Open;
    //  if tot - impu > qQ.FieldByName('MONTO').AsFloat then
    //    IIBB := (tot - impu) * (qQ.FieldByName('COEF1').AsFloat *
    //      qQ.FieldByName('COEF2').AsFloat * qQ.FieldByName('PORCENTAJE').AsFloat);
    if let = 'C' then
      begin
  //      tipocbte:='11';
        IIBB := tot * (qQ.FieldByName('PORCENTAJE').AsFloat/100)
      end
    else
      IIBB := (tot - impu) * (qQ.FieldByName('PORCENTAJE').AsFloat/100);
    //AlicuotaIVA
    aIva := InsertarAlicIva;
    //Factura electronica
    if (reporte = 'FElectronica') or (reporte = 'TElectronica') then
    begin
      WSFE(fech, let, '1', '99', cui, comp,  FloatToStr(sbt), FloatToStr(impu),
       FloatToStr(tot), '0', '0',
  //     FloatToStr(n10), FloatToStr(n21), FloatToStr(i10), FloatToStr(i21),
       FloatToStr(exc));
      if cae = '' then exit;
    end;
    //actualiza el nro de factura
    if comp<>'' then dm.ActualizarNroComp(let,comp);
    // INSERTA EN LA TABLA VENTA
    qQ.SQL.Text := 'Insert Into "Venta" (COMPROBANTE, TERMINOS, CODIGO, LETRA, CLIENTE,' +
      ' SUBTOTAL, DESCUENTO, FECHA,'+
      ' IMPUESTO, IVA1, IVA2,'+
      ' IIBB, TOTAL, CONTADO, CHEQUE,' +
      ' TARJETA, OTROS, SALDO,'+
      ' PAGADO, PAGARE, COSTO,'+
      ' DEUDA, COMISION, DESCRIPCION,'+
      ' ALICIVA, ENVIO, NOTAS'+
      ') Values ('+
      QuotedStr(comp)+', '+QuotedStr(vto)+', '+(nro)+', '+QuotedStr(let)+', '+cod+', '+
      floattostr(sbt)+', '+floattostr(des)+', '+QuotedStr(fech)+', '+
      floattostr(impu)+', '+floattostr(i10)+', '+floattostr(i21)+', '+
      floattostr(IIBB)+', '+floattostr(tot)+', '+floattostr(cont)+', '+floattostr(cheq)+', '+
      floattostr(tarj)+', '+floattostr(otr)+', '+floattostr(sal)+', '+
      floattostr(pag)+', '+QuotedStr(pagare)+', '+floattostr(cmv)+', '+
      floattostr(deud)+', '+floattostr(comv)+', '+QuotedStr(cae)+', '+
      IntToStr(aIva)+', '+floattostr(env)+ ', ' + quotedstr(notas) +
      ')';
    qQ.ExecSQL;
    // Insertar en la tabla de VENTAITEM
    if mat <> nil then
      for i := 1 to High(mat[0]) do
      begin
        // CALCULAR IIBB
    //    qQ.sql.Text := 'SELECT * FROM "IIBB" WHERE CODIGO=' + quotedstr(mat[9, i]);
    //    qQ.Open;
    //    if tot - impu > qQ.FieldByName('MONTO').AsFloat then
    //      IIBB := (tot - impu) * (qQ.FieldByName('COEF1').AsFloat *
    //        qQ.FieldByName('COEF2').AsFloat * qQ.FieldByName('PORCENTAJE').AsFloat);
        if (mat[1, i]= 'Deuda CtaCte') then
          ctaCte := True;
        qQ.SQL.Text :=
          'Insert Into "VentaItem" (OPERACION, ARTICULO, CANTIDAD, '+
          'COSTO, PRECIO, IMPUESTO, SERVICIO, DESCRIPCION) Values'
          +' ( ' +(nro)+ ', ' + (mat[0, i]) + ', ' + (mat[3, i]) + ', ' +
          (mat[7, i]) + ', ' +(mat[4, i]) + ', ' + mat[6, i] + ', ' + (nro) + ', ' +
          quotedstr(mat[1, i]) + ');';
        qQ.ExecSQL;
      end;

    if ctaCte then
    begin
      qQ.SQL.Text := 'Update "CtaCte" Set SALDO = ' + floattostr(sal) +
          ', FECHA = ' + quotedstr(fech) + ' Where CLIENTE = ' + cod;
      qQ.ExecSQL;
    end;

    // Insertar en la tabla de CtaCte
    if (sal > 0.05) then
    begin
      qQ.SQL.Text := 'SELECT * FROM "CtaCte" WHERE CLIENTE = ' + cod;
      qQ.Open;
      if (qQ.RecordCount > 0) and (sal < 0.05) then
        qQ.SQL.Text := 'Update "CtaCte" Set SALDO = ' + floattostr(sal) +
          ', FECHA = ' + quotedstr(fech) + ' Where CLIENTE = ' + cod
      else
        qQ.SQL.Text := 'Insert Into "CtaCte" (CLIENTE, SALDO, OPERACION,' +
          ' DESCUENTO, INTERES, FECHA, RENDIDAS) Values (' + cod + ', ' +
          floattostr(sal) + ', ' + (nro) + ', ' + floattostr(des) + ', ' +
          floattostr(int) + ', ' + quotedstr(fech) + ', 0' + ')';
        qQ.ExecSQL;
      // Insertar en la tabla de CtaCte Item
      if sal > 0.04 then
      begin
        For i := 1 to High(mat[0]) do
        begin
          if mat[0, i] <> '1' then
            detalle := mat[1, i]
          else
            detalle := memo;
          qQ.sql.Text := 'Insert Into "CtaCteItem" (OPERACION, CLIENTE,' +
            ' DESCRIPCION, IMPORTE, ' + ' PAGADO) Values ' + '( '+(nro)+',' +
            cod + ', ' + quotedstr(detalle) + ',' + (mat[5, i]) + ', 0)';
          qQ.ExecSQL;
        end;
      end;
    end;
  // Insertar en RendidoVendedor
  if ven <> '' then
  begin
    comv := round(tot * (comv / 100));
    if comv = 0 then
      comv := 0;
    qQ.sql.Text :=
      'Insert Into "RendidoVendedor" (VENDEDOR, VENTA, IMPORTE, FECHA) Values' +
      ' (' + quotedstr(ven) + ', '+(nro)+', ' + Format('%8.2f', [comv]) + ', '
      + quotedstr(fech) + ')';
    qQ.ExecSQL;
  end;
  // Actualizar la tabla de Articulos
  if mat <> nil then
    for i := 1 to High(mat[0]) do
    begin
      ActualizarCantidadArticulo(mat[0, i], '- '+mat[3, i])
  //    qQ.sql.Text := 'Update "Articulo" Set DISPONIBLE = DISPONIBLE - ' + mat[3, i]
  //      + ' Where "Articulo".CODIGO = ' + (mat[0, i]);
  //    qQ.ExecSQL;
    end;
  // CONTABILIDAD+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // LIBRO IVA VENTAS
  if (let = 'A') or (let = 'B') then//  if let <> 'X' then
    LibroIVAvta(fech, (nro), cod, cui, floattostr(n10), floattostr(n21),
      floattostr(i10), floattostr(i21), floattostr(tot));
  // Insertar en la tabla LibroDiario
  LibroDiario('VENTA', (nro), let, cod, fech, pgr, tot, pag, cheq, ch3q, cont,
    tarj, impu, deud, cmv, comv);
  //Retenciones y Percepciones
  dm.AgregarRetPer('VENTA',StrToInt(nro),noGra,pagCueIva,pagCueOtr,perIIBB,perImpMun,impInt,otrTrib);
  // Completa la Transaccion
  BaseDatosFB.Commit;
//  if webUpd='True' then RestDataModule.CrearOrden;
  // IMPRIMIR
  if impr then
  begin
    ImprimirDataModule := TImprimirDataModule.Create(self);
    with ImprimirDataModule do
      Impr(vta((nro), let), let);
    ImprimirDataModule.Free;
  end;
  result := true;
  end;
end;
// PROCESA UNA OPERACION
Procedure TOperacionDataModule.ProcOPER;
var
  a, pagare, rpt: string;
  nro, i, aiva: integer;
  IIBB, cmv: Double;
begin
with dm do begin
  rpt := tipo+let;
//  let := StringReplace(let, 'X', '', [rfReplaceAll]);
  BaseDatosFB.StartTransaction;
  pagare := '0';
  nro := (DM.UltimoRegistro('Operacion', 'CODIGO'));
//  if nro = '1' then nro := inttostr(dm.ConfigQuery.FieldByName('NroFactura').AsInteger + 1);
  if pgr then
    pagare := 'S';
  cmv := CostMercVend(ulc, cost);
  //AlicuotaIVA
  aIva := InsertarAlicIva;
  // INSERTA EN LA TABLA OPERACION
  qQ.sql.Text :=
    'Insert Into "Operacion" (CODIGO, TIPO, LETRA, CLIENTE, VENDEDOR' +
    ', SUBTOTAL, DESCUENTO, FECHA,' +
    ' IMPUESTO, IVA1, IVA2,'+
    ' TOTAL, CONTADO, CHEQUE' +
    ', TARJETA, OTROS, SALDO, PAGADO, PAGARE, COSTO'+
    ', DEUDA, COMISION, ALICIVA, ENVIO, NOTAS'+
    ') Values ' + '(' + IntToStr(nro) + ', ' + quotedstr(tipo) + ', ' +
    quotedstr(let) + ', ' + cod + ', ' + ven + ', ' + ' ' +
    floattostr(sbt) + ', ' +floattostr(des) + ', ' + quotedstr(fech) + ', ' +
    floattostr(impu)+', '+floattostr(i10)+', '+floattostr(i21)+', '+
    floattostr(tot) + ', ' + floattostr(cont) + ', ' + floattostr(cheq) + ', ' +
    floattostr(tarj) + ', ' + floattostr(otr) + ', ' + floattostr(sal) + ', ' +
    floattostr(pag) + ',' + quotedstr(pagare) + ',' + floattostr(cmv) + ',' +
    floattostr(deud) + ',' + floattostr(comv)+', '+IntToStr(aIva)+', '+floattostr(env)+ ', ' + quotedstr(notas)+')';
  qQ.ExecSQL;
  // Insertar en la tabla de OPERACIONITEM
  for i := 1 to High(mat[0]) do
  begin
    qQ.sql.Text :=
      'Insert Into "OperacionItem" (OPERACION, ARTICULO, CANTIDAD, COSTO'+
      ', PRECIO, IMPUESTO, SERVICIO, DESCRIPCION) Values'
      + ' ( ' + IntToStr(nro) + ', ' + (mat[0, i]) + ', ' + (mat[3, i])+', '+(mat[7, i])+', '+
      (mat[4, i]) + ', ' + mat[6, i] + ', ' + IntToStr(nro) + ', ' +
      quotedstr(mat[1, i]) + ');';
    qQ.ExecSQL;
  end;
  // Insertar en la tabla de CtaCte
  if (sal > 0.05) then
  begin
    qQ.sql.Text := 'SELECT * FROM "CtaCte" WHERE CLIENTE = ' + cod;
    qQ.Open;
    if (qQ.RecordCount > 0) and (sal < 0.05) then
      qQ.sql.Text := 'Update "CtaCte" Set SALDO = ' + floattostr(sal) +
        ', FECHA = ' + quotedstr(fech) + ' Where CLIENTE = ' + cod
    else
      qQ.sql.Text := 'Insert Into "CtaCte" (CLIENTE, SALDO, OPERACION,' +
        ' DESCUENTO, INTERES, FECHA, RENDIDAS) Values (' + cod + ', ' +
        floattostr(sal) + ', ' + IntToStr(nro) + ', ' + floattostr(des) + ', ' +
        floattostr(int) + ', ' + quotedstr(fech) + ', 0' + ')';
    qQ.ExecSQL;
    // Insertar en la tabla de CtaCte Item
    if sal > 0.04 then
    begin
      For i := 1 to High(mat[0]) do
      begin
        if mat[0, i] <> '1' then
          detalle := mat[1, i]
        else
          detalle := memo;
        qQ.sql.Text := 'Insert Into "CtaCteItem" (OPERACION, CLIENTE,' +
          ' DESCRIPCION, IMPORTE, ' + ' PAGADO) Values ' + '( ' + IntToStr(nro) + ',' +
          cod + ', ' + quotedstr(detalle) + ',' + (mat[5, i]) + ', 0)';
        qQ.ExecSQL;
      end;
    end;
  end;
  // Insertar en RendidoVendedor
  if ven <> '' then
  begin
    comv := round(tot * (comv / 100));
    if comv = 0 then
      comv := 0;
    qQ.sql.Text :=
      'Insert Into "RendidoVendedor" (VENDEDOR, VENTA, IMPORTE, FECHA) Values' +
      ' (' + quotedstr(ven) + ', ' + IntToStr(nro) + ', ' + Format('%8.2f', [comv]) + ', '
      + quotedstr(fech) + ')';
    qQ.ExecSQL;
  end;
  // Actualizar la tabla de Articulos
  For i := 1 to High(mat[0]) do
  begin
    qQ.sql.Text := 'Update "Articulo" Set DISPONIBLE = DISPONIBLE - ' + mat[3, i]
      + ' Where ' + ' "Articulo".CODIGO = ' + (mat[0, i]);
    qQ.ExecSQL;
  end;
  // CONTABILIDAD+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // LIBRO IVA VENTAS
  if ((tipo<>'PED') and ((let = 'A') or (let = 'B'))) then
  begin
    LibroIVAvta(fech, IntToStr(nro), cod, cui, floattostr(n10), floattostr(n21),
      floattostr(i10), floattostr(i21), floattostr(tot)); // en blanco
    AgregarRetPer(tipo,nro,noGra,pagCueIva,pagCueOtr,perIIBB,perImpMun,impInt,otrTrib);
  end;
  // Insertar en la tabla LibroDiario
  LibroDiario(tipo, IntToStr(nro), let, cod, fech, pgr, tot, pag, cheq, ch3q, cont,
    tarj, impu, deud, cmv, comv);
  // Completa la Transaccion
  BaseDatosFB.Commit;
  // IMPRIMIR
  if impr then
  begin
    ImprimirDataModule := TImprimirDataModule.Create(self);
    with ImprimirDataModule do
      Impr(oper(IntToStr(nro), tipo, let), rpt);
    ImprimirDataModule.Free;
  end;
end;
end;

Procedure TOperacionDataModule.ProcCompra; // PROCESA UNA COMPRA
var
  nro, a, pultc: string;
   i, aIva: integer;
  IIBB, cmv, ret, per: Double;
begin
with dm do begin
  BaseDatosFB.StartTransaction;
  cmv := 0;
  nro := IntToStr(DM.UltimoRegistro('Compra', 'CODIGO'));
  per := noGra+perIIBB+perImpMun+impInt+otrTrib;
  ret := pagCueIva+pagCueOtr;
  //AlicuotaIVA
  aIva := InsertarAlicIva;
  // INSERTA EN LA TABLA COMPRA
  qQ.sql.Text := 'Insert Into "Compra" (CODIGO, LETRA, PROVEEDOR, ' +
    ' SUBTOTAL, DESCUENTO, FECHA,' +
    ' IMPUESTO, TOTAL, CONTADO, CHEQUE,' +
    ' TARJETA, OTROS, SALDO, '+
    ' PAGADO, COMPROBANTE, ALICIVA'+
    ', TERMINOS, IIBB, MINIMP, NOTAS'+
    ') Values (' +
    (nro) + ', ' + quotedstr(let) + ', ' + cod + ', ' + ' ' + floattostr(sbt) + ', ' +
    floattostr(des) + ', ' + quotedstr(fech) + ', ' + floattostr(impu) + ', ' +
    floattostr(tot) + ', ' + floattostr(cont) + ', ' + floattostr(cheq) + ', ' +
    floattostr(tarj) + ', ' + floattostr(otr) + ', ' + floattostr(sal) + ', ' +
    floattostr(pag) + ', ' + quotedstr(com) +', '+IntToStr(aIva)
    + ', ' +pvta+ ', ' +FloatToStr(per)+ ', ' +FloatToStr(ret)+ ', ' + quotedstr(notas)
  + ')';
  qQ.ExecSQL;
  // Insertar en la tabla de COMPRAITEM
  for i := 1 to High(mat[0]) do
  begin
    qQ.sql.Text :=
      'Insert Into "CompraItem" (OPERACION, ARTICULO, CANTIDAD, COSTO'+
      ',PRECIO, IMPUESTO, SERVICIO, DESCRIPCION) Values'
      + ' ( ' + (nro) + ', ' + (mat[0, i]) + ', ' + (mat[3, i]) + ', ' +(mat[7, i])+', '+
      (mat[4, i]) + ', ' + mat[6, i] + ', ' + nro + ', ' + quotedstr(mat[1, i]) +
      ');';
    qQ.ExecSQL;
  end;
  // Insertar en la tabla de CtaCte
  if (sal > 0.04) then
  begin
    qQ.sql.Text := 'SELECT * FROM "CtaCte" WHERE PROVEEDOR = ' + cod;
    qQ.Open;
    if (qQ.RecordCount > 0) and (sal < 0.05) then
      qQ.sql.Text := 'Update "CtaCte" Set SALDO = ' + floattostr(sal) +
        ', FECHA = ' + quotedstr(fech) + ' Where PROVEEDOR = ' + cod
    else
      qQ.sql.Text := 'Insert Into "CtaCte" (PROVEEDOR, SALDO, OPERACION,' +
        ' DESCUENTO, FECHA) Values (' + cod + ', ' + floattostr(sal) + ', ' +
        (nro) + ', ' + floattostr(des) + ', ' + // FloatToStr(inte)+', '+
        quotedstr(fech) + // ', 0'+
        ')';
    qQ.ExecSQL;
    // Insertar en la tabla de CtaCte Item
    if sal > 0.04 then
    begin
      For i := 1 to High(mat[0]) do
      begin
        if mat[0, i] <> '1' then
          detalle := mat[1, i]
        else
          detalle := memo;
        qQ.sql.Text := 'Insert Into "CtaCteItem" (OPERACION, PROVEEDOR,' +
          ' DESCRIPCION, IMPORTE, ' + ' PAGADO) Values ' + '( ' + (nro) + ',' +
          cod + ', ' + quotedstr(detalle) + ',' + (mat[5, i]) + ', 0)';
        qQ.ExecSQL;
      end;
    end;
  end;
  // Actualizar la tabla de Articulos
  For i := 1 to High(mat[0]) do
  begin
    VarCos(mat[0, i], mat[3, i], strtofloat(mat[4, i]));
  end;
  // CONTABILIDAD+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // LIBRO IVA COMPRAS
  if let = 'A' then//  if let <> 'X' then
    LibroIVACompra(fech, nro, cod, cui, floattostr(n10), floattostr(n21), floattostr(n3),
      floattostr(i10), floattostr(i21), floattostr(i3),
      floattostr(per), floattostr(ret), floattostr(tot)
    ); // en blanco
  // Insertar en la tabla LibroDiario
  a := inttostr(DM.UltimoRegistro('LibroDiario', 'ASIENTO')); // GENERAR INDICE
  LibroDiario('COMPRA', nro, let, cod, fech, pgr, tot, pag, cheq, ch3q, cont,
    tarj, impu, deud, cmv, 0);
  //Retenciones y Percepciones
  dm.AgregarRetPer('COMPRA',StrToInt(nro),noGra,pagCueIva,pagCueOtr,perIIBB,perImpMun,impInt,otrTrib);
  // Completa la Transaccion
//  BaseDatosFB.Commit;
BaseDatosFB.Commit;
end;
end;

Procedure TOperacionDataModule.LibroDiario;
var
  ctan, ctaan, cui, a, tabl: string;
  sal: Double;
begin
with dm do begin
  sal := tot - pag;
  a := floattostr(DM.UltimoRegistro('LibroDiario', 'ASIENTO'));
  if (oper = 'CLIENTE') or (oper = 'VENTA') or (oper = 'PED') then
    tabl := 'Cliente'
  else if (oper = 'PROVEEDOR') or (oper = 'COMPRA') then
    tabl := 'Proveedor'
  else if (oper = 'RETIRO CAJA') or (oper = 'SOCIO') then
    tabl := 'Socio';

  qT.sql.Text := 'SELECT * FROM "' + tabl + '" WHERE CODIGO=' + cod;
  qT.open;
  ctan := qT.FieldByName('CTANOMBRE').AsString;
  ctaan := qT.FieldByName('CTAANTICIPO').AsString;
  cui := qT.FieldByName('CUIT').AsString;
  qT.Close;
  // SI ES COMPRA
  if oper = 'COMPRA' then
  begin
    // renglon  - MERCADERIAS DE REVENTA
    Asiento(dm.ConfigQuery.FieldByName('CtaMercaderia').AsString, a, fech,
      (oper + ' - ' + let + ' - ' + cod + ' - ' + cui), floattostr(tot), '0');
    // si es factura A
    if let = 'A' then
    begin
      Asiento(dm.ConfigQuery.FieldByName('CtaIVACreditoFiscal').AsString, a,
        fech, (oper + ' - ' + let + ' - ' + cod + ' - ' + cui),
        floattostr(impu), '0'); // renglon  - IVA DEBITO FISCAL
      tot := tot - impu;
    end;
    // renglon  - PROVEEDOR
    if (pag < tot) AND (pgr <> True) then
      Asiento(ctan, a, fech, (oper + ' n ' + nro + ' - ' + let + ' - ' + cod +
        ' - ' + cui), '0', floattostr(sal)); // DSXVTA
    // renglon  - OBLIGACIONES A PAGAR
    if (pag < tot) AND (pgr = True) then
      Asiento(dm.ConfigQuery.FieldByName('CtaObligacionAPagar').AsString, a,
        fech, (oper + ' - ' + let + ' - ' + cod), '0', floattostr(sal));
    // renglon  - ANTICIPO A PROVEEDORES
    if sal < 0 then
      Asiento(ctaan, a, fech, (oper + ' n ' + nro + ' - ' + let + ' - ' + cod +
        ' - ' + cui), floattostr(sal), '0'); // DSXVTA
    // VALOR AL COBRO (PAGO CON CHEQUE3ros)
    if (ch3q) > 0.04 then
      Asiento(dm.ConfigQuery.FieldByName('CtaValorAlCobro').AsString, a, fech,
        (oper + ' - ' + let + ' - ' + cod), '0', floattostr(ch3q));
    // renglon  - BANCO XX CUENTA CORRIENTE //PAGO CON CHEQUE PROPIO
    if (cheq) > 0.04 then
      Asiento(dm.ConfigQuery.FieldByName('CtaBanco').AsString, a, fech,
        (oper + ' - ' + let + ' - ' + cod), '0', floattostr(cheq));
    // renglon  - CAJA //PAGO CON EFECTIVO
    if cont > 0.04 then
      Asiento(dm.ConfigQuery.FieldByName('CtaCaja').AsString, a, fech,
        (oper + ' - ' + let + ' - ' + cod), '0', floattostr(cont));
    Exit;
  end
  else // SI ES DEUDA A PROVEEDORES
    if oper = 'PROVEEDOR' then
    begin
      // PAGO CON
      // CAJA (EFECTIVO)
      if (cont) > 0.04 then
        Asiento(dm.ConfigQuery.FieldByName('CtaCaja').AsString, a, fech,
          (oper + ' - ' + let + ' - ' + cod), floattostr(pag), '0');
      // DSXVTA (CUENTA CORRIENTE)
      if (sal > 0.04) AND (pgr <> True) then
        Asiento(ctan, a, fech, (oper + ' - ' + let + ' - ' + cod),
          floattostr(sal), '0');
      // DOC A COBRAR (CON DOCUMENTOS (PAGARE))
      if (pag < tot) AND (pgr = True) then
        Asiento(dm.ConfigQuery.FieldByName('CtaDocumentoACobrar').AsString, a,
          fech, (oper + ' - ' + let + ' - ' + cod), '0', floattostr(sal));
      // VALOR AL COBRO (PAGO CON CHEQUE)
      if (cheq) > 0.04 then
        Asiento(dm.ConfigQuery.FieldByName('CtaValorAlCobro').AsString, a, fech,
          (oper + ' - ' + let + ' - ' + cod), floattostr(cheq), '0');
      // a
      // PAGO DE CUENTA CORRIENTE
      if ((pag) > (tot - deud)) then
        Asiento(ctan, a, fech, (oper + ' - ' + let + ' - ' + cod + ' - ' + cui),
          '0', floattostr(pag - (tot - deud))); // renglon  - DEUDORES POR VENTA
      Exit;
    end
    else // SI ES CTACTE DE CLIENTES
      if oper = 'CLIENTE' then
      begin
        // PAGO DE CUENTA CORRIENTE
        if ((pag) > (tot - deud)) then
          Asiento(ctan, a, fech, (oper + ' - ' + let + ' - ' + cod + ' - ' +
            cui), floattostr(pag - (tot - deud)), '0');
        // renglon  - DEUDORES POR VENTA
        // a
        // PAGO CON
        // CAJA (EFECTIVO)
        if (cont) > 0.04 then
          Asiento(dm.ConfigQuery.FieldByName('CtaCaja').AsString, a, fech,
            (oper + ' - ' + let + ' - ' + cod), '0', floattostr(pag));
        // DSXVTA (CUENTA CORRIENTE)
        if (sal > 0.04) AND (pgr <> True) then
          Asiento(ctan, a, fech, (oper + ' - ' + let + ' - ' + cod), '0',
            floattostr(sal));
        // DOC A COBRAR (CON DOCUMENTOS (PAGARE))
        if (pag < tot) AND (pgr = True) then
          Asiento(dm.ConfigQuery.FieldByName('CtaDocumentoACobrar').AsString, a,
            fech, (oper + ' - ' + let + ' - ' + cod), floattostr(sal), '0');
        // VALOR AL COBRO (PAGO CON CHEQUE)
        if (cheq) > 0.04 then
          Asiento(dm.ConfigQuery.FieldByName('CtaValorAlCobro').AsString, a,
            fech, (oper + ' - ' + let + ' - ' + cod), '0', floattostr(cheq));
        Exit;
      end
      else if oper = 'VENTA' then // SI ES VENTA
      begin
        // -----------------------------------0-----------------------------------------
        // PAGO CON EFECTIVO
        if (cont) > 0.04 then
          Asiento(dm.ConfigQuery.FieldByName('CtaCaja').AsString, a, fech,
            (oper + ' - ' + let + ' - ' + cod + ' - ' + cui), floattostr(pag),
            '0'); // CAJA
        // CUENTA CORRIENTE
        if ((pag) < tot) AND (pgr <> True) then
          Asiento(ctan, a, fech, (oper + ' - ' + let + ' - ' + cod + ' - ' +
            cui), floattostr(sal), '0'); // DSXVTA
        // CON DOCUMENTOS (PAGARE)
        if (pag < tot) AND (pgr = True) then
          Asiento(dm.ConfigQuery.FieldByName('CtaDocumentoACobrar').AsString, a,
            fech, (oper + ' - ' + let + ' - ' + cod + ' - ' + cui),
            floattostr(sal), '0'); // DOC A COBRAR
        // PAGO CON CHEQUE
        if (cheq) > 0.04 then
          Asiento(dm.ConfigQuery.FieldByName('CtaValorAlCobro').AsString, a,
            fech, (oper + ' - ' + let + ' - ' + cod + ' - ' + cui),
            floattostr(cheq), '0'); // VALOR AL COBRO
        // a
        // PAGO DE CUENTA CORRIENTE
        if ((pag) > (tot - deud)) then
          Asiento(ctan, a, fech, (oper + ' - ' + let + ' - ' + cod + ' - ' +
            cui), '0', floattostr(pag - (tot - deud)));
        // renglon  - DEUDORES POR VENTA
        // si es factura A
        if let = 'A' then
        begin
          Asiento(dm.ConfigQuery.FieldByName('CtaIVADebitoFiscal').AsString, a,
            fech, (oper + ' - ' + let + ' - ' + cod + ' - ' + cui), '0',
            floattostr(impu)); // renglon  - IVA DEBITO FISCAL
          tot := tot - impu;
        end;
        // VENTAS
        if oper <> 'CtaCte' then
        begin
          Asiento(dm.ConfigQuery.FieldByName('CtaVenta').AsString, a, fech,
            (oper + ' - ' + let + ' - ' + cod + ' - ' + cui), '0',
            floattostr(tot)); // renglon  - VENTAS
          // -----------------------------------1-----------------------------------------
          // COSTO DE MERCADERIAS VENDIDAS
          if cmv > 0 then
          begin
            // CMV
            Asiento(dm.ConfigQuery.FieldByName('CtaCMV').AsString, a, fech,
              (oper + ' - ' + let + ' - ' + cod + ' - ' + cui),
              floattostr(cmv), '0');
            // a
            // renglon  - MERCADERIAS DE REVENTA
            Asiento(dm.ConfigQuery.FieldByName('CtaMercaderia').AsString, a,
              fech, (oper + ' - ' + let + ' - ' + cod + ' - ' + cui), '0',
              floattostr(cmv));
          end;
          // -----------------------------------2-----------------------------------------
          // COMISION DE VENDEDORES
          if comv > 0 then
          begin
            // renglon  - COMISION VENDEDOR
            Asiento(dm.ConfigQuery.FieldByName('CtaComisionVendedor').AsString,
              a, fech, (oper + ' - ' + let + ' - ' + cod + ' - ' + cui),
              floattostr(comv), '0');
            // a
            // renglon  - COMISION VENDEDOR A PAGAR
            Asiento(dm.ConfigQuery.FieldByName('CtaComisionVendedorAPagar')
              .AsString, a, fech, (oper + ' - ' + let + ' - ' + cod + ' - ' +
              cui), '0', floattostr(comv));
          end;
          // -----------------------------------3-----------------------------------------
        end;
      end
      else if oper = 'RETIRO CAJA' then
      begin // RETIRO DE CAJA
        // renglon  - SOCIO XX
        Asiento(ctaan, a, fech, (oper + ' - ' + let + ' - ' + cod + ' - ' +
          cui), floattostr(tot), '0');
        // a
        // renglon  - CAJA
        Asiento(dm.ConfigQuery.FieldByName('CTACAJA').AsString, a, fech,
          (oper + ' - ' + let + ' - ' + cod + ' - ' + cui), '0',
          floattostr(tot));
      end
      else if oper = 'PED' then // SI ES VENTA
      begin
        // -----------------------------------0-----------------------------------------
        // PAGO CON EFECTIVO
        if (cont) > 0.04 then
          Asiento(dm.ConfigQuery.FieldByName('CtaCaja').AsString, a, fech,
            (oper + ' - ' + let + ' - ' + cod + ' - ' + cui), floattostr(pag),
            '0'); // CAJA
        // CUENTA CORRIENTE
        if ((pag) < tot) AND (pgr <> True) then
          Asiento(ctan, a, fech, (oper + ' - ' + let + ' - ' + cod + ' - ' +
            cui), floattostr(sal), '0'); // DSXVTA
        // CON DOCUMENTOS (PAGARE)
        if (pag < tot) AND (pgr = True) then
          Asiento(dm.ConfigQuery.FieldByName('CtaDocumentoACobrar').AsString, a,
            fech, (oper + ' - ' + let + ' - ' + cod + ' - ' + cui),
            floattostr(sal), '0'); // DOC A COBRAR
        // PAGO CON CHEQUE
        if (cheq) > 0.04 then
          Asiento(dm.ConfigQuery.FieldByName('CtaValorAlCobro').AsString, a,
            fech, (oper + ' - ' + let + ' - ' + cod + ' - ' + cui),
            floattostr(cheq), '0'); // VALOR AL COBRO
        // a
        // PAGO DE CUENTA CORRIENTE
        if ((pag) > (tot - deud)) then
          Asiento(ctan, a, fech, (oper + ' - ' + let + ' - ' + cod + ' - ' +
            cui), '0', floattostr(pag - (tot - deud)));
        // renglon  - DEUDORES POR VENTA
        // si es factura A
//        if let = 'A' then
//        begin
//          Asiento(dm.ConfigQuery.FieldByName('CtaIVADebitoFiscal').AsString, a,
//            fech, (oper + ' - ' + let + ' - ' + cod + ' - ' + cui), '0',
//            floattostr(impu)); // renglon  - IVA DEBITO FISCAL
//          tot := tot - impu;
//        end;
        // VENTAS
        if oper <> 'CtaCte' then
        begin
          Asiento(dm.ConfigQuery.FieldByName('CtaVenta').AsString, a, fech,
            (oper + ' - ' + let + ' - ' + cod + ' - ' + cui), '0',
            floattostr(tot)); // renglon  - VENTAS
          // -----------------------------------1-----------------------------------------
          // COSTO DE MERCADERIAS VENDIDAS
          if cmv > 0 then
          begin
            // CMV
            Asiento(dm.ConfigQuery.FieldByName('CtaCMV').AsString, a, fech,
              (oper + ' - ' + let + ' - ' + cod + ' - ' + cui),
              floattostr(cmv), '0');
            // a
            // renglon  - MERCADERIAS DE REVENTA
            Asiento(dm.ConfigQuery.FieldByName('CtaMercaderia').AsString, a,
              fech, (oper + ' - ' + let + ' - ' + cod + ' - ' + cui), '0',
              floattostr(cmv));
          end;
          // -----------------------------------2-----------------------------------------
          // COMISION DE VENDEDORES
          if comv > 0 then
          begin
            // renglon  - COMISION VENDEDOR
            Asiento(dm.ConfigQuery.FieldByName('CtaComisionVendedor').AsString,
              a, fech, (oper + ' - ' + let + ' - ' + cod + ' - ' + cui),
              floattostr(comv), '0');
            // a
            // renglon  - COMISION VENDEDOR A PAGAR
            Asiento(dm.ConfigQuery.FieldByName('CtaComisionVendedorAPagar')
              .AsString, a, fech, (oper + ' - ' + let + ' - ' + cod + ' - ' +
              cui), '0', floattostr(comv));
          end;
          // -----------------------------------3-----------------------------------------
        end;
      end
      {else if oper = 'PEDIDO' then // SI ES VENTA
      begin
        // -----------------------------------0-----------------------------------------
        // PAGO CON EFECTIVO
        if (cont) > 0.04 then
          Asiento(dm.ConfigQuery.FieldByName('CtaCaja').AsString, a, fech,
            (oper + ' - ' + let + ' - ' + cod + ' - ' + cui), floattostr(pag),
            '0'); // CAJA
        // CUENTA CORRIENTE
        if ((pag) < tot) AND (pgr <> True) then
          Asiento(ctan, a, fech, (oper + ' - ' + let + ' - ' + cod + ' - ' +
            cui), floattostr(sal), '0'); // DSXVTA
        // CON DOCUMENTOS (PAGARE)
        if (pag < tot) AND (pgr = True) then
          Asiento(dm.ConfigQuery.FieldByName('CtaDocumentoACobrar').AsString, a,
            fech, (oper + ' - ' + let + ' - ' + cod + ' - ' + cui),
            floattostr(sal), '0'); // DOC A COBRAR
        // PAGO CON CHEQUE
        if (cheq) > 0.04 then
          Asiento(dm.ConfigQuery.FieldByName('CtaValorAlCobro').AsString, a,
            fech, (oper + ' - ' + let + ' - ' + cod + ' - ' + cui),
            floattostr(cheq), '0'); // VALOR AL COBRO
        // a
        // PAGO DE CUENTA CORRIENTE
        if ((pag) > (tot - deud)) then
          Asiento(ctan, a, fech, (oper + ' - ' + let + ' - ' + cod + ' - ' +
            cui), '0', floattostr(pag - (tot - deud)));
        // VENTAS
          Asiento(dm.ConfigQuery.FieldByName('CtaVenta').AsString, a, fech,
            (oper + ' - ' + let + ' - ' + cod + ' - ' + cui), '0',
            floattostr(tot)); // renglon  - VENTAS
          // -----------------------------------1-----------------------------------------
          // COSTO DE MERCADERIAS VENDIDAS
          if cmv > 0 then
          begin
            // CMV
            Asiento(dm.ConfigQuery.FieldByName('CtaCMV').AsString, a, fech,
              (oper + ' - ' + let + ' - ' + cod + ' - ' + cui),
              floattostr(cmv), '0');
            // a
            // renglon  - MERCADERIAS DE REVENTA
            Asiento(dm.ConfigQuery.FieldByName('CtaMercaderia').AsString, a,
              fech, (oper + ' - ' + let + ' - ' + cod + ' - ' + cui), '0',
              floattostr(cmv));
          end;
          // -----------------------------------2-----------------------------------------
          // COMISION DE VENDEDORES
          if comv > 0 then
          begin
            // renglon  - COMISION VENDEDOR
            Asiento(dm.ConfigQuery.FieldByName('CtaComisionVendedor').AsString,
              a, fech, (oper + ' - ' + let + ' - ' + cod + ' - ' + cui),
              floattostr(comv), '0');
            // a
            // renglon  - COMISION VENDEDOR A PAGAR
            Asiento(dm.ConfigQuery.FieldByName('CtaComisionVendedorAPagar')
              .AsString, a, fech, (oper + ' - ' + let + ' - ' + cod + ' - ' +
              cui), '0', floattostr(comv));
          end;
          // -----------------------------------3-----------------------------------------
      end}
      ;
end;
end;

Procedure TOperacionDataModule.FormaPago;
begin
with dm do begin
  qQ.sql.Text := 'INSERT INTO "FormaPago"' +
    ' (DESCRIPCION, VENTA, COMPRA, CTACTE, PAGO, CONTADO, CHEQUE, CHEIMP, CHENRO, CHEDET, CHEDIA, TARJETA, TARNRO, TARIMP, OTRIMP, MONEDAEXTRANJERA, MEIMPORTE, METIPOCAMBIO, SALDO, PAGADO, CHEQUE3RO, CH3IMP, CH3NRO, CH3DET, CH3DIA) '
    + ' VALUES' + ' (' + quotedstr(desc) + ',' + vta + ',' + comp + ',' + ctac +
    ',' + pago + ',' + cont + ',' + cheq + ',' + chei + ',' + quotedstr(chen) +
    ',' + quotedstr(ched) + ',' + quotedstr(chedi) + ',' + tarj + ',' +
    quotedstr(tarn) + ',' + tarimp + ',' + otri + ',' + mone + ',' + meim + ','
    + metc + ',' + sald + ',' + paga + ',' + ch3q + ',' + ch3i + ',' +
    quotedstr(ch3n) + ',' + quotedstr(ch3d) + ',' + ch3di + ') ' + '';
  qQ.ExecSQL;
end;
end;

Procedure TOperacionDataModule.CodigoBarra;
begin
  ImprimirDataModule := TImprimirDataModule.Create(self);
  with ImprimirDataModule do
    Impr(EAN(cb), 'codebar');
  ImprimirDataModule.Free;
end;

procedure TOperacionDataModule.BorrarArticulos;
begin
with dm do begin
  with qT do
  begin
    Transaction.StartTransaction;
    SQL.Text := 'DELETE FROM "Articulo" ;';
    ExecSQL;
    SQL.Text :=
    ' DELETE FROM "Rubro" ;';
    ExecSQL;
    SQL.Text :=
    ' DELETE FROM "SubCategoria" ;';
    ExecSQL;
    SQL.Text :=
    ' DELETE FROM "Categoria" ;';
    ExecSQL;
    Transaction.Commit;
    insertarTabla2('Rubro','0','Sin Rubro');
    insertarTabla2('SubCategoria','0','SinSubCategoría');
    insertarTabla2('Categoria','0','Sin Categoría');
    Close;
  end;
end;
end;

procedure TOperacionDataModule.ModificarArticulos;
var
  existe : Boolean;
  ganancia : double;
 { codigo, descripcion,
  ultcosto, costo, precio, precio1, precio2, disponible,
  porcentaje, impotros, unidad, tasa, iibb, ctanombre, ctatipo, ctaanticipo,ctaiibb,
  fecha, fechacompult, codigobarra,
  categoria, color, marca, proveedor, rubro, subcategoria : string;
}
  Numero :Integer;
begin
with dm do begin
//  if not TryStrToInt(categoria, Numero) then
  categoria := '0';
//  if not TryStrToInt(proveedor, Numero) then
  proveedor := '1';
//  if not TryStrToInt(subcategoria, Numero) then
  subcategoria := '0';
//  if not TryStrToInt(rubro, Numero) then
  rubro := '0';
  if fecha = '' then fecha := DateToStr(now);
  if fechacompult = '' then fechacompult := fecha;
  if tasa = '' then tasa := '21';
  if porcentaje = '' then porcentaje := FloatToStr(dm.ConfigQuery.FieldByName('PP').AsFloat);
  porcentaje := StringReplace(porcentaje, ',', '.',[]);
  if disponible = '' then disponible := '1';
  tasa := StringReplace(tasa, ',', '.',[]);
  if tasa = '10.5' then tasa := '105';
  precio := StringReplace(precio, ',', '.',[]);
  ganancia := StrToFloat(precio)/(StrToFloat(tasa)/100+1);
  costo := FloatToStrF( ( ganancia/(StrToFloat(porcentaje)/100+1) ), ffFixed, 16, 2 );
//  ultcosto := costo;
  //if descripcion = nil then descripcion := '';
//  if codigobarra <> '' then existe := existeEnTabla('Articulo','CODIGOBARRA='+QuotedStr(codigobarra))
//  if descripcion <> '' then existe := existeEnTabla('Articulo','DESCRIPCION='+QuotedStr(descripcion))
  if codigo <> '' then existe := existeEnTabla('Articulo','CODIGO='+(codigo))
    else
      existe := false;
  if not ( existe ) then
  begin
    qQ.SQL.Text := 'INSERT INTO "Articulo" ('
    + ' CODIGO '
    + ', DESCRIPCION '
    + ', ULTCOSTO, COSTO, PRECIO'
    +', PRECIO1, PRECIO2'
    + ', DISPONIBLE'
    + ', PORCENTAJE, IMPOTROS, UNIDAD, TASA, IIBB, CTANOMBRE, CTATIPO, CTAANTICIPO, CTAIIBB '
    + ', FECHA, FECHACOMPULT, CODIGOBARRA'
    + ', CATEGORIA, COLOR, MARCA, PROVEEDOR, RUBRO, SUBCATEGORIA'
    + ' ) VALUES ( '
    + (codigo) + ', '
//    + QuotedStr(descripcion)
//    + ', '+ costo +', ' + costo + ', ' + precio
//    + ', ' + precio1 + ', ' + precio2
//    + ', ' + disponible
//    + ', '+ porcentaje +', 5, ''c/u'', '+ tasa +', 1, 13, 13, 13, 66'
//    + ', '+ QuotedStr(fecha) +', ' + QuotedStr(fechacompult) + ', ' + QuotedStr(codigobarra)
//    + ', '+ categoria +', 0, 0, '+ proveedor +', '+ rubro +', '+ subcategoria
      +' DESCRIPCION = ' + QuotedStr(descripcion)
      +', ULTCOSTO =' +ultcosto// COSTO
      +', COSTO = ' + costo
      +', PRECIO = ' + precio
    +', PRECIO1 = ' + precio1
    +', PRECIO2 = ' + precio2
      +', DISPONIBLE = ' + disponible
      +', PORCENTAJE = ' + porcentaje
    +', IMPOTROS = ' +impotros//5
    +', UNIDAD = ' +unidad//''c/u''
      +', TASA = ' + tasa
    +', IIBB = ' +iibb//1
    +', CTANOMBRE = ' +ctanombre// 13
    +', CTATIPO = ' +ctatipo// 13
    +', CTAANTICIPO = ' +ctaanticipo//13
    +', CTAIIBB = ' +ctaiibb//66
      +', FECHACOMPULT = ' +fechacompult//FECHA
      +', FECHA = ' + QuotedStr(fecha)
      +', CODIGOBARRA = ' + QuotedStr(codigobarra)
    +', CATEGORIA = ' +categoria
    +', COLOR = ' +color//0
    +', MARCA = ' +marca//0
    +', PROVEEDOR = ' + proveedor
    +', RUBRO = ' + rubro
    +', SUBCATEGORIA = ' + subcategoria


    +' )';
  end
    else
      qQ.SQL.Text := 'UPDATE "Articulo" SET'
      +' DESCRIPCION = ' + QuotedStr(descripcion)
      +', ULTCOSTO =' +ultcosto// COSTO
      +', COSTO = ' + costo
      +', PRECIO = ' + precio
    +', PRECIO1 = ' + precio1
    +', PRECIO2 = ' + precio2
      +', DISPONIBLE = ' + disponible
      +', PORCENTAJE = ' + porcentaje
    +', IMPOTROS = ' +impotros//5
    +', UNIDAD = ' +unidad//''c/u''
      +', TASA = ' + tasa
    +', IIBB = ' +iibb//1
    +', CTANOMBRE = ' +ctanombre// 13
    +', CTATIPO = ' +ctatipo// 13
    +', CTAANTICIPO = ' +ctaanticipo//13
    +', CTAIIBB = ' +ctaiibb//66
      +', FECHACOMPULT = ' +fechacompult//FECHA
      +', FECHA = ' + QuotedStr(fecha)
      +', CODIGOBARRA = ' + QuotedStr(codigobarra)
    +', CATEGORIA = ' +categoria
    +', COLOR = ' +color//0
    +', MARCA = ' +marca//0
    +', PROVEEDOR = ' + proveedor
    +', RUBRO = ' + rubro
    +', SUBCATEGORIA = ' + subcategoria
      +' WHERE '
      +' CODIGO ='+ (codigo);
//      +' CODIGOBARRA = ' + QuotedStr(codigobarra);
//        +' DESCRIPCION = ' + QuotedStr(descripcion);
    qQ.ExecSQL;
//    BaseDatosFB.Commit;
end;
end;

procedure TOperacionDataModule.ActualizarCantidadArticulo;
begin
  with dm do
  begin
    qQ.sql.Text := 'Update "Articulo" Set DISPONIBLE = DISPONIBLE ' + cantidad
      + ' Where "Articulo".CODIGO = ' + codigo;
    qQ.ExecSQL;
    if webUpd='True' then
      with DMR do
      begin
        JAline_items.AddElement( Jline_items( codigo, cantidad ) );
      end;
  end;
end;

procedure TOperacionDataModule.DataSetToCsv;
var
  i : Integer;
  voFichero : TStringList;
  vsLinea : String;
  vsBookMark : TBookmark;
begin
  with dm do
  begin
    vsBookMark := qQ.Bookmark;
    voFichero := nil;
    try
      voFichero := TStringList.Create;
      // Ponemos la cabecera
      vsLinea := '';
      for i := 0 to qQ.FieldCount - 1 do
        if qQ.Fields[i].Visible then
          vsLinea := vsLinea + '"' + qQ.Fields[i].DisplayName + '",';
      voFichero.Add(vsLinea);
      // Insertamos los registros
      qQ.DisableControls;
      qQ.First;
      while not qQ.Eof do
      begin
        vsLinea := '';
        for i := 0 to qQ.FieldCount - 1 do
          if qQ.Fields[i].Visible then
            vsLinea := vsLinea + '"' + qQ.Fields[i].AsString + '",';
        voFichero.Add(vsLinea);
        qQ.Next;
      end;
      // Lo guardamos en disco
      voFichero.SaveToFile(psRutaFichero);
    finally
      FreeAndNil(voFichero);
      qQ.Bookmark := vsBookMark;
      qQ.EnableControls;
    end;
  end;
end;

procedure TOperacionDataModule.WSFE;
begin
  AfipDataModule := TAfipDataModule.Create(self);
  try
    with AfipDataModule do
    begin
      jsResponse := FacturaAfip( cbteFecha, dm.TraerTipoCbte(let), concepto,
      docTipo, docNro, cbte, impNeto, impTotal,
      '0', ImpIva, '0', impEx, '1',
      dm.TraerTipoCbte(asocTipo), asocNro,
      '', '0', '0', '0',
      //n10, n21, i10, i21,//'0', '0', '0',
      'PES', 'impuesto', '',
      '', '', '', '', '', '');
      if jsResponse = nil then
        exit
      else
      begin
        cae := jsResponse.GetValue<String>('cae');
        comp := jsResponse.GetValue<String>('nro');
        vto := jsResponse.GetValue<String>('vto');
        mensaje := jsResponse.GetValue<String>('mensaje');
      end;
    end;
  finally
    AfipDataModule.Free;
  end;
end;

{ FACTURA UN REMITO }
procedure TOperacionDataModule.FactRem;
var
  nro, i, aIva: integer;
  ctaCte: boolean;
begin
with dm do begin
  BaseDatosFB.StartTransaction;
  FormatearFecha;
  pagare := '0';
  nro := (DM.UltimoRegistro('Venta', 'CODIGO'));
  comp := dm.ObtenerNroComp(let);
  if pgr then
    pagare := 'S';
  cmv := CostMercVend(ulc, cost);
 // CALCULAR IIBB
  qQ.sql.Text := 'SELECT * FROM "IIBB" WHERE CODIGO=' + IngresosBrutos;
  qQ.Open;
  //  if tot - impu > qQ.FieldByName('MONTO').AsFloat then
  //    IIBB := (tot - impu) * (qQ.FieldByName('COEF1').AsFloat *
  //      qQ.FieldByName('COEF2').AsFloat * qQ.FieldByName('PORCENTAJE').AsFloat);
  if let = 'C' then
    begin
//      tipocbte:='11';
      IIBB := tot * (qQ.FieldByName('PORCENTAJE').AsFloat/100)
    end
  else
    IIBB := (tot - impu) * (qQ.FieldByName('PORCENTAJE').AsFloat/100);
  if (reporte = 'FElectronica') or (reporte = 'TElectronica') then
  begin
    WSFE(fech, let, '1', '96', cui, comp,  FloatToStr(sbt), FloatToStr(impu), floattostr(tot), '0', '0'
    //, FloatToStr(n10), FloatToStr(n21), FloatToStr(i10), FloatToStr(i21)
    , FloatToStr(exc));
    if cae = '' then exit;
  end;
  //actualiza el nro de factura
  if comp<>'' then dm.ActualizarNroComp(let,comp);
  //AlicuotaIVA
  aIva := InsertarAlicIva;
  // INSERTA EN LA TABLA VENTA
  qQ.SQL.Text := 'Insert Into "Venta" ( COMPROBANTE, REMITO, TERMINOS'+
    ', CODIGO, LETRA, CLIENTE ' +
    ', SUBTOTAL, DESCUENTO, FECHA'+
    ', IMPUESTO, IVA1, IVA2'+
    ', IIBB, TOTAL, CONTADO, CHEQUE' +
    ', TARJETA, OTROS, SALDO'+
    ', PAGADO, PAGARE, COSTO'+
    ', DEUDA, COMISION, DESCRIPCION'+
    ', ALICIVA, ENVIO, NOTAS, WC'+
    ') Values ' + '('+QuotedStr(comp)+', '+QuotedStr(codRem)+', '+QuotedStr(vto)+
    ', '+IntToStr(nro)+', '+quotedstr(let) + ', ' + cod + ', ' +
    floattostr(sbt) + ', ' + floattostr(des) + ', ' + quotedstr(fech) + ', ' +
    floattostr(impu) + ', ' + floattostr(i10) + ', ' + floattostr(i21) + ', ' +
    floattostr(IIBB) + ', ' + floattostr(tot) + ', ' + floattostr(cont) + ', ' + floattostr(cheq) + ', ' +
    floattostr(tarj) + ', ' + floattostr(otr) + ', ' + floattostr(sal) + ', ' +
    floattostr(pag) + ', ' + quotedstr(pagare) + ', ' + floattostr(cmv) + ', ' +
    floattostr(deud) + ',' + floattostr(comv) + ', ' + QuotedStr(cae) +
    ', '+IntToStr(aIva)+', '+floattostr(env)+ ', ' + quotedstr(notas)+ ', ' + IntToStr(wc) +
    ')';
  qQ.ExecSQL;
  // Insertar en la tabla de VENTAITEM
  if mat <> nil then
    for i := 1 to High(mat[0]) do
    begin
      // CALCULAR IIBB
  //    qQ.sql.Text := 'SELECT * FROM "IIBB" WHERE CODIGO=' + quotedstr(mat[9, i]);
  //    qQ.Open;
  //    if tot - impu > qQ.FieldByName('MONTO').AsFloat then
  //      IIBB := (tot - impu) * (qQ.FieldByName('COEF1').AsFloat *
  //        qQ.FieldByName('COEF2').AsFloat * qQ.FieldByName('PORCENTAJE').AsFloat);
      if (mat[1, i]= 'Deuda CtaCte') then
        ctaCte := True;
      qQ.SQL.Text :=
        'Insert Into "VentaItem" (OPERACION, ARTICULO, CANTIDAD, COSTO, PRECIO, IMPUESTO, SERVICIO, DESCRIPCION) Values'
        + ' ( ' + IntToStr(nro) + ', ' + (mat[0, i]) + ', ' + (mat[3, i]) + ', ' +
        (mat[7, i]) + ', ' +(mat[4, i]) + ', ' + mat[6, i] + ', ' + IntToStr(nro) + ', ' +
        quotedstr(mat[1, i]) + ');';
      qQ.ExecSQL;
    end;

  qQ.SQL.Text := 'Update "Operacion" Set ANULADA = ''S'' Where CODIGO = '+QuotedStr(codRem);
  qQ.ExecSQL;
  dm.AgregarRetPer('VENTA',(nro),noGra,pagCueIva,pagCueOtr,perIIBB,perImpMun,impInt,otrTrib);
//  if ctaCte then
//  begin
//    qQ.SQL.Text := 'Update "CtaCte" Set SALDO = ' + floattostr(sal) +
//        ', FECHA = ' + quotedstr(fech) + ' Where CLIENTE = ' + cod;
//    qQ.ExecSQL;
//  end;
//
//  // Insertar en la tabla de CtaCte
//  if (sal > 0.05) then
//  begin
//    qQ.SQL.Text := 'SELECT * FROM "CtaCte" WHERE CLIENTE = ' + cod;
//    qQ.Open;
//    if (qQ.RecordCount > 0) and (sal < 0.05) then
//      qQ.SQL.Text := 'Update "CtaCte" Set SALDO = ' + floattostr(sal) +
//        ', FECHA = ' + quotedstr(fech) + ' Where CLIENTE = ' + cod
//    else
//      qQ.SQL.Text := 'Insert Into "CtaCte" (CLIENTE, SALDO, OPERACION,' +
//        ' DESCUENTO, INTERES, FECHA, RENDIDAS) Values (' + cod + ', ' +
//        floattostr(sal) + ', ' + nro + ', ' + floattostr(des) + ', ' +
//        floattostr(int) + ', ' + quotedstr(fech) + ', 0' + ')';
//      qQ.ExecSQL;
//    // Insertar en la tabla de CtaCte Item
//    if sal > 0.04 then
//    begin
//      For i := 1 to High(mat[0]) do
//      begin
//        if mat[0, i] <> '1' then
//          detalle := mat[1, i]
//        else
//          detalle := memo;
//        qQ.sql.Text := 'Insert Into "CtaCteItem" (OPERACION, CLIENTE,' +
//          ' DESCRIPCION, IMPORTE, ' + ' PAGADO) Values ' + '( ' + nro + ',' +
//          cod + ', ' + quotedstr(detalle) + ',' + (mat[5, i]) + ', 0)';
//        qQ.ExecSQL;
//      end;
//    end;
//  end;
  // Insertar en RendidoVendedor
//  if ven <> '' then
//  begin
//    comv := round(tot * (comv / 100));
//    if comv = 0 then
//      comv := 0;
//    qQ.sql.Text :=
//      'Insert Into "RendidoVendedor" (VENDEDOR, VENTA, IMPORTE, FECHA) Values' +
//      ' (' + quotedstr(ven) + ', ' + nro + ', ' + Format('%8.2f', [comv]) + ', '
//      + quotedstr(fech) + ')';
//    qQ.ExecSQL;
//  end;
  // Actualizar la tabla de Articulos
//  if mat <> nil then
//    for i := 1 to High(mat[0]) do
//    begin
//      OperacionDataModule.ActualizarCantidadArticulo(mat[0, i], '- '+mat[3, i])
//      qQ.sql.Text := 'Update "Articulo" Set DISPONIBLE = DISPONIBLE - ' + mat[3, i]
//        + ' Where "Articulo".CODIGO = ' + (mat[0, i]);
//      qQ.ExecSQL;
//    end;
  // CONTABILIDAD+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // LIBRO IVA VENTAS
  if (let = 'A') or (let = 'B') then//  if let <> 'X' then
    LibroIVAvta(fech, IntToStr(nro), cod, cui, floattostr(n10), floattostr(n21),
      floattostr(i10), floattostr(i21), floattostr(tot)); // en blanco
  // Insertar en la tabla LibroDiario
  LibroDiario('VENTA', IntToStr(nro), let, cod, fech, pgr, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0);
  // Completa la Transaccion
  BaseDatosFB.Commit;
//  if webUpd='True' then RestDataModule.CrearOrden;
  // IMPRIMIR
  if impr then
  begin
    ImprimirDataModule := TImprimirDataModule.Create(self);
    with ImprimirDataModule do
      Impr(vta(IntToStr(nro), let), let);
    ImprimirDataModule.Free;
  end;
  if (wpSync) then WooCommerceGeN('CompleteOrder', IntToStr(wc));
end;
end;

procedure TOperacionDataModule.AgregarAlicIva(cod,id: integer; bImp,imp: double);
begin
  with dm do
  begin
    if bImp>0 then
    begin
      qQ.SQL.Text := 'Insert Into "AlicIva" (CODIGO, ID, BASEIMP, IMPORTE) Values ('
        +IntToStr(cod)+', '+IntToStr(id)+', '+FloatToStr(bImp)+', '+FloatToStr(imp)+')';
      qQ.ExecSQL;
    end;
  end;
end;

procedure TOperacionDataModule.ActualizarSiapVtaComp;
var
  cod,let,DocTipo,AlicIVA,DocNro,tabla,sql,where,tipoRetPer,cbteDesde,cbteHasta:string;
  impOpEx,pagCueIva,pagCueOtr,perIIBB,perImpMun,impInt,otrTrib,noGra
  : Double;
  CantIva : Integer;
begin
  with dm do
  begin
    sdb.ExecSQL('DELETE FROM SiapVtaComp');
    tabla := 'Venta';
    tipoRetPer := 'VENTA';
    let := '';
    CantIva := 0;
    where:='';
    while tabla<>'' do
    begin
      sql:='SELECT'
      +' "'+tabla+'".CODIGO,'
      +' "'+tabla+'".LETRA,'
      +' "'+tabla+'".FECHA,'
      +' "'+tabla+'".FECHA AS F,'
      +' "'+tabla+'".TOTAL,'
      +' "'+tabla+'".COMPROBANTE AS CbteDesde,'
      +' "'+tabla+'".COMPROBANTE AS CbteHasta,'
      +' "Cliente".NOMBRE AS NomCli,'
      +' "Cliente".DOCUMENTO AS DNI,'
      +' "Cliente".CUIT AS CUIT,'
      +' "'+tabla+'".IMPUESTO AS ImpIVA,'
      +' "'+tabla+'".IVA1,'
      +' "'+tabla+'".IVA2,'
      +' "'+tabla+'".SUBTOTAL AS ImpNeto,'
      +' "'+tabla+'".ALICIVA'
      +' FROM "'+tabla+'"'
      +' LEFT JOIN "Cliente" ON "Cliente".CODIGO = "'+tabla+'".CLIENTE'
      +' WHERE'
      +' ("'+tabla+'".FECHA > ' + QuotedStr(desde) + ' ) AND '
      +' ("'+tabla+'".FECHA < ' + QuotedStr(hasta) + ' )'+where;
      qQ.Open(sql);
      while not qQ.Eof do
      begin
        with tSdb do
        begin
          cod:=qQ.FieldByName('ALICIVA').AsString;
          Open('SELECT * FROM SiapVtaComp WHERE Codigo='+cod);
          if RowsAffected>0 then
            Edit
          else
            begin
              Insert;
              FieldByName('Codigo').AsInteger:=StrToInt(cod);
            end;
            CantIva:=0;
            FieldByName('CbteFch').AsString:=FormatDateTime('yyyymmdd',(qQ.FieldByName('FECHA').AsDateTime));
            //let:=ObtenerValor('CbteTipo', 'Codigo', 'Letra',QuotedStr(qQ.FieldByName('LETRA').AsString));
            let := let + qQ.FieldByName('LETRA').AsString;
            let:=dm.TraerTipoCbte(let);
            FieldByName('CbteTipo').AsString:=FormatFloat('000',StrToFloat(let));
            FieldByName('PtoVta').AsString:=FormatFloat('00000',StrToFloat(PuntoVenta));
            cbteDesde := qQ.FieldByName('CbteDesde').AsString;
            if (cbteDesde='') then cbteDesde:='0';
            cbteHasta := qQ.FieldByName('CbteHasta').AsString;
            if (cbteHasta='') then cbteHasta:='0';
            FieldByName('CbteDesde').AsString:=FormatFloat('00000000000000000000',StrToInt(cbteDesde));
            FieldByName('CbteHasta').AsString:=FormatFloat('00000000000000000000',StrToInt(cbteHasta));
            DocNro:=qQ.FieldByName('CUIT').AsString;
            if DocNro='' then DocNro:=qQ.FieldByName('DNI').AsString;
            if DocNro.Length < 11  then DocTipo :='96' else DocTipo := '80';
            if (DocNro='') then
              begin
                DocNro:='20222222223';
                DocTipo := '80';
              end;
            FieldByName('DocTipo').AsString:=DocTipo;
            FieldByName('DocNro').AsString:=FormatFloat('00000000000000000000',StrToFloat(DocNro));
            FieldByName('DocNomb').AsString:=FormatMaskText('000000000000000000000000000000',(qQ.FieldByName('NomCli').AsString));
            FieldByName('MonId').AsString:='PES';
            FieldByName('MonCotiz').AsString:=FormatFloat('0000000000',(1*1000000));
            FieldByName('CodOper').AsString:='0';
            FieldByName('FchVtoPago').AsString:=FormatFloat('00000000',(0*100));
            FieldByName('ImpNeto').AsString:=FormatFloat('000000000000000',(qQ.FieldByName('ImpNeto').AsFloat*100));

            with qSdb do
            begin
              Open('select * from RetPer where Codigo=:C and Tipo=:T',[cod,tipoRetPer]);
              if RecordCount>0 then
              begin
                noGra := FieldByName('NoGra').AsFloat;
                pagCueIva := FieldByName('PagCueIva').AsFloat;
                pagCueOtr := FieldByName('PagCueOtr').AsFloat;
                perIIBB := FieldByName('PerIIBB').AsFloat;
                perImpMun := FieldByName('PerImpMun').AsFloat;
                impInt := FieldByName('ImpInt').AsFloat;
                otrTrib := FieldByName('OtrTrib').AsFloat;
              end;
            end;

            FieldByName('ImpNoGra').AsString:=FormatFloat('000000000000000',(noGra*100));
            FieldByName('ImpIVA').AsString:=FormatFloat('000000000000000',(qQ.FieldByName('ImpIVA').AsFloat*100));
            FieldByName('ImpPercGral').AsString:=FormatFloat('000000000000000',(pagCueIva*100));
            FieldByName('ImpPercNoCat').AsString:=FormatFloat('000000000000000',(pagCueOtr*100));
            FieldByName('ImpPercIIBB').AsString:=FormatFloat('000000000000000',(perIIBB*100));
            FieldByName('ImpPercMuni').AsString:=FormatFloat('000000000000000',(perImpMun*100));
            FieldByName('ImpImpInt').AsString:=FormatFloat('000000000000000',(impInt*100));
            FieldByName('ImpOtrTrib').AsString:=FormatFloat('000000000000000',(otrTrib*100));
            FieldByName('ImpTotal').AsString:=FormatFloat('000000000000000',(qQ.FieldByName('TOTAL').AsFloat*100));

            AlicIva := qQ.FieldByName('AlicIVA').AsString;
            if AlicIva<>'' then
              with qT do
              begin
                SQL.Text := 'Select *'
                  +' from "AlicIva"'
                  +' inner join "Iva" on "Iva".CODIGO = "AlicIva".ID'
                  +' where  "AlicIva".CODIGO='+AlicIva;
                Open;
                while not Eof do
                begin
                  if (FieldByName('ID').AsString = '3') then
                  begin
                    impOpEx := FieldByName('BASEIMP').AsFloat;
                  end
                  else
                  begin
                    Inc(CantIva);
                    AgregarSiapVtaCompAlicuota(
                      StrToInt(cod),
                      FormatFloat('0000',(StrToInt(FieldByName('ID').AsString))),//Código alícuota IVA
                      FormatFloat('000000000000000',(FieldByName('BASEIMP').Asfloat*100)),//Neto Gravado alícuota  Importe Total
                      FormatFloat('000000000000000',(FieldByName('IMPORTE').Asfloat*100))//IVA alícuota
                    );
                  end;
                  Next;
                end;
              end;
            FieldByName('IvaCant').AsString:=IntToStr(CantIva);
            FieldByName('ImpOpEx').AsString:=FormatFloat('000000000000000',(impOpEx*100));
            Post;
            qQ.Next;
        end;
      end;
      if (tabla='Venta') then
      begin//nota de credito
        tabla:='Operacion';
        tipoRetPer := 'NVENTA';
        let:='NC';
        CantIva := 0;
        where := ' AND ("Operacion".TIPO LIKE ''%NC%'')';
      end
      else tabla:='';
    end;
  end;
end;

procedure TOperacionDataModule.ActualizarSiap(tipo, desde, hasta: string);
var
  cod,let,letCod,nc,codigo,DocTipo,AlicIVA,DocNro,tabla,tabla1,tabla2,sql,where,
  tipoRetPer,cbteDesde,cbteHasta,terminos
  ,codAlicIva
  : string;
  impOpEx,pagCueIva,pagCueOtr,perIIBB,perImpMun,impInt,otrTrib,noGra
  : Double;
  CantIva : Integer;
begin
//  tipo:='SiapVtaComp';
  with dm do
  begin
    sdb.ExecSQL('DELETE FROM Siap'+tipo+'Comp');
    sdb.ExecSQL('DELETE FROM Siap'+tipo+'CompAlicuota');
    if tipo='Vta' then
    begin
      tabla := 'Venta';
      tipoRetPer := 'VENTA';
      let := '';
      nc := '';
      CantIva := 0;
      tabla1 := 'Cliente';
      tabla2 := 'Cliente';
      where:='';
      codigo :='CbteDesde';
    end
    else
    begin
      tabla := 'Compra';
      tipoRetPer := 'COMPRA';
      let := '';
      nc := '';
      CantIva := 0;
      tabla1 := 'Proveedor';
      tabla2 := 'Proveedor';
      where:='';
      codigo :='CbteNro';
    end;
    while tabla<>'' do
    begin
      sql:='SELECT'
      +' "'+tabla+'".CODIGO,'
      +' "'+tabla+'".LETRA,'
      +' "'+tabla+'".FECHA,'
      +' "'+tabla+'".TERMINOS,'
      +' "'+tabla+'".TOTAL,'
      +' "'+tabla+'".COMPROBANTE AS CbteDesde,'
      +' "'+tabla+'".COMPROBANTE AS CbteHasta,'
      +' "'+tabla2+'".NOMBRE AS DocNomb,'
      +' "'+tabla2+'".DOCUMENTO AS DNI,'
      +' "'+tabla2+'".CUIT AS CUIT,'
      +' "'+tabla+'".IMPUESTO AS ImpIVA,'
      +' "'+tabla+'".IVA1,'
      +' "'+tabla+'".IVA2,'
      +' "'+tabla+'".SUBTOTAL AS ImpNeto,'
      +' "'+tabla+'".ALICIVA'
      +' FROM "'+tabla+'"'
      +' LEFT JOIN "'+tabla2+'" ON "'+tabla2+'".CODIGO = "'+tabla+'".'+tabla1+''
      +' WHERE'
      +' ("'+tabla+'".FECHA >= ' + QuotedStr(desde) + ' ) AND '
      +' ("'+tabla+'".FECHA <= ' + QuotedStr(hasta) + ' )'+where;
      qQ.Open(sql);
      while not qQ.Eof do
      begin
        with tSdb do
        begin
          cod := IntToStr(UltimoRegistroSdb('Siap'+tipo+'Comp', 'Codigo'));
          let := qQ.FieldByName('LETRA').AsString;
          letCod := dm.TraerTipoCbte(nc+let);
          letCod := FormatFloat('000',StrToFloat(letCod));
          cbteDesde := qQ.FieldByName('CbteDesde').AsString;
          if (cbteDesde='') then cbteDesde:='0';
          Open('SELECT * FROM Siap'+tipo+'Comp WHERE '+codigo+'=:C AND CbteTipo=:T',[cbteDesde,letCod]);
          if RowsAffected>0 then
            Edit
          else
            begin
              Insert;
              FieldByName('Codigo').AsInteger:=StrToInt(cod);
            end;
            CantIva:=0;
            FieldByName('CbteFch').AsString:=FormatDateTime('yyyymmdd',(qQ.FieldByName('FECHA').AsDateTime));
            //let:=ObtenerValor('CbteTipo', 'Codigo', 'Letra',QuotedStr(qQ.FieldByName('LETRA').AsString));
            FieldByName('CbteTipo').AsString := letCod;
            cbteHasta := qQ.FieldByName('CbteHasta').AsString;
            if (cbteHasta='') then cbteHasta:='0';
            DocNro:=qQ.FieldByName('CUIT').AsString;
            if DocNro='' then DocNro:=qQ.FieldByName('DNI').AsString;
            if DocNro.Length < 11  then DocTipo :='96' else DocTipo := '80';
            if (DocNro='') then
              begin
                DocNro:='20222222223';
                DocTipo := '80';
              end;
            with qSdb do
            begin
              Open('select * from RetPer where Codigo=:C and Tipo=:T',[qQ.FieldByName('Codigo').AsString,tipoRetPer]);
              if RecordCount>0 then
              begin
                noGra := FieldByName('NoGra').AsFloat;
                pagCueIva := FieldByName('PagCueIva').AsFloat;
                pagCueOtr := FieldByName('PagCueOtr').AsFloat;
                perIIBB := FieldByName('PerIIBB').AsFloat;
                perImpMun := FieldByName('PerImpMun').AsFloat;
                impInt := FieldByName('ImpInt').AsFloat;
                otrTrib := FieldByName('OtrTrib').AsFloat;
              end;
            end;
            FieldByName('DocTipo').AsString:=DocTipo;
            FieldByName('DocNro').AsString:=FormatFloat('00000000000000000000',StrToFloat(DocNro));
            FieldByName('DocNomb').AsString:=FormatMaskText('000000000000000000000000000000',(qQ.FieldByName('DocNomb').AsString));
            FieldByName('ImpNoGra').AsString:=FormatFloat('000000000000000',(noGra*100));
            FieldByName('ImpPercIIBB').AsString:=FormatFloat('000000000000000',(perIIBB*100));
            FieldByName('ImpPercMuni').AsString:=FormatFloat('000000000000000',(perImpMun*100));
            FieldByName('ImpImpInt').AsString:=FormatFloat('000000000000000',(impInt*100));
            FieldByName('ImpOtrTrib').AsString:=FormatFloat('000000000000000',(otrTrib*100));
            FieldByName('MonId').AsString:='PES';
            FieldByName('MonCotiz').AsString:=FormatFloat('0000000000',(1*1000000));
            FieldByName('CodOper').AsString:='0';
            FieldByName('ImpTotal').AsString:=FormatFloat('000000000000000',(qQ.FieldByName('TOTAL').AsFloat*100));
            if (tabla='Compra') or (tipoRetPer='NCOMPRA') then
            begin
              terminos := qQ.FieldByName('TERMINOS').AsString;
              if (terminos='') then terminos := '0';
              FieldByName('PtoVta').AsString:=FormatFloat('00000',StrToFloat(terminos));//COMPROBANTES PV	L5
              FieldByName('CbteNro').AsString:=FormatFloat('00000000000000000000',StrToInt(cbteDesde));  //COMPROBANTES Número		L20
              FieldByName('DespNro').AsString:=FormatMaskText('0000000000000000','');//COMPROBANTES Número Despacho  de Importación	L16
              FieldByName('ImpPercIva').AsString:=FormatFloat('000000000000000',(pagCueIva*100));//PERCEPCIONES Percepc y retenc. IVA	L15
              FieldByName('ImpPercNac').AsString:=FormatFloat('000000000000000',(pagCueOtr*100));//PERCEPCIONES Perc. otros imp. Nac.	L15
              if let='B' then // Credito Fiscal Computable	L15
                FieldByName('ImpCredFisc').AsString:=FormatFloat('000000000000000',0)
              else
                FieldByName('ImpCredFisc').AsString:=FormatFloat('000000000000000',(qQ.FieldByName('ImpIVA').AsFloat*100));
              FieldByName('CUIT').AsString:=FormatFloat('00000000000',0);//CUIT emisor/corredor	L11
              FieldByName('Denom').AsString:=FormatMaskText('000000000000000000000000000000','');//Denominación emisor/corredor	L30
              FieldByName('ImpIvaCom').AsString:=FormatFloat('000000000000000',0);//IVA comisión	L15
            end
            else
            begin
              FieldByName('CbteDesde').AsString:=FormatFloat('00000000000000000000',StrToInt(cbteDesde));
              FieldByName('CbteHasta').AsString:=FormatFloat('00000000000000000000',StrToInt(cbteHasta));
              FieldByName('PtoVta').AsString:=FormatFloat('00000',StrToFloat(PuntoVenta));
              FieldByName('FchVtoPago').AsString:=FormatFloat('00000000',(0*100));
              FieldByName('ImpNeto').AsString:=FormatFloat('000000000000000',(qQ.FieldByName('ImpNeto').AsFloat*100));
              FieldByName('ImpIVA').AsString:=FormatFloat('000000000000000',(qQ.FieldByName('ImpIVA').AsFloat*100));
              FieldByName('ImpPercGral').AsString:=FormatFloat('000000000000000',(pagCueIva*100));
              FieldByName('ImpPercNoCat').AsString:=FormatFloat('000000000000000',(pagCueOtr*100));
            end;
            impOpEx := 0;
            if (let='C') or ((tabla='Compra') and (let='B')) then
              CantIva := 0
            else
            begin
              AlicIva := qQ.FieldByName('AlicIVA').AsString;
            if AlicIva<>'' then
              with qT do
              begin
                SQL.Text := 'Select *'
                  +' from "AlicIva"'
                  +' inner join "Iva" on "Iva".CODIGO = "AlicIva".ID'
                  +' where  "AlicIva".CODIGO='+AlicIva;
                Open;
                while not Eof do
                begin
                  if (FieldByName('ID').AsString = '3') then
                  begin
                    impOpEx := FieldByName('BASEIMP').AsFloat;
                  end
                  else
                  begin
                    Inc(CantIva);
                    AgregarSiapCompAlicuota(tipo,
                      StrToInt(cod),
                      FormatFloat('0000',(StrToInt(FieldByName('ID').AsString))),//Código alícuota IVA
                      FormatFloat('000000000000000',(FieldByName('BASEIMP').Asfloat*100)),//Neto Gravado alícuota  Importe Total
                      FormatFloat('000000000000000',(FieldByName('IMPORTE').Asfloat*100))//IVA alícuota
                    );
                  end;
                  Next;
                end;
              end;
            end;
            FieldByName('IvaCant').AsString:=IntToStr(CantIva);
            FieldByName('ImpOpEx').AsString:=FormatFloat('000000000000000',(impOpEx*100));
            Post;
            qQ.Next;
        end;
      end;
      if (tabla='Venta') then
      begin//nota de credito
        tabla:='Operacion';
        tabla1 := 'Cliente';
        tabla2 := 'Cliente';
        tipoRetPer := 'NVENTA';
        let := '';
        nc := 'NC';
        CantIva := 0;
        where := ' AND ("Operacion".TIPO LIKE ''NC%'')';
      end else
      if (tabla='Compra') then
      begin//nota de credito compra
        tabla:='Operacion';
        tabla1 := 'Cliente';
        tabla2 := 'Proveedor';
        tipoRetPer := 'NCOMPRA';
        let := '';
        nc := 'NC';
        CantIva := 0;
        where := ' AND ("Operacion".TIPO LIKE ''CNC%'')';
      end
      else tabla:='';
    end;
  end;
end;

procedure TOperacionDataModule.ActualizarSiapCmpComp;
var
  cod,docTipo,docNro,AlicIva,tabla : string;
  cantIva : integer;
  noGra,pagCueIva,pagCueOtr,perIIBB,perImpMun,impInt,otrTrib,impOpEx
  :double;
begin
  with DM do
  begin
    tabla:='Compra';
    qQ.SQL.Text:=
      'SELECT'
      +' "Compra".CODIGO,'
      +' "Compra".LETRA,'
      +' "Compra".FECHA,'
      +' "Compra".TOTAL,'
      +' "Compra".TERMINOS,'
      +' "Compra".COMPROBANTE,'
      +' "Proveedor".NOMBRE AS DocNomb,'
      +' "Proveedor".DOCUMENTO AS DNI,'
      +' "Proveedor".CUIT,'
      +' "Compra".IMPUESTO AS ImpIVA,'
      +' "Compra".IVA1,'
      +' "Compra".IVA2,'
      +' "Compra".SUBTOTAL AS ImpNeto,'
      +' "Compra".AlicIva'
      +' FROM "Compra"'
      +' LEFT JOIN "Proveedor" ON "Proveedor".CODIGO = "Compra".Proveedor'
      +' WHERE'
      +' ("'+tabla+'".FECHA > ' + QuotedStr(desde) + ' ) AND '
      +' ("'+tabla+'".FECHA < ' + QuotedStr(hasta) + ' )   '
      +';';
    qQ.Open;
//    sdb.ExecSQL('delete from SiapCmpComp');
    while not qQ.Eof do
    begin
      with tSdb do
      begin
        CantIva:=0;
        impOpEx:=0;
        cod:=qQ.FieldByName('CODIGO').AsString;
        Open('SELECT * FROM SiapCmpComp WHERE Codigo='+cod);
        if RowsAffected>0 then
          Edit
        else
          begin
            Insert;
            FieldByName('Codigo').AsInteger:=StrToInt(cod);
          end;
          FieldByName('CbteFch').AsString:=FormatDateTime('yyyymmdd',(qQ.FieldByName('FECHA').AsDateTime));//FECHA Formato dd/mm/aaaa	L8
          FieldByName('CbteTipo').AsString:=FormatFloat('000',StrToFloat(TraerCodLetra(QuotedStr(qQ.FieldByName('LETRA').AsString))));//COMPROBANTES Tipo	L3
          FieldByName('PtoVta').AsString:=FormatFloat('00000',StrToFloat(qQ.FieldByName('TERMINOS').AsString));//COMPROBANTES PV	L5
          FieldByName('CbteNro').AsString:=FormatFloat('00000000000000000000',StrToFloat(qQ.FieldByName('COMPROBANTE').AsString));  //COMPROBANTES Número		L20
          FieldByName('DespNro').AsString:=FormatMaskText('0000000000000000','');//COMPROBANTES Número Despacho  de Importación	L16
          DocNro:=qQ.FieldByName('CUIT').AsString;
          if DocNro='' then DocNro:=qQ.FieldByName('DNI').AsString;
          if DocNro.Length < 11  then DocTipo :='96' else DocTipo := '80';
//          FieldByName('DocTipo').AsString:=DocTipo;//PROVEEDOR Código de Documento del vendedor	L2
          if (DocNro='') then
            begin
              DocNro:='20222222223';
              DocTipo := '80';
            end;
          FieldByName('DocNro').AsString:=FormatFloat('00000000000000000000',StrToFloat(DocNro));//PROVEEDOR Número de identificaión del vendedor	L20
          FieldByName('DocNomb').AsString:=FormatMaskText('000000000000000000000000000000',(qQ.FieldByName('DocNomb').AsString));//PROVEEDOR Apellido y Nombre del vendedor	L30
          FieldByName('ImpTotal').AsString:=FormatFloat('000000000000000',(qQ.FieldByName('TOTAL').AsFloat*100));//Totales (cálculo automático)	L15

          with qSdb do
          begin
            Open('select * from RetPer where Codigo=:C and Tipo=:T',[cod,'COMPRA']);
            if RecordCount>0 then
            begin
              noGra := FieldByName('NoGra').AsFloat;
              pagCueIva := FieldByName('PagCueIva').AsFloat;
              pagCueOtr := FieldByName('PagCueOtr').AsFloat;
              perIIBB := FieldByName('PerIIBB').AsFloat;
              perImpMun := FieldByName('PerImpMun').AsFloat;
              impInt := FieldByName('ImpInt').AsFloat;
              otrTrib := FieldByName('OtrTrib').AsFloat;
            end;
          end;

          FieldByName('ImpNoGra').AsString:=FormatFloat('000000000000000',(noGra*100));//Monto que no integra el precio neto gravado	L15
          FieldByName('ImpPercIva').AsString:=FormatFloat('000000000000000',(pagCueIva*100));//PERCEPCIONES Percepc y retenc. IVA	L15
          FieldByName('ImpPercNac').AsString:=FormatFloat('000000000000000',(pagCueOtr*100));//PERCEPCIONES Perc. otros imp. Nac.	L15
          FieldByName('ImpPercIIBB').AsString:=FormatFloat('000000000000000',(perIIBB*100));//PERCEPCIONES IIBB	L15
          FieldByName('ImpPercMuni').AsString:=FormatFloat('000000000000000',(perImpMun*100));//PERCEPCIONES Municipales	L15
          FieldByName('ImpImpInt').AsString:=FormatFloat('000000000000000',(impInt*100));//Impuestos Internos	L15
          FieldByName('ImpOtrTrib').AsString:=FormatFloat('000000000000000',(otrTrib*100));//Otros Tributos	L15
          FieldByName('MonId').AsString:='PES';//Código de Moneda	L3
          FieldByName('MonCotiz').AsString:=FormatFloat('0000000000',(1*1000000));//Tipo de cambio	L10
          FieldByName('CodOper').AsString:='0';//Código de operación	L1
          FieldByName('ImpCredFisc').AsString:=FormatFloat('000000000000000',(qQ.FieldByName('ImpIVA').AsFloat*100));// Credito Fiscal Computable	L15
          FieldByName('CUIT').AsString:=FormatFloat('00000000000',(0*100));//CUIT emisor/corredor	L11
          FieldByName('Denom').AsString:=FormatMaskText('000000000000000000000000000000','');//Denominación emisor/corredor	L30
          FieldByName('ImpIvaCom').AsString:=FormatFloat('000000000000000',(0*100));//IVA comisión	L15
          AlicIva := qQ.FieldByName('AlicIVA').AsString;
          if AlicIva<>'' then
            with qT do
            begin
              SQL.Text := 'Select *'
                +' from "AlicIva"'
                +' inner join "Iva" on "Iva".CODIGO = "AlicIva".ID'
                +' where  "AlicIva".CODIGO='+AlicIva;
              Open;
              while not Eof do
              begin
                if (FieldByName('ID').AsString = '3') then
                begin
                  impOpEx := FieldByName('BASEIMP').AsFloat;
                end
                else
                begin
                  Inc(CantIva);
                  AgregarSiapCmpCompAlicuota(
                    StrToInt(cod),
                    FormatFloat('0000',(StrToInt(FieldByName('ID').AsString))),//Código alícuota IVA
                    FormatFloat('000000000000000',(FieldByName('BASEIMP').Asfloat*100)),//Neto Gravado alícuota  Importe Total
                    FormatFloat('000000000000000',(FieldByName('IMPORTE').Asfloat*100))//IVA alícuota
                  );
                end;
                Next;
              end;
            end;
          FieldByName('IvaCant').AsString:=IntToStr(CantIva);//Cantidad alícuotas I.V.A.	L1
          FieldByName('ImpOpEx').AsString:=FormatFloat('000000000000000',(impOpEx*100));//Operaciones Exentas	L15
          Post;
          qQ.Next;
        end;
      end;
  end;
end;

function TOperacionDataModule.InsertarAlicIva;
begin
  with DM do
    with mtIVA do
      if RecordCount>0 then
      begin
        result := UltimoRegistro('AlicIva', 'CODIGO');
        First;
        while not Eof do begin
          AgregarAlicIva(result,
            StrToInt(TraerAlicuota(FieldByName('Tasa').Asstring)),
            FieldByName('Neto').AsFloat,
            FieldByName('Imp').AsFloat
          );
          Next;
        end;
        //VaciarMtIVA;
      end;
end;

procedure TOperacionDataModule.ActualizarArticulos;
var i :Integer;
begin
  if mat <> nil then
    if (wpSync) then
      for i := 1 to High(mat[0]) do
      begin
        DM.WooCommerceGeN('Articulo',mat[0, i]);
      end;
end;

end.
