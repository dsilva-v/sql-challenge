--Table source files:

--departments.csv
--titles.csv
--employees.csv
--dept_emp.csv
--dept_manager.csv
--salaries.csv

--=======================

--Create 'departments' table; set dept_no as PRIMARY KEY

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

--View
SELECT * FROM departments;

--=======================

-- Create titles table; set title_id as PRIMARY KEY

CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY(title_id)
);

--View
SELECT * FROM titles;

--=======================


--Create 'employees' table; set emp_no as PRIMARY KEY

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

--View
SELECT * FROM employees;

--Add FOREIGN KEY matching emp_title_id to title_id in titles.
ALTER TABLE employees
ADD FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);


--=======================

-- Create 'dept_emp' table; set emp_no and dept_no as PRIMARY KEYS.
-- Make compositive key since some employees were associated with multiple departments.

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL, 
	PRIMARY KEY (emp_no, dept_no)
);

--View 
SELECT * FROM dept_emp

--Add FOREIGN KEYS to emp_no from employees and dept_no from departments.
ALTER TABLE dept_emp
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_emp
ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
	
--=======================

-- Create dept_manager table; set dept_no and emp_no as composite PRIMARY KEY.

CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no)
);

--View
SELECT * FROM dept_manager

--Add FOREIGN KEYS to emp_no from employees and dept_no from departments.
ALTER TABLE dept_manager
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_manager
ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

--=======================

--Create salaries table then add serial key.

CREATE TABLE salaries (
	emp_no INT NOT NULL,
 	salary INT NOT NULL
);

--View
SELECT * FROM salaries;

ALTER TABLE salaries
ADD COLUMN salaries_id SERIAL PRIMARY KEY;

--Add FOREIGN KEY to emp_no from employees.
ALTER TABLE salaries 
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);