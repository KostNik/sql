#INNER JOIN

SELECT *
FROM employees
       INNER JOIN dept_manager
                  ON employees.emp_no = dept_manager.emp_no;


