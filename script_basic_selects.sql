show tables;

SELECT 'count current_dept_emp' as 'INFO';
SELECT count(*)
from current_dept_emp;
SELECT 'count departments' as 'INFO';
SELECT count(*)
from departments;
SELECT count(*)
from dept_emp;
SELECT count(*)
from dept_manager;
SELECT count(*)
from employees;
SELECT count(*)
from salaries;
SELECT count(*)
from titles;


SELECT emp_no, count(*) as emp_count
FROM employees
where emp_no > 1
group by emp_no
having emp_count > 0
ORDER BY emp_no
LIMIT 5, 10;

#ALIAS
select first_name as 'FIRST NAME', last_name as 'LAST NAME'
from employees;

#CONCAT
select first_name as 'FIRST NAME', last_name as 'LAST NAME', concat(last_name, ' ', first_name) as name
from employees;

#Arifmetics operators

#Multiply val*2
#Divide   val/2
#Integer division val DIV 2
#Modulo val%3
#Add val+3
#Substract val-3

select salary,
       salary * .01         as weekly,
       salary * .01 * 4     as mounthly,
       salary * .01 * 52    as yearly,
       salary + 200 * .01   as multiple_first,
       (salary + 200) * .01 as add_first,
       salary * .01 / 7     as daily,
       salary DIV 3         as div_op,
       salary % 3           as mod_op
from salaries;

#Datatypes

#Numeric
#Date and Time
#String data types
#Spatial (map navigation)
#JSON

#Date formatting
#default : YYYY-MM-DD HH:MM:SS
#DATE_FORMAT("2018-05-15","%M %d %Y") -> "May 15 2018"

SELECT DATE_FORMAT("2018-05-15", "%M %d %Y");

select from_date as                        original,
       DATE_FORMAT(from_date, "%M %d, %Y") v1,
       DATE_FORMAT(from_date, "%m %D, %Y") v2
from salaries;

#LEFT and RIGHT
select right('abc', 1);
select left('abc', 1);

select first_name                                      as 'FIRST NAME',
       last_name                                       as 'LAST NAME',
       concat(LEFT(first_name, 1), LEFT(last_name, 1)) as Initials
from employees;


#Operators
#=
#<=> Null safe Equal Operator, like Equal, but returns 1, if both are NULL
#<> or !=
#>=
#<
#<=

#LIKE
#NOT LIKE
#BETWEEN
#NOT BETWEEN

Select count(*)
from employees
where first_name NOT IN ('Elvis', 'Sumant')
   OR last_name IN ('Maliniak', '%tom%', '_d%');

#NULL
select *
from titles
where to_date is NULL;

select *
from information_schema.PLUGINS
where PLUGIN_LIBRARY IS NOT NULL;


#GREATER THAN
#LESS THAN

select *
from salaries
where salary > 70000;
select count(*)
from salaries
where salary < 70000
  and from_date > '1989-06-25';
select *
from employees
where first_name > 'saaa'
order by first_name;


#LIKE
#IS NOT LIKE
select *
from employees
where first_name LIKE 'd_e%'
  and last_name not like '%a';

#BETWEEN <= x >=
#NOT BETWEEN < >
select count(*)
from salaries
where salary between 70000 and 90000;
select count(*)
from salaries
where salary not between 70000 and 90000;

select count(*)
from salaries
where salary < 70000
   or salary > 90000;


#ORDER BY x ASC DESC
select *
from salaries
order by from_date, salary desc;


#LIMIT offset, count
select *
from salaries
order by from_date, salary desc
LIMIT 10;

select *
from salaries
order by from_date, salary desc
LIMIT 5, 10;

#DISTINCT
select distinct first_name
from employees
order by first_name;
select count(distinct first_name)
from employees
order by first_name;

#SUBSELECT IN
select *
from employees
where first_name in (select distinct first_name from employees where first_name like '%wy%');


#GROUP










