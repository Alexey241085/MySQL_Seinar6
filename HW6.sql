-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS secunds;
DELIMITER // 
CREATE FUNCTION secunds (num INT)
RETURNS VARCHAR(300) deterministic
BEGIN 
	DECLARE result VARCHAR(500);
    DECLARE i INT DEFAULT num;
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;
    
		SET days = FLOOR(i/86400);
        SET hours = FLOOR((i - 86400*days)/3600);
        SET minutes = FLOOR((i - 86400*days - hours*3600)/60);
        SET seconds = FLOOR(i - 86400*days - hours*3600 - minutes*60);

    SET result = CONCAT(days, " ", "days"," ", hours, " ", "hours"," ", minutes, " ", "minutes"," ", seconds, " ", "seconds", " ");

RETURN result;
END //
DELIMITER ;

SELECT secunds(61);



DROP FUNCTION IF EXISTS www;
DELIMITER //
CREATE FUNCTION www(num INT)
RETURNS VARCHAR(300) deterministic
BEGIN
	DECLARE result VARCHAR(300);
	DECLARE i INT DEFAULT 0;
	SET result = 'результат ';
IF (num > 0) THEN
	WHILE (num > i) DO
		SET i = i + 2;
        SET result = CONCAT(result, " ", i);
	END WHILE;
		return result;
ELSE return 'Введите целое положительное число';
	END IF;
END //
DELIMITER ;
    
    SELECT www(10);
    
    
    
