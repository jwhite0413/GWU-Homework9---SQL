
--List the following details of each employee: employee number, last name, first name, sex, and salary.

select data_merge_one.emp_no, data_merge_one.last_name, data_merge_one.first_name, data_merge_one.sex, data_merge_one.salary
from data_merge_one

-- select * from data_merge_one
-- List first name, last name, and hire date for employees who were hired in 1986.
select data_merge_one.first_name, data_merge_one.last_name, data_merge_one.hire_date
from data_merge_one 
where hire_date ='1986-01-01 00:00:00' 
       and hire_date < '1987-01-01 00:00:00'

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
--group by manager of each department 

-- 24 managers and departments, need to isolate those 



select data_merge_one.dept_no, data_merge_one.dept_name, data_merge_one.emp_no, data_merge_one.last_name, data_merge_one.first_name
from data_merge_one
inner join dept_manager on
dept_manager.emp_no = data_merge_one.emp_no
order by dept_name
 


-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select  data_merge_one.dept_name, data_merge_one.emp_no, data_merge_one.last_name, data_merge_one.first_name
from data_merge_one
order by dept_name
-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
-- create index data_merge_one 
-- on data_merge_one(last_name);

select data_merge_one.first_name, data_merge_one.last_name, data_merge_one.sex 
from data_merge_one

where first_name = 'Hercules'
	and last_name like 'B%'
	
-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select data_merge_one.dept_name, data_merge_one.emp_no, data_merge_one.last_name, data_merge_one.first_name
from data_merge_one

where dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select data_merge_one.dept_name, data_merge_one.emp_no, data_merge_one.last_name, data_merge_one.first_name
from data_merge_one

where dept_name in ('Sales','Development')

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*)
From data_merge_one 
Group by last_name
Order by Count(*) desc



