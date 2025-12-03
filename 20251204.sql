SELECT customer_id FROM records WHERE order_date BETWEEN '2020-12-01' AND '2020-12-31' GROUP BY customer_id HAVING SUM(sales) >= 1000;
