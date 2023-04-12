/*
SQL Constraints
1. Not NULL
2. Unique
3. Primary Key
4. Foreign Key
5. Check
6. Default
7. Index
*/

Create database students;

Create table student (
id integer not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age integer
);

Alter table student modify age integer not null;

Create table person (
id integer not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age integer not null,
unique (id)
);

Insert into person values (1, 'Ray', 'Joshi', 25);
Insert into person values (2, 'Ray2', 'Joshi2', 25);
Insert into person values (1, 'Ray3', 'Joshi3', 25);

Select * from person;

Alter table person add unique(first_name);
Alter table person add constraint uc_person  unique(age, first_name);

Alter table person drop index uc_person;

# Primary Key
create table person1 (
id integer not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age integer not null,
constraint pk_person primary key (id, last_name)
);

desc person1;

Alter table person1 add primary key (id);

Alter table person1 drop primary key;

desc person;

