-- Nested Queries
# When we need to generate insights from different tables of a database, we include the following:
# 1. Joins
# 2. Nested Queries/ Subqueries

Use youtube_import_export;
Show tables;

Select * from employee_data;

-- List all the employees that have salary higher than average salary
Select avg(Salary) from employee_data;
Select * from employee_data where Salary > 2280.15;

-- We cannot hardcode the values.
Select * from employee_data where Salary > (Select avg(Salary) from employee_data);

-- List all the employees that are having salary greater than Mr. X
Select * from employee_data;
Select Salary from employee_data where customerID = '7795-CFOCW';
Select * from employee_data where Salary > (Select Salary from employee_data where customerID = '7795-CFOCW');

-- Find the Second highest salaried person
Select customerID, Salary from employee_data order by Salary desc limit 2; # This gives the top 2 highest salaried people.
Select customerId, Salary from employee_data order by Salary desc limit 1, 1; # This gives the 2nd highest salaried person without nested queries.
# With nested queries
Select customerID, max(Salary) from employee_data; # This gives the max salaried person
Select customerID, max(Salary) from employee_data where Salary < (Select max(Salary) from employee_data); # This gives the second max salaried person.


-- Views
# Views are virtual tables that do not store any data of their own but display data stored in other tables.
# Views are basically virtual tables.

# We will see how to create tables from tables first.
Select * from churn_modeling;
# Now, we will create a table that has customers only from France.
Create table france_churn_modeling as Select * from churn_modeling where Geography = 'France';
Show tables;
Select * from france_churn_modeling; # We see all the data from churn_modeling has been transferred here whose Geography is listed as France.

# Creating Views is also as creating the new table from another table.
# We will create a view where the Geography of a customer is listed as Spain.
Create view spain_churn_modeling_view as Select * from churn_modeling where Geography = 'Spain';
Select * from spain_churn_modeling_view;

# Drop a view
Drop view spain_churn_modeling_view; 

# Let's go for more view syntax.
Use employees;
Show tables;
Select * from empinfo;
Select * from project;

# Creating a view using a join
Create view emp_view as Select first_name, last_name, id, state from empinfo inner join project on empinfo.id = project.student_id;
Select * from emp_view;


-- Stored Procedures
# Stored Procedures are like user-built functions. Call it to execute and can be given parameters as well.
Use youtube_import_export;
Show tables;

Create table players (
player_id int,
player_name varchar(25),
player_country varchar(25),
goals int
);

Insert into players values (901, 'Karim', 'Fra', 20);
Insert into players values (902, 'Cristiano', 'Por', 115);
Insert into players values (903, 'Lionel', 'Arg', 100);
Insert into players values (904, 'Thiery', 'Fra', 46);
Insert into players values (905, 'Neymar', 'Bra', 75);
Insert into players values (906, 'Luis', 'Por', 32);
Insert into players values (907, 'Benjamin', 'Eng', 43);
Insert into players values (908, 'Marcus', 'Eng', 54);
Insert into players values (909, 'Luke', 'Eng', 56);
Insert into players values (910, 'Lisandro', 'Arg', 87);
Insert into players values (911, 'Deigo', 'Arg', 81);

Select * from players;

# Return the players that have scored greater than 50 goals
Select * from players where goals > 50;

# Stored Procedure: delimiter && create procedure top_players() begin query end && delimeter;
delimiter &&
Create procedure top_players()
begin
Select player_name, player_country, goals from players where goals > 50;
end &&
delimiter;

call top_players();

DELIMITER //
Create procedure top_football_players(IN var int)
begin
Select player_name, player_country, goals from players order by goals desc limit var;
end //
DELIMITER ;

call top_football_players(3);

-- Find the top player for a specific country
Select player_name, goals from players where player_country = 'Por' order by goals desc limit 1;

DELIMITER $$
Create procedure top_f_players_country(IN var1 varchar(3), IN var2 int)
begin
Select player_name, player_country, goals from players where player_country = var1 order by goals desc limit var2;
end $$
DELIMITER ;

Call top_f_players_country('Arg', 4);

-- Stored Procedures for UPDATE queries
Update players set goals = 85 where player_id = 911;
Select * from players;

DELIMITER //
Create procedure update_goals(In var1 int)
begin
Update players set goals = var1 where player_id = 911;
end //
DELIMITER ;
Call update_goals(90);

DELIMITER %%
Create procedure update_goals_id(In var1 int, In var2 int)
begin
Update players set goals = var1 where player_id = var2;
Select player_name, player_country, goals from players;
end %%
DELIMITER ;
Call update_goals_id(82, 911);














