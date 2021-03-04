CREATE VIEW top_3_artistas AS
SELECT
m.musician_name AS artista,
COUNT(fm.user_id) AS seguidores
FROM Musicians AS m
INNER JOIN Following_Musicians AS fm
ON fm.musician_id = m.musician_id
GROUP BY fm.musician_id
ORDER BY seguidores DESC, m.musician_name
LIMIT 3;
