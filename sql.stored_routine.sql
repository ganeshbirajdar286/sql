--A Stored Routine in SQL is a saved program inside the database that you can execute whenever needed.
--Stored routines are mainly two types:

--1)Stored Procedure
--2)Stored Function

--They store SQL logic inside the database.


--We use Stored Procedures in SQL to store SQL logic inside the database and execute it whenever needed.A Stored Procedure = saved SQL program.


-- 1)Stored Procedure syntax
-- Change delimiter
DELIMITER $$ 
--Create procedure
CREATE PROCEDURE getStudents()
BEGIN
    SELECT * FROM students;
END $$
--Change delimiter back
DELIMITER ;

--  Stored Procedure syntax over

-- Call procedure
CALL getStudents();

+----+--------------+
| id | student_name |
+----+--------------+
|  1 | Raju         |
|  2 | Sham         |
|  3 | Paul         |
|  4 | Alex         |
+----+--------------+

-- Full Example
DELIMITER $$

CREATE PROCEDURE getStudents()
BEGIN
    SELECT * FROM students;
END $$

DELIMITER ;

-- delete the procedure
DROP PROCEDURE IF EXISTS getStudents;


-- argument passin in store procedure

DELIMITER $$
create procedure getStudents(IN p_fname varchar(50)) --IN  is input
BEGIN
 select * from students
 where student_name=p_fname;
 END $$
 DELIMITER ;   
 --( there should be space between delimiter and ;)

call getstudents("raju");
+----+--------------+
| id | student_name |
+----+--------------+
|  1 | Raju         |
+----+--------------+

-- returing output in a variable
DELIMITER $$

CREATE PROCEDURE getStudents(
    IN p_fname VARCHAR(50),
    OUT p_name VARCHAR(50)
)
BEGIN
    SELECT student_name
    INTO p_name
    FROM students
    WHERE student_name = p_fname;
END $$

DELIMITER ;

-- How to Call This Procedure

--First create a variable:
SET @name = "";
-- Then call procedure:
call getStudents("raju",@name);
--Check result:
SELECT @name;
+-------+
| @name |
+-------+
| Raju  |
+-------+

-- what are user defind function
--2) Stored Function

DELIMITER $$

CREATE FUNCTION get_sum(P_fname varchar(50)) RETURNS VARCHAR(50)
DETERMINISTIC  NO SQL READS SQL DATA

BEGIN
 DECLARE v_max INT;
 DECLARE v_name VARCHAR(50);

 select Max(salary) into v_max from employee;
 select fname into v_name from employee
 where salary=v_max;

 return v_name;
END$$

DELIMITER ;

SELECT get_sum("anything");-- use anything because i not useing the argumment 

--Delete the Function
DROP FUNCTION IF EXISTS get_sum;

--To view the function definition:
SHOW CREATE FUNCTION get_sum;