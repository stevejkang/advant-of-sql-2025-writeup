SELECT 
    CASE 
        WHEN day IN ('Sat', 'Sun') THEN 'weekend'
        ELSE 'weekday'
    END AS week,
    SUM(total_bill) AS sales
FROM tips
GROUP BY 
    CASE 
        WHEN day IN ('Sat', 'Sun') THEN 'weekend'
        ELSE 'weekday'
    END
ORDER BY sales DESC;
