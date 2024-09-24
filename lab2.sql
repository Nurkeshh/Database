CREATE DATABASE lab_2;



CREATE TABLE countries (
    country_id INT PRIMARY KEY ,
    country_name VARCHAR(255),
    region_id INT,
    population INT
);



INSERT INTO countries (country_name, region_id, population) VALUES ('USA', 1, 331002651);


INSERT INTO countries (country_id, country_name) VALUES (2, 'Canada');


INSERT INTO countries (country_name, region_id, population) VALUES ('Australia', NULL, 25000000);



INSERT INTO countries (country_name, region_id, population)
VALUES ('India', 3, 1393409038),
       ('China', 3, 1444216107),
       ('Brazil', 2, 213993437);



ALTER TABLE countries
MODIFY country_name VARCHAR(255) DEFAULT 'Kazakhstan';


INSERT INTO countries (region_id, population) VALUES (4, 18500000);


INSERT INTO countries () VALUES ();


CREATE TABLE countries_new LIKE countries;


INSERT INTO countries_new SELECT * FROM countries;


UPDATE countries SET region_id = 1 WHERE region_id IS NULL;


SELECT country_name, population * 1.1 AS "New Population" FROM countries;


DELETE FROM countries WHERE population < 100000;


DELETE FROM countries_new WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *;


DELETE FROM countries RETURNING *;
