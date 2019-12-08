-- clear tables 
DROP TABLE IF EXISTS Employees CASCADE;
DROP TABLE IF EXISTS Dept_Manager CASCADE;
DROP TABLE IF EXISTS Titles CASCADE;
DROP TABLE IF EXISTS Dept_Emp CASCADE;
DROP TABLE IF EXISTS Salaries CASCADE;
DROP TABLE IF EXISTS Departments CASCADE;
--
CREATE TABLE  Employees  (
     emp_no  int   NOT NULL,
     birth_date  date   NOT NULL,
     first_name  varchar   NOT NULL,
     last_name  varchar   NOT NULL,
     gender  varchar   NOT NULL,
     hire_date  date   NOT NULL,
    CONSTRAINT  pk_Employees  PRIMARY KEY (
         emp_no 
     )
);

CREATE TABLE  Departments  (
     dept_no  varchar   NOT NULL,
     dept_name  varchar   NOT NULL,
    CONSTRAINT  pk_Departments  PRIMARY KEY (
         dept_no 
     )
);

CREATE TABLE  Dept_Emp  (
     emp_no  int   NOT NULL,
     dept_no  varchar   NOT NULL,
     from_date  date   NOT NULL,
     to_date  date   NOT NULL
);

CREATE TABLE  Salaries  (
     emp_no  int   NOT NULL,
     salary  money   NOT NULL,
     from_date  date   NOT NULL,
     to_date  date   NOT NULL,
	 PRIMARY KEY (emp_no, salary)
);

CREATE TABLE  Titles  (
     emp_no  int   NOT NULL,
     title  varchar   NOT NULL,
     from_date  date   NOT NULL,
     to_date  date   NOT NULL,
	 PRIMARY KEY (emp_no, title)
);

CREATE TABLE  Dept_Manager  (
     dept_no  varchar   NOT NULL,
     emp_no  int   NOT NULL,
     from_date  date   NOT NULL,
     to_date  date   NOT NULL
);

ALTER TABLE  Titles  ADD CONSTRAINT  fk_Titles_emp_no  FOREIGN KEY( emp_no )
REFERENCES  Employees  ( emp_no );

ALTER TABLE  Dept_Emp  ADD CONSTRAINT  fk_Dept_Emp_emp_no  FOREIGN KEY( emp_no )
REFERENCES  Employees  ( emp_no );

ALTER TABLE  Dept_Emp  ADD CONSTRAINT  fk_Dept_Emp_dept_no  FOREIGN KEY( dept_no )
REFERENCES  Departments  ( dept_no );

ALTER TABLE  Salaries  ADD CONSTRAINT  fk_Salaries_emp_no  FOREIGN KEY( emp_no )
REFERENCES  Employees  ( emp_no );

ALTER TABLE  Dept_Manager  ADD CONSTRAINT  fk_Dept_Manager_dept_no  FOREIGN KEY( dept_no )
REFERENCES  Departments  ( dept_no );



