-- SELECT SysDate
-- from dual;

-- GRANT CREATE SESSION TO C##myuser;
-- GRANT CREATE TABLE TO C##myuser;
-- GRANT ALTER ANY TABLE TO C##myuser;
-- GRANT DROP ANY TABLE TO C##myuser;
-- GRANT SELECT ANY TABLE TO C##myuser;
-- GRANT CREATE VIEW TO C##myuser;
-- GRANT CREATE PROCEDURE TO C##myuser;
-- GRANT CREATE SEQUENCE TO C##myuser;
-- GRANT CREATE TRIGGER TO C##myuser;
-- ALTER USER C##MYUSER QUOTA UNLIMITED ON USERS;

 -- Only if necessary, and use with caution.

-- Create Employee Table
CREATE TABLE Employee (
    Emp_no NUMBER PRIMARY KEY,
    E_name VARCHAR2(20),
    Job VARCHAR2(20),
    Mgr_no NUMBER,
    Salary_no NUMBER
);

-- Create and Use Database (Oracle does not use USE)
-- Instead, you connect to a specific schema

-- Insert Data into Employee
INSERT INTO Employee VALUES (10, 'A', 'clerk', 10, 1);
INSERT INTO Employee VALUES (20, 'B', 'programmer', 20, 2);
INSERT INTO Employee VALUES (30, 'C', 'peon', 30, 3);
INSERT INTO Employee VALUES (40, 'D', 'cleaner', 30, 4);
INSERT INTO Employee VALUES (50, 'E', 'sweeper', 50, 5);
INSERT INTO Employee VALUES (60, 'F', 'food', 50, 6);
INSERT INTO Employee VALUES (70, 'G', 'delivery', 50, 7);
INSERT INTO Employee VALUES (80, 'H', 'chakki', 60, 8);
INSERT INTO Employee VALUES (90, 'I', 'swiggy', 60, 9);
INSERT INTO Employee VALUES (100, 'J', 'domino', 60, 10);

-- Describe Table
DESC Employee;

-- Drop Table
DROP TABLE Employee;

-- Select All from Employee
SELECT * FROM Employee;

-- Update Employee
UPDATE Employee SET Job = 'developer' WHERE Job = 'programmer';

UPDATE Employee SET Emp_no = 191 WHERE Emp_no = 10;

-- Rename Column
ALTER TABLE Employee RENAME COLUMN Job TO Designation;

-- Delete Row
DELETE FROM Employee WHERE Emp_no = 191;

Alter table Employee add commission number;

UPDATE EMPLOYEE set EMPLOYEE.COMMISSION = 0.1 * Employee.SALARY_NO;

Alter table EMPLOYEE add dept_no NUMBER ;

Alter table EMPLOYEE
add CONSTRAINT fk_dept FOREIGN key (DEPT_NO)
references Department(Dept_no);


SELECT e.Emp_no, e.E_name, e.Job, e.Dept_no, d.Dept_name, d.Location
FROM Employee e
JOIN Department d ON e.Dept_no = d.Dept_no;


UPDATE EMPLOYEE set EMPLOYEE.DEPT_NO=10 where Employee.EMP_NO=10;
UPDATE EMPLOYEE set EMPLOYEE.DEPT_NO=10 where Employee.EMP_NO=20;
UPDATE EMPLOYEE set EMPLOYEE.DEPT_NO=20 where Employee.EMP_NO=30;
UPDATE EMPLOYEE set EMPLOYEE.DEPT_NO=30 where Employee.EMP_NO=40;
UPDATE EMPLOYEE set EMPLOYEE.DEPT_NO=20 where Employee.EMP_NO=50;
UPDATE EMPLOYEE set EMPLOYEE.DEPT_NO=40 where Employee.EMP_NO=60;
UPDATE EMPLOYEE set EMPLOYEE.DEPT_NO=50 where Employee.EMP_NO=70;
UPDATE EMPLOYEE set EMPLOYEE.DEPT_NO=60 where Employee.EMP_NO=80;
UPDATE EMPLOYEE set EMPLOYEE.DEPT_NO=50 where Employee.EMP_NO=90;
UPDATE EMPLOYEE set EMPLOYEE.DEPT_NO=40 where Employee.EMP_NO=100;

-- Create Department Table
CREATE TABLE Department (
    Dept_no NUMBER PRIMARY KEY,
    Dept_name VARCHAR2(20) NOT NULL,
    Location VARCHAR2(20)
);

-- Insert Data into Department
INSERT INTO Department VALUES (10, 'Human Resources', 'New York');
INSERT INTO Department VALUES (20, 'Finance', 'Boston');
INSERT INTO Department VALUES (30, 'Information Tech', 'Chicago');
INSERT INTO Department VALUES (40, 'Marketing', 'Los Angeles');
INSERT INTO Department VALUES (50, 'Operations', 'San Francisco');
INSERT INTO Department VALUES (60, 'ResearchDev', 'Seattle');


-- Select All from Department
SELECT * FROM Department;

-- Update Department
UPDATE Department SET Dept_name = 'Computer Science' WHERE Dept_no = 9;

-- Add Column with Default Value
ALTER TABLE Department ADD phone_no NUMBER DEFAULT 99999999;

-- Insert Data with New Column
INSERT INTO Department VALUES (60, 'F', 'adsd', 123456);

-- Drop Column
ALTER TABLE Department DROP COLUMN phone_no;

SELECT dept_no, dept_name, location
FROM Department
GROUP BY dept_no, dept_name, location
ORDER BY dept_no;


-- Drop Table
DROP TABLE Department;

-- Create Customer Table
CREATE TABLE Customer (
    Cust_name VARCHAR2(20),
    Cust_street VARCHAR2(20),
    Cust_city CHAR(3)
);

-- Insert Data into Customer
INSERT INTO Customer VALUES ('A', 'bal', 'MUM');
INSERT INTO Customer VALUES ('B', 'st', 'HYD');
INSERT INTO Customer VALUES ('C', 'lincoln', 'BOM');
INSERT INTO Customer VALUES ('D', 'variable', 'CAL');
INSERT INTO Customer VALUES ('E', 'app', 'BAN');
INSERT INTO Customer VALUES ('F', 'tol', 'HYD');

-- Describe Customer Table
DESC Customer;

-- Select All from Customer
SELECT * FROM Customer;

-- Add Column
ALTER TABLE Customer ADD Salary NUMBER;

-- Modify Column
ALTER TABLE Customer MODIFY Cust_city CHAR(3);

-- Delete Row
DELETE FROM Customer WHERE Cust_city = 'MUM';

-- Drop Column
ALTER TABLE Customer DROP COLUMN Salary;

-- Delete Rows
DELETE FROM Customer WHERE Cust_city = 'HYD';

-- Drop Table
DROP TABLE Customer;

-- Create Branch Table
CREATE TABLE Branch_Table (
    Branch_name VARCHAR2(20),
    Branch_city VARCHAR2(20),
    Asserts NUMBER
);

drop table Branch_Table;

-- Describe Branch Table
DESC Branch_Table;

Alter table Branch_Table modify asserts long;

Insert into BRANCH_TABLE values('A','hyd',2);
Insert into BRANCH_TABLE values('B','cal',3);
Insert into BRANCH_TABLE values('C','mum',5);
Insert into BRANCH_TABLE values('D','del',2);
Insert into BRANCH_TABLE values('E','ban',3);

SELECT *
from BRANCH_TABLE;


Alter table Branch_Table rename COLUMN Branch_name to Name_of_Branch;

ALter table branch_table drop column Branch_city;

ALter table branch_table drop column asserts;

CREATE TABLE sailor (
  Sid NUMBER,
  Sname VARCHAR2(20),
  rating VARCHAR2(20)
);

alter table sailor add PRIMARY key(Sid);

desc sailor;

SELECT *
from SAILOR;

ALTER TABLE sailor ADD (age NUMBER);

INSERT INTO sailor (Sid, Sname, rating, age) VALUES (1, 'John', '7', 25);
INSERT INTO sailor (Sid, Sname, rating, age) VALUES (2, 'Mike', '9', 30);
INSERT INTO sailor (Sid, Sname, rating, age) VALUES (3, 'Alice', '8', 28);

DELETE FROM sailor WHERE TO_NUMBER(rating) > 8;

UPDATE sailor SET Sname = 'Alice Cooper' WHERE Sid = 3;

INSERT INTO sailor (Sid, Sname, rating, age) VALUES (4, NULL, NULL, NULL);

create table Boat(
    boat_id NUMBER PRIMARY key,
    boat_name VARCHAR2(20),
    color VARCHAR2(20)
);


desc boat;

INSERT INTO Boat VALUES (1, 'Sea Breeze', 'Blue');
INSERT INTO Boat VALUES (2, 'Wave Rider', 'White');
INSERT INTO Boat VALUES (3, 'Ocean Explorer', 'Red');
INSERT INTO Boat VALUES (4, 'Storm Chaser', 'Black');
INSERT INTO Boat VALUES (5, 'Sunny Sailor', 'Yellow');
INSERT INTO Boat VALUES (6, 'Deep Diver', 'Green');


select * from BOAT;


CREATE TABLE reserves (
    Sid NUMBER,
    boat_id NUMBER,
    date_ DATE
);

desc reserves;

select *
from reserves;

drop table reserves;

INSERT INTO reserves (boat_id, sid, day) VALUES (1, 100, 2023-01-01);
INSERT INTO reserves (boat_id, sid, day) VALUES (2, 101, 2023-01-02);
INSERT INTO reserves (boat_id, sid, day) VALUES (3, 102, 2023-01-03);


ALTER TABLE reserves ADD ("time" TIMESTAMP);


-- 1. Add a new column "new_day" of type DATE.
ALTER TABLE reserves ADD (new_day DATE);

-- 2. Update the new column with the converted values from the "day" column.
UPDATE reserves 
SET new_day = TO_DATE(TO_CHAR(day), 'YYYYMMDD');

-- 3. Drop the original "day" column.
ALTER TABLE reserves DROP COLUMN day;

-- 4. Rename the new column "new_day" to "day".
ALTER TABLE reserves RENAME COLUMN new_day TO day;


ALTER TABLE reserves DROP COLUMN "time";


DELETE FROM reserves
WHERE boat_id = 2;