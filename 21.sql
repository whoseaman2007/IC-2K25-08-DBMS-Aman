-- Original question 21: Write a query to get 3 minimum salaries.
USE hr_assignment5;
SELECT DISTINCT salary
FROM employees
ORDER BY salary ASC
LIMIT 3;
