
# DBMS LAB ASSIGNMENT 08

> **Date:** 30-Mar-2026
 
---

## Objective

Perform advanced SQL **JOIN**<br>
queries on the **EMPLOYEE**,<br>
**DEPARTMENT**, and **SALGRADE**<br>
tables including INNER JOIN, LEFT JOIN,<br>
self-joins, and multi-table queries:

---

### Create SALGRADE Table 

```sql
CREATE TABLE IF NOT EXISTS SALGRADE (
    GRADE INT,
    LOSAL INT,
    HISAL INT
);

INSERT INTO SALGRADE VALUES (1, 700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);
```

### Add LOC Column to DEPARTMENT

```sql
ALTER TABLE DEPARTMENT ADD COLUMN LOC VARCHAR(20);

UPDATE DEPARTMENT SET LOC = 'NEW YORK' WHERE DEPTNO = 10;
UPDATE DEPARTMENT SET LOC = 'DALLAS' WHERE DEPTNO = 20;
UPDATE DEPARTMENT SET LOC = 'CHICAGO' WHERE DEPTNO = 30;
UPDATE DEPARTMENT SET LOC = 'BOSTON' WHERE DEPTNO = 40;
```

---

## Problem Solutions

1. Display All Employees with Their Dept Name
```sql
SELECT E.ENAME, D.DNAME
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO;
```
Output:
```sql
+--------+------------+
| ENAME  | DNAME      |
+--------+------------+
| SMITH  | RESEARCH   |
| ALLEN  | SALES      |
| WARD   | SALES      |
| JONES  | RESEARCH   |
| MARTIN | SALES      |
| BLAKE  | SALES      |
| CLARK  | RESEARCH   |
| SCOTT  | OPERATIONS |
| KING   | RESEARCH   |
| TURNER | SALES      |
| ADAMS  | RESEARCH   |
| JAMES  | SALES      |
| FORD   | RESEARCH   |
| MILLER | ACCOUNTING |
+--------+------------+
14 rows in set (0.001 sec)
```

2. Display Employees Whose Manager Is JONES, Along with Manager Name
```sql
SELECT E.ENAME AS EMPLOYEE_NAME,
       E.JOB,
       M.ENAME AS MANAGER_NAME
FROM EMPLOYEE E
INNER JOIN EMPLOYEE M ON E.MGR = M.EMPNO
WHERE M.ENAME = 'JONES';
```
Output:
```sql
+---------------+---------+--------------+
| EMPLOYEE_NAME | JOB     | MANAGER_NAME |
+---------------+---------+--------------+
| SCOTT         | ANALYST | JONES        |
| FORD          | ANALYST | JONES        |
+---------------+---------+--------------+
2 rows in set (0.001 sec)
```

---

3. Display Employee Details with Job, Dept Name, Manager Name, and Grade — Department Wise
```sql
SELECT E.ENAME, E.JOB, D.DNAME,
       M.ENAME AS MANAGER,
       S.GRADE
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO
LEFT JOIN EMPLOYEE M ON E.MGR = M.EMPNO
JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY D.DNAME;
```
Output:
```sql
+--------+-----------+------------+---------+-------+
| ENAME  | JOB       | DNAME      | MANAGER | GRADE |
+--------+-----------+------------+---------+-------+
| MILLER | CLERK     | ACCOUNTING | CLARK   |     2 |
| SCOTT  | ANALYST   | OPERATIONS | JONES   |     4 |
| SMITH  | CLERK     | RESEARCH   | FORD    |     1 |
| JONES  | MANAGER   | RESEARCH   | KING    |     4 |
| CLARK  | MANAGER   | RESEARCH   | KING    |     4 |
| KING   | PRESIDENT | RESEARCH   | NULL    |     5 |
| ADAMS  | CLERK     | RESEARCH   | SCOTT   |     1 |
| FORD   | ANALYST   | RESEARCH   | JONES   |     4 |
| ALLEN  | SALESMAN  | SALES      | BLAKE   |     3 |
| WARD   | SALESMAN  | SALES      | BLAKE   |     2 |
| MARTIN | SALESMAN  | SALES      | BLAKE   |     2 |
| BLAKE  | MANAGER   | SALES      | KING    |     4 |
| TURNER | SALESMAN  | SALES      | BLAKE   |     3 |
| JAMES  | CLERK     | SALES      | BLAKE   |     1 |
+--------+-----------+------------+---------+-------+
14 rows in set (0.001 sec)
```

4. List Employees (Except Clerks) with Job, Grade, and Dept Name — Sorted by Highest Salary
```sql
SELECT E.ENAME, E.JOB, E.SAL,
       S.GRADE, D.DNAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO
JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.JOB != 'CLERK'
ORDER BY E.SAL DESC;
```
Output:
```sql
+--------+-----------+------+-------+------------+
| ENAME  | JOB       | SAL  | GRADE | DNAME      |
+--------+-----------+------+-------+------------+
| KING   | PRESIDENT | 5000 |     5 | RESEARCH   |
| SCOTT  | ANALYST   | 3000 |     4 | OPERATIONS |
| FORD   | ANALYST   | 3000 |     4 | RESEARCH   |
| JONES  | MANAGER   | 2975 |     4 | RESEARCH   |
| BLAKE  | MANAGER   | 2850 |     4 | SALES      |
| CLARK  | MANAGER   | 2450 |     4 | RESEARCH   |
| ALLEN  | SALESMAN  | 1600 |     3 | SALES      |
| TURNER | SALESMAN  | 1500 |     3 | SALES      |
| WARD   | SALESMAN  | 1250 |     2 | SALES      |
| MARTIN | SALESMAN  | 1250 |     2 | SALES      |
+--------+-----------+------+-------+------------+
10 rows in set (0.001 sec)
```

5. Display Employee Name, Job, and Manager (Including Employees Without Manager)
```sql
SELECT E.ENAME, E.JOB,
       M.ENAME AS MANAGER
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M ON E.MGR = M.EMPNO;
```
Output:
```sql
+--------+-----------+---------+
| ENAME  | JOB       | MANAGER |
+--------+-----------+---------+
| SMITH  | CLERK     | FORD    |
| ALLEN  | SALESMAN  | BLAKE   |
| WARD   | SALESMAN  | BLAKE   |
| JONES  | MANAGER   | KING    |
| MARTIN | SALESMAN  | BLAKE   |
| BLAKE  | MANAGER   | KING    |
| CLARK  | MANAGER   | KING    |
| SCOTT  | ANALYST   | JONES   |
| KING   | PRESIDENT | NULL    |
| TURNER | SALESMAN  | BLAKE   |
| ADAMS  | CLERK     | SCOTT   |
| JAMES  | CLERK     | BLAKE   |
| FORD   | ANALYST   | JONES   |
| MILLER | CLERK     | CLARK   |
+--------+-----------+---------+
14 rows in set (0.018 sec)
```

6. List Employees Who Earn 36000 a Year OR Who Are Not Clerks
```sql
SELECT E.ENAME, E.JOB,
       E.SAL * 12 AS ANNUAL_SALARY,
       E.DEPTNO, D.DNAME, S.GRADE
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO
JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.SAL * 12 >= 36000
   OR E.JOB != 'CLERK';
```
Output:
```sql
+--------+-----------+---------------+--------+------------+-------+
| ENAME  | JOB       | ANNUAL_SALARY | DEPTNO | DNAME      | GRADE |
+--------+-----------+---------------+--------+------------+-------+
| ALLEN  | SALESMAN  |         19200 |     30 | SALES      |     C |
| WARD   | SALESMAN  |         15000 |     30 | SALES      |     B |
| JONES  | MANAGER   |         35700 |     20 | RESEARCH   |     E |
| MARTIN | SALESMAN  |         15000 |     30 | SALES      |     B |
| BLAKE  | MANAGER   |         34200 |     30 | SALES      |     E |
| CLARK  | MANAGER   |         29400 |     20 | RESEARCH   |     D |
| SCOTT  | ANALYST   |         36000 |     40 | OPERATIONS |     E |
| KING   | PRESIDENT |         60000 |     20 | RESEARCH   |     E |
| TURNER | SALESMAN  |         18000 |     30 | SALES      |     C |
| FORD   | ANALYST   |         36000 |     20 | RESEARCH   |     E |
+--------+-----------+---------------+--------+------------+-------+
10 rows in set (0.010 sec)
```

7. List Employees Who Earn 30000 Per Year AND Are Not Clerks
```sql
SELECT E.ENAME, E.JOB,
       E.SAL * 12 AS ANNUAL_SAL,
       E.DEPTNO, D.DNAME, S.GRADE
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO
JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.SAL * 12 >= 30000
  AND E.JOB != 'CLERK';
```
Output:
```sql
+-------+-----------+------------+--------+------------+-------+
| ENAME | JOB       | ANNUAL_SAL | DEPTNO | DNAME      | GRADE |
+-------+-----------+------------+--------+------------+-------+
| JONES | MANAGER   |      35700 |     20 | RESEARCH   |     E |
| BLAKE | MANAGER   |      34200 |     30 | SALES      |     E |
| SCOTT | ANALYST   |      36000 |     40 | OPERATIONS |     D |
| KING  | PRESIDENT |      60000 |     20 | RESEARCH   |     E |
| FORD  | ANALYST   |      36000 |     20 | RESEARCH   |     E |
+-------+-----------+------------+--------+------------+-------+
5 rows in set (0.001 sec)
```

8. List Employees with Manager's Name and Number — Show 'NO MANAGER' for Those Without
```sql
SELECT E.EMPNO AS EMP_NO,
       E.ENAME AS EMP_NAME,
       IFNULL(CAST(M.EMPNO AS CHAR), 'N/A') AS MGR_NO,
       IFNULL(M.ENAME, 'NO MANAGER') AS MGR_NAME
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M ON E.MGR = M.EMPNO;
```
Output:
```sql
+--------+----------+--------+------------+
| EMP_NO | EMP_NAME | MGR_NO | MGR_NAME   |
+--------+----------+--------+------------+
|   7369 | SMITH    | 7902   | FORD       |
|   7499 | ALLEN    | 7698   | BLAKE      |
|   7521 | WARD     | 7698   | BLAKE      |
|   7566 | JONES    | 7839   | KING       |
|   7654 | MARTIN   | 7698   | BLAKE      |
|   7698 | BLAKE    | 7839   | KING       |
|   7782 | CLARK    | 7839   | KING       |
|   7788 | SCOTT    | 7566   | JONES      |
|   7839 | KING     | N/A    | NO MANAGER |
|   7844 | TURNER   | 7698   | BLAKE      |
|   7876 | ADAMS    | 7788   | SCOTT      |
|   7900 | JAMES    | 7698   | BLAKE      |
|   7902 | FORD     | 7566   | JONES      |
|   7934 | MILLER   | 7782   | CLARK      |
+--------+----------+--------+------------+
14 rows in set (0.011 sec)
```

9. Select Dept Name, Dept No, and Sum of Salary
```sql
SELECT D.DNAME, D.DEPTNO,
       SUM(E.SAL) AS TOTAL_SALARY
FROM DEPARTMENT D
JOIN EMPLOYEE E ON D.DEPTNO = E.DEPTNO
GROUP BY D.DEPTNO, D.DNAME
ORDER BY D.DEPTNO;
```
Output:
```sql
+------------+--------+--------------+
| DNAME      | DEPTNO | TOTAL_SALARY |
+------------+--------+--------------+
| ACCOUNTING |     10 |         1300 |
| RESEARCH   |     20 |        15325 |
| SALES      |     30 |         9400 |
| OPERATIONS |     40 |         3000 |
+------------+--------+--------------+
4 rows in set (0.002 sec)
```

10. Display Employee Number, Name, and Location of Department
```sql
SELECT E.EMPNO, E.ENAME, D.LOC
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO;
```
Output:
```sql
+-------+--------+----------+
| EMPNO | ENAME  | LOC      |
+-------+--------+----------+
|  7369 | SMITH  | DALLAS   |
|  7499 | ALLEN  | CHICAGO  |
|  7521 | WARD   | CHICAGO  |
|  7566 | JONES  | DALLAS   |
|  7654 | MARTIN | CHICAGO  |
|  7698 | BLAKE  | CHICAGO  |
|  7782 | CLARK  | DALLAS   |
|  7788 | SCOTT  | BOSTON    |
|  7839 | KING   | DALLAS   |
|  7844 | TURNER | CHICAGO  |
|  7876 | ADAMS  | DALLAS   |
|  7900 | JAMES  | CHICAGO  |
|  7902 | FORD   | DALLAS   |
|  7934 | MILLER | NEW YORK |
+-------+--------+----------+
14 rows in set (0.005 sec)
```

11. Display Employee Name and Department Name for Each Employee
```sql
SELECT E.ENAME AS EMPLOYEE_NAME,
       D.DNAME AS DEPARTMENT_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO
ORDER BY D.DNAME, E.ENAME;
```
Output:
```sql
+---------------+-----------------+
| EMPLOYEE_NAME | DEPARTMENT_NAME |
+---------------+-----------------+
| MILLER        | ACCOUNTING      |
| SCOTT         | OPERATIONS      |
| ADAMS         | RESEARCH        |
| CLARK         | RESEARCH        |
| FORD          | RESEARCH        |
| JONES         | RESEARCH        |
| KING          | RESEARCH        |
| SMITH         | RESEARCH        |
| ALLEN         | SALES           |
| BLAKE         | SALES           |
| JAMES         | SALES           |
| MARTIN        | SALES           |
| TURNER        | SALES           |
| WARD          | SALES           |
+---------------+-----------------+
14 rows in set (0.001 sec)
```