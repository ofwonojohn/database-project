SELECT 
    u.name, u.email, 
    COUNT(o.order_id) AS total_orders, 
    SUM(o.total_price) AS total_spent
FROM 
    orders o
JOIN 
    users u ON o.user_id = u.user_id
GROUP BY 
    u.user_id, u.name, u.email
ORDER BY 
    total_spent DESC;

