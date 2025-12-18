SELECT * from country;
SELECT * FROM city;
SELECT * FROM countrylanguage;

-- 1)
SELECT *
FROM country
INNER JOIN city
on country.`Code` = city.`CountryCode`
WHERE country.`Name` = "United States";


--2)
SELECT country.`Name`, country.`GNP`, country.`GNPOld`, city.`Population`
FROM city
INNER JOIN country
on city.`CountryCode` = country.`Code`
ORDER BY city.`Population` DESC LIMIT 10;

--3)
SELECT country.`Name`, country.`Code`, countrylanguage.`Language`
from countrylanguage
LEFT OUTER JOIN country
on countrylanguage.`CountryCode` = country.`Code`
WHERE countrylanguage.`Language` = "English";

SELECT country.`Name`, country.`Code`, countrylanguage.`Language`
from countrylanguage
INNER JOIN country
on countrylanguage.`CountryCode` = country.`Code`
WHERE countrylanguage.`Language` = "English";


SELECT * from countrylanguage;
SELECT cl.`CountryCode`
FROM countrylanguage cl
WHERE cl.`Language` = "english";

SELECT c.`Name`, c.`Code`
from country c
WHERE c.`Code` in (SELECT c.`CountryCode`
FROM countrylanguage c
WHERE c.`Language` = "english");

SELECT * 
from country c INNER join city d
on c.`Code` = d.`CountryCode`
WHERE c.`Name` = 'United States';


--서브쿼리 연습
-- city테이블에서 인구가 가장 많은 도시 상위 10개

SELECT `Name`, `CountryCode`, `District`, `Population`
from city
ORDER BY `Population` desc LIMIT 10;

-- country테이블에서 해당 도시 국가 이름과 국가 총인구, gnp,수명 등의 정보를 조회하는쿼리
-- select * from 테이블 자리에
(SELECT * from city
ORDER BY `Population` desc LIMIT 10)

-- select * from 테이블 inner join on 코드가 같게

SELECT *
from  (SELECT `Name`, `CountryCode`, `District`, `Population`
from city
ORDER BY `Population` desc LIMIT 10) as a
INNER join country as b on a.CountryCode = b.`Code`
