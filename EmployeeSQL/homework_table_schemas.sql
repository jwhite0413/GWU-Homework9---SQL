--#create tables
--departments
CREATE TABLE public.departments
(
    dept_no character varying(50),
    dept_name character varying(50),
    PRIMARY KEY (dept_no)
);



CREATE TABLE public.dept_emp
(
    emp_no bigint,
    dept_no character varying(50),
    PRIMARY KEY (emp_no)
);

CREATE TABLE public.dept_manager
(
    dept_no VARCHAR (50),
    emp_no bigint,
    PRIMARY KEY (dept_no)
);


CREATE TABLE public.employees
(
    emp_no bigint,
    emp_title_id character varying(20),
    birth_date date NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    sex character varying(10),
    hire_date date NOT NULL,
    PRIMARY KEY (emp_no)
);

Drop table salaries
CREATE TABLE public.salaries
(
    emp_no bigint,
    salary bigint,
    PRIMARY KEY (emp_no)
);

CREATE TABLE public.titles
(
    title_id character varying (20),
    title character varying (50),
    PRIMARY KEY (title_id)
);


--join departments and dept_emp with inner join using dept _no 

Drop table test_merge 
Create table test_merge as( 
SELECT departments.dept_no, departments.dept_name, dept_emp.emp_no
FROM dept_emp
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no)


drop table data_merge_one
create table data_merge_one as(
Select test_merge.dept_no, test_merge.dept_name, test_merge.emp_no, employees.emp_title_id, employees.birth_date, employees.first_name, employees.last_name, employees.sex,employees.hire_date, salaries.salary, titles.title_id, titles.title
From test_merge
Inner Join employees on
employees.emp_no=test_merge.emp_no
inner join salaries on 
salaries.emp_no = test_merge.emp_no 
inner join titles on 
titles.title_id = employees.emp_title_id)
