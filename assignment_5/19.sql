-- Original question 19: Write a query to list the department ID and name of all the departments where no employee is working.
USE hr_assignment5;
SELECT d.department_id, d.department_name
FROM departments AS d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees AS e
    WHERE e.department_id = d.department_id
)
ORDER BY d.department_id;
