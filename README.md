# sql-challenge

First step was creating the ERD on http://www.quickdatabasediagrams.com/

The relationships that I noticed were:
 - "titles.title_id" leading into "employees.emp_title_id"
 - "employees.emp_no" leading into "dept_manager.emp_no", "salaries.emp_no" and "dept_emp.emp_no"
 - "departments.dept_no" leading into "dept_manager.dept_no" and "dept_emp.dept_no"

In pgAdmin, I created a new database to hold the schema, and the order in which I created the tables and imported the corresponding csv's was:
 1. titles
 2. employees
 3. salaries
 4. departments
 5. dept_manager
 6. dept_emp

Ensuring that the sliders for header was on and the delimiter chosen was ",".