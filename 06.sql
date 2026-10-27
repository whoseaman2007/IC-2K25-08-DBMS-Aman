-- Original question 6: Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade.
USE hr_assignment5;
SELECT e.first_name, e.last_name, e.salary
FROM employees AS e
JOIN job_grades AS g ON e.salary BETWEEN g.lowest_sal AND g.highest_sal
WHERE e.salary = g.lowest_sal;
