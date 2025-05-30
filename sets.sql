-- SET – I
-- 1. Create Employee table
CREATE TABLE Employee (
    Employee_no NUMBER PRIMARY KEY,
    Employee_name VARCHAR2(50),
    Job VARCHAR2(50),
    Salary NUMBER(10,2),
    Location VARCHAR2(50)
);

-- 2. Rename column 'Job' to 'Position'
ALTER TABLE Employee RENAME COLUMN Job TO Position;

-- Delete row with Employee_no = 5
DELETE FROM Employee WHERE Employee_no = 5;


-- SET – II
-- 1. Create Department table
CREATE TABLE Department (
    Department_no NUMBER PRIMARY KEY,
    Department_name VARCHAR2(50),
    Location VARCHAR2(50)
);

-- Insert sample values
INSERT INTO Department VALUES (10, 'HR', 'Hyderabad');
INSERT INTO Department VALUES (19, 'IT', 'Mumbai');

-- Add column 'Designation'
ALTER TABLE Department ADD Designation VARCHAR2(50);

-- 2. Update designation where Department_no is 19
UPDATE Department SET Designation = 'Manager' WHERE Department_no = 19;

-- Select departments in Hyderabad
SELECT * FROM Department WHERE Location = 'Hyderabad';


-- SET – III
-- 1. Create Students table with constraints
CREATE TABLE Students (
    Student_ID NUMBER PRIMARY KEY,
    Student_Name VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100) UNIQUE,
    Age NUMBER DEFAULT 18,
    Grade NUMBER CHECK (Grade BETWEEN 1 AND 10)
);

-- 2. Create 'students' and 'officers' tables
CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    officer_id NUMBER
);

CREATE TABLE officers (
    officer_id NUMBER PRIMARY KEY,
    officer_name VARCHAR2(50)
);

-- Insert values
INSERT INTO students VALUES (1, 'Alice', 101);
INSERT INTO students VALUES (2, 'Bob', 102);
INSERT INTO officers VALUES (101, 'Mr. Smith');
INSERT INTO officers VALUES (103, 'Mrs. Jane');

-- SQL query: students with matching officer
SELECT s.name AS Student_Name, o.officer_name AS Officer_Name
FROM students s
JOIN officers o ON s.officer_id = o.officer_id;


-- SET – IV
-- 1. Create Employee table with working_hours
CREATE TABLE Employee (
    Employee_no NUMBER PRIMARY KEY,
    Employee_name VARCHAR2(50),
    Working_hours NUMBER
);

-- Insert sample data
INSERT INTO Employee VALUES (1, 'John', 40);
INSERT INTO Employee VALUES (2, 'Jane', 35);
INSERT INTO Employee VALUES (3, 'David', 45);

-- Aggregate functions
SELECT COUNT(*) AS Total_Employees FROM Employee;
SELECT AVG(Working_hours) AS Average_Hours FROM Employee;

-- 2. Create Class table and test commit/rollback
CREATE TABLE Class (
    Class_ID NUMBER PRIMARY KEY,
    Class_Name VARCHAR2(50)
);

INSERT INTO Class VALUES (101, 'Physics');
COMMIT;

INSERT INTO Class VALUES (102, 'Chemistry');
ROLLBACK;

-- Verify rollback (only Physics remains)
SELECT * FROM Class;


-- SET – V
-- 1. Create and drop MySQL-like user in Oracle
-- (For Oracle, we use CREATE USER, and DROP USER)
CREATE USER C##testuser IDENTIFIED BY test123;

-- Drop user
DROP USER C##testuser CASCADE;

-- 2. Show all users (Oracle equivalent)
SELECT username, host FROM DBA_USERS;

-- Note: Oracle doesn't use "host" like MySQL. You may use DBA_USERS for more details.


-- SET – VI
-- 1. SQL to display Hello, World!
SELECT 'Hello, World!' AS Greeting FROM dual;

-- 2. PL/SQL function to add two numbers
CREATE OR REPLACE FUNCTION adder(a IN NUMBER, b IN NUMBER)
RETURN NUMBER
IS
BEGIN
    RETURN a + b;
END;
/
-- Example usage
BEGIN
    DBMS_OUTPUT.PUT_LINE('Sum: ' || adder(10, 15));
END;
/