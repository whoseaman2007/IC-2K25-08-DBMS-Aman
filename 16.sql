-- Original question 16: Write a query to find the 5th maximum salary in the employees table.
USE hr_assignment5;
SELECT DISTINCT salary
FROM employees AS e
WHERE 5 = (
    SELECT COUNT(DISTINCT e2.salary)
    FROM employees AS e2
    WHERE e2.salary >= e.salary
)
ORDER BY salary DESC;
