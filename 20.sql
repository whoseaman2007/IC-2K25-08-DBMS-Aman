-- Original question 20: Write a query to get 3 maximum salaries.
USE hr_assignment5;
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 3;
