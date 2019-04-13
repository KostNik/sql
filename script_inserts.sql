insert into departments
values ('d999', 'Some_dep name');

insert into departments (dept_no, dept_name)
values ('d998', 'Some_dep name 2');

insert into departments (dept_no)
values ('d997');


select *
from departments;

INSERT into employees
SELECT max(employees.emp_no) + 1, '2000-12-3', 'VBill', 'Nonj', 'M', '2018-9-8'
from employees;


# ASSIGN
INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES (700000, '2000-12-3', 'Mill_2', 'Mill 2', 'F', '2018-9-8');

INSERT INTO titles (emp_no, title, from_date, to_date)
VALUES (700000, 'Title_mv', '2000-12-3', '2001-12-3');

INSERT into dept_emp values (700000, 'd998', '2018-7-8', '2060-9-8');

INSERT into salaries values (700000, 65461, '2018-9-8', '2060-9-8');
# ASSIGN_end

select *
from salaries
order by emp_no desc;

select *
from dept_emp;