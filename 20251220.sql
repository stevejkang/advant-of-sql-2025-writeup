SELECT 
    YEAR(purchased_at) AS year,
    SUM(CASE WHEN shipping_method = 'Standard' THEN 1 ELSE 0 END) + SUM(CASE WHEN is_returned = TRUE THEN 1 ELSE 0 END) AS standard,
    SUM(CASE WHEN shipping_method = 'Express' THEN 1 ELSE 0 END) AS express,
    SUM(CASE WHEN shipping_method = 'Overnight' THEN 1 ELSE 0 END) AS overnight
FROM transactions
WHERE is_online_order = TRUE AND YEAR(purchased_at) BETWEEN 2018 AND 2023 AND MONTH(purchased_at) IN (11, 12)
GROUP BY YEAR(purchased_at)
ORDER BY year ASC;
