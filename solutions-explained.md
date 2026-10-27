# Assignment 4 solutions explained

The checklist below follows the original document, “Aggregate Functions and Group by [14 exercises].” The original document is preserved in `assignment/original-assignment.docx`. Each prompt is reproduced in its original order; the matching SQL file contains the solution. No sub-questions appear in the source document.

## Coverage checklist

- [x] Question 1: Write a query to list the number of jobs available in the employees table.
- [x] Question 2: Write a query to get the total salaries payable to employees.
- [x] Question 3: Write a query to get the minimum salary from employees table.
- [x] Question 4: Write a query to get the maximum salary of an employee working as a Programmer.
- [x] Question 5: Write a query to get the average salary and number of employees working the department 90.
- [x] Question 6: Write a query to get the highest, lowest, sum, and average salary of all employees.
- [x] Question 7: Write a query to get the number of employees with the same job.
- [x] Question 8: Write a query to get the difference between the highest and lowest salaries.
- [x] Question 9: Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
- [x] Question 10: Write a query to get the department ID and the total salary payable in each department.
- [x] Question 11: Write a query to get the average salary for each job ID excluding programmer.
- [x] Question 12: Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
- [x] Question 13: Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
- [x] Question 14: Write a query to get the average salary for all departments employing more than 10 employees.

## Questions and explanations

### Question 1

> Write a query to list the number of jobs available in the employees table.

**Solution:** [`sql/01-count-distinct-jobs.sql`](../sql/01-count-distinct-jobs.sql)

COUNT(DISTINCT job_id) counts the different job IDs, so repeated employees with the same job count as one job.

### Question 2

> Write a query to get the total salaries payable to employees.

**Solution:** [`sql/02-total-salaries.sql`](../sql/02-total-salaries.sql)

SUM adds the salary values across the table. NULL salary values are ignored by SUM.

### Question 3

> Write a query to get the minimum salary from employees table.

**Solution:** [`sql/03-minimum-salary.sql`](../sql/03-minimum-salary.sql)

MIN returns the smallest non-NULL salary in the table.

### Question 4

> Write a query to get the maximum salary of an employee working as a Programmer.

**Solution:** [`sql/04-programmer-maximum-salary.sql`](../sql/04-programmer-maximum-salary.sql)

The WHERE clause keeps programmer rows before MAX finds the highest salary. This solution assumes IT_PROG is the Programmer job_id.

**Assumption:** The query treats `IT_PROG` as Programmer. See [database notes](database-notes.md) if the course data uses a different `job_id` value.

### Question 5

> Write a query to get the average salary and number of employees working the department 90.

**Solution:** [`sql/05-department-90-average-and-count.sql`](../sql/05-department-90-average-and-count.sql)

WHERE selects department 90. AVG calculates its mean salary and COUNT(*) counts its employee rows.

### Question 6

> Write a query to get the highest, lowest, sum, and average salary of all employees.

**Solution:** [`sql/06-salary-summary.sql`](../sql/06-salary-summary.sql)

Several aggregate functions can summarize the same set of rows in one SELECT.

### Question 7

> Write a query to get the number of employees with the same job.

**Solution:** [`sql/07-employee-count-by-job.sql`](../sql/07-employee-count-by-job.sql)

GROUP BY creates one result row per job_id. COUNT(*) gives the number of employees in each group.

### Question 8

> Write a query to get the difference between the highest and lowest salaries.

**Solution:** [`sql/08-salary-range-difference.sql`](../sql/08-salary-range-difference.sql)

The expression subtracts the minimum salary from the maximum salary.

### Question 9

> Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.

**Solution:** [`sql/09-minimum-salary-by-manager.sql`](../sql/09-minimum-salary-by-manager.sql)

Grouping by manager_id creates a group for each manager; MIN finds the lowest salary in each group.

### Question 10

> Write a query to get the department ID and the total salary payable in each department.

**Solution:** [`sql/10-total-salary-by-department.sql`](../sql/10-total-salary-by-department.sql)

GROUP BY department_id creates one row per department, and SUM totals that department’s salaries.

### Question 11

> Write a query to get the average salary for each job ID excluding programmer.

**Solution:** [`sql/11-average-salary-by-job-excluding-programmer.sql`](../sql/11-average-salary-by-job-excluding-programmer.sql)

WHERE removes the Programmer job before GROUP BY and AVG calculate the remaining per-job averages. This assumes IT_PROG is the Programmer job_id.

**Assumption:** The query treats `IT_PROG` as Programmer. See [database notes](database-notes.md) if the course data uses a different `job_id` value.

### Question 12

> Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.

**Solution:** [`sql/12-department-90-salary-summary-by-job.sql`](../sql/12-department-90-salary-summary-by-job.sql)

WHERE first limits rows to department 90. GROUP BY then calculates all four salary summaries separately for each job_id.

### Question 13

> Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.

**Solution:** [`sql/13-jobs-with-maximum-salary-at-least-4000.sql`](../sql/13-jobs-with-maximum-salary-at-least-4000.sql)

HAVING filters grouped results after MAX has calculated each job’s maximum salary.

### Question 14

> Write a query to get the average salary for all departments employing more than 10 employees.

**Solution:** [`sql/14-department-averages-over-10-employees.sql`](../sql/14-department-averages-over-10-employees.sql)

HAVING COUNT(*) > 10 keeps only department groups with more than ten employee rows.

## How to read these queries

- A single aggregate query without `GROUP BY` summarizes the whole selected table as one result row.
- `WHERE` filters employee rows before grouping and aggregation.
- `GROUP BY` makes one result group per job, manager, or department key.
- `HAVING` filters the completed groups using an aggregate result, such as a count or maximum salary.
- `COUNT(*)` counts rows; `COUNT(DISTINCT job_id)` counts different non-NULL job IDs.
- NULL salary values are ignored by `AVG`, `MIN`, `MAX`, and `SUM`. See the [database notes](database-notes.md) for NULL grouping and schema assumptions.
