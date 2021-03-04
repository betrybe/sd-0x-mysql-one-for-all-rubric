DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(userID INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE history_total INT;
SELECT
COUNT(rh.user_id)
FROM Reproduction_History AS rh
INNER JOIN User AS u
ON u.user_id = rh.user_id
WHERE u.user_id LIKE userID
GROUP BY rh.user_id INTO history_total;
RETURN history_total;
END $$
DELIMITER ;
