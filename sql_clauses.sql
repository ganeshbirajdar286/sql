-- CONCAT Function
select * from customer5;
+--------+--------+----------+
| acc_no | name   | acc_type |
+--------+--------+----------+
|      1 | Ganesh | saving   |
|      2 | Veer   | saving   |
|      3 | Akash  | saving   |
+--------+--------+----------+

select acc_no, concat(name,acc_type) as fullname from customer5;
+--------+--------------+
| acc_no | fullname     |
+--------+--------------+
|      1 | Ganeshsaving |
|      2 | Veersaving   |
|      3 | Akashsaving  |
+--------+--------------+


-- CONCAT_WS Function
 select * from customer5;
+--------+--------+----------+
| acc_no | name   | acc_type |
+--------+--------+----------+
|      1 | Ganesh | saving   |
|      2 | Veer   | saving   |
|      3 | Akash  | saving   |
+--------+--------+----------+

SELECT acc_no, CONCAT_WS("-", name, acc_type) AS customer_info
    -> FROM customer5;
+--------+---------------+
| acc_no | customer_info |
+--------+---------------+
|      1 | Ganesh-saving |
|      2 | Veer-saving   |
|      3 | Akash-saving  |
+--------+---------------+

-- ORDER BY Clause
 select * from students order  by name;
+------+------+-------+---------+
| id   | name | class | contact |
+------+------+-------+---------+
|  102 | Alex |     8 |      34 |
|  101 | Paul |     5 |      34 |
|  103 | Raju |    10 |     134 |
|  104 | Sham |     6 |      34 |
+------+------+-------+---------+

select * from students order  by name desc;
+------+------+-------+---------+
| id   | name | class | contact |
+------+------+-------+---------+
|  104 | Sham |     6 |      34 |
|  103 | Raju |    10 |     134 |
|  101 | Paul |     5 |      34 |
|  102 | Alex |     8 |      34 |
+------+------+-------+---------+

-- LIKE Clause

 SQL Clause,What it looks for,Examples it matches
WHERE CITY = 'A',"Exactly the letter A
WHERE CITY LIKE 'A%',"Starts with A
WHERE CITY LIKE '%A',"Ends with A
WHERE CITY LIKE '%A%',"""A"" anywhere in the name

 select  * from employees;
+--------+---------+---------+------------+---------+
| emp_id | fname   | lname   | desig      | dept    |
+--------+---------+---------+------------+---------+
|    101 | Raju    | Rastogi | Manager    | Loan    |
|    102 | Sham    | Mohan   | Cashier    | Cash    |
|    103 | Baburao | Apte    | Associate  | Loan    |
|    104 | Paul    | Philip  | Accountant | Account |
|    105 | Alex    | Watt    | Associate  | Deposit |
|    106 | Rick    | Watt    | Manager    | Account |
|    107 | Leena   | Johnson | Lead       | Cash    |
|    108 | John    | Paul    | Manager    | IT      |
|    109 | Alex    | Watt    | Probation  | Loan    |
+--------+---------+---------+------------+---------+


 select * from  employees 
 where desig  like "%cash%";
+--------+-------+-------+---------+------+
| emp_id | fname | lname | desig   | dept |
+--------+-------+-------+---------+------+
|    102 | Sham  | Mohan | Cashier | Cash |
+--------+-------+-------+---------+------+

select * from employees 
     where fname like "____";   // _ is use 4 time  because it represent any four letter  word
+--------+-------+---------+------------+---------+
| emp_id | fname | lname   | desig      | dept    |
+--------+-------+---------+------------+---------+
|    101 | Raju  | Rastogi | Manager    | Loan    |
|    102 | Sham  | Mohan   | Cashier    | Cash    |
|    104 | Paul  | Philip  | Accountant | Account |
|    105 | Alex  | Watt    | Associate  | Deposit |
|    106 | Rick  | Watt    | Manager    | Account |
|    108 | John  | Paul    | Manager    | IT      |
|    109 | Alex  | Watt    | Probation  | Loan    |
+--------+-------+---------+------------+---------+

// this is another method for 4 length characters

SELECT * FROM employees WHERE CHAR_LENGTH(fname) = 4;
+--------+-------+---------+------------+---------+
| emp_id | fname | lname   | desig      | dept    |
+--------+-------+---------+------------+---------+
|    101 | Raju  | Rastogi | Manager    | Loan    |
|    102 | Sham  | Mohan   | Cashier    | Cash    |
|    104 | Paul  | Philip  | Accountant | Account |
|    105 | Alex  | Watt    | Associate  | Deposit |
|    106 | Rick  | Watt    | Manager    | Account |
|    108 | John  | Paul    | Manager    | IT      |
|    109 | Alex  | Watt    | Probation  | Loan    |
+--------+-------+---------+------------+---------+

// this is 3 method useing Subquery Example

SELECT *
    -> FROM (
    ->     SELECT *, CHAR_LENGTH(fname) AS name_length
    ->     FROM employees
    -> ) AS temp
    -> WHERE name_length = 4;
+--------+-------+---------+------------+---------+-------------+
| emp_id | fname | lname   | desig      | dept    | name_length |
+--------+-------+---------+------------+---------+-------------+
|    101 | Raju  | Rastogi | Manager    | Loan    |           4 |
|    102 | Sham  | Mohan   | Cashier    | Cash    |           4 |
|    104 | Paul  | Philip  | Accountant | Account |           4 |
|    105 | Alex  | Watt    | Associate  | Deposit |           4 |
|    106 | Rick  | Watt    | Manager    | Account |           4 |
|    108 | John  | Paul    | Manager    | IT      |           4 |
|    109 | Alex  | Watt    | Probation  | Loan    |           4 |
+--------+-------+---------+------------+---------+-------------+

--use not like

select * from employees
     where fname not like "A%";
+--------+---------+---------+------------+---------+--------+
| emp_id | fname   | lname   | desig      | dept    | salary |
+--------+---------+---------+------------+---------+--------+
|    101 | Raju    | Rastogi | Manager    | Loan    |  37000 |
|    102 | Sham    | Mohan   | Cashier    | Cash    |  25000 |
|    103 | Baburao | Apte    | Associate  | Loan    |  35000 |
|    104 | Paul    | Philip  | Accountant | Account |  48000 |
|    106 | Rick    | Watt    | Manager    | Account |  75000 |
|    107 | Leena   | Johnson | Lead       | Cash    |  20000 |
|    108 | John    | Paul    | Manager    | IT      |  27500 |
+--------+---------+---------+------------+---------+--------+


-- LIMIT Clause

select * from employees;
+--------+---------+---------+------------+---------+--------+
| emp_id | fname   | lname   | desig      | dept    | salary |
+--------+---------+---------+------------+---------+--------+
|    101 | Raju    | Rastogi | Manager    | Loan    |  37000 |
|    102 | Sham    | Mohan   | Cashier    | Cash    |  25000 |
|    103 | Baburao | Apte    | Associate  | Loan    |  35000 |
|    104 | Paul    | Philip  | Accountant | Account |  48000 |
|    105 | Alex    | Watt    | Associate  | Deposit |  50000 |
|    106 | Rick    | Watt    | Manager    | Account |  75000 |
|    107 | Leena   | Johnson | Lead       | Cash    |  20000 |
|    108 | John    | Paul    | Manager    | IT      |  27500 |
|    109 | Alex    | Watt    | Probation  | Loan    |  40000 |
+--------+---------+---------+------------+---------+--------+

select * from employees limit 5;
+--------+---------+---------+------------+---------+--------+
| emp_id | fname   | lname   | desig      | dept    | salary |
+--------+---------+---------+------------+---------+--------+
|    101 | Raju    | Rastogi | Manager    | Loan    |  37000 |
|    102 | Sham    | Mohan   | Cashier    | Cash    |  25000 |
|    103 | Baburao | Apte    | Associate  | Loan    |  35000 |
|    104 | Paul    | Philip  | Accountant | Account |  48000 |
|    105 | Alex    | Watt    | Associate  | Deposit |  50000 |
+--------+---------+---------+------------+---------+--------+

select * from employees order by salary desc limit 1;
+--------+-------+-------+---------+---------+--------+
| emp_id | fname | lname | desig   | dept    | salary |
+--------+-------+-------+---------+---------+--------+
|    106 | Rick  | Watt  | Manager | Account |  75000 |
+--------+-------+-------+---------+---------+--------+


select * from employees limit 3,3;  -- LIMIT (offset, count)  offset → number of rows to skip  count → number of rows to return
+--------+-------+--------+------------+---------+--------+
| emp_id | fname | lname  | desig      | dept    | salary |
+--------+-------+--------+------------+---------+--------+
|    104 | Paul  | Philip | Accountant | Account |  48000 |
|    105 | Alex  | Watt   | Associate  | Deposit |  50000 |
|    106 | Rick  | Watt   | Manager    | Account |  75000 |
+--------+-------+--------+------------+---------+--------+

-- having (is a clause use in group  by )
select * from inst_info;
+--------------+-------------+------+
| student_name | course_name | fees |
+--------------+-------------+------+
| Raju         | Java        | 5000 |
| Raju         | SQL         | 4000 |
| Raju         | Linux       | 3500 |
| Sham         | Linux       | 3500 |
| Sham         | Python      | 6000 |
| Paul         | Python      | 6000 |
+--------------+-------------+------+

select student_name,sum(fees) as total_fees  from inst_info group by student_name
    -> having total_fees >10000;
+--------------+------------+
| student_name | total_fees |
+--------------+------------+
| Raju         |      12500 |
+--------------+------------+

-- with Rollup

select student_name,sum(fees) as total_fees  from inst_info 
group by student_name with rollup;
+--------------+------------+
| student_name | total_fees |
+--------------+------------+
| Paul         |       6000 |
| Raju         |      12500 |
| Sham         |       9500 |
| NULL         |      28000 |   --(rollup give total of table and null is coming because of  rollup)
+--------------+------------+


select ifnull(student_name,"total") as  student_name,sum(fees) as total_fees  from inst_info 
group by student_name with rollup;

+--------------+------------+
| student_name | total_fees |
+--------------+------------+
| Paul         |       6000 |
| Raju         |      12500 |
| Sham         |       9500 |
| total        |      28000 |
+--------------+------------+


select ifnull(student_name,"total") as  student_name,sum(fees) as total_fees ,count(fees) as fees from inst_info 
group by student_name with rollup;

+--------------+------------+------+
| student_name | total_fees | fees |
+--------------+------------+------+
| Paul         |       6000 |    1 |
| Raju         |      12500 |    3 |
| Sham         |       9500 |    2 |
| total        |      28000 |    6 |
+--------------+------------+------+

