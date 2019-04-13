set autocommit = 0;
set autocommit = 1;



rollback;

INSERT INTO salaries (emp_no, salary, from_date, to_date)
values ('', '', '', '');


begin;

select (@salary_ss := salary)
from salaries
where emp_no = 10009
  and to_date = '9999-01-01' FOR
UPDATE; #make Select in transaction, thus it is waiting for other transaction ends

UPDATE salaries
set salary = (@salary_ss + 20)
where emp_no = 10009
  and to_date = '9999-01-01';

commit;

select *
from salaries
where emp_no = 10009
  and to_date like '9999%';

select *
from salaries;