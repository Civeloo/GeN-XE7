object dmML: TdmML
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 325
  Width = 293
  object dbMain: TFDConnection
    Params.Strings = (
      'Database=C:\Users\DeGsoft\Documents\Civeloo\GeN\db\ml.sdb'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 8
  end
  object tOrders: TFDQuery
    Connection = dbMain
    FetchOptions.AssignedValues = [evRowsetSize]
    SQL.Strings = (
      'SELECT * FROM orders')
    Left = 72
    object tOrdersid: TWideMemoField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      BlobType = ftWideMemo
    end
    object tOrderscomments: TWideMemoField
      FieldName = 'comments'
      Origin = 'comments'
      BlobType = ftWideMemo
    end
    object tOrdersstatus: TWideMemoField
      FieldName = 'status'
      Origin = 'status'
      BlobType = ftWideMemo
    end
    object tOrdersstatus_detail: TWideMemoField
      FieldName = 'status_detail'
      Origin = 'status_detail'
      BlobType = ftWideMemo
    end
    object tOrdersdate_created: TWideMemoField
      FieldName = 'date_created'
      Origin = 'date_created'
      BlobType = ftWideMemo
    end
    object tOrdersdate_closed: TWideMemoField
      FieldName = 'date_closed'
      Origin = 'date_closed'
      BlobType = ftWideMemo
    end
    object tOrderslast_updated: TWideMemoField
      FieldName = 'last_updated'
      Origin = 'last_updated'
      BlobType = ftWideMemo
    end
    object tOrdersexpiration_date: TWideMemoField
      FieldName = 'expiration_date'
      Origin = 'expiration_date'
      BlobType = ftWideMemo
    end
    object tOrdersdate_last_updated: TWideMemoField
      FieldName = 'date_last_updated'
      Origin = 'date_last_updated'
      BlobType = ftWideMemo
    end
    object tOrdershidden_for_seller: TWideMemoField
      FieldName = 'hidden_for_seller'
      Origin = 'hidden_for_seller'
      BlobType = ftWideMemo
    end
    object tOrderscurrency_id: TWideMemoField
      FieldName = 'currency_id'
      Origin = 'currency_id'
      BlobType = ftWideMemo
    end
    object tOrdersorder_items: TWideMemoField
      FieldName = 'order_items'
      Origin = 'order_items'
      BlobType = ftWideMemo
    end
    object tOrderstotal_amount: TWideMemoField
      FieldName = 'total_amount'
      Origin = 'total_amount'
      BlobType = ftWideMemo
    end
    object tOrdersmediations: TWideMemoField
      FieldName = 'mediations'
      Origin = 'mediations'
      BlobType = ftWideMemo
    end
    object tOrderspayments: TWideMemoField
      FieldName = 'payments'
      Origin = 'payments'
      BlobType = ftWideMemo
    end
    object tOrdersshipping: TWideMemoField
      FieldName = 'shipping'
      Origin = 'shipping'
      BlobType = ftWideMemo
    end
    object tOrdersorder_request: TWideMemoField
      FieldName = 'order_request'
      Origin = 'order_request'
      BlobType = ftWideMemo
    end
    object tOrderspickup_id: TWideMemoField
      FieldName = 'pickup_id'
      Origin = 'pickup_id'
      BlobType = ftWideMemo
    end
    object tOrdersbuyer: TWideMemoField
      FieldName = 'buyer'
      Origin = 'buyer'
      BlobType = ftWideMemo
    end
    object tOrdersseller: TWideMemoField
      FieldName = 'seller'
      Origin = 'seller'
      BlobType = ftWideMemo
    end
    object tOrdersfeedback: TWideMemoField
      FieldName = 'feedback'
      Origin = 'feedback'
      BlobType = ftWideMemo
    end
    object tOrderstags: TWideMemoField
      FieldName = 'tags'
      Origin = 'tags'
      BlobType = ftWideMemo
    end
    object tOrdersmanufacturing_ending_date: TWideMemoField
      FieldName = 'manufacturing_ending_date'
      Origin = 'manufacturing_ending_date'
      BlobType = ftWideMemo
    end
    object tOrderspack_id: TWideMemoField
      FieldName = 'pack_id'
      Origin = 'pack_id'
      BlobType = ftWideMemo
    end
    object tOrdersfulfilled: TWideMemoField
      FieldName = 'fulfilled'
      Origin = 'fulfilled'
      BlobType = ftWideMemo
    end
    object tOrderstotal_amount_with_shipping: TWideMemoField
      FieldName = 'total_amount_with_shipping'
      Origin = 'total_amount_with_shipping'
      BlobType = ftWideMemo
    end
    object tOrderspaid_amount: TWideMemoField
      FieldName = 'paid_amount'
      Origin = 'paid_amount'
      BlobType = ftWideMemo
    end
    object tOrderscoupon: TWideMemoField
      FieldName = 'coupon'
      Origin = 'coupon'
      BlobType = ftWideMemo
    end
    object tOrderstaxes: TWideMemoField
      FieldName = 'taxes'
      Origin = 'taxes'
      BlobType = ftWideMemo
    end
  end
  object tOrder_items: TFDQuery
    Connection = dbMain
    FetchOptions.AssignedValues = [evRowsetSize]
    SQL.Strings = (
      'SELECT * FROM order_items')
    Left = 72
    Top = 48
    object tOrder_itemsid: TWideMemoField
      FieldName = 'id'
      Origin = 'id'
      BlobType = ftWideMemo
    end
    object tOrder_itemsorder_id: TWideMemoField
      FieldName = 'order_id'
      Origin = 'order_id'
      BlobType = ftWideMemo
    end
    object tOrder_itemsitem_id: TWideMemoField
      FieldName = 'item_id'
      Origin = 'item_id'
      BlobType = ftWideMemo
    end
    object tOrder_itemstitle: TWideMemoField
      FieldName = 'title'
      Origin = 'title'
      BlobType = ftWideMemo
    end
    object tOrder_itemscategory_id: TWideMemoField
      FieldName = 'category_id'
      Origin = 'category_id'
      BlobType = ftWideMemo
    end
    object tOrder_itemsvariation_id: TWideMemoField
      FieldName = 'variation_id'
      Origin = 'variation_id'
      BlobType = ftWideMemo
    end
    object tOrder_itemsseller_custom_field: TWideMemoField
      FieldName = 'seller_custom_field'
      Origin = 'seller_custom_field'
      BlobType = ftWideMemo
    end
    object tOrder_itemswarranty: TWideMemoField
      FieldName = 'warranty'
      Origin = 'warranty'
      BlobType = ftWideMemo
    end
    object tOrder_itemscondition: TWideMemoField
      FieldName = 'condition'
      Origin = 'condition'
      BlobType = ftWideMemo
    end
    object tOrder_itemsseller_sku: TWideMemoField
      FieldName = 'seller_sku'
      Origin = 'seller_sku'
      BlobType = ftWideMemo
    end
    object tOrder_itemsquantity: TWideMemoField
      FieldName = 'quantity'
      Origin = 'quantity'
      BlobType = ftWideMemo
    end
    object tOrder_itemssale_fee: TWideMemoField
      FieldName = 'sale_fee'
      Origin = 'sale_fee'
      BlobType = ftWideMemo
    end
    object tOrder_itemslisting_type_id: TWideMemoField
      FieldName = 'listing_type_id'
      Origin = 'listing_type_id'
      BlobType = ftWideMemo
    end
    object tOrder_itemsbase_currency_id: TWideMemoField
      FieldName = 'base_currency_id'
      Origin = 'base_currency_id'
      BlobType = ftWideMemo
    end
    object tOrder_itemsunit_price: TWideMemoField
      FieldName = 'unit_price'
      Origin = 'unit_price'
      BlobType = ftWideMemo
    end
    object tOrder_itemsfull_unit_price: TWideMemoField
      FieldName = 'full_unit_price'
      Origin = 'full_unit_price'
      BlobType = ftWideMemo
    end
    object tOrder_itemsbase_exchange_rate: TWideMemoField
      FieldName = 'base_exchange_rate'
      Origin = 'base_exchange_rate'
      BlobType = ftWideMemo
    end
    object tOrder_itemscurrency_id: TWideMemoField
      FieldName = 'currency_id'
      Origin = 'currency_id'
      BlobType = ftWideMemo
    end
    object tOrder_itemsmanufacturing_days: TWideMemoField
      FieldName = 'manufacturing_days'
      Origin = 'manufacturing_days'
      BlobType = ftWideMemo
    end
  end
  object tMessages: TFDQuery
    Connection = dbMain
    FetchOptions.AssignedValues = [evRowsetSize]
    SQL.Strings = (
      'SELECT * FROM messages')
    Left = 72
    Top = 96
    object tMessagesid: TWideMemoField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      BlobType = ftWideMemo
    end
    object tMessagesorder_id: TWideMemoField
      FieldName = 'order_id'
      Origin = 'order_id'
      BlobType = ftWideMemo
    end
    object tMessagespack_id: TWideMemoField
      FieldName = 'pack_id'
      Origin = 'pack_id'
      BlobType = ftWideMemo
    end
    object tMessagesmessage_id: TWideMemoField
      FieldName = 'message_id'
      Origin = 'message_id'
      BlobType = ftWideMemo
    end
    object tMessagesdate_received: TWideMemoField
      FieldName = 'date_received'
      Origin = 'date_received'
      BlobType = ftWideMemo
    end
    object tMessagesdate: TWideMemoField
      FieldName = 'date'
      Origin = 'date'
      BlobType = ftWideMemo
    end
    object tMessagesdate_available: TWideMemoField
      FieldName = 'date_available'
      Origin = 'date_available'
      BlobType = ftWideMemo
    end
    object tMessagesdate_notified: TWideMemoField
      FieldName = 'date_notified'
      Origin = 'date_notified'
      BlobType = ftWideMemo
    end
    object tMessagesdate_read: TWideMemoField
      FieldName = 'date_read'
      Origin = 'date_read'
      BlobType = ftWideMemo
    end
    object tMessagesfrom_user_id: TWideMemoField
      FieldName = 'from_user_id'
      Origin = 'from_user_id'
      BlobType = ftWideMemo
    end
    object tMessagesfrom_email: TWideMemoField
      FieldName = 'from_email'
      Origin = 'from_email'
      BlobType = ftWideMemo
    end
    object tMessagesfrom_name: TWideMemoField
      FieldName = 'from_name'
      Origin = 'from_name'
      BlobType = ftWideMemo
    end
    object tMessagesto_user_id: TWideMemoField
      FieldName = 'to_user_id'
      Origin = 'to_user_id'
      BlobType = ftWideMemo
    end
    object tMessagesto_email: TWideMemoField
      FieldName = 'to_email'
      Origin = 'to_email'
      BlobType = ftWideMemo
    end
    object tMessagessubject: TWideMemoField
      FieldName = 'subject'
      Origin = 'subject'
      BlobType = ftWideMemo
    end
    object tMessagestext_plain: TWideMemoField
      FieldName = 'text_plain'
      Origin = 'text_plain'
      BlobType = ftWideMemo
    end
    object tMessagesattachments: TWideStringField
      FieldName = 'attachments'
      Origin = 'attachments'
      Size = 32767
    end
    object tMessagesattachments_validations_invalid_size: TWideMemoField
      FieldName = 'attachments_validations_invalid_size'
      Origin = 'attachments_validations_invalid_size'
      BlobType = ftWideMemo
    end
    object tMessagesattachments_validations_invalid_extension: TWideMemoField
      FieldName = 'attachments_validations_invalid_extension'
      Origin = 'attachments_validations_invalid_extension'
      BlobType = ftWideMemo
    end
    object tMessagesattachments_validations_forbidden: TWideMemoField
      FieldName = 'attachments_validations_forbidden'
      Origin = 'attachments_validations_forbidden'
      BlobType = ftWideMemo
    end
    object tMessagesattachments_validations_internal_error: TWideMemoField
      FieldName = 'attachments_validations_internal_error'
      Origin = 'attachments_validations_internal_error'
      BlobType = ftWideMemo
    end
    object tMessagessite_id: TWideMemoField
      FieldName = 'site_id'
      Origin = 'site_id'
      BlobType = ftWideMemo
    end
    object tMessagesresource: TWideMemoField
      FieldName = 'resource'
      Origin = 'resource'
      BlobType = ftWideMemo
    end
    object tMessagesresource_id: TWideMemoField
      FieldName = 'resource_id'
      Origin = 'resource_id'
      BlobType = ftWideMemo
    end
    object tMessagesstatus: TWideMemoField
      FieldName = 'status'
      Origin = 'status'
      BlobType = ftWideMemo
    end
    object tMessagesmoderation_status: TWideMemoField
      FieldName = 'moderation_status'
      Origin = 'moderation_status'
      BlobType = ftWideMemo
    end
    object tMessagesmoderation_date_moderated: TWideMemoField
      FieldName = 'moderation_date_moderated'
      Origin = 'moderation_date_moderated'
      BlobType = ftWideMemo
    end
    object tMessagesmoderation_source: TWideMemoField
      FieldName = 'moderation_source'
      Origin = 'moderation_source'
      BlobType = ftWideMemo
    end
    object tMessagesconversation_first_message: TWideMemoField
      FieldName = 'conversation_first_message'
      Origin = 'conversation_first_message'
      BlobType = ftWideMemo
    end
    object tMessagesconversation_status: TWideMemoField
      FieldName = 'conversation_status'
      Origin = 'conversation_status'
      BlobType = ftWideMemo
    end
    object tMessagesconversation_status_date: TWideMemoField
      FieldName = 'conversation_status_date'
      Origin = 'conversation_status_date'
      BlobType = ftWideMemo
    end
    object tMessagesconversation_substatus: TWideMemoField
      FieldName = 'conversation_substatus'
      Origin = 'conversation_substatus'
      BlobType = ftWideMemo
    end
    object tMessagesconversation_is_blocking_allowed: TWideMemoField
      FieldName = 'conversation_is_blocking_allowed'
      Origin = 'conversation_is_blocking_allowed'
      BlobType = ftWideMemo
    end
  end
  object FDQuery1: TFDQuery
    Connection = dbMain
    FetchOptions.AssignedValues = [evRowsetSize]
    Left = 8
    Top = 48
  end
  object tShipments: TFDQuery
    Connection = dbMain
    FetchOptions.AssignedValues = [evRowsetSize]
    SQL.Strings = (
      'SELECT * FROM shipments')
    Left = 72
    Top = 144
    object tShipmentsid: TWideMemoField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      BlobType = ftWideMemo
    end
    object tShipmentsmode: TWideMemoField
      FieldName = 'mode'
      Origin = 'mode'
      BlobType = ftWideMemo
    end
    object tShipmentscreated_by: TWideMemoField
      FieldName = 'created_by'
      Origin = 'created_by'
      BlobType = ftWideMemo
    end
    object tShipmentsorder_id: TWideMemoField
      FieldName = 'order_id'
      Origin = 'order_id'
      BlobType = ftWideMemo
    end
    object tShipmentsorder_cost: TWideMemoField
      FieldName = 'order_cost'
      Origin = 'order_cost'
      BlobType = ftWideMemo
    end
    object tShipmentsbase_cost: TWideMemoField
      FieldName = 'base_cost'
      Origin = 'base_cost'
      BlobType = ftWideMemo
    end
    object tShipmentssite_id: TWideMemoField
      FieldName = 'site_id'
      Origin = 'site_id'
      BlobType = ftWideMemo
    end
    object tShipmentsstatus: TWideMemoField
      FieldName = 'status'
      Origin = 'status'
      BlobType = ftWideMemo
    end
    object tShipmentssubstatus: TWideMemoField
      FieldName = 'substatus'
      Origin = 'substatus'
      BlobType = ftWideMemo
    end
    object tShipmentsstatus_history: TWideMemoField
      FieldName = 'status_history'
      Origin = 'status_history'
      BlobType = ftWideMemo
    end
    object tShipmentssubstatus_history: TWideMemoField
      FieldName = 'substatus_history'
      Origin = 'substatus_history'
      BlobType = ftWideMemo
    end
    object tShipmentsdate_created: TWideMemoField
      FieldName = 'date_created'
      Origin = 'date_created'
      BlobType = ftWideMemo
    end
    object tShipmentslast_updated: TWideMemoField
      FieldName = 'last_updated'
      Origin = 'last_updated'
      BlobType = ftWideMemo
    end
    object tShipmentstracking_number: TWideMemoField
      FieldName = 'tracking_number'
      Origin = 'tracking_number'
      BlobType = ftWideMemo
    end
    object tShipmentstracking_method: TWideMemoField
      FieldName = 'tracking_method'
      Origin = 'tracking_method'
      BlobType = ftWideMemo
    end
    object tShipmentsservice_id: TWideMemoField
      FieldName = 'service_id'
      Origin = 'service_id'
      BlobType = ftWideMemo
    end
    object tShipmentscarrier_info: TWideMemoField
      FieldName = 'carrier_info'
      Origin = 'carrier_info'
      BlobType = ftWideMemo
    end
    object tShipmentssender_id: TWideMemoField
      FieldName = 'sender_id'
      Origin = 'sender_id'
      BlobType = ftWideMemo
    end
    object tShipmentssender_address: TWideMemoField
      FieldName = 'sender_address'
      Origin = 'sender_address'
      BlobType = ftWideMemo
    end
    object tShipmentsreceiver_id: TWideMemoField
      FieldName = 'receiver_id'
      Origin = 'receiver_id'
      BlobType = ftWideMemo
    end
    object tShipmentsreceiver_address: TWideMemoField
      FieldName = 'receiver_address'
      Origin = 'receiver_address'
      BlobType = ftWideMemo
    end
    object tShipmentsshipping_items: TWideMemoField
      FieldName = 'shipping_items'
      Origin = 'shipping_items'
      BlobType = ftWideMemo
    end
    object tShipmentsshipping_option: TWideMemoField
      FieldName = 'shipping_option'
      Origin = 'shipping_option'
      BlobType = ftWideMemo
    end
    object tShipmentscomments: TWideMemoField
      FieldName = 'comments'
      Origin = 'comments'
      BlobType = ftWideMemo
    end
    object tShipmentsdate_first_printed: TWideMemoField
      FieldName = 'date_first_printed'
      Origin = 'date_first_printed'
      BlobType = ftWideMemo
    end
    object tShipmentsmarket_place: TWideMemoField
      FieldName = 'market_place'
      Origin = 'market_place'
      BlobType = ftWideMemo
    end
    object tShipmentsreturn_details: TWideMemoField
      FieldName = 'return_details'
      Origin = 'return_details'
      BlobType = ftWideMemo
    end
    object tShipmentstags: TWideMemoField
      FieldName = 'tags'
      Origin = 'tags'
      BlobType = ftWideMemo
    end
    object tShipmentsdelay: TWideMemoField
      FieldName = 'delay'
      Origin = 'delay'
      BlobType = ftWideMemo
    end
    object tShipmentstype: TWideMemoField
      FieldName = 'type'
      Origin = 'type'
      BlobType = ftWideMemo
    end
    object tShipmentslogistic_type: TWideMemoField
      FieldName = 'logistic_type'
      Origin = 'logistic_type'
      BlobType = ftWideMemo
    end
    object tShipmentsapplication_id: TWideMemoField
      FieldName = 'application_id'
      Origin = 'application_id'
      BlobType = ftWideMemo
    end
    object tShipmentsreturn_tracking_number: TWideMemoField
      FieldName = 'return_tracking_number'
      Origin = 'return_tracking_number'
      BlobType = ftWideMemo
    end
    object tShipmentscost_components: TWideMemoField
      FieldName = 'cost_components'
      Origin = 'cost_components'
      BlobType = ftWideMemo
    end
  end
  object tBuyer: TFDQuery
    Connection = dbMain
    FetchOptions.AssignedValues = [evRowsetSize]
    SQL.Strings = (
      'SELECT * FROM buyer')
    Left = 72
    Top = 192
    object tBuyerid: TWideMemoField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      BlobType = ftWideMemo
    end
    object tBuyernickname: TWideMemoField
      FieldName = 'nickname'
      Origin = 'nickname'
      BlobType = ftWideMemo
    end
    object tBuyeremail: TWideMemoField
      FieldName = 'email'
      Origin = 'email'
      BlobType = ftWideMemo
    end
    object tBuyerphone: TWideMemoField
      FieldName = 'phone'
      Origin = 'phone'
      BlobType = ftWideMemo
    end
    object tBuyeralternative_phone: TWideMemoField
      FieldName = 'alternative_phone'
      Origin = 'alternative_phone'
      BlobType = ftWideMemo
    end
    object tBuyerfirst_name: TWideMemoField
      FieldName = 'first_name'
      Origin = 'first_name'
      BlobType = ftWideMemo
    end
    object tBuyerlast_name: TWideMemoField
      FieldName = 'last_name'
      Origin = 'last_name'
      BlobType = ftWideMemo
    end
    object tBuyerbilling_info: TWideMemoField
      FieldName = 'billing_info'
      Origin = 'billing_info'
      BlobType = ftWideMemo
    end
  end
  object tDespachados: TFDQuery
    Connection = dbMain
    FetchOptions.AssignedValues = [evRowsetSize]
    SQL.Strings = (
      'SELECT * FROM despachados')
    Left = 72
    Top = 240
    object tDespachadosorder_id: TWideMemoField
      FieldName = 'order_id'
      Origin = 'order_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      BlobType = ftWideMemo
    end
    object tDespachadosembalado: TWideMemoField
      FieldName = 'embalado'
      Origin = 'embalado'
      BlobType = ftWideMemo
    end
    object tDespachadosenviado: TWideMemoField
      FieldName = 'enviado'
      Origin = 'enviado'
      BlobType = ftWideMemo
    end
  end
  object FDBatchMove2: TFDBatchMove
    Reader = FDBatchMoveDataSetReader1
    Writer = FDBatchMoveTextWriter1
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 8
    Top = 93
  end
  object FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader
    Left = 8
    Top = 141
  end
  object FDBatchMoveTextWriter1: TFDBatchMoveTextWriter
    DataDef.Fields = <>
    DataDef.Delimiter = #0
    DataDef.Separator = ';'
    DataDef.RecordFormat = rfCustom
    DataDef.WithFieldNames = True
    Left = 8
    Top = 189
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'csv'
    Filter = 'CSV files only|*.csv'
    Left = 5
    Top = 240
  end
  object tShipping_option: TFDQuery
    Connection = dbMain
    FetchOptions.AssignedValues = [evRowsetSize]
    SQL.Strings = (
      'select * from shipping_option')
    Left = 112
    Top = 144
    object tShipping_optionid: TWideMemoField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      BlobType = ftWideMemo
    end
    object tShipping_optionshipping_method_id: TWideMemoField
      FieldName = 'shipping_method_id'
      Origin = 'shipping_method_id'
      BlobType = ftWideMemo
    end
    object tShipping_optionname: TWideMemoField
      FieldName = 'name'
      Origin = 'name'
      BlobType = ftWideMemo
    end
    object tShipping_optioncurrency_id: TWideMemoField
      FieldName = 'currency_id'
      Origin = 'currency_id'
      BlobType = ftWideMemo
    end
    object tShipping_optionlist_cost: TWideMemoField
      FieldName = 'list_cost'
      Origin = 'list_cost'
      BlobType = ftWideMemo
    end
    object tShipping_optioncost: TWideMemoField
      FieldName = 'cost'
      Origin = 'cost'
      BlobType = ftWideMemo
    end
    object tShipping_optiondelivery_type: TWideMemoField
      FieldName = 'delivery_type'
      Origin = 'delivery_type'
      BlobType = ftWideMemo
    end
    object tShipping_optionestimated_schedule_limit: TWideMemoField
      FieldName = 'estimated_schedule_limit'
      Origin = 'estimated_schedule_limit'
      BlobType = ftWideMemo
    end
    object tShipping_optionestimated_delivery_time: TWideMemoField
      FieldName = 'estimated_delivery_time'
      Origin = 'estimated_delivery_time'
      BlobType = ftWideMemo
    end
    object tShipping_optionestimated_delivery_limit: TWideMemoField
      FieldName = 'estimated_delivery_limit'
      Origin = 'estimated_delivery_limit'
      BlobType = ftWideMemo
    end
    object tShipping_optionestimated_delivery_final: TWideMemoField
      FieldName = 'estimated_delivery_final'
      Origin = 'estimated_delivery_final'
      BlobType = ftWideMemo
    end
    object tShipping_optionestimated_handling_limit: TWideMemoField
      FieldName = 'estimated_handling_limit'
      Origin = 'estimated_handling_limit'
      BlobType = ftWideMemo
    end
  end
end
