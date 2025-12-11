SELECT 
    g.name AS genre,
    ROUND(AVG(CASE WHEN gm.year = 2011 THEN gm.critic_score END), 2) AS score_2011,
    ROUND(AVG(CASE WHEN gm.year = 2012 THEN gm.critic_score END), 2) AS score_2012,
    ROUND(AVG(CASE WHEN gm.year = 2013 THEN gm.critic_score END), 2) AS score_2013,
    ROUND(AVG(CASE WHEN gm.year = 2014 THEN gm.critic_score END), 2) AS score_2014,
    ROUND(AVG(CASE WHEN gm.year = 2015 THEN gm.critic_score END), 2) AS score_2015
FROM 
    genres g
    LEFT JOIN games gm ON g.genre_id = gm.genre_id
        AND gm.year BETWEEN 2011 AND 2015
        AND gm.critic_score IS NOT NULL
GROUP BY 
    g.genre_id, g.name
ORDER BY 
    g.name;
