CREATE DATABASE lab3;

\c lab3;

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100),
    budget NUMERIC(10, 2)
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT REFERENCES departments(department_id),
    city VARCHAR(50)
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO departments (department_name, budget) VALUES
('IT', 80000),
('Research', 55000),
('Sales', 70000),
('Marketing', 60000);

INSERT INTO employees (first_name, last_name, department_id, city) VALUES
('John', 'Smith', 1, 'Almaty'),
('Jane', 'Doe', 2, 'Almaty'),
('Alice', 'Brown', 3, 'New York'),
('Bob', 'Smith', 1, 'Almaty'),
('Charlie', 'White', 4, 'Los Angeles');

INSERT INTO customers (first_name, last_name, city) VALUES
('Anna', 'Ivanova', 'Almaty'),
('Igor', 'Petrov', 'Moscow'),
('Maria', 'Sidorova', 'Almaty');

SELECT last_name FROM employees;

SELECT DISTINCT last_name FROM employees;

SELECT * FROM employees WHERE last_name = 'Smith';

SELECT * FROM employees WHERE last_name IN ('Smith', 'Doe');

SELECT * FROM employees WHERE department_id = 14;

SELECT * FROM employees WHERE department_id IN (37, 77);

SELECT SUM(budget) FROM departments;

SELECT department_id, COUNT(*) AS employee_count FROM employees GROUP BY department_id;

SELECT department_id FROM employees GROUP BY department_id HAVING COUNT(*) > 2;

SELECT department_name
FROM departments
ORDER BY budget DESC
LIMIT 1 OFFSET 1;

SELECT e.first_name, e.last_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.budget = (SELECT MIN(budget) FROM departments);

SELECT first_name, last_name FROM employees WHERE city = 'Almaty'
UNION
SELECT first_name, last_name FROM customers WHERE city = 'Almaty';

SELECT * FROM departments WHERE budget > 60000 ORDER BY budget ASC, department_id DESC;

UPDATE departments
SET budget = budget * 0.9
WHERE budget = (SELECT MIN(budget) FROM departments);

UPDATE employees
SET department_id = (SELECT department_id FROM departments WHERE department_name = 'IT')
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'Research');

DELETE FROM employees
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'IT');

DELETE FROM employees;
