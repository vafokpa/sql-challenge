CREATE TABLE "department" (
    "dept_no" VARCHAR  NOT NULL ,
    "dept_name" VARCHAR  NOT NULL ,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_no"
    )
);


CREATE TABLE "dept_emp" (
    "emp_no" INTEGER  NOT NULL ,
    "dept_no" VARCHAR  NOT NULL ,
    "from_date" VARCHAR  NOT NULL ,
    "to_date" VARCHAR  NOT NULL 
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR  NOT NULL ,
    "emp_no" INTEGER  NOT NULL ,
    "from_date" VARCHAR  NOT NULL ,
    "to_date" VARCHAR  NOT NULL 
)


;
CREATE TABLE "employees" (
    "emp_no" INTEGER  NOT NULL ,
    "birth_date" VARCHAR  NOT NULL ,
    "first_name" VARCHAR  NOT NULL ,
    "last_name" VARCHAR  NOT NULL ,
    "gender" VARCHAR  NOT NULL ,
    "hire_date" VARCHAR  NOT NULL ,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
    )
);

 CREATE TABLE "salary" (
     "emp_no" INTEGER  NOT NULL ,
     "salary" INTEGER  NOT NULL ,
     "from_date" DATE  NOT NULL ,
     "to_date" DATE  NOT NULL 
 );

CREATE TABLE "titles" (
    "emp_no" INTEGER  NOT NULL ,
    "title" VARCHAR  NOT NULL ,
    "from_date" VARCHAR  NOT NULL ,
    "to_date" VARCHAR  NOT NULL 
)
;

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");


ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");


ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


ALTER TABLE "salary" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Listing employee details

select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees e
JOIN salary s
ON e.emp_no = s.emp_no
;

-- Listing employees hired in 1986

select * from employees
WHERE hire_date like '1986%';

-- Listing Manager's information

SELECT e.first_name, e.last_name, d.dept_no, d.emp_no, d.from_date, d.to_date, a.dept_name
from employees e
JOIN dept_manager d
ON e.emp_no = d.emp_no
JOIN department a
ON a.dept_no = d.dept_no
;
--  Listing department of employees

select b.emp_no, e.last_name, e.first_name, a.dept_name
from dept_emp b
JOIN employees e
ON e.emp_no = b.emp_no
JOIN department a
on a.dept_no = b.dept_no
;

-- Listing all employees with first name Hercules and last name starts with B

SELECT * 
FROM employees
WHERE first_name LIKE '%Hercules' AND last_name LIKE 'B%'

-- Listing all employees who worked in Sales

SELECT b.emp_no, e.last_name, e.first_name, a.dept_name
from dept_emp b
JOIN employees e
ON e.emp_no = b.emp_no
JOIN department a
on a.dept_no = b.dept_no
WHERE b.dept_no = 'd007'
;

-- Listing all employees who work in Sales and Development

SELECT b.emp_no, e.last_name, e.first_name, a.dept_name
from dept_emp b
JOIN employees e
ON e.emp_no = b.emp_no
JOIN department a
on a.dept_no = b.dept_no
WHERE b.dept_no = 'd007' OR b.dept_no = 'd005'

-- Frequency count of Employee last name in descending order
SELECT last_name, 
COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY count desc;
