-- 8.1
CREATE USER C##iare IDENTIFIED BY iare;
-- To see list of users in database:
SELECT USERNAME FROM ALL_USERS;
-- To see current user:
SELECT USER FROM DUAL;
-- To see description of user:
SELECT * FROM DBA_USERS WHERE USERNAME = 'C##IARE';
SELECT USERNAME, ACCOUNT_STATUS FROM DBA_USERS;

-- 8.2

CREATE USER C##new_user IDENTIFIED BY your_password;
CREATE USER C##second_user IDENTIFIED BY your_password;


GRANT DBA TO C##new_user;
-- OR grant specific privileges like:
-- GRANT CONNECT, RESOURCE TO new_user;

GRANT CONNECT, RESOURCE TO C##second_user;
GRANT CREATE SESSION, CREATE TABLE, SELECT ANY TABLE TO C##second_user;


SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'C##SECOND_USER';
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE = 'C##SECOND_USER';
SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE = 'C##SECOND_USER';


-- 8.3
REVOKE CONNECT FROM C##second_user;
REVOKE RESOURCE FROM C##second_user;
REVOKE DBA FROM C##second_user;

REVOKE CREATE SESSION FROM C##second_user;
REVOKE CREATE TABLE FROM C##second_user;
REVOKE SELECT ANY TABLE FROM C##second_user;

-- 8.4

GRANT CREATE SESSION TO C##second_user;

-- sqlplus your_user/your_password@your_service_name
-- sqlplus C##second_user/iare@ORCL in terminal

CONNECT your_user/your_password@your_service_name;

-- 8.5

DROP USER user_name CASCADE;
-- Or DROP USER "User123" CASCADE;
