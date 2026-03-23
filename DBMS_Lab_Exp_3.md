# DBMS LAB ASSIGNMENT 03
---

> **Date:** 04-Feb-2026
---

## Objectives

To retrieve required data from Employee and Department table using : WHERE, LIKE, 
ORDER BY, IN , OR

In this Experiment SELECT command is used to display records from EMPLOYEE table.<br>
WHERE clause is used to apply conditions.<br>
OEDER BY is used to sort data in ascendng or descending order.<br>
LIKE is used for pattern matching.<br>
IN is used to match multiple values.<br>
AND/OR operators are used to combine conditions.

---

### SQL Problem & Solutions

 1. List all employees and jobs in Department 30 in descending order of salary
```sql
SELECT ENAME, JOB, SAL
FROM EMPLOYEE
WHERE DEPTNO = 30
ORDER BY SAL DESC;
```
output:
```sql
+--------+----------+------+
| ENAME  | JOB      | SAL  |
+--------+----------+------+
| BLAKE  | MANAGER  | 2850 |
| ALLEN  | SALESMAN | 1600 |
| TURNER | SALESMAN | 1500 |
| WARD   | SALESMAN | 1250 |
| MARTIN | SALESMAN | 1250 |
| JAMES  | CLERK    |  950 |
+--------+----------+------+
6 rows in set (0.001 sec)
```

2. LIST JOB AND DEPARTMENT NUMBER OF EMPLOYEES WHOSE NAME IS 5 LETTERS LONG, BEGINS WITH ‘A’ AND ENDS WITH ‘N’
```sql
SELECT JOB, DEPTNO
FROM EMPLOYEE
WHERE ENAME LIKE 'A___N';
```
output:
```sql
+----------+--------+
| JOB      | DEPTNO |
+----------+--------+
| SALESMAN |     30 |
+----------+--------+
1 row in set (0.003 sec)
```

3. DISPLAY THE NAME OF EMPLOYEES WHOSE NAME STARTS WITH ALPHABET S
```sql
SELECT ENAME
FROM EMPLOYEE
WHERE ENAME LIKE 'S%';
```
output:
```sql
+-------+
| ENAME |
+-------+
| SMITH |
| SCOTT |
+-------+
2 rows in set (0.001 sec)
```

4. DISPLAY THE NAMES OF EMPLOYEES WHOSE NAME ENDS WITH ALPHABET S
```sql
SELECT ENAME
FROM EMPLOYEE
WHERE ENAME LIKE '%S';
```
output:
```sql
+-------+
| ENAME |
+-------+
| JONES |
| ADAMS |
| JAMES |
+-------+
3 rows in set (0.001 sec)
```

5. DISPLAY THE NAMES OF EMPLOYEES WORKING IN DEPT 10 OR 20 OR 40 OR WORKING AS CLERK, SALESMAN OR ANALYST
```sql
SELECT ENAME
FROM EMPLOYEE
WHERE DEPTNO IN (10, 20, 40)
OR JOB IN ('CLERK', 'SALESMAN', 'ANALYST');
```
output:
```sql
+--------+
| ENAME  |
+--------+
| SMITH  |
| ALLEN  |
| WARD   |
| JONES  |
| MARTIN |
| CLARK  |
| SCOTT  |
| KING   |
| TURNER |
| ADAMS  |
| JAMES  |
| FORD   |
| MILLER |
+--------+
13 rows in set (0.003 sec)
```

6. DISPLAY EMPLOYEE NUMBER AND NAME OF EMPLOYEES WHO EARN COMMISSION
```sql
SELECT EMPNO, ENAME
FROM EMPLOYEE
WHERE COMM IS NOT NULL;
```
output:
```sql
+-------+--------+
| EMPNO | ENAME  |
+-------+--------+
|  7499 | ALLEN  |
|  7521 | WARD   |
|  7654 | MARTIN |
|  7844 | TURNER |
+-------+--------+
4 rows in set (0.000 sec)
```

7. DISPLAY EMPLOYEE NUMBER AND TOTAL SALARY FOR EACH EMPLOYEE
```sql
SELECT EMPNO, SAL + IFNULL(COMM, 0) AS TOTALSALARY
FROM EMPLOYEE;
```
output:
```sql
+-------+--------------+
| EMPNO | TOTALSALARY  |
+-------+--------------+
|  7369 |          800 |
|  7499 |         1900 |
|  7521 |         1550 |
|  7566 |         2975 |
|  7654 |         2650 |
|  7698 |         2850 |
|  7782 |         2450 |
|  7788 |         3000 |
|  7839 |         5000 |
|  7844 |         1500 |
|  7876 |         1100 |
|  7900 |          950 |
|  7902 |         3000 |
|  7934 |         1300 |
+-------+--------------+
14 rows in set (0.005 sec)
```

8. DISPLAY EMPLOYEE NUMBER AND ANNUAL SALARY FOR EACH EMPLOYEE
```sql
SELECT EMPNO, SAL * 12 AS ANNUAL_SALARY
FROM EMPLOYEE;
```
output:
```sql
+-------+---------------+
| EMPNO | ANNUAL_SALARY |
+-------+---------------+
|  7369 |          9600 |
|  7499 |         19200 |
|  7521 |         15000 |
|  7566 |         35700 |
|  7654 |         15000 |
|  7698 |         34200 |
|  7782 |         29400 |
|  7788 |         36000 |
|  7839 |         60000 |
|  7844 |         18000 |
|  7876 |         13200 |
|  7900 |         11400 |
|  7902 |         36000 |
|  7934 |         15600 |
+-------+---------------+
14 rows in set (0.001 sec)
```

9. DISPLAY NAMES OF ALL EMPLOYEES WORKING AS CLERKS AND DRAWING SALARY MORE THAN 3000
```sql
SELECT ENAME
FROM EMPLOYEE
WHERE JOB = 'CLERK'
AND SAL > 3000;
```
output:
```sql
Empty set (0.002 sec)
```

10. DISPLAY NAMES OF EMPLOYEES WORKING AS CLERK, SALESMAN OR ANALYST AND DRAWING SALARY MORE THAN 3000
```sql
SELECT ENAME
FROM EMPLOYEE
WHERE JOB IN ('CLERK', 'SALESMAN', 'ANALYST')
AND SAL > 3000;
```
output:
```sql
Empty set (0.001 sec)
```