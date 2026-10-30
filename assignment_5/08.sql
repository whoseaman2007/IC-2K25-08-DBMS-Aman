-- Original question 8: Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.
USE hr_assignment5;
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT MAX(salary) FROM employees WHERE last_name = 'Bell');
