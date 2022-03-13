--{sqlPreparar=sqlItems+' WHERE '+wherePaid+' AND '+whereNoDelivered+' AND '+whereNoShipped+' AND '+whereNoEmbalado;
--{sqlItems=sqlSelectOrderItems+sqlOrderFrom;
--{sqlSelectOrderItems
SELECT 
orders.date_created,
shipments.mode,
shipments.status,
shipments.substatus,
shipments.tracking_method,
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
 AND ((orders.tags is null) or (orders.tags LIKE '%not_delivered%')) --whereNot_delivered
 AND ((shipments.status is null) or NOT(shipments.status='shipped')) --whereNoShipped
 AND ( NOT(despachados.embalado='S') AND ( ((shipments.substatus is null) or (shipments.substatus='')) or ((shipments.substatus='ready_to_print') or (shipments.substatus='ready_to_pack')) ) ) --whereNoEmbalado
--}sqlPreparar
-- AND orders.date_created > '2019-09-08T00:00:00.000-00:00'
-- AND orders.date_last_updated > '2019-08-08T00:00:00.000-04:00'
