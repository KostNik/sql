use employees;

delimiter $$


create procedure HelloWorld()
begin
  select (@output := 'output');
  select concat(@output,' -> ','Hello World!!!');
end$$


delimiter ;


call HelloWorld();

drop procedure HelloWorld;