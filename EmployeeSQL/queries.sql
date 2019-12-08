
-- visualize each table 
SELECT * FROM Departments
SELECT * FROM Dept_Emp
SELECT * FROM Dept_Manager
SELECT * FROM Employees
SELECT * FROM Salaries
SELECT * FROM Titles

-- ------------- QUERIES ---------------
--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.gender, Salaries.salary
FROM Employees 
INNER JOIN Salaries ON Employees.emp_no = Salaries.emp_no;


-- List employees who were hired in 1986.
SELECT *
FROM Employees
WHERE date_part('year', hire_date) = 1986;


-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT Departments.dept_no, Departments.dept_name, Employees.emp_no, Employees.last_name, Employees.first_name, Dept_Manager.from_date, Dept_Manager.to_date 
FROM Dept_Manager 
	INNER JOIN Departments ON Departments.dept_no = Dept_Manager.dept_no
	INNER JOIN Employees ON Employees.emp_no = Dept_Manager.emp_no;


-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees 
	INNER JOIN Dept_Emp ON Employees.emp_no = Dept_Emp.emp_no
	INNER JOIN Departments ON Departments.dept_no = Dept_Emp.dept_no;


-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * 
FROM Employees 
WHERE 
	first_name ='Hercules'
	AND last_name like 'B%';


-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees 
	INNER JOIN Dept_Emp ON Employees.emp_no = Dept_Emp.emp_no
	INNER JOIN Departments ON Departments.dept_no = Dept_Emp.dept_no
WHERE Departments.dept_name ='Sales';


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees 
	INNER JOIN Dept_Emp ON Employees.emp_no = Dept_Emp.emp_no
	INNER JOIN Departments ON Departments.dept_no = Dept_Emp.dept_no
WHERE 
		Departments.dept_name ='Sales'
		OR Departments.dept_name ='Development';


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT Employees.last_name, COUNT(Employees.last_name)
FROM Employees
	GROUP BY Employees.last_name
	ORDER BY COUNT(Employees.last_name) DESC








