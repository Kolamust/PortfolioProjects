# Employee and Department Management System

## Project Overview

This project demonstrates the creation and management of an employee database, including detailed data analysis using SQL. It covers the creation of tables, insertion of data, and execution of various queries to extract meaningful insights.

## Database Structure

### Tables

#### employees

| Column       | Data Type | Description          |
|--------------|-----------|----------------------|
| employee_id  | INT       | Primary key          |
| first_name   | VARCHAR   | Employee first name  |
| last_name    | VARCHAR   | Employee last name   |
| salary       | INT       | Employee salary      |
| age          | INT       | Employee age         |
| hire_date    | DATE      | Date of hire         |

#### departments

| Column       | Data Type | Description          |
|--------------|-----------|----------------------|
| employee_id  | INT       | Primary key, foreign key referencing `employees`(employee_id) |
| role         | VARCHAR   | Employee role        |
| unit         | VARCHAR   | Department unit      |

## Data Analysis Queries

- Retrieve all employee details
- Join `employees` and `departments` to get complete employee information
- Find the average salary by department
- List employees hired in the last two years
- Count employees by age group
- Find the highest salary in each department
- Calculate the total salary expenditure by department
- Find employees who are managers
- List employees who have a salary greater than the average salary
- Find employees with the longest tenure

## How to Run

1. Create the `employees` table.
2. Insert data into the `employees` table.
3. Create the `departments` table.
4. Insert data into the `departments` table.
5. Execute the provided queries for data analysis.

## Sample Queries

```sql
-- Retrieve all employee details
SELECT * FROM employees;

-- Join `employees` and `departments` to get complete employee information
SELECT e.employee_id, e.first_name, e.last_name, e.salary, e.age, e.hire_date, d.role, d.unit
FROM employees e
JOIN departments d
ON e.employee_id = d.employee_id;

-- Find the average salary by department
SELECT d.unit, AVG(e.salary) AS average_salary
FROM employees e
JOIN departments d
ON e.employee_id = d.employee_id
GROUP BY d.unit;

-- List employees hired in the last two years
SELECT * FROM employees
WHERE hire_date >= DATEADD(year, -2, GETDATE());

-- Count employees by age group
SELECT 
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50 and above'
    END AS age_group,
    COUNT(*) AS count
FROM employees
GROUP BY 
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50 and above'
    END;

-- Find the highest salary in each department
SELECT d.unit, MAX(e.salary) AS highest_salary
FROM employees e
JOIN departments d
ON e.employee_id = d.employee_id
GROUP BY d.unit;

-- Calculate the total salary expenditure by department
SELECT d.unit, SUM(e.salary) AS total_salary_expenditure
FROM employees e
JOIN departments d
ON e.employee_id = d.employee_id
GROUP BY d.unit;

-- Find employees who are managers
SELECT e.employee_id, e.first_name, e.last_name, d.role
FROM employees e
JOIN departments d
ON e.employee_id = d.employee_id
WHERE d.role LIKE '%Manager%';

-- List employees who have a salary greater than the average salary
SELECT e.employee_id, e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees);

-- Find employees with the longest tenure
SELECT e.employee_id, e.first_name, e.last_name, e.hire_date
FROM employees e
ORDER BY e.hire_date ASC
LIMIT 5;


--------------CREATING THE TABLE -------------------


##### `README.md`

Contains the project overview, database structure, and instructions for running the project.

##### `create_tables.sql`

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary INT,
    age INT,
    hire_date DATE
);

CREATE TABLE departments (
    employee_id INT PRIMARY KEY,
    role VARCHAR(50),
    unit VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

--------------INSERTING DATA INTO THE TABLES CREATED---------------------------


INSERT INTO employees (employee_id, first_name, last_name, salary, age, hire_date) VALUES
(1, 'John', 'Doe', 60000, 30, '2020-01-15'),
(2, 'Jane', 'Smith', 75000, 28, '2019-03-22'),
(3, 'Robert', 'Johnson', 80000, 35, '2018-07-18'),
(4, 'Emily', 'Williams', 67000, 27, '2021-05-30'),
(5, 'Michael', 'Brown', 95000, 40, '2017-11-13'),
(6, 'Sarah', 'Jones', 72000, 33, '2019-02-25'),
(7, 'David', 'Garcia', 63000, 29, '2020-08-07'),
(8, 'Laura', 'Martinez', 68000, 31, '2018-10-16'),
(9, 'James', 'Rodriguez', 89000, 45, '2017-06-21'),
(10, 'Linda', 'Lee', 76000, 38, '2019-09-03'),
(11, 'Richard', 'Walker', 83000, 42, '2021-04-14'),
(12, 'Mary', 'Hall', 71000, 34, '2020-12-05'),
(13, 'Joseph', 'Allen', 95000, 39, '2017-08-26'),
(14, 'Patricia', 'Young', 67000, 32, '2019-01-11'),
(15, 'Christopher', 'Hernandez', 90000, 41, '2018-11-09'),
(16, 'Barbara', 'King', 62000, 26, '2020-07-19'),
(17, 'Thomas', 'Wright', 78000, 37, '2019-04-04'),
(18, 'Elizabeth', 'Lopez', 87000, 36, '2018-05-21'),
(19, 'Daniel', 'Hill', 91000, 44, '2017-03-07'),
(20, 'Susan', 'Scott', 66000, 30, '2020-06-29');

INSERT INTO departments (employee_id, role, unit) VALUES
(1, 'Software Engineer', 'IT'),
(2, 'Marketing Specialist', 'Marketing'),
(3, 'Data Analyst', 'Analytics'),
(4, 'HR Manager', 'Human Resources'),
(5, 'Finance Manager', 'Finance'),
(6, 'Project Manager', 'Operations'),
(7, 'Customer Service Rep', 'Customer Service'),
(8, 'Business Analyst', 'Business Development'),
(9, 'Network Administrator', 'IT'),
(10, 'Sales Manager', 'Sales'),
(11, 'Product Manager', 'Product Development'),
(12, 'Content Writer', 'Marketing'),
(13, 'Data Scientist', 'Analytics'),
(14, 'Recruiter', 'Human Resources'),
(15, 'Accountant', 'Finance');




END TO END PROJECT ------------



-- Retrieve all employee details
SELECT * FROM employees;

-- Join `employees` and `departments` to get complete employee information
SELECT e.employee_id, e.first_name, e.last_name, e.salary, e.age, e.hire_date, d.role, d.unit
FROM employees e
JOIN departments d
ON e.employee_id = d.employee_id;

-- Find the average salary by department
SELECT d.unit, AVG(e.salary) AS average_salary
FROM employees e
JOIN departments d
ON e.employee_id = d.employee_id
GROUP BY d.unit;

-- List employees hired in the last two years
SELECT * FROM employees
WHERE hire_date >= DATEADD(year, -2, GETDATE());

-- Count employees by age group
SELECT 
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50 and above'
    END AS age_group,
    COUNT(*) AS count
FROM employees
GROUP BY 
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50 and above'
    END;

-- Find the highest salary in each department
SELECT d.unit, MAX(e.salary) AS highest_salary
FROM employees e
JOIN departments d
ON e.employee_id = d.employee_id
GROUP BY d.unit;

-- Calculate the total salary expenditure by department
SELECT d.unit, SUM(e.salary) AS total_salary_expenditure
FROM employees e
JOIN departments d
ON e.employee_id = d.employee_id
GROUP BY d.unit;

-- Find employees who are managers
SELECT e.employee_id, e.first_name, e.last_name, d.role
FROM employees e
JOIN departments d
ON e.employee_id = d.employee_id
WHERE d.role LIKE '%Manager%';

-- List employees who have a salary greater than the average salary
SELECT e.employee_id, e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees);

-- Find employees with the longest tenure
SELECT e.employee_id, e.first_name, e.last_name, e.hire_date
FROM employees e
ORDER BY e.hire_date ASC
LIMIT 5;
