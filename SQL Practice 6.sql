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

















