-- Original question 14: Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments.
USE hr_assignment5;
SELECT e.employee_id, e.first_name, e.last_name, e.salary
FROM employees AS e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id
)
ORDER BY e.department_id, e.employee_id;
