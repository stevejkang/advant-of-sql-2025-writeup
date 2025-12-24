WITH customer_sales AS (
    SELECT 
        city_id,
        customer_id,
        SUM(total_price - discount_amount) AS total_spent
    FROM transactions
    WHERE is_returned = FALSE
    GROUP BY city_id, customer_id
),
ranked_customers AS (
    SELECT 
        city_id,
        customer_id,
        total_spent,
        ROW_NUMBER() OVER (PARTITION BY city_id ORDER BY total_spent DESC) AS rank
    FROM customer_sales
)
SELECT 
    city_id,
    customer_id,
    total_spent
FROM ranked_customers
WHERE rank = 1
ORDER BY city_id;
