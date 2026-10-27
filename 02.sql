-- Original question 2: Write a query to find the name (first_name, last_name) of all employees who works in the IT department.
USE hr_assignment5;
SELECT first_name, last_name
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE department_name = 'IT');
