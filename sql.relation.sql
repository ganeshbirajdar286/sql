create table customers(
     cust_id int auto_increment primary key,
     name varchar(50),
    email varchar(50)
     );

     desc customers;
+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| cust_id | int         | NO   | PRI | NULL    | auto_increment |
| name    | varchar(50) | YES  |     | NULL    |                |
| email   | varchar(50) | YES  |     | NULL    |                |
+---------+-------------+------+-----+---------+----------------+


--use of foregin key

create table orders(
     ord_id int auto_increment primary key,
     date date,
     amount decimal(10,2),
     cust_id int,
     foreign key (cust_id) references customers(cust_id) 
    );

desc orders;
+---------+---------------+------+-----+---------+----------------+
| Field   | Type          | Null | Key | Default | Extra          |
+---------+---------------+------+-----+---------+----------------+
| ord_id  | int           | NO   | PRI | NULL    | auto_increment |
| date    | date          | YES  |     | NULL    |                |
| amount  | decimal(10,2) | YES  |     | NULL    |                |
| cust_id | int           | YES  | MUL | NULL    |                |
+---------+---------------+------+-----+---------+----------------+

-- to see foreign key is add we use  show create table name

show create table orders;


 orders | CREATE TABLE `orders` (
  `ord_id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `cust_id` int DEFAULT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `cust_id` (`cust_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |

| Part                            | Explanation                                         |
| ------------------------------- | --------------------------------------------------- |
| `orders_ibfk_1`                 | Name of the foreign key constraint                  |
| `FOREIGN KEY (cust_id)`         | Column in **orders table**                          |
| `REFERENCES customers(cust_id)` | It references **cust_id column in customers table** |


NSERT INTO customers(name,email)
    VALUES 
    ('Ganesh','ganesh@gmail.com')
    ('Raju', 'raju@email.com'),
    ('Sham', 'sham@email.com'),
    ('Baburao', 'babu@email.com'),
    ('Paul', 'paul@email.com'),
    ('Alex', 'alex@email.com');
    
   SELECT * FROM customers;
+---------+---------+------------------+
| cust_id | name    | email            |
+---------+---------+------------------+
|       1 | Ganesh  | ganesh@gmail.com |
|       2 | Raju    | raju@email.com   |
|       3 | Sham    | sham@email.com   |
|       4 | Baburao | babu@email.com   |
|       5 | Paul    | paul@email.com   |
|       6 | Alex    | alex@email.com   |
+---------+---------+------------------+


INSERT INTO orders(date,amount,cust_id)
    VALUES 
    ('2023-08-20', 105.38, 1),
    ('2023-08-20', 503.38, 1),
    ('2023-08-21', 400.00, 5),
    ('2023-08-21', 700.00, 4),
    ('2023-08-21', 400.00, 5),
    ('2023-08-21', 1000.00, 3);

    SELECT * FROM orders;
+--------+------------+---------+---------+
| ord_id | date       | amount  | cust_id |
+--------+------------+---------+---------+
|      2 | 2026-03-07 |  105.38 |       1 |
|      3 | 2026-03-07 |  150.00 |       1 |
|      4 | 2023-08-20 |  105.38 |       1 |
|      5 | 2023-08-20 |  503.38 |       1 |
|      6 | 2023-08-21 |  400.00 |       5 |
|      7 | 2023-08-21 |  700.00 |       4 |
|      8 | 2023-08-21 |  400.00 |       5 |
|      9 | 2023-08-21 | 1000.00 |       3 |
+--------+------------+---------+---------+


-- in select use subquery then it should  return only one value or  it  will give error

select * ,(select * from orders) as order  from customers;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'order  from customers' at line 1

-- we can use it like this 
SELECT name,
       (SELECT SUM(amount)
        FROM orders
        WHERE orders.cust_id = customers.cust_id) AS total_orders
FROM customers;

+--------+--------------+
| name   | total_orders |
+--------+--------------+
| Ganesh |       105.38 |
+--------+--------------+


--joins

--1)cross join
--It means every row of table 1 combines with every row of table 2.

SELECT *
  FROM customers
  CROSS JOIN orders;
--OR
SELECT *
  FROM customers, orders;
  +---------+---------+------------------+--------+------------+---------+---------+
| cust_id | name    | email            | ord_id | date       | amount  | cust_id |
+---------+---------+------------------+--------+------------+---------+---------+
|       6 | Alex    | alex@email.com   |      2 | 2026-03-07 |  105.38 |       1 |
|       5 | Paul    | paul@email.com   |      2 | 2026-03-07 |  105.38 |       1 |
|       4 | Baburao | babu@email.com   |      2 | 2026-03-07 |  105.38 |       1 |
|       3 | Sham    | sham@email.com   |      2 | 2026-03-07 |  105.38 |       1 |
|       2 | Raju    | raju@email.com   |      2 | 2026-03-07 |  105.38 |       1 |
|       1 | Ganesh  | ganesh@gmail.com |      2 | 2026-03-07 |  105.38 |       1 |
|       6 | Alex    | alex@email.com   |      3 | 2026-03-07 |  150.00 |       1 |
|       5 | Paul    | paul@email.com   |      3 | 2026-03-07 |  150.00 |       1 |
|       4 | Baburao | babu@email.com   |      3 | 2026-03-07 |  150.00 |       1 |
|       3 | Sham    | sham@email.com   |      3 | 2026-03-07 |  150.00 |       1 |
|       2 | Raju    | raju@email.com   |      3 | 2026-03-07 |  150.00 |       1 |
|       1 | Ganesh  | ganesh@gmail.com |      3 | 2026-03-07 |  150.00 |       1 |
|       6 | Alex    | alex@email.com   |      4 | 2023-08-20 |  105.38 |       1 |
|       5 | Paul    | paul@email.com   |      4 | 2023-08-20 |  105.38 |       1 |
|       4 | Baburao | babu@email.com   |      4 | 2023-08-20 |  105.38 |       1 |
|       3 | Sham    | sham@email.com   |      4 | 2023-08-20 |  105.38 |       1 |
|       2 | Raju    | raju@email.com   |      4 | 2023-08-20 |  105.38 |       1 |
|       1 | Ganesh  | ganesh@gmail.com |      4 | 2023-08-20 |  105.38 |       1 |
|       6 | Alex    | alex@email.com   |      5 | 2023-08-20 |  503.38 |       1 |
|       5 | Paul    | paul@email.com   |      5 | 2023-08-20 |  503.38 |       1 |
|       4 | Baburao | babu@email.com   |      5 | 2023-08-20 |  503.38 |       1 |
|       3 | Sham    | sham@email.com   |      5 | 2023-08-20 |  503.38 |       1 |
|       2 | Raju    | raju@email.com   |      5 | 2023-08-20 |  503.38 |       1 |
|       1 | Ganesh  | ganesh@gmail.com |      5 | 2023-08-20 |  503.38 |       1 |
|       6 | Alex    | alex@email.com   |      6 | 2023-08-21 |  400.00 |       5 |
|       5 | Paul    | paul@email.com   |      6 | 2023-08-21 |  400.00 |       5 |
|       4 | Baburao | babu@email.com   |      6 | 2023-08-21 |  400.00 |       5 |
|       3 | Sham    | sham@email.com   |      6 | 2023-08-21 |  400.00 |       5 |
|       2 | Raju    | raju@email.com   |      6 | 2023-08-21 |  400.00 |       5 |
|       1 | Ganesh  | ganesh@gmail.com |      6 | 2023-08-21 |  400.00 |       5 |
|       6 | Alex    | alex@email.com   |      7 | 2023-08-21 |  700.00 |       4 |
|       5 | Paul    | paul@email.com   |      7 | 2023-08-21 |  700.00 |       4 |
|       4 | Baburao | babu@email.com   |      7 | 2023-08-21 |  700.00 |       4 |
|       3 | Sham    | sham@email.com   |      7 | 2023-08-21 |  700.00 |       4 |
|       2 | Raju    | raju@email.com   |      7 | 2023-08-21 |  700.00 |       4 |
|       1 | Ganesh  | ganesh@gmail.com |      7 | 2023-08-21 |  700.00 |       4 |
|       6 | Alex    | alex@email.com   |      8 | 2023-08-21 |  400.00 |       5 |
|       5 | Paul    | paul@email.com   |      8 | 2023-08-21 |  400.00 |       5 |
|       4 | Baburao | babu@email.com   |      8 | 2023-08-21 |  400.00 |       5 |
|       3 | Sham    | sham@email.com   |      8 | 2023-08-21 |  400.00 |       5 |
|       2 | Raju    | raju@email.com   |      8 | 2023-08-21 |  400.00 |       5 |
|       1 | Ganesh  | ganesh@gmail.com |      8 | 2023-08-21 |  400.00 |       5 |
|       6 | Alex    | alex@email.com   |      9 | 2023-08-21 | 1000.00 |       3 |
|       5 | Paul    | paul@email.com   |      9 | 2023-08-21 | 1000.00 |       3 |
|       4 | Baburao | babu@email.com   |      9 | 2023-08-21 | 1000.00 |       3 |
|       3 | Sham    | sham@email.com   |      9 | 2023-08-21 | 1000.00 |       3 |
|       2 | Raju    | raju@email.com   |      9 | 2023-08-21 | 1000.00 |       3 |
|       1 | Ganesh  | ganesh@gmail.com |      9 | 2023-08-21 | 1000.00 |       3 |
+---------+---------+------------------+--------+------------+---------+---------+
-- it gives all combination

--2)inner join
-- INNER JOIN returns only the rows that have matching values in both tables.

select * from customers
   inner join orders 
   on orders.cust_id=customers.cust_id;
+---------+---------+------------------+--------+------------+---------+---------+
| cust_id | name    | email            | ord_id | date       | amount  | cust_id |
+---------+---------+------------------+--------+------------+---------+---------+
|       1 | Ganesh  | ganesh@gmail.com |      2 | 2026-03-07 |  105.38 |       1 |
|       1 | Ganesh  | ganesh@gmail.com |      3 | 2026-03-07 |  150.00 |       1 |
|       1 | Ganesh  | ganesh@gmail.com |      4 | 2023-08-20 |  105.38 |       1 |
|       1 | Ganesh  | ganesh@gmail.com |      5 | 2023-08-20 |  503.38 |       1 |
|       3 | Sham    | sham@email.com   |      9 | 2023-08-21 | 1000.00 |       3 |
|       4 | Baburao | babu@email.com   |      7 | 2023-08-21 |  700.00 |       4 |
|       5 | Paul    | paul@email.com   |      6 | 2023-08-21 |  400.00 |       5 |
|       5 | Paul    | paul@email.com   |      8 | 2023-08-21 |  400.00 |       5 |
+---------+---------+------------------+--------+------------+---------+---------+

SELECT customers.name, 
    COUNT(orders.cust_id) AS total_orders 
    FROM customers 
    INNER JOIN orders 
    ON orders.cust_id = customers.cust_id GROUP BY customers.name;
+---------+--------------+
| name    | total_orders |
+---------+--------------+
| Ganesh  |            4 |
| Sham    |            1 |
| Baburao |            1 |
| Paul    |            2 |
+---------+--------------+

SELECT customers.name, 
     sum(amount) AS total_amount 
     FROM customers 
     INNER JOIN orders
     ON orders.cust_id = customers.cust_id 
     GROUP BY customers.name;
+---------+--------------+
| name    | total_amount |
+---------+--------------+
| Ganesh  |       864.14 |
| Sham    |      1000.00 |
| Baburao |       700.00 |
| Paul    |       800.00 |
+---------+--------------+

--left join

-- LEFT JOIN returns:
--All rows from the left table
--Matching rows from the right table
--If no match → NULL values

 select * from customers  left join orders on orders.cust_id=customers.cust_id;
+---------+---------+------------------+--------+------------+---------+---------+
| cust_id | name    | email            | ord_id | date       | amount  | cust_id |
+---------+---------+------------------+--------+------------+---------+---------+
|       1 | Ganesh  | ganesh@gmail.com |      2 | 2026-03-07 |  105.38 |       1 |
|       1 | Ganesh  | ganesh@gmail.com |      3 | 2026-03-07 |  150.00 |       1 |
|       1 | Ganesh  | ganesh@gmail.com |      4 | 2023-08-20 |  105.38 |       1 |
|       1 | Ganesh  | ganesh@gmail.com |      5 | 2023-08-20 |  503.38 |       1 |
|       2 | Raju    | raju@email.com   |   NULL | NULL       |    NULL |    NULL |
|       3 | Sham    | sham@email.com   |      9 | 2023-08-21 | 1000.00 |       3 |
|       4 | Baburao | babu@email.com   |      7 | 2023-08-21 |  700.00 |       4 |
|       5 | Paul    | paul@email.com   |      6 | 2023-08-21 |  400.00 |       5 |
|       5 | Paul    | paul@email.com   |      8 | 2023-08-21 |  400.00 |       5 |
|       6 | Alex    | alex@email.com   |   NULL | NULL       |    NULL |    NULL |
+---------+---------+------------------+--------+------------+---------+---------+
-- in this case left table is customers and right table  is orders


select customers.name ,sum(amount) as total_amount,count(orders.cust_id) as total_orders
  from customers  
  left join orders
  on orders.cust_id=customers.cust_id  
  group by  customers.name;

 +---------+--------------+--------------+
| name    | total_amount | total_orders |
+---------+--------------+--------------+
| Ganesh  |       864.14 |            4 |
| Raju    |         NULL |            0 |
| Sham    |      1000.00 |            1 |
| Baburao |       700.00 |            1 |
| Paul    |       800.00 |            2 |
| Alex    |         NULL |            0 |
+---------+--------------+--------------+
-- in this case left table is customers and right table  is orders


select customers.name ,ifnull(sum(amount),0) as total_amount,count(orders.cust_id) as total_orders
  from customers  
  left join orders
  on orders.cust_id=customers.cust_id  
  group by  customers.name;

+---------+--------------+--------------+
| name    | total_amount | total_orders |
+---------+--------------+--------------+
| Ganesh  |       864.14 |            4 |
| Raju    |         0.00 |            0 |
| Sham    |      1000.00 |            1 |
| Baburao |       700.00 |            1 |
| Paul    |       800.00 |            2 |
| Alex    |         0.00 |            0 |
+---------+--------------+--------------+


-- right join '

-- right JOIN returns:
--All rows from the right table
--Matching rows from the left table

select * from customers  right join orders on orders.cust_id=customers.cust_id;
+---------+---------+------------------+--------+------------+---------+---------+
| cust_id | name    | email            | ord_id | date       | amount  | cust_id |
+---------+---------+------------------+--------+------------+---------+---------+
|       1 | Ganesh  | ganesh@gmail.com |      2 | 2026-03-07 |  105.38 |       1 |
|       1 | Ganesh  | ganesh@gmail.com |      3 | 2026-03-07 |  150.00 |       1 |
|       1 | Ganesh  | ganesh@gmail.com |      4 | 2023-08-20 |  105.38 |       1 |
|       1 | Ganesh  | ganesh@gmail.com |      5 | 2023-08-20 |  503.38 |       1 |
|       5 | Paul    | paul@email.com   |      6 | 2023-08-21 |  400.00 |       5 |
|       4 | Baburao | babu@email.com   |      7 | 2023-08-21 |  700.00 |       4 |
|       5 | Paul    | paul@email.com   |      8 | 2023-08-21 |  400.00 |       5 |
|       3 | Sham    | sham@email.com   |      9 | 2023-08-21 | 1000.00 |       3 |
+---------+---------+------------------+--------+------------+---------+---------+


select customers.name ,sum(amount) as total_amount,count(orders.cust_id) as total_orders
  from customers  
  right join orders
  on orders.cust_id=customers.cust_id  
  group by  customers.name;

+---------+--------------+--------------+
| name    | total_amount | total_orders |
+---------+--------------+--------------+
| Ganesh  |       864.14 |            4 |
| Paul    |       800.00 |            2 |
| Baburao |       700.00 |            1 |
| Sham    |      1000.00 |            1 |
+---------+--------------+--------------+



-- use of on delete cascade


create table orders(
     ord_id int auto_increment primary key,
     date date,
     amount decimal(10,2),
     cust_id int,
     foreign key (cust_id) references customers(cust_id) on delete cascade
    );


--  if on delete cascade so not use theen if i delete the any  field for customers then it  wil  give error
--  if we use on delete cascade the user will be delete and the orders also;

 delete from customers where name="raju";


