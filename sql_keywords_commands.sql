show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| school_db          |
| sys                |
+--------------------+

 use school_db

show tables;
+---------------------+
| Tables_in_school_db |
+---------------------+
| customer1           |
| customer4           |
| customers           |
| employee            |
| students            |
+---------------------+

-- create database 
create database store;

--delete tables

DROP TABLE employee;  --name of  table

--delete database

DROP DATABASE database_name;

--  Table Creation (DDL – Data Definition Language)


create table customer5(
     acc_no int primary key auto_increment,
	name  varchar(50) not null,
    acc_type varchar(50) not null default  "saving");

// describes table 

desc customer5;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| acc_no   | int         | NO   | PRI | NULL    | auto_increment |
| name     | varchar(50) | NO   |     | NULL    |                |
| acc_type | varchar(50) | NO   |     | saving  |                |
+----------+-------------+------+-----+---------+----------------+

-- Insert Data (DML – Data Manipulation Language)

 insert into customer5(name)
 values ("Ganesh"),("Veer"),("Akash");
select * from customer5;
+--------+--------+----------+
| acc_no | name   | acc_type |
+--------+--------+----------+
|      1 | Ganesh | saving   |
|      2 | Veer   | saving   |
|      3 | Akash  | saving   |
+--------+--------+----------+

--UPDATE Clause

select * from students;
+------+------+-------+---------+
| id   | name | class | contact |
+------+------+-------+---------+
|  101 | Paul |     5 |      34 |
|  102 | Alex |     8 |      34 |
|  103 | Raju |    10 |      34 |
|  104 | Sham |     6 |      34 |
+------+------+-------+---------+


update  students
    set contact=134
     where name ="raju";  

select * from students;
+------+------+-------+---------+
| id   | name | class | contact |
+------+------+-------+---------+
|  101 | Paul |     5 |      34 |
|  102 | Alex |     8 |      34 |
|  103 | Raju |    10 |     134 |
|  104 | Sham |     6 |      34 |
+------+------+-------+---------+

--delete clause 

select * from students;
+------+------+-------+---------+
| id   | name | class | contact |
+------+------+-------+---------+
|  101 | Paul |     5 |      34 |
|  102 | Alex |     8 |      34 |
|  103 | Raju |    10 |     134 |
|  104 | Sham |     6 |      34 |
+------+------+-------+---------+

DELETE FROM students
    WHERE name = "raju";

 select * from students;
+------+------+-------+---------+
| id   | name | class | contact |
+------+------+-------+---------+
|  101 | Paul |     5 |      34 |
|  102 | Alex |     8 |      34 |
|  104 | Sham |     6 |      34 |
+------+------+-------+---------+




-- Alias keyword

 select acc_no as "account_no" from customer4;
 +------------+
| account_no |
+------------+
|       1001 |
|       1002 |
+------------+

--DISTINCT Keyword 
select * from customer7;
+--------+
| name   |
+--------+
| ganesh |
| ganesh |
| veer   |
| dev    |
+--------+


 select distinct name  from customer7;
+--------+
| name   |
+--------+
| ganesh |
| veer   |
| dev    |
+--------+

-- ALTER TABLE Command
alter table employees
    add columnn
    salary int not null
    default  25000;

select * from employees;
+--------+---------+---------+------------+---------+--------+
| emp_id | fname   | lname   | desig      | dept    | salary |
+--------+---------+---------+------------+---------+--------+
|    101 | Raju    | Rastogi | Manager    | Loan    |  25000 |
|    102 | Sham    | Mohan   | Cashier    | Cash    |  25000 |
|    103 | Baburao | Apte    | Associate  | Loan    |  25000 |
|    104 | Paul    | Philip  | Accountant | Account |  25000 |
|    105 | Alex    | Watt    | Associate  | Deposit |  25000 |
|    106 | Rick    | Watt    | Manager    | Account |  25000 |
|    107 | Leena   | Johnson | Lead       | Cash    |  25000 |
|    108 | John    | Paul    | Manager    | IT      |  25000 |
|    109 | Alex    | Watt    | Probation  | Loan    |  25000 |
+--------+---------+---------+------------+---------+--------+


-- use  of alert  for  modify the table 

desc employees;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| emp_id | int         | NO   | PRI | NULL    |       |
| fname  | varchar(50) | NO   |     | NULL    |       |
| lname  | varchar(50) | NO   |     | NULL    |       |
| desig  | varchar(50) | NO   |     | NULL    |       |
| dept   | varchar(50) | NO   |     | NULL    |       |
| salary | int         | NO   |     | 25000   |       |
+--------+-------------+------+-----+---------+-------+


ALTER TABLE employees 
   MODIFY emp_id INT AUTO_INCREMENT;

 desc employees;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| emp_id | int         | NO   | PRI | NULL    | auto_increment |
| fname  | varchar(50) | NO   |     | NULL    |                |
| lname  | varchar(50) | NO   |     | NULL    |                |
| desig  | varchar(50) | NO   |     | NULL    |                |
| dept   | varchar(50) | NO   |     | NULL    |                |
| salary | int         | NO   |     | 25000   |                |
+--------+-------------+------+-----+---------+----------------+


