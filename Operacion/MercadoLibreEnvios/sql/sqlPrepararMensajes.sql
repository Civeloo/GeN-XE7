--{sqlPrepararMensajes=sqlMensajesNoLeido+' AND '+whereSinEnviar+' AND '+whereNoEmbalado;
--{sqlMensajesNoLeido=sqlMensajes+' AND '+whereNoLeido;
--{sqlMensajes=sqlSelectOrderItems+', messages.*'+sqlOrderFrom+' INNER JOIN messages ON orders.id = messages.order_id'+' WHERE '+wherePaid+' AND (NOT '+whereShipped+') AND (NOT'+whereNoSubject+')';
--{sqlSelectOrderItems
SELECT 
    order_items.title
    , order_items.full_unit_price, order_items.quantity
    , order_items.seller_sku, buyer.first_name
    , buyer.last_name, buyer.nickname, "Ver" AS ITEMS
    , orders.shipping, orders.buyer, order_items.order_id
--}sqlSelectOrderItems
    , messages.*	
--{sqlOrderFrom
 FROM orders
     INNER JOIN order_items ON orders.id = order_items.order_id
     LEFT JOIN shipments ON orders.shipping = shipments.id
     LEFT JOIN shipping_option ON shipments.shipping_option = shipping_option.id
     LEFT JOIN buyer ON orders.buyer = buyer.id
     LEFT JOIN despachados ON orders.id = despachados.order_id
--}sqlOrderFrom
     INNER JOIN messages ON orders.id = messages.order_id

 WHERE (orders.status='paid') --wherePaid

 AND (NOT (messages.subject='')) --whereNoSubject
--}sqlMensajes
 AND  (messages.date_read='')
--}sqlMensajesNoLeido
 AND (orders.tags LIKE '%not_delivered%') --whereSinEnviar
 AND (NOT(despachados.embalado='S')) --whereNoEmbalado
 AND (NOT (shipments.status='shipped')) --whereShipped 
--}sqlPrepararMensajes
--AND orders.date_created > '2019-08-30T00:00:00.000-04:00'
--AND orders.date_last_updated < '2019-09-02T10:02:00.000-04:00'