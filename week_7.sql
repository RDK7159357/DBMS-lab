-- 7.1
create table class (id NUMBER(5),Name char(10));

 insert into class values(1,'one');
 insert into class values(2,'two');


 -- Start a transaction
SET TRANSACTION READ WRITE;

-- Insert a record into CLASS
INSERT INTO CLASS VALUES(3, 'THREE');

-- Create a savepoint named A
SAVEPOINT A;

-- Insert another record into CLASS
INSERT INTO CLASS VALUES(4, 'FOUR');

-- Create a savepoint named B
SAVEPOINT B;

-- Update a record in CLASS
UPDATE CLASS SET NAME='RAJ' WHERE id=1;

-- Create a savepoint named C
SAVEPOINT C;

ROLLBACK TO SAVEPOINT A;

-- 7.3

-- Start a transaction
SET TRANSACTION READ WRITE;

-- Insert a record
INSERT INTO CLASS VALUES(3, 'THREE');

-- Create a savepoint
SAVEPOINT A;

-- Insert another record
INSERT INTO CLASS VALUES(4, 'FOUR');

-- Create another savepoint
SAVEPOINT B;

-- Update a record
UPDATE CLASS SET NAME='RAJ' WHERE id=1;

-- Create another savepoint
SAVEPOINT C;

-- If you want to roll back to a specific savepoint
ROLLBACK TO SAVEPOINT B;  -- This will undo changes after SAVEPOINT B

-- If you want to commit changes
COMMIT;
