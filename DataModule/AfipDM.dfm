object AfipDataModule: TAfipDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 256
  Width = 433
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://civeloo.com/afip/jsonpb.php'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 16
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body'
        Options = [poDoNotEncode]
        ContentType = ctAPPLICATION_JSON
      end>
    SynchronizedEvents = False
    Left = 16
    Top = 48
  end
  object XMLDocument1: TXMLDocument
    Left = 24
    Top = 152
    DOMVendorDesc = 'MSXML'
  end
  object HTTPRIO1: THTTPRIO
    WSDLLocation = 'http://wswhomo.afip.gov.ar/wsfev1/service.asmx?WSDL'
    Service = 'Service'
    Port = 'ServiceSoap'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soNoSOAPActionHeader, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefArray, soTryAllSchema, soDontSendEmptyNodes]
    Converter.Encoding = 'utf-8'
    Left = 23
    Top = 104
  end
end
