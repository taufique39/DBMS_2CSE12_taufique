# DBMS LAB ASSIGNMENT 05
---

> **Date:** 12-Feb-2026
---

## Objectives

To retriev & manipulate data from database tables : Employee and Department<br>
In this experiment :<br>
   • Count()   • SUM()<br>
   • MAX()     • MIN()<br>
   • AVG()     • WHERE<br>
   • UPPER()   • LOWER()<br>
   & • LENGTH()<br>
This function help in performing calculation and formatting data in sql.

---

### SQL Problem & Solutions

1. Display the total number of employee working in the company.
```sql
SELECT COUNT(*) 
FROM EMPLOYEE;
```
output:
```sql
+-----------+
| COUNT(*)  |
+-----------+
|      14   |
+-----------+
1 row in set (0.131 sec)
```

2. Display the total salary being paid to all employees.
```sql
SELECT SUM(SAL) 
FROM EMPLOYEE;
```
output:
```sql
+--------------+
| TOTAL_SALARY |
+--------------+
|     31367.50 |
+--------------+
1 row in set (0.011 sec)
```

3. Display the maximum salary from employee table.
```sql
SELECT MAX(SAL) 
FROM EMPLOYEE;
```
output:
```sql
+------------+
| MAX_SALARY |
+------------+
|       5500 |
+------------+
1 row in set (0.006 sec)
```

4. Display the minimum salary from employee table.
```sql
SELECT MIN(SAL) 
FROM EMPLOYEE;
```
output:
```sql
+------------+
| MIN_SALARY |
+------------+
|        880 |
+------------+
1 row in set (0.003 sec)
```

5. Display the average salary from employee table.
```sql
SELECT AVG(SAL) 
FROM EMPLOYEE;
```
output:
```sql
+-------------+
| AVG(SAL)    |
+-------------+
| 2240.535714 |
+-------------+
1 row in set (0.001 sec)
```

6. Display the maximum salary being paid to clerk.
```sql
SELECT MAX(SAL) 
FROM EMPLOYEE 
WHERE JOB = 'CLERK';
```
output:
```sql
+----------+
| MAX(SAL) |
+----------+
|     1430 |
+----------+
1 row in set (0.019 sec)
```

7. Display the maximum salary being paid in dept no 20.
```sql
SELECT MAX(SAL) 
FROM EMPLOYEE 
WHERE DEPTNO = 20;
```
output:
```sql
+----------+
| MAX(SAL) |
+----------+
|     5500 |
+----------+
1 row in set (0.008 sec)
```

8. Display the minimum salary paid to any salesman.
```sql
SELECT MIN(SAL) 
FROM EMPLOYEE 
WHERE JOB = 'SALESMAN';
```
output:
```sql
+----------+
| MIN(SAL) |
+----------+
|     1250 |
+----------+
1 row in set (0.001 sec)
```

9. Display the average salary drawn by managers.
```sql
SELECT AVG(SAL) 
FROM EMPLOYEE 
WHERE JOB = 'MANAGER';
```
output:
```sql
+-------------+
| AVG(sal)    |
+-------------+
| 3034.166667 |
+-------------+
1 row in set (0.001 sec)
```

10. Display the total salary drawn by analyst working in dept no 40.
```sql
SELECT SUM(SAL) 
FROM EMPLOYEE 
WHERE JOB = 'ANALYST' AND DEPTNO = 40;
```
output:
```sql
+----------+
| SUM(SAL) |
+----------+
|     3300 |
+----------+
1 row in set (0.004 sec)
```

11. Display the names of the employee in Uppercase.
```sql
SELECT UPPER(ENAME) 
FROM EMPLOYEE;
```
output:
```sql
+---------------+
| UPPER(ENAME)  |
+---------------+
| SMITH         |
| ALLEN         |
| WARD          |
| JONES         |
| MARTIN        |
| BLAKE         |
| CLARK         |
| SCOTT         |
| KING          |
| TURNER        |
| ADAMS         |
| JAMES         |
| FORD          |
| MILLER        |
+---------------+
14 rows in set (0.001 sec)
```

12. Display the names of the employee in Lowercase.
```sql
SELECT LOWER(ENAME)
FROM EMPLOYEE;
```
output:
```sql
+---------------+
| LOWER(ENAME)  |
+---------------+
| smith         |
| allen         |
| ward          |
| jones         |
| martin        |
| blake         |
| clark         |
| scott         |
| king          |
| turner        |
| adams         |
| james         |
| ford          |
| miller        |
+---------------+
14 rows in set (0.001 sec)
```

13. Display the names of the employee in Proper case.
```sql
SELECT CONCAT(
UPPER(SUBSTRING(ENAME,1,1)), 
LOWER(SUBSTRING(ENAME,2))
) AS NAME_IN_PROPER_CASE 
FROM EMPLOYEE;
```
output:
```sql
+----------------------+
| NAME_IN_PROPER_CASE  |
+----------------------+
| Smith                |
| Allen                |
| Ward                 |
| Jones                |
| Martin               |
| Blake                |
| Clark                |
| Scott                |
| King                 |
| Turner               |
| Adams                |
| James                |
| Ford                 |
| Miller               |
+----------------------+
14 rows in set (0.016 sec)
```

14. Display the length of Your name using appropriate function.
```sql
SELECT LENGTH('TAUFIQUE');
```
output:
```sql
+--------------------+
| LENGTH('TAUFIQUE') |
+--------------------+
|                  8 |
+--------------------+
1 row in set (0.001 sec)
```

15. Display the length of Your name using appropriate function.
```sql
SELECT ENAME, LENGTH(ENAME) 
FROM EMPLOYEE;
```
output:
```sql
+--------+---------------+
| ENAME  | LENGTH(ENAME) |
+--------+---------------+
| SMITH  |             5 |
| ALLEN  |             5 |
| WARD   |             4 |
| JONES  |             5 |
| MARTIN |             6 |
| BLAKE  |             5 |
| CLARK  |             5 |
| SCOTT  |             5 |
| KING   |             4 |
| TURNER |             6 |
| ADAMS  |             5 |
| JAMES  |             5 |
| FORD   |             4 |
| MILLER |             6 |
+--------+---------------+
14 rows in set (0.001 sec)
```