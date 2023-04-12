-- JOINS IN SQL

SHOW DATABASES;
USE employees;
SHOW TABLES;
SELECT * FROM empinfo;

CREATE TABLE project (
project_id int,
project_name varchar(200),
student_id int
);
SELECT * FROM project;
INSERT INTO project values 
(1, 'Data Analytics', 99980),
(1, 'Data Analytics', 99981),
(1, 'Data Analytics', 99983),
(2, 'Data Analytics', 99980),
(2, 'Data Analytics', 99983),
(2, 'Data Analytics', 99984);
Insert into project values (3, 'Data Analytics', 11123);
Insert into project values (3, 'Data Analytics', 11121);
Insert into project values (4, 'Data Analytics', 11120);
Insert into project values (4, 'Data Analytics', 11122);

Select a.*, b.* from empinfo a right join project b on a.id = b.student_id;
Select distinct student_id from project;
Select distinct id from empinfo;

Select a.first_name, a.last_name, a.age, b.project_name, b.student_id
from empinfo a right join project b on a.id = b.student_id;

Select a.*, b.* from empinfo a inner join project b on a.id = b.student_id;
Select a.*, b.* from empinfo a left join project b on a.id = b.student_id;
Select * from empinfo left join project on empinfo.id = project.student_id union Select * from empinfo right join project on empinfo.id = project.student_id;

Use youtube_import_export;
Show tables;

Select * from transaction_details;
Select datediff('2023-12-04', order_date) as datediff_today, prod_name, prod_id, order_date from transaction_details;
Select date_format(order_date, '%Y'), month(order_date), day(order_date), order_date from transaction_details;
Select Adddate('2015-02-23', Interval 2 Month);

-- REGEX
Select * from churn_modeling;
Select * from churn_modeling where Surname like 'a%';
Select * from churn_modeling where Surname regexp '^a';
# Find all the records where surname starts from a, e, i, o or u;
# With 'like':
Select * from churn_modeling where Surname like 'a%' or Surname like 'e%' or Surname like 'i%' or Surname like 'o%' or Surname like 'u%'; 
# Notice the length of the statement. To keep it simple we use regex.
Select * from churn_modeling where Surname regexp '^[aeiou]';