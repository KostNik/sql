CREATE or replace view emp_view as
Select emp.first_name, emp.last_name
from employees as emp;


SELECT * from emp_view;


