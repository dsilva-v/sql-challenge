-- Source files for all the tables (find them under Resources folder)
-- departments.csv
-- titles.csv
-- employees.csv
-- dept_emp.csv
-- dept_manager.csv and 
-- salaries.csv

----------------------------------------------
-- Create the Departments table with dept_no as it's Primary Key
CREATE TABLE departments( dept_no VARCHAR NOT NULL, 
dept_name VARCHAR NOT NULL,
 PRIMARY KEY (dept_no))
----------------------------------------------
-- CREATE THE TITLE TABLE WITH TITLE_ID AS IT'S PRIMARY KEY
CREATE TABLE titles(title_id VARCHAR NOT NULL, title VARCHAR NOT NULL, PRIMARY KEY (title_id)) 
-----------------------------------------------
-- CREATE THE EMPLOYEES TABLE WITH EMP_NO AS IT'S PRIMARY KEY
CREATE TABLE employees(emp_no INT NOT NULL, emp_title_id VARCHAR NOT NULL,birth_date DATE NOT NULL, first_name VARCHAR NOT NULL, last_name VARCHAR NOT NULL, sex VARCHAR(1) NOT NULL, hire_date DATE NOT NULL, PRIMARY KEY(emp_no))
------------------------------------------------
-- CREATE THE DEPT_EMP TABLE WITH EMP_NO , DEPT_NO AS ACOMPOSITE KEY AS FEW EMPLOYEES CAN BE BELONGING TO MUTLIPLE DEPARTMENTS
CREATE TABLE dept_emp(emp_no INT NOT NULL, dept_no VARCHAR NOT NULL, PRIMARY KEY (emp_no, dept_no))
-----------------------------------------------
-- CREATE THE DEPT_MANAGER TABLE WITH DEPT_NO AND EMP_NO AS COMPOSITE KEY
CREATE TABLE dept_manager(dept_no VARCHAR NOT NULL, emp_no INT NOT NULL, PRIMARY KEY(dept_no, emp_no))
------------------------------------------------
-- CREATE THE SALARIES TABLE 
CREATE TABLE salaries(emp_no INT NOT NULL, salary INT NOT NULL)
-------------------------------------------------

-- ALTER TABLE salaries
-- ADD COLUMN salaries_id SERIAL PRIMARY KEY;

-- ADDING FOREIGN KEYS FOR ALL THE NECESSARY TABLES
ALTER TABLE employees
ADD FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)

ALTER TABLE dept_manager
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no)

ALTER TABLE salaries
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
