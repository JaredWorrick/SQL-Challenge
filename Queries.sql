-- Data Analysis

-- List the employee number, last name, first name, sex, and salary of each employee. (DA_Q1_Analysis)
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986. (DA_Q2_Analysis)
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name. (DA_Q3_Analysis)
SELECT departments.dept_no, departments.dept_name, dept_managers.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_managers
ON departments.dept_no = dept_managers.dept_no
JOIN employees
ON dept_managers.emp_no = employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name. (DA_Q4_Analysis)
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B. (DA_Q5_Analysis)
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name Like 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name. (DA_Q6_Analysis)
SELECT departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name. (DA_Q7_Analysis)
SELECT departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name). (DA_Q8_Analysis)
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
