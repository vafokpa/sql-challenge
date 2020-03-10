department
-
dept_no VARCHAR PK
dept_name VARCHAR

dept_emp
-
emp_no INTEGER FK - employees.emp_no
dept_no VARCHAR FK - department.dept_no
from_date VARCHAR
to_date VARCHAR

dept_manager
-
dept_no VARCHAR FK - department.dept_no
emp_no INTEGER fK - employees.emp_no
from_date VARCHAR
to_date VARCHAR

employees
-
emp_no INTEGER PK 
birth_date VARCHAR
first_name VARCHAR
last_name VARCHAR
gender VARCHAR
hire_date VARCHAR

salaries
-
emp_no INTEGER fK - employees.emp_no
salary INTEGER
from_date DATE
to_date DATE

titles
-
emp_no INTEGER fK - employees.emp_no
title VARCHAR
from_date VARCHAR
to_date VARCHAR