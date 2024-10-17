SELECT 
    DATE(o.created_at) AS order_date, 
    COUNT(o.order_id) AS total_orders, 
    SUM(o.total_price) AS total_revenue
FROM 
    orders o
GROUP BY 
    order_date
ORDER BY 
    order_date DESC;
