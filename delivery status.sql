SELECT 
    d.delivery_status, 
    COUNT(d.delivery_id) AS total_deliveries
FROM 
    deliveries d
GROUP BY 
    d.delivery_status;

