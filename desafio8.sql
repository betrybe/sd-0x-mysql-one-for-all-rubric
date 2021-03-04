DELIMITER $$
DROP TRIGGER IF EXISTS trigger_usuario_delete;
CREATE TRIGGER trigger_usuario_delete BEFORE DELETE
ON User
FOR EACH ROW
BEGIN
DELETE FROM Reproduction_History WHERE user_id = OLD.user_id;
DELETE FROM Following_Musicians WHERE user_id = OLD.user_id;
END;
$$ DELIMITER ;
