SELECT * from usertbl, buytbl;

SELECT COUNT(*) FROM usertbl, buytbl WHERE usertbl.`userID` = buytbl.`userID`;

SELECT * FROM usertbl, buytbl WHERE usertbl.`userID` = buytbl.`userID`;

SELECT usertbl.name, buytbl.`prodName` from usertbl, buytbl WHERE usertbl.`userID` = buytbl.`userID`;

SELECT usertbl.name, buytbl.`prodName` from usertbl INNER JOIN buytbl ON usertbl.`userID` = buytbl.`userID`;

SELECT * FROM usertbl LEFT OUTER JOIN buytbl on usertbl.`userID` = buytbl.`userID`;

SELECT * FROM usertbl right OUTER JOIN buytbl on usertbl.`userID` = buytbl.`userID`;
SELECT `U`.`userID`, `U`.name, b.`prodName`, `U`.addr, CONCAT(`U`.mobile1, u.mobile2) 
FROM usertbl U 
left OUTER JOIN buytbl b 
on `U`.`userID` = b.`userID`
WHERE `U`.addr = '서울';


--use sqldb;

-- CREATE Table emptbl (
--     emp CHAR(3),
--     manager CHAR(3),
--     empTel CHAR(8) 
-- );

--INSERT INTO emptbl VALUES ('나사장', NULL, '0000');

-- SELECT * from emptbl;

--INSERT INTO emptbl VALUES ('김재무', '나사장', '2222');
-- INSERT INTO emptbl VALUES ('김부장', '김재무', '2222-1');
-- INSERT INTO emptbl VALUES ('이부장', '김재무', '2222-2');
-- INSERT INTO emptbl VALUES ('우대리', '이부장', '2222-2-1');
-- INSERT INTO emptbl VALUES ('지사원', '이부장', '2222-2-2');
-- INSERT INTO emptbl VALUES ('이영업', '나사장', '1111');
-- INSERT INTO emptbl VALUES ('한과장', '이영업', '1111-1');
-- INSERT INTO emptbl VALUES ('최정보', '나사장', '3333');
-- INSERT INTO emptbl VALUES ('윤차장', '최정보', '3333-1');
-- INSERT INTO emptbl VALUES ('이주임', '윤차장', '3333-1-1');

-- self join
--상관의 연락처

-- SELECT * FROM emptbl A INNER JOIN emptbl B on A.manager = B.emp;

--우대리의 직속 상관의 연락처
-- SELECT A.emp as '부하직원', B.emp as '직속상관', B.`empTel` as '직속상관연락처' 
-- FROM emptbl A INNER JOIN emptbl B on A.manager = B.emp
-- WHERE A.emp='우대리';

-- CREATE Table stdTbl(
--     stdName VARCHAR(10) NOT NULL PRIMARY KEY,
--     addr CHAR(4) NOT NULL
-- );

-- CREATE Table clubTbl(
--     clubName VARCHAR(10) NOT NULL PRIMARY KEY,
--     roomNo CHAR(4) NOT NULL
-- );

CREATE TABLE stdclubTbl (
    num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    stdName VARCHAR(10) NOT NULL,
    clubName VARCHAR(10) NOT NULL,
    Foreign Key (stdName) REFERENCES stdTbl(stdName),
    Foreign Key (clubName) REFERENCES clubTbl(clubName)
);

SELECT * from stdtbl;

SELECT * from clubtbl;

-- INSERT INTO stdtbl VALUES('김범수', '경남'),('성시경', '서울'),('조용필', '경기'),('은지원', '경북'),('바비킴', '서울');

INSERT INTO clubtbl VALUES('수영', '101호'),('바둑','102호'),('축구','103호'),('봉사','104호');

INSERT INTO stdclubtbl VALUES(NULL,'김범수', '바둑'),(NULL,'김범수', '축구'),(NULL, '조용필', '축구'),(null, '은지원', '축구'),(null, '은지원', '봉사'),(NULL, '바비킴', '봉사');

SELECT * from stdclubtbl;

--미션1

SELECT stdtbl.`stdName`, stdtbl.`addr`, clubtbl.`clubName`, clubtbl.`roomNo`
from stdtbl INNER JOIN stdclubtbl on stdtbl.`stdName` = stdclubtbl.`stdName`
            INNER JOIN clubtbl on clubtbl.`clubName` = stdclubtbl.`culbName`;

-- SELECT `S`.`stdName`, `S`.addr, `B`.`clubName`, `B`.`roomNo`
-- FROM stdtbl S 
-- inner JOIN stdclubtbl C on `S`.`stdName` = `B`.`stdName`
-- inner JOIN clubtbl B on `C`.`clubName` = `B`.`clubName`;

 SELECT stdtbl.`stdName`, stdtbl.`addr`, clubtbl.`clubName`, clubtbl.`roomNo` 
FROm stdtbl, clubtbl, stdclubtbl
WHERE stdtbl.t

--미션2

SELECT C.clubName, C.roomNo, S.stdName, S.addr 
FROM stdTBL S 
INNER JOIN stdclubTBL SC ON SC.stdName = S.stdName 
INNER JOIN clubTBL C ON SC.clubName = C.clubName 
ORDER BY C.clubName;


-- 미션3

SELECT *
FROM usertbl, buytbl
WHERE usertbl.`userID` = buytbl.`userID`

select usertbl.name, buytbl.`prodName`
FROM usertbl
LEFT OUTER JOIN buytbl
on usertbl.`userID` = buytbl.`userID`;


-- 구매내역이 없는 회원 조회
select usertbl.name, buytbl.`prodName`
FROM usertbl
LEFT OUTER JOIN buytbl
on usertbl.`userID` = buytbl.`userID`
WHERE buytbl.`prodName` is NULL;



-- 1) 동아리에 가입하지 않은 학생   - 성시경의 클럽 이름 null
SELECT *
from stdtbl
LEFT OUTER JOIN stdclubtbl
on stdtbl.`stdName` = stdclubtbl.`stdName`
where stdclubtbl.`clubName` is null;

--2) 동아리를 기준으로 가입된 학생 출력하되, 가입학생이 하나도 없는 동아리도 출력

SELECT stdtbl.`stdName`, stdtbl.addr, clubtbl.`clubName`, clubtbl.`roomNo`
from stdtbl
LEFT OUTER JOIN stdclubtbl on stdtbl.`stdName` = stdclubtbl.`stdName`
right outer JOIN clubtbl on clubtbl.`clubName` = stdclubtbl.`culbName`;


--3 ) union으로 합치기
SELECT *
from stdtbl
LEFT OUTER JOIN clubtbl
on stdtbl.`stdName` = stdclubtbl.`stdName`
UNION
SELECT stdtbl.`stdName`, stdtbl.addr, clubtbl.`clubName`, clubtbl.`roomNo`
from stdtbl
LEFT OUTER JOIN stdclubtbl on stdtbl.`stdName` = stdclubtbl.`stdName`
right outer JOIN clubtbl on clubtbl.`clubName` = stdclubtbl.`culbName`;