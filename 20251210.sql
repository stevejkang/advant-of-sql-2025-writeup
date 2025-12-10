SELECT 
    a.id,
    a.name,
    GROUP_CONCAT(DISTINCT r.medal ORDER BY 
        CASE r.medal 
            WHEN 'Gold' THEN 1 
            WHEN 'Silver' THEN 2 
            WHEN 'Bronze' THEN 3 
        END
    ) AS medals
FROM athletes a
JOIN records r ON a.id = r.athlete_id
JOIN teams t ON r.team_id = t.id
JOIN events e ON r.event_id = e.id
WHERE t.team = 'KOR'
    AND e.event = 'Volleyball Women''s Volleyball'
    AND r.medal IS NOT NULL
GROUP BY a.id, a.name
ORDER BY a.id;
