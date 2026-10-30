-- Original question 15: Write a query to fetch even numbered records from employees table.
USE hr_assignment5;
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE MOD(employee_id, 2) = 0
ORDER BY employee_id;
