SELECT
  r.customer_id
FROM
  rental r
  INNER JOIN customer c ON r.customer_id = c.customer_id
  AND c.active = 1
WHERE
  1 = 1
GROUP BY
  customer_id
HAVING
  COUNT(rental_id) >= 35;
