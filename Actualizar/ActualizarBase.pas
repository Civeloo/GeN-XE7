unit ActualizarBase;

interface

uses
  System.SysUtils;

type
  TActualizarBase = Class
  private
    procedure CrearCbtetipo;
    procedure CrearTablasSiap;
    procedure CrearTablaRetPer;
    procedure CrearTablasIva;
    procedure CrearTablaCbteAsoc;
    procedure ActualizarTriggerFecha;
    procedure ActualizarImprimir(reporte: string);
//    procedure AgregarEnvio;
    procedure Reportes;
    procedure Articulo;
    procedure AgregarCampoEnTablas(tablas: TArray<string>; nombre,
      tipo: string);
  public
    constructor Create();
    destructor Destroy; override;
    procedure OnCreate;
  End;

implementation

{ TActualizarBase }

uses DataModule;

procedure TActualizarBase.OnCreate;
var tbs : TArray<string>;
begin
  tbs := TArray<string>.Create('Operacion', 'Venta', 'Compra', 'Presupuesto','CtaCte');
  with DM do
  begin
    if (not ExisteEnTabla('Version', '')) then
    begin
      CrearTabla('Version', 'V1', 'VARCHAR(255)');
      ActualizarTabla('Version', 'V2', 'VARCHAR(255)');
      ActualizarTabla('Version', 'V3', 'VARCHAR(255)');
      ActualizarTabla('Version', 'V4', 'VARCHAR(255)');
      AgregarValor('Version', 'V1', FloatToStr(v1));
      // ActualizarValor('Version', 'V2', '', FloatToStr(v2));
      // ActualizarValor('Version', 'V3', '', FloatToStr(v3));
      // ActualizarValor('Version', 'V4', '', FloatToStr(v4));
      ActualizarImprimir('FElectronica');
      ActualizarImprimir('TElectronica');
    end;
    // GetBuildInfo;
    if (EsVersion(1, 0, 20, 0) < 0) then
    begin
    if (EsVersion(1, 0, 19, 0) < 0) then
    begin
      if (EsVersion(1, 0, 18, 0) < 0) then
      begin
          if (EsVersion(1, 0, 16, 0) < 0) then
          begin
            CopyDir(ejecutable + 'hlp', Path);
            CrearCbtetipo;
            CrearTablasSiap;
            CrearTablaRetPer;
            CrearTablasIva;
            CrearTablaCbteAsoc;
            ActualizarTriggerFecha;
          end;
          Reportes;
      end;

      AgregarCampoEnTablas(tbs,'ENVIO','DOUBLE PRECISION DEFAULT 0');//AgregarEnvio;
      AgregarCampoEnTablas(tbs,'COMISION','DOUBLE PRECISION DEFAULT 0');//AgregarEnvio;
      AgregarCampoEnTablas(tbs,'NOTAS','BLOB');
      AgregarCampoEnTablas(tbs,'WC','INTEGER');

      ActualizarTabla('Rubro', 'PADRE', 'INTEGER');
      ActualizarTabla('Rubro', 'SLUG', 'VARCHAR(255)');
      ActualizarTabla('Rubro', 'HTML', 'BLOB');
      ActualizarTabla('Rubro', 'VIZUALIZAR', 'VARCHAR(50)');
      ActualizarTabla('Rubro', 'IMAGEN', 'VARCHAR(255)');
      ActualizarTabla('Rubro', 'ORDEN', 'INTEGER');

      ActualizarTabla('Categoria', 'PADRE', 'INTEGER');
      ActualizarTabla('Categoria', 'SLUG', 'VARCHAR(255)');
      ActualizarTabla('Categoria', 'HTML', 'BLOB');
      ActualizarTabla('Categoria', 'VIZUALIZAR', 'VARCHAR(50)');
      ActualizarTabla('Categoria', 'IMAGEN', 'VARCHAR(255)');
      ActualizarTabla('Categoria', 'ORDEN', 'INTEGER');

      ActualizarTabla('SubCategoria', 'PADRE', 'INTEGER');
      ActualizarTabla('SubCategoria', 'SLUG', 'VARCHAR(255)');
      ActualizarTabla('SubCategoria', 'HTML', 'BLOB');
      ActualizarTabla('SubCategoria', 'VIZUALIZAR', 'VARCHAR(50)');
      ActualizarTabla('SubCategoria', 'IMAGEN', 'VARCHAR(255)');
      ActualizarTabla('SubCategoria', 'ORDEN', 'INTEGER');
    end;
      CrearTabla('ZonaEnvio',
      'CODIGO integer not null primary key, DESCRIPCION varchar(255), ORDEN integer'
      ,'');
      CrearTabla('ZERegion',
      'ZONAENVIO integer, CODIGO integer not null primary key, DESCRIPCION varchar(255), Tipo varchar(50), CONTINENTE varchar(50), PAIS varchar(50), PROVINCIA varchar(50), CIUDAD varchar(50)'
      ,'');
      CrearTabla('ZEMetodo',
      'ZONAENVIO integer, CODIGO integer not null primary key, METODO varchar(50), DESCRIPCION varchar(255), ORDEN	integer, ACTIVO	smallint, CONFIGURACION	integer, IMPUESTO varchar(50), COSTO double precision'
      ,'');
      CrearTabla('ZEMConfig',
      'ZEMETODO integer, CODIGO integer not null primary key, ID varchar(50), ETIQUETA varchar(50), DESCRIPCION varchar(255), TIPO varchar(50), VALOR varchar(255), PORDEFECTO varchar(255), AYUDA varchar(255), INSINUAR varchar(255), OPCION varchar(255)'
      ,'');
    end;
    Articulo;
    ActualizarVersion;
  end;
end;

procedure TActualizarBase.Reportes;
begin
  with DM do
    CopyDir(ejecutable + 'rpt', Path);
end;

procedure TActualizarBase.CrearCbtetipo;
var
  TableFound: Boolean;
begin
  with DM do
  begin
    sdb.ExecSQL('CREATE TABLE IF NOT EXISTS CbteTipo ('
      // Siap Comprobantes de Ventas
      + 'Codigo INTEGER PRIMARY KEY,' + 'Letra TEXT,' + 'Desc TEXT' + ');');
    with tCbteTipo do
    begin
      Open('Select * from CbteTipo');
      if RowsAffected = 0 then
      begin
        InsertRecord([1, 'A', 'FACTURAS A']);
        InsertRecord([2, 'NDA', 'NOTAS DE DEBITO A']);
        InsertRecord([3, 'NCA', 'NOTAS DE CREDITO A']);
        InsertRecord([4, 'RA', 'RECIBOS A']);
        InsertRecord([5, 'NVA', 'NOTAS DE VENTA AL CONTADO A']);
        InsertRecord([6, 'B', 'FACTURAS B']);
        InsertRecord([7, 'NDB', 'NOTAS DE DEBITO B']);
        InsertRecord([8, 'NCB', 'NOTAS DE CREDITO B']);
        InsertRecord([9, 'RB', 'RECIBOS B']);
        InsertRecord([10, 'NVB', 'NOTAS DE VENTA AL CONTADO B']);
        InsertRecord([11, 'C', ' Factura C ']);
        InsertRecord([12, 'NDC', 'Nota de Débito C ']);
        InsertRecord([13, 'NCC', ' Nota de Crédito C ']);
        InsertRecord([15, 'RC', 'Recibo C ']);
        InsertRecord([17, '', 'LIQUIDACION DE SERVICIOS PUBLICOS CLASE A']);
        InsertRecord([18, '', 'LIQUIDACION DE SERVICIOS PUBLICOS CLASE B']);
        InsertRecord([19, '', 'FACTURAS DE EXPORTACION']);
        InsertRecord
          ([20, '', 'NOTAS DE DEBITO POR OPERACIONES CON EL EXTERIOR']);
        InsertRecord
          ([21, '', 'NOTAS DE CREDITO POR OPERACIONES CON EL EXTERIOR']);
        InsertRecord
          ([22, '', 'FACTURAS - PERMISO EXPORTACION SIMPLIFICADO - DTO. 855/97']
          );
        InsertRecord
          ([23, '', 'CPTES "A" DE COMPRA PRIMARIA PARA EL SECTOR PESQUERO MARITIMO']
          );
        InsertRecord
          ([24, '', 'CPTES "A" DE COSIGNACION PRIMARIA PARA EL SECTOR PESQUERO MARITIMO']
          );
        InsertRecord
          ([27, '', 'LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE A']);
        InsertRecord
          ([28, '', 'LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE B']);
        InsertRecord
          ([29, '', 'LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE C']);
        InsertRecord([33, '', 'LIQUIDACION PRIMARIA DE GRANOS']);
        InsertRecord
          ([34, '', 'COMPROBANTES A DEL APARTADO A INCISO F R G N 1415']);
        InsertRecord
          ([35, '', 'COMPROBANTES B DEL ANEXO I, APARTADO A, INC. F), RG N° 1415']
          );
        InsertRecord
          ([37, '', 'NOTAS DE DEBITO O DOCUMENTO EQUIVALENTE QUE CUMPLAN CON LA R.G. N° 1415']
          );
        InsertRecord
          ([38, '', 'NOTAS DE CREDITO O DOCUMENTO EQUIVALENTE QUE CUMPLAN CON LA R.G. N° 1415']
          );
        InsertRecord
          ([39, '', 'OTROS COMPROBANTES A QUE CUMPLEN CON LA R G 1415']);
        InsertRecord
          ([40, '', 'OTROS COMPROBANTES B QUE CUMPLAN CON LA R.G. 1415']);
        InsertRecord
          ([43, '', 'NOTA DE CREDITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE B']
          );
        InsertRecord
          ([44, '', 'NOTA DE CREDITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE C']
          );
        InsertRecord
          ([45, '', 'NOTA DE DEBITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE A']
          );
        InsertRecord
          ([46, '', 'NOTA DE DEBITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE B']
          );
        InsertRecord
          ([47, '', 'NOTA DE DEBITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE C']
          );
        InsertRecord
          ([48, '', 'NOTA DE CREDITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE A']
          );
        InsertRecord([51, 'M', 'FACTURAS M']);
        InsertRecord([52, 'NDM', 'NOTAS DE DEBITO M']);
        InsertRecord([53, 'NCM', 'NOTAS DE CREDITO M']);
        InsertRecord([54, 'RM', 'RECIBOS M']);
        InsertRecord([55, '', 'NOTAS DE VENTA AL CONTADO M']);
        InsertRecord
          ([56, '', 'COMPROBANTES M DEL ANEXO I APARTADO A INC F R G N 1415']);
        InsertRecord
          ([57, '', 'OTROS COMPROBANTES M QUE CUMPLAN CON LA R G N 1415']);
        InsertRecord([58, '', 'CUENTAS DE VENTA Y LIQUIDO PRODUCTO M']);
        InsertRecord([59, '', 'LIQUIDACIONES M']);
        InsertRecord([60, '', 'CUENTAS DE VENTA Y LIQUIDO PRODUCTO A']);
        InsertRecord([61, '', 'CUENTAS DE VENTA Y LIQUIDO PRODUCTO B']);
        InsertRecord([63, '', 'LIQUIDACIONES A']);
        InsertRecord([64, '', 'LIQUIDACIONES B']);
        InsertRecord([68, '', 'LIQUIDACION C']);
        InsertRecord([81, '', 'TIQUE FACTURA A CONTROLADORES FISCALES']);
        InsertRecord([82, '', 'TIQUE - FACTURA B']);
        InsertRecord([83, '', 'TIQUE']);
        InsertRecord
          ([90, '', 'NOTA DE CREDITO OTROS COMP QUE NO CUMPLEN CON LA R G 1415 Y SUS MODIF']
          );
        InsertRecord
          ([99, '', 'OTROS COMP QUE NO CUMPLEN CON LA R G 1415 Y SUS MODIF']);
        InsertRecord([110, '', 'TIQUE NOTA DE CREDITO']);
        InsertRecord([112, '', 'TIQUE NOTA DE CREDITO A']);
        InsertRecord([113, '', 'TIQUE NOTA DE CREDITO B']);
        InsertRecord([115, '', 'TIQUE NOTA DE DEBITO A']);
        InsertRecord([116, '', 'TIQUE NOTA DE DEBITO B']);
        InsertRecord([118, '', 'TIQUE FACTURA M']);
        InsertRecord([119, '', 'TIQUE NOTA DE CREDITO M']);
        InsertRecord([120, '', 'TIQUE NOTA DE DEBITO M']);
        InsertRecord([331, '', 'LIQUIDACION SECUNDARIA DE GRANOS']);
        InsertRecord([332, '', 'CERTIFICADO DE DEPOSITO DE GRANOS EN PLANTA']);
      end;
    end;
  end;
end;

procedure TActualizarBase.CrearTablasSiap;
begin
  with DM do
  begin
    sdb.ExecSQL('CREATE TABLE IF NOT EXISTS SiapVtaComp ('
      // Siap Comprobantes de Ventas
      + 'Codigo INTEGER,' + 'CbteFch TEXT,' // FECHA Formato dd/mm/aaaa
      + 'CbteTipo TEXT,' // COMPROBANTES Tipo
      + 'PtoVta TEXT,' // COMPROBANTES PV
      + 'CbteDesde TEXT,' // COMPROBANTES Número Desde
      + 'CbteHasta TEXT,' // COMPROBANTES Número Hasta
      + 'DocTipo TEXT,' // CLIENTE	"Código de Documento del Comprador"
      + 'DocNro TEXT,' // CLIENTE CUIT
      + 'DocNomb TEXT,' // CLIENTE Apellido y Nombre del Cliente
      + 'MonId TEXT,' // Moneda
      + 'MonCotiz TEXT,' // Tipo de cambio
      + 'IvaCant TEXT,' // Cantidad alícuotas I.V.A.
      + 'CodOper TEXT,' // Código de operación
      + 'FchVtoPago TEXT,' // Fecha vto. pago (formato aaaa/mm/dd)
      + 'IvaId TEXT,' // Código alícuota IVA
      + 'ImpNeto TEXT,' // Neto Gravado
      + 'ImpNoGra TEXT,' // Monto que no integra el precio neto gravado
      + 'ImpOpEx TEXT,' // Operaciones Exentas
      + 'ImpIva TEXT,' // I.V.A.
      + 'ImpPercGral TEXT,' // PERCEPCIONES Generales
      + 'ImpPercNoCat TEXT,' // PERCEPCIONES No Cat.
      + 'ImpPercIIBB TEXT,' // PERCEPCIONES IIBB
      + 'ImpPercMuni TEXT,' // PERCEPCIONES Municipales
      + 'ImpImpInt TEXT,' // Impuestos Internos
      + 'ImpOtrTrib TEXT,' // Otros Tributos
      + 'ImpTotal TEXT' // Totales (cálculo automático)
      + ')');

    sdb.ExecSQL('CREATE TABLE IF NOT EXISTS SiapVtaCompAlicuota ('
      // Siap Comprobantes de Compras
      + 'Codigo INTEGER,' + 'IvaId TEXT,' // Código alícuota IVA
      + 'IvaBaseImp TEXT,' // Neto Gravado alícuota
      + 'IvaAlic TEXT' // IVA alícuota
      + ')');

    sdb.ExecSQL('CREATE TABLE IF NOT EXISTS SiapCmpComp ('
      // Siap Comprobantes de Compras
      + 'Codigo INTEGER,' + 'CbteFch TEXT,' // FECHA Formato dd/mm/aaaa	L8
      + 'CbteTipo TEXT,' // COMPROBANTES Tipo	L3
      + 'PtoVta TEXT,' // COMPROBANTES PV	L5
      + 'CbteNro TEXT,' // COMPROBANTES Número		L20
      + 'DespNro TEXT,' // COMPROBANTES Número Despacho  de Importación	L16
      + 'DocTipo TEXT,' // PROVEEDOR Código de Documento del vendedor	L2
      + 'DocNro TEXT,' // PROVEEDOR Número de identificaión del vendedor	L20
      + 'DocNomb TEXT,' // PROVEEDOR Apellido y Nombre del vendedor	L30
      + 'ImpTotal TEXT,' // Totales (cálculo automático)	L15
      + 'ImpNoGra TEXT,' // Monto que no integra el precio neto gravado	L15
      + 'ImpOpEx TEXT,' // Operaciones Exentas	L15
      + 'ImpPercIva TEXT,' // PERCEPCIONES Percepc y retenc. IVA	L15
      + 'ImpPercNac TEXT,' // PERCEPCIONES Perc. otros imp. Nac.	L15
      + 'ImpPercIIBB TEXT,' // PERCEPCIONES IIBB	L15
      + 'ImpPercMuni TEXT,' // PERCEPCIONES Municipales	L15
      + 'ImpImpInt TEXT,' // Impuestos Internos	L15
      + 'MonId TEXT,' // Código de Moneda	L3
      + 'MonCotiz TEXT,' // Tipo de cambio	L10
      + 'IvaCant TEXT,' // Cantidad alícuotas I.V.A.	L1
      + 'CodOper TEXT,' // Código de operación	L1
      + 'ImpCredFisc TEXT,' // Credito Fiscal Computable	L15
      + 'ImpOtrTrib TEXT,' // Otros Tributos	L15
      + 'CUIT TEXT,' // CUIT emisor/corredor	L11
      + 'Denom TEXT,' // Denominación emisor/corredor	L30
      + 'ImpIvaCom TEXT' // IVA comisión	L15
      // +'IvaId1 TEXT,'//Código alícuota IVA 1
      // +'IvaBaseImp1 TEXT,'//Neto Gravado alícuota 1 Importe Total
      // +'IvaAlic1 TEXT,'//IVA alícuota 1
      // +'IvaId2 TEXT,'//Código alícuota IVA 2
      // +'IvaBaseImp2 TEXT,'//Neto Gravado alícuota 2 Importe Total
      // +'IvaAlic2 TEXT,'//IVA alícuota 2
      // +'IvaId3 TEXT,'//Código alícuota IVA 3
      // +'IvaBaseImp3 TEXT,'//Neto Gravado alícuota 3 Importe Total
      // +'IvaAlic3 TEXT'//IVA alícuota 3
      + ')');

    sdb.ExecSQL('CREATE TABLE IF NOT EXISTS SiapCmpCompAlicuota ('
      // Siap Comprobantes de Compras
      + 'Codigo INTEGER,' + 'IvaId TEXT,' // Código alícuota IVA
      + 'IvaBaseImp TEXT,' // Neto Gravado alícuota
      + 'IvaAlic TEXT' // IVA alícuota
      + ')');
  end;
end;

constructor TActualizarBase.Create;
begin
  OnCreate;
end;

destructor TActualizarBase.Destroy;
begin

  inherited;
end;

procedure TActualizarBase.CrearTablaRetPer;
begin
  with DM do
  begin
    sdb.ExecSQL('CREATE TABLE IF NOT EXISTS RetPer (' + ' Codigo INTEGER' +
      ', Tipo  TEXT' + ', NoGra REAL' + ', PagCueIva REAL' + ', PagCueOtr REAL'
      + ', PerIIBB REAL' + ', PerImpMun REAL' + ', ImpInt REAL' +
      ', OtrTrib REAL' + ')');
  end;
end;

procedure TActualizarBase.CrearTablasIva;
begin
  with DM do
  begin
    if not ExisteEnTabla('Iva', '') then
    begin
      CrearTabla('Iva', 'CODIGO', 'INTEGER');
      ActualizarTabla('Iva', 'TASA', 'DOUBLE PRECISION');
      ActualizarTabla('Iva', 'DESCRIPCION', 'VARCHAR(255)');
      ActualizarIVA('3', '0');
      ActualizarIVA('4', '10.5');
      ActualizarIVA('5', '21');
      ActualizarIVA('6', '27');
      ActualizarIVA('8', '5');
      ActualizarIVA('9', '2.5');
    end;
    if not ExisteEnTabla('AlicIva', '') then
    begin
      CrearTabla('AlicIva', 'CODIGO', 'INTEGER');
      ActualizarTabla('AlicIva', 'ID', 'INTEGER');
      ActualizarTabla('AlicIva', 'BASEIMP', 'DOUBLE PRECISION');
      ActualizarTabla('AlicIva', 'IMPORTE', 'DOUBLE PRECISION');
      ActualizarTabla('Operacion', 'ALICIVA', 'INTEGER');
      ActualizarTabla('Venta', 'ALICIVA', 'INTEGER');
      ActualizarTabla('CtaCte', 'ALICIVA', 'INTEGER');
      ActualizarTabla('Presupuesto', 'ALICIVA', 'INTEGER');
      ActualizarTabla('Compra', 'ALICIVA', 'INTEGER');
    end;
  end;
end;

procedure TActualizarBase.CrearTablaCbteAsoc;
begin
  with DM do
  begin
    if not ExisteEnTabla('CbtesAsoc', '') then
    begin
      CrearTabla('CbtesAsoc', 'CODIGO', 'INTEGER');
      ActualizarTabla('CbtesAsoc', 'TIPO', 'INTEGER');
      ActualizarTabla('CbtesAsoc', 'PTOVTA', 'INTEGER');
      ActualizarTabla('CbtesAsoc', 'NRO', 'VARCHAR(255)');
      ActualizarTabla('CbtesAsoc', 'CUIT', 'VARCHAR(255)');
      ActualizarTabla('CbtesAsoc', 'CBTEFCH', 'VARCHAR(255)');
      ActualizarTabla('Operacion', 'CBTESASOC', 'INTEGER');
      ActualizarTabla('Venta', 'CBTESASOC', 'INTEGER');
      ActualizarTabla('CtaCte', 'CBTESASOC', 'INTEGER');
      ActualizarTabla('Presupuesto', 'CBTESASOC', 'INTEGER');
      ActualizarTabla('Compra', 'CBTESASOC', 'INTEGER');
    end;
  end;
end;

procedure TActualizarBase.ActualizarTriggerFecha;
var
  a, b: string;
begin
  with DM do
  begin
    a := ' ACTIVE BEFORE INSERT';
    b := ' IF (new."FECHA" IS NULL) THEN new."FECHA" = cast( ''now'' as timestamp);';
    ActualizarTrigger('CompraFecha_BI', a, b);
    ActualizarTrigger('ContratoFECHA_BI', a, b);
    ActualizarTrigger('CtaCteFECHAupdate', a, b);
    ActualizarTrigger('CtaCteFecha_BI', a, b);
    ActualizarTrigger('CtaCteItemFECHA_BI', a, b);
    ActualizarTrigger('FormaPagoFECHA_BI1', a, b);
    ActualizarTrigger('LibroDiarioFecha_BI', a, b);
    ActualizarTrigger('LibroIVAcompraFecha_BI', a, b);
    ActualizarTrigger('LibroIVAventaFecha_BI', a, b);
    ActualizarTrigger('MovCaja_FECHA', a, b);
    ActualizarTrigger('OperacionFECHA_BI', a, b);
    ActualizarTrigger('PresupuestoFecha_BI', a, b);
    ActualizarTrigger('RendidoVendedorFecha_BI', a, b);
    ActualizarTrigger('VentaFecha_BI', a, b);
  end;
end;

//procedure TActualizarBase.AgregarEnvio;
//var
//  n, t: string;
//  i: integer;
//  tb: TArray<string>;
//begin
//  with DM do
//  begin
//    n := 'ENVIO';
//    if (not ExisteEnTabla('Operacion', n)) then
//    begin
//      t := 'DOUBLE PRECISION DEFAULT 0';
//      tb := TArray<string>.Create('Operacion', 'Venta', 'Compra', 'Presupuesto',
//        'CtaCte');
//      for i := 0 to High(tb) do
//        ActualizarTabla(tb[i], n, t);
//    end;
//  end;
//end;

procedure TActualizarBase.AgregarCampoEnTablas;
var i: integer;
begin
  with DM do
    for i := 0 to High(tablas) do
      ActualizarTabla(tablas[i], nombre, tipo);
end;

procedure TActualizarBase.Articulo;
var t,c :string;
begin
  t := 'Articulo';
  with DM do
  begin
    ActualizarTabla(t, 'DESLARGA', 'BLOB');
    ActualizarTabla(t, 'RESERVA', 'VARCHAR(10)');
    ActualizarTabla(t, 'INDIVIDUAL', 'SMALLINT');
    ActualizarTabla(t, 'MODIFICADO', 'TIMESTAMP');
    ActualizarTabla(t, 'SLUG', 'VARCHAR(20)');
    ActualizarTabla(t, 'ENLACE', 'VARCHAR(255)');
    ActualizarTabla(t, 'TIPO', 'VARCHAR(20)');
    ActualizarTabla(t, 'DESTACADO', 'SMALLINT');
    ActualizarTabla(t, 'VISIBLE', 'VARCHAR(20)');
    ActualizarTabla(t, 'REBAJADODESDE', 'TIMESTAMP');
    ActualizarTabla(t, 'REBAJADOHASTA', 'TIMESTAMP');
    ActualizarTabla(t, 'VIRTUAL', 'SMALLINT');
    ActualizarTabla(t, 'DESCARGAR', 'SMALLINT');
    ActualizarTabla(t, 'DESCARGA', 'INTEGER');
    ActualizarTabla(t, 'DESCARGARLIMITE', 'INTEGER');
    ActualizarTabla(t, 'DESCARGAREXPIRA', 'INTEGER');
    ActualizarTabla(t, 'URLEXTERNA', 'VARCHAR(255)');
    ActualizarTabla(t, 'BOTON', 'VARCHAR(255)');
    ActualizarTabla(t, 'ESTADOIMPUESTO', 'VARCHAR(20)');
    ActualizarTabla(t, 'CLASEIMPUESTO', 'VARCHAR(20)');
    ActualizarTabla(t, 'ESTADOSTOCK', 'VARCHAR(20)');
    ActualizarTabla(t, 'PESO', 'DOUBLE PRECISION');
    ActualizarTabla(t, 'DIMENSION', 'INTEGER');
    ActualizarTabla(t, 'CLASEENVIO', 'VARCHAR(50)');
    ActualizarTabla(t, 'VALORACION', 'SMALLINT');
    ActualizarTabla(t, 'VENTADIRIGIDA', 'INTEGER');
    ActualizarTabla(t, 'VENTACRUZADA', 'INTEGER');
    ActualizarTabla(t, 'PADRE', 'INTEGER');
    ActualizarTabla(t, 'NOTACOMPRA', 'BLOB');
    ActualizarTabla(t, 'ETIQUETA', 'INTEGER');
    ActualizarTabla(t, 'ATRIBUTO', 'INTEGER');
    ActualizarTabla(t, 'ATRIBUTOPORDEFECTO', 'INTEGER');
    ActualizarTabla(t, 'META', 'INTEGER');
    ActualizarTabla(t, 'USD', 'DOUBLE PRECISION');
  end;
end;

procedure TActualizarBase.ActualizarImprimir(reporte: string);
var
  c: string;
begin
  with DM do
  begin
    Query.SQL.Text := 'Select * from "Imprimir" WHERE "Imprimir".REPORTE = ' +
      QuotedStr(reporte);
    Query.Open;
    if Query.RecordCount = 0 then
    begin
      Query.Close;
      c := IntToStr(UltimoRegistro('Imprimir', 'CODIGO'));
      BaseDatosFB.ExecSQL
        ('INSERT INTO "Imprimir" (CODIGO, DESCRIPCION, REPORTE) VALUES (' + c +
        ', ' + QuotedStr(reporte) + ', ' + QuotedStr(reporte) + ')');
    end;
  end;
end;

end.
