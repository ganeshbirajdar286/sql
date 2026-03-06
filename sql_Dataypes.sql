-- create decimal values table  
create table num1 (price decimal(5,2));

 desc num1;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| price | decimal(5,2) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+

select * from num1;
+--------+
| price  |
+--------+
| 155.78 |
+--------+

insert into  num1 values(1553.78);
ERROR 1264 (22003): Out of range value for column 'price' at row 1


-- use of float and double 
 desc num2;
+-------+--------+------+-----+---------+-------+
| Field | Type   | Null | Key | Default | Extra |
+-------+--------+------+-----+---------+-------+
| f     | float  | YES  |     | NULL    |       |
| d     | double | YES  |     | NULL    |       |
+-------+--------+------+-----+---------+-------+

-- use date ,time and datetime

desc person;
+-------+----------+------+-----+---------+-------+
| Field | Type     | Null | Key | Default | Extra |
+-------+----------+------+-----+---------+-------+
| jd    | date     | YES  |     | NULL    |       |
| jt    | time     | YES  |     | NULL    |       |
| jdt   | datetime | YES  |     | NULL    |       |
+-------+----------+------+-----+---------+-------+

insert into person 
    values("2022-04-17","23:00:00","2022-04-17 22:00:00");

select * from person;
+------------+----------+---------------------+
| jd         | jt       | jdt                 |
+------------+----------+---------------------+
| 2022-04-17 | 23:00:00 | 2022-04-17 22:00:00 |
+------------+----------+---------------------+

-- use CURTIME,CURDATE,NOW
insert into person values(curdate(),curtime(),now());

 select * from person;
+------------+----------+---------------------+
| jd         | jt       | jdt                 |
+------------+----------+---------------------+
| 2022-04-17 | 23:00:00 | 2022-04-17 22:00:00 |
| 2026-03-06 | 20:26:39 | 2026-03-06 20:26:39 |
+------------+----------+---------------------+

-- use DAYNAME ,DAYOFMONTH AND DAYOFWEEK

  select DAYNAME(curdate()) ;
+--------------------+
| DAYNAME(curdate()) |
+--------------------+
| Friday             |
+--------------------+

-- use of MONTHNAME AND HOUR
select jd ,  monthname(jd) from person;
+------------+---------------+
| jd         | monthname(jd) |
+------------+---------------+
| 2022-04-17 | April         |
| 2026-03-06 | March         |
+------------+---------------+

-- default and updatetimestamp

 create table blogs( 
    text varchar(150),
     created_at datetime default current_timestamp,
      update_at datetime on update current_timestamp
      );

 desc blogs;
+------------+--------------+------+-----+-------------------+-----------------------------+
| Field      | Type         | Null | Key | Default           | Extra                       |
+------------+--------------+------+-----+-------------------+-----------------------------+
| text       | varchar(150) | YES  |     | NULL              |                             |
| created_at | datetime     | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED           |
| update_at  | datetime     | YES  |     | NULL              | on update CURRENT_TIMESTAMP |
+------------+--------------+------+-----+-------------------+-----------------------------+

insert into blogs(text)
    values ("this is new blog");

 select * from blogs;
+------------------+---------------------+-----------+
| text             | created_at          | update_at |
+------------------+---------------------+-----------+
| this is new blog | 2026-03-06 20:41:15 | NULL      |
+------------------+---------------------+-----------+

update blogs 
    set text="update text";

     select * from blogs;
+-------------+---------------------+---------------------+
| text        | created_at          | update_at           |
+-------------+---------------------+---------------------+
| update text | 2026-03-06 20:41:15 | 2026-03-06 20:42:47 |
+-------------+---------------------+---------------------+
