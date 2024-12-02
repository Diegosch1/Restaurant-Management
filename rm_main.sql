rem
rem Header: rm_main.sql
rem
rem Autor - Diego Alejandro Rodríguez
rem 
rem   rm_main.sql - Main script for RM schema
rem
rem DESCRIPTON
rem   This script manages and executes users and scripts necessary for creating tables, 
rem   constraints and their data.
rem   
rem NOTES
rem   Run as SYS or SYSTEM
rem
rem Parametros:
rem   1 - Contraseña para el usuario 'boss'
rem   2 - Contraseña para el usuario SYS
rem   3 - Tablaspace para datos (DEFAULT: USERS)
rem   4 - Tablaspace para TEMP (DEFAULT: TEMP)
rem   5 - Ruta del esquema (DEFAULT: $ORACLE_HOME/demo/schema/restaurant_management/)

SET ECHO OFF
SET VERIFY OFF

PROMPT
PROMPT Specify password for the user 'boss' as parameter 1:
DEFINE pass = &1

PROMPT
PROMPT Specify password for SYS as parameter 2:
DEFINE sys_pass = &2

PROMPT
PROMPT Specify tablespace for data (DEFAULT: USERS) as parameter 3:
DEFINE tbs = &3

PROMPT
PROMPT Specify tablespace for TEMP (DEFAULT: TEMP) as parameter 4:
DEFINE ttbs = &4

PROMPT
PROMPT Specify schema path (DEFAULT: $ORACLE_HOME/demo/schema/restaurant_management/) as parameter 5:
DEFINE schema_path = &5

PROMPT
DEFINE spool_file = rm_main.log

SET VERIFY ON

SPOOL &spool_file

REM =======================================================
REM cleanup section
REM =======================================================

BEGIN
   FOR r IN (SELECT granted_role FROM dba_role_privs WHERE grantee = 'BOSS') LOOP
      EXECUTE IMMEDIATE 'REVOKE ' || r.granted_role || ' FROM BOSS';
   END LOOP;

   FOR p IN (SELECT privilege FROM dba_sys_privs WHERE grantee = 'BOSS') LOOP
      EXECUTE IMMEDIATE 'REVOKE ' || p.privilege || ' FROM BOSS';
   END LOOP;

   FOR q IN (SELECT privilege FROM dba_tab_privs WHERE grantee = 'BOSS') LOOP
      EXECUTE IMMEDIATE 'REVOKE ' || q.privilege || ' ON ' || q.owner || '.' || q.table_name || ' FROM BOSS';
   END LOOP;
END;
/

BEGIN
   FOR b IN (SELECT sid, serial# FROM v$session WHERE username = 'BOSS') LOOP
      EXECUTE IMMEDIATE 'ALTER SYSTEM KILL SESSION ''' || b.sid || ',' || b.serial# || ''' IMMEDIATE';
   END LOOP;
END;
/

DROP USER boss CASCADE;

REM =======================================================
REM Create user boss
REM =======================================================

ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER boss IDENTIFIED BY &pass;

ALTER USER boss DEFAULT TABLESPACE &tbs
                     QUOTA UNLIMITED ON &tbs;

ALTER USER boss TEMPORARY TABLESPACE &ttbs;

GRANT CREATE SESSION, CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO boss;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, CREATE TABLE, CREATE PROCEDURE TO boss;

REM =======================================================
REM Create objects
REM =======================================================

CONNECT boss/&pass

PROMPT
PROMPT Creating tables, sequences, and constraints...
@&schema_path.rm_cre.sql

PROMPT
PROMPT Inserting data into the tables...
@&schema_path.rm_popul.sql

PROMPT
PROMPT Adding comments to the tables and columns...
@&schema_path.rm_comnt.sql

REM =======================================================
REM Collect schema statistics
REM =======================================================

PROMPT
PROMPT Collecting schema statistics...
BEGIN
   DBMS_STATS.GATHER_SCHEMA_STATS(OWNNAME => 'BOSS');
END;
/

SPOOL OFF;

PROMPT
PROMPT *** Restaurant Management *** schema setup completed
PROMPT
