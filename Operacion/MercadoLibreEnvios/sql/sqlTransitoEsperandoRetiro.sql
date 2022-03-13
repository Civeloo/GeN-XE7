'SELECT order_items.title, order_items.full_unit_price, order_items.quantity, order_items.seller_sku, buyer.first_name, buyer.last_name, buyer.nickname, "Ver" AS ITEMS, orders.shipping, orders.buyer, order_items.order_id  FROM orders INNER JOIN order_items ON orders.id = order_items.order_id LEFT JOIN shipments ON orders.shipping = shipments.id LEFT JOIN shipping_option ON shipments.shipping_option = shipping_option.id LEFT JOIN buyer ON orders.buyer = buyer.id LEFT JOIN despachados ON orders.id = despachados.order_id WHERE  (shipments.status=''shipped'') AND  (shipments.substatus=''waiting_for_withdrawal'')'
