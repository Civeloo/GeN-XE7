unit RestDM;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Data.Bind.Components, Data.Bind.ObjectScope,
  System.JSON, REST.Types, Winapi.ShellAPI, REST.Utils, Winapi.Windows,
  Vcl.DdeMan, Dialogs, DataModule, Vcl.Forms, FireDAC.Stan.Async, FireDAC.DApt;

type
  TTRest = class(TThread)
    vClient: TRESTClient;
    vRequest: TRESTRequest;
//    vResponse: TRESTResponse;
    vJSONValue: TJsonValue;
    vJSONArray1: TJSONArray;
    max, min, pprom: Double;
    i: byte;
    precios: array[1..5] of Double;
    j,c: integer;
    r: string;
    url,res,
    item, sku, id, e: string;
    termino : boolean;
  public
    constructor Create(
      vUrl, vResource, vAccept//, vClientId, vClientSecret, vAccessToken, vSeller_id, vQ, vLimit
      : string;
      vMethod : TRESTRequestMethod
    );
    procedure Execute; override;
    procedure GetResponse;
  end;

type
  TDMR = class(TDataModule)
    RESTResponseCategories: TRESTResponse;
    RESTResponse1: TRESTResponse;
    RESTClientCategories: TRESTClient;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTRequestCategories: TRESTRequest;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    RESTResponseDataSetAdapterCategories: TRESTResponseDataSetAdapter;
    FDMemTableCategories: TFDMemTable;
    O: TFDMemTable;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    T: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ResetRESTComponentsToDefaults;
    procedure GetRESTCategories(resource: string);
    procedure IniciarREST;

    procedure ObtenerOrder_items(order_id:string;j:TJSONValue);
    procedure ObtenerShipping(id:string);
    function ObtenerBuyer(j:TJSONValue):string;
    procedure ObtenerEnvio1(vId:string);
    function GeNREST(_method : TRESTRequestMethod;_resource,_bearer,_body : string): TJSONValue;
  public
    { Public declarations }
    JSONValue1 : TJSONValue;
    authCode, accessToken :string;
    pag, tpag : Integer;
    procedure ObtenerOrderRecent;
    procedure GetREST(resource: string);
    function existeEnTJSONArray(tabla: string ; streams: TJSONArray): string;
    procedure importCategories(borrar : Boolean);
    procedure PostREST(resource, datos: string);
    procedure PutREST(resource, datos: string);
    var JAline_items : TJSONArray;
    function Jline_items( codigo, cantidad : String ): TJSONObject;
    procedure CrearOrden;

    procedure ObtenerConsultaRest(r,q:string);
    procedure IniciarObtenerRest(u,r:string;m:TRESTRequestMethod);
    procedure ObtenerSeller;
    procedure ImprimirEtiqueta(i:string);
    procedure ObtenerPack(order_id:string);
    procedure ObtenerMessages(order_id,user_id:string);
    procedure IniciarObtenerToken;
    procedure EjecutarObtenerToken;
    function GetURL(service: string): string;
    procedure ObtenerAuthCode;
    procedure ObtenerAccessToken;
    procedure ObtenerRefreshToken;
    procedure AbrirEnBrowser(LURL:string);
    function Obtener(resource:string):TJSONValue;
    procedure ObtenerOrder;
    procedure WebLogin;
    procedure WebRegister;
    function WebCSR: String;
    procedure WebCrt(_crt: String);
    function WebWsfe(_body:string):TJSONValue;
    function WebLicencia: string;
    procedure WebPago;
  end;

const
  clientId = '';
  clientSecret = '';
  url = 'https://api.mercadolibre.com/';
  redirectUri = 'https://www.mercadolibre.com';

var

  tI,tfI: Integer;
  DMR: TDMR;
  tRest: array [0 .. 9999 - 1] of TTRest;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmMercadoLibre, OperacionDM;

{$R *.dfm}

{ THilo }
constructor TTRest.Create;//(//CreateSuspended : boolean;
// vUrl, vClientId, vClientSecret, vResource, vAccessToken, vAccept, vSeller_id, vQ, vLimit : string);
begin
//  FreeOnTerminate := True;
  inherited Create(False); // llamamos al constructor del padre (TThread)
  vClient := TRESTClient.Create(nil);
  vRequest := TRESTRequest.Create(nil);
//  vResponse := TRESTResponse.Create(nil);
//  vMemo1 := TMemo.Create(nil);
  vJSONValue := TJSONValue.Create;
  vClient.BaseURL := vUrl;//'https://api.mercadolibre.com/sites/MLA/'; //Supongamos que RUTA_URI es una constante con la ruta
  with vRequest do
  begin
    Client := vClient;
    Resource := vResource;//'search?';
    Method := vMethod;// rmPOST;
    if vAccept<>'' then Params.AddItem('accept', vAccept, TRESTRequestParameterKind.pkHTTPHEADER, [TRESTRequestParameterOption.poDoNotEncode]);//orders/recent
//    if vQ<>'' then Params.AddItem('q', vQ, TRESTRequestParameterKind.pkGETorPOST);
//    if vSeller_id<>'' then Params.AddItem('seller_id', vSeller_id, TRESTRequestParameterKind.pkGETorPOST);
//    if vLimit<>'' then Params.AddItem('limit', vLimit, TRESTRequestParameterKind.pkGETorPOST);
//    if vAccessToken<>'' then Params.AddItem('access_token', vAccessToken, TRESTRequestParameterKind.pkGETorPOST);
//    if vClientId<>'' then Params.AddItem('client_id', vClientId, TRESTRequestParameterKind.pkGETorPOST);
//    if vClientSecret<>'' then Params.AddItem('client_secret', vClientSecret, TRESTRequestParameterKind.pkGETorPOST);
//    Params.AddItem('site_id', 'MLA', TRESTRequestParameterKind.pkGETorPOST);
//    Params.AddItem('redirect_uri', redirectUri, TRESTRequestParameterKind.pkGETorPOST);
  //  RESTRequest1.Params.AddItem('price', preMinE.Text+'-'+preMaxE.Text, TRESTRequestParameterKind.pkGETorPOST);
  //  RESTRequest1.Params.AddItem('sort', 'price_desc', TRESTRequestParameterKind.pkGETorPOST);
  //  RESTRequest1.Params.AddItem('consumer_key', webUsr, TRESTRequestParameterKind.pkGETorPOST);
  //  RESTRequest1.Params.AddItem('consumer_secret', webPsw, TRESTRequestParameterKind.pkGETorPOST);
//    Response := vResponse;
  end;
end;

procedure TTRest.Execute;
begin
  inherited;
//  FreeOnTerminate := True;
  while not Terminated do
    Synchronize(GetResponse);
//  Synchronize(ObtenerConsultaRest);
end;

procedure TTRest.GetResponse;
begin
  try
  vJSONValue:=nil;
    with vRequest do
    begin
      Execute;
      if not ( ( vRequest.Response.Content = #$FEFF'[]' ) or ( vRequest.Response.Content  =  '[]' ) ) then
        begin
          max:= 0; min:= 0; pprom:= 0;
          if vRequest.Response.Content <> '' then
          begin
            try
//              vMemo1.Text := vResponse.Content;
//e:=vRequest.Response.Content;
              vJSONValue := TJSONObject.ParseJSONValue(vRequest.Response.Content);
            except
              on E:Exception do begin
                ShowMessage('Ha ocurrido un Error!'+#13+E.Message);
              end;
            end;
          end;
        end;
    end;
  finally
     vClient.Free;
//     vResponse.Free;
     vRequest.Free;
     termino:=True;
     Terminate;
//     Application.ProcessMessages;
   end;
end;

procedure TDMR.GetREST;
begin
  IniciarREST;
  RESTRequest1.Resource := resource;
  RESTRequest1.Execute;
  if not ( ( RESTResponse1.Content = #$FEFF'[]' ) or ( RESTResponse1.Content  =  '[]' ) ) then
  O.Open;
end;

procedure TDMR.ResetRESTComponentsToDefaults;
begin
  /// reset all of the rest-components for a complete
  /// new request
  ///
  /// --> we do not clear the private data from the
  /// individual authenticators.
  ///
  O.Close;
  RESTRequest1.ResetToDefaults;
  RESTClient1.ResetToDefaults;
  RESTResponse1.ResetToDefaults;
  RESTResponseDataSetAdapter1.ResetToDefaults;
end;

procedure TDMR.GetRESTCategories;
begin
  FDMemTableCategories.Close;
  RESTClientCategories.ResetToDefaults;
  RESTResponseCategories.ResetToDefaults;
  RESTClientCategories.BaseURL := webUrl;
  RESTRequestCategories.Resource := resource;
  RESTRequestCategories.Params.AddItem('consumer_key', webUsr, TRESTRequestParameterKind.pkGETorPOST);
  RESTRequestCategories.Params.AddItem('consumer_secret', webPsw, TRESTRequestParameterKind.pkGETorPOST);
  RESTRequestCategories.Execute;
  if not ( ( RESTResponseCategories.Content = #$FEFF'[]' ) or ( RESTResponseCategories.Content  =  '[]' ) ) then
    FDMemTableCategories.Open;
end;

procedure TDMR.DataModuleCreate(Sender: TObject);
begin
  JAline_items := TJSONArray.Create();
end;

function TDMR.existeEnTJSONArray;
var
  stream: TJSONObject;
  id: TJSONString;
  i: integer;
begin
//  i:=0;
//  repeat
  if streams<>nil then
  for i := 0 to streams.Size - 1 do
  begin
    stream := streams.Get(i) as TJSONObject;
    id := stream.Get('id').JsonValue as TJSONString;
    if DM.ExisteEnTabla(tabla,'CODIGO='+id.Value) then
    begin
      result := id.Value;
      exit;
    end;
  end;
  result :='0';
end;

procedure TDMR.importCategories;
var
  id,name,parent: string;
  i,p: integer;
begin
//  with OperacionDataModule do
    begin
    GetRESTCategories('products/categories/?per_page=100&page=1&parent=0&');
//    ProgressBar1.Max := FDMemTableCategories.RecordCount;
    if (FDMemTableCategories<>nil) then
    begin
//     if borrar then OperacionDataModule.BorrarArticulos;
      for i := 0 to FDMemTableCategories.RecordCount - 1 do
      begin
        id := FDMemTableCategories.FieldByName('id').AsString;
        name := FDMemTableCategories.FieldByName('name').AsString;
        parent := FDMemTableCategories.FieldByName('parent').AsString;
    //    T.SQL.Text := 'SELECT * FROM "Rubro" WHERE CODIGO = ' + id;
    //    T.Open;
        if not DM.existeEnTabla('Categoria','CODIGO='+id) then //    if T.RecordCount = 0 then
        begin
          DM.insertarTabla2('Categoria',id,name);
  //        D.SQL.Text := 'INSERT INTO "Categoria" (CODIGO,DESCRIPCION) VALUES ('
  //        + id + ',' + QuotedStr(name) + ')';
  //        D.ExecSQL;
  //        D.Transaction.Commit;
        end;
        FDMemTableCategories.Next;
//        ProgressBar1.Position := i;
      end;
      p:=0;
      repeat
        Inc(p);
        GetRESTCategories('products/categories/?per_page=100&page='+IntToStr(p)+'&');
//        ProgressBar1.Max := FDMemTableCategories.RecordCount;
        FDMemTableCategories.Filtered := False;
        FDMemTableCategories.Filter := 'parent <> 0';//  O.Filter := 'parent LIKE ' + QuotedStr('%' + IntToStr( category ) + '%');
        FDMemTableCategories.Filtered := True;

//        ProgressBar1.Max := FDMemTableCategories.RecordCount;
        for i := 0 to FDMemTableCategories.RecordCount - 1 do
        begin
          id := FDMemTableCategories.FieldByName('id').AsString;
          name := FDMemTableCategories.FieldByName('name').AsString;
          parent := FDMemTableCategories.FieldByName('parent').AsString;
          if DM.existeEnTabla('Categoria','CODIGO='+parent) then
          begin
            if not DM.existeEnTabla('SubCategoria','CODIGO='+id) then
            begin
              DM.insertarTabla2('SubCategoria',id,name);
  //              D.SQL.Text := 'INSERT INTO "SubCategoria" (CODIGO,DESCRIPCION) VALUES ('
  //              + id + ',' + QuotedStr(name) + ')';
  //              D.ExecSQL;
            end;
          end
          else
          if not DM.existeEnTabla('Rubro','CODIGO='+id) then
          begin
            DM.insertarTabla2('Rubro',id,name);
  //           D.SQL.Text := 'INSERT INTO "Rubro" (CODIGO,DESCRIPCION) VALUES ('
  //           + id + ',' + QuotedStr(name) + ')';
  //           D.ExecSQL;
          end;
          FDMemTableCategories.Next;
//          ProgressBar1.Position := i;
  //        D.Transaction.Commit;
        end;

      until FDMemTableCategories.RecordCount=0;
    end;
  end;
end;

procedure TDMR.PostREST;
begin
  IniciarREST;
  RESTRequest1.Resource := resource;
  RESTRequest1.Method := rmPost;
  RESTRequest1.Params.AddItem; //Adds a new Parameter Item
  RESTRequest1.Params.Items[0].name := 'data'; //sets the name of the parameter. In this case, since i need to use 'data=' on the request, the parameter name is data.
  RESTRequest1.Params.Items[0].Value := datos; //Adds the value of the parameter, in this case, the XML data.
  RESTRequest1.Params.Items[0].ContentType := ctAPPLICATION_X_WWW_FORM_URLENCODED;//sets the content type.
  RESTRequest1.Params.Items[0].Kind := pkGETorPOST; //sets the kind of request that will be executed.
  RESTRequest1.Execute;
end;

procedure TDMR.PutREST;
begin
  ResetRESTComponentsToDefaults;
  RESTClient1.BaseURL := webUrl;
  resource:= resource +'consumer_key='+webUsr+'&consumer_secret='+webPsw;
  RESTRequest1.Resource := resource;
  RESTRequest1.Method := rmPUT;
  RESTRequest1.Params.AddItem; //Adds a new Parameter Item
  RESTRequest1.Params.Items[0].name := 'body'; //sets the name of the parameter. In this case, since i need to use 'data=' on the request, the parameter name is data.
  RESTRequest1.Params.Items[0].Value := datos; //Adds the value of the parameter, in this case, the XML data.
  RESTRequest1.Params.Items[0].ContentType := ctAPPLICATION_JSON;// ctAPPLICATION_X_WWW_FORM_URLENCODED;//sets the content type.
  RESTRequest1.Params.Items[0].Kind := pkREQUESTBODY; //sets the kind of request that will be executed.
  RESTRequest1.Execute;
end;

procedure TDMR.IniciarREST;
begin
  ResetRESTComponentsToDefaults;
  RESTClient1.BaseURL := webUrl;
  RESTRequest1.Resource := WebRes;
  RESTRequest1.Params.AddItem('consumer_key', webUsr, TRESTRequestParameterKind.pkGETorPOST);
  RESTRequest1.Params.AddItem('consumer_secret', webPsw, TRESTRequestParameterKind.pkGETorPOST);
end;

procedure TDMR.CrearOrden;
var
  Jbilling, Jshipping, Jshipping_lines, Jorder : TJSONObject;
  JAbilling, JAshipping, JAshipping_lines : TJSONArray;
  i : Integer;
begin
  Jbilling := TJSONObject.Create;
  Jbilling.AddPair('first_name', 'John');
  Jbilling.AddPair('last_name', 'Doe');
  Jbilling.AddPair('address_1', '969 Market');
  Jbilling.AddPair('address_2', '');
  Jbilling.AddPair('city', 'San Francisco');
  Jbilling.AddPair('state', 'CA');
  Jbilling.AddPair('postcode', '94103');
  Jbilling.AddPair('country', 'US');
  Jbilling.AddPair('email', 'john.doe@example.com');
  Jbilling.AddPair('phone', '(555) 555-5555');
  JAbilling := TJSONArray.Create;
  JAbilling.Add(Jbilling);

  Jshipping := TJSONObject.Create;
  Jshipping.AddPair('first_name', 'John');
  Jshipping.AddPair('last_name', 'Doe');
  Jshipping.AddPair('address_1', '969 Market');
  Jshipping.AddPair('address_2', '');
  Jshipping.AddPair('city', 'San Francisco');
  Jshipping.AddPair('state', 'CA');
  Jshipping.AddPair('postcode', '94103');
  Jshipping.AddPair('country', 'US');
  JAshipping := TJSONArray.Create;
  JAshipping.Add(Jshipping);

//  for i := 0 to High(mat[0]) - 1 do
//  begin
//    Jline_items := TJSONObject.Create();
//    Jline_items.AddPair(TJSONPair.Create('product_id', mat[0, i]) );
//    Jline_items.AddPair(TJSONPair.Create('quantity', mat[3, i]) );
//    JAline_items.AddElement(Jline_items);
//  end;

  Jshipping_lines := TJSONObject.Create;
  Jshipping_lines.AddPair('method_id', 'flat_rate');
  Jshipping_lines.AddPair('method_title', 'Flat Rate');
  Jshipping_lines.AddPair('total', '10');
  JAshipping_lines := TJSONArray.Create;
  JAshipping_lines.Add(Jshipping_lines);

  Jorder := TJSONObject.Create;
  Jorder.AddPair('payment_method', 'bacs');
  Jorder.AddPair('payment_method_title', 'Direct Bank Transfer');
  Jorder.AddPair('set_paid', 'true');
  Jorder.AddPair('billing', JAbilling);
  Jorder.AddPair('shipping', JAshipping);
  Jorder.AddPair( TJSONPair.Create('Jline_items', JAline_items) );
  Jorder.AddPair('shipping_lines', JAshipping_lines);

//datos :=
//'{'
//+'  "payment_method": "bacs",'
//+'  "payment_method_title": "Direct Bank Transfer",'
//+'  "set_paid": true,'
//+'  "billing": {'
//+'    "first_name": "John",'
//+'    "last_name": "Doe",'
//+'    "address_1": "969 Market",'
//+'    "address_2": "",'
//+'    "city": "San Francisco",'
//+'    "state": "CA",'
//+'    "postcode": "94103",'
//+'    "country": "US",'
//+'    "email": "john.doe@example.com",'
//+'    "phone": "(555) 555-5555"'
//+'  },'
//+'  "shipping": {'
//+'    "first_name": "John",'
//+'    "last_name": "Doe",'
//+'    "address_1": "969 Market",'
//+'    "address_2": "",'
//+'    "city": "San Francisco",'
//+'    "state": "CA",'
//+'    "postcode": "94103",'
//+'    "country": "US"'
//+'  },'
//+'  "line_items": ['
//+'    {'
//+'      "product_id": 93,'
//+'      "quantity": 2'
//+'    },'
//+'    {'
//+'      "product_id": 22,'
//+'      "variation_id": 23,'
//+'      "quantity": 1'
//+'    }'
//+'  ],'
//+'  "shipping_lines": ['
//+'    {'
//+'      "method_id": "flat_rate",'
//+'      "method_title": "Flat Rate",'
//+'      "total": 10'
//+'    }'
//+'  ]'
//+'}';

end;

function TDMR.Jline_items;
begin
  Result := TJSONObject.Create();
  Result.AddPair(TJSONPair.Create('product_id', codigo) );
  Result.AddPair(TJSONPair.Create('quantity', cantidad) );
end;


function TDMR.GetURL;
var
  DDEClient: TDDEClientConv;
  s, URL, Title : string;
 begin
   s := '';
   try
     DDEClient := TDDEClientConv.Create(nil);
     with DDEClient do
     begin
       if SetLink('IExplore','WWW_GetWindowInfo') then
//         s := RequestData('0xFFFFFFFF,sURL,sTitle')
         s := RequestData('0xFFFFFFFF')
     end;
  if s <> '' then
     begin
       delete(s,1,1);
       URL := copy(s,1,pos('","',s)-1);
       delete(s,1,pos('","',s)+2);
       Title := copy(s,1,pos('"',s) - 1);
       result:=URL;
//       result:=s;
     end;
     exit;
   except
//     MessageDlg('URL attempt failed!',mtError,[mbOK],0);
   end;
end;

//procedure TDMR.ResetRESTComponentsToDefaults;
//begin
//  /// reset all of the rest-components for a complete
//  /// new request
//  ///
//  /// --> we do not clear the private data from the
//  /// individual authenticators.
//  ///
//  RESTRequest1.ResetToDefaults;
//  RESTClient1.ResetToDefaults;
////  RESTResponse1.ResetToDefaults;
////  RESTResponseDataSetAdapter1.ResetToDefaults;
//end;

procedure TDMR.ObtenerAuthCode;
var
  LURL: string;
begin
//https://auth.mercadolibre.com.ar/authorization?response_type=code&client_id=
  LURL := 'https://auth.mercadolibre.com.ar/authorization';
  LURL := LURL + '?response_type=' + URIEncode('code');
  LURL := LURL + '&client_id=' + URIEncode(clientId);
  ShellExecute(0,'open',pchar(LURL),nil,nil,SW_SHOWNORMAL);
  authCode := Trim(InputBox('Por favor copiar y pegar de la barra de direcciones', 'https://www.mercadolibre.com/?code=', ''));
end;

procedure TDMR.IniciarObtenerToken;
begin
  IniciarObtenerRest(url,'oauth/token?',rmPOST);
//  ResetRESTComponentsToDefaults;
//  RESTClient1.BaseURL := url;
//  with RESTRequest1 do
//  begin
//    Method := rmPOST;
//    Resource := 'oauth/token?';
//    Params.AddItem('client_id', clientId, TRESTRequestParameterKind.pkGETorPOST);
//    Params.AddItem('client_secret', clientSecret, TRESTRequestParameterKind.pkGETorPOST);
//    Params.AddItem('redirect_uri', redirectUri, TRESTRequestParameterKind.pkGETorPOST);
//  end;
end;

//procedure TDMR.DataModuleCreate(Sender: TObject);
//begin
////  with DM do
////  begin
//    refreshToken := DM.dbMain.ExecSQLScalar('SELECT refresh FROM token');
////  end;
//end;

procedure TDMR.EjecutarObtenerToken;
var
  LToken: string;
begin
  with RESTRequest1 do
  begin
    Execute;
    if Response.GetSimpleValue('access_token', LToken) then
      accessToken := LToken;
    if Response.GetSimpleValue('refresh_token', LToken) then
      dmML.refreshToken := LToken;
    dmML.ActualizarRefreshToken;
  end;
end;

procedure TDMR.ObtenerAccessToken;
//var
//  LToken: string;
begin
  if authCode='' then ObtenerAuthCode;
  IniciarObtenerToken;
//  ResetRESTComponentsToDefaults;
//  RESTClient1.BaseURL := url;
  with RESTRequest1 do
  begin
//  Method := rmPOST;
//  Resource := 'oauth/token?';
    Params.AddItem('grant_type', 'authorization_code', TRESTRequestParameterKind.pkGETorPOST);
//  Params.AddItem('client_id', clientId, TRESTRequestParameterKind.pkGETorPOST);
//  Params.AddItem('client_secret', clientSecret, TRESTRequestParameterKind.pkGETorPOST);
    Params.AddItem('code', authCode, TRESTRequestParameterKind.pkGETorPOST);
    Params.AddItem('redirect_uri', redirectUri, TRESTRequestParameterKind.pkGETorPOST);
//  Execute;
//  if Response.GetSimpleValue('access_token', LToken) then
//    AccessToken := LToken;
//  if Response.GetSimpleValue('refresh_token', LToken) then
//    RefreshToken := LToken;
  end;
  EjecutarObtenerToken;
end;

procedure TDMR.ObtenerRefreshToken;
//var
//  LToken: string;
begin
  with dmML do
  begin
  //https://api.mercadolibre.com/oauth/token?grant_type=refresh_token&client_id=APP_ID&client_secret=SECRET_KEY&refresh_token=REFRESH_TOKEN
    if refreshToken='' then ObtenerAccessToken;
    IniciarObtenerToken;
  //  ResetRESTComponentsToDefaults;
  //  RESTClient1.BaseURL := url;
    with RESTRequest1 do
    begin
  //  Method := rmPOST;
  //  Resource := 'oauth/token?';
      Params.AddItem('grant_type', 'refresh_token', TRESTRequestParameterKind.pkGETorPOST);
  //  Params.AddItem('client_id', clientId, TRESTRequestParameterKind.pkGETorPOST);
  //  Params.AddItem('client_secret', clientSecret, TRESTRequestParameterKind.pkGETorPOST);
      Params.AddItem('refresh_token', refreshToken, TRESTRequestParameterKind.pkGETorPOST);
  //  Params.AddItem('redirect_uri', redirectUri, TRESTRequestParameterKind.pkGETorPOST);
  //  Execute;
  //  if Response.GetSimpleValue('access_token', LToken) then
  //    AccessToken := LToken;
  //  if Response.GetSimpleValue('refresh_token', LToken) then
  //    RefreshToken := LToken;
    end;
      EjecutarObtenerToken;
  end;
end;

procedure TDMR.IniciarObtenerRest;
begin
  ResetRESTComponentsToDefaults;
  RESTClient1.BaseURL := u;
  with RESTRequest1 do
  begin
//    Method := rmPOST;
    Method := m;
    Resource := r;
    Params.AddItem('client_id', clientId, TRESTRequestParameterKind.pkGETorPOST);
//    Params.AddItem('site_id', 'MLA', TRESTRequestParameterKind.pkGETorPOST);
    Params.AddItem('client_secret', clientSecret, TRESTRequestParameterKind.pkGETorPOST);
//    Params.AddItem('redirect_uri', redirectUri, TRESTRequestParameterKind.pkGETorPOST);
  end;
end;

procedure TDMR.ObtenerConsultaRest;
begin
  if  accessToken='' then ObtenerRefreshToken;
//  r:='users/me?';
  IniciarObtenerRest(url,r,rmGET);
////$ curl https://api.mercadolibre.com/users/me?access_token=$ACCESS_TOKEN
//  ResetRESTComponentsToDefaults;
//  with RESTClient1 do
//  begin
//    BaseURL := 'https://api.mercadolibre.com/';
//  end;
  with RESTRequest1 do
  begin
//  Method := rmGET;
//  Resource := 'users/me?';
//  Params.AddItem('accept', 'json', TRESTRequestParameterKind.pkHTTPHEADER);
  Params.AddItem('accept', 'application/json', TRESTRequestParameterKind.pkHTTPHEADER, [TRESTRequestParameterOption.poDoNotEncode]);//orders/recent
  Params.AddItem('access_token', accessToken, TRESTRequestParameterKind.pkGETorPOST);
  if q<>''then Params.AddItem('q', q, TRESTRequestParameterKind.pkGETorPOST);
////  OAuth2Authenticator1.AccessToken := 'APP_USR-5480711421985209-061218-6833fd7ab8853a5234718fc204b7d270-242069506';
////  OAuth2Authenticator1.AccessTokenParamName := 'access_token';
  Execute;
//  Application.ProcessMessages;
  end;
end;

procedure TDMR.ObtenerOrderRecent;
var
  jOrderRecent, order_items, buyer, item, shipping : TJSONValue;
  i, io, order_id,order_status,buyer_id,item_id,item_title,seller_sku,
  order_items_quantity, last_updated,sj, hoy, ayer : string;
  n, r, l, ro, no, p, t, paging_total: Integer;
begin
  hoy := formatdatetime('yyyy-mm-dd', now-1);
  ayer := formatdatetime('yyyy-mm-dd', now-4);
  with dmML do
    with tOrders do
    begin
      try
        i:='0';
        if seller_id='' then ObtenerSeller;
        repeat
          Inc(p);
          ObtenerConsultaRest('orders/search/recent?seller='+seller_id

          +'&order.status=paid'
          +'&tags=not_delivered'
//          +'&order.date_created.from='+ayer+'T00:00:00.000-00:00'
          +'&order.date_last_updated.from='+hoy+'T00:00:00.000-00:00'
          +'&offset='+IntToStr(p)

          ,'');
//          );
          jOrderRecent := TJSONObject.ParseJSONValue(RESTRequest1.Response.Content);
          if jOrderRecent is TJSONObject then
          begin
            sj:=jOrderRecent.ToString;
            paging_total := jOrderRecent.GetValue<Integer>('paging.total');
            if paging_total>0 then
              t := paging_total;
            r:=TJSONArray(jOrderRecent.GetValue<TJSONValue>('results')).Size;
            if r>0 then
              for n := 0 to r-1 do
              begin
                i:=IntToStr(n);
                order_id := jOrderRecent.GetValue<string>('results['+i+'].id');
                Open(sqlOrders+' WHERE id=:I',[order_id]);
                if RecordCount>0 then
                  Edit
                else
                begin
                  Insert;
                  tOrdersid.AsString := order_id;

                end;
//              ObtenerShipping(tOrdersshipping.AsString);
//              ObtenerMessages(order_id,seller_id);
                last_updated:=jOrderRecent.GetValue<string>('results['+i+'].date_last_updated');
                if tOrdersdate_last_updated.AsString <> last_updated then
                  begin
                   //                tOrdersid.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].id').ToString;//2054151756,
                  tOrderscomments.AsString := jOrderRecent.GetValue<string>('results['+i+'].comments');//null,
                  tOrdersstatus.AsString := jOrderRecent.GetValue<string>('results['+i+'].status');//"paid",
                  tOrdersstatus_detail.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].status_detail').ToString;//{},
                  tOrdersdate_created.AsString := jOrderRecent.GetValue<string>('results['+i+'].date_created');//"2019-06-13T18:12:24.000-04:00",
                  tOrdersdate_closed.AsString := jOrderRecent.GetValue<string>('results['+i+'].date_closed');//"2019-06-13T18:12:27.000-04:00",
                  tOrdersexpiration_date.AsString := jOrderRecent.GetValue<string>('results['+i+'].expiration_date');//"2019-07-11T18:12:27.000-04:00",
//                  tOrdersdate_last_updated.AsString := jOrderRecent.GetValue<string>('results['+i+'].date_last_updated');//"2019-06-24T12:11:26.353Z",
                  tOrdershidden_for_seller.AsString := jOrderRecent.GetValue<string>('results['+i+'].hidden_for_seller');//false,
                  tOrderscurrency_id.AsString := jOrderRecent.GetValue<string>('results['+i+'].currency_id');//"ARS",
  //                tOrdersorder_items.AsString := jOrderRecent.GetValue<string>('results['+i+'].order_items');//[],
                  ObtenerOrder_items(order_id, jOrderRecent.GetValue<TJSONValue>('results['+i+'].order_items'));
                  tOrderstotal_amount.AsString := jOrderRecent.GetValue<string>('results['+i+'].total_amount');//456.87,
                  tOrdersmediations.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].mediations').ToString;//[],
                  tOrderspayments.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].payments').ToString;//[],
  //                tOrdersshipping.AsString := jOrderRecent.GetValue<string>('results['+i+'].shipping');//{},
  //                shipping := jOrderRecent.GetValue<TJSONValue>('results['+i+'].shipping');
  //                id := shipping.GetValue<string>('id');
                  tOrdersshipping.AsString:=(jOrderRecent.GetValue<TJSONValue>('results['+i+'].shipping')).GetValue<string>('id');
  //                tOrdersshipping.AsString := ObtenerShipping(order_id, jOrderRecent.GetValue<TJSONValue>('results['+i+'].shipping'));
//                  if tOrdersshipping.AsString ='' then tOrdersshipping.AsString:='0';
//                  ObtenerShipping(tOrdersshipping.AsString);
                  tOrdersorder_request.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].order_request').ToString;//{},
                  tOrderspickup_id.AsString := jOrderRecent.GetValue<string>('results['+i+'].pickup_id');//null,
  //                tOrdersbuyer.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].buyer');//{},
                  tOrdersbuyer.AsString := ObtenerBuyer(jOrderRecent.GetValue<TJSONValue>('results['+i+'].buyer'));
                  tOrdersseller.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].seller').ToString;//{},
                  tOrdersfeedback.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].feedback').ToString;//{},
                  tOrderstags.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].tags').ToString;//[]
//                  ObtenerMessages(order_id,seller_id);
                  tOrdersshipping.AsString:=(jOrderRecent.GetValue<TJSONValue>('results['+i+'].shipping')).GetValue<string>('id');
                  if tOrdersshipping.AsString ='' then tOrdersshipping.AsString:='0';
                  ObtenerDespachados(order_id);
                    tOrdersdate_last_updated.AsString := last_updated;
                    ObtenerShipping(tOrdersshipping.AsString);
//                    ObtenerMessages(order_id,seller_id);
                  end;
                tOrders.Post;
              end;
          end;
          Application.ProcessMessages;
        until ((p=t) or (p>t));
      finally
      //
      end;
    end;
end;

procedure TDMR.ObtenerOrder;
var
  jOrderRecent, order_items, buyer, item, shipping : TJSONValue;
  i, io, order_id,order_status,buyer_id,item_id,item_title,seller_sku,
  order_items_quantity, date_last_updated,sj, hoy, ayer : string;
  n, r, l, ro, no, paging_total: Integer;
begin
  hoy := formatdatetime('yyyy-mm-dd', now-7);
//  ayer := formatdatetime('yyyy-mm-dd', now-20);
  with dmML do
    with tOrders do
    begin
      try
        teI:=0;tfeI:=0;
        tmI:=0;tfmI:=0;
        tI:=0;tfI:=0;
        i:='0';
        if seller_id='' then ObtenerSeller;
        Open(sqlOrders);
        Last;
        if tOrdersdate_last_updated.AsString<>'' then
          hoy:=tOrdersdate_last_updated.AsString
        else
           hoy:=hoy+'T00:00:00.000-00:00';
        repeat
          Inc(pag);
          ObtenerConsultaRest('orders/search?seller='+seller_id
          +'&order.status=paid'
          +'&tags=not_delivered'
//          +'&order.date_created.from='+ayer+'T00:00:00.000-00:00'
          +'&order.date_last_updated.from='+hoy
          +'&offset='+IntToStr(pag)
          ,'');
          jOrderRecent := TJSONObject.ParseJSONValue(RESTRequest1.Response.Content);
          if jOrderRecent is TJSONObject then
          begin
            sj:=jOrderRecent.ToString;
            paging_total := jOrderRecent.GetValue<Integer>('paging.total');
            if paging_total>0 then
              tpag := paging_total;
            r:=TJSONArray(jOrderRecent.GetValue<TJSONValue>('results')).Size;
            if r>0 then
              for n := 0 to r-1 do
              begin
                i:=IntToStr(n);
                order_id := jOrderRecent.GetValue<string>('results['+i+'].id');
                Open(sqlOrders+' WHERE id=:I',[order_id]);
                dmML.dbMain.StartTransaction;
                if RecordCount>0 then
                  Edit
                else
                begin
                  Insert;
                  tOrdersid.AsString := order_id;
                end;
                date_last_updated:=jOrderRecent.GetValue<string>('results['+i+'].date_last_updated');
                if not (tOrdersdate_last_updated.AsString = date_last_updated) then begin
                                  //                tOrdersid.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].id').ToString;//2054151756,
                  tOrderscomments.AsString := jOrderRecent.GetValue<string>('results['+i+'].comments');//null,
                  tOrdersstatus_detail.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].status_detail').ToString;//{},
                  tOrdersdate_created.AsString := jOrderRecent.GetValue<string>('results['+i+'].date_created');//"2019-06-13T18:12:24.000-04:00",
                  tOrdersdate_closed.AsString := jOrderRecent.GetValue<string>('results['+i+'].date_closed');//"2019-06-13T18:12:27.000-04:00",
                  tOrdersexpiration_date.AsString := jOrderRecent.GetValue<string>('results['+i+'].expiration_date');//"2019-07-11T18:12:27.000-04:00",
//                  tOrdersdate_last_updated.AsString := jOrderRecent.GetValue<string>('results['+i+'].date_last_updated');//"2019-06-24T12:11:26.353Z",
                  tOrdershidden_for_seller.AsString := jOrderRecent.GetValue<string>('results['+i+'].hidden_for_seller');//false,
                  tOrderscurrency_id.AsString := jOrderRecent.GetValue<string>('results['+i+'].currency_id');//"ARS",
  //                tOrdersorder_items.AsString := jOrderRecent.GetValue<string>('results['+i+'].order_items');//[],
                  ObtenerOrder_items(order_id, jOrderRecent.GetValue<TJSONValue>('results['+i+'].order_items'));
                  tOrderstotal_amount.AsString := jOrderRecent.GetValue<string>('results['+i+'].total_amount');//456.87,
                  tOrdersmediations.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].mediations').ToString;//[],
                  tOrderspayments.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].payments').ToString;//[],
  //                tOrdersshipping.AsString := jOrderRecent.GetValue<string>('results['+i+'].shipping');//{},
  //                shipping := jOrderRecent.GetValue<TJSONValue>('results['+i+'].shipping');
  //                id := shipping.GetValue<string>('id');
  //                tOrdersshipping.AsString := ObtenerShipping(order_id, jOrderRecent.GetValue<TJSONValue>('results['+i+'].shipping'));
//                  if tOrdersshipping.AsString ='' then tOrdersshipping.AsString:='0';
//                  ObtenerShipping(tOrdersshipping.AsString);
                  tOrdersorder_request.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].order_request').ToString;//{},
                  tOrderspickup_id.AsString := jOrderRecent.GetValue<string>('results['+i+'].pickup_id');//null,
  //                tOrdersbuyer.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].buyer');//{},
                  tOrdersbuyer.AsString := ObtenerBuyer(jOrderRecent.GetValue<TJSONValue>('results['+i+'].buyer'));
                  tOrdersseller.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].seller').ToString;//{},
                  tOrdersfeedback.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].feedback').ToString;//{},

                  ObtenerDespachados(order_id);
                  tOrdersdate_last_updated.AsString := date_last_updated;
                  ObtenerMessages(order_id,seller_id);
                end;

                  tOrdersshipping.AsString:=(jOrderRecent.GetValue<TJSONValue>('results['+i+'].shipping')).GetValue<string>('id');
                  if tOrdersshipping.AsString ='' then tOrdersshipping.AsString:='0';
                  tOrdersstatus.AsString := jOrderRecent.GetValue<string>('results['+i+'].status');//"paid",
                  tOrderstags.AsString := jOrderRecent.GetValue<TJSONValue>('results['+i+'].tags').ToString;//[]
                  ObtenerShipping(tOrdersshipping.AsString);

                if ((tOrders.State=dsEdit) or (tOrders.State=dsInsert)) then tOrders.Post;
                dmML.dbMain.Commit;
                Application.ProcessMessages;
              end;
          end;
        until ((pag=tpag) or (pag>tpag));
      finally
      //
      end;
    end;
end;

procedure TDMR.AbrirEnBrowser;
begin
  ShellExecute(0,'open',pchar(LURL),nil,nil,SW_SHOWNORMAL);
end;

procedure TDMR.ObtenerSeller;
begin
  with dmML do
  begin
    try
      ObtenerConsultaRest('users/me?','');
      JSONValue1 := TJSONObject.ParseJSONValue(RESTRequest1.Response.Content);
      if JSONVAlue1 is TJSONObject then
      begin
        seller_id := JSONValue1.GetValue<string>('id');
      end;
    finally
      AgregarSeller(seller_id);
    end;
  end;
end;

procedure TDMR.ImprimirEtiqueta;
begin
  if  accessToken='' then ObtenerRefreshToken;
  if i<>'' then
    AbrirEnBrowser(
      'https://api.mercadolibre.com/shipment_labels?shipment_ids='+i+'&response_type=pdf&access_token='+accessToken
    );
end;

function TDMR.Obtener;//(resource:string):TJSONValue;
//var
//  tRest: array [0 .. 9999 - 1] of TTRest;
begin
//Para conocer el pack_id, debers obtener el campo pack_id en la respuesta de /orders/<order_id>
//  with dmML do
//  begin
    try
      result:=nil;
      if  accessToken='' then ObtenerRefreshToken;
  //curl -X GET https://api.mercadolibre.com/messages/packs/$pack_id/sellers/$user_id?access_token=$ACCESS_TOKEN
  //      tRest := TTRest.Create(
      Inc(tI);
      tRest[tI] := TTRest.Create(
        url,
        resource+''+'client_id='+clientId+
        '&client_secret='+clientSecret+'&access_token='+accessToken,
        'application/json',
        rmGET
      );
      with tRest[tI] do
      begin
        tRest[tI].vJSONValue := result;
//        tRest[tI].FreeOnTerminate := True;
//        tRest[tI].Start;
      end;
////      result := tRest[tI].vJSONValue;
////      if Assigned(tRest[tI]) then
//      while (Assigned(tRest[tI]) and (not tRest[tI].termino) and (not tRest[tI].Terminated)) do
////        while (not tRest[tI].Terminated) do
//        begin
//          Application.ProcessMessages;
////          result := tRest[tI].vJSONValue;
//        end;

//      tRest[tI].WaitFor;
//      while not tRest[tI].termino do
//        Application.ProcessMessages;
    if not tRest[tI].Terminated then
      tRest[tI].WaitFor;

    finally
      result := tRest[tI].vJSONValue;
//      tRest[tI].vRequest.Free;
//      tRest[tI].vClient.Free;
//     vResponse.Free;
//      tRest[tI].Terminate;
    end;
//  end;
end;

procedure TDMR.ObtenerPack;
var
  j : TJSONValue;
  pack_id : string;
begin
//Para conocer el pack_id, debers obtener el campo pack_id en la respuesta de /orders/<order_id>
//    try
//      ObtenerConsultaRest('/orders/'+order_id,'');
//      tRest := TTRest.Create(
//        url, '/orders/'+order_id
//        +'?'+'client_id='+clientId+'&client_secret='+clientSecret+
//        '&access_token='+accessToken, 'application/json',
//        rmGET
//      );
//      with tRest do
//    begin
//      vJSONValue := JSONValue;
//      FreeOnTerminate := True;
//      Start;//Resume;
//    end;
//
//    while not tRest.Terminated do
//    begin
//      Application.ProcessMessages;
//      JSONValue := tRest.vJSONValue;
//    end;
//      if JSONValue is TJSONArray then
//        pack_id := JSONValue.GetValue<string>('pack_id');
      j := Obtener('/orders/'+order_id+'?');
      if j is TJSONObject then
          pack_id := j.GetValue<string>('pack_id');
      if pack_id<>'' then
        with dmML do
        begin
          AgregarPack(order_id,pack_id);
        end;
end;

procedure TDMR.ObtenerMessages;
begin
//curl -X GET https://api.mercadolibre.com/messages/packs/$pack_id/sellers/$user_id?access_token=$ACCESS_TOKEN
  with dmML do begin
    try
      Inc(tmI);
      tObtenerMensajes[tmI] := TTObtenerMensajes.Create(order_id);
    finally
  //    tObtenerMensajes.Terminate;
    end;
  end;
end;

procedure TDMR.ObtenerOrder_items;
var
  item, order_items : TJSONValue;
  io, id, item_id : string;
  ro, no : Integer;
begin
  ro := TJSONArray(j).Size;
  with dmML do
    with tOrder_items do
      if ro>0 then
        for no := 0 to ro-1 do
        begin
          io:=IntToStr(no);
          order_items := j.GetValue<TJSONValue>('['+io+']');
          item := order_items.GetValue<TJSONValue>('item');
          item_id := item.GetValue<string>('id');
          id := order_id+'_'+item_id;
          Open(sqlOrder_items+' WHERE id=:I',[id]);
          if RecordCount>0 then
            Edit
          else
          begin
            Insert;
            tOrder_itemsid.AsString := id;
          end;
          tOrder_itemsorder_id.AsString := order_id;
          tOrder_itemsitem_id.AsString := item_id;
          tOrder_itemstitle.AsString := item.GetValue<string>('title');
          tOrder_itemsseller_custom_field.AsString := item.GetValue<string>('seller_custom_field');
          tOrder_itemscondition.AsString := item.GetValue<string>('condition');
          tOrder_itemscategory_id.AsString := item.GetValue<string>('category_id');
          tOrder_itemsvariation_id.AsString := item.GetValue<string>('variation_id');
//          tOrder_itemsvariation_attributes.AsString := item.GetValue<TJSONValue>('variation_attributes');// [],
if (item.FindValue('seller_sku')<>nil) then
          tOrder_itemsseller_sku.AsString := item.GetValue<string>('seller_sku');
          if tOrder_itemsseller_sku.AsString='' then tOrder_itemsseller_sku.AsString:=tOrder_itemsseller_custom_field.AsString;
          tOrder_itemswarranty.AsString := item.GetValue<string>('warranty');
          tOrder_itemsquantity.AsString := order_items.GetValue<string>('quantity');// 1,
//          tOrder_itemsdifferential_pricing_id.AsString := order_items.GetValue<TJSONValue>('differential_pricing_id');
          tOrder_itemssale_fee.AsString := order_items.GetValue<string>('sale_fee');
          tOrder_itemslisting_type_id.AsString := order_items.GetValue<string>('listing_type_id');
          tOrder_itemsbase_currency_id.AsString := order_items.GetValue<string>('base_currency_id');
          tOrder_itemsunit_price.AsString := order_items.GetValue<string>('unit_price');
          tOrder_itemsfull_unit_price.AsString := order_items.GetValue<string>('full_unit_price');
          tOrder_itemsbase_exchange_rate.AsString := order_items.GetValue<string>('base_exchange_rate');
          tOrder_itemscurrency_id.AsString := order_items.GetValue<string>('currency_id');
          tOrder_itemsmanufacturing_days.AsString := order_items.GetValue<string>('manufacturing_days');
          Post;
        end;
end;

procedure TDMR.ObtenerShipping;
var
  j, shipping : TJSONValue;
  r : Integer;
  s:string;
begin
  with dmML do
  begin
    if (id='0') or (id='') then
    begin
      with tShipments do
      begin
        Open('SELECT * FROM shipments WHERE id=:I',['0']);
        if RecordCount>0 then
//          Edit
        else
        begin
          Insert;
          tShipmentsid.AsString:='0';
          //        tShipmentsorder_id.AsString:='0';
          tShipmentsstatus.AsString:='';
          tShipmentssubstatus.AsString:='';
          tShipmentsmode.AsString:='';
          tShipmentsshipping_option.AsString:='0';
          Post;
        end;
      end;
      with tShipping_option do
      begin
        Open(sqlShipping_option+' WHERE id=:I',['0']);
        if RecordCount>0 then
//          Edit
        else
        begin
          Insert;
          tShipping_optionid.AsString := '0';
          tShipping_optionshipping_method_id.AsString:='';
          Post;
        end;
      end;
    end
    else
    begin
        try
//          Inc(teI);
//          tObtenerEnvio[teI] := TTObtenerEnvio.Create(id);
          ObtenerEnvio1(id);
        finally
        //
        end;
    end;
  end;
end;

function TDMR.ObtenerBuyer;
var
  buyer : TJSONValue;
  id : string;
begin
  with dmML do
    with tBuyer do
    begin
      buyer := j.GetValue<TJSONValue>();//('['+io+']');
      id := buyer.GetValue<string>('id');
      Open(sqlBuyer+' WHERE id=:I',[id]);
      if RecordCount>0 then
//        Edit
      else
      begin
        Insert;
        tBuyerid.AsString := id;
//        tBuyerid.AsString := buyer.GetValue<string>('id');
        tBuyernickname.AsString := buyer.GetValue<string>('nickname');
        tBuyeremail.AsString := buyer.GetValue<string>('email');
        tBuyerphone.AsString := buyer.GetValue<TJSONValue>('phone').ToString;
        tBuyeralternative_phone.AsString := buyer.GetValue<TJSONValue>('alternative_phone').ToString;
        tBuyerfirst_name.AsString := buyer.GetValue<string>('first_name');
        tBuyerlast_name.AsString := buyer.GetValue<string>('last_name');
        tBuyerbilling_info.AsString := buyer.GetValue<TJSONValue>('billing_info').ToString;
        Post;
      end;
      result := id;
    end;
//    Application.ProcessMessages;
end;

procedure TDMR.ObtenerEnvio1;
var
  vQuery: TFDQuery;
  jEnvio: TJsonValue;
  last_updated : string;
begin
  vQuery := TFDQuery.Create(nil);
  vQuery.Connection:=dmML.dbMain;
  try
      with DMR do begin
    try
      ObtenerConsultaRest('/shipments/'+vId+'?'
          ,'');
    finally
      jEnvio := TJSONObject.ParseJSONValue(RESTRequest1.Response.Content);
    end;
  end;
      if Assigned(jEnvio) then
      if (jEnvio<>nil) then
      if jEnvio.Owned then
      if jEnvio is TJSONObject then
      begin
//e:=jEnvio.ToString;
//        shipping := j.GetValue<TJSONValue>();//('Results');
        with vQuery do
        begin
//          vId := jEnvio.GetValue<string>('id');
          Open(sqlShipments+' WHERE id=:I',[vId]);
          dmML.dbMain.StartTransaction;
          if vQuery.RecordCount>0 then
            Edit
          else
          begin
            Insert;
            FieldByName('id').AsString := vId;
          end;

          FieldByName('status').AsString := jEnvio.GetValue<string>('status');
          FieldByName('substatus').AsString := jEnvio.GetValue<string>('substatus');
          FieldByName('shipping_option').AsString := dmML.ObtenerShipping_option(jEnvio.GetValue<TJSONValue>('shipping_option'));
          FieldByName('tracking_method').AsString := jEnvio.GetValue<string>('tracking_method');
          FieldByName('mode').AsString := jEnvio.GetValue<string>('mode');

          last_updated:=jEnvio.GetValue<string>('last_updated');
          if not(last_updated=FieldByName('last_updated').AsString) then begin
            FieldByName('last_updated').AsString := last_updated;
            FieldByName('created_by').AsString := jEnvio.GetValue<string>('created_by');
            FieldByName('order_id').AsString := jEnvio.GetValue<string>('order_id');
            FieldByName('order_cost').AsString := jEnvio.GetValue<string>('order_cost');
            FieldByName('base_cost').AsString := jEnvio.GetValue<string>('base_cost');
            FieldByName('site_id').AsString := jEnvio.GetValue<string>('site_id');
            FieldByName('date_created').AsString := jEnvio.GetValue<string>('date_created');
            FieldByName('tracking_number').AsString := jEnvio.GetValue<string>('tracking_number');
            FieldByName('service_id').AsString := jEnvio.GetValue<string>('service_id');
            FieldByName('carrier_info').AsString := jEnvio.GetValue<TJSONValue>('carrier_info').ToString;
            FieldByName('sender_id').AsString := jEnvio.GetValue<string>('sender_id');
            FieldByName('sender_address').AsString := jEnvio.GetValue<TJSONValue>('sender_address').ToString;
            FieldByName('receiver_id').AsString := jEnvio.GetValue<string>('receiver_id');
            FieldByName('receiver_address').AsString := jEnvio.GetValue<TJSONValue>('receiver_address').ToString;
            FieldByName('shipping_items').AsString := jEnvio.GetValue<TJSONValue>('shipping_items').ToString;

            FieldByName('comments').AsString := jEnvio.GetValue<string>('comments');
            FieldByName('date_first_printed').AsString := jEnvio.GetValue<string>('date_first_printed');
            FieldByName('market_place').AsString := jEnvio.GetValue<string>('market_place');
            FieldByName('return_details').AsString := jEnvio.GetValue<string>('return_details');
            FieldByName('return_tracking_number').AsString := jEnvio.GetValue<string>('return_tracking_number');
            FieldByName('cost_components').AsString := jEnvio.GetValue<TJSONValue>('cost_components').ToString;

            FieldByName('tags').AsString := jEnvio.GetValue<TJSONValue>('tags').ToString;
            if FieldByName('tags').AsString<>'[]' then
            begin
              FieldByName('delay').AsString := jEnvio.GetValue<TJSONValue>('delay').ToString;
              FieldByName('type').AsString := jEnvio.GetValue<TJSONValue>('type').ToString;
              FieldByName('logistic_type').AsString := jEnvio.GetValue<string>('logistic_type');
              FieldByName('application_id').AsString := jEnvio.GetValue<string>('application_id');
            end;
            if FieldByName('substatus').AsString<>'' then
              FieldByName('substatus_history').AsString := jEnvio.GetValue<TJSONValue>('substatus_history').ToString;
          end;
          Post;
          dmML.dbMain.Commit;
          Application.ProcessMessages;
        end;
      end;
  finally
    jEnvio.Free;
    vQuery.Active:=False;
    vQuery.Free;
  end;
end;

function TDMR.GeNREST(_method : TRESTRequestMethod;_resource,_bearer,_body : string): TJSONValue;
begin
  try
    ResetRESTComponentsToDefaults;
    with RESTClient1 do
    begin
//      Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
//      AcceptCharset := 'utf-8, *;q=0.8';
//      AllowCookies := True;
//      AutoCreateParams := True;
      BaseURL := webUrl;
//      ContentType := 'application/json';
//      FallbackCharsetEncoding := 'utf-8';
//      HandleRedirects := True;
//      SynchronizedEvents := True;
//      UserAgent := 'Embarcadero RESTClient/1.0';
    end;
    with RESTRequest1 do
    begin
//      Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
//      AcceptCharset := 'utf-8, *;q=0.8';
//      AutoCreateParams := True;
      Client := RESTClient1;
//      HandleRedirects := True;
      Method := _method;//rmPOST;
      if (_bearer <> '') then
      begin
        Params.AddHeader('Authorization', 'Bearer ' + _bearer);
        Params.ParameterByName('Authorization').Options := [poDoNotEncode];
      end;
      if (_body <> '') then Params.AddItem('body', _body, TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);
      Resource := webRes + _resource;
      Execute();
      result := RESTRequest1.Response.JSONValue;
    end;
  except
    on e : exception do
    begin
      //ShowMessage ('Clase de error: ' + e.ClassName + chr(13) + chr(13) + 'Mensaje del error: ' + e.Message);
      result:=nil;
    end;
  end;
end;

procedure TDMR.WebCrt(_crt: String);
var _body,result: string;
begin
  _crt := StringReplace(_crt, #$D#$A, '', [rfReplaceAll]);
  _body := '{"cuit":"'+CUIT+'", "crt":"'+_crt+'"}';
  GeNREST(rmPut,'WSAAs/'+webUsr,webUpd,_body);
end;

function TDMR.WebCSR: String;
begin
  result := GeNREST(rmGet,'usuarios/'+webUsr,webUpd,'').GetValue<string>('WSAA.Csr');
end;

procedure TDMR.WebLogin;
var
  jsRequest : TJSONObject;
begin
    try
      webUpd:='';
      jsRequest := TJSONObject.Create();
      jsRequest.AddPair('username', webSecretUsr);
      jsRequest.AddPair('password', webSecretKey);
      webUpd := GeNREST(rmPost,'login/authenticate','',jsRequest.ToString).GetValue<string>();
    finally
      DM.EscribirINI;
      jsRequest.Free;
    end;
end;

procedure TDMR.WebPago;
var
  jsRequest : TJSONObject;
begin
    try
      jsRequest := TJSONObject.Create();
      jsRequest.AddPair('Nombre', Titular);
      jsRequest.AddPair('Email', Email);
      GeNREST(rmPost,'login/pagar','',jsRequest.ToString);
    finally
      jsRequest.Free;
    end;
end;

procedure TDMR.WebRegister;
var
  jsRequest, JSONWSAAItem : TJSONObject;
  JSONWSAA : TJSONArray;
begin
//  DMR := TDMR.Create(Self);
//  with DMR do
//  begin
    try
      jsRequest := TJSONObject.Create();
      jsRequest.AddPair('Nombre',WebUsr);
      jsRequest.AddPair('Contrasea', WebPsw);
      jsRequest.AddPair('Email', EMAIL);
      JSONWSAA := TJSONArray.Create;
      DM.TraerConfig;
      JSONWSAAItem := TJSONObject.Create;
      with JSONWSAAItem do
      begin
        AddPair('Cuit', CUIT);
        AddPair('Ptovta', PuntoVenta);
        AddPair('Empresa', Empresa);
        AddPair('Nombre', TITULAR);
        AddPair('Provincia', PROVINCIA);
        AddPair('Ciudad', CIUDAD);
        AddPair('Direccion', DIRECCIONCOMERCIAL);
        AddPair('Iva', catIVA);
      end;
//      JSONWSAA.Add(JSONWSAAItem);
      jsRequest.AddPair('WSAA', JSONWSAAItem);
      webUsr := DMR.GeNREST(rmPost,'Usuarios',webUpd,jsRequest.ToString).GetValue<string>();
      DM.EscribirINI;
    finally
//      jsRequest.Free;
//      JSONWSAAItem.Free;
//      JSONWSAA.Free;
    end;
//  end;
end;

function TDMR.WebLicencia: string;
var r: string;
begin
  try
    r := GeNREST(rmGet,'Usuarios/'+WebUsr,webUpd,'').GetValue<string>('Licencia');
  finally
    result := r;
  end;
end;

function TDMR.WebWsfe(_body: string): TJSONValue;
var jR, jO : TJSONObject; jV : TJSONValue; s : string;
begin
  jO := GeNREST(rmPost,'AFIPs',webUpd,_body).GetValue<TJSONObject>();
  jR := TJSONObject.Create();
    jR.AddPair('nro', jO.GetValue<string>('nro'));
    jR.AddPair('mensaje', jO.GetValue<string>('mensaje'));
    jR.AddPair('cae', jO.GetValue<string>('cae'));
    jR.AddPair('vto', jO.GetValue<string>('vto'));
  result := jR;
end;

end.
