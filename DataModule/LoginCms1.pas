// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://wsaa.afip.gov.ar/ws/services/LoginCms?WSDL
//  >Import : https://wsaa.afip.gov.ar/ws/services/LoginCms?WSDL>0
//  >Import : https://wsaa.afip.gov.ar/ws/services/LoginCms?WSDL>1
// Encoding : UTF-8
// Version  : 1.0
// (13/03/2019 19:11:51 - - $Rev: 93209 $)
// ************************************************************************ //

unit LoginCms1;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  fault                = class;                 { "https://wsaa.afip.gov.ar/ws/services/LoginCms"[Flt][GblElm] }
  LoginFault           = class;                 { "https://wsaa.afip.gov.ar/ws/services/LoginCms"[GblCplx] }



  // ************************************************************************ //
  // XML       : fault, global, <element>
  // Namespace : https://wsaa.afip.gov.ar/ws/services/LoginCms
  // Info      : Fault
  // Base Types: LoginFault
  // ************************************************************************ //
  fault = class(ERemotableException)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : LoginFault, global, <complexType>
  // Namespace : https://wsaa.afip.gov.ar/ws/services/LoginCms
  // ************************************************************************ //
  LoginFault = class(TRemotable)
  private
  published
  end;


  // ************************************************************************ //
  // Namespace : https://wsaa.afip.gov.ar/ws/services/LoginCms
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : LoginCmsSoapBinding
  // service   : LoginCMSService
  // port      : LoginCms
  // URL       : https://wsaa.afip.gov.ar/ws/services/LoginCms
  // ************************************************************************ //
  LoginCMS = interface(IInvokable)
  ['{39578F90-663B-176B-33C7-EA3AF1907F32}']
    function  loginCms(const in0: string): string; stdcall;
  end;

function GetLoginCMS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): LoginCMS;


implementation
  uses System.SysUtils;

function GetLoginCMS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): LoginCMS;
const
  defWSDL = 'https://wsaa.afip.gov.ar/ws/services/LoginCms?WSDL';
  defURL  = 'https://wsaa.afip.gov.ar/ws/services/LoginCms';
  defSvc  = 'LoginCMSService';
  defPrt  = 'LoginCms';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as LoginCMS);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { LoginCMS }
  InvRegistry.RegisterInterface(TypeInfo(LoginCMS), 'https://wsaa.afip.gov.ar/ws/services/LoginCms', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(LoginCMS), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(LoginCMS), ioDocument);
  { LoginCMS.loginCms }
  InvRegistry.RegisterMethodInfo(TypeInfo(LoginCMS), 'loginCms', '',
                                 '[ReturnName="loginCmsReturn", RequestNS="http://wsaa.view.sua.dvadac.desein.afip.gov", ResponseNS="http://wsaa.view.sua.dvadac.desein.afip.gov"]');
  RemClassRegistry.RegisterXSClass(fault, 'https://wsaa.afip.gov.ar/ws/services/LoginCms', 'fault');
  RemClassRegistry.RegisterXSClass(LoginFault, 'https://wsaa.afip.gov.ar/ws/services/LoginCms', 'LoginFault');

end.