--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT E.emp_no AS  "employee number"
	,E.last_name AS  "last name"
	,E.first_name AS  "first name"
	,E.sex
	,S.salary
FROM employees E
JOIN salaries S
ON E.emp_no = S.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT E.first_name AS  "first name"
	,E.last_name AS  "last name"
	,E.hire_date
FROM employees E
WHERE TO_CHAR(E.hire_date,'YYYY') = '1986';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT M.dept_no AS "department number"
	,D.dept_name AS "department name"
	,M.emp_no AS "employee number"
	,E.last_name AS  "last name"
	,E.first_name AS  "first name"
FROM dept_manager M
JOIN departments D
ON M.dept_no = D.dept_no
JOIN employees E
ON M.emp_no = E.emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT M.emp_no AS "employee number"
	,E.last_name AS  "last name"
	,E.first_name AS  "first name"
	,D.dept_name AS "department name"
FROM dept_emp M
JOIN departments D
ON M.dept_no = D.dept_no
JOIN employees E
ON M.emp_no = E.emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT E.first_name AS  "first name"
	,E.last_name AS  "last name"
	,E.sex
FROM employees E
WHERE E.first_name LIKE 'Hercules'
AND E.last_name LIKE 'B%';

--List all employees in the Sales department, including their:
--employee number, last name, first name, and department name.
SELECT M.emp_no AS "employee number"
	,E.last_name AS  "last name"
	,E.first_name AS  "first name"
	,D.dept_name AS "department name"
FROM dept_emp M
JOIN departments D
ON M.dept_no = D.dept_no
JOIN employees E
ON M.emp_no = E.emp_no
WHERE D.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their:
--employee number, last name, first name, and department name.
SELECT M.emp_no AS "employee number"
	,E.last_name AS  "last name"
	,E.first_name AS  "first name"
	,D.dept_name AS "department name"
FROM dept_emp M
JOIN departments D
ON M.dept_no = D.dept_no
JOIN employees E
ON M.emp_no = E.emp_no
WHERE D.dept_name IN ('Sales','Development');


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT E.last_name 
	,COUNT(E.last_name) AS "frecuency"
FROM employees E
GROUP BY E.last_name 
ORDER BY E.last_name  DESC;


