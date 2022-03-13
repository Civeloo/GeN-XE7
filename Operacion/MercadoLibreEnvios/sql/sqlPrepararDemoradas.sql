--{sqlPrepararDemoradas=sqlPreparar+' AND '+whereDelayed;
--{sqlPreparar=sqlItems+' WHERE '+wherePaid+' AND '+whereNot_delivered+' AND (NOT '+whereShipped+') AND '+whereNoEmbalado;
--{sqlItems=sqlSelectOrderItems+sqlOrderFrom;
--{sqlSelectOrderItems
SELECT 
shipments.mode,
shipments.substatus,
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
 AND (NOT(despachados.embalado='S')) --whereNoEmbalado
--}sqlPreparar
 AND (shipments.substatus='delayed')
--}sqlPrepararDemoradas
-- AND orders.date_created > '2019-09-02T00:00:00.000-04:00'
-- AND orders.date_last_updated < '2019-09-04T00:00:00.000-04:00'

