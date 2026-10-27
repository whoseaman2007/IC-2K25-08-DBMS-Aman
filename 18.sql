-- Original question 18: Write a query to select last 10 records from a table.
USE hr_assignment5;
SELECT employee_id, first_name, last_name, salary
FROM (
    SELECT employee_id, first_name, last_name, salary
    FROM employees
    ORDER BY employee_id DESC
    LIMIT 10
) AS last_ten
ORDER BY employee_id ASC;
