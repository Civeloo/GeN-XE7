object DMR: TDMR
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 621
  Width = 898
  object RESTResponseCategories: TRESTResponse
    ContentType = 'application/json'
    Left = 112
    Top = 96
  end
  object RESTResponse1: TRESTResponse
    Left = 328
    Top = 96
  end
  object RESTClientCategories: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://gamersenmadryn.com.ar/wp-json/wc/v2'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 112
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://gamersenmadryn.com.ar/wp-json/wc/v2'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 328
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <
      item
        Name = 'consumer_key'
        Value = 'ck_7c1d43a542563b3cf47e1bb51b86ccac0099c883'
      end>
    Resource = 'products/?'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 328
    Top = 48
  end
  object RESTRequestCategories: TRESTRequest
    Client = RESTClientCategories
    Params = <
      item
        Name = 'consumer_key'
        Value = 'ck_7c1d43a542563b3cf47e1bb51b86ccac0099c883'
      end>
    Resource = 'products/?'
    Response = RESTResponseCategories
    SynchronizedEvents = False
    Left = 112
    Top = 48
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = O
    FieldDefs = <>
    Response = RESTResponse1
    Left = 328
    Top = 144
  end
  object RESTResponseDataSetAdapterCategories: TRESTResponseDataSetAdapter
    Dataset = FDMemTableCategories
    FieldDefs = <>
    Response = RESTResponseCategories
    Left = 112
    Top = 144
  end
  object FDMemTableCategories: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 112
    Top = 192
  end
  object O: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 328
    Top = 192
  end
  object FDQuery1: TFDQuery
    Left = 232
    Top = 16
  end
  object FDQuery2: TFDQuery
    Left = 232
    Top = 80
  end
  object T: TFDQuery
    Left = 232
    Top = 128
  end
end
