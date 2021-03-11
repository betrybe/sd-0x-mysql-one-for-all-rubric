DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN musician_name VARCHAR(100)) BEGIN
SELECT
m.musician_name AS artista,
a.album_name AS album
FROM Musicians AS m
INNER JOIN Albums AS a
ON m.musician_id = a.musician_id
WHERE m.musician_name LIKE musician_name;
END $$
DELIMITER ;
