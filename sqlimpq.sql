
delete from emp where dept_id =
(select dept_id from dept where dept_name like '%public%'); --deleting rows based on another table
---------------------------------------------------------------------------------------------------------------
comment on table emp is 'emp information';  -- comments can be viewed through (All_TAB_comments,user_tab_comments)
---------------------------------------------------------------------------------------------------------------------
oracle tables
ALL_COL_COMMENTS	--Comments on columns of accessible tables and views
ALL_CONSTRAINTS	    --Constraint definitions on accessible tables
ALL_DB_LINKS	    --Database links accessible to the user
ALL_ERRORS	        --Current errors on stored objects that user is allowed to create
ALL_INDEXES	        --Descriptions of indexes on tables accessible to the user
ALL_OBJECTS	        --Objects accessible to the user
ALL_OBJECT_TABLES	--Description of all object tables accessible to the user
ALL_TRIGGERS	    --Triggers accessible to the current user
DBA_DB_LINKS	    --All database links in the database
DBA_ROLE_PRIVS	    --Roles granted to users and roles
--------------------------------------------------------------------------------------------------------------------------
Employee   Emp# Manager Mgr# 
   BLAKE   7698 KING    7839 
   CLARK   7782 KING    7839 
   JONES   7566 KING    7839 
   MARTIN  7654 BLAKE   7698 
   ALLEN   7499 BLAKE   7698 
   TURNER  7844 BLAKE   7698 
   JAMES   7900 BLAKE   7698 
   WARD    7521 BLAKE   7698 
   FORD    7902 JONES   7566 
   SMITH   7369 FORD    7902 
   SCOTT   7788 JONES   7566 
   ADAMS   7876 SCOTT   7788 
   MILLER  7934 CLARK   7782 

SELECT ename, empno, (SELECT ename FROM EMP WHERE empno = mgr)AS MANAGER, mgr from emp order by empno;
SELECT e.ename, e.empno, m.ename as manager, e.mgr FROM emp e, emp m WHERE e.mgr = m.empno
--------------------------------------------------------------------------------------------------------------------------------
SELECT REGEXP_COUNT ('TechOnTheNet is a great resource', 't')
FROM dual;
Result: 2
----------------------------------------------------------------------------------------------------------------------------------
 Select Employee_name,Salary/12 as ‘Monthly Salary’ from employee; --monthly salary of an emplyee if annual salary is given
 Select * from Employee where Rownum =1; -- 1 st record from emp
 Select * from Employee where Rowid= select max(Rowid) from Employee; --last record from emp table 
 Select * from Employee  where rownum = &n;  -- to display Nth Record from Employee table
 Create table Employee_1 as Select * from Employee where 1=2;      --Can i create table with same structure of Employee table
 Select rownum,E.* from Employee E where rownum<=(Select count(*/2) from Employee); --selecting 50% records
 Select * from Employee;
 Intersect
 Select * from Employee1;    ---common records
 
 21.how to write sql query for the below scenario
I/p:ORACLE

O/p:
O
R
A
C
L
E
i.e, splitting into multiple columns a string using sql.

Answer:

Select Substr(‘ORACLE’,Level,1) From Dual
Connect By Level<= Length(‘ORACLE’);
------------------------------------------------------------------------------------------------------------------------------------
select * from Employee where To_char(Joining_date,’YYYY’)=’2017′; --fetching records who joined on 2017

Write an SQL Query find number of employees according to gender  whose DOB is between 01/01/1960 to 31/12/1975.
SELECT COUNT(*), sex from Employees WHERE DOB BETWEEN '01/01/1960' AND '31/12/1975' Group by sex

-------------------------------------------------------------------------------------------------------------------------------------
--Query for listing Deptno, ename, sal, SUM(sal in that dept) :
      
SELECT a.deptno, ename, sal, (SELECT SUM(sal) FROM emp b WHERE a.deptno = b.deptno) 
FROM emp a
ORDER BY a.deptno;
-------------------------------------------------------------------------------------------------------------------------------------
SELECT job "Job", SUM (DECODE (deptno, 10, sal)) "Dept 10",
		     SUM (DECODE (deptno, 20, sal)) "Dept 20",
		     SUM (DECODE (deptno, 30, sal)) "Dept 30",
		     SUM (sal) "Total"
FROM emp
GROUP BY job ;

------------------------------------------------------------------------------------------------------------------------------------
--Query for getting the following output as many number of rows in the table :

*
**
***
****
*****

SELECT RPAD(DECODE(temp,temp,'*'),ROWNUM,'*') 
FROM srinu1;
--------------------------------------------------------------------------------------------------------------------------------------
.Retrieving  the Nth row FROM a table. 						         	         VI
  select * from emp where rownum < :n+1
  minus
  select * from emp where rownum < :n

Query that will display the total no. of employees, and of that total the number who were hired in 1980, 1981, 1982, and 1983. Give appropriate column headings.

I am looking at the following output. We need to stick to this format.

Total		1980		        1981		1982		  1983
-----------	------------	------------	-------------	-----------
14		       1		            10		      2		      1


SELECT COUNT (*),  COUNT(DECODE(TO_CHAR (hiredate, 'YYYY'),'1980', empno)) "1980",
	  	     COUNT (DECODE (TO_CHAR (hiredate, 'YYYY'), '1981', empno)) "1981",
		     COUNT (DECODE (TO_CHAR (hiredate, 'YYYY'), '1982', empno)) "1982",
		     COUNT (DECODE (TO_CHAR (hiredate, 'YYYY'), '1983', empno)) "1983"
FROM emp;

Index

III. Query for listing Deptno, ename, sal, SUM(sal in that dept) :
      
SELECT a.deptno, ename, sal, (SELECT SUM(sal) FROM emp b WHERE a.deptno = b.deptno) 
FROM emp a
ORDER BY a.deptno;

IV. Create a matrix query to display the job, the salary for that job based on department number, and the total salary for that job for all departments, giving each column an appropriate heading.

SELECT job "Job", SUM (DECODE (deptno, 10, sal)) "Dept 10",
		     SUM (DECODE (deptno, 20, sal)) "Dept 20",
		     SUM (DECODE (deptno, 30, sal)) "Dept 30",
		     SUM (sal) "Total"
FROM emp
GROUP BY job ;

Query to get the product of all the values of a column :

SELECT EXP(SUM(LN(col1))) FROM srinu;
------------------------------------------------------------------------------------------------------------------------------------------

XIX. SELECT Query for counting No of words :

SELECT ename,
NVL(LENGTH(REPLACE(TRANSLATE(UPPER(RTRIM(ename)),'ABCDEFGHIJKLMNOPQRSTUVWXYZ'' ','    @'),' ',''))+1,1) word_length
FROM emp;

Explanation :
TRANSLATE(UPPER(RTRIM(ename)),'ABCDEFGHIJKLMNOPQRSTUVWXYZ'' ','   @') -- This will translate all the characters FROM A-Z including a single quote to a space. It will also translate a space to a @. 
REPLACE(TRANSLATE(UPPER(RTRIM(ename)),'ABCDEFGHIJKLMNOPQRSTUVWXYZ'' ','   @'),' ','') -- This will replace every space with nothing in the above result.
LENGTH(REPLACE(TRANSLATE(UPPER(RTRIM(ename)),'ABCDEFGHIJKLMNOPQRSTUVWXYZ'' ','  @'),' ',''))+1 -- This will give u the count of @ characters in the above result.
-----------------------------------------------------------------------------------------------------------------------------------------
-- leap year
SELECT hiredate, TO_CHAR (hiredate, 'Day') weekday 
          FROM emp 
          WHERE is_leap_year (hiredate) = 'Y';

XXI. Query for removing all non-numeric :

SELECT 
TRANSLATE(LOWER(ssn),'abcdefghijklmnopqrstuvwxyz- ','') 
FROM DUAL;

Index

XXII. Query for translating a column values to INITCAP :

SELECT 
TRANSLATE(INITCAP(temp),
SUBSTR(temp, INSTR(temp,'''')+1,1), LOWER(SUBSTR(temp, INSTR(temp,'''')+1)))
FROM srinu1;
-----------------------------------------------------------------------------------------------------------------------------------------
XXX. Query to get the last Sunday of any month :

SELECT NEXT_DAY(LAST_DAY(TO_DATE('26-10-2001','DD-MM-YYYY')) - 7,'sunday') 
FROM DUAL;

XXXIV. Query to get the DB Name:

SELECT name FROM v$database;

Index

XXXV. Getting the current default schema :

SELECT SYS_CONTEXT('USERENV','CURRENT_SCHEMA') FROM DUAL;

Index

XXXVI. Query to get all the column names of a particular table :

SELECT column_name
FROM all_tab_columns
WHERE TABLE_NAME = 'ORDERS';

Index

XXXVII. How do I spool only the query result to a file in SQLPLUS :

Place the following lines of code in a file and execute the file in SQLPLUS :

set heading off
set feedback off
set colsep '        '
set termout off
set verify off
spool c:\srini.txt
SELECT empno,ename FROM emp; /* Write your Query here */
spool off
/
------------------------------------------------------------------------------------------------------------------------------------------
XXXVIII. Query for getting the current SessionID :

SELECT SYS_CONTEXT('USERENV','SESSIONID') Session_ID FROM DUAL; 

XXXX. Query to count no. Of columns in a table:

SELECT COUNT(column_name) 
FROM user_tab_columns 
WHERE table_name = 'MYTABLE';

XXXXVIII. How do you remove Trailing blanks in a spooled file :
Change the Environment Options Like this :
set trimspool on
set trimout on
--------------------------------------------------------------------------------------------------------------------------------------------- 

SELECT *
FROM   (SELECT product_code, quantity
        FROM   pivot_test)
PIVOT  (SUM(quantity) AS sum_quantity FOR (product_code) IN ('A' AS a, 'B' AS b, 'C' AS c));

A_SUM_QUANTITY B_SUM_QUANTITY C_SUM_QUANTITY
-------------- -------------- --------------
           210             90            160

1 row selected.

SELECT *
FROM   (SELECT customer_id, product_code, quantity
        FROM   pivot_test)
PIVOT  (SUM(quantity) AS sum_quantity FOR (product_code) IN ('A' AS a, 'B' AS b, 'C' AS c))
ORDER BY customer_id;

CUSTOMER_ID A_SUM_QUANTITY B_SUM_QUANTITY C_SUM_QUANTITY
----------- -------------- -------------- --------------
          1             10             20             30
          2             40                            50
          3             60             70             80
          4            100

4 rows selected.

SELECT customer_id,
       SUM(DECODE(product_code, 'A', quantity, 0)) AS a_sum_quantity,
       SUM(DECODE(product_code, 'B', quantity, 0)) AS b_sum_quantity,
       SUM(DECODE(product_code, 'C', quantity, 0)) AS c_sum_quantity
FROM   pivot_test
GROUP BY customer_id
ORDER BY customer_id;

CUSTOMER_ID A_SUM_QUANTITY B_SUM_QUANTITY C_SUM_QUANTITY
----------- -------------- -------------- --------------
          1             10             20             30
          2             40              0             50
          3             60             70             80
          4            100              0              0

4 rows selected.

SELECT *
FROM   unpivot_test
UNPIVOT (quantity FOR product_code IN (product_code_a AS 'A', product_code_b AS 'B', product_code_c AS 'C', product_code_d AS 'D'));

        ID CUSTOMER_ID P   QUANTITY
---------- ----------- - ----------
         1         101 A         10
         1         101 B         20
         1         101 C         30
         2         102 A         40
         2         102 C         50
         3         103 A         60
         3         103 B         70
         3         103 C         80
         3         103 D         90
         4         104 A        100

10 rows selected.


There are several things to note about the query:

The required column names, in this case QUANTITY and PRODUCT_CODE, are define in the UNPIVOT clause. These can be set to any name not currently in the driving table.
The columns to be unpivoted must be named in the IN clause.
The PRODUCT_CODE value will match the column name it is derived from, unless you alias it to another value.
By default the EXCLUDE NULLS clause is used. To override the default behaviour use the INCLUDE NULLS clause.

ELECT id,
       customer_id,
       DECODE(unpivot_row, 1, 'A',
                           2, 'B',
                           3, 'C',
                           4, 'D',
                           'N/A') AS product_code,
       DECODE(unpivot_row, 1, product_code_a,
                           2, product_code_b,
                           3, product_code_c,
                           4, product_code_d,
                           'N/A') AS quantity
FROM   unpivot_test,
       (SELECT level AS unpivot_row FROM dual CONNECT BY level <= 4)
ORDER BY 1,2,3;

        ID CUSTOMER_ID PRO   QUANTITY
---------- ----------- --- ----------
         1         101 A           10
         1         101 B           20
         1         101 C           30
         1         101 D
         2         102 A           40
         2         102 B
         2         102 C           50
         2         102 D
         3         103 A           60
         3         103 B           70
         3         103 C           80

        ID CUSTOMER_ID PRO   QUANTITY
---------- ----------- --- ----------
         3         103 D           90
         4         104 A          100
         4         104 B
         4         104 C
         4         104 D

16 rows selected.


Use SQL within group for moving rows onto one line and listagg to display multiple column values in a single column

select deptno, listagg (ename, ',') 
WITHIN GROUP 
(ORDER BY ename) enames
FROM emp
GROUP BY deptno

    DEPTNO ENAMES                                            
---------- --------------------------------------------------
        10 CLARK,KING,MILLER                                 
        20 ADAMS,FORD,JONES,SCOTT,SMITH                
        30 ALLEN,BLAKE,JAMES,MARTIN,TURNER,WARD     

•	Use the Oracle analytic Lag-Over Function

SELECT ename,hiredate,sal,LAG (sal, 1, 0)   
   OVER (ORDER BY hiredate) AS PrevSal
FROM emp
WHERE job = 'CLERK';

The Oracle/PLSQL LAG function is an analytic function that lets you query more than one row in a table at a time without having to join the table to itself. It returns values from a previous row in the table. To return a value from the next row, try using the LEAD function.

Syntax:

LAG ( expression [, offset [, default] ] )
OVER ( [ query_partition_clause ] order_by_clause )

-----------------------------------------------------------------
List employees (names) who have a bigger salary than their boss
SELECT e.name AS 'Employee Name', e2.name AS 'Boss', 
e.salary AS 'Employee salary', e2.salary AS 'Boss salary'
FROM employees e
JOIN employees e2 ON e.boss_id = e2.employee_id
WHERE e2.salary < e.salary;
List employees who have the biggest salary IN their departments
SELECT d.name as department, e.name as max_earner, MAX(e.salary) as salary
FROM employees e
JOIN departments d ON e.department_id=d.id
GROUP BY e.department_id;
List departments that have less than 3 people IN it
SELECT d.Name AS 'Department'
FROM departments d JOIN employees e 
ON e.department_id = d.Department_id
GROUP BY d.department_id
HAVING COUNT(e.employee_id) < 3
List ALL departments along WITH the NUMBER OF people there (tricky - people often do an "inner join" leaving OUT empty departments)
SELECT d.name, COUNT(e.department_id) AS num_employees
FROM departments d LEFT JOIN employees e ON d.id=e.department_id
GROUP BY d.id
List employees that don't have a boss in the same department
SELECT e.name 
FROM employees e JOIN employees b ON e.boss_id=b.id
WHERE e.department_id != b.department_id
OR b.boss_id is NULL
List all departments along with the total salary there
SELECT d.name AS 'Department', SUM(e.salary) AS 'Total Salary'
FROM departments d LEFT OUTER JOIN employees e 
ON d.department_id = e.department_id
GROUP BY d.department_id