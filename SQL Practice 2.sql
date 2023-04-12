Show databases;

Drop database person;

Create database person;

Use person;

Show tables;

Drop table person1;

Create table person1(
id integer not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age integer not null
);

desc person1;

Alter table person1 add primary key (id);

Alter table person1 add constraint pk_person primary key (id, age);

Alter table person1 drop primary key;

-- Foreign Key

Create table person2 (
id integer not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age integer,
salary integer,
primary key (id)
);

desc person2;

Create table department (
id integer not null,
department_id integer not null,
department_name varchar(25) not null,
primary key (department_id)
);

desc department;

Drop table department;

Drop table person2;

Alter table department add foreign key (id) references person2(id);

Show tables;
-- Check constraints

create table person1 (
id integer not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age integer,
salary integer,
primary key (id),
check (salary < 50000)
);

Desc person1;

Insert into person1 values
(1, 'Ray', 'Joshi', 25, 40000),
(2, 'Krish', 'Naik', 31, 45000),
(3, 'John', 'Doe', 22, 25000);

Insert into person1 values (4, 'Jane', 'Austen', 31, 25000);

Select * from person1;

Drop table person1;

-- Default Constraint

Create table person1 (
id integer not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
city_name varchar(25) default 'Manchester'
);

Desc person1;

Insert into person1 values
(1, 'Ray', 'Joshi', 'Banglore'),
(2, 'Krish', 'Naik', 'Winona');

Select * from person1;

Alter table person1 alter city_name drop default;













 