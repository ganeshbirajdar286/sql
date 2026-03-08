-- Window Functions in SQL are functions that perform calculations across a set of rows related to the current row, without grouping the result into a single row.

--In simple words:

--1)GROUP BY → reduces rows (one result per group)
--2)Window Function → keeps all rows but adds calculated values.

--They use the keyword OVER().

select id,dept,salary, 
sum(salary) over(ORDER by id) as sum_salary
from employee;

+-----+---------+--------+------------+
| id  | dept    | salary | sum_salary |
+-----+---------+--------+------------+
| 101 | Loan    |  37000 |      37000 |
| 102 | Cash    |  25000 |      62000 |
| 103 | Loan    |  35000 |      97000 |
| 104 | Account |  48000 |     145000 |
| 105 | Deposit |  50000 |     195000 |
| 106 | Account |  75000 |     270000 |
| 107 | Cash    |  20000 |     290000 |
| 108 | IT      |  27500 |     317500 |
| 109 | Loan    |  40000 |     357500 |
+-----+---------+--------+------------+

--  ROW_NUMBER()

select id,dept,salary, 
ROW_NUMBER() over() as row_no
from employee;

+-----+---------+--------+--------+
| id  | dept    | salary | row_no |
+-----+---------+--------+--------+
| 101 | Loan    |  37000 |      1 |
| 102 | Cash    |  25000 |      2 |
| 103 | Loan    |  35000 |      3 |
| 104 | Account |  48000 |      4 |
| 105 | Deposit |  50000 |      5 |
| 106 | Account |  75000 |      6 |
| 107 | Cash    |  20000 |      7 |
| 108 | IT      |  27500 |      8 |
| 109 | Loan    |  40000 |      9 |
+-----+---------+--------+--------+

