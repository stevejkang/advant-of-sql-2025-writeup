WITH user_friends_count AS (
    SELECT user_a_id AS user_id, COUNT(*) AS friend_count
    FROM edges
    GROUP BY user_a_id
    UNION ALL
    SELECT user_b_id AS user_id, COUNT(*) AS friend_count
    FROM edges
    GROUP BY user_b_id
),
user_total_friends AS (
    SELECT user_id, SUM(friend_count) AS friends
    FROM user_friends_count
    GROUP BY user_id
    HAVING SUM(friend_count) >= 100
),
candidate_friends AS (
    SELECT e.user_a_id AS candidate_id, e.user_b_id AS friend_id
    FROM edges e
    INNER JOIN user_total_friends utf ON e.user_a_id = utf.user_id
    UNION ALL
    SELECT e.user_b_id AS candidate_id, e.user_a_id AS friend_id
    FROM edges e
    INNER JOIN user_total_friends utf ON e.user_b_id = utf.user_id
),
friends_of_friends_sum AS (
    SELECT cf.candidate_id, SUM(ufc.friend_count) AS friends_of_friends
    FROM candidate_friends cf
    INNER JOIN user_friends_count ufc ON cf.friend_id = ufc.user_id
    GROUP BY cf.candidate_id
)
SELECT utf.user_id, utf.friends, fof.friends_of_friends, ROUND(CAST(fof.friends_of_friends AS FLOAT) / utf.friends, 2) AS ratio
FROM user_total_friends utf
INNER JOIN friends_of_friends_sum fof ON utf.user_id = fof.candidate_id
ORDER BY ratio DESC
LIMIT 5;
