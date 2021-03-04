CREATE VIEW cancoes_premium AS
SELECT
s.song_name AS nome,
COUNT(rh.song_id) AS reproducoes
FROM Songs AS s
INNER JOIN Reproduction_History AS rh
ON s.song_id = rh.song_id
INNER JOIN User AS u
ON rh.user_id = u.user_id
WHERE u.plan_id IN (1, 3)
GROUP BY s.song_name
ORDER BY s.song_name;
