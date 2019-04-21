use employees;

call HelloWorld();

drop procedure HelloWorld;

delimiter $$

create procedure HelloWorld()
begin
  select (@output := 'output');
  select concat(@output, ' -> ', 'Hello World!!!');
end$$

delimiter ;


select cast(body AS CHAR)
from mysql.proc;


#Set DEFINER (permissions)

create user shopuser@localhost identified by 'hello';
grant execute on procedure employees.HelloWorld to shopuser@localhost;

delimiter $$

create
  definer =shopuser@localhost procedure HelloWorld() #call as shopuser@localhost not as root
  sql security definer
begin
  select (@output := 'output');
  select concat(@output, ' -> ', 'Hello World!!!');
end$$

delimiter ;

SELECT CURRENT_USER;

# Set PARAMS

delimiter $$

create procedure ShowEmployees(in name varchar(255), in date DATE)
begin
  select *
  from employees
  where employees.employees.first_name like name
    and employees.employees.birth_date >= date;
end $$

delimiter ;


call ShowEmployees('%ill%', STR_TO_DATE('12/12/1964', '%m/%d/%Y'));