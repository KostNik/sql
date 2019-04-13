INSERT departments
values ('d996', 'dummy_name');

select *
from departments;

UPDATE departments
set dept_name='More convenient name _2'
where dept_no = 'd996';


select *
from departments;


UPDATE employees
set first_name='More _2',
    last_name = 'Georgi'
where first_name = 'Georgi'
  and last_name = 'Facello';


UPDATE salaries
set to_date = (NOW() + INTERVAL (rand() * 100) YEAR)
where to_date not like '9999-01-01'
LIMIT 10;


select *
from salaries
where to_date != '9999-01-01'
order by to_date DESC;

select rand()



