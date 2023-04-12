Show databases;

Use customers;

Show tables;

Create table person (
id integer not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
city_name varchar(25)
);

Select * from person;

Create index index_city_name on person(city_name);

Desc person;

Create table student (
id integer not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age integer
);

Create index index_age on student(age);
Create index index_age_first_name on student(age, first_name);

Alter table student drop index index_age_first_name;

Alter table student drop index index_age;

Desc student;


