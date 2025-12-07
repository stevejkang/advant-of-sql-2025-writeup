SELECT 
    measured_at AS date_alert
FROM (
    SELECT 
        measured_at,
        pm10,
        LAG(pm10, 1) OVER (ORDER BY measured_at) AS prev_pm10,
        LAG(pm10, 2) OVER (ORDER BY measured_at) AS prev2_pm10
    FROM measurements
    WHERE 1=1
) subquery
WHERE pm10 >= 30
    AND prev_pm10 IS NOT NULL
    AND prev2_pm10 IS NOT NULL
    AND pm10 > prev_pm10
    AND prev_pm10 > prev2_pm10
ORDER BY date_alert ASC;
