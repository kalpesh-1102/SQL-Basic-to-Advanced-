############################################################              End to End notes          ###########################################################################
/*
Database: Database is a collection of data in a format that can be easily accessed. A database is a systematic collection
          of data & they support electronic storage and manipulation of data. Databases make data management easy.

DBMS: It is a software used to manage our Database is called as DBMS. It is a software that enables users to efficiently 
      store, manage, retrieve, and manipulate data in a structured format, ensuring data integrity, security, and 
      facilitating seamless data interaction  for various applications. 
      
      DBMS provides protection and security to the database. In the case of multiple users, it also maintains data 
      consistency.
      
DBMS user tasks:- 
1. Data Definition   
2. Data Updation 
3. Data Retrieval
4. User Administration

Various types of Database: 

1. Hierarchical databases
2. Network databases
3. Object-oriented databases
4. Relational databases: A relational database organizes data into tables with rows and columns, where relationships between 
                         tables are established using keys. For example, MySQL is a popular relational database management 
                         system used for various applications, including web development and enterprise systems.
5. Cloud databases
6. Centralized databases
7. Operational databases
8. NoSQL databases: NoSQL databases, also known as "Not Only SQL," provide a flexible data model and are often used for 
                    large-scale, distributed systems. Examples include MongoDB, Cassandra, and Redis, each tailored for 
                    specific data storage and retrieval needs in modern applications.

--> A database can have one or multiple tables in it and we store out data in thoes
    tables. We generally store interrelated data in all tables of a database. 

--> A table is a collection of data organized into rows and columns. Each column represents a different attribute, while each 
    row represents a unique record or entry in the table. Tables are fundamental components used for storing and managing 
    structured data in relational database management systems (RDBMS).
    
    

######                   What is SQL?                   ######

---> SQL stands for Structurd Query Language which is a programming language used to interact with data stored in relational 
     database. It is used to perform "CURD" operations:
     1. Create
     2. Read
     3. Update
     4. Delete
     
*/

/*
 Q.1) What is order of exicution in SQL?
 ANS: FROM-->WHERE-->GROUP BY-->HAVING-->SELECT-->ORDER BY-->LIMIT


*****************************************************************
| 1   |   FROM		|   Choose and join tables      			|
| 2   |   WHERE		|   Filters the base data					|
| 3   |	  GROUP BY	|   Aggregates the base data				|
| 4	  |   HAVING	|   Filters the aggregated data				|
| 5	  |	  SELECT	|	Returns the final data					|
| 6	  |	  ORDER BY	|   Shorts the final data	
| 7	  |   OFFSET	|   Specifies the number of rows to skip	|
| 8	  |   LIMIT		|   Limits the returned data to a row count	|
*****************************************************************

*/
select * from cust_info;

# Creating our First Database
create database notes_A_Z;



create database if not exists notes_A_Z;
use notes_A_Z;

#DROP DATABASE notes_A_Z; (To drop the database);
/*
1. SQL CREATE DATABASES
2. SQL DROP DATABASES
3. SQL CREATE TABLE
4. SQL INSERT INTO TABLE
5. SQL DROP TABLE
*/

#1. SQL CREATE DATABASES
create database if not exists notes_A_Z;
Use notes_A_Z;

#2. SQL DROP DATABASES
Drop database notes_A_Z;

#3. SQL CREATE TABLE
create table cust_info(
id integer,
first_name varchar(25),
last_name varchar(25),
salary integer
);

desc cust_info;

#4. SQL INSERT INTO TABLE
insert into cust_info(id, first_name, last_name, salary)
Values
(1, "AA", "aa", 10000),
(2, "BB", "bb", NULL),
(3, "CC", "cc", 20000),
(4, "DD", "dd", NULL)
;

#truncate table cust_info;
select * from cust_info;

select * from cust_info;
#5. SQL DROP TABLE
Drop table cust_info;

/*
1. SQL NULL VALUES
2. SQL UPDATE STATEMENT
3. SQL DALETE STATEMENT
4. SQL ALTER TABLE
--Add column in existing Column
--Modify/alter Column
--Alter Table-Drop Column
*/

#1. SQL NULL VALUES (To check for null values present in table)
select id, first_name from cust_info where salary is not null;


select * from cust_info where id = 4;

#2. SQL UPDATE STATEMENT: 
/*
Update command is used to update or modify the values of a column or row/rows usually with a 
WHERE clause for targeted updates.
*/
Update cust_info
set salary = 35000
where id = 3;

select * from cust_info;

Update cust_info
set salary = 8000
where salary is Null;

select * from cust_info;

#3. SQL DALETE STATEMENT
Delete from cust_info where id = 4;

#4. SQL ALTER TABLE
/*
Alter command allows you to alter(change or modify) the structure of the database.
This includes tasks like adding or dropping columns, changing column data types, 
renaming objects, or modifying constraints.
*/
#--Add column in existing Column
Alter table cust_info
Add column Age integer;

desc cust_info;


select * from cust_info;
DESC cust_info;


#--Modify/alter Column
/*
In MySQL, the MODIFY keyword is used in an ALTER TABLE statement to change the 
definition of a column in a table. When you MODIFY a column, you can change its 
data type, size, default value, and other attributes.
*/
Alter table cust_info 
modify Age int;

#desc cust_info;

#--Alter Table-Drop Column
Alter table cust_info
drop column Age;



# Truncate table statement
truncate table cust_info;

select * from cust_info;


#######################################################################################################################################################################################
############################################################################# DCL ##########################################################################################################


/*
MySQL Privileges System
------------------------
MySQL uses a privileges system to control user access to databases and database objects. 
Privileges are granted or revoked by database administrators or users with sufficient permissions, 
typically using the GRANT and REVOKE statements.

1. GRANT Statement
------------------
The GRANT statement is used to assign privileges to users. This allows a user to perform certain 
actions (like SELECT, INSERT, UPDATE, etc.) on a database or a specific table.

Syntax:
-------
GRANT privilege_type ON database.table TO 'username'@'host' IDENTIFIED BY 'password';

- privilege_type: Specifies the type of privilege (e.g., SELECT, INSERT, UPDATE, ALL PRIVILEGES).
- database.table: Specifies the database and table to which the privilege applies. Use *.* to 
  apply the privilege to all databases and tables.
- 'username'@'host': Specifies the user and host. 'host' can be 'localhost' or '%' (any host).
- IDENTIFIED BY: Optional, specifies the password for the user.
*/

/* Example 1: Granting SELECT Privilege on a Table */
GRANT SELECT, update ON notes_a_z.student TO 'DSclass'@'%';
SHOW GRANTS FOR 'DSclass'@'%';

/* Example 2: Granting All Privileges on a Database */
GRANT ALL PRIVILEGES ON notes_a_z.* TO 'DSclass'@'%';

/* Example 3: Granting Privileges and Setting a Password */
#GRANT INSERT, UPDATE ON notes_a_z.* TO 'editor_user'@'localhost' IDENTIFIED BY 'SecurePass123';

/*
2. REVOKE Statement
-------------------
The REVOKE statement removes previously granted privileges from a user.

Syntax:
-------
REVOKE privilege_type ON database.table FROM 'username'@'host';

- privilege_type: The type of privilege to revoke (e.g., SELECT, INSERT, ALL PRIVILEGES).
- database.table: Specifies the scope (database or table) from which the privilege should be 
  removed.
- 'username'@'host': Specifies the user and host from which to revoke the privilege.
*/

/* Example 1: Revoking SELECT Privilege */
REVOKE SELECT ON notes_a_z.student FROM 'DSclass'@'%';

/* Example 2: Revoking All Privileges on a Database */
REVOKE ALL PRIVILEGES ON notes_a_z.* FROM 'DSclass'@'%';


/*
3. Verifying Privileges
-----------------------
You can check the privileges granted to a user by running:

SHOW GRANTS FOR 'username'@'host';
*/

/* Example: Showing Grants for a Specific User */
SHOW GRANTS FOR 'student_user'@'localhost';


########################################################################################################################################################################################################
#########################################################################   Relational Integrity  ########################################################################################
#########################################################################             &           ################################################################################
#########################################################################     Key CONSTRAINTS     ################################################################################

/*
Relational integrity: means a combination of correctness, uniqueness, completeness, and consistency of the data. By using this integrity, we can prevent
the entry of incorrect information. Note that the Database administrator maintains the relational integrity.

Constraints: in SQL are rules or conditions applied to the data in a database table, 
ensuring data integrity and consistency. They are used to enforce certain properties 
or relationships among the data. 
*/

-- Here are some common types of constraints in SQL:
/*
1. Not Null:-
			This constraint makes sure that we can not store a null value in the column.
*/

/*
2. Unique:-
	   It tells that all the values in the column should be unique. 
*/

/*
3. Primary Key:-
			  Primary key is a field that can uniquely identify each record in a table.
              It ensured that the values in a specific column or combination of columns 
              are unique and not null.
*/

-- example:
use notes_A_Z;

Create table person(
id int primary key,
first_name varchar(25),
last_name varchar(25),
age int
);

insert into person(id, first_name, last_name, age)
values
(1, "Ram", "Mishra", 3),
(1, "Lakshya" , "Mishra", 1)
;

#drop table person;
#truncate table person;

desc person;
-- To create a primary key in an existing table:

alter table table_name
add primary key(column_name);

              -- or

alter table table_name
add constraint constraint_name primary key(col1, col2); 

-- To drop the primary key in any table:

alter table table_name
drop primary key;

select * from person;


/*
4. Foreign key:-
			  A foreign key constraint establishes a relationship between two tables. It
              ensures that the values in a specific column(s) of one table match the values 
              in a primary key column(s) of another table.
              
              A foreign key in one table (child table) is used to point "Primary key" in 
              another table(parent table).
*/

-- example:

create table student(
studentid int auto_increment,
first_name varchar(25) not null,
last_name varchar(35) not null,
age int,
primary key(studentid)
);


select * from student;
desc student;

insert into student
values
(1, "Krishna", "Naman", 31),
(2, "Ram", "Sharma", 31),
(3, "Sam", "Joe", 31);

INSERT INTO student (first_name, last_name, age) VALUES
("John", "Doe", 28),
("Emily", "Smith", 22),
("Michael", "Johnson", 25),
("Sarah", "Brown", 29),
("David", "Wilson", 26);



create table department(
studentid int ,
department_name varchar(50),
foreign key(studentid) references student(studentid)
);
desc department;

#drop table department;
insert into department(studentid, department_name)
values
(1, "Math"),
(2, "English"),
(3, "Math"),
(4, "Math"),
(5, "Computer Science"),
(6, "Math");

select first_name, department_name from student, department
where student.studentid = department.studentid;

/*
When multiple tables are listed in the FROM clause without an explicit join, SQL will first produce 
a Cartesian product (cross join) by combining every row from each listed table. It then applies the 
WHERE clause to filter the combined rows based on specified conditions, effectively achieving the 
desired join behavior.
*/
 
select * from department;
############
INSERT INTO department (studentid, department_name) VALUES
(1, 'Commerce'),
(2, 'Arts'),
(3, 'Science'),
(4, 'Arts'),
(5, 'Commerce'),
(6, 'Science'),
(7, 'Arts'),
(8, 'Science'),
(9, 'Commerce'),
(10, 'Science');


############

select * from student;
select * from department;

/*
5. Check:-
         This helps to validate the values of a column to meet a perticular condition.
*/
ALTER TABLE student
ADD CONSTRAINT chk_age CHECK (age >= 18);

INSERT INTO student (first_name, last_name, age) VALUES
("Dia", "Dutta", 16);



/*
6. Default:-
         This sets a default value for a column when no value is specified during an insert operation.
         If no value is provided, the default value is automatically used.
*/
ALTER TABLE student
MODIFY COLUMN age INT DEFAULT 18;

INSERT INTO student (first_name, last_name) 
VALUES ("Alice", "Walker");

select * from student;
SELECT * FROM STUDENT;

#####################################################################################################################################################################################################################################
##################################################################   Aggregate Functions in MySQL  #############################################################################################################
CREATE TABLE if not exists employee (
    name VARCHAR(255),
    age INT,
    salary int,
    department VARCHAR(255)
);

INSERT INTO employee (name, age, salary, department) VALUES
('Kareena Kapoor Khan', 40, 35000, 'Dancing'),
('Ranbir Kapoor', 38, 35000, 'Acting'),
('Alia Bhatt', 28, 25000, 'Acting'),
('Ajay Devgn', 52, 38000, 'Singing'),
('Shah Rukh Khan', 45, 30000, 'Acting'),
('Akshay Kumar', 53, 38000, 'Dancing'),
('Priyanka Chopra', 38, 40000, 'Acting'),
('Kangana Ranaut', 34, 28000, 'Acting'),
('Deepika Padukone', 35, 35000, 'Acting'),
('Shraddha Kapoor', 33, 28000, 'Dancing'),
('Ranveer Singh', 35, 30000, 'Dancing'),
('Anushka Sharma', 33, 32000, 'Singing'),
('Salman Khan', 50, 40000, 'Acting'),
('Amitabh Bachchan', 78, 25000, 'Acting'),
('Varun Dhawan', 34, 30000, 'Singing');


select * from employee;

select Count(age) as Count_of_age from employee; # Returns the total number of Rows in that column(s).
select Sum(salary) as Total from employee; # Returns the total of the column.
select Max(Salary) from employee where department = "Acting"; # Returns the maximum value of that row, we can apply more conditions also.
select Min(age) from employee;# where salary between 30000 and 40000; # Returns the minimum value of that row, we can apply more conditions also.
select Avg(age) from employee; # Returns the average of the column.
select round(Avg(Age),0) from employee; # Returns the average age of all employees, rounded to one decimal place.


###############################################################################################################################################################################################################
##########################################################################        Clauses in MySQL       #############################################################################################################

-- Group By:
/*
The group by statement group rows that have the same values into summary rows.
It is often used with aggregete functions like count(), sum(), min(), max(), avg()
to group the result-set by one or more columns.
*/
-- Eg.:

Use notes_a_z;

create table group_tbl(
cust_id int,
amount int,
mode varchar(20),
payment_date date
);

INSERT INTO group_tbl (cust_id, amount, mode, payment_date) VALUES
(1, 100, 'Cash', '2024-04-01'),
(2, 150, 'Credit Card', '2024-04-02'),
(3, 200, 'Debit Card', '2024-04-03'),
(4, 120, 'Mobile Payment', '2024-04-04'),
(5, 180, 'Cryptocurrency', '2024-04-05'),
(6, 220, 'Cash', '2024-04-06'),
(7, 130, 'Debit Card', '2024-04-07'),
(8, 190, 'Credit Card', '2024-04-08'),
(9, 250, 'Cash', '2024-04-09'),
(10, 140, 'PayPal', '2024-04-10'),
(11, 110, 'Credit Card', '2024-04-11'),
(12, 160, 'Debit Card', '2024-04-12'),
(13, 230, 'Cash', '2024-04-13'),
(14, 200, 'Mobile Payment', '2024-04-14'),
(15, 210, 'Cryptocurrency', '2024-04-15');


select * from group_tbl;

# Write a SQL query to calculate the total amount collected for each payment mode in the group_tbl table. 
# Sort the results by the total amount in ascending order.

select mode, max(amount) as total 
from group_tbl 
; # Wrong code

select mode, max(amount) as total 
from group_tbl 
where mode = "cash"
group by mode order by total;


select * from group_tbl;

#order by total;

-- Having
/*
The having clause is used to apply a filter on the result of Group By based on the 
specified condition.
The Where clause places conditions on the selected columns, whereas the Having clause 
places condition on groups created by the Group By clause.

Syntax:
		Select column_name(s)
        from table_name
        Where condition(s)
        Group By column_name(s)
        Having condition(s)
*/
select mode, sum(amount) as total
from group_tbl
group by mode
having total > 400
order by total;

#################################################################################################################################################################################
########################################################################     Operators in MySQL   ##################################################################################################
-- Create a sample table
CREATE TABLE Employees (
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Salary) VALUES
(1, 'Alice', 'Smith', 30, 50000),
(2, 'Bob', 'Johnson', 35, 55000),
(3, 'Charlie', 'Williams', 40, 60000),
(4, 'David', 'Brown', 28, 45000),
(5, 'Emma', 'Jones', 30, 52000),
(6, 'Frank', 'Garcia', 45, 67000),
(7, 'Grace', 'Martinez', 29, 48000),
(8, 'Hannah', 'Rodriguez', 49, 72000);

truncate table employees;
select * from employees;
 
-- Examples of different operators:

-- 1. Arithmetic Operators
SELECT EmployeeID, Salary, Salary + 5000 AS SalaryIncrease FROM Employees; -- Addition
SELECT EmployeeID, Salary, Salary - 2000 AS SalaryDecrease FROM Employees; -- Subtraction
SELECT EmployeeID, Salary, Salary * 1.1 AS SalaryBonus FROM Employees; -- Multiplication
SELECT EmployeeID, Salary, Salary / 2 AS HalfSalary FROM Employees; -- Division
SELECT EmployeeID, Salary, Salary % 10000 AS Remainder FROM Employees; -- Modulus

-- 2. Comparison Operators
SELECT * FROM Employees WHERE Age = 30; -- Equal to
SELECT * FROM Employees WHERE Age <> 30; -- Not equal to
SELECT * FROM Employees WHERE Age > 30; -- Greater than
SELECT * FROM Employees WHERE Age < 30; -- Less than
SELECT * FROM Employees WHERE Age >= 30; -- Greater than or equal to
SELECT * FROM Employees WHERE Age <= 30; -- Less than or equal to

-- 3. Logical Operators
SELECT * FROM Employees WHERE Age > 30 AND Salary > 50000; -- AND
SELECT * FROM Employees WHERE Age > 30 OR Salary > 50000; -- OR
SELECT * FROM Employees WHERE NOT (Age > 30); -- NOT

-- 4. BETWEEN Operator
SELECT * FROM Employees WHERE Age BETWEEN 30 AND 40;

-- 5. IN Operator
SELECT * FROM Employees WHERE FirstName IN ('Alice', 'David', 'Grace');

-- 6. LIKE Operator
SELECT * FROM Employees WHERE LastName LIKE 'S%'; -- LastName starts with 'S'
SELECT * FROM Employees WHERE FirstName LIKE '%a'; -- FirstName ends with 'a'

-- 7. IS NULL Operator
SELECT * FROM Employees WHERE Salary IS NULL;

-- 8. Aggregate Functions with GROUP BY
SELECT Age, COUNT(*) AS TotalEmployees FROM Employees GROUP BY Age;

-- 9. ORDER BY
SELECT * FROM Employees ORDER BY Salary DESC; -- Order by Salary in descending order
SELECT * FROM Employees ORDER BY Age ASC; -- Order by Age in ascending order





##########################################################################################################################################################################
############################################################################  Index in SQL  ####################################################################################
select * from employee;

create index emp_index 
on employee(name);

desc employee;

alter table employee 
drop index emp_index;

##########################################################################################################################################################################
############################################################################  Subquery  ####################################################################################
/*
A Subquery is a select statement with another statement. In MySQL, a Subquery can be
simply defined as a query within another query. It allows us to create a complex query
on the output of another query.

The main advanteges of a subqueries are:

--> They allow queries that are structured so that it is possible to isolate each 
	part of a statement.

--> They provide alternative ways to perform operations that would otherwise require
	complex joins and unions.

Syntax:
		Select column_name(s)
        from table_name
        where column_name operator
        (Select column_name from table_name where condition);
*/
-- Eg.:

Use notes_a_z;
create table Sub_q(
cust_id int,
amount int,
mode varchar(20),
payment_date date
);

INSERT INTO sub_q (cust_id, amount, mode, payment_date) VALUES
(1, 100, 'Cash', '2024-04-01'),
(2, 150, 'Credit Card', '2024-04-02'),
(3, 200, 'Debit Card', '2024-04-03'),
(4, 120, 'Mobile Payment', '2024-04-04'),
(5, 180, 'Cryptocurrency', '2024-04-05'),
(6, 220, 'Cash', '2024-04-06'),
(7, 130, 'Debit Card', '2024-04-07'),
(8, 190, 'Credit Card', '2024-04-08'),
(9, 250, 'Cash', '2024-04-09'),
(10, 140, 'PayPal', '2024-04-10'),
(11, 110, 'Credit Card', '2024-04-11'),
(12, 160, 'Debit Card', '2024-04-12'),
(13, 230, 'Cash', '2024-04-13'),
(14, 200, 'Mobile Payment', '2024-04-14'),
(15, 210, 'Cryptocurrency', '2024-04-15');


select * from sub_q;

select avg(amount) from sub_q;

select * from sub_q
where amount > 172.6667;

INSERT INTO sub_q (cust_id, amount, mode, payment_date) VALUES
(16, 1000, 'Cash', '2024-04-01'),
(17, 1500, 'Credit Card', '2024-04-02');

INSERT INTO sub_q (cust_id, amount, mode, payment_date) VALUES
(18, 10, 'Cash', '2024-04-01'),
(19, 15, 'Credit Card', '2024-04-02');

select * from sub_q
where amount > (select avg(amount) from sub_q);


####  Subquery using Logical (In) operator:

/*
Assume that we do have another table named sub_q2, there is also a same column cust_id.
The matching cust_id in both columns contain the information about same person. Now I want 
all the data from sub_q table and the First name and Last name from sub_q2 of thoes pepole who
whoes cust_id is present in both the tables:    
*/
create table sub_q2(
	cust_id int,
    First_name varchar(30),
    Last_name varchar(30)
    );
    
INSERT INTO sub_q2 (cust_id, First_name, Last_name) VALUES
(3, 'Aarav', 'Patel'),
(17, 'Aanya', 'Shah'),
(5, 'Advait', 'Kumar'),
(19, 'Aishwarya', 'Gupta'),
(12, 'Arjun', 'Singh');

select * from sub_q;
select * from sub_q2;

Select *
from sub_q, sub_q2
where sub_q.cust_id in (select cust_id from sub_q2);

#### Subquery using Logical (Exists) operator:

#Write a query to find all first names from sub_q2 where the cust_id exists in sub_q.

SELECT cust_id, First_name, Last_name
FROM sub_q2
WHERE EXISTS (
    SELECT 1
    FROM sub_q
    WHERE sub_q.cust_id = sub_q2.cust_id
);



# retrieves all students who belong to the 'Science' department

SELECT * FROM student;
SELECT * FROM department;

SELECT studentid FROM department WHERE department_name = 'Science';

SELECT *
FROM student
WHERE studentid IN (3,6,8,10);

SELECT *
FROM student
WHERE studentid IN (SELECT studentid FROM department WHERE department_name = 'Science');


###############################################################################################################################################################################################################
#############################################################################        Regular Expressions       #############################################################################################################

use notes_A_Z;

-- Creating the 'users' table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(20),
    username VARCHAR(255)
);

-- Inserting sample data into the 'users' table
INSERT INTO users (name, email, phone_number, username) VALUES
('Alice', 'alice@gmail.com', '1234567890', 'alice123'),
('Bob', 'bob@yahoo.com', '2345678901', 'bob_456'),
('Charlie', 'charlie@gmail.com', '3456789012', 'charlie789'),
('David', 'david@outlook.com', '4567890123', 'david000'),
('Eve', 'eve@gmail.com', '5678901234', 'eve_admin');

select * from users;

-- Creating the 'products' table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(255),
    description TEXT
);

-- Inserting sample data into the 'products' table
INSERT INTO products (code, description) VALUES
('A123', 'This is the first product description.'),
('B456', 'This product description includes numbers: 12345'),
('C789', 'Another product with a different code.'),
('A321', 'Yet another product description with the code A321.'),
('B654', 'Product description for B654.');

select * from products;

-- Creating the 'orders' table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(50)
);

-- Inserting sample data into the 'orders' table
INSERT INTO orders (status) VALUES
('active'),
('pending'),
('completed'),
('active'),
('pending');

select * from orders;
select * from products;
select * from users;


-- Queries using regex

-- Basic Pattern Matching
-- This query selects all rows where the 'email' column contains the string 'gmail'.
SELECT * FROM users WHERE email REGEXP 'gmail';

-- Anchors
-- This query selects all rows where the 'name' column starts with 'A'.
SELECT * FROM users WHERE name REGEXP '^A';

-- This query selects all rows where the 'name' column ends with 'e'.
SELECT * FROM users WHERE name LIKE '%e';


-- Basic Pattern Matching
-- This query selects all rows where the 'email' column contains the string 'gmail'.
SELECT * FROM users WHERE email REGEXP 'gmail';

-- Anchors
-- This query selects all rows where the 'name' column starts with 'A'.
SELECT * FROM users WHERE name REGEXP '^A';

-- This query selects all rows where the 'name' column ends with 'son'.
SELECT * FROM users WHERE name REGEXP 'son$';

-- Character Classes and Ranges
-- This query selects all rows where the 'phone_number' column contains any digit.
SELECT * FROM users WHERE phone_number REGEXP '[0-9]';
SELECT * FROM users WHERE username REGEXP '[0-9]';



-- Predefined Character Classes
-- This query selects all rows where the 'username' column contains any alphanumeric character.
SELECT * FROM users WHERE username REGEXP '\\w';

-- Quantifiers
-- This query selects all rows where the 'code' column contains one or more digits.
SELECT * FROM products WHERE code REGEXP '\\d+';

-- Alternation
-- This query selects all rows where the 'status' column is either 'active' or 'pending'.
SELECT * FROM orders WHERE status REGEXP 'active|pending';

-- Grouping
-- This query selects all rows where the 'code' column starts with 'A' or 'B', followed by one or more digits.
SELECT * FROM products WHERE code REGEXP '^(A|B)\\d+';

-- Negation
-- This query selects all rows where the 'name' column does not start with a vowel (A, E, I, O, U).
SELECT * FROM users WHERE name REGEXP '^[^AEIOUaeiou]';

-- Using REGEXP_REPLACE (available from MySQL 8.0)
-- This query replaces all digits in the 'description' column with an asterisk '*' and selects the modified column.
SELECT REGEXP_REPLACE(description, '\\d', '*') AS modified_description FROM products;



###############################################################################################################################################################################################################
##########################################################################        Views       #############################################################################################################
/*
view is a virtual table based on the result set of an sql query. A view is a database 
object that represents a virtual table based on the result-set of an SQL query. A view 
contains rows and columns, just like a real table, but does not store any data of its 
own. Instead, it displays the data from one or more underlying tables.
*/

/* Syntax to create a Table: 
                            create table table_name(
                            col_1 datatype constraint, 
                            col_2 datatype constraint, 
                            .......,
                            .......,
                            col_n datatype constraint
                            );
*/
 
create table student(
studentid int auto_increment,
first_name varchar(25) not null,
last_name varchar(35) not null,
age int,
primary key(studentid)
);

#ALTER TABLE department DROP FOREIGN KEY department_ibfk_1;

#drop table student;
select * from student;
desc student;

insert into student
values
(1, "Krishna", "Naman", 31),
(2, "Ram", "Sharma", 31),
(3, "Sam", "Joe", 31);

INSERT INTO student (first_name, last_name, age) VALUES
("John", "Doe", 28),
("Emily", "Smith", 22),
("Michael", "Johnson", 25),
("Sarah", "Brown", 29),
("David", "Wilson", 26);



create table department(
student_id int ,
department_name varchar(50),
foreign key(student_id) references student(studentid)
);

desc department;

#drop table department;
insert into department
values
(1, "Math"),
(2, "English"),
(3, "Math"),
(4, "Math"),
(5, "Computer Science"),
(6, "Math"),
(7, "Biology");


select * from student;
select * from department;

create view stud_info as
select student.first_name, department.department_name
from student, department
where student.studentid = department.student_id;

select * from stud_info;


create view std_view  as select * from student;


create view stud_det as
select first_name, age
from student 
where age < 30;

select * from stud_det;

CREATE VIEW student_info AS
SELECT s.studentid, s.first_name, s.last_name, s.age, d.department_name
FROM student s
LEFT JOIN department d ON s.studentid = d.student_id
WHERE s.age >= 25;

select * from student_info;
drop view stud_info;



##############################################################################################################################################################################
###################################################################    JOIN in MySQL     #################################################################################

use notes_A_Z;


/*
In MySQL, a JOIN is a clause used to combine rows from two or more tables based on
a related column between them. It allows you to retrieve data from multiple tables 
simultaneously by specifying how the tables are related.
*/

#    inner join 
/*
Returns records that have maching values in both tables. An INNER JOIN in MySQL is a type 
of join that combines rows from two or more tables based on a related column between them. 
*/
select * from student;
select * from department;

select student.first_name, department.department_name from student inner join department
on student.studentid = department.student_id;

select * from department  inner join student
on student.studentid = department.student_id;


#    left join
/*
A LEFT JOIN, also known as a LEFT OUTER JOIN, in MySQL is a type of join that returns all 
rows from the left table and the matched rows from the right table. If there are no matching 
rows in the right table, NULL values are returned for the columns of the right table.
*/

select * from student left join department
on student.studentid = department.student_id;

select * from department  left join student
on student.studentid = department.student_id;

#     right join
/*
A RIGHT JOIN, also known as a RIGHT OUTER JOIN, in MySQL is a type of join that returns all 
rows from the right table and the matched rows from the left table. If there are no matching 
rows in the left table, NULL values are returned for the columns of the left table.
*/
select * from student right join department
on student.studentid = department.student_id;

select * from department  right join student
on student.studentid = department.student_id;

#     full join
/*
In MySQL, there's no direct FULL JOIN syntax. However, you can emulate it using a combination of 
LEFT JOIN and RIGHT JOIN, and then combining the results using the UNION operator. 
*/

select * from student left join department
on student.studentid = department.student_id

union

select * from student right join department
on student.studentid = department.student_id;

/*
The main difference between UNION and UNION ALL in MySQL is that UNION removes duplicate rows from 
the combined result sets, while UNION ALL includes all rows, including duplicates. UNION ALL generally 
performs faster due to less processing.
*/

#     cross join
/*
A CROSS JOIN in MySQL combines every row from one table with every row from another table, resulting 
in a Cartesian product of the two tables. 
*/

select * from student cross join department;

SELECT *
FROM department;

SELECT *
FROM student
NATURAL JOIN department;


SELECT *
FROM student;


# Self join
/*
A self join in MySQL is a type of join where a table is joined with itself. It's useful when you want 
to compare rows within the same table or when you want to retrieve hierarchical data stored in a table.
*/
create table emp(
emp_id int,
emp_name varchar(25),
manager_id int
);

insert into emp(emp_id, emp_name, manager_id)
values
(1, "Aman", 3),
(2, "Diksha", 4),
(3, "Mohan", 2),
(4, "Sarita", 3)
;

select * from emp;


select t1.emp_name as employee_name, t2.emp_name as manager_name 
from emp as t1
join emp as t2
on t2.emp_id = t1.manager_id;



########################################################################################################################################################################
#######################################################################    Triggers   ##################################################################################
use notes_a_z;

###
/*
In MySQL, triggers are database objects that automatically execute a specified set of actions 
in response to specific events on a table, such as INSERT, UPDATE, or DELETE operations. 
Triggers are primarily used to enforce business rules, maintain audit trails, 
and automate certain database tasks, helping to ensure data integrity and consistency.

Key Concepts of Triggers:

1. Types of Triggers:
   - BEFORE Trigger: Executes before the specified operation on the table (e.g., BEFORE INSERT). 
     Useful for validation checks or modifying data before it is inserted or updated.
   - AFTER Trigger: Executes after the specified operation (e.g., AFTER UPDATE). Commonly used 
     for logging actions, maintaining audit trails, or cascading changes to other tables.

2. Trigger Events:
   - INSERT: Triggered when new data is inserted into the table.
   - UPDATE: Triggered when data is modified.
   - DELETE: Triggered when data is removed from the table.

3. Syntax of Triggers:
   A basic syntax for creating a trigger:
   CREATE TRIGGER trigger_name
   {BEFORE | AFTER} {INSERT | UPDATE | DELETE}
   ON table_name
   FOR EACH ROW
   BEGIN
       -- SQL statements to execute
   END;

4. Accessing Old and New Values:
   Triggers can access both the old and new values of data through the OLD and NEW keywords. 
   For example, in an UPDATE trigger, OLD.column_name refers to the original value, 
   while NEW.column_name refers to the updated value.

5. Use Cases for Triggers:
   - Data Validation: Enforcing constraints or rules before data is saved.
   - Audit Trail: Automatically recording changes to certain tables by logging INSERT, UPDATE, 
     and DELETE actions in a separate audit table.
   - Automatic Calculations: Adjusting related data automatically when certain fields are updated.
   - Cascading Operations: Ensuring changes to one table propagate to others, such as updating 
     inventory when a sale is made.

Limitations of Triggers:
While powerful, triggers come with limitations:
   - Performance Overhead: Triggers may slow down data modification operations, 
     especially with complex logic.
   - Debugging Complexity: Errors in trigger logic can be challenging to debug.
   - Restricted Usage in Views: Triggers are not supported for views in MySQL.

Example Trigger:
Here is a trigger example that logs changes to an employees table:
CREATE TRIGGER after_employee_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_log (emp_id, old_salary, new_salary, change_date)
    VALUES (OLD.emp_id, OLD.salary, NEW.salary, NOW());
END;
In this example, whenever an employee's salary is updated, the change is logged in the employee_log table.

Triggers are a versatile tool for maintaining database integrity and ensuring business logic is 
followed within the database itself.
*/

###

# Before insert 

create table triggers_t(id int,
name varchar(30),
age int,
age_status varchar(25));

desc  triggers_t;
#drop table triggers_t;
insert into triggers_t(id, name, age, age_status)
values
(1,"mohan", 17, "child");

select * from triggers_t;
select * from triggers_t2;

Delimiter //
create trigger give_age_status
before insert on triggers_t
for each row
begin
	if new.age < 18 then
		set new.age_status = "child";
	elseif new.age >= 18 and new.age <= 60 then
		set new.age_status = "adult";
	else 
		set new.age_status = "senior_citizen";
	end if;
end //
Delimiter ;
/*
How NEW and OLD Work
NEW: Refers to the new values of the columns that are about to be inserted or updated. This is available in INSERT and UPDATE triggers.
OLD: Refers to the existing values of the columns before an update or deletion. This is available in UPDATE and DELETE triggers.
*/


insert into triggers_t(id, name)
values(2,"Harshit");
select * from triggers_t;

insert into triggers_t(id, age)
values(3,33),
(4,56),
(5,67);

##  After insert

select * from triggers_t;
select * from triggers_t2;

create table triggers_t2(message_id int, message varchar(300));
#drop trigger get_null_age;


DELIMITER //
CREATE TRIGGER get_null_age
AFTER INSERT ON triggers_t
FOR EACH ROW
BEGIN
    IF NEW.age IS NULL THEN
        INSERT INTO triggers_t2 (message_id, message)
        VALUES (NEW.id, CONCAT('Hi ', NEW.name, "Please enter your age sir/mam."));
    END IF;
END //
DELIMITER ;


insert into triggers_t(id, name, age_status)
values
(10," mohan", "child");

select * from triggers_t2;

### Before update

-- This BEFORE UPDATE trigger will update the age_status based on the new value of age before the update is applied to the triggers_t table.

select * from triggers_t;
select * from triggers_t2;

DELIMITER //

CREATE TRIGGER before_update_age_status
BEFORE UPDATE ON triggers_t
FOR EACH ROW
BEGIN
    -- Check if the new age is less than 18
    IF NEW.age < 18 THEN
        SET NEW.age_status = 'child';
    ELSEIF NEW.age BETWEEN 18 AND 60 THEN
        SET NEW.age_status = 'adult';
    ELSE
        SET NEW.age_status = 'senior_citizen';
    END IF;
END //

DELIMITER ;

select * from triggers_t;

UPDATE triggers_t
SET age = 34
WHERE id = 1;

### After update

DELIMITER //

CREATE TRIGGER after_update_log
AFTER UPDATE ON triggers_t
FOR EACH ROW
BEGIN
    -- Log the age update in triggers_t2
    INSERT INTO triggers_t2 (message_id, message)
    VALUES (NEW.id, CONCAT('User ID ', NEW.id, ' had their age updated to ', NEW.age, '.'));
END //

DELIMITER ;

UPDATE triggers_t
SET age = 30
WHERE id = 2;

select * from triggers_t;
select * from triggers_t2;


### Before Delete
select * from triggers_t;
select * from triggers_t2;

DELIMITER //

CREATE TRIGGER before_delete_log
BEFORE DELETE ON triggers_t
FOR EACH ROW
BEGIN
    -- Log a message in triggers_t2 before deletion
    INSERT INTO triggers_t2 (message_id, message)
    VALUES (OLD.id, CONCAT('User ID ', OLD.id, ' is about to be deleted.'));
END //

DELIMITER ;

DELETE FROM triggers_t
WHERE id = 2;

### After Delete

DELIMITER //

CREATE TRIGGER after_delete_log
AFTER DELETE ON triggers_t
FOR EACH ROW
BEGIN
    -- Log a message in triggers_t2 after deletion
    INSERT INTO triggers_t2 (message_id, message)
    VALUES (OLD.id, CONCAT('User ID ', OLD.id, ' has been deleted.'));
END //

DELIMITER ;

DELETE FROM triggers_t
WHERE id = 5;

select * from triggers_t;
select * from triggers_t2;

#############################################################################################################################################################################
############################################################################   Union   ####################################################################################
/*
The MySQL UNION clause/operator is used to combine/concatenate the results of two or more SELECT statements 
without returning any duplicate rows and keeps unique records.

To use UNION clause, each select statement must have:
1. The same number of columns selected and expressions
2. The same data type and
3. Have them in the same order.

Syntax:

Select column_name(s) from Table_A
Union
Select column_name(s) from Table_B;

### Union All :>
In Union All everything is same as Union, it combines/concatenate two or more table but keeps all records including 
duplicates.
*/

create table if not exists U1(
name varchar(25),
age int
);

insert into U1
values
("A", 20),
("B", 21),
("C", 22),
("D", 23),
("E", 24);

select * from U1;

create table if not exists U2(
name varchar(25),
age int
);

insert into U2
values
("A", 20),
("F", 21),
("G", 22);
#truncate table u2;

select * from U1;
select * from U2;

select * from U1
Union
select * from U2;

select * from U1 where age > 20
Union 
select * from U2;

########################################################################################################################################################################
#######################################################################    Window Function   ##################################################################################

/*
Window Function:-
A window function, in the context of database and data preprocessing, is a mathematical/analytical
function applied to a set of rows in a query result. Unlike aggregate function like SUM(), COUNT(), etc.
Window functions applies aggregate and ranking functions over a particular window (set of rows). 
OVER clause is used with window functions to define that window.

Expression:-
is the name of the column that we want the window function operated on. This may not be necessary 
depending on the window function is used.

Over:-
is just to signify that this is a window function.

Partition By:-
divides the rows into partitions so we can specify which rows to use to compute the window function.

Order By:-
is used so that we can order the rows within each partition. This is optional and does not have to be
specifies.

Rows:-
can be used if we want to further limit the rows within our partition. This is optional and 
usually not used.
*/

## Types of WINDOW FUNCTION:-
/*
There is no official division of the SQL window functions into categories but high level we 
can divide into three types:
.____________________________________________________________________________________________________.
|                             |                                |                                     |
| Aggregate:                  |     Ranking:                   |     Value/Analytic:                 |
|		   1. SUM()           |            1. ROW_number       |                   1. LEAD           |
|          2. AVG()           |            2. RANK             |                   2. LAG            |
|          3. COUNT()         |            3. DENSE_RANK       |                   3. FIRST_VALUE    |
|		   4. MIN()           |            4. PERFECT_RANK     |                   4. LAST_VALUE     | 
|		   5. MAX()           |                                |                                     |
|.............................|................................|.....................................|

*/

## Aggregate:-
/*
SUM(): Calculates the sum of a set of values.

AVG(): Calculates the average of a set of values.

COUNT(): Counts the number of rows in a set.

MIN(): Returns the minimum value in a set.

MAX(): Returns the maximum value in a set.
*/

## Ranking:-
/*
ROW_NUMBER(): Assigns a unique sequential integer to each row within its partition, regardless of the values.

RANK(): Assigns a unique rank to each row within its partition, with the same rank for identical values.

DENSE_RANK(): Assigns a consecutive rank to rows within a partition without leaving gaps, handling ties uniquely.

PERCENT_RANK(): Assigns the relative rank of each row within a partition, expressed as a percentile.a
*/

## Value/Analytic:-
/*
LEAD(): Retrieves the value from the next row within the partition, based on the specified ordering. It allows 
        you to access data from subsequent rows without using a self-join or subquery.
        
LAG():  Retrieves the value from the previous row within the partition, based on the specified ordering. It 
		allows you to access data from preceding rows without using a self-join or subquery.
        
FIRST_VALUE(): Retrieves the value of a specified expression from the first row within the partition, based 
               on the specified ordering. It allows you to access the first value without using a self-join 
               or subquery.
               
LAST_VALUE(): Retrieves the value of a specified expression from the last row within the partition, based on 
              the specified ordering. It allows you to access the last value without using a self-join or subquery.
*/

#Example:-
create table window_fun(
new_id int,
new_cat varchar(20)
);

#drop table window_fun;

Insert into window_fun
Values
(90, "Agni");

Insert into window_fun
Values
(100, "Agni"),
(200, "Agni"),
(500, "Dharti"),
(700, "Dharti"),
(200, "Vayu"),
(300, "Vayu"),
(500, "Vayu")
;
select * from window_fun;

-- Aggregate:

select new_id, new_cat,
sum(new_id) over(Partition by new_cat order by new_id) AS "Total"
from window_fun;

select new_id, new_cat,
SUM(new_id) over(Partition by new_cat order by new_id) AS "Total"
from window_fun;


-- Ranking:

select new_id, new_cat,
row_number() over(order by new_id) as "Row_number"
from window_fun;

select new_id, new_cat,
rank() over(order by new_id) as "Rank"
from window_fun;

select new_id,
DENSE_RANK() over(order by new_id) as "DENSE_RANK"
from window_fun;

select new_id,
percent_rank() over(order by new_id) as "Row_number"
from window_fun;

-- Value/Analytic:

select new_id, new_cat,
lag(new_id) over(order by new_id) as "Lead"
from window_fun;



########################################################################################################################################################################
#######################################################################    CTE in MySQL   ##################################################################################

-- COMMON TABLE EXPRESSION (CTE):-
/*
A common table expression, or CTE is a temporary named result set created from a simple select
statement that can be used in a subsequent select statement.

We can define CTEs by adding a WITH clause directly before 
SELECT, INSERT, UPDATE , DELETE, OR MERGE statement.

The WITH clause can include one or more CTEs seperated by commas.

Syntax-->
------------------------------
.		WITH my_cte as(      -
.		SELECT a,b,c         -------> CTE query
.			FROM table)		 -
------------------------------
.		SELECT a,c  		 ------->Main
.        FROM my_cte;		 ------->query
------------------------------
*/
use notes_a_z;

create table pay_cte(
cust_id_1 int primary key,
amount int,
mode varchar(20),
payment_date date
);

DESC pay_cte;

INSERT INTO pay_cte (cust_id_1, amount, mode, payment_date) VALUES
(1, 100, 'Cash', '2024-04-01'),
(2, 150, 'Credit Card', '2024-04-02'),
(3, 200, 'Debit Card', '2024-04-03'),
(4, 120, 'Mobile Payment', '2024-04-04'),
(5, 180, 'Cryptocurrency', '2024-04-05'),
(6, 220, 'Cash', '2024-04-06'),
(7, 130, 'Debit Card', '2024-04-07'),
(8, 190, 'Credit Card', '2024-04-08'),
(9, 250, 'Cash', '2024-04-09'),
(10, 140, 'PayPal', '2024-04-10'),
(11, 110, 'Credit Card', '2024-04-11'),
(12, 160, 'Debit Card', '2024-04-12'),
(13, 230, 'Cash', '2024-04-13'),
(14, 200, 'Mobile Payment', '2024-04-14'),
(15, 210, 'Cryptocurrency', '2024-04-15');

select * from pay_cte;

create table pay_info(
cust_id_2 int,
first_name varchar(25),
last_name varchar(25),
address_id int
);

INSERT INTO pay_info (cust_id_2, first_name, last_name, address_id) VALUES
(3, 'Emily', 'Brown', 101),
(9, 'Christopher', 'Taylor', 102),
(5, 'John', 'Doe', 103),
(12, 'Alice', 'Smith', 104),
(14, 'Sarah', 'Anderson', 105),
(2, 'James', 'Williams', 106),
(10, 'David', 'Martinez', 107);

SELECT * from pay_info;

WITH sam_cte AS (
SELECT *,
AVG(amount) OVER(ORDER BY pay_cte.cust_id_1) AS "Average_Price",
COUNT(address_id) OVER(ORDER BY pay_info.cust_id_2) AS "Count"
FROM pay_cte
INNER JOIN pay_info 
ON pay_cte.cust_id_1 = pay_info.cust_id_2
)
SELECT cust_id_1, first_name, last_name, address_id
FROM sam_cte;


SELECT first_name, last_name, address_id
FROM bharti_cte; 


SELECT *,
AVG(amount) OVER(ORDER BY pay_cte.cust_id_1) AS "Average_Price",
COUNT(address_id) OVER(ORDER BY pay_info.cust_id_2) AS "Count"
FROM pay_cte
INNER JOIN pay_info 
ON pay_cte.cust_id_1 = pay_info.cust_id_2;


# Another example  of CTE

CREATE TABLE emp_cte(
	emp_id int,
    emp_name varchar(25),
    salary int
    );
    
INSERT into emp_cte
VALUES
(101, "Mohan", 40000),
(102, "James", 50000),
(103, "Robin", 60000),
(104, "Carol", 70000),
(105, "Alice", 80000),
(106, "Jimmy", 90000);

DESC emp_cte;
SELECT * FROM emp_cte;

-- Fetch the employees who earn more then average salary of all employees
-- Without using WITH clause-->

SELECT emp_id, emp_name as emp_more_then_avg
FROM emp_cte
WHERE salary > (SELECT avg(salary) from emp_cte);
SELECT avg(salary) from emp_cte;

-- With WITH clause-->

WITH avg_salary (avg_sal) as
	(SELECT avg(salary) from emp_cte)
SELECT *
from emp_cte, avg_salary
where emp_cte.salary > avg_salary.avg_sal;

SELECT * from emp_cte;


# Another example

create table sales
(
	store_id  		int,
	store_name  	varchar(50),
	product			varchar(50),
	quantity		int,
	cost			int
);
insert into sales values
(1, 'Apple Originals 1','iPhone 12 Pro', 1, 1000),
(1, 'Apple Originals 1','MacBook pro 13', 3, 2000),
(1, 'Apple Originals 1','AirPods Pro', 2, 280),
(2, 'Apple Originals 2','iPhone 12 Pro', 2, 1000),
(3, 'Apple Originals 3','iPhone 12 Pro', 1, 1000),
(3, 'Apple Originals 3','MacBook pro 13', 1, 2000),
(3, 'Apple Originals 3','MacBook Air', 4, 1100),
(3, 'Apple Originals 3','iPhone 12', 2, 1000),
(3, 'Apple Originals 3','AirPods Pro', 3, 280),
(4, 'Apple Originals 4','iPhone 12 Pro', 2, 1000),
(4, 'Apple Originals 4','MacBook pro 13', 1, 2500);

select * from sales;
-- Find stores who's sales were better then the average sales accross all stores
#1.) Total sales per each store -- Total_sales_per_store

SELECT store_id,  
sum(cost) as Total_sales_per_store
FROM sales
group by store_id;
 
#2.) Find the average sales with respect all the stores -- Avg_sales

SELECT avg(Total_sales_per_store) as avg_sales_for_all_stores
FROM (SELECT store_id,  
sum(cost) as Total_sales_per_store
FROM sales
group by store_id) as X;

#3.) Find the stores where Total_sales > Avg_sales
SELECT *
from	(SELECT store_id,  
		sum(cost) as Total_sales_per_store
		FROM sales
		group by store_id) As total_sales
join	(SELECT avg(Total_sales_per_store) as avg_sales_for_all_stores
		FROM (SELECT store_id,  
		sum(cost) as Total_sales_per_store
		FROM sales
		group by store_id) as X) AS avg_sales
	ON total_sales.Total_sales_per_store > avg_sales.avg_sales_for_all_stores;


-- Now i'll do all 3 steps in 1 step using "WITH" clause ---

WITH total_sales (store_id, Total_sales_per_store) AS
		(SELECT store_id,  
		sum(cost) as Total_sales_per_store
		FROM sales
		group by store_id),
	 avg_sales (avg_sales_for_all_stores) as
		(SELECT avg(Total_sales_per_store) as avg_sales_for_all_stores
		FROM total_sales)
SELECT * 
from total_sales
join avg_sales
ON total_sales.Total_sales_per_store > avg_sales.avg_sales_for_all_stores;

# Data from Python to SQL

Show databases;
create database education;
use education;

select * from data;




################ Read local data ###################################



SHOW VARIABLES LIKE 'datadatasecure_file_priv';

CREATE TABLE education (
    datasrno INT,
    workex int,
    gmat int
);

LOAD DATA INFILE "C:\Users\gauta\OneDrive\Desktop\360DigiTMG\EDA\InClass_DataPreprocessing_datasets\education.csv"
INTO TABLE education
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from data;

USE notes_a_z;

CREATE TABLE IF NOT EXISTS education (
    datasrno INT,
    workex INT,
    gmat INT
);

LOAD DATA INFILE 'C:\\Users\\gauta\\OneDrive\\Desktop\\360DigiTMG\\EDA\\InClass_DataPreprocessing_datasets\\education.csv'
INTO TABLE education
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;











