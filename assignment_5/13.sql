-- Original question 13: Write a query to display the employee ID, first name, last name, and department names of all employees.
USE hr_assignment5;
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees AS e
LEFT JOIN departments AS d ON d.department_id = e.department_id
ORDER BY e.employee_id;
