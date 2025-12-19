--3) sqldb에서 buytbl에 구매액이 1500원이 이상인 고객은 최우수고객
--1000원은 우수   1원 이상은 일반  없는사람은 유령고객
SELECT * from buytbl;
drop Procedure IF EXISTS doit_buy;
DELIMITER $$
CREATE Procedure doit_buy(sum_a_input INT)
BEGIN
    DECLARE user_a VARCHAR(20);

    CASE 
        WHEN sum_a_input > 1500 THEN SET user_a = "최우수고객";
        WHEN sum_a_input > 1000 THEN SET user_a = "우수고객";
        WHEN sum_a_input > 1 THEN SET user_a = "일반고객";
        ELSE SET user_a = "유령고객";
    END CASE;

    SELECT sum_a_input as "합계금액", user_a as "등급";
END $$
DELIMITER ;
call doit_buy(NULL);
