WITH players AS (
  SELECT DISTINCT
    a.id,
    a.name,
    g.year,
    g.id as game_id
  FROM athletes a
  JOIN records r ON a.id = r.athlete_id
  JOIN games g ON r.game_id = g.id
  JOIN events e ON r.event_id = e.id
  JOIN teams t ON r.team_id = t.id
  WHERE t.team = 'KOR'
    AND e.event = 'Volleyball Women''s Volleyball'
    AND r.sex = 'F'
),
player_years AS (
  SELECT 
    id,
    name,
    year,
    LAG(year) OVER (PARTITION BY id ORDER BY year) as prev_year
  FROM players
),
consecutive_players AS (
  SELECT DISTINCT
    id,
    name
  FROM player_years
  WHERE year - prev_year = 4
)
SELECT 
  id,
  name
FROM consecutive_players
ORDER BY id;
