SELECT `Percentage`.VALUES > 5 as '5+', `Percentage`.VALUES < 5 as '5-'
from countrylanguage



--1) 
SELECT `Percentage`,
    CASE 
        WHEN `Percentage` >= 5 THEN '5+'  
        ELSE  '5-'
    END as 'Grade'
from countrylanguage



-- 2)
SELECT `LifeExpectancy`,
    CASE 
        WHEN `LifeExpectancy` >= 100 THEN 'Wow'
        WHEN `LifeExpectancy` >= 80 THEN 'Best'
        WHEN `LifeExpectancy` >= 70 THEN 'Good'
        WHEN `LifeExpectancy` >= 60 THEN 'Normal'
        ELSE  'Sad'
    END as '평가'
from country;


--3)
DROP PROCEDURE if EXISTS doit_sum;
DELIMITER $$
CREATE PROCEDURE doit_sum(IN startNum INT, IN endNum INT)
BEGIN
    DECLARE i INT;
    DECLARE tot INT DEFAULT 0;

    -- 시작값을 변수 i에 할당
    SET i = startNum;

    -- i가 끝값(endNum)보다 작거나 같을 때까지 반복
    WHILE i <= endNum DO
        SET tot = tot + i; -- 합계 누적
        SET i = i + 1;     -- 1씩 증가
    END WHILE;

    -- 최종 결과 출력
    SELECT startNum, endNum, tot AS '합계';
END $$

DELIMITER ;
call doit_sum(0, 10)



--1) 풀이
SELECT * from countrylanguage;

SELECT `CountryCode`, `Language`, `Percentage`, IF(`Percentage`>=5, '5+','5-') as '점수'
from countrylanguage;

--2) 풀이
--기대수명 열이 100보다 크면 'Wow'
--기대수명 열이 80보다 크면 'Best'
--기대수명 열이 70보다 크면 'Good'
--기대수명 열이 60보다 크면 'Normal'
--기대수명 열이 60보다 작으면 'Sad'

SELECT `Name`, `LifeExpectancy`,
CASE 
    WHEN `LifeExpectancy` >=100 THEN 'Wow'
    WHEN `LifeExpectancy` >=80 THEN 'Best'
    WHEN `LifeExpectancy` >=70 THEN 'Good'
    WHEN `LifeExpectancy` >=60 THEN 'Normal'  
    ELSE 'Sad'
END
from country;



--3) 풀이

DELIMITER $$
CREATE PROCEDURE doit_sum(startNum  int, endNum int)
BEGIN
    declare tot int;

    set tot = startNum;

    mywhile:
        while (startNum<=endNum) DO
            set tot = tot + startNum;
            set startNum=startNum+1;
            IF(startNum>endNum) THEN
                LEAVE mywhile;
            end IF;
    end while;
    SELECT tot;
END$$

DELIMITER ;

call doit_sum(0,10)

--4)
DROP Procedure IF EXISTS doit_sum

--5) 풀이
-- view create view 뷰이름
--조인
-- SELECT * FROM 테이블 INNER JOIN 테이블 ON

CREATE VIEW v_country_language as
SELECT c.`Name`, c.`Region`, b.`Language`, b.`IsOfficial`, b.`Percentage`
from country as c 
INNER JOIN countrylanguage as b on c.`Code` = b.`CountryCode`;

SELECT * FROM v_country_language;

--6)
DROP View IF EXISTS v_country_language