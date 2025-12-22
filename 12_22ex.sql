-- cursor 이용해 평균키를 구하기

DELIMITER $$
create procedure cursorProc()
begin
	declare userHeight int;
    declare cnt int default 0;
    declare totalHeight int default 0;
    declare endOfRow boolean default false;
    
    declare userCursor cursor for
		select height from userTBl;

	declare continue handler for not found set endOfRow = True;
    
    open userCursor;
    
    cursor_loop: Loop
		fetch userCursor into userHeight;
		
        if endOfRow then
			leave cursor_loop; -- break 
		end if;
		
        set cnt = cnt +1;
        set totalHeight = totalHeight + userHeight;
	end loop cursor_loop;
     
    select concat('고객 키의 평균 ==> ', (totalHeight / cnt ));
    
    close userCursor;
END $$

select * from userTbl;

DELIMITER ;

call cursorProc();