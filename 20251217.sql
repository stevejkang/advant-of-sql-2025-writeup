WITH first_orders AS (
  SELECT DISTINCT
    r.customer_id,
    r.order_id,
    r.category,
    r.sub_category
  FROM records r
  INNER JOIN customer_stats cs
    ON r.customer_id = cs.customer_id
    AND r.order_date = cs.first_order_date
)
SELECT 
  category,
  sub_category,
  COUNT(DISTINCT order_id) AS cnt_orders
FROM first_orders
GROUP BY category, sub_category
ORDER BY cnt_orders DESC
