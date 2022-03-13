SELECT
 orders.date_last_updated,
 orders.tags,
    order_items.title
    , order_items.full_unit_price, order_items.quantity
    , order_items.seller_sku, buyer.first_name
    , buyer.last_name, buyer.nickname, "Ver" AS ITEMS
    , orders.shipping, orders.buyer, order_items.order_id
 FROM orders
     inner JOIN order_items ON orders.id = order_items.order_id
     left JOIN shipments ON orders.shipping = shipments.id
     LEFT JOIN shipping_option ON shipments.shipping_option = shipping_option.id
     left JOIN buyer ON orders.buyer = buyer.id
     LEFT JOIN despachados ON orders.id = despachados.order_id
 where 
 orders.status='paid'
 and ( orders.tags='["not_delivered","paid"]' )
ORDER BY orders.date_last_updated