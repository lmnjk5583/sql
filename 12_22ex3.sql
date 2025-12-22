-- create table tbl_trigger_1(
--     col_1 int,
--     col_2 VARCHAR(50)
-- );

-- create Table tbl_trigger_2(
--     col_1 int,
--     col_2 VARCHAR(50)
-- );

INSERT into tbl_trigger_1 VALUES (1, '데이터 1 입력');
DELETE from tbl_trigger_1 where col_1 = 1;
SELECT * FROM tbl_trigger_1;
SELECT * from tbl_trigger_2;

DELIMITER $$
create Trigger dot_update_trigger
AFTER UPDATE
on tbl_trigger_1 for EACH ROW

BEGIN
    INSERT into tbl_trigger_2 VALUES (OLD.col_1, OLD.col_2);

END $$
DELIMITER ;

set sql_safe_updates=0;

UPDATE tbl_trigger_1 SET col_1=1, col_2='1을 2를 수정';