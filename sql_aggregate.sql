-- count aggreate 
SELECT COUNT(*) FROM employees;
+----------+
| COUNT(*) |
+----------+
|        9 |
+----------+

 SELECT *, 
     (SELECT COUNT(*) FROM employees) AS total_employees
     FROM employees;
+--------+---------+---------+------------+---------+--------+-----------------+
| emp_id | fname   | lname   | desig      | dept    | salary | total_employees |
+--------+---------+---------+------------+---------+--------+-----------------+
|    101 | Raju    | Rastogi | Manager    | Loan    |  37000 |               9 |
|    102 | Sham    | Mohan   | Cashier    | Cash    |  25000 |               9 |
|    103 | Baburao | Apte    | Associate  | Loan    |  35000 |               9 |
|    104 | Paul    | Philip  | Accountant | Account |  48000 |               9 |
|    105 | Alex    | Watt    | Associate  | Deposit |  50000 |               9 |
|    106 | Rick    | Watt    | Manager    | Account |  75000 |               9 |
|    107 | Leena   | Johnson | Lead       | Cash    |  20000 |               9 |
|    108 | John    | Paul    | Manager    | IT      |  27500 |               9 |
|    109 | Alex    | Watt    | Probation  | Loan    |  40000 |               9 |
+--------+---------+---------+------------+---------+--------+-----------------+

 SELECT dept, COUNT(*) AS total
     FROM employees
    GROUP BY dept;
+---------+-------+
| dept    | total |
+---------+-------+
| Loan    |     3 |
| Cash    |     2 |
| Account |     2 |
| Deposit |     1 |
| IT      |     1 |
+---------+-------+

-- group by agrreate

select dept from employees group by dept;
+---------+
| dept    |
+---------+
| Loan    |
| Cash    |
| Account |
| Deposit |
| IT      |
+---------+

-- max and  min aggreate
 select max(salary) from  employees;
+-------------+
| max(salary) |
+-------------+
|       75000 |
+-------------+

SELECT fname, salary
     FROM employees
     WHERE salary = (
         SELECT MAX(salary) FROM employees
     );
+-------+--------+
| fname | salary |
+-------+--------+
| Rick  |  75000 |
+-------+--------+

-- use sum and avg

select sum(salary) from employees;
+-------------+
| sum(salary) |
+-------------+
|      357500 |

 select  AVG(salary) from employees;
+-------------+
| AVG(salary) |
+-------------+
|  39722.2222 |
+-------------+

 select dept, max(salary) from  employees group by dept;
+---------+-------------+
| dept    | max(salary) |
+---------+-------------+
| Loan    |       40000 |
| Cash    |       25000 |
| Account |       75000 |
| Deposit |       50000 |
| IT      |       27500 |
+---------+-------------+

select dept,count(emp_id) ,sum(salary) from  employees group by dept;
+---------+---------------+-------------+
| dept    | count(emp_id) | sum(salary) |
+---------+---------------+-------------+
| Loan    |             3 |      112000 |
| Cash    |             2 |       45000 |
| Account |             2 |      123000 |
| Deposit |             1 |       50000 |
+---------+---------------+-------------+


-- conditional operator

-- use of in operator   Meaning: return rows where the column equals any value in the list.
select * from employees where dept in ("Loan","cash");
+--------+---------+---------+-----------+------+--------+
| emp_id | fname   | lname   | desig     | dept | salary |
+--------+---------+---------+-----------+------+--------+
|    101 | Raju    | Rastogi | Manager   | Loan |  37000 |
|    102 | Sham    | Mohan   | Cashier   | Cash |  25000 |
|    103 | Baburao | Apte    | Associate | Loan |  35000 |
|    107 | Leena   | Johnson | Lead      | Cash |  20000 |
|    109 | Alex    | Watt    | Probation | Loan |  40000 |
+--------+---------+---------+-----------+------+--------+

-- use of  not in
select * from employees where dept not in ("Loan","cash");
+--------+-------+--------+------------+---------+--------+
| emp_id | fname | lname  | desig      | dept    | salary |
+--------+-------+--------+------------+---------+--------+
|    104 | Paul  | Philip | Accountant | Account |  48000 |
|    105 | Alex  | Watt   | Associate  | Deposit |  50000 |
|    106 | Rick  | Watt   | Manager    | Account |  75000 |
|    108 | John  | Paul   | Manager    | IT      |  27500 |
+--------+-------+--------+------------+---------+--------+

-- use of  between 
select * from employees
    where salary between 40000  and 65000;
+--------+-------+--------+------------+---------+--------+
| emp_id | fname | lname  | desig      | dept    | salary |
+--------+-------+--------+------------+---------+--------+
|    104 | Paul  | Philip | Accountant | Account |  48000 |
|    105 | Alex  | Watt   | Associate  | Deposit |  50000 |
|    109 | Alex  | Watt   | Probation  | Loan    |  40000 |
+--------+-------+--------+------------+---------+--------+

-- use of case 

select fname,salary, 
     case 
     when salary >=50000 then "Higher salary"
     else "Low salary"
     end as "salary category"
    from employees;
+---------+--------+-----------------+
| fname   | salary | salary category |
+---------+--------+-----------------+
| Raju    |  37000 | Low salary      |
| Sham    |  25000 | Low salary      |
| Baburao |  35000 | Low salary      |
| Paul    |  48000 | Low salary      |
| Alex    |  50000 | Higher salary   |
| Rick    |  75000 | Higher salary   |
| Leena   |  20000 | Low salary      |
| John    |  27500 | Low salary      |
| Alex    |  40000 | Low salary      |
+---------+--------+-----------------+

select fname,salary ,
     case
     when salary >50000 then "high salary"
     when salary >=30000 and salary<=50000 then "mid salary"
     else "low salary"
     end as "salary category"
     from  employees;
+---------+--------+-----------------+
| fname   | salary | salary category |
+---------+--------+-----------------+
| Raju    |  37000 | mid salary      |
| Sham    |  25000 | low salary      |
| Baburao |  35000 | mid salary      |
| Paul    |  48000 | mid salary      |
| Alex    |  50000 | mid salary      |
| Rick    |  75000 | high salary     |
| Leena   |  20000 | low salary      |
| John    |  27500 | low salary      |
| Alex    |  40000 | mid salary      |
+---------+--------+-----------------+


-- use of is null

select * from person;
+------------+----------+---------------------+
| jd         | jt       | jdt                 |
+------------+----------+---------------------+
| NULL       | NULL     | 2022-04-17 22:00:00 |
| 2026-03-06 | 20:26:39 | 2026-03-06 20:26:39 |
+------------+----------+---------------------+

select * from person
     where jd is null;
+------+------+---------------------+
| jd   | jt   | jdt                 |
+------+------+---------------------+
| NULL | NULL | 2022-04-17 22:00:00 |
+------+------+---------------------+

--  use if null

SELECT name, IFNULL(email,'No Email') AS email
    -> FROM customers;
+---------+------------------+
| name    | email            |
+---------+------------------+
| Ganesh  | ganesh@gmail.com |
| Raju    | raju@email.com   |
| Sham    | sham@email.com   |
| Baburao | babu@email.com   |
| Paul    | paul@email.com   |
| Alex    | alex@email.com   |
+---------+------------------+
-- if any filed as no email then if null will put  'No Email'