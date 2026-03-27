# DBMS LAB ASSIGNMENT 07
---

> **Date:** 25-Feb-2026
---

## Objectives

To retriev & manipulate data from database tables : Employee<br>
  • GROUP BY – To group records (DEPTNO, JOB)<br>
  • AGGREGATE FUNCTIONS – COUNT(), SUM(), MAX(), MIN(), AVG()<br>
  • CASE – For conditional calculations (pivot/matrix queries)<br>
  • DATE FUNCTIONS – CURDATE(), DATEDIFF(), LAST_DAY(), YEAR()<br>
  • FORMAT(), CONCAT() – For displaying formatted output

  ---

### SQL Problem & Solutions

1. Compute the no. of days remaining in this year.
```sql
SELECT DATEDIFF(CONCAT(YEAR(CURDATE()), '-12-31'), CURDATE()) 
AS DAYS_REMAINING;
```
output:
```sql
+----------------+
| DAYS_REMAINING |
+----------------+
|            280 |
+----------------+
1 row in set (0.009 sec)
```

2. Find the highest and lowest salaries and the difference between of them.
```sql
SELECT MAX(SAL) AS HIGHEST_SALARY,
       MIN(SAL) AS LOWEST_SALARY,
       MAX(SAL) - MIN(SAL) AS DIFFERENCE
FROM EMPLOYEE;
```
output:
```sql
+----------------+---------------+------------+
| HIGHEST_SALARY | LOWEST_SALARY | DIFFERENCE |
+----------------+---------------+------------+
|        5500.00 |        880.00 |    4620.00 |
+----------------+---------------+------------+
1 row in set (0.044 sec)
```

3. List employee whose commission is greater than 25% of their salaries.
```sql
SELECT * FROM EMPLOYEE
WHERE COMM > 0.25 * SAL;
```
output:
```sql
+-------+--------+----------+------+------------+---------+---------+--------+
| EMPNO | ENAME  | JOB      | MGR  | HIREDATE   | SAL     | COMM    | DEPTNO |
+-------+--------+----------+------+------------+---------+---------+--------+
|  7654 | MARTIN | SALESMAN | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
+-------+--------+----------+------+------------+---------+---------+--------+
1 row in set (0.006 sec)
```

4. Make a query that displays salary in dollar format.
```sql
SELECT ENAME, CONCAT('$', FORMAT(SAL, 2)) AS SALARY
FROM EMPLOYEE;
```
output:
```sql
+--------+-----------+
| ENAME  | SALARY    |
+--------+-----------+
| SMITH  | $880.00   |
| ALLEN  | $1,600.00 |
| WARD   | $1,250.00 |
| JONES  | $3,272.50 |
| MARTIN | $1,250.00 |
| BLAKE  | $3,135.00 |
| CLARK  | $2,695.00 |
| SCOTT  | $3,300.00 |
| KING   | $5,500.00 |
| TURNER | $1,500.00 |
| ADAMS  | $1,210.00 |
| JAMES  | $1,045.00 |
| FORD   | $3,300.00 |
| MILLER | $1,430.00 |
+--------+-----------+
14 rows in set (0.004 sec)
```

5. Create a matrix query to display the job, the salary for that job based on department number, and the total salary for that job for all departments, giving each column an appropriate heading.
```sql
SELECT JOB,
SUM(CASE WHEN DEPTNO = 10 THEN SAL ELSE 0 END) AS DEPT10,
SUM(CASE WHEN DEPTNO = 20 THEN SAL ELSE 0 END) AS DEPT20,
SUM(CASE WHEN DEPTNO = 30 THEN SAL ELSE 0 END) AS DEPT30,
SUM(SAL) AS TOTAL
FROM EMPLOYEE
GROUP BY JOB;
```
output:
```sql
+-----------+--------+---------+---------+---------+
| JOB       | DEPT10 | DEPT20  | DEPT30  | TOTAL   |
+-----------+--------+---------+---------+---------+
| CLERK     |   0.00 | 3520.00 | 1045.00 | 4565.00 |
| SALESMAN  |   0.00 |    0.00 | 5600.00 | 5600.00 |
| MANAGER   |   0.00 | 5967.50 | 3135.00 | 9102.50 |
| ANALYST   |   0.00 | 3300.00 |    0.00 | 6600.00 |
| PRESIDENT |   0.00 | 5500.00 |    0.00 | 5500.00 |
+-----------+--------+---------+---------+---------+
5 rows in set (0.008 sec)
```

6. Query that will display the total no of employees, and of that total the number who were hired in 1980, 1981, 1982 and 1983. Give appropriate column heading.
```sql
SELECT COUNT(*) AS TOTAL,
SUM(CASE WHEN YEAR(HIREDATE) = 1980 THEN 1 ELSE 0 END) AS Y1980,
SUM(CASE WHEN YEAR(HIREDATE) = 1981 THEN 1 ELSE 0 END) AS Y1981,
SUM(CASE WHEN YEAR(HIREDATE) = 1982 THEN 1 ELSE 0 END) AS Y1982,
SUM(CASE WHEN YEAR(HIREDATE) = 1983 THEN 1 ELSE 0 END) AS Y1983
FROM EMPLOYEE;
```
output:
```sql
+-------+-------+-------+-------+-------+
| TOTAL | Y1980 | Y1981 | Y1982 | Y1983 |
+-------+-------+-------+-------+-------+
|    14 |     1 |    11 |     1 |     1 |
+-------+-------+-------+-------+-------+
1 row in set (0.002 sec)
```

7. Query to get the last Sunday of Any Month.
```sql
SELECT DATE_SUB(LAST_DAY(CURDATE()), 
INTERVAL (DAYOFWEEK(LAST_DAY(CURDATE())) - 1) DAY) AS LAST_SUNDAY;
```
output:
```sql
+-------------+
| LAST_SUNDAY |
+-------------+
| 2026-03-29  |
+-------------+
1 row in set (0.004 sec)
```

8. Display department numbers and total number of employees working in each department.
```sql
SELECT DEPTNO, COUNT(*) AS TOTAL_EMPLOYEES
FROM EMPLOYEE
GROUP BY DEPTNO;
```
output:
```sql
+--------+-----------------+
| DEPTNO | TOTAL_EMPLOYEES |
+--------+-----------------+
|     20 |               7 |
|     30 |               6 |
|     40 |               1 |
+--------+-----------------+
3 rows in set (0.004 sec)
```

9. Display the various jobs and total number of employees within each job group.
```sql
SELECT JOB, COUNT(*) AS TOTAL_EMPLOYEES
FROM EMPLOYEE
GROUP BY JOB;
```
output:
```sql
+-----------+-----------------+
| JOB       | TOTAL_EMPLOYEES |
+-----------+-----------------+
| CLERK     |               4 |
| SALESMAN  |               4 |
| MANAGER   |               3 |
| ANALYST   |               2 |
| PRESIDENT |               1 |
+-----------+-----------------+
5 rows in set (0.001 sec)
```

10. Display the depart numbers and total salary for each department.
```sql
SELECT DEPTNO, SUM(SAL) AS TOTAL_SALARY
FROM EMPLOYEE
GROUP BY DEPTNO;
```
output:
```sql
+--------+--------------+
| DEPTNO | TOTAL_SALARY |
+--------+--------------+
|     20 |     18287.50 |
|     30 |      9780.00 |
|     40 |      3300.00 |
+--------+--------------+
3 rows in set (0.002 sec)
```
