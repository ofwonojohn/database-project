SELECT 
    m.item_name, 
    SUM(oi.quantity) AS total_orders
FROM 
    order_items oi
JOIN 
    menus m ON oi.menu_id = m.menu_id
GROUP BY 
    m.item_name
ORDER BY 
    total_orders DESC
LIMIT 10;

