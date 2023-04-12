Create database employees;

Use employees;

Create table employee_new (
first_name varchar(25),
last_name varchar(25),
title varchar(5),
age integer,
salary integer);

Select * from employee_new;

Alter table employee_new add column emp_id integer;

Insert into employee_new values 
('Ray', 'Joshi', 'Mr.', 25, 34000),
('James', 'Bond', 'Mr.', 31, 40000),
('John', 'Doe', 'Ms.', 28, 34500);

Alter table employee_new drop column emp_id;

Drop table employee_new;

Select title, first_name, last_name, age from employee_new;

Select first_name, last_name, age from employee_new where age > 30 or salary < 40000;

SELECT CONCAT(first_name, ' ', last_name) as full_name from employee_new where age < 30;

-- Practice

CREATE TABLE empinfo(
first_name varchar(25),
last_name varchar(25),
id int,
age int,
city varchar(25),
state varchar(25),
PRIMARY KEY (id)
);

INSERT INTO empinfo VALUES
('John', 'Jones', 99980, 45, 'Payson', 'Arizona'),
('Mary', 'Jones', 88823, 25, 'Payson', 'California'),
('Eric', 'Edwards', 99981, 32, 'San Diego', 'California'),
('Levy', 'Rozman', 99982, 44, 'Phoenix', 'Arizona'),
('Ginger', 'Howell', 99983, 27, 'Cottonwood', 'California'),
('Sebastian', 'Smith', 99984, 33, 'Gia Bend', 'Colorado'),
('Gus', 'Gray', 99985, 31, 'Oxford', 'Mississippi'),
('Mary Ann', 'May', 99925, 37, 'Tucson', 'Arizona');

SELECT * FROM empinfo;
SELECT * FROM empinfo WHERE state = 'Arizona';
SELECT COUNT(id) FROM empinfo WHERE state = 'California';
SELECT * FROM empinfo WHERE first_name LIKE 'M%';
SELECT * FROM empinfo WHERE state = 'California' AND age > 30;
SELECT * FROM empinfo WHERE first_name LIKE '%ar%';
SELECT * FROM empinfo WHERE first_name LIKE 'M%' OR first_name LIKE 'J%';
INSERT INTO empinfo VALUES
('Jonie', 'Weber', 88745, 28, 'San Francisco', 'California'),
('Potsy', 'Weber', 22332, 32, 'Plymoth', 'New York');

-- UPDATE
ALTER TABLE empinfo ADD COLUMN salary INT;
UPDATE empinfo SET salary = 32000 WHERE id = 22332;
ALTER TABLE empinfo DROP COLUMN salary;
UPDATE empinfo SET age = 25 WHERE id = 22332;
UPDATE empinfo SET last_name = 'Weber-Williams' WHERE id = 88745;
UPDATE empinfo SET age = age + 1 WHERE id = 88823;

-- DELETE
DELETE FROM empinfo WHERE first_name LIKE 'M%';
