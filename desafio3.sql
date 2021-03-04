CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.user_name AS usuario,
s.song_name AS nome
FROM User AS u
INNER JOIN Songs AS s
INNER JOIN Reproduction_History AS rh
ON u.user_id = rh.user_id
AND s.song_id = rh.song_id
ORDER BY u.user_name, s.song_name;
