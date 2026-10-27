-- Create the exercise database if absent; this script does not drop databases or tables.
CREATE DATABASE IF NOT EXISTS hr_assignment5 CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE hr_assignment5;

CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    city VARCHAR(30) NOT NULL,
    country_id CHAR(2) NOT NULL,
    CONSTRAINT fk_locations_country FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL,
    manager_id INT NULL,
    location_id INT NOT NULL,
    CONSTRAINT fk_departments_location FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE jobs (
    job_id VARCHAR(10) PRIMARY KEY,
    job_title VARCHAR(35) NOT NULL,
    min_salary DECIMAL(8,2) NOT NULL,
    max_salary DECIMAL(8,2) NOT NULL
);

CREATE TABLE job_grades (
    grade_level VARCHAR(2) PRIMARY KEY,
    lowest_sal DECIMAL(8,2) NOT NULL,
    highest_sal DECIMAL(8,2) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(25) NOT NULL UNIQUE,
    hire_date DATE NOT NULL,
    job_id VARCHAR(10) NOT NULL,
    salary DECIMAL(8,2) NOT NULL,
    manager_id INT NULL,
    department_id INT NULL,
    CONSTRAINT fk_employees_job FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    CONSTRAINT fk_employees_manager FOREIGN KEY (manager_id) REFERENCES employees(employee_id),
    CONSTRAINT fk_employees_department FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

ALTER TABLE departments
    ADD CONSTRAINT fk_departments_manager FOREIGN KEY (manager_id) REFERENCES employees(employee_id);

CREATE INDEX idx_employees_department_salary ON employees(department_id, salary);
CREATE INDEX idx_employees_manager ON employees(manager_id);
