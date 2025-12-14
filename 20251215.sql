SELECT
    ar.name AS artist,
    aw.title AS title
FROM artworks aw
JOIN artworks_artists aa ON aw.artwork_id = aa.artwork_id
JOIN artists ar ON aa.artist_id = ar.artist_id
WHERE aw.classification LIKE 'Film%' AND ar.nationality = 'Korean';
