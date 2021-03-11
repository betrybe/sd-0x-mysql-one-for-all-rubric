CREATE VIEW top_2_hits_do_momento AS
SELECT
s.song_name AS cancao,
COUNT(rh.song_id) AS reproducoes
FROM Songs AS s
INNER JOIN Reproduction_History AS rh
ON s.song_id = rh.song_id
GROUP BY rh.song_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;
