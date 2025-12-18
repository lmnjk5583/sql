-- DROP PROCEDURE if EXISTS ifproc;


-- -- stored procedure틀

-- DELIMITER $$
-- CREATE Procedure doit_proc()
-- BEGIN
-- -- 변수 선언
--     DECLARE customer_cnt int;
--     DECLARE add_number int;

-- -- 초기값 설정
--     SET customer_cnt = 0;
--     set add_number = 100;

--     SET customer_cnt = (SELECT COUNT(*) FROM customer);

--     SELECT customer_cnt + add_number;
    
-- END $$
-- DELIMITER ;

-- call doit_proc()

-- show CREATE PROCEDURE doit_proc;

-- DROP Procedure if EXISTS ifproc;

-- DELIMITER $$
-- CREATE Procedure doit_proc()
-- BEGIN
--     DECLARE customer_cnt = int;
--     DECLARE add_number =  int;

--     SET customer_cnt = 0;
--     set add_number = 100;

--     SET customer_cnt = (SELECT COUNT(*) FROM customer);
    
--     SET customer_cnt + add_number;

-- END $$
-- DELIMITER ;

-- call doit_proc()


-- store_id가 1이면 변수 s_id_one에 1씩 더하고 store_id가 1이 아니면 변수 s_id_two에다가 1씩 더하고 마지막에 select로 결과를 반환

SELECT * FROM customer WHERE customer_id =1;
SELECT * FROM customer WHERE customer_id =2;
SELECT * FROM customer WHERE customer_id =4;
DELIMITER $$
CREATE Procedure doit_if(customer_id_input INT)
BEGIN
-- 변수 선언
    DECLARE store_id_i int;
    DECLARE s_id_one int;
    DECLARE s_id_two int;

-- 초기값 설정
    SET store_id_i = (SELECT store_id FROM customer WHERE customer_id = customer_id_input);

    IF store_id_i = 1 THEN
        SET s_id_one=1;
    ELSE
        SET s_id_two=2;

    end IF;

    SELECT store_id_i, s_id_one, s_id_two;
END $$

DELIMITER ;

call doit_if(4);