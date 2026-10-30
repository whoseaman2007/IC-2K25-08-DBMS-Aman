-- Original question 22: Write a query to get nth max salaries of employees.
USE hr_assignment5;
-- Set @n to the desired positive distinct salary rank before running this file.
-- Example: SET @n := 3;
SELECT DISTINCT salary
FROM employees AS e
WHERE @n = (
    SELECT COUNT(DISTINCT e2.salary)
    FROM employees AS e2
    WHERE e2.salary >= e.salary
)
ORDER BY salary DESC;
