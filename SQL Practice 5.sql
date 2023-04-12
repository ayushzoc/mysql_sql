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


















