# DBMS LAB ASSIGNMENT 06
---

> **Date:** 18-Feb-2026
---

## Objectives

This experiment uses SQL commands to retrieve and manipulate data using :-<br>
• DATEDIFF()   •TIMESTAMPDIFF()<br>
• CURDATE()   • NOW()<br>
• DATE_FORMAT()   •DATE_ADD()<br>
• DATE_SUB()   •MONTH()<br>
• DAY()   •YEAR()

---

### SQL Problem & Solutions

1. Display empno, ename, deptno from employee table. Instead of display department numbers display the related department name (Use decode function).
```sql
SELECT EMPNO, ENAME,
CASE DEPTNO
WHEN 10 THEN 'ACCOUNTING'
WHEN 20 THEN 'RESEARCH'
WHEN 30 THEN 'SALES'
WHEN 40 THEN 'OPERATIONS'
END AS DEPARTMENT_NAME
FROM EMPLOYEE;
```
output:
```sql
+-------+--------+-----------------+
| EMPNO | ENAME  | DEPARTMENT_NAME |
+-------+--------+-----------------+
|  7369 | SMITH  | ACCOUNTUNG      |
|  7499 | ALLEN  | SALES           |
|  7521 | WARD   | SALES           |
|  7566 | JONES  | ACCOUNTUNG      |
|  7654 | MARTIN | SALES           |
|  7698 | BLAKE  | SALES           |
|  7782 | CLARK  | ACCOUNTUNG      |
|  7788 | SCOTT  | OPERATIONS      |
|  7839 | KING   | ACCOUNTUNG      |
|  7844 | TURNER | SALES           |
|  7876 | ADAMS  | ACCOUNTUNG      |
|  7900 | JAMES  | SALES           |
|  7902 | FORD   | ACCOUNTUNG      |
|  7934 | MILLER | ACCOUNTING      |
+-------+--------+-----------------+
14 rows in set (0.155 sec)
```

2. Display your age in days.
```sql
SELECT DATEDIFF(CURDATE(), '2002-08-15') AS AGE_IN_DAYS;
```
output:
```sql
+-------------+
| AGE_IN_DAYS |
+-------------+
|        7260 |
+-------------+
1 row in set (0.008 sec)
```

3. Display your age in months.
```sql
SELECT TIMESTAMPDIFF(MONTH, '2002-08-15', CURDATE()) AS AGE_IN_MONTHS;
```
output:
```sql
+---------------+
| AGE_IN_MONTHS |
+---------------+
|           238 |
+---------------+
1 row in set (0.006 sec)
```

4. Display the current date as 15th August Friday Nineteen Ninety-Seven.
```sql
SELECT DATE_FORMAT(NOW(), '%D %M %W %Y');
```
output:
```sql
+-----------------------------------+
| DATE_FORMAT(NOW(), '%D %M %W %Y') |
+-----------------------------------+
| 18th February WEDNESDAY 2026      |
+-----------------------------------+
1 row in set (0.006 sec)
```

5. Display the following output for each row from employee table.
```sql
SELECT CONCAT(ENAME, ' HAS JOINED ON ',
DATE_FORMAT(HIREDATE, '%W %D %M %Y'))
FROM EMPLOYEE;
```
output:
```sql
+------------------------------------------------------------------------+
| CONCAT(ENAME, ' HAS JOINED ON ', DATE_FORMAT(HIREDATE, '%W %D %M %Y')) |
+------------------------------------------------------------------------+
| SMITH has joined the company on Wednesday 17th December 1980           |
| ALLEN has joined the company on Friday 20th February 1981              |
| WARD has joined the company on Sunday 22nd February 1981               |
| JONES has joined the company on Thursday 2nd April 1981                |
| MARTIN has joined the company on Monday 28th September 1981            |
| BLAKE has joined the company on Friday 1st May 1981                    |
| CLARK has joined the company on Tuesday 9th June 1981                  |
| SCOTT has joined the company on Thursday 9th December 1982             |
| KING has joined the company on Tuesday 17th November 1981              |
| TURNER has joined the company on Tuesday 8th September 1981            |
| ADAMS has joined the company on Wednesday 12th January 1983            |
| JAMES has joined the company on Thursday 3rd December 1981             |
| FORD has joined the company on Thursday 3rd December 1981              |
| MILLER has joined the company on Saturday 23rd January 1982            |
+------------------------------------------------------------------------+
14 rows in set (0.009 sec)
```

6. Scott has joined the company on Wednesday 13th August Nineteen Ninety.
```sql
SELECT CONCAT('SCOTT HAS JOINED THE COMPANY ON ',
DATE_FORMAT(HIREDATE, '%W %D %M %Y')) AS EMPLOYEE_JOINING
FROM EMPLOYEE
WHERE ENAME = 'SCOTT';
```
output:
```sql
+--------------------------------------------------------------+
| EMPLOYEE_JOINING                                             |
+--------------------------------------------------------------+
| SCOTT has joined the company on Thursday 9th December 1982   |
+--------------------------------------------------------------+
1 row in set (0.012 sec)
```

7. Find the date for nearest Saturday after current date.
```sql
SELECT DATE_ADD(CURDATE(), INTERVAL (7 - DAYOFWEEK(CURDATE())) DAY);
```
output:
```sql
+-------------------------------------------------------------+
|DATE_ADD(CURDATE(), INTERVAL (7 - DAYOFWEEK(CURDATE())) DAY) |
+-------------------------------------------------------------+
| 2026-02-18                                                  |
+-------------------------------------------------------------+
1 row in set (0.006 sec)
```

8. Display current time.
```sql
SELECT DATE_FORMAT(NOW(), '%h:%i:%s %p') AS CURRENT_TIME;
```
output:
```sql
+--------------+
| CURRENT_TIME |
+--------------+
| 00:29:00     |
+--------------+
1 row in set (0.001 sec)
```

9. Display the date three months Before the current date.
```sql
SELECT DATE_SUB(CURDATE(), INTERVAL 3 MONTH);
```
output:
```sql
+---------------------------------------+
| DATE_SUB(CURDATE(), INTERVAL 3 MONTH) |
+---------------------------------------+
| 2025-11-18                            |
+---------------------------------------+
1 row in set (0.001 sec)
```

10. Display those employees who joined in the company in the month of Dec.
```sql
SELECT *
FROM EMPLOYEE
WHERE MONTH(HIREDATE) = 12;
```
output:
```sql
+-------+------------+
| ENAME | HIREDATE   |
+-------+------------+
| SMITH | 1980-12-17 |
| SCOTT | 1982-12-09 |
| JAMES | 1981-12-03 |
| FORD  | 1981-12-03 |
+-------+------------+
4 rows in set (0.003 sec)
```

11. Display those employees whose first 2 characters from hire date - last 2 characters of salary.
```sql
SELECT *
FROM EMPLOYEE
WHERE DAY(HIREDATE) = RIGHT(SAL, 2);
```
output:
```sql
Empty set (0.004 sec)
```

12. Display those employees whose 10% of salary is equal to the year of joining.
```sql
SELECT *
FROM EMPLOYEE
WHERE SAL * 0.10 = YEAR(HIREDATE);
```
output:
```sql
Empty set (0.003 sec)
```

13. Display those employees who joined the company before 15 of the months.
```sql
SELECT *
FROM EMPLOYEE
WHERE HIREDATE < DATE_SUB(CURDATE(), INTERVAL 15 MONTH);
```
output:
```sql
+--------+------------+----------+
| ENAME  | HIREDATE   | JOIN_DAY |
+--------+------------+----------+
| JONES  | 1981-04-02 |        2 |
| BLAKE  | 1981-05-01 |        1 |
| CLARK  | 1981-06-09 |        9 |
| SCOTT  | 1982-12-09 |        9 |
| TURNER | 1981-09-08 |        8 |
| ADAMS  | 1983-01-12 |       12 |
| JAMES  | 1981-12-03 |        3 |
| FORD   | 1981-12-03 |        3 |
+--------+------------+----------+
8 rows in set (0.001 sec)
```

14. Display those employees who has joined before 15th of the month.
```sql
SELECT *
FROM EMPLOYEE
WHERE DAY(HIREDATE) < 15;
```

15. Display those employees whose joining DATE is available in deptno.
```sql
SELECT *
FROM EMPLOYEE
WHERE HIREDATE IS NOT NULL
AND DEPTNO IS NOT NULL;
```
