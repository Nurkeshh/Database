CREATE DATABASE lab3;

CREATE TABLE departments (
  code INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  budget DECIMAL NOT NULL
);

CREATE TABLE employees (
  ssn INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  department INTEGER NOT NULL ,
  city VARCHAR(255),
  FOREIGN KEY (department) REFERENCES departments(code)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  city VARCHAR(255)
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
