-- Original question 10: Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary of all departments.
USE hr_assignment5;
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(department_average)
    FROM (
        SELECT AVG(salary) AS department_average
        FROM employees
        WHERE department_id IS NOT NULL
        GROUP BY department_id
    ) AS department_averages
);
