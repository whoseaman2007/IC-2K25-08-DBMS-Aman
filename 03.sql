-- Original question 3: Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department. Hint : Write single-row and multiple-row subqueries
USE hr_assignment5;
SELECT first_name, last_name
FROM employees
WHERE manager_id IS NOT NULL
  AND department_id IN (
      SELECT department_id
      FROM departments
      WHERE location_id IN (
          SELECT location_id
          FROM locations
          WHERE country_id = (
              SELECT country_id FROM countries WHERE country_name = 'United States'
          )
      )
  );
