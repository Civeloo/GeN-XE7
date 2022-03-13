--{sqlDespacharEnvios=sqlDespachar+' AND '+whereReady_to_ship+' AND (NOT'+whereFlex+')';
--{sqlDespachar=sqlItems+' WHERE '+wherePaid+' AND '+whereNot_delivered+' AND (NOT '+whereShipped+') AND '+whereEmbalado;
--{sqlItems=sqlSelectOrderItems+sqlOrderFrom;
--{sqlSelectOrderItems
SELECT 
shipments.tracking_method,
orders.date_created,
shipments.status,
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
 AND ((despachados.embalado='S') OR (shipments.substatus='printed') OR (shipments.substatus='ready_for_pickup')) --whereEmbalado
--}sqlDespachar
 AND shipments.status='ready_to_ship' --whereReady_to_ship
 AND (NOT(shipments.tracking_method LIKE '%Express')) --whereNoFlex
--}sqlDespacharEnvios
-- AND orders.date_created > '2019-09-08T00:00:00.000-00:00'
-- AND orders.date_last_updated > '2019-09-13T00:00:00.000-04:00'