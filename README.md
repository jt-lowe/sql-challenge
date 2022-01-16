# sql-challenge

## Modelling/Engineering
First step was creating the ERD on http://www.quickdatabasediagrams.com/

The relationships that I noticed were:
 - "titles.title_id" leading into "employees.emp_title_id"
 - "employees.emp_no" leading into "dept_manager.emp_no", "salaries.emp_no" and "dept_emp.emp_no"
 - "departments.dept_no" leading into "dept_manager.dept_no" and "dept_emp.dept_no"

In pgAdmin 4, I created a new database to hold the schema, and the order in which I created the tables and imported the corresponding csv's was:
 1. titles
 2. employees
 3. salaries
 4. departments
 5. dept_manager
 6. dept_emp

Ensuring that the sliders for "Header" was **ON** and the "Delimiter" chosen was ",".

## Data Analysis
1. Select the columns:
- 'emp_no'
- 'last_name'
- 'first_name'
- 'sex'
from the 'employees' table, and 'salary' from the 'salaries' table. Then create an INNER JOIN on 'employees' and 'salaries' tables ON 'emp_no' from both tables.

2. Select the columns:
- 'first_name'
- 'last_name'
- 'hire_date'
from the 'employees' table, and add the WHERE parameter to check that the year is greather than 1986, we do this by using EXCTRACT (YEAR FROM hire_date).

3. Select the columns:
- 'dept_no' & 'emp_no' from 'dept_manager'
- 'dept_name' from 'departments'
AND
- 'last_name' & 'first_name' from 'employees'
and perform an INNER JOIN on 'dept_manager' and 'departments' tables ON 'dept_no' from both tables then perform another INNER JOIN on 'dept_manager' and 'employees' ON 'emp_no' from both tables.

4. Select the columns:
- 'emp_no'
- 'first_name'
- 'last_name'
from the 'employees' table and 'dept_name' from the 'departments' table. Perform an INNER JOIN on the 'departments' and 'dept_emp' tables ON 'dept_no' from both tables. Then perform another INNER JOIN on 'dept_emp' and 'employees' tables ON 'emp_no' from both tables.

5. Select the columns:
- 'last_name'
- 'first_name'
- 'sex'
from the 'employees' tables then add a WHERE parameter to check that first_name='Hercules' AND last_name LIKE 'B%' (the LIKE parameter is used here as well as the % wildcard parameter to check for all last names starting with the letter 'B').

6. Select the columns:
- 'emp_no'
- 'first_name'
- 'last_name'
from the 'employees' table and 'dept_name' from the 'departments' table. Perform an INNER JOIN on the 'departments' and 'dept_emp' tables ON 'dept_no' from both tables. Then add a conditional WHERE parameter to check that dept_name = 'Sales'.

7. Select the columns:
- 'emp_no'
- 'first_name'
- 'last_name'
from the 'employees' table and 'dept_name' from the 'departments' table. Perform an INNER JOIN on the 'departments' and 'dept_emp' tables ON 'dept_no' from both tables. Then add a conditional WHERE parameter to check that dept_name = 'Sales' OR dept_name = 'Development'.

8. Select the 'last_name' column from 'employees', then use the COUNT function on the same column and name it something appropriate (in this case 'count_of_last"). Use the GROUP BY function to group by the laat_name column, then use the ORDER BY function and order the column by the 'count_of_last' parameter created, ensuring to define the DESC order.


## Bonus
We read in 'salaries','titles' and 'employees' data from postgres database into Jupyter Notebook to perform analysis. The three tables are selected as the further analysis required by the assignment only requires info from these three tables.

To make creation of the bar plot easier, the three data tables were merged, beginning with employees and salaries (merged on 'emp_no'), followed by this new dataframe with titles (merged on 'emp_title_id' and 'title_id' from the respective tables).

The table was simplified, dropping any columns that were no longer needed, leaving us with 'emp_no','title' and 'salary'.

A histogram was created using the column 'salary' to show frequency of occurences of salaries between a certain range (~10,000).

For the bar chart, we first needed to group the data by 'title' and perform the df.mean() function, to find the averages. The resulting information was plotted into the bar chart, using titles as the xticks and the average salaries as the height of the bars.


### Analysis

The range shown by the histogram that the majority of employees earn within the 40,000 to 50,000 range. This is unlikely due to the differing levels of employees within the DataFrame (i.e. ranging from "Staff" to "Managers" we'd likely expect a bit more of a spread)

The bar chart describing average Salary shows that Managers, Senior/Regular/Assistant Engineers and Technique Leaders, on average, are making less than a regular Staff member, which is also highly unlikely.