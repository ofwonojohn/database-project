SELECT 
    o.order_id, o.total_price, o.order_status,
    d.delivery_status, d.delivery_address,
    p.payment_method, p.payment_status
FROM 
    orders o
JOIN 
    deliveries d ON o.order_id = d.order_id
JOIN 
    payments p ON o.order_id = p.order_id;



