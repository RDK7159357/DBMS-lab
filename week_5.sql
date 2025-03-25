-- 5.1
CREATE TABLE STUDENT(
ROLL_NO INT NOT NULL,
STU_NAME VARCHAR (35) NOT NULL,
STU_AGE INT NOT NULL,
STU_ADDRESS VARCHAR (235),
PRIMARY KEY (ROLL_NO)
);

 insert into student values(6201 ,'raj',18,'meerpet');
 insert into student values(NULL,'raj',18,'meerpet');

-- 5.2
CREATE TABLE STUDENT1(
ROLL_NO INT NOT NULL,
STU_NAME VARCHAR (35) NOT NULL UNIQUE,
STU_AGE INT NOT NULL,
STU_ADDRESS VARCHAR (35) UNIQUE,
PRIMARY KEY (ROLL_NO)
);

insert into student1 values(6201,'raj',18,'meerpet');


--  5.3
CREATE TABLE STUDENT2(
ROLL_NO INT NOT NULL,
STU_NAME VARCHAR (35) NOT NULL,
STU_AGE INT NOT NULL,
EXAM_FEE INT DEFAULT 10000,
STU_ADDRESS VARCHAR (35) ,
PRIMARY KEY (ROLL_NO)
);

insert into
student2(ROLL_NO,STU_NAME,STU_AGE,STU_ADDRESS)values(6202,'sam',21,'lbnagar');

select * from student2;

-- 5.4

CREATE TABLE STUDENT3(
ROLL_NO INT NOT NULL CHECK(ROLL_NO >1000) ,
STU_NAME VARCHAR (35) NOT NULL,
STU_AGE INT NOT NULL,
EXAM_FEE INT DEFAULT 10000,
STU_ADDRESS VARCHAR (35) ,
PRIMARY KEY (ROLL_NO)
);

insert into student3 values(112,'ramana',23,12000,'hyderabad');

select * from student3;

-- 5.5

-- CREATE TABLE Persons1 (
-- Personid int NOT NULL AUTO_INCREMENT,
-- LastName varchar(255) NOT NULL,
-- FirstName varchar(255),
-- Age int,
-- PRIMARY KEY (Personid)
-- );

CREATE TABLE Persons1 (
    Personid INT NOT NULL,
    LastName VARCHAR2(255) NOT NULL,
    FirstName VARCHAR2(255),
    Age INT,
    PRIMARY KEY (Personid)
);

-- Create a sequence to generate unique Personid values
CREATE SEQUENCE persons1_seq START WITH 1 INCREMENT BY 1;

-- Create a trigger to auto-generate Personid before inserting a row
CREATE OR REPLACE TRIGGER persons1_trigger
BEFORE INSERT ON Persons1
FOR EACH ROW
BEGIN
    IF :NEW.Personid IS NULL THEN
        SELECT persons1_seq.NEXTVAL INTO :NEW.Personid FROM dual;
    END IF;
END;
/


INSERT INTO persons1 values(11,'reddy','ramana',23);


INSERT INTO persons1(LastName,FirstName,Age) values('reddy','ramana',23);


select * from persons1;

