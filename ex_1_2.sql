SELECT * from employees;

-- 열에는 입사일이(hire_date), 직원번호에 1001번에 해당하는 직원의 입사일이 5년이 넘었는지 확인
DROP PROCEDURE if EXISTS emp_if;
DELIMITER $$
CREATE Procedure emp_if(emp_no_input INT)
BEGIN
    DECLARE hire_date_i DATE;
    DECLARE day_date INT;
    DECLARE message_a VARCHAR(100);

    SELECT hire_date into hire_date_i from employees where emp_no = emp_no_input;
    SET day_date = DATEDIFF(CURRENT_DATE(), hire_date_i);

    IF emp_no_input = 10001 then
        SET message_a=CONCAT("입사한지", day_date,"일 이 지났습니다. 축하합니다.");
    ELSE
        SET message_a=CONCAT("입사한지", day_date, "일 밖에 안되었네요, 화이팅");
    END IF;

    SELECT message_a AS '결과 메시지';
END $$
DELIMITER ;

call emp_if(10001);



--2) case when 구문 이용해서 학점 프로그램 90점이상은 A, 80 B 70 C, 60 D, 미만은 F 
-- 결과값:  취득점수 77    학점 C
DROP PROCEDURE IF EXISTS doit_case;
DELIMITER $$
CREATE PROCEDURE doit_case(sum_a_input INT)
BEGIN
    DECLARE result_a CHAR(1);

    CASE 
        WHEN sum_a_input >= 90 THEN SET result_a = 'A';
        WHEN sum_a_input >= 80 THEN SET result_a = 'B';
        WHEN sum_a_input >= 70 THEN SET result_a = 'C';
        WHEN sum_a_input >= 60 THEN SET result_a = 'D';
        ELSE SET result_a = 'F';
    END CASE; 

    SELECT sum_a_input as '취득점수', result_a as "학점";    
END $$
DELIMITER ;
    
call doit_case(77);