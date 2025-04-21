SET SERVEROUTPUT ON

-- 9.1
DECLARE
  message varchar2(20) := 'Hello, World!';
BEGIN
  dbms_output.put_line(message);
END;
/



-- 9.2

DECLARE
    var1 INTEGER :=20;
    var2 INTEGER :=40;
    var3 INTEGER ;
    var4 REAL;
BEGIN
    var3 := var1 + var2;
    DBMS_OUTPUT.PUT_LINE(' Value of var3 is : ' || var3);
    var4 := 50.0/3.0;
    DBMS_OUTPUT.PUT_LINE(' Value of var4 is : ' || var4);
END;
/


-- 9.3

DECLARE
  -- Global variables
  m CHAR(20) := 'softwareTest!';
  n VARCHAR2(30) := 'plsql';
  o NCHAR(30) := 'plsql datatypes';
  p NVARCHAR2(30) := 'plsql literals';
  presentDt DATE := SYSDATE;
  a INTEGER := 16;
  b NUMBER(20) := 11.2;
  c DOUBLE PRECISION := 14.7;

BEGIN
  -- Display global variables
  dbms_output.put_line('--- Global Variables ---');
  dbms_output.put_line('Global CHAR: ' || m);
  dbms_output.put_line('Global VARCHAR2: ' || n);
  dbms_output.put_line('Global NCHAR: ' || o);
  dbms_output.put_line('Global NVARCHAR2: ' || p);
  dbms_output.put_line('Global DATE: ' || presentDt);
  dbms_output.put_line('Global INTEGER: ' || a);
  dbms_output.put_line('Global NUMBER: ' || b);
  dbms_output.put_line('Global DOUBLE PRECISION: ' || c);

  -- Inner block with local variables
  DECLARE
    m VARCHAR2(20) := 'localTest';
    a INTEGER := 99;
  BEGIN
    dbms_output.put_line('--- Local Variables ---');
    dbms_output.put_line('Local m (VARCHAR2): ' || m);
    dbms_output.put_line('Local a (INTEGER): ' || a);
    
    -- Also showing access to global b
    dbms_output.put_line('Accessing global b inside local block: ' || b);
  END;

  -- Back in the global block
  dbms_output.put_line('--- After Local Block ---');
  dbms_output.put_line('Global m still: ' || m);
  dbms_output.put_line('Global a still: ' || a);

END;
/