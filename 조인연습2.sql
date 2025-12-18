-- SELECT * FROM stdtbl
-- UNION
-- SELECT * from clubtbl;

SELECT * FROM stdtbl
UNION ALL
SELECT * from clubtbl;

-- 서브 쿼리에서 not in
-- in ~에 포함
-- usertbl에서 mobile이 null인 경우

SELECT * from usertbl;
SELECT * from usertbl WHERE mobile1 IS NULL;

SELECT *
from usertbl
WHERE mobile1
NOT IN 010000000 
GROUP BY mobile1;

-- 서브(sub)쿼리
-- 작은 쿼리를 먼저 짜기

SELECT name FROM usertbl WHERE mobile1 is null;

-- in(성시경, 윤종신)
-- not in(성시경, 윤종신)

--바깥쪽쿼리
SELECT name, CONCAT(mobile1, mobile2)
FROM usertbl 
WHERE name not in (SELECT name FROM usertbl WHERE mobile1 is null);

SELECT name from usertbl WHERE mobile1 is nULL

SELECT name, CONCAT(mobile1, mobile2)
from usertbl
WHERE name in (SELECT name from usertbl WHERE mobile1 is NULL);

SELECT name, CONCAT(mobile1, mobile2)
from usertbl
WHERE name in (SELECT name from usertbl WHERE mobile1 is NOT NULL);

SELECT name, CONCAT(mobile1, mobile2)
from usertbl
WHERE name not in (SELECT name from usertbl WHERE mobile1 is NULL);

SELECT name, CONCAT(mobile1, mobile2)
from usertbl
WHERE name not in (SELECT name from usertbl WHERE mobile1 is not NULL);



