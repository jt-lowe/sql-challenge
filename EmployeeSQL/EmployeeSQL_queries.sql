--EmployeeSQL_queries

--DATA ANALYSIS TASK #1
SELECT employees.emp_no, 
		employees.last_name, 
		employees.first_name, 
		employees.sex, 
		salaries.salary 
FROM employees
	INNER JOIN salaries 
		ON employees.emp_no = salaries.emp_no
;

--DATA ANALYSIS TASK #2
SELECT first_name,
		last_name,
		hire_date
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date) >1986
;

--DATA ANALYSIS TASK #3
SELECT dept_manager.dept_no,
		departments.dept_name,
		dept_manager.emp_no,
		employees.last_name,
		employees.first_name
FROM dept_manager 
	INNER JOIN departments
		ON dept_manager.dept_no = departments.dept_no
	INNER JOIN employees
		ON dept_manager.emp_no =employees.emp_no
;

--DATA ANALYSIS TASK #4
SELECT employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
INNER JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
	ON departments.dept_no = dept_emp.dept_no
;

--DATA ANALYSIS TASK #5
SELECT first_name,
		last_name
		sex
FROM employees
	WHERE first_name='Hercules'
		AND last_name LIKE 'B%'
;

--DATA ANALYSIS TASK #6
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
	INNER JOIN dept_emp
		ON employees.emp_no = dept_emp.emp_no
	INNER JOIN departments
		ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
;

--DATA ANALYSIS TASK #7
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
	INNER JOIN dept_emp
		ON employees.emp_no = dept_emp.emp_no
	INNER JOIN departments
		ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
	OR departments.dept_name = 'Development'
;

--DATA ANALYSIS TASK #8
SELECT last_name, COUNT(last_name) AS count_of_last
FROM employees
GROUP BY last_name
ORDER BY count_of_last DESC
;