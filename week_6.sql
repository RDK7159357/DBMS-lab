-- 6.1
CREATE TABLE officers (
    officer_id NUMBER(2) NOT NULL PRIMARY KEY,
    officer_name VARCHAR2(7) NOT NULL,
    officer_address VARCHAR2(35) NOT NULL
);


INSERT INTO officers VALUES (1, 'ajeet', 'Mau');
INSERT INTO officers VALUES (2, 'deepika', 'luknow');

SELECT * FROM officers;

-- Creating the student table
CREATE TABLE student61(
    student_id NUMBER(7), 
    student_name CHAR(10), 
    course_name CHAR(10)
);

-- Inserting data into student table
INSERT INTO student61 VALUES (1, 'aryan', 'java');
INSERT INTO student61 VALUES (2, 'rohini', 'haddop');
INSERT INTO student61 VALUES (3, 'lallu', 'mongoDB');

SELECT * FROM student61;

-- 6.2

SELECT officers.officer_name, officers.officer_address, student61.course_name
FROM officers
INNER JOIN student61
ON officers.officer_id = student61.student_id;

-- 6.3

SELECT officers.officer_name, officers.officer_address, student61.course_name
FROM officers
LEFT JOIN student61
ON officers.officer_id = student61.student_id;

-- 6.4

SELECT officers.officer_name, officers.officer_address, student61.course_name,
student61.student_name
FROM officers
RIGHT JOIN student61
ON officers.officer_id = student61.student_id;

-- 6.5

Select officers.officer_name,officers.officer_address,student61.course_name 
from officers 
CROSS join
student61;

-- 6.6

SELECT COUNT(name) FROM employee;

SELECT SUM(working_hours) AS "Total working hours" FROM employee;

SELECT AVG(working_hours) AS "Average working hours" FROM employee;

SELECT MIN(working_hours) AS Minimum_working_hours FROM employee;

SELECT MAX(working_hours) AS Maximum_working_hours FROM employee;

