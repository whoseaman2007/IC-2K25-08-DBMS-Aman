-- Original question 12: Write a query to find the name (first_name, last_name) of the employees who are not supervisors.
USE hr_assignment5;
SELECT first_name, last_name
FROM employees
WHERE employee_id NOT IN (SELECT manager_id FROM employees WHERE manager_id IS NOT NULL);
