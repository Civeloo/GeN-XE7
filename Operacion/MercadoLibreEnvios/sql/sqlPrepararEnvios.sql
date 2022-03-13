--{sqlPrepararEnvios=sqlPreparar+' AND '+whereReady_to_ship+' AND '+whereReadyToPrint+' AND (NOT'+whereFlex+') AND (NOT'+whereNoMode+')';
--{sqlPreparar=sqlItems+' WHERE '+wherePaid+' AND '+whereNot_delivered+' AND (NOT '+whereShipped+') AND '+whereNoEmbalado;
--{sqlItems=sqlSelectOrderItems+sqlOrderFrom;
--{sqlSelectOrderItems
SELECT
shipments.mode,
shipments.substatus, 
shipments.substatus_history,
    order_items.title
    , order_items.full_unit_price, order_items.quantity
    , order_items.seller_sku, buyer.first_name
    , buyer.last_name, buyer.nickname, "Ver" AS ITEMS
    , orders.shipping, orders.buyer, order_items.order_id
--}sqlSelectOrderItems
--{sqlOrderFrom
 FROM orders
     INNER JOIN order_items ON orders.id = order_items.order_id
     LEFT JOIN shipments ON orders.shipping = shipments.id
     LEFT JOIN shipping_option ON shipments.shipping_option = shipping_option.id
     LEFT JOIN buyer ON orders.buyer = buyer.id
     LEFT JOIN despachados ON orders.id = despachados.order_id
--}sqlOrderFrom
--}sqlItems
 WHERE
 (orders.status='paid') --wherePaid
 AND (orders.tags LIKE '%not_delivered%') --whereNot_delivered
 AND (NOT (shipments.status='shipped')) --whereShipped
 AND (NOT(despachados.embalado='S') AND (((shipments.substatus is null) or (shipments.substatus='')) or ((shipments.substatus='ready_to_print') or (shipments.substatus='ready_to_pack')))) --whereNoEmbalado
--}sqlPreparar
 AND shipments.status='ready_to_ship' --whereReady_to_ship
-- AND ((shipments.substatus='ready_to_print') or (shipments.substatus='ready_to_pack')) --whereReadyToPrint
 AND (NOT (shipments.tracking_method LIKE '%Express')) --whereFlex
 AND NOT((shipments.mode is null) or (shipments.mode='')) --whereNoMode
--}sqlPrepararEnvios
-- AND orders.date_created > '2019-09-08T00:00:00.000-00:00'
-- AND orders.date_last_updated > '2019-08-09T00:00:00.000-04:00'