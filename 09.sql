-- Original question 9: Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum salary for all departments.
USE hr_assignment5;
SELECT first_name, last_name, salary
FROM employees
WHERE salary = (
    SELECT MIN(department_minimum)
    FROM (
        SELECT MIN(salary) AS department_minimum
        FROM employees
        WHERE department_id IS NOT NULL
        GROUP BY department_id
    ) AS department_minima
);
