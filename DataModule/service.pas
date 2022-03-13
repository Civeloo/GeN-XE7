// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://servicios1.afip.gov.ar/wsfev1/service.asmx?WSDL
//  >Import : https://servicios1.afip.gov.ar/wsfev1/service.asmx?WSDL>0
// Encoding : utf-8
// Version  : 1.0
// (13/03/2019 19:12:54 - - $Rev: 93209 $)
// ************************************************************************ //

unit service;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:short           - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:long            - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:double          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  FECAEResponse        = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  DocTipoResponse      = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  CbteTipoResponse     = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FEPaisResponse       = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  OpcionalTipoResponse = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  IvaTipoResponse      = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FEPtoVentaResponse   = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  ConceptoTipoResponse = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECAERequest         = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  Opcional             = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  Moneda               = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  PaisTipo             = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  IvaTipo              = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  OpcionalTipo         = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FEAuthRequest        = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECabRequest         = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECAECabRequest      = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECabResponse        = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECAECabResponse     = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  CbteAsoc             = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  CbteTipo             = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  PtoVenta             = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  DocTipo              = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  ConceptoTipo         = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FEDetRequest         = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECAEDetRequest      = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  Tributo              = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  Comprador            = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  AlicIva              = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FEDetResponse        = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECAEDetResponse     = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECAEASinMovConsResponse = class;             { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECAEASinMov         = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECAEAGet            = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECAEADetResponse    = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECAEAGetResponse    = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECAEASinMovResponse = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  TributoTipo          = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  MonedaResponse       = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECotizacionResponse = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  Cotizacion           = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FETributoResponse    = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  DummyResponse        = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FERecuperaLastCbteResponse = class;           { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECompConsultaReq    = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FERegXReqResponse    = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  Obs                  = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  Evt                  = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  Err                  = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECompConsultaResponse = class;               { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECAEADetRequest     = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECAEAResponse       = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECAEACabResponse    = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECompConsResponse   = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECAEARequest        = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  FECAEACabRequest     = class;                 { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }

  ArrayOfConceptoTipo = array of ConceptoTipo;   { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  ArrayOfIvaTipo = array of IvaTipo;            { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  ArrayOfOpcionalTipo = array of OpcionalTipo;   { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  ArrayOfPtoVenta = array of PtoVenta;          { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  ArrayOfDocTipo = array of DocTipo;            { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  ArrayOfPaisTipo = array of PaisTipo;          { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  ArrayOfCbteTipo = array of CbteTipo;          { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  ArrayOfComprador = array of Comprador;        { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  ArrayOfErr = array of Err;                    { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  ArrayOfFECAEDetResponse = array of FECAEDetResponse;   { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  ArrayOfEvt = array of Evt;                    { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }


  // ************************************************************************ //
  // XML       : FECAEResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAEResponse = class(TRemotable)
  private
    FFeCabResp: FECAECabResponse;
    FFeCabResp_Specified: boolean;
    FFeDetResp: ArrayOfFECAEDetResponse;
    FFeDetResp_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    procedure SetFeCabResp(Index: Integer; const AFECAECabResponse: FECAECabResponse);
    function  FeCabResp_Specified(Index: Integer): boolean;
    procedure SetFeDetResp(Index: Integer; const AArrayOfFECAEDetResponse: ArrayOfFECAEDetResponse);
    function  FeDetResp_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property FeCabResp: FECAECabResponse         Index (IS_OPTN) read FFeCabResp write SetFeCabResp stored FeCabResp_Specified;
    property FeDetResp: ArrayOfFECAEDetResponse  Index (IS_OPTN) read FFeDetResp write SetFeDetResp stored FeDetResp_Specified;
    property Events:    ArrayOfEvt               Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
    property Errors:    ArrayOfErr               Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
  end;



  // ************************************************************************ //
  // XML       : DocTipoResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  DocTipoResponse = class(TRemotable)
  private
    FResultGet: ArrayOfDocTipo;
    FResultGet_Specified: boolean;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    procedure SetResultGet(Index: Integer; const AArrayOfDocTipo: ArrayOfDocTipo);
    function  ResultGet_Specified(Index: Integer): boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ResultGet: ArrayOfDocTipo  Index (IS_OPTN) read FResultGet write SetResultGet stored ResultGet_Specified;
    property Errors:    ArrayOfErr      Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
    property Events:    ArrayOfEvt      Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
  end;



  // ************************************************************************ //
  // XML       : CbteTipoResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  CbteTipoResponse = class(TRemotable)
  private
    FResultGet: ArrayOfCbteTipo;
    FResultGet_Specified: boolean;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    procedure SetResultGet(Index: Integer; const AArrayOfCbteTipo: ArrayOfCbteTipo);
    function  ResultGet_Specified(Index: Integer): boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ResultGet: ArrayOfCbteTipo  Index (IS_OPTN) read FResultGet write SetResultGet stored ResultGet_Specified;
    property Errors:    ArrayOfErr       Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
    property Events:    ArrayOfEvt       Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
  end;



  // ************************************************************************ //
  // XML       : FEPaisResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FEPaisResponse = class(TRemotable)
  private
    FResultGet: ArrayOfPaisTipo;
    FResultGet_Specified: boolean;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    procedure SetResultGet(Index: Integer; const AArrayOfPaisTipo: ArrayOfPaisTipo);
    function  ResultGet_Specified(Index: Integer): boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ResultGet: ArrayOfPaisTipo  Index (IS_OPTN) read FResultGet write SetResultGet stored ResultGet_Specified;
    property Errors:    ArrayOfErr       Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
    property Events:    ArrayOfEvt       Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
  end;



  // ************************************************************************ //
  // XML       : OpcionalTipoResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  OpcionalTipoResponse = class(TRemotable)
  private
    FResultGet: ArrayOfOpcionalTipo;
    FResultGet_Specified: boolean;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    procedure SetResultGet(Index: Integer; const AArrayOfOpcionalTipo: ArrayOfOpcionalTipo);
    function  ResultGet_Specified(Index: Integer): boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ResultGet: ArrayOfOpcionalTipo  Index (IS_OPTN) read FResultGet write SetResultGet stored ResultGet_Specified;
    property Errors:    ArrayOfErr           Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
    property Events:    ArrayOfEvt           Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
  end;



  // ************************************************************************ //
  // XML       : IvaTipoResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  IvaTipoResponse = class(TRemotable)
  private
    FResultGet: ArrayOfIvaTipo;
    FResultGet_Specified: boolean;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    procedure SetResultGet(Index: Integer; const AArrayOfIvaTipo: ArrayOfIvaTipo);
    function  ResultGet_Specified(Index: Integer): boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ResultGet: ArrayOfIvaTipo  Index (IS_OPTN) read FResultGet write SetResultGet stored ResultGet_Specified;
    property Errors:    ArrayOfErr      Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
    property Events:    ArrayOfEvt      Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
  end;



  // ************************************************************************ //
  // XML       : FEPtoVentaResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FEPtoVentaResponse = class(TRemotable)
  private
    FResultGet: ArrayOfPtoVenta;
    FResultGet_Specified: boolean;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    procedure SetResultGet(Index: Integer; const AArrayOfPtoVenta: ArrayOfPtoVenta);
    function  ResultGet_Specified(Index: Integer): boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ResultGet: ArrayOfPtoVenta  Index (IS_OPTN) read FResultGet write SetResultGet stored ResultGet_Specified;
    property Errors:    ArrayOfErr       Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
    property Events:    ArrayOfEvt       Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
  end;



  // ************************************************************************ //
  // XML       : ConceptoTipoResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  ConceptoTipoResponse = class(TRemotable)
  private
    FResultGet: ArrayOfConceptoTipo;
    FResultGet_Specified: boolean;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    procedure SetResultGet(Index: Integer; const AArrayOfConceptoTipo: ArrayOfConceptoTipo);
    function  ResultGet_Specified(Index: Integer): boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ResultGet: ArrayOfConceptoTipo  Index (IS_OPTN) read FResultGet write SetResultGet stored ResultGet_Specified;
    property Errors:    ArrayOfErr           Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
    property Events:    ArrayOfEvt           Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
  end;

  ArrayOfFECAEDetRequest = array of FECAEDetRequest;   { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }


  // ************************************************************************ //
  // XML       : FECAERequest, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAERequest = class(TRemotable)
  private
    FFeCabReq: FECAECabRequest;
    FFeCabReq_Specified: boolean;
    FFeDetReq: ArrayOfFECAEDetRequest;
    FFeDetReq_Specified: boolean;
    procedure SetFeCabReq(Index: Integer; const AFECAECabRequest: FECAECabRequest);
    function  FeCabReq_Specified(Index: Integer): boolean;
    procedure SetFeDetReq(Index: Integer; const AArrayOfFECAEDetRequest: ArrayOfFECAEDetRequest);
    function  FeDetReq_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property FeCabReq: FECAECabRequest         Index (IS_OPTN) read FFeCabReq write SetFeCabReq stored FeCabReq_Specified;
    property FeDetReq: ArrayOfFECAEDetRequest  Index (IS_OPTN) read FFeDetReq write SetFeDetReq stored FeDetReq_Specified;
  end;



  // ************************************************************************ //
  // XML       : Opcional, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  Opcional = class(TRemotable)
  private
    FId: string;
    FId_Specified: boolean;
    FValor: string;
    FValor_Specified: boolean;
    procedure SetId(Index: Integer; const Astring: string);
    function  Id_Specified(Index: Integer): boolean;
    procedure SetValor(Index: Integer; const Astring: string);
    function  Valor_Specified(Index: Integer): boolean;
  published
    property Id:    string  Index (IS_OPTN) read FId write SetId stored Id_Specified;
    property Valor: string  Index (IS_OPTN) read FValor write SetValor stored Valor_Specified;
  end;



  // ************************************************************************ //
  // XML       : Moneda, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  Moneda = class(TRemotable)
  private
    FId: string;
    FId_Specified: boolean;
    FDesc: string;
    FDesc_Specified: boolean;
    FFchDesde: string;
    FFchDesde_Specified: boolean;
    FFchHasta: string;
    FFchHasta_Specified: boolean;
    procedure SetId(Index: Integer; const Astring: string);
    function  Id_Specified(Index: Integer): boolean;
    procedure SetDesc(Index: Integer; const Astring: string);
    function  Desc_Specified(Index: Integer): boolean;
    procedure SetFchDesde(Index: Integer; const Astring: string);
    function  FchDesde_Specified(Index: Integer): boolean;
    procedure SetFchHasta(Index: Integer; const Astring: string);
    function  FchHasta_Specified(Index: Integer): boolean;
  published
    property Id:       string  Index (IS_OPTN) read FId write SetId stored Id_Specified;
    property Desc:     string  Index (IS_OPTN) read FDesc write SetDesc stored Desc_Specified;
    property FchDesde: string  Index (IS_OPTN) read FFchDesde write SetFchDesde stored FchDesde_Specified;
    property FchHasta: string  Index (IS_OPTN) read FFchHasta write SetFchHasta stored FchHasta_Specified;
  end;



  // ************************************************************************ //
  // XML       : PaisTipo, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  PaisTipo = class(TRemotable)
  private
    FId: SmallInt;
    FDesc: string;
    FDesc_Specified: boolean;
    procedure SetDesc(Index: Integer; const Astring: string);
    function  Desc_Specified(Index: Integer): boolean;
  published
    property Id:   SmallInt  read FId write FId;
    property Desc: string    Index (IS_OPTN) read FDesc write SetDesc stored Desc_Specified;
  end;



  // ************************************************************************ //
  // XML       : IvaTipo, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  IvaTipo = class(TRemotable)
  private
    FId: string;
    FId_Specified: boolean;
    FDesc: string;
    FDesc_Specified: boolean;
    FFchDesde: string;
    FFchDesde_Specified: boolean;
    FFchHasta: string;
    FFchHasta_Specified: boolean;
    procedure SetId(Index: Integer; const Astring: string);
    function  Id_Specified(Index: Integer): boolean;
    procedure SetDesc(Index: Integer; const Astring: string);
    function  Desc_Specified(Index: Integer): boolean;
    procedure SetFchDesde(Index: Integer; const Astring: string);
    function  FchDesde_Specified(Index: Integer): boolean;
    procedure SetFchHasta(Index: Integer; const Astring: string);
    function  FchHasta_Specified(Index: Integer): boolean;
  published
    property Id:       string  Index (IS_OPTN) read FId write SetId stored Id_Specified;
    property Desc:     string  Index (IS_OPTN) read FDesc write SetDesc stored Desc_Specified;
    property FchDesde: string  Index (IS_OPTN) read FFchDesde write SetFchDesde stored FchDesde_Specified;
    property FchHasta: string  Index (IS_OPTN) read FFchHasta write SetFchHasta stored FchHasta_Specified;
  end;



  // ************************************************************************ //
  // XML       : OpcionalTipo, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  OpcionalTipo = class(TRemotable)
  private
    FId: string;
    FId_Specified: boolean;
    FDesc: string;
    FDesc_Specified: boolean;
    FFchDesde: string;
    FFchDesde_Specified: boolean;
    FFchHasta: string;
    FFchHasta_Specified: boolean;
    procedure SetId(Index: Integer; const Astring: string);
    function  Id_Specified(Index: Integer): boolean;
    procedure SetDesc(Index: Integer; const Astring: string);
    function  Desc_Specified(Index: Integer): boolean;
    procedure SetFchDesde(Index: Integer; const Astring: string);
    function  FchDesde_Specified(Index: Integer): boolean;
    procedure SetFchHasta(Index: Integer; const Astring: string);
    function  FchHasta_Specified(Index: Integer): boolean;
  published
    property Id:       string  Index (IS_OPTN) read FId write SetId stored Id_Specified;
    property Desc:     string  Index (IS_OPTN) read FDesc write SetDesc stored Desc_Specified;
    property FchDesde: string  Index (IS_OPTN) read FFchDesde write SetFchDesde stored FchDesde_Specified;
    property FchHasta: string  Index (IS_OPTN) read FFchHasta write SetFchHasta stored FchHasta_Specified;
  end;



  // ************************************************************************ //
  // XML       : FEAuthRequest, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FEAuthRequest = class(TRemotable)
  private
    FToken: string;
    FToken_Specified: boolean;
    FSign: string;
    FSign_Specified: boolean;
    FCuit: Int64;
    procedure SetToken(Index: Integer; const Astring: string);
    function  Token_Specified(Index: Integer): boolean;
    procedure SetSign(Index: Integer; const Astring: string);
    function  Sign_Specified(Index: Integer): boolean;
  published
    property Token: string  Index (IS_OPTN) read FToken write SetToken stored Token_Specified;
    property Sign:  string  Index (IS_OPTN) read FSign write SetSign stored Sign_Specified;
    property Cuit:  Int64   read FCuit write FCuit;
  end;



  // ************************************************************************ //
  // XML       : FECabRequest, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECabRequest = class(TRemotable)
  private
    FCantReg: Integer;
    FPtoVta: Integer;
    FCbteTipo: Integer;
  published
    property CantReg:  Integer  read FCantReg write FCantReg;
    property PtoVta:   Integer  read FPtoVta write FPtoVta;
    property CbteTipo: Integer  read FCbteTipo write FCbteTipo;
  end;



  // ************************************************************************ //
  // XML       : FECAECabRequest, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAECabRequest = class(FECabRequest)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : FECabResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECabResponse = class(TRemotable)
  private
    FCuit: Int64;
    FPtoVta: Integer;
    FCbteTipo: Integer;
    FFchProceso: string;
    FFchProceso_Specified: boolean;
    FCantReg: Integer;
    FResultado: string;
    FResultado_Specified: boolean;
    FReproceso: string;
    FReproceso_Specified: boolean;
    procedure SetFchProceso(Index: Integer; const Astring: string);
    function  FchProceso_Specified(Index: Integer): boolean;
    procedure SetResultado(Index: Integer; const Astring: string);
    function  Resultado_Specified(Index: Integer): boolean;
    procedure SetReproceso(Index: Integer; const Astring: string);
    function  Reproceso_Specified(Index: Integer): boolean;
  published
    property Cuit:       Int64    read FCuit write FCuit;
    property PtoVta:     Integer  read FPtoVta write FPtoVta;
    property CbteTipo:   Integer  read FCbteTipo write FCbteTipo;
    property FchProceso: string   Index (IS_OPTN) read FFchProceso write SetFchProceso stored FchProceso_Specified;
    property CantReg:    Integer  read FCantReg write FCantReg;
    property Resultado:  string   Index (IS_OPTN) read FResultado write SetResultado stored Resultado_Specified;
    property Reproceso:  string   Index (IS_OPTN) read FReproceso write SetReproceso stored Reproceso_Specified;
  end;



  // ************************************************************************ //
  // XML       : FECAECabResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAECabResponse = class(FECabResponse)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : CbteAsoc, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  CbteAsoc = class(TRemotable)
  private
    FTipo: Integer;
    FPtoVta: Integer;
    FNro: Int64;
    FCuit: string;
    FCuit_Specified: boolean;
    FCbteFch: string;
    FCbteFch_Specified: boolean;
    procedure SetCuit(Index: Integer; const Astring: string);
    function  Cuit_Specified(Index: Integer): boolean;
    procedure SetCbteFch(Index: Integer; const Astring: string);
    function  CbteFch_Specified(Index: Integer): boolean;
  published
    property Tipo:    Integer  read FTipo write FTipo;
    property PtoVta:  Integer  read FPtoVta write FPtoVta;
    property Nro:     Int64    read FNro write FNro;
    property Cuit:    string   Index (IS_OPTN) read FCuit write SetCuit stored Cuit_Specified;
    property CbteFch: string   Index (IS_OPTN) read FCbteFch write SetCbteFch stored CbteFch_Specified;
  end;



  // ************************************************************************ //
  // XML       : CbteTipo, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  CbteTipo = class(TRemotable)
  private
    FId: Integer;
    FDesc: string;
    FDesc_Specified: boolean;
    FFchDesde: string;
    FFchDesde_Specified: boolean;
    FFchHasta: string;
    FFchHasta_Specified: boolean;
    procedure SetDesc(Index: Integer; const Astring: string);
    function  Desc_Specified(Index: Integer): boolean;
    procedure SetFchDesde(Index: Integer; const Astring: string);
    function  FchDesde_Specified(Index: Integer): boolean;
    procedure SetFchHasta(Index: Integer; const Astring: string);
    function  FchHasta_Specified(Index: Integer): boolean;
  published
    property Id:       Integer  read FId write FId;
    property Desc:     string   Index (IS_OPTN) read FDesc write SetDesc stored Desc_Specified;
    property FchDesde: string   Index (IS_OPTN) read FFchDesde write SetFchDesde stored FchDesde_Specified;
    property FchHasta: string   Index (IS_OPTN) read FFchHasta write SetFchHasta stored FchHasta_Specified;
  end;



  // ************************************************************************ //
  // XML       : PtoVenta, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  PtoVenta = class(TRemotable)
  private
    FNro: Integer;
    FEmisionTipo: string;
    FEmisionTipo_Specified: boolean;
    FBloqueado: string;
    FBloqueado_Specified: boolean;
    FFchBaja: string;
    FFchBaja_Specified: boolean;
    procedure SetEmisionTipo(Index: Integer; const Astring: string);
    function  EmisionTipo_Specified(Index: Integer): boolean;
    procedure SetBloqueado(Index: Integer; const Astring: string);
    function  Bloqueado_Specified(Index: Integer): boolean;
    procedure SetFchBaja(Index: Integer; const Astring: string);
    function  FchBaja_Specified(Index: Integer): boolean;
  published
    property Nro:         Integer  read FNro write FNro;
    property EmisionTipo: string   Index (IS_OPTN) read FEmisionTipo write SetEmisionTipo stored EmisionTipo_Specified;
    property Bloqueado:   string   Index (IS_OPTN) read FBloqueado write SetBloqueado stored Bloqueado_Specified;
    property FchBaja:     string   Index (IS_OPTN) read FFchBaja write SetFchBaja stored FchBaja_Specified;
  end;



  // ************************************************************************ //
  // XML       : DocTipo, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  DocTipo = class(TRemotable)
  private
    FId: Integer;
    FDesc: string;
    FDesc_Specified: boolean;
    FFchDesde: string;
    FFchDesde_Specified: boolean;
    FFchHasta: string;
    FFchHasta_Specified: boolean;
    procedure SetDesc(Index: Integer; const Astring: string);
    function  Desc_Specified(Index: Integer): boolean;
    procedure SetFchDesde(Index: Integer; const Astring: string);
    function  FchDesde_Specified(Index: Integer): boolean;
    procedure SetFchHasta(Index: Integer; const Astring: string);
    function  FchHasta_Specified(Index: Integer): boolean;
  published
    property Id:       Integer  read FId write FId;
    property Desc:     string   Index (IS_OPTN) read FDesc write SetDesc stored Desc_Specified;
    property FchDesde: string   Index (IS_OPTN) read FFchDesde write SetFchDesde stored FchDesde_Specified;
    property FchHasta: string   Index (IS_OPTN) read FFchHasta write SetFchHasta stored FchHasta_Specified;
  end;



  // ************************************************************************ //
  // XML       : ConceptoTipo, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  ConceptoTipo = class(TRemotable)
  private
    FId: Integer;
    FDesc: string;
    FDesc_Specified: boolean;
    FFchDesde: string;
    FFchDesde_Specified: boolean;
    FFchHasta: string;
    FFchHasta_Specified: boolean;
    procedure SetDesc(Index: Integer; const Astring: string);
    function  Desc_Specified(Index: Integer): boolean;
    procedure SetFchDesde(Index: Integer; const Astring: string);
    function  FchDesde_Specified(Index: Integer): boolean;
    procedure SetFchHasta(Index: Integer; const Astring: string);
    function  FchHasta_Specified(Index: Integer): boolean;
  published
    property Id:       Integer  read FId write FId;
    property Desc:     string   Index (IS_OPTN) read FDesc write SetDesc stored Desc_Specified;
    property FchDesde: string   Index (IS_OPTN) read FFchDesde write SetFchDesde stored FchDesde_Specified;
    property FchHasta: string   Index (IS_OPTN) read FFchHasta write SetFchHasta stored FchHasta_Specified;
  end;

  ArrayOfTributo = array of Tributo;            { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  ArrayOfAlicIva = array of AlicIva;            { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  ArrayOfOpcional = array of Opcional;          { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }
  ArrayOfCbteAsoc = array of CbteAsoc;          { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }


  // ************************************************************************ //
  // XML       : FEDetRequest, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FEDetRequest = class(TRemotable)
  private
    FConcepto: Integer;
    FDocTipo: Integer;
    FDocNro: Int64;
    FCbteDesde: Int64;
    FCbteHasta: Int64;
    FCbteFch: string;
    FCbteFch_Specified: boolean;
    FImpTotal: Double;
    FImpTotConc: Double;
    FImpNeto: Double;
    FImpOpEx: Double;
    FImpTrib: Double;
    FImpIVA: Double;
    FFchServDesde: string;
    FFchServDesde_Specified: boolean;
    FFchServHasta: string;
    FFchServHasta_Specified: boolean;
    FFchVtoPago: string;
    FFchVtoPago_Specified: boolean;
    FMonId: string;
    FMonId_Specified: boolean;
    FMonCotiz: Double;
    FCbtesAsoc: ArrayOfCbteAsoc;
    FCbtesAsoc_Specified: boolean;
    FTributos: ArrayOfTributo;
    FTributos_Specified: boolean;
    FIva: ArrayOfAlicIva;
    FIva_Specified: boolean;
    FOpcionales: ArrayOfOpcional;
    FOpcionales_Specified: boolean;
    FCompradores: ArrayOfComprador;
    FCompradores_Specified: boolean;
    procedure SetCbteFch(Index: Integer; const Astring: string);
    function  CbteFch_Specified(Index: Integer): boolean;
    procedure SetFchServDesde(Index: Integer; const Astring: string);
    function  FchServDesde_Specified(Index: Integer): boolean;
    procedure SetFchServHasta(Index: Integer; const Astring: string);
    function  FchServHasta_Specified(Index: Integer): boolean;
    procedure SetFchVtoPago(Index: Integer; const Astring: string);
    function  FchVtoPago_Specified(Index: Integer): boolean;
    procedure SetMonId(Index: Integer; const Astring: string);
    function  MonId_Specified(Index: Integer): boolean;
    procedure SetCbtesAsoc(Index: Integer; const AArrayOfCbteAsoc: ArrayOfCbteAsoc);
    function  CbtesAsoc_Specified(Index: Integer): boolean;
    procedure SetTributos(Index: Integer; const AArrayOfTributo: ArrayOfTributo);
    function  Tributos_Specified(Index: Integer): boolean;
    procedure SetIva(Index: Integer; const AArrayOfAlicIva: ArrayOfAlicIva);
    function  Iva_Specified(Index: Integer): boolean;
    procedure SetOpcionales(Index: Integer; const AArrayOfOpcional: ArrayOfOpcional);
    function  Opcionales_Specified(Index: Integer): boolean;
    procedure SetCompradores(Index: Integer; const AArrayOfComprador: ArrayOfComprador);
    function  Compradores_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property Concepto:     Integer           read FConcepto write FConcepto;
    property DocTipo:      Integer           read FDocTipo write FDocTipo;
    property DocNro:       Int64             read FDocNro write FDocNro;
    property CbteDesde:    Int64             read FCbteDesde write FCbteDesde;
    property CbteHasta:    Int64             read FCbteHasta write FCbteHasta;
    property CbteFch:      string            Index (IS_OPTN) read FCbteFch write SetCbteFch stored CbteFch_Specified;
    property ImpTotal:     Double            read FImpTotal write FImpTotal;
    property ImpTotConc:   Double            read FImpTotConc write FImpTotConc;
    property ImpNeto:      Double            read FImpNeto write FImpNeto;
    property ImpOpEx:      Double            read FImpOpEx write FImpOpEx;
    property ImpTrib:      Double            read FImpTrib write FImpTrib;
    property ImpIVA:       Double            read FImpIVA write FImpIVA;
    property FchServDesde: string            Index (IS_OPTN) read FFchServDesde write SetFchServDesde stored FchServDesde_Specified;
    property FchServHasta: string            Index (IS_OPTN) read FFchServHasta write SetFchServHasta stored FchServHasta_Specified;
    property FchVtoPago:   string            Index (IS_OPTN) read FFchVtoPago write SetFchVtoPago stored FchVtoPago_Specified;
    property MonId:        string            Index (IS_OPTN) read FMonId write SetMonId stored MonId_Specified;
    property MonCotiz:     Double            read FMonCotiz write FMonCotiz;
    property CbtesAsoc:    ArrayOfCbteAsoc   Index (IS_OPTN) read FCbtesAsoc write SetCbtesAsoc stored CbtesAsoc_Specified;
    property Tributos:     ArrayOfTributo    Index (IS_OPTN) read FTributos write SetTributos stored Tributos_Specified;
    property Iva:          ArrayOfAlicIva    Index (IS_OPTN) read FIva write SetIva stored Iva_Specified;
    property Opcionales:   ArrayOfOpcional   Index (IS_OPTN) read FOpcionales write SetOpcionales stored Opcionales_Specified;
    property Compradores:  ArrayOfComprador  Index (IS_OPTN) read FCompradores write SetCompradores stored Compradores_Specified;
  end;



  // ************************************************************************ //
  // XML       : FECAEDetRequest, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAEDetRequest = class(FEDetRequest)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : Tributo, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  Tributo = class(TRemotable)
  private
    FId: SmallInt;
    FDesc: string;
    FDesc_Specified: boolean;
    FBaseImp: Double;
    FAlic: Double;
    FImporte: Double;
    procedure SetDesc(Index: Integer; const Astring: string);
    function  Desc_Specified(Index: Integer): boolean;
  published
    property Id:      SmallInt  read FId write FId;
    property Desc:    string    Index (IS_OPTN) read FDesc write SetDesc stored Desc_Specified;
    property BaseImp: Double    read FBaseImp write FBaseImp;
    property Alic:    Double    read FAlic write FAlic;
    property Importe: Double    read FImporte write FImporte;
  end;



  // ************************************************************************ //
  // XML       : Comprador, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  Comprador = class(TRemotable)
  private
    FDocTipo: Integer;
    FDocNro: Int64;
    FPorcentaje: Double;
  published
    property DocTipo:    Integer  read FDocTipo write FDocTipo;
    property DocNro:     Int64    read FDocNro write FDocNro;
    property Porcentaje: Double   read FPorcentaje write FPorcentaje;
  end;



  // ************************************************************************ //
  // XML       : AlicIva, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  AlicIva = class(TRemotable)
  private
    FId: Integer;
    FBaseImp: Double;
    FImporte: Double;
  published
    property Id:      Integer  read FId write FId;
    property BaseImp: Double   read FBaseImp write FBaseImp;
    property Importe: Double   read FImporte write FImporte;
  end;

  ArrayOfObs = array of Obs;                    { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }


  // ************************************************************************ //
  // XML       : FEDetResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FEDetResponse = class(TRemotable)
  private
    FConcepto: Integer;
    FDocTipo: Integer;
    FDocNro: Int64;
    FCbteDesde: Int64;
    FCbteHasta: Int64;
    FCbteFch: string;
    FCbteFch_Specified: boolean;
    FResultado: string;
    FResultado_Specified: boolean;
    FObservaciones: ArrayOfObs;
    FObservaciones_Specified: boolean;
    procedure SetCbteFch(Index: Integer; const Astring: string);
    function  CbteFch_Specified(Index: Integer): boolean;
    procedure SetResultado(Index: Integer; const Astring: string);
    function  Resultado_Specified(Index: Integer): boolean;
    procedure SetObservaciones(Index: Integer; const AArrayOfObs: ArrayOfObs);
    function  Observaciones_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property Concepto:      Integer     read FConcepto write FConcepto;
    property DocTipo:       Integer     read FDocTipo write FDocTipo;
    property DocNro:        Int64       read FDocNro write FDocNro;
    property CbteDesde:     Int64       read FCbteDesde write FCbteDesde;
    property CbteHasta:     Int64       read FCbteHasta write FCbteHasta;
    property CbteFch:       string      Index (IS_OPTN) read FCbteFch write SetCbteFch stored CbteFch_Specified;
    property Resultado:     string      Index (IS_OPTN) read FResultado write SetResultado stored Resultado_Specified;
    property Observaciones: ArrayOfObs  Index (IS_OPTN) read FObservaciones write SetObservaciones stored Observaciones_Specified;
  end;



  // ************************************************************************ //
  // XML       : FECAEDetResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAEDetResponse = class(FEDetResponse)
  private
    FCAE: string;
    FCAE_Specified: boolean;
    FCAEFchVto: string;
    FCAEFchVto_Specified: boolean;
    procedure SetCAE(Index: Integer; const Astring: string);
    function  CAE_Specified(Index: Integer): boolean;
    procedure SetCAEFchVto(Index: Integer; const Astring: string);
    function  CAEFchVto_Specified(Index: Integer): boolean;
  published
    property CAE:       string  Index (IS_OPTN) read FCAE write SetCAE stored CAE_Specified;
    property CAEFchVto: string  Index (IS_OPTN) read FCAEFchVto write SetCAEFchVto stored CAEFchVto_Specified;
  end;

  ArrayOfFECAEASinMov = array of FECAEASinMov;   { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }


  // ************************************************************************ //
  // XML       : FECAEASinMovConsResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAEASinMovConsResponse = class(TRemotable)
  private
    FResultGet: ArrayOfFECAEASinMov;
    FResultGet_Specified: boolean;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    procedure SetResultGet(Index: Integer; const AArrayOfFECAEASinMov: ArrayOfFECAEASinMov);
    function  ResultGet_Specified(Index: Integer): boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ResultGet: ArrayOfFECAEASinMov  Index (IS_OPTN) read FResultGet write SetResultGet stored ResultGet_Specified;
    property Errors:    ArrayOfErr           Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
    property Events:    ArrayOfEvt           Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
  end;



  // ************************************************************************ //
  // XML       : FECAEASinMov, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAEASinMov = class(TRemotable)
  private
    FCAEA: string;
    FCAEA_Specified: boolean;
    FFchProceso: string;
    FFchProceso_Specified: boolean;
    FPtoVta: Integer;
    procedure SetCAEA(Index: Integer; const Astring: string);
    function  CAEA_Specified(Index: Integer): boolean;
    procedure SetFchProceso(Index: Integer; const Astring: string);
    function  FchProceso_Specified(Index: Integer): boolean;
  published
    property CAEA:       string   Index (IS_OPTN) read FCAEA write SetCAEA stored CAEA_Specified;
    property FchProceso: string   Index (IS_OPTN) read FFchProceso write SetFchProceso stored FchProceso_Specified;
    property PtoVta:     Integer  read FPtoVta write FPtoVta;
  end;



  // ************************************************************************ //
  // XML       : FECAEAGet, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAEAGet = class(TRemotable)
  private
    FCAEA: string;
    FCAEA_Specified: boolean;
    FPeriodo: Integer;
    FOrden: SmallInt;
    FFchVigDesde: string;
    FFchVigDesde_Specified: boolean;
    FFchVigHasta: string;
    FFchVigHasta_Specified: boolean;
    FFchTopeInf: string;
    FFchTopeInf_Specified: boolean;
    FFchProceso: string;
    FFchProceso_Specified: boolean;
    FObservaciones: ArrayOfObs;
    FObservaciones_Specified: boolean;
    procedure SetCAEA(Index: Integer; const Astring: string);
    function  CAEA_Specified(Index: Integer): boolean;
    procedure SetFchVigDesde(Index: Integer; const Astring: string);
    function  FchVigDesde_Specified(Index: Integer): boolean;
    procedure SetFchVigHasta(Index: Integer; const Astring: string);
    function  FchVigHasta_Specified(Index: Integer): boolean;
    procedure SetFchTopeInf(Index: Integer; const Astring: string);
    function  FchTopeInf_Specified(Index: Integer): boolean;
    procedure SetFchProceso(Index: Integer; const Astring: string);
    function  FchProceso_Specified(Index: Integer): boolean;
    procedure SetObservaciones(Index: Integer; const AArrayOfObs: ArrayOfObs);
    function  Observaciones_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property CAEA:          string      Index (IS_OPTN) read FCAEA write SetCAEA stored CAEA_Specified;
    property Periodo:       Integer     read FPeriodo write FPeriodo;
    property Orden:         SmallInt    read FOrden write FOrden;
    property FchVigDesde:   string      Index (IS_OPTN) read FFchVigDesde write SetFchVigDesde stored FchVigDesde_Specified;
    property FchVigHasta:   string      Index (IS_OPTN) read FFchVigHasta write SetFchVigHasta stored FchVigHasta_Specified;
    property FchTopeInf:    string      Index (IS_OPTN) read FFchTopeInf write SetFchTopeInf stored FchTopeInf_Specified;
    property FchProceso:    string      Index (IS_OPTN) read FFchProceso write SetFchProceso stored FchProceso_Specified;
    property Observaciones: ArrayOfObs  Index (IS_OPTN) read FObservaciones write SetObservaciones stored Observaciones_Specified;
  end;

  ArrayOfFECAEADetResponse = array of FECAEADetResponse;   { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }


  // ************************************************************************ //
  // XML       : FECAEADetResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAEADetResponse = class(FEDetResponse)
  private
    FCAEA: string;
    FCAEA_Specified: boolean;
    procedure SetCAEA(Index: Integer; const Astring: string);
    function  CAEA_Specified(Index: Integer): boolean;
  published
    property CAEA: string  Index (IS_OPTN) read FCAEA write SetCAEA stored CAEA_Specified;
  end;



  // ************************************************************************ //
  // XML       : FECAEAGetResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAEAGetResponse = class(TRemotable)
  private
    FResultGet: FECAEAGet;
    FResultGet_Specified: boolean;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    procedure SetResultGet(Index: Integer; const AFECAEAGet: FECAEAGet);
    function  ResultGet_Specified(Index: Integer): boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ResultGet: FECAEAGet   Index (IS_OPTN) read FResultGet write SetResultGet stored ResultGet_Specified;
    property Errors:    ArrayOfErr  Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
    property Events:    ArrayOfEvt  Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
  end;



  // ************************************************************************ //
  // XML       : FECAEASinMovResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAEASinMovResponse = class(FECAEASinMov)
  private
    FResultado: string;
    FResultado_Specified: boolean;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    procedure SetResultado(Index: Integer; const Astring: string);
    function  Resultado_Specified(Index: Integer): boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property Resultado: string      Index (IS_OPTN) read FResultado write SetResultado stored Resultado_Specified;
    property Errors:    ArrayOfErr  Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
    property Events:    ArrayOfEvt  Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
  end;



  // ************************************************************************ //
  // XML       : TributoTipo, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  TributoTipo = class(TRemotable)
  private
    FId: SmallInt;
    FDesc: string;
    FDesc_Specified: boolean;
    FFchDesde: string;
    FFchDesde_Specified: boolean;
    FFchHasta: string;
    FFchHasta_Specified: boolean;
    procedure SetDesc(Index: Integer; const Astring: string);
    function  Desc_Specified(Index: Integer): boolean;
    procedure SetFchDesde(Index: Integer; const Astring: string);
    function  FchDesde_Specified(Index: Integer): boolean;
    procedure SetFchHasta(Index: Integer; const Astring: string);
    function  FchHasta_Specified(Index: Integer): boolean;
  published
    property Id:       SmallInt  read FId write FId;
    property Desc:     string    Index (IS_OPTN) read FDesc write SetDesc stored Desc_Specified;
    property FchDesde: string    Index (IS_OPTN) read FFchDesde write SetFchDesde stored FchDesde_Specified;
    property FchHasta: string    Index (IS_OPTN) read FFchHasta write SetFchHasta stored FchHasta_Specified;
  end;

  ArrayOfMoneda = array of Moneda;              { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }


  // ************************************************************************ //
  // XML       : MonedaResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  MonedaResponse = class(TRemotable)
  private
    FResultGet: ArrayOfMoneda;
    FResultGet_Specified: boolean;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    procedure SetResultGet(Index: Integer; const AArrayOfMoneda: ArrayOfMoneda);
    function  ResultGet_Specified(Index: Integer): boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ResultGet: ArrayOfMoneda  Index (IS_OPTN) read FResultGet write SetResultGet stored ResultGet_Specified;
    property Errors:    ArrayOfErr     Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
    property Events:    ArrayOfEvt     Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
  end;

  ArrayOfTributoTipo = array of TributoTipo;    { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }


  // ************************************************************************ //
  // XML       : FECotizacionResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECotizacionResponse = class(TRemotable)
  private
    FResultGet: Cotizacion;
    FResultGet_Specified: boolean;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    procedure SetResultGet(Index: Integer; const ACotizacion: Cotizacion);
    function  ResultGet_Specified(Index: Integer): boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ResultGet: Cotizacion  Index (IS_OPTN) read FResultGet write SetResultGet stored ResultGet_Specified;
    property Errors:    ArrayOfErr  Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
    property Events:    ArrayOfEvt  Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
  end;



  // ************************************************************************ //
  // XML       : Cotizacion, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  Cotizacion = class(TRemotable)
  private
    FMonId: string;
    FMonId_Specified: boolean;
    FMonCotiz: Double;
    FFchCotiz: string;
    FFchCotiz_Specified: boolean;
    procedure SetMonId(Index: Integer; const Astring: string);
    function  MonId_Specified(Index: Integer): boolean;
    procedure SetFchCotiz(Index: Integer; const Astring: string);
    function  FchCotiz_Specified(Index: Integer): boolean;
  published
    property MonId:    string  Index (IS_OPTN) read FMonId write SetMonId stored MonId_Specified;
    property MonCotiz: Double  read FMonCotiz write FMonCotiz;
    property FchCotiz: string  Index (IS_OPTN) read FFchCotiz write SetFchCotiz stored FchCotiz_Specified;
  end;



  // ************************************************************************ //
  // XML       : FETributoResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FETributoResponse = class(TRemotable)
  private
    FResultGet: ArrayOfTributoTipo;
    FResultGet_Specified: boolean;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    procedure SetResultGet(Index: Integer; const AArrayOfTributoTipo: ArrayOfTributoTipo);
    function  ResultGet_Specified(Index: Integer): boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ResultGet: ArrayOfTributoTipo  Index (IS_OPTN) read FResultGet write SetResultGet stored ResultGet_Specified;
    property Errors:    ArrayOfErr          Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
    property Events:    ArrayOfEvt          Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
  end;



  // ************************************************************************ //
  // XML       : DummyResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  DummyResponse = class(TRemotable)
  private
    FAppServer: string;
    FAppServer_Specified: boolean;
    FDbServer: string;
    FDbServer_Specified: boolean;
    FAuthServer: string;
    FAuthServer_Specified: boolean;
    procedure SetAppServer(Index: Integer; const Astring: string);
    function  AppServer_Specified(Index: Integer): boolean;
    procedure SetDbServer(Index: Integer; const Astring: string);
    function  DbServer_Specified(Index: Integer): boolean;
    procedure SetAuthServer(Index: Integer; const Astring: string);
    function  AuthServer_Specified(Index: Integer): boolean;
  published
    property AppServer:  string  Index (IS_OPTN) read FAppServer write SetAppServer stored AppServer_Specified;
    property DbServer:   string  Index (IS_OPTN) read FDbServer write SetDbServer stored DbServer_Specified;
    property AuthServer: string  Index (IS_OPTN) read FAuthServer write SetAuthServer stored AuthServer_Specified;
  end;



  // ************************************************************************ //
  // XML       : FERecuperaLastCbteResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FERecuperaLastCbteResponse = class(TRemotable)
  private
    FPtoVta: Integer;
    FCbteTipo: Integer;
    FCbteNro: Integer;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property PtoVta:   Integer     read FPtoVta write FPtoVta;
    property CbteTipo: Integer     read FCbteTipo write FCbteTipo;
    property CbteNro:  Integer     read FCbteNro write FCbteNro;
    property Errors:   ArrayOfErr  Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
    property Events:   ArrayOfEvt  Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
  end;



  // ************************************************************************ //
  // XML       : FECompConsultaReq, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECompConsultaReq = class(TRemotable)
  private
    FCbteTipo: Integer;
    FCbteNro: Int64;
    FPtoVta: Integer;
  published
    property CbteTipo: Integer  read FCbteTipo write FCbteTipo;
    property CbteNro:  Int64    read FCbteNro write FCbteNro;
    property PtoVta:   Integer  read FPtoVta write FPtoVta;
  end;



  // ************************************************************************ //
  // XML       : FERegXReqResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FERegXReqResponse = class(TRemotable)
  private
    FRegXReq: Integer;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property RegXReq: Integer     read FRegXReq write FRegXReq;
    property Errors:  ArrayOfErr  Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
    property Events:  ArrayOfEvt  Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
  end;



  // ************************************************************************ //
  // XML       : Obs, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  Obs = class(TRemotable)
  private
    FCode: Integer;
    FMsg: string;
    FMsg_Specified: boolean;
    procedure SetMsg(Index: Integer; const Astring: string);
    function  Msg_Specified(Index: Integer): boolean;
  published
    property Code: Integer  read FCode write FCode;
    property Msg:  string   Index (IS_OPTN) read FMsg write SetMsg stored Msg_Specified;
  end;



  // ************************************************************************ //
  // XML       : Evt, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  Evt = class(TRemotable)
  private
    FCode: Integer;
    FMsg: string;
    FMsg_Specified: boolean;
    procedure SetMsg(Index: Integer; const Astring: string);
    function  Msg_Specified(Index: Integer): boolean;
  published
    property Code: Integer  read FCode write FCode;
    property Msg:  string   Index (IS_OPTN) read FMsg write SetMsg stored Msg_Specified;
  end;



  // ************************************************************************ //
  // XML       : Err, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  Err = class(TRemotable)
  private
    FCode: Integer;
    FMsg: string;
    FMsg_Specified: boolean;
    procedure SetMsg(Index: Integer; const Astring: string);
    function  Msg_Specified(Index: Integer): boolean;
  published
    property Code: Integer  read FCode write FCode;
    property Msg:  string   Index (IS_OPTN) read FMsg write SetMsg stored Msg_Specified;
  end;



  // ************************************************************************ //
  // XML       : FECompConsultaResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECompConsultaResponse = class(TRemotable)
  private
    FResultGet: FECompConsResponse;
    FResultGet_Specified: boolean;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    procedure SetResultGet(Index: Integer; const AFECompConsResponse: FECompConsResponse);
    function  ResultGet_Specified(Index: Integer): boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ResultGet: FECompConsResponse  Index (IS_OPTN) read FResultGet write SetResultGet stored ResultGet_Specified;
    property Errors:    ArrayOfErr          Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
    property Events:    ArrayOfEvt          Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
  end;



  // ************************************************************************ //
  // XML       : FECAEADetRequest, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAEADetRequest = class(FEDetRequest)
  private
    FCAEA: string;
    FCAEA_Specified: boolean;
    FCbteFchHsGen: string;
    FCbteFchHsGen_Specified: boolean;
    procedure SetCAEA(Index: Integer; const Astring: string);
    function  CAEA_Specified(Index: Integer): boolean;
    procedure SetCbteFchHsGen(Index: Integer; const Astring: string);
    function  CbteFchHsGen_Specified(Index: Integer): boolean;
  published
    property CAEA:         string  Index (IS_OPTN) read FCAEA write SetCAEA stored CAEA_Specified;
    property CbteFchHsGen: string  Index (IS_OPTN) read FCbteFchHsGen write SetCbteFchHsGen stored CbteFchHsGen_Specified;
  end;



  // ************************************************************************ //
  // XML       : FECAEAResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAEAResponse = class(TRemotable)
  private
    FFeCabResp: FECAEACabResponse;
    FFeCabResp_Specified: boolean;
    FFeDetResp: ArrayOfFECAEADetResponse;
    FFeDetResp_Specified: boolean;
    FEvents: ArrayOfEvt;
    FEvents_Specified: boolean;
    FErrors: ArrayOfErr;
    FErrors_Specified: boolean;
    procedure SetFeCabResp(Index: Integer; const AFECAEACabResponse: FECAEACabResponse);
    function  FeCabResp_Specified(Index: Integer): boolean;
    procedure SetFeDetResp(Index: Integer; const AArrayOfFECAEADetResponse: ArrayOfFECAEADetResponse);
    function  FeDetResp_Specified(Index: Integer): boolean;
    procedure SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
    function  Events_Specified(Index: Integer): boolean;
    procedure SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
    function  Errors_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property FeCabResp: FECAEACabResponse         Index (IS_OPTN) read FFeCabResp write SetFeCabResp stored FeCabResp_Specified;
    property FeDetResp: ArrayOfFECAEADetResponse  Index (IS_OPTN) read FFeDetResp write SetFeDetResp stored FeDetResp_Specified;
    property Events:    ArrayOfEvt                Index (IS_OPTN) read FEvents write SetEvents stored Events_Specified;
    property Errors:    ArrayOfErr                Index (IS_OPTN) read FErrors write SetErrors stored Errors_Specified;
  end;



  // ************************************************************************ //
  // XML       : FECAEACabResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAEACabResponse = class(FECabResponse)
  private
  published
  end;

  ArrayOfFECAEADetRequest = array of FECAEADetRequest;   { "http://ar.gov.afip.dif.FEV1/"[GblCplx] }


  // ************************************************************************ //
  // XML       : FECompConsResponse, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECompConsResponse = class(FECAEDetRequest)
  private
    FResultado: string;
    FResultado_Specified: boolean;
    FCodAutorizacion: string;
    FCodAutorizacion_Specified: boolean;
    FEmisionTipo: string;
    FEmisionTipo_Specified: boolean;
    FFchVto: string;
    FFchVto_Specified: boolean;
    FFchProceso: string;
    FFchProceso_Specified: boolean;
    FObservaciones: ArrayOfObs;
    FObservaciones_Specified: boolean;
    FPtoVta: Integer;
    FCbteTipo: Integer;
    procedure SetResultado(Index: Integer; const Astring: string);
    function  Resultado_Specified(Index: Integer): boolean;
    procedure SetCodAutorizacion(Index: Integer; const Astring: string);
    function  CodAutorizacion_Specified(Index: Integer): boolean;
    procedure SetEmisionTipo(Index: Integer; const Astring: string);
    function  EmisionTipo_Specified(Index: Integer): boolean;
    procedure SetFchVto(Index: Integer; const Astring: string);
    function  FchVto_Specified(Index: Integer): boolean;
    procedure SetFchProceso(Index: Integer; const Astring: string);
    function  FchProceso_Specified(Index: Integer): boolean;
    procedure SetObservaciones(Index: Integer; const AArrayOfObs: ArrayOfObs);
    function  Observaciones_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property Resultado:       string      Index (IS_OPTN) read FResultado write SetResultado stored Resultado_Specified;
    property CodAutorizacion: string      Index (IS_OPTN) read FCodAutorizacion write SetCodAutorizacion stored CodAutorizacion_Specified;
    property EmisionTipo:     string      Index (IS_OPTN) read FEmisionTipo write SetEmisionTipo stored EmisionTipo_Specified;
    property FchVto:          string      Index (IS_OPTN) read FFchVto write SetFchVto stored FchVto_Specified;
    property FchProceso:      string      Index (IS_OPTN) read FFchProceso write SetFchProceso stored FchProceso_Specified;
    property Observaciones:   ArrayOfObs  Index (IS_OPTN) read FObservaciones write SetObservaciones stored Observaciones_Specified;
    property PtoVta:          Integer     read FPtoVta write FPtoVta;
    property CbteTipo:        Integer     read FCbteTipo write FCbteTipo;
  end;



  // ************************************************************************ //
  // XML       : FECAEARequest, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAEARequest = class(TRemotable)
  private
    FFeCabReq: FECAEACabRequest;
    FFeCabReq_Specified: boolean;
    FFeDetReq: ArrayOfFECAEADetRequest;
    FFeDetReq_Specified: boolean;
    procedure SetFeCabReq(Index: Integer; const AFECAEACabRequest: FECAEACabRequest);
    function  FeCabReq_Specified(Index: Integer): boolean;
    procedure SetFeDetReq(Index: Integer; const AArrayOfFECAEADetRequest: ArrayOfFECAEADetRequest);
    function  FeDetReq_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property FeCabReq: FECAEACabRequest         Index (IS_OPTN) read FFeCabReq write SetFeCabReq stored FeCabReq_Specified;
    property FeDetReq: ArrayOfFECAEADetRequest  Index (IS_OPTN) read FFeDetReq write SetFeDetReq stored FeDetReq_Specified;
  end;



  // ************************************************************************ //
  // XML       : FECAEACabRequest, global, <complexType>
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // ************************************************************************ //
  FECAEACabRequest = class(FECabRequest)
  private
  published
  end;


  // ************************************************************************ //
  // Namespace : http://ar.gov.afip.dif.FEV1/
  // soapAction: http://ar.gov.afip.dif.FEV1/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : ServiceSoap
  // service   : Service
  // port      : ServiceSoap
  // URL       : https://servicios1.afip.gov.ar/wsfev1/service.asmx
  // ************************************************************************ //
  ServiceSoap = interface(IInvokable)
  ['{05274D74-5C3D-E536-980E-D9CE5D67F5D9}']
    function  FECAESolicitar(const Auth: FEAuthRequest; const FeCAEReq: FECAERequest): FECAEResponse; stdcall;
    function  FECompTotXRequest(const Auth: FEAuthRequest): FERegXReqResponse; stdcall;
    function  FEDummy: DummyResponse; stdcall;
    function  FECompUltimoAutorizado(const Auth: FEAuthRequest; const PtoVta: Integer; const CbteTipo: Integer): FERecuperaLastCbteResponse; stdcall;
    function  FECompConsultar(const Auth: FEAuthRequest; const FeCompConsReq: FECompConsultaReq): FECompConsultaResponse; stdcall;
    function  FECAEARegInformativo(const Auth: FEAuthRequest; const FeCAEARegInfReq: FECAEARequest): FECAEAResponse; stdcall;
    function  FECAEASolicitar(const Auth: FEAuthRequest; const Periodo: Integer; const Orden: SmallInt): FECAEAGetResponse; stdcall;
    function  FECAEASinMovimientoConsultar(const Auth: FEAuthRequest; const CAEA: string; const PtoVta: Integer): FECAEASinMovConsResponse; stdcall;
    function  FECAEASinMovimientoInformar(const Auth: FEAuthRequest; const PtoVta: Integer; const CAEA: string): FECAEASinMovResponse; stdcall;
    function  FECAEAConsultar(const Auth: FEAuthRequest; const Periodo: Integer; const Orden: SmallInt): FECAEAGetResponse; stdcall;
    function  FEParamGetCotizacion(const Auth: FEAuthRequest; const MonId: string): FECotizacionResponse; stdcall;
    function  FEParamGetTiposTributos(const Auth: FEAuthRequest): FETributoResponse; stdcall;
    function  FEParamGetTiposMonedas(const Auth: FEAuthRequest): MonedaResponse; stdcall;
    function  FEParamGetTiposIva(const Auth: FEAuthRequest): IvaTipoResponse; stdcall;
    function  FEParamGetTiposOpcional(const Auth: FEAuthRequest): OpcionalTipoResponse; stdcall;
    function  FEParamGetTiposConcepto(const Auth: FEAuthRequest): ConceptoTipoResponse; stdcall;
    function  FEParamGetPtosVenta(const Auth: FEAuthRequest): FEPtoVentaResponse; stdcall;
    function  FEParamGetTiposCbte(const Auth: FEAuthRequest): CbteTipoResponse; stdcall;
    function  FEParamGetTiposDoc(const Auth: FEAuthRequest): DocTipoResponse; stdcall;
    function  FEParamGetTiposPaises(const Auth: FEAuthRequest): FEPaisResponse; stdcall;
  end;

function GetServiceSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ServiceSoap;


implementation
  uses System.SysUtils;

function GetServiceSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ServiceSoap;
const
  defWSDL = 'https://servicios1.afip.gov.ar/wsfev1/service.asmx?WSDL';
  defURL  = 'https://servicios1.afip.gov.ar/wsfev1/service.asmx';
  defSvc  = 'Service';
  defPrt  = 'ServiceSoap';
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
    Result := (RIO as ServiceSoap);
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


destructor FECAEResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FFeDetResp)-1 do
    System.SysUtils.FreeAndNil(FFeDetResp[I]);
  System.SetLength(FFeDetResp, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  System.SysUtils.FreeAndNil(FFeCabResp);
  inherited Destroy;
end;

procedure FECAEResponse.SetFeCabResp(Index: Integer; const AFECAECabResponse: FECAECabResponse);
begin
  FFeCabResp := AFECAECabResponse;
  FFeCabResp_Specified := True;
end;

function FECAEResponse.FeCabResp_Specified(Index: Integer): boolean;
begin
  Result := FFeCabResp_Specified;
end;

procedure FECAEResponse.SetFeDetResp(Index: Integer; const AArrayOfFECAEDetResponse: ArrayOfFECAEDetResponse);
begin
  FFeDetResp := AArrayOfFECAEDetResponse;
  FFeDetResp_Specified := True;
end;

function FECAEResponse.FeDetResp_Specified(Index: Integer): boolean;
begin
  Result := FFeDetResp_Specified;
end;

procedure FECAEResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function FECAEResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

procedure FECAEResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function FECAEResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

destructor DocTipoResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FResultGet)-1 do
    System.SysUtils.FreeAndNil(FResultGet[I]);
  System.SetLength(FResultGet, 0);
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  inherited Destroy;
end;

procedure DocTipoResponse.SetResultGet(Index: Integer; const AArrayOfDocTipo: ArrayOfDocTipo);
begin
  FResultGet := AArrayOfDocTipo;
  FResultGet_Specified := True;
end;

function DocTipoResponse.ResultGet_Specified(Index: Integer): boolean;
begin
  Result := FResultGet_Specified;
end;

procedure DocTipoResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function DocTipoResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

procedure DocTipoResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function DocTipoResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

destructor CbteTipoResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FResultGet)-1 do
    System.SysUtils.FreeAndNil(FResultGet[I]);
  System.SetLength(FResultGet, 0);
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  inherited Destroy;
end;

procedure CbteTipoResponse.SetResultGet(Index: Integer; const AArrayOfCbteTipo: ArrayOfCbteTipo);
begin
  FResultGet := AArrayOfCbteTipo;
  FResultGet_Specified := True;
end;

function CbteTipoResponse.ResultGet_Specified(Index: Integer): boolean;
begin
  Result := FResultGet_Specified;
end;

procedure CbteTipoResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function CbteTipoResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

procedure CbteTipoResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function CbteTipoResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

destructor FEPaisResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FResultGet)-1 do
    System.SysUtils.FreeAndNil(FResultGet[I]);
  System.SetLength(FResultGet, 0);
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  inherited Destroy;
end;

procedure FEPaisResponse.SetResultGet(Index: Integer; const AArrayOfPaisTipo: ArrayOfPaisTipo);
begin
  FResultGet := AArrayOfPaisTipo;
  FResultGet_Specified := True;
end;

function FEPaisResponse.ResultGet_Specified(Index: Integer): boolean;
begin
  Result := FResultGet_Specified;
end;

procedure FEPaisResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function FEPaisResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

procedure FEPaisResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function FEPaisResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

destructor OpcionalTipoResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FResultGet)-1 do
    System.SysUtils.FreeAndNil(FResultGet[I]);
  System.SetLength(FResultGet, 0);
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  inherited Destroy;
end;

procedure OpcionalTipoResponse.SetResultGet(Index: Integer; const AArrayOfOpcionalTipo: ArrayOfOpcionalTipo);
begin
  FResultGet := AArrayOfOpcionalTipo;
  FResultGet_Specified := True;
end;

function OpcionalTipoResponse.ResultGet_Specified(Index: Integer): boolean;
begin
  Result := FResultGet_Specified;
end;

procedure OpcionalTipoResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function OpcionalTipoResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

procedure OpcionalTipoResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function OpcionalTipoResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

destructor IvaTipoResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FResultGet)-1 do
    System.SysUtils.FreeAndNil(FResultGet[I]);
  System.SetLength(FResultGet, 0);
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  inherited Destroy;
end;

procedure IvaTipoResponse.SetResultGet(Index: Integer; const AArrayOfIvaTipo: ArrayOfIvaTipo);
begin
  FResultGet := AArrayOfIvaTipo;
  FResultGet_Specified := True;
end;

function IvaTipoResponse.ResultGet_Specified(Index: Integer): boolean;
begin
  Result := FResultGet_Specified;
end;

procedure IvaTipoResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function IvaTipoResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

procedure IvaTipoResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function IvaTipoResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

destructor FEPtoVentaResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FResultGet)-1 do
    System.SysUtils.FreeAndNil(FResultGet[I]);
  System.SetLength(FResultGet, 0);
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  inherited Destroy;
end;

procedure FEPtoVentaResponse.SetResultGet(Index: Integer; const AArrayOfPtoVenta: ArrayOfPtoVenta);
begin
  FResultGet := AArrayOfPtoVenta;
  FResultGet_Specified := True;
end;

function FEPtoVentaResponse.ResultGet_Specified(Index: Integer): boolean;
begin
  Result := FResultGet_Specified;
end;

procedure FEPtoVentaResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function FEPtoVentaResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

procedure FEPtoVentaResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function FEPtoVentaResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

destructor ConceptoTipoResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FResultGet)-1 do
    System.SysUtils.FreeAndNil(FResultGet[I]);
  System.SetLength(FResultGet, 0);
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  inherited Destroy;
end;

procedure ConceptoTipoResponse.SetResultGet(Index: Integer; const AArrayOfConceptoTipo: ArrayOfConceptoTipo);
begin
  FResultGet := AArrayOfConceptoTipo;
  FResultGet_Specified := True;
end;

function ConceptoTipoResponse.ResultGet_Specified(Index: Integer): boolean;
begin
  Result := FResultGet_Specified;
end;

procedure ConceptoTipoResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function ConceptoTipoResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

procedure ConceptoTipoResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function ConceptoTipoResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

destructor FECAERequest.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FFeDetReq)-1 do
    System.SysUtils.FreeAndNil(FFeDetReq[I]);
  System.SetLength(FFeDetReq, 0);
  System.SysUtils.FreeAndNil(FFeCabReq);
  inherited Destroy;
end;

procedure FECAERequest.SetFeCabReq(Index: Integer; const AFECAECabRequest: FECAECabRequest);
begin
  FFeCabReq := AFECAECabRequest;
  FFeCabReq_Specified := True;
end;

function FECAERequest.FeCabReq_Specified(Index: Integer): boolean;
begin
  Result := FFeCabReq_Specified;
end;

procedure FECAERequest.SetFeDetReq(Index: Integer; const AArrayOfFECAEDetRequest: ArrayOfFECAEDetRequest);
begin
  FFeDetReq := AArrayOfFECAEDetRequest;
  FFeDetReq_Specified := True;
end;

function FECAERequest.FeDetReq_Specified(Index: Integer): boolean;
begin
  Result := FFeDetReq_Specified;
end;

procedure Opcional.SetId(Index: Integer; const Astring: string);
begin
  FId := Astring;
  FId_Specified := True;
end;

function Opcional.Id_Specified(Index: Integer): boolean;
begin
  Result := FId_Specified;
end;

procedure Opcional.SetValor(Index: Integer; const Astring: string);
begin
  FValor := Astring;
  FValor_Specified := True;
end;

function Opcional.Valor_Specified(Index: Integer): boolean;
begin
  Result := FValor_Specified;
end;

procedure Moneda.SetId(Index: Integer; const Astring: string);
begin
  FId := Astring;
  FId_Specified := True;
end;

function Moneda.Id_Specified(Index: Integer): boolean;
begin
  Result := FId_Specified;
end;

procedure Moneda.SetDesc(Index: Integer; const Astring: string);
begin
  FDesc := Astring;
  FDesc_Specified := True;
end;

function Moneda.Desc_Specified(Index: Integer): boolean;
begin
  Result := FDesc_Specified;
end;

procedure Moneda.SetFchDesde(Index: Integer; const Astring: string);
begin
  FFchDesde := Astring;
  FFchDesde_Specified := True;
end;

function Moneda.FchDesde_Specified(Index: Integer): boolean;
begin
  Result := FFchDesde_Specified;
end;

procedure Moneda.SetFchHasta(Index: Integer; const Astring: string);
begin
  FFchHasta := Astring;
  FFchHasta_Specified := True;
end;

function Moneda.FchHasta_Specified(Index: Integer): boolean;
begin
  Result := FFchHasta_Specified;
end;

procedure PaisTipo.SetDesc(Index: Integer; const Astring: string);
begin
  FDesc := Astring;
  FDesc_Specified := True;
end;

function PaisTipo.Desc_Specified(Index: Integer): boolean;
begin
  Result := FDesc_Specified;
end;

procedure IvaTipo.SetId(Index: Integer; const Astring: string);
begin
  FId := Astring;
  FId_Specified := True;
end;

function IvaTipo.Id_Specified(Index: Integer): boolean;
begin
  Result := FId_Specified;
end;

procedure IvaTipo.SetDesc(Index: Integer; const Astring: string);
begin
  FDesc := Astring;
  FDesc_Specified := True;
end;

function IvaTipo.Desc_Specified(Index: Integer): boolean;
begin
  Result := FDesc_Specified;
end;

procedure IvaTipo.SetFchDesde(Index: Integer; const Astring: string);
begin
  FFchDesde := Astring;
  FFchDesde_Specified := True;
end;

function IvaTipo.FchDesde_Specified(Index: Integer): boolean;
begin
  Result := FFchDesde_Specified;
end;

procedure IvaTipo.SetFchHasta(Index: Integer; const Astring: string);
begin
  FFchHasta := Astring;
  FFchHasta_Specified := True;
end;

function IvaTipo.FchHasta_Specified(Index: Integer): boolean;
begin
  Result := FFchHasta_Specified;
end;

procedure OpcionalTipo.SetId(Index: Integer; const Astring: string);
begin
  FId := Astring;
  FId_Specified := True;
end;

function OpcionalTipo.Id_Specified(Index: Integer): boolean;
begin
  Result := FId_Specified;
end;

procedure OpcionalTipo.SetDesc(Index: Integer; const Astring: string);
begin
  FDesc := Astring;
  FDesc_Specified := True;
end;

function OpcionalTipo.Desc_Specified(Index: Integer): boolean;
begin
  Result := FDesc_Specified;
end;

procedure OpcionalTipo.SetFchDesde(Index: Integer; const Astring: string);
begin
  FFchDesde := Astring;
  FFchDesde_Specified := True;
end;

function OpcionalTipo.FchDesde_Specified(Index: Integer): boolean;
begin
  Result := FFchDesde_Specified;
end;

procedure OpcionalTipo.SetFchHasta(Index: Integer; const Astring: string);
begin
  FFchHasta := Astring;
  FFchHasta_Specified := True;
end;

function OpcionalTipo.FchHasta_Specified(Index: Integer): boolean;
begin
  Result := FFchHasta_Specified;
end;

procedure FEAuthRequest.SetToken(Index: Integer; const Astring: string);
begin
  FToken := Astring;
  FToken_Specified := True;
end;

function FEAuthRequest.Token_Specified(Index: Integer): boolean;
begin
  Result := FToken_Specified;
end;

procedure FEAuthRequest.SetSign(Index: Integer; const Astring: string);
begin
  FSign := Astring;
  FSign_Specified := True;
end;

function FEAuthRequest.Sign_Specified(Index: Integer): boolean;
begin
  Result := FSign_Specified;
end;

procedure FECabResponse.SetFchProceso(Index: Integer; const Astring: string);
begin
  FFchProceso := Astring;
  FFchProceso_Specified := True;
end;

function FECabResponse.FchProceso_Specified(Index: Integer): boolean;
begin
  Result := FFchProceso_Specified;
end;

procedure FECabResponse.SetResultado(Index: Integer; const Astring: string);
begin
  FResultado := Astring;
  FResultado_Specified := True;
end;

function FECabResponse.Resultado_Specified(Index: Integer): boolean;
begin
  Result := FResultado_Specified;
end;

procedure FECabResponse.SetReproceso(Index: Integer; const Astring: string);
begin
  FReproceso := Astring;
  FReproceso_Specified := True;
end;

function FECabResponse.Reproceso_Specified(Index: Integer): boolean;
begin
  Result := FReproceso_Specified;
end;

procedure CbteAsoc.SetCuit(Index: Integer; const Astring: string);
begin
  FCuit := Astring;
  FCuit_Specified := True;
end;

function CbteAsoc.Cuit_Specified(Index: Integer): boolean;
begin
  Result := FCuit_Specified;
end;

procedure CbteAsoc.SetCbteFch(Index: Integer; const Astring: string);
begin
  FCbteFch := Astring;
  FCbteFch_Specified := True;
end;

function CbteAsoc.CbteFch_Specified(Index: Integer): boolean;
begin
  Result := FCbteFch_Specified;
end;

procedure CbteTipo.SetDesc(Index: Integer; const Astring: string);
begin
  FDesc := Astring;
  FDesc_Specified := True;
end;

function CbteTipo.Desc_Specified(Index: Integer): boolean;
begin
  Result := FDesc_Specified;
end;

procedure CbteTipo.SetFchDesde(Index: Integer; const Astring: string);
begin
  FFchDesde := Astring;
  FFchDesde_Specified := True;
end;

function CbteTipo.FchDesde_Specified(Index: Integer): boolean;
begin
  Result := FFchDesde_Specified;
end;

procedure CbteTipo.SetFchHasta(Index: Integer; const Astring: string);
begin
  FFchHasta := Astring;
  FFchHasta_Specified := True;
end;

function CbteTipo.FchHasta_Specified(Index: Integer): boolean;
begin
  Result := FFchHasta_Specified;
end;

procedure PtoVenta.SetEmisionTipo(Index: Integer; const Astring: string);
begin
  FEmisionTipo := Astring;
  FEmisionTipo_Specified := True;
end;

function PtoVenta.EmisionTipo_Specified(Index: Integer): boolean;
begin
  Result := FEmisionTipo_Specified;
end;

procedure PtoVenta.SetBloqueado(Index: Integer; const Astring: string);
begin
  FBloqueado := Astring;
  FBloqueado_Specified := True;
end;

function PtoVenta.Bloqueado_Specified(Index: Integer): boolean;
begin
  Result := FBloqueado_Specified;
end;

procedure PtoVenta.SetFchBaja(Index: Integer; const Astring: string);
begin
  FFchBaja := Astring;
  FFchBaja_Specified := True;
end;

function PtoVenta.FchBaja_Specified(Index: Integer): boolean;
begin
  Result := FFchBaja_Specified;
end;

procedure DocTipo.SetDesc(Index: Integer; const Astring: string);
begin
  FDesc := Astring;
  FDesc_Specified := True;
end;

function DocTipo.Desc_Specified(Index: Integer): boolean;
begin
  Result := FDesc_Specified;
end;

procedure DocTipo.SetFchDesde(Index: Integer; const Astring: string);
begin
  FFchDesde := Astring;
  FFchDesde_Specified := True;
end;

function DocTipo.FchDesde_Specified(Index: Integer): boolean;
begin
  Result := FFchDesde_Specified;
end;

procedure DocTipo.SetFchHasta(Index: Integer; const Astring: string);
begin
  FFchHasta := Astring;
  FFchHasta_Specified := True;
end;

function DocTipo.FchHasta_Specified(Index: Integer): boolean;
begin
  Result := FFchHasta_Specified;
end;

procedure ConceptoTipo.SetDesc(Index: Integer; const Astring: string);
begin
  FDesc := Astring;
  FDesc_Specified := True;
end;

function ConceptoTipo.Desc_Specified(Index: Integer): boolean;
begin
  Result := FDesc_Specified;
end;

procedure ConceptoTipo.SetFchDesde(Index: Integer; const Astring: string);
begin
  FFchDesde := Astring;
  FFchDesde_Specified := True;
end;

function ConceptoTipo.FchDesde_Specified(Index: Integer): boolean;
begin
  Result := FFchDesde_Specified;
end;

procedure ConceptoTipo.SetFchHasta(Index: Integer; const Astring: string);
begin
  FFchHasta := Astring;
  FFchHasta_Specified := True;
end;

function ConceptoTipo.FchHasta_Specified(Index: Integer): boolean;
begin
  Result := FFchHasta_Specified;
end;

destructor FEDetRequest.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FCbtesAsoc)-1 do
    System.SysUtils.FreeAndNil(FCbtesAsoc[I]);
  System.SetLength(FCbtesAsoc, 0);
  for I := 0 to System.Length(FTributos)-1 do
    System.SysUtils.FreeAndNil(FTributos[I]);
  System.SetLength(FTributos, 0);
  for I := 0 to System.Length(FIva)-1 do
    System.SysUtils.FreeAndNil(FIva[I]);
  System.SetLength(FIva, 0);
  for I := 0 to System.Length(FOpcionales)-1 do
    System.SysUtils.FreeAndNil(FOpcionales[I]);
  System.SetLength(FOpcionales, 0);
  for I := 0 to System.Length(FCompradores)-1 do
    System.SysUtils.FreeAndNil(FCompradores[I]);
  System.SetLength(FCompradores, 0);
  inherited Destroy;
end;

procedure FEDetRequest.SetCbteFch(Index: Integer; const Astring: string);
begin
  FCbteFch := Astring;
  FCbteFch_Specified := True;
end;

function FEDetRequest.CbteFch_Specified(Index: Integer): boolean;
begin
  Result := FCbteFch_Specified;
end;

procedure FEDetRequest.SetFchServDesde(Index: Integer; const Astring: string);
begin
  FFchServDesde := Astring;
  FFchServDesde_Specified := True;
end;

function FEDetRequest.FchServDesde_Specified(Index: Integer): boolean;
begin
  Result := FFchServDesde_Specified;
end;

procedure FEDetRequest.SetFchServHasta(Index: Integer; const Astring: string);
begin
  FFchServHasta := Astring;
  FFchServHasta_Specified := True;
end;

function FEDetRequest.FchServHasta_Specified(Index: Integer): boolean;
begin
  Result := FFchServHasta_Specified;
end;

procedure FEDetRequest.SetFchVtoPago(Index: Integer; const Astring: string);
begin
  FFchVtoPago := Astring;
  FFchVtoPago_Specified := True;
end;

function FEDetRequest.FchVtoPago_Specified(Index: Integer): boolean;
begin
  Result := FFchVtoPago_Specified;
end;

procedure FEDetRequest.SetMonId(Index: Integer; const Astring: string);
begin
  FMonId := Astring;
  FMonId_Specified := True;
end;

function FEDetRequest.MonId_Specified(Index: Integer): boolean;
begin
  Result := FMonId_Specified;
end;

procedure FEDetRequest.SetCbtesAsoc(Index: Integer; const AArrayOfCbteAsoc: ArrayOfCbteAsoc);
begin
  FCbtesAsoc := AArrayOfCbteAsoc;
  FCbtesAsoc_Specified := True;
end;

function FEDetRequest.CbtesAsoc_Specified(Index: Integer): boolean;
begin
  Result := FCbtesAsoc_Specified;
end;

procedure FEDetRequest.SetTributos(Index: Integer; const AArrayOfTributo: ArrayOfTributo);
begin
  FTributos := AArrayOfTributo;
  FTributos_Specified := True;
end;

function FEDetRequest.Tributos_Specified(Index: Integer): boolean;
begin
  Result := FTributos_Specified;
end;

procedure FEDetRequest.SetIva(Index: Integer; const AArrayOfAlicIva: ArrayOfAlicIva);
begin
  FIva := AArrayOfAlicIva;
  FIva_Specified := True;
end;

function FEDetRequest.Iva_Specified(Index: Integer): boolean;
begin
  Result := FIva_Specified;
end;

procedure FEDetRequest.SetOpcionales(Index: Integer; const AArrayOfOpcional: ArrayOfOpcional);
begin
  FOpcionales := AArrayOfOpcional;
  FOpcionales_Specified := True;
end;

function FEDetRequest.Opcionales_Specified(Index: Integer): boolean;
begin
  Result := FOpcionales_Specified;
end;

procedure FEDetRequest.SetCompradores(Index: Integer; const AArrayOfComprador: ArrayOfComprador);
begin
  FCompradores := AArrayOfComprador;
  FCompradores_Specified := True;
end;

function FEDetRequest.Compradores_Specified(Index: Integer): boolean;
begin
  Result := FCompradores_Specified;
end;

procedure Tributo.SetDesc(Index: Integer; const Astring: string);
begin
  FDesc := Astring;
  FDesc_Specified := True;
end;

function Tributo.Desc_Specified(Index: Integer): boolean;
begin
  Result := FDesc_Specified;
end;

destructor FEDetResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FObservaciones)-1 do
    System.SysUtils.FreeAndNil(FObservaciones[I]);
  System.SetLength(FObservaciones, 0);
  inherited Destroy;
end;

procedure FEDetResponse.SetCbteFch(Index: Integer; const Astring: string);
begin
  FCbteFch := Astring;
  FCbteFch_Specified := True;
end;

function FEDetResponse.CbteFch_Specified(Index: Integer): boolean;
begin
  Result := FCbteFch_Specified;
end;

procedure FEDetResponse.SetResultado(Index: Integer; const Astring: string);
begin
  FResultado := Astring;
  FResultado_Specified := True;
end;

function FEDetResponse.Resultado_Specified(Index: Integer): boolean;
begin
  Result := FResultado_Specified;
end;

procedure FEDetResponse.SetObservaciones(Index: Integer; const AArrayOfObs: ArrayOfObs);
begin
  FObservaciones := AArrayOfObs;
  FObservaciones_Specified := True;
end;

function FEDetResponse.Observaciones_Specified(Index: Integer): boolean;
begin
  Result := FObservaciones_Specified;
end;

procedure FECAEDetResponse.SetCAE(Index: Integer; const Astring: string);
begin
  FCAE := Astring;
  FCAE_Specified := True;
end;

function FECAEDetResponse.CAE_Specified(Index: Integer): boolean;
begin
  Result := FCAE_Specified;
end;

procedure FECAEDetResponse.SetCAEFchVto(Index: Integer; const Astring: string);
begin
  FCAEFchVto := Astring;
  FCAEFchVto_Specified := True;
end;

function FECAEDetResponse.CAEFchVto_Specified(Index: Integer): boolean;
begin
  Result := FCAEFchVto_Specified;
end;

destructor FECAEASinMovConsResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FResultGet)-1 do
    System.SysUtils.FreeAndNil(FResultGet[I]);
  System.SetLength(FResultGet, 0);
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  inherited Destroy;
end;

procedure FECAEASinMovConsResponse.SetResultGet(Index: Integer; const AArrayOfFECAEASinMov: ArrayOfFECAEASinMov);
begin
  FResultGet := AArrayOfFECAEASinMov;
  FResultGet_Specified := True;
end;

function FECAEASinMovConsResponse.ResultGet_Specified(Index: Integer): boolean;
begin
  Result := FResultGet_Specified;
end;

procedure FECAEASinMovConsResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function FECAEASinMovConsResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

procedure FECAEASinMovConsResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function FECAEASinMovConsResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

procedure FECAEASinMov.SetCAEA(Index: Integer; const Astring: string);
begin
  FCAEA := Astring;
  FCAEA_Specified := True;
end;

function FECAEASinMov.CAEA_Specified(Index: Integer): boolean;
begin
  Result := FCAEA_Specified;
end;

procedure FECAEASinMov.SetFchProceso(Index: Integer; const Astring: string);
begin
  FFchProceso := Astring;
  FFchProceso_Specified := True;
end;

function FECAEASinMov.FchProceso_Specified(Index: Integer): boolean;
begin
  Result := FFchProceso_Specified;
end;

destructor FECAEAGet.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FObservaciones)-1 do
    System.SysUtils.FreeAndNil(FObservaciones[I]);
  System.SetLength(FObservaciones, 0);
  inherited Destroy;
end;

procedure FECAEAGet.SetCAEA(Index: Integer; const Astring: string);
begin
  FCAEA := Astring;
  FCAEA_Specified := True;
end;

function FECAEAGet.CAEA_Specified(Index: Integer): boolean;
begin
  Result := FCAEA_Specified;
end;

procedure FECAEAGet.SetFchVigDesde(Index: Integer; const Astring: string);
begin
  FFchVigDesde := Astring;
  FFchVigDesde_Specified := True;
end;

function FECAEAGet.FchVigDesde_Specified(Index: Integer): boolean;
begin
  Result := FFchVigDesde_Specified;
end;

procedure FECAEAGet.SetFchVigHasta(Index: Integer; const Astring: string);
begin
  FFchVigHasta := Astring;
  FFchVigHasta_Specified := True;
end;

function FECAEAGet.FchVigHasta_Specified(Index: Integer): boolean;
begin
  Result := FFchVigHasta_Specified;
end;

procedure FECAEAGet.SetFchTopeInf(Index: Integer; const Astring: string);
begin
  FFchTopeInf := Astring;
  FFchTopeInf_Specified := True;
end;

function FECAEAGet.FchTopeInf_Specified(Index: Integer): boolean;
begin
  Result := FFchTopeInf_Specified;
end;

procedure FECAEAGet.SetFchProceso(Index: Integer; const Astring: string);
begin
  FFchProceso := Astring;
  FFchProceso_Specified := True;
end;

function FECAEAGet.FchProceso_Specified(Index: Integer): boolean;
begin
  Result := FFchProceso_Specified;
end;

procedure FECAEAGet.SetObservaciones(Index: Integer; const AArrayOfObs: ArrayOfObs);
begin
  FObservaciones := AArrayOfObs;
  FObservaciones_Specified := True;
end;

function FECAEAGet.Observaciones_Specified(Index: Integer): boolean;
begin
  Result := FObservaciones_Specified;
end;

procedure FECAEADetResponse.SetCAEA(Index: Integer; const Astring: string);
begin
  FCAEA := Astring;
  FCAEA_Specified := True;
end;

function FECAEADetResponse.CAEA_Specified(Index: Integer): boolean;
begin
  Result := FCAEA_Specified;
end;

destructor FECAEAGetResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  System.SysUtils.FreeAndNil(FResultGet);
  inherited Destroy;
end;

procedure FECAEAGetResponse.SetResultGet(Index: Integer; const AFECAEAGet: FECAEAGet);
begin
  FResultGet := AFECAEAGet;
  FResultGet_Specified := True;
end;

function FECAEAGetResponse.ResultGet_Specified(Index: Integer): boolean;
begin
  Result := FResultGet_Specified;
end;

procedure FECAEAGetResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function FECAEAGetResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

procedure FECAEAGetResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function FECAEAGetResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

destructor FECAEASinMovResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  inherited Destroy;
end;

procedure FECAEASinMovResponse.SetResultado(Index: Integer; const Astring: string);
begin
  FResultado := Astring;
  FResultado_Specified := True;
end;

function FECAEASinMovResponse.Resultado_Specified(Index: Integer): boolean;
begin
  Result := FResultado_Specified;
end;

procedure FECAEASinMovResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function FECAEASinMovResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

procedure FECAEASinMovResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function FECAEASinMovResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

procedure TributoTipo.SetDesc(Index: Integer; const Astring: string);
begin
  FDesc := Astring;
  FDesc_Specified := True;
end;

function TributoTipo.Desc_Specified(Index: Integer): boolean;
begin
  Result := FDesc_Specified;
end;

procedure TributoTipo.SetFchDesde(Index: Integer; const Astring: string);
begin
  FFchDesde := Astring;
  FFchDesde_Specified := True;
end;

function TributoTipo.FchDesde_Specified(Index: Integer): boolean;
begin
  Result := FFchDesde_Specified;
end;

procedure TributoTipo.SetFchHasta(Index: Integer; const Astring: string);
begin
  FFchHasta := Astring;
  FFchHasta_Specified := True;
end;

function TributoTipo.FchHasta_Specified(Index: Integer): boolean;
begin
  Result := FFchHasta_Specified;
end;

destructor MonedaResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FResultGet)-1 do
    System.SysUtils.FreeAndNil(FResultGet[I]);
  System.SetLength(FResultGet, 0);
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  inherited Destroy;
end;

procedure MonedaResponse.SetResultGet(Index: Integer; const AArrayOfMoneda: ArrayOfMoneda);
begin
  FResultGet := AArrayOfMoneda;
  FResultGet_Specified := True;
end;

function MonedaResponse.ResultGet_Specified(Index: Integer): boolean;
begin
  Result := FResultGet_Specified;
end;

procedure MonedaResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function MonedaResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

procedure MonedaResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function MonedaResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

destructor FECotizacionResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  System.SysUtils.FreeAndNil(FResultGet);
  inherited Destroy;
end;

procedure FECotizacionResponse.SetResultGet(Index: Integer; const ACotizacion: Cotizacion);
begin
  FResultGet := ACotizacion;
  FResultGet_Specified := True;
end;

function FECotizacionResponse.ResultGet_Specified(Index: Integer): boolean;
begin
  Result := FResultGet_Specified;
end;

procedure FECotizacionResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function FECotizacionResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

procedure FECotizacionResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function FECotizacionResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

procedure Cotizacion.SetMonId(Index: Integer; const Astring: string);
begin
  FMonId := Astring;
  FMonId_Specified := True;
end;

function Cotizacion.MonId_Specified(Index: Integer): boolean;
begin
  Result := FMonId_Specified;
end;

procedure Cotizacion.SetFchCotiz(Index: Integer; const Astring: string);
begin
  FFchCotiz := Astring;
  FFchCotiz_Specified := True;
end;

function Cotizacion.FchCotiz_Specified(Index: Integer): boolean;
begin
  Result := FFchCotiz_Specified;
end;

destructor FETributoResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FResultGet)-1 do
    System.SysUtils.FreeAndNil(FResultGet[I]);
  System.SetLength(FResultGet, 0);
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  inherited Destroy;
end;

procedure FETributoResponse.SetResultGet(Index: Integer; const AArrayOfTributoTipo: ArrayOfTributoTipo);
begin
  FResultGet := AArrayOfTributoTipo;
  FResultGet_Specified := True;
end;

function FETributoResponse.ResultGet_Specified(Index: Integer): boolean;
begin
  Result := FResultGet_Specified;
end;

procedure FETributoResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function FETributoResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

procedure FETributoResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function FETributoResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

procedure DummyResponse.SetAppServer(Index: Integer; const Astring: string);
begin
  FAppServer := Astring;
  FAppServer_Specified := True;
end;

function DummyResponse.AppServer_Specified(Index: Integer): boolean;
begin
  Result := FAppServer_Specified;
end;

procedure DummyResponse.SetDbServer(Index: Integer; const Astring: string);
begin
  FDbServer := Astring;
  FDbServer_Specified := True;
end;

function DummyResponse.DbServer_Specified(Index: Integer): boolean;
begin
  Result := FDbServer_Specified;
end;

procedure DummyResponse.SetAuthServer(Index: Integer; const Astring: string);
begin
  FAuthServer := Astring;
  FAuthServer_Specified := True;
end;

function DummyResponse.AuthServer_Specified(Index: Integer): boolean;
begin
  Result := FAuthServer_Specified;
end;

destructor FERecuperaLastCbteResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  inherited Destroy;
end;

procedure FERecuperaLastCbteResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function FERecuperaLastCbteResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

procedure FERecuperaLastCbteResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function FERecuperaLastCbteResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

destructor FERegXReqResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  inherited Destroy;
end;

procedure FERegXReqResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function FERegXReqResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

procedure FERegXReqResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function FERegXReqResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

procedure Obs.SetMsg(Index: Integer; const Astring: string);
begin
  FMsg := Astring;
  FMsg_Specified := True;
end;

function Obs.Msg_Specified(Index: Integer): boolean;
begin
  Result := FMsg_Specified;
end;

procedure Evt.SetMsg(Index: Integer; const Astring: string);
begin
  FMsg := Astring;
  FMsg_Specified := True;
end;

function Evt.Msg_Specified(Index: Integer): boolean;
begin
  Result := FMsg_Specified;
end;

procedure Err.SetMsg(Index: Integer; const Astring: string);
begin
  FMsg := Astring;
  FMsg_Specified := True;
end;

function Err.Msg_Specified(Index: Integer): boolean;
begin
  Result := FMsg_Specified;
end;

destructor FECompConsultaResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  System.SysUtils.FreeAndNil(FResultGet);
  inherited Destroy;
end;

procedure FECompConsultaResponse.SetResultGet(Index: Integer; const AFECompConsResponse: FECompConsResponse);
begin
  FResultGet := AFECompConsResponse;
  FResultGet_Specified := True;
end;

function FECompConsultaResponse.ResultGet_Specified(Index: Integer): boolean;
begin
  Result := FResultGet_Specified;
end;

procedure FECompConsultaResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function FECompConsultaResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

procedure FECompConsultaResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function FECompConsultaResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

procedure FECAEADetRequest.SetCAEA(Index: Integer; const Astring: string);
begin
  FCAEA := Astring;
  FCAEA_Specified := True;
end;

function FECAEADetRequest.CAEA_Specified(Index: Integer): boolean;
begin
  Result := FCAEA_Specified;
end;

procedure FECAEADetRequest.SetCbteFchHsGen(Index: Integer; const Astring: string);
begin
  FCbteFchHsGen := Astring;
  FCbteFchHsGen_Specified := True;
end;

function FECAEADetRequest.CbteFchHsGen_Specified(Index: Integer): boolean;
begin
  Result := FCbteFchHsGen_Specified;
end;

destructor FECAEAResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FFeDetResp)-1 do
    System.SysUtils.FreeAndNil(FFeDetResp[I]);
  System.SetLength(FFeDetResp, 0);
  for I := 0 to System.Length(FEvents)-1 do
    System.SysUtils.FreeAndNil(FEvents[I]);
  System.SetLength(FEvents, 0);
  for I := 0 to System.Length(FErrors)-1 do
    System.SysUtils.FreeAndNil(FErrors[I]);
  System.SetLength(FErrors, 0);
  System.SysUtils.FreeAndNil(FFeCabResp);
  inherited Destroy;
end;

procedure FECAEAResponse.SetFeCabResp(Index: Integer; const AFECAEACabResponse: FECAEACabResponse);
begin
  FFeCabResp := AFECAEACabResponse;
  FFeCabResp_Specified := True;
end;

function FECAEAResponse.FeCabResp_Specified(Index: Integer): boolean;
begin
  Result := FFeCabResp_Specified;
end;

procedure FECAEAResponse.SetFeDetResp(Index: Integer; const AArrayOfFECAEADetResponse: ArrayOfFECAEADetResponse);
begin
  FFeDetResp := AArrayOfFECAEADetResponse;
  FFeDetResp_Specified := True;
end;

function FECAEAResponse.FeDetResp_Specified(Index: Integer): boolean;
begin
  Result := FFeDetResp_Specified;
end;

procedure FECAEAResponse.SetEvents(Index: Integer; const AArrayOfEvt: ArrayOfEvt);
begin
  FEvents := AArrayOfEvt;
  FEvents_Specified := True;
end;

function FECAEAResponse.Events_Specified(Index: Integer): boolean;
begin
  Result := FEvents_Specified;
end;

procedure FECAEAResponse.SetErrors(Index: Integer; const AArrayOfErr: ArrayOfErr);
begin
  FErrors := AArrayOfErr;
  FErrors_Specified := True;
end;

function FECAEAResponse.Errors_Specified(Index: Integer): boolean;
begin
  Result := FErrors_Specified;
end;

destructor FECompConsResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FObservaciones)-1 do
    System.SysUtils.FreeAndNil(FObservaciones[I]);
  System.SetLength(FObservaciones, 0);
  inherited Destroy;
end;

procedure FECompConsResponse.SetResultado(Index: Integer; const Astring: string);
begin
  FResultado := Astring;
  FResultado_Specified := True;
end;

function FECompConsResponse.Resultado_Specified(Index: Integer): boolean;
begin
  Result := FResultado_Specified;
end;

procedure FECompConsResponse.SetCodAutorizacion(Index: Integer; const Astring: string);
begin
  FCodAutorizacion := Astring;
  FCodAutorizacion_Specified := True;
end;

function FECompConsResponse.CodAutorizacion_Specified(Index: Integer): boolean;
begin
  Result := FCodAutorizacion_Specified;
end;

procedure FECompConsResponse.SetEmisionTipo(Index: Integer; const Astring: string);
begin
  FEmisionTipo := Astring;
  FEmisionTipo_Specified := True;
end;

function FECompConsResponse.EmisionTipo_Specified(Index: Integer): boolean;
begin
  Result := FEmisionTipo_Specified;
end;

procedure FECompConsResponse.SetFchVto(Index: Integer; const Astring: string);
begin
  FFchVto := Astring;
  FFchVto_Specified := True;
end;

function FECompConsResponse.FchVto_Specified(Index: Integer): boolean;
begin
  Result := FFchVto_Specified;
end;

procedure FECompConsResponse.SetFchProceso(Index: Integer; const Astring: string);
begin
  FFchProceso := Astring;
  FFchProceso_Specified := True;
end;

function FECompConsResponse.FchProceso_Specified(Index: Integer): boolean;
begin
  Result := FFchProceso_Specified;
end;

procedure FECompConsResponse.SetObservaciones(Index: Integer; const AArrayOfObs: ArrayOfObs);
begin
  FObservaciones := AArrayOfObs;
  FObservaciones_Specified := True;
end;

function FECompConsResponse.Observaciones_Specified(Index: Integer): boolean;
begin
  Result := FObservaciones_Specified;
end;

destructor FECAEARequest.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FFeDetReq)-1 do
    System.SysUtils.FreeAndNil(FFeDetReq[I]);
  System.SetLength(FFeDetReq, 0);
  System.SysUtils.FreeAndNil(FFeCabReq);
  inherited Destroy;
end;

procedure FECAEARequest.SetFeCabReq(Index: Integer; const AFECAEACabRequest: FECAEACabRequest);
begin
  FFeCabReq := AFECAEACabRequest;
  FFeCabReq_Specified := True;
end;

function FECAEARequest.FeCabReq_Specified(Index: Integer): boolean;
begin
  Result := FFeCabReq_Specified;
end;

procedure FECAEARequest.SetFeDetReq(Index: Integer; const AArrayOfFECAEADetRequest: ArrayOfFECAEADetRequest);
begin
  FFeDetReq := AArrayOfFECAEADetRequest;
  FFeDetReq_Specified := True;
end;

function FECAEARequest.FeDetReq_Specified(Index: Integer): boolean;
begin
  Result := FFeDetReq_Specified;
end;

initialization
  { ServiceSoap }
  InvRegistry.RegisterInterface(TypeInfo(ServiceSoap), 'http://ar.gov.afip.dif.FEV1/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ServiceSoap), 'http://ar.gov.afip.dif.FEV1/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(ServiceSoap), ioDocument);
  { ServiceSoap.FECAESolicitar }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FECAESolicitar', '',
                                 '[ReturnName="FECAESolicitarResult"]', IS_OPTN);
  { ServiceSoap.FECompTotXRequest }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FECompTotXRequest', '',
                                 '[ReturnName="FECompTotXRequestResult"]', IS_OPTN);
  { ServiceSoap.FEDummy }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FEDummy', '',
                                 '[ReturnName="FEDummyResult"]', IS_OPTN);
  { ServiceSoap.FECompUltimoAutorizado }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FECompUltimoAutorizado', '',
                                 '[ReturnName="FECompUltimoAutorizadoResult"]', IS_OPTN);
  { ServiceSoap.FECompConsultar }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FECompConsultar', '',
                                 '[ReturnName="FECompConsultarResult"]', IS_OPTN);
  { ServiceSoap.FECAEARegInformativo }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FECAEARegInformativo', '',
                                 '[ReturnName="FECAEARegInformativoResult"]', IS_OPTN);
  { ServiceSoap.FECAEASolicitar }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FECAEASolicitar', '',
                                 '[ReturnName="FECAEASolicitarResult"]', IS_OPTN);
  { ServiceSoap.FECAEASinMovimientoConsultar }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FECAEASinMovimientoConsultar', '',
                                 '[ReturnName="FECAEASinMovimientoConsultarResult"]', IS_OPTN);
  { ServiceSoap.FECAEASinMovimientoInformar }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FECAEASinMovimientoInformar', '',
                                 '[ReturnName="FECAEASinMovimientoInformarResult"]', IS_OPTN);
  { ServiceSoap.FECAEAConsultar }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FECAEAConsultar', '',
                                 '[ReturnName="FECAEAConsultarResult"]', IS_OPTN);
  { ServiceSoap.FEParamGetCotizacion }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FEParamGetCotizacion', '',
                                 '[ReturnName="FEParamGetCotizacionResult"]', IS_OPTN);
  { ServiceSoap.FEParamGetTiposTributos }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FEParamGetTiposTributos', '',
                                 '[ReturnName="FEParamGetTiposTributosResult"]', IS_OPTN);
  { ServiceSoap.FEParamGetTiposMonedas }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FEParamGetTiposMonedas', '',
                                 '[ReturnName="FEParamGetTiposMonedasResult"]', IS_OPTN);
  { ServiceSoap.FEParamGetTiposIva }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FEParamGetTiposIva', '',
                                 '[ReturnName="FEParamGetTiposIvaResult"]', IS_OPTN);
  { ServiceSoap.FEParamGetTiposOpcional }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FEParamGetTiposOpcional', '',
                                 '[ReturnName="FEParamGetTiposOpcionalResult"]', IS_OPTN);
  { ServiceSoap.FEParamGetTiposConcepto }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FEParamGetTiposConcepto', '',
                                 '[ReturnName="FEParamGetTiposConceptoResult"]', IS_OPTN);
  { ServiceSoap.FEParamGetPtosVenta }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FEParamGetPtosVenta', '',
                                 '[ReturnName="FEParamGetPtosVentaResult"]', IS_OPTN);
  { ServiceSoap.FEParamGetTiposCbte }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FEParamGetTiposCbte', '',
                                 '[ReturnName="FEParamGetTiposCbteResult"]', IS_OPTN);
  { ServiceSoap.FEParamGetTiposDoc }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FEParamGetTiposDoc', '',
                                 '[ReturnName="FEParamGetTiposDocResult"]', IS_OPTN);
  { ServiceSoap.FEParamGetTiposPaises }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServiceSoap), 'FEParamGetTiposPaises', '',
                                 '[ReturnName="FEParamGetTiposPaisesResult"]', IS_OPTN);
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfConceptoTipo), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfConceptoTipo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfIvaTipo), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfIvaTipo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfOpcionalTipo), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfOpcionalTipo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfPtoVenta), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfPtoVenta');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfDocTipo), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfDocTipo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfPaisTipo), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfPaisTipo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfCbteTipo), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfCbteTipo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfComprador), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfComprador');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfErr), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfErr');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFECAEDetResponse), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfFECAEDetResponse');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfEvt), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfEvt');
  RemClassRegistry.RegisterXSClass(FECAEResponse, 'http://ar.gov.afip.dif.FEV1/', 'FECAEResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECAEResponse), 'FeDetResp', '[ArrayItemName="FECAEDetResponse"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECAEResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECAEResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterXSClass(DocTipoResponse, 'http://ar.gov.afip.dif.FEV1/', 'DocTipoResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(DocTipoResponse), 'ResultGet', '[ArrayItemName="DocTipo"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(DocTipoResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(DocTipoResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterXSClass(CbteTipoResponse, 'http://ar.gov.afip.dif.FEV1/', 'CbteTipoResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(CbteTipoResponse), 'ResultGet', '[ArrayItemName="CbteTipo"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(CbteTipoResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(CbteTipoResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterXSClass(FEPaisResponse, 'http://ar.gov.afip.dif.FEV1/', 'FEPaisResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FEPaisResponse), 'ResultGet', '[ArrayItemName="PaisTipo"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FEPaisResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FEPaisResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterXSClass(OpcionalTipoResponse, 'http://ar.gov.afip.dif.FEV1/', 'OpcionalTipoResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(OpcionalTipoResponse), 'ResultGet', '[ArrayItemName="OpcionalTipo"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(OpcionalTipoResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(OpcionalTipoResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterXSClass(IvaTipoResponse, 'http://ar.gov.afip.dif.FEV1/', 'IvaTipoResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(IvaTipoResponse), 'ResultGet', '[ArrayItemName="IvaTipo"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(IvaTipoResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(IvaTipoResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterXSClass(FEPtoVentaResponse, 'http://ar.gov.afip.dif.FEV1/', 'FEPtoVentaResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FEPtoVentaResponse), 'ResultGet', '[ArrayItemName="PtoVenta"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FEPtoVentaResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FEPtoVentaResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterXSClass(ConceptoTipoResponse, 'http://ar.gov.afip.dif.FEV1/', 'ConceptoTipoResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ConceptoTipoResponse), 'ResultGet', '[ArrayItemName="ConceptoTipo"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ConceptoTipoResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ConceptoTipoResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFECAEDetRequest), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfFECAEDetRequest');
  RemClassRegistry.RegisterXSClass(FECAERequest, 'http://ar.gov.afip.dif.FEV1/', 'FECAERequest');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECAERequest), 'FeDetReq', '[ArrayItemName="FECAEDetRequest"]');
  RemClassRegistry.RegisterXSClass(Opcional, 'http://ar.gov.afip.dif.FEV1/', 'Opcional');
  RemClassRegistry.RegisterXSClass(Moneda, 'http://ar.gov.afip.dif.FEV1/', 'Moneda');
  RemClassRegistry.RegisterXSClass(PaisTipo, 'http://ar.gov.afip.dif.FEV1/', 'PaisTipo');
  RemClassRegistry.RegisterXSClass(IvaTipo, 'http://ar.gov.afip.dif.FEV1/', 'IvaTipo');
  RemClassRegistry.RegisterXSClass(OpcionalTipo, 'http://ar.gov.afip.dif.FEV1/', 'OpcionalTipo');
  RemClassRegistry.RegisterXSClass(FEAuthRequest, 'http://ar.gov.afip.dif.FEV1/', 'FEAuthRequest');
  RemClassRegistry.RegisterXSClass(FECabRequest, 'http://ar.gov.afip.dif.FEV1/', 'FECabRequest');
  RemClassRegistry.RegisterXSClass(FECAECabRequest, 'http://ar.gov.afip.dif.FEV1/', 'FECAECabRequest');
  RemClassRegistry.RegisterXSClass(FECabResponse, 'http://ar.gov.afip.dif.FEV1/', 'FECabResponse');
  RemClassRegistry.RegisterXSClass(FECAECabResponse, 'http://ar.gov.afip.dif.FEV1/', 'FECAECabResponse');
  RemClassRegistry.RegisterXSClass(CbteAsoc, 'http://ar.gov.afip.dif.FEV1/', 'CbteAsoc');
  RemClassRegistry.RegisterXSClass(CbteTipo, 'http://ar.gov.afip.dif.FEV1/', 'CbteTipo');
  RemClassRegistry.RegisterXSClass(PtoVenta, 'http://ar.gov.afip.dif.FEV1/', 'PtoVenta');
  RemClassRegistry.RegisterXSClass(DocTipo, 'http://ar.gov.afip.dif.FEV1/', 'DocTipo');
  RemClassRegistry.RegisterXSClass(ConceptoTipo, 'http://ar.gov.afip.dif.FEV1/', 'ConceptoTipo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfTributo), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfTributo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfAlicIva), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfAlicIva');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfOpcional), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfOpcional');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfCbteAsoc), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfCbteAsoc');
  RemClassRegistry.RegisterXSClass(FEDetRequest, 'http://ar.gov.afip.dif.FEV1/', 'FEDetRequest');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FEDetRequest), 'CbtesAsoc', '[ArrayItemName="CbteAsoc"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FEDetRequest), 'Tributos', '[ArrayItemName="Tributo"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FEDetRequest), 'Iva', '[ArrayItemName="AlicIva"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FEDetRequest), 'Opcionales', '[ArrayItemName="Opcional"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FEDetRequest), 'Compradores', '[ArrayItemName="Comprador"]');
  RemClassRegistry.RegisterXSClass(FECAEDetRequest, 'http://ar.gov.afip.dif.FEV1/', 'FECAEDetRequest');
  RemClassRegistry.RegisterXSClass(Tributo, 'http://ar.gov.afip.dif.FEV1/', 'Tributo');
  RemClassRegistry.RegisterXSClass(Comprador, 'http://ar.gov.afip.dif.FEV1/', 'Comprador');
  RemClassRegistry.RegisterXSClass(AlicIva, 'http://ar.gov.afip.dif.FEV1/', 'AlicIva');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfObs), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfObs');
  RemClassRegistry.RegisterXSClass(FEDetResponse, 'http://ar.gov.afip.dif.FEV1/', 'FEDetResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FEDetResponse), 'Observaciones', '[ArrayItemName="Obs"]');
  RemClassRegistry.RegisterXSClass(FECAEDetResponse, 'http://ar.gov.afip.dif.FEV1/', 'FECAEDetResponse');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFECAEASinMov), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfFECAEASinMov');
  RemClassRegistry.RegisterXSClass(FECAEASinMovConsResponse, 'http://ar.gov.afip.dif.FEV1/', 'FECAEASinMovConsResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECAEASinMovConsResponse), 'ResultGet', '[ArrayItemName="FECAEASinMov"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECAEASinMovConsResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECAEASinMovConsResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterXSClass(FECAEASinMov, 'http://ar.gov.afip.dif.FEV1/', 'FECAEASinMov');
  RemClassRegistry.RegisterXSClass(FECAEAGet, 'http://ar.gov.afip.dif.FEV1/', 'FECAEAGet');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECAEAGet), 'Observaciones', '[ArrayItemName="Obs"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFECAEADetResponse), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfFECAEADetResponse');
  RemClassRegistry.RegisterXSClass(FECAEADetResponse, 'http://ar.gov.afip.dif.FEV1/', 'FECAEADetResponse');
  RemClassRegistry.RegisterXSClass(FECAEAGetResponse, 'http://ar.gov.afip.dif.FEV1/', 'FECAEAGetResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECAEAGetResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECAEAGetResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterXSClass(FECAEASinMovResponse, 'http://ar.gov.afip.dif.FEV1/', 'FECAEASinMovResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECAEASinMovResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECAEASinMovResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterXSClass(TributoTipo, 'http://ar.gov.afip.dif.FEV1/', 'TributoTipo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfMoneda), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfMoneda');
  RemClassRegistry.RegisterXSClass(MonedaResponse, 'http://ar.gov.afip.dif.FEV1/', 'MonedaResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(MonedaResponse), 'ResultGet', '[ArrayItemName="Moneda"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(MonedaResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(MonedaResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfTributoTipo), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfTributoTipo');
  RemClassRegistry.RegisterXSClass(FECotizacionResponse, 'http://ar.gov.afip.dif.FEV1/', 'FECotizacionResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECotizacionResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECotizacionResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterXSClass(Cotizacion, 'http://ar.gov.afip.dif.FEV1/', 'Cotizacion');
  RemClassRegistry.RegisterXSClass(FETributoResponse, 'http://ar.gov.afip.dif.FEV1/', 'FETributoResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FETributoResponse), 'ResultGet', '[ArrayItemName="TributoTipo"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FETributoResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FETributoResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterXSClass(DummyResponse, 'http://ar.gov.afip.dif.FEV1/', 'DummyResponse');
  RemClassRegistry.RegisterXSClass(FERecuperaLastCbteResponse, 'http://ar.gov.afip.dif.FEV1/', 'FERecuperaLastCbteResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FERecuperaLastCbteResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FERecuperaLastCbteResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterXSClass(FECompConsultaReq, 'http://ar.gov.afip.dif.FEV1/', 'FECompConsultaReq');
  RemClassRegistry.RegisterXSClass(FERegXReqResponse, 'http://ar.gov.afip.dif.FEV1/', 'FERegXReqResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FERegXReqResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FERegXReqResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterXSClass(Obs, 'http://ar.gov.afip.dif.FEV1/', 'Obs');
  RemClassRegistry.RegisterXSClass(Evt, 'http://ar.gov.afip.dif.FEV1/', 'Evt');
  RemClassRegistry.RegisterXSClass(Err, 'http://ar.gov.afip.dif.FEV1/', 'Err');
  RemClassRegistry.RegisterXSClass(FECompConsultaResponse, 'http://ar.gov.afip.dif.FEV1/', 'FECompConsultaResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECompConsultaResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECompConsultaResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterXSClass(FECAEADetRequest, 'http://ar.gov.afip.dif.FEV1/', 'FECAEADetRequest');
  RemClassRegistry.RegisterXSClass(FECAEAResponse, 'http://ar.gov.afip.dif.FEV1/', 'FECAEAResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECAEAResponse), 'FeDetResp', '[ArrayItemName="FECAEADetResponse"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECAEAResponse), 'Events', '[ArrayItemName="Evt"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECAEAResponse), 'Errors', '[ArrayItemName="Err"]');
  RemClassRegistry.RegisterXSClass(FECAEACabResponse, 'http://ar.gov.afip.dif.FEV1/', 'FECAEACabResponse');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFECAEADetRequest), 'http://ar.gov.afip.dif.FEV1/', 'ArrayOfFECAEADetRequest');
  RemClassRegistry.RegisterXSClass(FECompConsResponse, 'http://ar.gov.afip.dif.FEV1/', 'FECompConsResponse');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECompConsResponse), 'Observaciones', '[ArrayItemName="Obs"]');
  RemClassRegistry.RegisterXSClass(FECAEARequest, 'http://ar.gov.afip.dif.FEV1/', 'FECAEARequest');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FECAEARequest), 'FeDetReq', '[ArrayItemName="FECAEADetRequest"]');
  RemClassRegistry.RegisterXSClass(FECAEACabRequest, 'http://ar.gov.afip.dif.FEV1/', 'FECAEACabRequest');

end.