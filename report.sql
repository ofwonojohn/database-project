SELECT 
    u.user_id,
    u.name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_price) AS total_revenue,
    AVG(o.total_price) AS average_order_value,
    COUNT(d.delivery_id) AS total_deliveries,
    (SELECT COUNT(oi.order_item_id) 
     FROM order_items oi 
     WHERE oi.order_id IN (SELECT o2.order_id FROM orders o2 WHERE o2.user_id = u.user_id)) AS total_items_ordered,
    (SELECT item_name 
     FROM menus 
     WHERE menu_id = (SELECT oi.menu_id 
                      FROM order_items oi 
                      JOIN orders o3 ON oi.order_id = o3.order_id 
                      WHERE o3.user_id = u.user_id 
                      GROUP BY oi.menu_id 
                      ORDER BY COUNT(oi.order_item_id) DESC 
                      LIMIT 1)) AS most_ordered_item
FROM 
    users u
LEFT JOIN 
    orders o ON u.user_id = o.user_id
LEFT JOIN 
    deliveries d ON o.order_id = d.order_id
GROUP BY 
    u.user_id, u.name
ORDER BY 
    total_revenue DESC;
