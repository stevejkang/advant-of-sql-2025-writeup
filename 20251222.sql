WITH daily_orders AS (
    SELECT DATE(purchased_at) AS order_date, COUNT(*) AS num_orders
    FROM transactions
    WHERE is_online_order = TRUE
        AND DATE(purchased_at) >= '2023-11-01'
        AND DATE(purchased_at) < '2024-01-01'
    GROUP BY DATE(purchased_at)
)
SELECT 
    order_date,
    CASE DAYOFWEEK(order_date)
        WHEN 1 THEN 'Sunday'
        WHEN 2 THEN 'Monday'
        WHEN 3 THEN 'Tuesday'
        WHEN 4 THEN 'Wednesday'
        WHEN 5 THEN 'Thursday'
        WHEN 6 THEN 'Friday'
        WHEN 7 THEN 'Saturday'
    END AS weekday,
    num_orders AS num_orders_today,
    num_orders + COALESCE(LAG(num_orders) OVER (ORDER BY order_date), 0) AS num_orders_from_yesterday
FROM daily_orders
ORDER BY order_date;
