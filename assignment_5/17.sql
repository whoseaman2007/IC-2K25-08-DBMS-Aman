-- Original question 17: Write a query to find the 4th minimum salary in the employees table.
USE hr_assignment5;
SELECT DISTINCT salary
FROM employees AS e
WHERE 4 = (
    SELECT COUNT(DISTINCT e2.salary)
    FROM employees AS e2
    WHERE e2.salary <= e.salary
)
ORDER BY salary ASC;
