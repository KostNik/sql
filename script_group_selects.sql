#GROUP BY

select birth_date, count(*)
from employees
group by birth_date;

select salary, count(*) as s_c
from salaries
group by salary
order by s_c desc;

#AGGREGATE
##COUNT
##SUM
select date_format(from_date, '%Y') as year, sum(salary)
from salaries
group by year;
##MAX
select date_format(from_date, '%Y') as year, max(salary)
from salaries
group by year;
##MIN
select date_format(from_date, '%Y') as year, min(salary), max(salary), sum(salary), format(avg(salary), 1)
from salaries
group by year;
##AVG
select year, sum, average, sum/all_s as average_calc
from (
       select date_format(from_date, '%Y') as year,
              sum(salary)                  as sum,
              format(avg(salary), 1)       as average,
              count(*)                     as all_s
       from salaries
       group by year) as subselect;

#HAVING
select first_name, count(*) as em_c
from employees
where employees.employees.birth_date < '1993-06-25'
group by first_name
having em_c > 200
order by em_c;