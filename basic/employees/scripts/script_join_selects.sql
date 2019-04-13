#INNER JOIN = JOIN

SELECT *
FROM employees
       INNER JOIN dept_manager
                  ON employees.emp_no = dept_manager.emp_no;


SELECT *
FROM employees
       INNER JOIN dept_manager
                  ON employees.emp_no = dept_manager.emp_no
       INNER JOIN departments
                  ON dept_manager.dept_no = departments.dept_no;


SELECT *
FROM employees emp
       INNER JOIN dept_manager as dm
                  ON emp.emp_no = dm.emp_no
       INNER JOIN departments as ds
                  ON dm.dept_no = ds.dept_no;


SELECT emp.emp_no, emp.first_name, emp.last_name, ds.dept_name
FROM employees emp
       INNER JOIN dept_manager as dm
                  ON emp.emp_no = dm.emp_no
       INNER JOIN departments as ds
                  ON dm.dept_no = ds.dept_no
ORDER BY emp.last_name;

SELECT emp.emp_no, emp.first_name, emp.last_name, ds.dept_name
FROM employees emp
       JOIN dept_manager as dm
            ON emp.emp_no = dm.emp_no
       JOIN departments as ds
            ON dm.dept_no = ds.dept_no
WHERE dm.to_date = '9999-01-01'
  AND emp.gender = 'M'
ORDER BY emp.last_name;


#-----------
SELECT ds.dept_name, emp.first_name, emp.last_name, titles.title
FROM employees as emp
       JOIN
     dept_emp as de ON emp.emp_no = de.emp_no
       JOIN
     departments as ds ON de.dept_no = ds.dept_no
       JOIN
     titles ON titles.emp_no = emp.emp_no
WHERE titles.to_date = '9999-01-01'
  AND de.to_date = '9999-01-01'
ORDER BY ds.dept_name, emp.last_name;


#NATURAL JOIN - when name of columns  within JOIN are equal (ON isn't needed)

SELECT ds.dept_name, emp.first_name, emp.last_name, titles.title
FROM employees as emp
       NATURAL JOIN
     dept_emp as de
       NATURAL JOIN
     departments as ds
       NATURAL JOIN
     titles
WHERE titles.to_date = '9999-01-01'
  AND de.to_date = '9999-01-01'
ORDER BY ds.dept_name, emp.last_name;


#Equi JOIN
SELECT ds.dept_name, emp.first_name, emp.last_name, titles.title
FROM employees as emp,
     dept_emp as de,
     departments as ds,
     titles
WHERE titles.to_date = '9999-01-01'
  AND de.to_date = '9999-01-01'
  AND emp.emp_no = de.emp_no
  AND de.dept_no = ds.dept_no
  AND titles.emp_no = emp.emp_no
ORDER BY ds.dept_name, emp.last_name;


#UNION JOIN
SELECT emp.first_name, emp.last_name, titles.title as dep_n, 'DDDD' as emp_type
FROM employees as emp
       JOIN
     titles ON titles.emp_no = emp.emp_no
WHERE titles.to_date = '9999-01-01'
  AND titles.title LIKE '%_Engineer'
UNION
SELECT emp.first_name, emp.last_name, dm.from_date as dep_n, 'AAAA' as emp_type
FROM employees emp
       INNER JOIN dept_manager as dm
                  ON emp.emp_no = dm.emp_no
       INNER JOIN departments as ds
                  ON dm.dept_no = ds.dept_no
ORDER BY emp_type;

SELECT CURRENT_USER(), VERSION(), USER();

#OUTER JOIN

SELECT count(*)
from employees
where emp_no not in (select dept_manager.emp_no from dept_manager);

SELECT emp.first_name, emp.last_name, dm.dept_no
from employees as emp
       LEFT OUTER JOIN dept_manager as dm
                       ON emp.emp_no = dm.emp_no;

SELECT emp.first_name, emp.last_name, dm.dept_no
from employees as emp
       RIGHT OUTER JOIN dept_manager as dm
                        ON emp.emp_no = dm.emp_no;

#--------


select ts.emp_no
from titles as ts
where ts.to_date = '9999-01-01';


select count(*)
from employees as emp
where emp.emp_no not in (select ts.emp_no from titles as ts where ts.to_date = '9999-01-01');

SELECT emp.emp_no, emp.last_name, emp.first_name, ts.title, ts.to_date, ts.emp_no, ts.from_date
FROM employees as emp
       #JOIN ON titles with ts.to_date = '9999-01-01'.suppose rest ts = null
       LEFT OUTER JOIN titles as ts ON emp.emp_no = ts.emp_no and ts.to_date = '9999-01-01'
WHERE ts.emp_no is null;

SELECT emp.emp_no, emp.last_name, emp.first_name, ts.title, ts.to_date, ts.emp_no
FROM employees as emp
       LEFT JOIN titles as ts on emp.emp_no = ts.emp_no and ts.to_date = '9999-01-01'
;
































