USE hr_assignment5;

INSERT INTO countries (country_id, country_name) VALUES
('US', 'United States'), ('CA', 'Canada'), ('UK', 'United Kingdom');

INSERT INTO locations (location_id, city, country_id) VALUES
(1000, 'Seattle', 'US'), (1100, 'Toronto', 'CA'), (1200, 'London', 'UK');

INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES
(10, 'Administration', NULL, 1000),
(20, 'Marketing', NULL, 1100),
(50, 'Shipping', NULL, 1200),
(60, 'IT', NULL, 1000),
(80, 'Sales', NULL, 1000),
(90, 'Executive', NULL, 1000),
(110, 'Finance', NULL, 1100),
(120, 'Treasury', NULL, 1100);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES
('AD_PRES', 'President', 20000, 40000),
('AD_VP', 'Administration Vice President', 15000, 30000),
('IT_PROG', 'Programmer', 4000, 10000),
('SA_REP', 'Sales Representative', 5000, 15000),
('SH_CLERK', 'Shipping Clerk', 2500, 5500),
('FI_ACCOUNT', 'Accountant', 4000, 9000),
('AD_ASST', 'Administrative Assistant', 3000, 6000);

INSERT INTO job_grades (grade_level, lowest_sal, highest_sal) VALUES
('A', 2000, 3999), ('B', 4000, 5999), ('C', 6000, 9999), ('D', 10000, 19999), ('E', 20000, 40000);

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary, manager_id, department_id) VALUES
(100, 'Steven', 'King', 'SKING', '2003-06-17', 'AD_PRES', 24000, NULL, 90),
(101, 'Neena', 'Kochhar', 'NKOCHHAR', '2005-09-21', 'AD_VP', 17000, 100, 60),
(102, 'Lex', 'De Haan', 'LDEHAAN', '2001-01-13', 'AD_VP', 17000, 100, 90),
(103, 'Alexander', 'Hunold', 'AHUNOLD', '2006-01-03', 'IT_PROG', 9000, 101, 60),
(104, 'Bruce', 'Ernst', 'BERNST', '2007-05-21', 'IT_PROG', 6000, 103, 60),
(105, 'David', 'Austin', 'DAUSTIN', '2005-06-25', 'IT_PROG', 4800, 103, 60),
(106, 'Valli', 'Pataballa', 'VPATABAL', '2006-02-05', 'IT_PROG', 4800, 103, 60),
(107, 'Diana', 'Lorentz', 'DLORENTZ', '2007-02-07', 'IT_PROG', 4200, 103, 60),
(108, 'John', 'Russell', 'JRUSSELL', '2004-10-01', 'SA_REP', 14000, 100, 80),
(109, 'Karen', 'Partners', 'KPARTNERS', '2005-01-05', 'SA_REP', 13500, 108, 80),
(110, 'Alberto', 'Errazuriz', 'AERRAZUR', '2005-03-10', 'SA_REP', 12000, 108, 80),
(111, 'Gerald', 'Cambrault', 'GCAMBRAU', '2007-10-15', 'SA_REP', 11000, 108, 80),
(112, 'Peter', 'Tucker', 'PTUCKER', '2007-01-30', 'SA_REP', 10000, 108, 80),
(113, 'Alexander', 'Khoo', 'AKHOO', '2006-05-18', 'SH_CLERK', 3100, 107, 50),
(114, 'Shelli', 'Baida', 'SBAIDA', '2007-12-24', 'SH_CLERK', 2900, 107, 50),
(115, 'Sigal', 'Tobias', 'STOBIAS', '2005-07-24', 'SH_CLERK', 2800, 107, 50),
(116, 'Guy', 'Himuro', 'GHIMURO', '2006-11-15', 'SH_CLERK', 2600, 107, 50),
(117, 'John', 'Bell', 'JBELL', '2004-02-04', 'FI_ACCOUNT', 8200, 104, 110),
(118, 'William', 'Smith', 'WSMITH', '2008-03-12', 'AD_ASST', 4400, 100, 10),
(119, 'Jennifer', 'Bull', 'JBULL', '2009-02-20', 'AD_ASST', 4100, 100, 10);

UPDATE departments SET manager_id = CASE department_id
    WHEN 10 THEN 100 WHEN 20 THEN 103 WHEN 50 THEN 107 WHEN 60 THEN 101
    WHEN 80 THEN 108 WHEN 90 THEN 100 WHEN 110 THEN 104 ELSE NULL
END
WHERE department_id IN (10, 20, 50, 60, 80, 90, 110);
