--반목분
DROP PROCEDURE if EXISTS whileProc
DELIMITER $$
CREATE Procedure whileProc()
BEGIN
-- 변수 선언(i, tot)
    DECLARE i int;
    DECLARE tot int;

    set i = 1;
    set tot = 0;
    WHILE(i<=100) DO
        set tot = tot + i;
        set i = i+1;
    end WHILE;

    SELECT tot;

end$$
DELIMITER ;
call whileProc();


DELIMITER $$
CREATE PROCEDURE errorProc()
BEGIN

    DECLARE CONTINUE HANDLER for SQLEXCEPTION SELECT '테이블 없음';
    SELECT * from djdkdks;
END $$

DELIMITER ;
call errorProc();

-- 동적 sql
--sql문을 미리 만들어 놓고 나중에 실행

SELECT * from usertbl WHERE `userID` = 'EJW';

CREATE Table myTable (
    id int AUTO_INCREMENT PRIMARY KEY,
    mDate DATETIME
);

SELECT * from mytable;

SET @curDATE = CURRENT_DATE();
SELECT @curDATE;

-- ? 플레이스 홀더
PREPARE myQuery FROM 'insert into myTable values(null, ?)';
EXECUTE myQuery USING @curDATE;

DEALLOCATE PREPARE myQuery;