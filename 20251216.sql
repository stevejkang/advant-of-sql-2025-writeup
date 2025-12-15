SELECT 
    user_a_id,
    user_b_id,
    user_a_id + user_b_id AS id_sum
FROM edges
ORDER BY user_a_id + user_b_id ASC
LIMIT (SELECT FLOOR(COUNT(*) * 0.001) FROM edges);
