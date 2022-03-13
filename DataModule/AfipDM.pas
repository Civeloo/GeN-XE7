unit AfipDM;

interface

uses
  System.SysUtils, System.Classes, DataModule, Windows, System.Variants,
  ComObj, IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  JSON, REST.Types, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  Xml.xmldom, Xml.XMLIntf, Soap.InvokeRegistry, Soap.Rio, Soap.SOAPHTTPClient,
  Xml.Win.msxmldom, Xml.XMLDoc, ShellAPI, DateUtils, Winapi.Messages, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ExtDlgs, RestDM, System.Net.URLClient;

type
  TAfipDataModule = class(TDataModule)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    XMLDocument1: TXMLDocument;
    HTTPRIO1: THTTPRIO;
    procedure AfipWsaa(path, Certificado, ClavePrivada: string);
    procedure AfipWsfev1(
    tipo_cbte, punto_vta, tipo_doc, presta_serv, id,
    cbt_desde, cbt_hasta : Integer;
    fecha, nro_doc, imp_total, imp_tot_conc, imp_neto, impto_liq,
    impto_liq_rni, imp_op_ex, fecha_cbte, fecha_venc_pago,
    fecha_serv_desde, fecha_serv_hasta, venc : String;
    moneda_id , moneda_ctz : String ;
    bi21, i21, bi105, i105: String
    );
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    WSAA: Variant;
    procedure GeneraTiketSF;
    procedure CreaXMLFirmado();
    procedure EnviaTicket(ta: widestring);
    procedure ExtraerTokenSing;
    function GenUniqueId (D: TDateTime): Integer;
    function LimpiaTicket(archivo: String; deaca: String; hastaaca: String): String;
    function LeeArchivo(const FileName: String): AnsiString;
  public
    { Public declarations }
    procedure Generar;
    procedure ListaPuntoVenta;
    procedure ListaOpcional;
    procedure ListaConceptos;
    procedure ListaDocumentos;
    procedure ListaTributos;
    procedure ListaComprobantes;
    function ObtieneUltimoComprobante(puntoventa, idcomprobante: integer) : Int64;
    procedure ConsultaComprobantes(puntoVenta, idComprobante: integer; nroComprobante : Int64);
    function SolicitaCAE(f:TJSONObject):TJSONValue;
    function FacturaAfip( CbteFch, tipocbte, concepto, DocTipo, DocNro, Cbte,
    ImpNeto, ImpTotal, ImpTotConc, ImpIVA, ImpTrib, ImpOpEx, MonCotiz,
    regfeasocTipo, regfeasocNro,
    regfetribId, regfetribBaseImp, regfetribAlic, regfetribImporte,
    //n10, n21, i10, i21,//regfeivaId, regfeivaBaseImp, regfeivaImporte,
    MonId, regfetribDesc, FchServDesde,
    FchServHasta, FchVtoPago, razon, nombre, direccion, articulo : string) : TJSONValue;

  end;

var
  AfipDataModule: TAfipDataModule;
  ruta, expirationTA, generationTA, proximaFactura: string;
  token, sign: WideString;
//  cuit: INT64;
  mToken, mSign, m : TStringList;
  wsfeCae, wsfeVto, wsfeComp : string;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses service, LoginCms1;
//uses UHomoLoginCMS, UHomoWsfev1;//modo prueba Homologacion
//uses ULoginCMS, UWsfev1; // Modo Produccion

{$R *.dfm}

Procedure TAfipDataModule.AfipWsaa;
{ Ejemplo de Uso de Interface COM con Web Services AFIP (PyAfipWs)
  2009 (C) Mariano Reingart <mariano@nsis.com.ar> }
// program Project1;
// {$APPTYPE CONSOLE}
// uses
// ActiveX,
// ComObj,
// FMX.Dialogs,
// SysUtils;
var
  tra, cms, ta: String;
begin
  // CoInitialize(nil);
  // Crear objeto interface Web Service Autenticacin y Autorizacin
  WSAA := CreateOleObject('WSAA');
  // Generar un Ticket de Requerimiento de Acceso (TRA)
  tra := WSAA.CreateTRA;
OutputDebugString(PChar(VarToStr(tra)));// WriteLn(tra);
  // Especificar la ubicacion de los archivos certificado y clave privada
  // path := GetCurrentDir + '';
  // Certificado: certificado es el firmado por la AFIP
  // ClavePrivada: la clave privada usada para crear el certificado
  // Certificado := '\ghf.crt'; // certificado de prueba
  // ClavePrivada := '\ghf.key'; // clave privada de prueba' +
  // Generar el mensaje firmado (CMS)
  cms := WSAA.SignTRA(tra, path + Certificado, path + ClavePrivada);
OutputDebugString(PChar(VarToStr(cms)));// WriteLn(cms);
  // Llamar al web service para autenticar:
  ta := WSAA.CallWSAA(cms, 'https://wsaahomo.afip.gov.ar/ws/services/LoginCms');
  // Homologacin
  // ta = WSAA.CallWSAA(cms, 'https://wsaa.afip.gov.ar/ws/services/LoginCms'); // Produccin
  // Imprimir el ticket de acceso, ToKen y Sign de autorizacin
OutputDebugString(PChar(VarToStr(ta)));// WriteLn(ta);
OutputDebugString(PChar(VarToStr('Token:' + WSAA.Token)));// WriteLn
OutputDebugString(PChar(VarToStr('Sign:' + WSAA.Sign)));// WriteLn
  // Una vez obtenido, se puede usar el mismo token y sign por 6 horas
  // (este perodo se puede cambiar)
end;

Procedure TAfipDataModule.AfipWsfev1;
var
  WSFEv1: Variant;//,WSAA
  tra, Certificado, ClavePrivada, cms, ta: String;//, path
  qty, LastId, LastCBTE, cae, ok , OkUlt: Variant;
  cache, url_wsdl, proxy: String;
begin
  AfipWsaa(path, 'crt\certificado.crt', 'crt\privada.key');
  cache := ''; // directorio temporal (usar predeterminado)
  url_wsdl := 'https://wswhomo.afip.gov.ar/wsfev1/service.asmx?WSDL ';// usar servicios1 para producción
  proxy:= '';
    // Crear objeto interface Web Service de Factura Electrnica
  WSFEv1 := CreateOleObject('WSFEv1');
  // Setear tocken y sing de autorizacin (pasos previos)
  WSFEv1.Token := WSAA.Token;
  WSFEv1.Sign := WSAA.Sign;
  // CUIT del emisor (debe estar registrado en la AFIP)
//  WSFEv1.Cuit := '23000000000';//
  WSFEv1.Cuit := CUIT;
  WSFEv1.LanzarExcepciones := False;
  // Conectar al Servicio Web de Facturacin
  ok := WSFEv1.Conectar(cache, url_wsdl, proxy); // homologacin
  // ok := WSFE.Conectar('https://wsw.afip.gov.ar/wsfe/service.asmx'); // produccin
  // Llamo a un servicio nulo, para obtener el estado del servidor (opcional)
  WSFEv1.Dummy;
OutputDebugString(PChar(VarToStr('appserver status ' + WSFEv1.AppServerStatus)));
OutputDebugString(PChar(VarToStr('dbserver status ' + WSFEv1.DbServerStatus)));//WriteLn
OutputDebugString(PChar(VarToStr('authserver status ' + WSFEv1.AuthServerStatus)));
  // Recupera cantidad mxima de registros (opcional)
  // qty := WSFE.RecuperarQty;
  // Recupera ltimo nmero de secuencia ID
//   LastId := WSFEv1.RecuperaLastCMP();
  // Recupero ltimo nmero de comprobante para un punto de venta y tipo (opcional)
//tipo_cbte := 1;
//punto_vta := 1;
LastCBTE := WSFEv1.CompUltimoAutorizado(punto_vta, tipo_cbte); //+ 1
  if VarIsNull(LastCBTE) then  //?unassigned
    LastCBTE := 1
  else
    LastCBTE := LastCBTE + 1;// LastCBTE := WSFEv1.CompUltimoAutorizado(punto_vta, tipo_cbte) + 1;
//OutputDebugString(PChar(VarToStr(WSFEv1.FECompUltimoAutorizado)));
  // Establezco los valores de la factura o lote a autorizar:
DateTimeToString(Fecha, 'yyyymmdd', StrToDateTime(Fecha));
id := LastId + 1; presta_serv := 3;
cbt_desde := LastCBTE ;
cbt_hasta := LastCBTE ;
fecha_cbte := Fecha; fecha_venc_pago := Fecha;
  // Fechas del perodo del servicio facturado (solo si presta_serv = 1)
fecha_serv_desde := Fecha; fecha_serv_hasta := Fecha;
  // Llamo al WebService de Autorizacin para obtener el CAE
ok := WSFEv1.CrearFactura ( presta_serv,
tipo_doc, nro_doc, tipo_cbte, punto_vta,
cbt_desde, cbt_hasta, imp_total, imp_tot_conc, imp_neto,
impto_liq, impto_liq_rni, imp_op_ex, fecha_cbte, fecha_venc_pago,
fecha_serv_desde, fecha_serv_hasta,moneda_id,moneda_ctz ); // si presta_serv = 0 no pasar estas fechas
//Agrego tasas de IVA
//id := 5 ; // 21%
//bi21 := '100.00';
//i21 := '21.00';
//ok := WSFEv1.AgregarIva(id, bi21, i21) ;
  if ((StrToFloat(i21) <> 0) or (StrToFloat(i105) <> 0)) then
  begin
    if (StrToFloat(i21) > 0) then
      ok := WSFEv1.AgregarIva(5, bi21, i21);
    if (StrToFloat(i105) > 0) then
      ok := WSFEv1.AgregarIva(6, bi105, i105);
  end;
  { If tipo_cbte = 1 Then // solo para facturas A
    begin
    ok := WSFEv1.AgregarOpcional(5, '02'); // IVA Excepciones (01: Locador/Prestador, 02: Conferencias, 03: RG 74, 04: Bienes de cambio, 05: Ropa de trabajo, 06: Intermediario).
    ok := WSFEv1.AgregarOpcional(61, '80'); // Firmante Doc Tipo (80: CUIT, 96: DNI, etc.)
    ok := WSFEv1.AgregarOpcional(62, '20267565393'); // Firmante Doc Nro
    ok := WSFEv1.AgregarOpcional(7, '01'); // Car?er del Firmante (01: Titular, 02: Director/Presidente, 03: Apoderado, 04: Empleado)
    End; }
  WSFEv1.Reprocesar := True;
  // cae :=
  cae := WSFEv1.CAESolicitar;
  If WSFEv1.Excepcion <> '' Then
  begin
    showmessage(WSFEv1.Excepcion);
  OutputDebugString(PChar(VarToStr(WSFEv1.Excepcion)));
    showmessage(WSFEv1.Traceback);
  OutputDebugString(PChar(VarToStr(WSFEv1.Traceback)));
    showmessage(WSFEv1.XmlRequest);
  OutputDebugString(PChar(VarToStr(WSFEv1.XmlRequest)));
    showmessage(WSFEv1.XmlResponse);
  OutputDebugString(PChar(VarToStr(WSFEv1.XmlResponse)));
  end;
  OutputDebugString(PChar(VarToStr('Resultado ' + WSFEv1.Resultado)));
  OutputDebugString(PChar(VarToStr('CAE' + WSFEv1.cae)));
  // ' Imprimo pedido y respuesta XML para depuracin (errores de formato)
  OutputDebugString(PChar(VarToStr(WSFEv1.XmlRequest)));
  OutputDebugString(PChar(VarToStr(WSFEv1.XmlResponse)));
  OutputDebugString(PChar(VarToStr(WSFEv1.XmlResponse)));
OutputDebugString(PChar(VarToStr( WSFEv1.XmlResponse )));
  If WSFEv1.errmsg <> '' Then
  OutputDebugString(PChar(VarToStr(WSFEv1.errmsg)));
  OutputDebugString(PChar(VarToStr('Obs ' + WSFEv1.obs)));
OutputDebugString(PChar(VarToStr( 'Resultado ' + WSFEv1.Resultado)));
  OutputDebugString(PChar(VarToStr('Resultado: ' + WSFEv1.Resultado)));
OutputDebugString(PChar(VarToStr( 'CAE' + WSFEv1.CAE)));
  OutputDebugString(PChar(VarToStr('cae: ' + WSFEv1.cae)));
  // cae := WSFEv1.CAE() ;
//  OutputDebugString(PChar(VarToStr('CAE: ' + cae)));
//  showmessage('Presione Enter para terminar');
  // ReadLn;
  // CoUninitialize;
end;

function TAfipDataModule.FacturaAfip;
var
  jsRequest, J, JSONAlicIva10, JSONAlicIva21, JSONIva,
  JSONAlicIvaItem, JSONCbteAsocItem, JSONTributoItem : TJSONObject;
  JSONAlicIva, JSONCbteAsoc, JSONTributo : TJSONArray;
//  cuit, pass, ptovta : string;
  local: boolean;
begin
  with dm do begin
    LeerINI;
    jsRequest := TJSONObject.Create();
    if cuit='' then cuit := afipUsr;
    if DocNro='' then
      if StrToFloat( ImpTotal )<10000 then begin
        DocTipo:='99';
        DocNro:='0';
      end
      else
      begin
        DocTipo:='80';
        DocNro:='20222222223';//https://www.afip.gob.ar/genericos/guiavirtual/consultas_detalle.aspx?id=4359106
        //      DocNro:='23000000000';
      end
    else
      if DocNro.Length>1 then
        if DocNro.Length < 11  then DocTipo := '96' else DocTipo := '80';
    if (WebUsr<>'') then jsRequest.AddPair('Id', WebUsr);
    //ptovta:=IntToStr(dm.ObtenerConfig('Empresa'));
    jsRequest.AddPair('PtoVta', PuntoVenta);//ptovta);
    jsRequest.AddPair('TipoCbte', tipocbte);
    jsRequest.AddPair('Cuit', cuit);
    if (WebPsw<>'') then jsRequest.AddPair('Pass', WebPsw);
    jsRequest.AddPair('Concepto', concepto);
    if (razon<>'') then jsRequest.AddPair('Razon', razon);
    if (nombre<>'') then jsRequest.AddPair('Nombre', nombre);
    if (direccion<>'') then jsRequest.AddPair('Direccion', direccion);
    jsRequest.AddPair('DocTipo', DocTipo);
    jsRequest.AddPair('DocNro', DocNro);
//    jsRequest.AddPair('CbteFch', CbteFch);
    jsRequest.AddPair('Cbte', Cbte);//'1');
    jsRequest.AddPair('CbteHasta', Cbte);//'1');
    if (articulo<>'') then jsRequest.AddPair('Articulo', articulo);
    jsRequest.AddPair('ImpNeto', ImpNeto);
    jsRequest.AddPair('ImpTotConc', ImpTotConc);
    jsRequest.AddPair('ImpIVA', ImpIVA);
    jsRequest.AddPair('ImpTrib', ImpTrib);
    jsRequest.AddPair('ImpOpEx', ImpOpEx);
    jsRequest.AddPair('ImpTotal', ImpTotal);
    if (FchServDesde<>'') then jsRequest.AddPair('FchServDesde', FchServDesde);
    if (FchServHasta<>'') then jsRequest.AddPair('FchServHasta', FchServHasta);
    if (FchVtoPago<>'') then jsRequest.AddPair('FchVtoPago', FchVtoPago);
    jsRequest.AddPair('MonId', MonId);
    jsRequest.AddPair('MonCotiz', MonCotiz);
//    jsRequest.AddPair('regfeasocTipo', regfeasocTipo);
//    jsRequest.AddPair('regfeasocPtoVta', ptovta);
//    jsRequest.AddPair('regfeasocNro', regfeasocNro);
    if (regfeasocNro<>'0') then
    begin
        JSONCbteAsoc := TJSONArray.Create;
              begin
                  JSONCbteAsocItem := TJSONObject.Create;
                  with JSONCbteAsocItem do
                  begin
                    AddPair('Tipo', regfeasocTipo);
                    AddPair('PtoVta', PuntoVenta);//ptovta);
                    AddPair('Nro', regfeasocNro);
                  end;
                  JSONCbteAsoc.Add(JSONCbteAsocItem);
              end;
        jsRequest.AddPair('CbteAsoc', JSONCbteAsoc);
    end;
//    jsRequest.AddPair('regfetribId', regfetribId);
//    jsRequest.AddPair('regfetribDesc', regfetribDesc);
//    jsRequest.AddPair('regfetribBaseImp', regfetribBaseImp);
//    jsRequest.AddPair('regfetribAlic', regfetribAlic);
//    jsRequest.AddPair('regfetribImporte', regfetribImporte);
    if (regfetribId<>'') then
    begin
        JSONTributo := TJSONArray.Create;
            begin
                JSONTributoItem := TJSONObject.Create;
                with JSONTributoItem do
                begin
                  AddPair('Id', regfetribId);
                  AddPair('Desc', regfetribDesc);
                  AddPair('BaseImp', regfetribBaseImp);
                  AddPair('Alic', regfetribAlic);
                  AddPair('Importe', regfetribImporte);
                end;
                JSONTributo.Add(JSONTributoItem);
            end;
        jsRequest.AddPair('Tributo', JSONTributo);
    end;
//    jsRequest.AddPair('regfeivaId', regfeivaId);
//    jsRequest.AddPair('regfeivaBaseImp', regfeivaBaseImp);
//    jsRequest.AddPair('regfeivaImporte', regfeivaImporte);

//    jsRequest.AddPair('n10', n10);
//    jsRequest.AddPair('i10', i10);
//    jsRequest.AddPair('n21',n21);
//    jsRequest.AddPair('i21',i21);


    with mtIVA do
      if RecordCount>0 then
      begin
        JSONAlicIva := TJSONArray.Create;
        First;
        while not Eof do
        begin
            JSONAlicIvaItem := TJSONObject.Create;
            with JSONAlicIvaItem do
            begin
              AddPair('Id', TraerAlicuota(FieldByName('Tasa').AsString));
              AddPair('BaseImp', FieldByName('Neto').AsString);
              AddPair('Importe', FieldByName('Imp').AsString);
            end;
            JSONAlicIva.Add(JSONAlicIvaItem);
          Next;
        end;
        jsRequest.AddPair('AlicIva', JSONAlicIva);
      end;

//    if n10<>'' then
//    begin
//      JSONAlicIva10 := TJSONObject.Create;
//      JSONAlicIva10.AddPair('Id', '4');
//      JSONAlicIva10.AddPair('BaseImp', n10);
//      JSONAlicIva10.AddPair('Importe', '10.5');
//      JSONAlicIva.AddPair(JSONAlicIva10.AddPair);
//    end;
//    if n21<>'' then
//    begin
//      JSONAlicIva21 := TJSONObject.Create;
//      JSONAlicIva21.AddPair('Id', '5');
//      JSONAlicIva21.AddPair('BaseImp', n21);
//      JSONAlicIva21.AddPair('Importe', '21');
//      JSONAlicIva.AddPair(JSONAlicIva21.AddPair);
//    end;
//    JSONIva := TJSONObject.Create;
//    JSONIva.AddPair('AlicIva', JSONAlicIva);
//    jsRequest.AddPair('regfeiva', JSONIva);

    local := (webUpd='');//true;
    if local then
      result := SolicitaCAE(jsRequest)
    else
    begin
//      try
//        RESTRequest1.ResetToDefaults;
//        RESTClient1.ResetToDefaults;
//        RESTClient1.BaseURL := afipURL;
//        RESTRequest1.Resource := afipRes;
//        RESTRequest1.Method:=rmPOST;
//        RESTRequest1.Params.AddItem('body',jsRequest.ToString, TRESTRequestParameterKind.pkREQUESTBODY, [poDoNotEncode], TRESTContentType.ctAPPLICATION_JSON);
//        RESTRequest1.Execute();
//      except
//        on e : exception do
//        begin
//          ShowMessage ('Clase de error: ' + e.ClassName + chr(13) + chr(13) +
//              'Mensaje del error: ' + e.Message);
//              result:=nil;
//          exit
//        end;
//      end;
//      jsRequest.Free();
//      result := RESTRequest1.Response.JSONValue;
      DMR := TDMR.Create(Self);
        try
          result := DMR.WebWsfe(jsRequest.ToString);
        finally
          jsRequest.Free();
          DMR.Free;
        end;
    end;
  end;
end;


procedure TAfipDataModule.ExtraerTokenSing;
var
   XML : TXMLDocument;
   ChildNode : IXMLNode;
   i,j : Integer;
begin
   XML := TXMLDocument.Create(Self);
   try
      XML.Active := True;

      // Carga el archivo creado
      XML.LoadFromFile(ruta + 'TA.XML');

      // Lee todos los Nodos o Registros
     // for i:= 0 to XML.DocumentElement.ChildNodes.Count - 1 do
      //begin
         // Lee un Nodo o Registro
         ChildNode := XML.DocumentElement.ChildNodes[0];
         // Lee cada Nodo Hijo o Campo del registro
         //Edit3.Text := ChildNode.ChildNodes['uniqueId'].Text;
         expirationTA := ChildNode.ChildNodes['expirationTime'].Text;
         generationTA := ChildNode.ChildNodes['generationTime'].Text;

         ChildNode := XML.DocumentElement.ChildNodes[1];
         token := ChildNode.ChildNodes['token'].Text;
         sign:= ChildNode.ChildNodes['sign'].Text;
      //end;
      XML.Active := False;
   finally
      XML := nil;
   end;

   mToken.Add(token);
   mSign.Add(sign);

end;

procedure TAfipDataModule.EnviaTicket(ta: widestring);
var
  WS: LoginCMS;
  s: widestring;
begin
 // s := (HTTPRIO1 as LoginCms).loginCms(m.Text);
  WS := GetLoginCMS;
  s := WS.loginCms(ta);
  m.Text := s;
  m.SaveToFile(ruta + 'TA.XML');
end;

function  TAfipDataModule.LeeArchivo(const FileName: String): AnsiString;
var
  Stream: TFileStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead);
  try
    SetLength(Result, Stream.Size);
    Stream.ReadBuffer(Pointer(Result)^, Stream.Size);
  finally
    Stream.Free;
  end;
end;

function TAfipDataModule.LimpiaTicket(archivo: String; deaca: String; hastaaca: String): String;
var text:string;
begin
  text := LeeArchivo(archivo);
  Delete(text, 1, AnsiPos(deaca, text) + Length(deaca) - 1);
  SetLength(text, AnsiPos(hastaaca, text) - 1);
  Result := text;
end;

procedure TAfipDataModule.CreaXMLFirmado();
var p1, xml: string;
    r: PAnsiChar;
begin
//  m.Clear;
//  m.Add('c:');
//  m.Add('cd /');
//  m.Add('cd OpenSSL-Win32');
//  m.Add('cd bin');
//  m.Add('openssl smime -sign -in '+ruta+'ticketsf.xml -out '+ruta+'ticketf.xml -inkey '+ruta+'MiClavePrivada -signer '+ruta+'certificado.crt -outform PEM -nodetach ');
//  m.SaveToFile(ruta + 'firmar.bat');
//  m.Clear;

  xml := ' smime -sign -in "'+ruta+'ticketsf.xml" -out "'+ruta+'ticketf.xml" -inkey "'+ruta+'MiClavePrivada" -signer "'+ruta+'certificado.crt" -outform PEM -nodetach';
  with dm do if existeOpenSSL then Ejecutar(openSSl+xml);

  sleep(1000);
//ShellExecute(0, 'open', PChar(VarToStr(ruta + 'firmar.bat')), 'param1 param2', nil,  SW_HIDE);
end;

procedure TAfipDataModule.DataModuleCreate(Sender: TObject);
begin
  ruta := Path + 'db\';
  DM.TraerConfig;
//  cuit := STRTOINT64(DM.CUIT); //CUIT DE LA EMPRESA Q FACTURA
  m := TStringList.Create;
  mToken := TStringList.Create;
  mSign := TStringList.Create;
end;

function TAfipDataModule.GenUniqueId (D: TDateTime): Integer;
var i: real;
    s: string;
begin
  s:= FloatToStr(now);
  i:= strtoFloat(s);
  Result := Trunc(i);
end;

procedure TAfipDataModule.GeneraTiketSF;
var
  MDate, F1, F2: TDateTime;
  Uni, Gen, Exp: string;
  XML : TXMLDocument;
  ChildNode, cc : IXMLNode;
begin
  MDate := Now;
  F1    := IncHour(MDate, - Abs(4));
  F2    := IncHour(MDate, + Abs(4));
  Uni   := inttostr(GenUniqueId(F1));
  Gen   := FormatDateTime('yyyy-MM-dd', F1)+'T'+FormatDateTime('hh:nn:ss', F1);
  Exp   := FormatDateTime('yyyy-MM-dd', F2)+'T'+FormatDateTime('hh:nn:ss', F2);

  //genera XML
   XML := TXMLDocument.Create(nil);
   try
     XML.Active := true;
     // Crea el cuerpo princial del documento XML
     XML.AddChild('loginTicketRequest');


        // Crea el Nodo Raiz o Registro
        ChildNode := XML.DocumentElement.AddChild('header');
        // Crea el Nodo Hijo o Campo del Registro
        ChildNode.AddChild('uniqueId').text := uni;
        ChildNode.AddChild('generationTime').text := gen;
        ChildNode.AddChild('expirationTime').text := exp;

        ChildNode := XML.DocumentElement.AddChild('service');
        ChildNode.NodeValue := 'wsfe';

     XML.Active := true;

     // Salva el archivo creado
     XML.SaveToFile(ruta + 'ticketsf.xml');

     XML.Active := False;

   finally
     XML := nil;
   end;

end;

procedure TAfipDataModule.Generar;
var TA: widestring;
begin
  GeneraTiketSF;
  sleep(1000);
  CreaXMLFirmado;
  sleep(1000);
  TA:= LimpiaTicket(ruta+'ticketf.xml','-----BEGIN PKCS7-----','-----END PKCS7-----');
  sleep(1000);
  EnviaTicket(TA);
  sleep(1000);
  ExtraerTokenSing;
end;

procedure TAfipDataModule.ListaPuntoVenta;//LISTA DE PUNTOS DE VENTA
var
  FEAuth : FEAuthRequest;
  x : Integer;
  s: FEPtoVentaResponse;
  WS: ServiceSoap;
begin
////  screen.Cursor := crHourGlass;

  WS := GetServiceSoap(false,'', httprio1);

  m.Clear;

  FEAuth  := FEAuthRequest.Create;
  try
    ExtraerTokenSing;
    FEAuth.Token := token;
    FEAuth.Sign  := sign;
    FEAuth.Cuit  := StrToInt64(cuit);

    s := WS.FEParamGetPtosVenta(FEAuth);

    if (Length(s.ResultGet) > 0) then
    begin
      for x := 0 to high( s.ResultGet ) do
      m.Add(
        s.ResultGet[x].EmisionTipo+' || '+
        s.ResultGet[x].Bloqueado+' || '+
        s.ResultGet[x].FchBaja );
     end;


      if (Length(s.Errors) > 0) then
        showmessage(s.Errors[0].Msg);

  finally
    FEAuth.Free;
  end;
////  screen.Cursor := crDefault;
end;

procedure TAfipDataModule.ListaOpcional;//LISTA DE OPCIONAL
var
  FEAuth : FEAuthRequest;
  x : Integer;
  s: OpcionalTipoResponse;
  WS: ServiceSoap;
begin
////  screen.Cursor := crHourGlass;

  WS := GetServiceSoap(false,'', httprio1);

  FEAuth  := FEAuthRequest.Create;
  try
    FEAuth.Token := token;
    FEAuth.Sign  := sign;
    FEAuth.Cuit  := StrToInt64(cuit);

    m.Clear;

    s := WS.FEParamGetTiposOpcional(FEAuth);

    if (Length(s.ResultGet) > 0) then
    begin
      for x := 0 to high( s.ResultGet ) do
      m.Add(
        s.ResultGet[x].id+' || '+
        s.ResultGet[x].Desc+' || '+
        s.ResultGet[x].FchDesde+' || '+
        s.ResultGet[x].FchHasta );
     end;


      if (Length(s.Errors) > 0) then
showmessage(s.Errors[0].Msg);

  finally
    FEAuth.Free;
  end;
////  screen.Cursor := crDefault;
end;

procedure TAfipDataModule.ListaConceptos;//LISTA DE CONCEPTOS
var
  FEAuth : FEAuthRequest;
  x : Integer;
  s: ConceptoTipoResponse;
  WS: ServiceSoap;
begin
////  screen.Cursor := crHourGlass;

  WS := GetServiceSoap(false,'', httprio1);

  FEAuth  := FEAuthRequest.Create;
  try
    FEAuth.Token := token;
    FEAuth.Sign  := sign;
    FEAuth.Cuit  := StrToInt64(cuit);

    m.Clear;

    s := WS.FEParamGetTiposConcepto(FEAuth);

    if (Length(s.ResultGet) > 0) then
    begin
      for x := 0 to high( s.ResultGet ) do
      m.Add(
        INTTOSTR(s.ResultGet[x].id)+' || '+
        s.ResultGet[x].Desc+' || '+
        s.ResultGet[x].FchDesde+' || '+
        s.ResultGet[x].FchHasta );
     end;

      if (Length(s.Errors) > 0) then
showmessage(s.Errors[0].Msg);

  finally
    FEAuth.Free;
    s.Free;
  end;
////  screen.Cursor := crDefault;

end;

procedure TAfipDataModule.ListaDocumentos;//LISTA DE DOCUMENTOS
var
  FEAuth : FEAuthRequest;
  x : Integer;
  s: DocTipoResponse;
  WS: ServiceSoap;
begin
//  screen.Cursor := crHourGlass;

  WS := GetServiceSoap(false,'', httprio1);

  FEAuth  := FEAuthRequest.Create;
  try
    FEAuth.Token := token;
    FEAuth.Sign  := sign;
    FEAuth.Cuit  := StrToInt64(cuit);

    m.Clear;

    s := WS.FEParamGetTiposDoc(FEAuth);

    if (Length(s.ResultGet) > 0) then
    begin
      for x := 0 to high( s.ResultGet ) do
      m.Add(
        INTTOSTR(s.ResultGet[x].id)+' || '+
        s.ResultGet[x].Desc+' || '+
        s.ResultGet[x].FchDesde+' || '+
        s.ResultGet[x].FchHasta );
     end;

    if (Length(s.Errors) > 0) then
      showmessage(s.Errors[0].Msg);

  finally
    FEAuth.Free;
    s.Free;
  end;
//  screen.Cursor := crDefault;
end;

procedure TAfipDataModule.ListaTributos;//LISTA DE TRIBUTOS
var
  FEAuth : FEAuthRequest;
  WS: ServiceSoap;
  x : Integer;
  s: FETributoResponse;

begin
////  screen.Cursor := crHourGlass;

  WS := GetServiceSoap(false,'', httprio1);

  FEAuth  := FEAuthRequest.Create;
  try
    FEAuth.Token := token;
    FEAuth.Sign  := sign;
    FEAuth.Cuit  := StrToInt64(cuit);

    m.Clear;

    s := WS.FEParamGetTiposTributos(FEAuth);

    if (Length(s.ResultGet) > 0) then
    begin
      for x := 0 to high( s.ResultGet ) do
      m.Add(
        INTTOSTR(s.ResultGet[x].id)+' || '+
        s.ResultGet[x].Desc+' || '+
        s.ResultGet[x].FchDesde+' || '+
        s.ResultGet[x].FchHasta );
     end;

      if (Length(s.Errors) > 0) then
showmessage(s.Errors[0].Msg);

  finally
    FEAuth.Free;
  end;
////  screen.Cursor := crDefault;

end;

procedure TAfipDataModule.ListaComprobantes;//LISTA DE COMPROBANTES
var
  FEAuth : FEAuthRequest;
  x : Integer;
  s: CbteTipoResponse;
  WS: ServiceSoap;
begin
  WS := GetServiceSoap(false,'', httprio1);

  FEAuth  := FEAuthRequest.Create;
  try
    FEAuth.Token := token;
    FEAuth.Sign  := sign;
    FEAuth.Cuit  := StrToInt64(cuit);


    s := WS.FEParamGetTiposCbte(FEAuth);
    m.Clear;

    if (Length(s.ResultGet) > 0) then
    begin

      for x := 0 to high( s.ResultGet ) do
      begin
        //registra tipos de comprobante

        m.Add(INTTOSTR(s.ResultGet[x].Id));
        m.Add(s.ResultGet[x].Desc);

      end;

    end;

    if (Length(s.Errors) > 0) then
      showmessage(s.Errors[0].Msg);

  finally
    FEAuth.Free;
    s.Free;
  end;
end;

function TAfipDataModule.ObtieneUltimoComprobante;//OBTIENE ULTIMO COMPROBANTE
var
  s: FERecuperaLastCbteResponse;
  FEAuth : FEAuthRequest;
  x : Integer;
  WS: ServiceSoap;
  i : integer;
begin

  WS := GetServiceSoap(false,'', httprio1);

  FEAuth  := FEAuthRequest.Create;
  s:= FERecuperaLastCbteResponse.Create;
  try
    FEAuth.Token := token;
    FEAuth.Sign  := sign;
    FEAuth.Cuit  := StrToInt64(cuit);

//    puntoventa    := 2;
//    idcomprobante := 11; //es factura C


    s := WS.FECompUltimoAutorizado(FEAuth, puntoventa, idcomprobante);

    m.Clear;

    m.Add('Ultima Fact Emitido: '+ INTTOSTR(s.CbteNro));
    m.Add('Proxima Fact: '+ INTTOSTR(s.CbteNro+1));

    //proximaFactura :=  INTTOSTR(s.CbteNro+1);
    result := s.CbteNro+1;

    if (Length(s.Errors) > 0) then
      showmessage(s.Errors[0].Msg);

  finally

    FEAuth.Free;
    s.Free;
  end;

end;

procedure TAfipDataModule.ConsultaComprobantes;//CONSULTA COMPROBANTES
var
  port: ServiceSoap;
  dato: FECompConsultaReq;
  respuesta: FECompConsultaresponse;
  FEAuth: FEAuthRequest;
  WS: ServiceSoap;
  x : integer;
begin

//  screen.Cursor := crHourGlass;


  m.Clear;


  WS := GetServiceSoap(false,'', httprio1);

  FEAuth  := FEAuthRequest.Create;
  dato          := FECompConsultaReq.Create;
  respuesta     := FECompConsultaresponse.Create;


  try

    FEAuth.Token := token;
    FEAuth.Sign  := sign;
    FEAuth.Cuit  := StrToInt64(cuit);


    dato.CbteTipo := idComprobante;//1;  //Tipo factura A
    dato.CbteNro  := nroComprobante;//3;  //numero de factura
    dato.PtoVta   := puntoVenta;// 2; //Punto de Venta

    respuesta := WS.FECompConsultar(FEAuth, dato);


    for x := 0 to High( respuesta.Errors ) do
showmessage(Respuesta.Errors[x].Msg);

     for x := 0 to High( respuesta.Events ) do
showmessage(Respuesta.Events[x].Msg);

    if Length(respuesta.Errors) <= 0 then
    begin

     m.Add('CodAutorizacion: ' +respuesta.ResultGet.CodAutorizacion);
     m.Add('Emision Tipo: ' +respuesta.ResultGet.EmisionTipo);
     m.Add('FechaVto: ' +respuesta.ResultGet.FchVto);
     m.Add('FechaProceso: ' +respuesta.ResultGet.FchProceso);
     m.Add('CBTE Fecha: ' +respuesta.ResultGet.CbteFch);
     m.Add('CUIT CLIENTE: ' +FLOATTOSTR(respuesta.ResultGet.DocNro));
     m.Add('NETO: $' +FLOATTOSTR(respuesta.ResultGet.ImpNeto));
     m.Add('IVA: $' +FLOATTOSTR(respuesta.ResultGet.ImpIVA));
     m.Add('IIBB: $' +FLOATTOSTR(respuesta.ResultGet.ImpTrib));
     m.Add('TOTAL: $' +FLOATTOSTR(respuesta.ResultGet.ImpTotal));
     m.Add('CUIT: ' +FLOATTOSTR(respuesta.ResultGet.DocNro));

    end;

  finally
    FEAuth.Free;
    respuesta.Free;
    dato.Free;
  end;

//  screen.Cursor := crDefault;

end;

function TAfipDataModule.SolicitaCAE;//SOLICITA CAE
var
  port :ServiceSoap;
  respuesta :FECAEResponse;
  Auth :FEAuthRequest;
  Request:FECAERequest;

  CAECabReq :FECAECabRequest;
  CAEDetReq :FECAEDetRequest;
  ACAEDetReq :ArrayOfFECAEDetRequest;
  ADetIva :ArrayOfAlicIva;
//  DetIva21 :AlicIva;
//  DetIva105 :AlicIva;
//  Tributos :Tributo;
//  ATributos :ArrayOfTributo;
  CbtesAsoc :CbteAsoc;
  ACbtesAsoc :ArrayOfCbteAsoc;

  x, NroComp,
  alic, i, cbteAsocSize :Integer;

  iva :boolean;

  año,mes,dia,e,
  n :string;

  jR :TJSONObject;
//  regfeasocTipo :integer;
  regfeiva, regfeCbteAsoc :TJSONValue;
begin
  if FileExists(ruta+'TA.XML') then
    ExtraerTokenSing
  else
    Generar;

año := Copy(expirationTA, 1, 4);
mes := Copy(expirationTA, 6, 2);
dia := Copy(expirationTA, 9, 2);

e := mes+'/'+dia+'/'+año;

  if StrToDate(e) < now then
    Generar;
//  screen.Cursor := crHourGlass;

//  edDesde.Text := TimeToStr(now);
  auth      := FeAuthRequest.Create;
  Request   :=  FECAERequest.Create;
  CAEDetReq := FECAEDetRequest.Create;
  CAECabReq := FECAECabRequest.Create;

  SetLength(ACAEDetReq,1);

  Request.FeCabReq        := CAECabReq;
  ACAEDetReq[0]           := CAEDetReq;
  Request.FeDetReq        := ACAEDetReq;

  //si tiene percepciones crea array
//  if STRTOFLOAT(edtPercIIBB.Text) > 0 then
//  begin
//    Tributos := Tributo.Create;
//    SetLength(ATributos,1);
//    ATributos[0]                             := Tributos;
//    Request.FeDetReq[0].Tributos             := ATributos;
//  end;
//carga retencion de IIBB si tiene
//  if STRTOFLOAT(edtPercIIBB.Text) > 0 then
//  begin
//      Request.FeDetReq[0].Tributos[0].Id       :=  2;    //2-Imp provincial
//      Request.FeDetReq[0].Tributos[0].Desc     :=  'PERCEPCION DE IIBB BS AS' ;    // Descripcion
//      Request.FeDetReq[0].Tributos[0].BaseImp  :=  STRTOFLOAT(edtSubtotal.Text);    // base imponible
//      Request.FeDetReq[0].Tributos[0].Alic     :=  STRTOFLOAT(edtPercep.Text);    // alicuota
//      Request.FeDetReq[0].Tributos[0].importe  :=  STRTOFLOAT(edtPercIIBB.Text) ;    // imp del tributo
//  end;

//  si tiene los 2 ivas dimensiona para 2 sino 1
//  DetIva21  := AlicIva.Create;
//  DetIva105 := AlicIva.Create;
//  if (STRTOFLOAT(edtIVA105.Text) > 0) and (STRTOFLOAT(edtIVA21.Text) > 0)
//  if (f.GetValue<String>('n10')<>'0') and (f.GetValue<String>('n21')<>'0')
//  then
//  begin
//    SetLength(ADetIva,2);
//    ADetIVA[0]              := DetIva21;
//    ADetIVA[1]              := DetIva105;
//    Request.FeDetReq[0].Iva := ADetIva;
//  end
//  else if (f.GetValue<String>('n21')<>'0') or (f.GetValue<String>('n10')<>'0') then
//  begin
//    SetLength(ADetIva,1);
//    ADetIVA[0]              := DetIva21;
//    Request.FeDetReq[0].Iva := ADetIva;
//  end;
// si lleva documento vinculado
//  i:= dbTipoCbte.KeyValue;
//  if (i IN [2,3,7,8]) then
//regfeasocTipo:=f.GetValue<Integer>('regfeasocTipo');
//  if regfeasocTipo>0 then
//  begin
//    CbtesAsoc := CbteAsoc.Create;
//    SetLength(ACbtesAsoc,1);
//    ACbtesAsoc[0]                             := CbtesAsoc;
//    Request.FeDetReq[0].CbtesAsoc             := ACbtesAsoc;
//  end;
//  i:= dbTipoCbte.KeyValue;
//  if (i IN [2,3,7,8]) then //es nota de debito o credito lleva doc asociado
//  if regfeasocTipo>0 then
//  begin
//    Request.FeDetReq[0].CbtesAsoc[0].Tipo   := regfeasocTipo;//f.GetValue<Integer>('regfeasocTipo');//dbTipoCbteVinc.KeyValue;    //  tipo del comprobante asociado (nc/nd)
//    Request.FeDetReq[0].CbtesAsoc[0].PtoVta := f.GetValue<Integer>('regfeasocPtoVta');//STRTOINT(edtCompVincPto.Text);    //  Punto de venta de la nc
//    Request.FeDetReq[0].CbtesAsoc[0].Nro    := f.GetValue<Int64>('regfeasocNro');//STRTOINT64(edtCompVincComp.Text);    //  numero de la (nc/nd)
//  end;
  if ( f.TryGetValue<TJSONValue>('CbteAsoc',regfeCbteAsoc) ) then
  begin
    //regfeCbteAsoc := f.GetValue<TJSONValue>('CbtesAsoc');
    cbteAsocSize := TJSONArray(regfeCbteAsoc).Size;
    SetLength(ACbtesAsoc,cbteAsocSize);
    if cbteAsocSize>0 then
    begin
      for i := 0 to cbteAsocSize-1 do
      begin
        ACbtesAsoc[i] := CbteAsoc.Create;
      end;
    Request.FeDetReq[0].CbtesAsoc := ACbtesAsoc;
    for i := 0 to cbteAsocSize-1 do
      begin
        n := IntToStr(i);
        Request.FeDetReq[0].CbtesAsoc[i].Tipo := regfeCbteAsoc.GetValue<Integer>('['+n+'].Tipo');
        Request.FeDetReq[0].CbtesAsoc[i].PtoVta  := regfeCbteAsoc.GetValue<Integer>('['+n+'].PtoVta');
        Request.FeDetReq[0].CbtesAsoc[i].Nro  := regfeCbteAsoc.GetValue<Int64>('['+n+'].Nro');
      end;
    end;
  end;

//  iva:=false;

  auth.Cuit  := StrToInt64(CUIT);//f.GetValue<Int64>('cuit');//cuit;
  auth.token := token;
  auth.Sign  := sign;

  //   FeCabReq
  Request.FeCabReq.CantReg  := 1;  //   cantidad de registros
  Request.FeCabReq.CbteTipo := f.GetValue<Integer>('TipoCbte');//1;    //   1=fc.A 2=nd.A 3=nc.A    6=fc.B 7=nd.B 8=nc.B
  Request.FeCabReq.PtoVta   := f.GetValue<Integer>('PtoVta');//2;    //   Punto de venta

  //   FecDetReq
  Request.FeDetReq[0].Concepto := f.GetValue<Integer>('Concepto');//1;   //   1=productos, 2=servicios, 3=ambos
  Request.FeDetReq[0].DocTipo  := f.GetValue<Integer>('DocTipo');//80; //80 -cuit   86 - cuil   96-dni
  Request.FeDetReq[0].DocNro   := f.GetValue<Int64>('DocNro');//20000000001; //cuit del cliente

  NroComp := ObtieneUltimoComprobante(Request.FeCabReq.PtoVta, Request.FeCabReq.CbteTipo);
  if NroComp = 1 then
    NroComp := f.GetValue<Int64>('Cbte');

  Request.FeDetReq[0].CbteDesde  := NroComp;
  Request.FeDetReq[0].CbteHasta  := NroComp;
  Request.FeDetReq[0].CbteFch    := formatdatetime('yyyymmdd',now);//f.GetValue<WideString>('CbteFch');
  Request.FeDetReq[0].ImpTotal   := f.GetValue<Double>('ImpTotal');//121;
  Request.FeDetReq[0].ImpTotConc := f.GetValue<Double>('ImpTotConc');//0;
  Request.FeDetReq[0].ImpNeto    := f.GetValue<Double>('ImpNeto');//100;
  Request.FeDetReq[0].ImpOpEx    := f.GetValue<Double>('ImpOpEx');//0;
//  if (f.GetValue<String>('n10')<>'0') or (f.GetValue<String>('n21')<>'0') then
  if (f.TryGetValue<TJSONValue>('AlicIva',regfeiva)) then
  begin
    //regfeiva := f.GetValue<TJSONValue>('AlicIva');
    alic := TJSONArray(regfeiva).Size;
    SetLength(ADetIva,alic);
    if alic>0 then
    begin
      for i := 0 to alic-1 do
      begin
        ADetIVA[i] := AlicIva.Create;
      end;
    Request.FeDetReq[0].Iva := ADetIva;
    for i := 0 to alic-1 do
      begin
        n := IntToStr(i);
  //      n := regfeiva.ToString;
        Request.FeDetReq[0].Iva[i].Id := StrToInt(regfeiva.GetValue<string>('['+n+'].Id'));
        Request.FeDetReq[0].Iva[i].BaseImp  := StrToFloat(regfeiva.GetValue<string>('['+n+'].BaseImp'));
        Request.FeDetReq[0].Iva[i].importe  := StrToFloat(regfeiva.GetValue<string>('['+n+'].Importe'));
      end;
    end;
    if alic>0 then Request.FeDetReq[0].ImpIva := f.GetValue<Double>('ImpIVA');//21;
  end;

  Request.FeDetReq[0].ImpTrib    := f.GetValue<Double>('ImpTrib');//0;  //si tiene percepciones de IIBB o IVA van aca

  if Request.FeDetReq[0].Concepto <> 1 then
  begin
    //------------------------------------------------------------------------
    Request.FeDetReq[0].FchServDesde := f.GetValue<WideString>('FchServDesde');//FormatDateTime('yyyymmdd',now);         //   solo para concepto 2 o 3
    Request.FeDetReq[0].FchServHasta := f.GetValue<WideString>('FchServDesde');//FormatDateTime('yyyymmdd',now);          //   solo para concepto 2 o 3
    Request.FeDetReq[0].FchVtoPago   := f.GetValue<WideString>('FchVtoPago');//FormatDateTime('yyyymmdd',now);          //   solo para concepto 2 o 3
    //------------------------------------------------------------------------
  end;

  Request.FeDetReq[0].MonId     := 'PES';//f.GetValue<WideString>('MonId');
  Request.FeDetReq[0].MonCotiz  := f.GetValue<Double>('MonCotiz');//1;
  //    Request.FeDetReq[0].FchServDesde :=          //   solo para concepto 2 o 3

  //la factura contiene 2 tipos de iva 10.5 y 21%
//  if (STRTOFLOAT(edtIVA105.Text) > 0) and (STRTOFLOAT(edtIVA21.Text) > 0) then
//  if (f.GetValue<String>('n10')<>'0') and (f.GetValue<String>('n21')<>'0') then
//  begin
//    Request.FeDetReq[0].Iva[1].id       := 4;     //   alicuota 10.5%
//    Request.FeDetReq[0].Iva[1].BaseImp  := STRTOFLOAT(f.GetValue<String>('n10')); //   base imponible
//    Request.FeDetReq[0].Iva[1].importe  := STRTOFLOAT(f.GetValue<String>('i10'));//   Importe del impuesto
//
//    Request.FeDetReq[0].Iva[0].id       := 5;     //   alicuota 21%
//    Request.FeDetReq[0].Iva[0].BaseImp  := STRTOFLOAT(f.GetValue<String>('n21')); //   base imponible
//    Request.FeDetReq[0].Iva[0].importe  := STRTOFLOAT(f.GetValue<String>('i21'));//   Importe del impuesto
//    iva := true;
//  end;

  //la factura contiene iva 10.5
//  if (STRTOFLOAT(edtIVA105.Text) > 0) and NOT(iva) then
//  if (f.GetValue<String>('n10')<>'0') and NOT(iva) then
//  begin
//    Request.FeDetReq[0].Iva[0].id       := 4;     //   alicuota 10.5%
//    Request.FeDetReq[0].Iva[0].BaseImp  := STRTOFLOAT(f.GetValue<String>('n10')); //   base imponible
//    Request.FeDetReq[0].Iva[0].importe  := STRTOFLOAT(f.GetValue<String>('i10'));//   Importe del impuesto
//  end;

  //la factura contiene iva 21
//  if NOT(iva) and (STRTOFLOAT(edtIVA21.Text) > 0) then
//  if (f.GetValue<String>('n21')<>'0') and NOT(iva) then
//  begin
//    Request.FeDetReq[0].Iva[0].id       := 5;     //   alicuota 21%
//    Request.FeDetReq[0].Iva[0].BaseImp  := STRTOFLOAT(f.GetValue<String>('n21')); //   base imponible
//    Request.FeDetReq[0].Iva[0].importe  := STRTOFLOAT(f.GetValue<String>('i21'));//   Importe del impuesto
//  end;

    //la factura NO LLEVA IVA DISCRIMINADO ES B
//  if (LLetra.Caption = 'B') then
//  if (f.GetValue<Integer>('tipocbte') <9) and  (f.GetValue<Integer>('tipocbte') > 5) then
//  begin
//    Request.FeDetReq[0].Iva[0].id       := 3;     //   alicuota 10.5%
//    Request.FeDetReq[0].Iva[0].BaseImp  := f.GetValue<Double>('ImpNeto'); //   base imponible
//    Request.FeDetReq[0].Iva[0].importe  := 0;//   Importe del impuesto
//  end;

  //    Request.FeDetReq[0].Opcionales[0].Id    := s(4)    //  id del opcional
  //    Request.FeDetReq[0].Opcionales[0].Valor := s(250); //  valor

    port := GetServiceSoap(false,'', httprio1);

    Respuesta := port.FECAESolicitar(Auth,Request );
    jR := TJSONObject.Create();
    jR.AddPair('nro', IntToStr(NroComp));
    m.Add('RESULTADO: ' + respuesta.fedetresp[0].Resultado);
    jR.AddPair('mensaje', respuesta.fedetresp[0].Resultado);
    m.Add('CAE: ' + respuesta.fedetresp[0].CAE);
    jR.AddPair('cae', respuesta.fedetresp[0].CAE);
    m.Add('FECHA VENC: ' + respuesta.fedetresp[0].CAEFchVto);
    jR.AddPair('vto', respuesta.fedetresp[0].CAEFchVto);

    //si retorna cae, registra venta
//    if (respuesta.fedetresp[0].Resultado = 'A') then RegistraVenta;

    //--------------------------
    //   ARRAY DE OBSERVACIONES
    //--------------------------
  for x := 0 to high( Respuesta.feDetResp[0].observaciones ) do
    showmessage('Observ. Code  : '+inttostr(respuesta.fedetresp[0].observaciones[x].Code) +
      ' - Observ. Msg.  : '+respuesta.fedetresp[0].Observaciones[x].Msg);

  for x := 0 to High( respuesta.Errors ) do
    showmessage('Errores : '+inttostr(Respuesta.Errors[x].Code)+' || '+Respuesta.Errors[x].Msg);

  auth.Free;
  respuesta.Free;
//  Tributos.Free;
  CbtesAsoc.Free;
//  DetIva21.Free;
//  DetIva105.Free;
// edHasta.Text := timetostr(now);

result:=jR;
end;



end.
