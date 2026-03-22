# DBMS LAB ASSIGNMENT 02
---

> **Date:** 28-Jan-2026
---

## Objectives

Perform queries using the EMPLOYEE table to retrieve data using various SQL clauses:

>- List all distinct jobs in EMPLOYEE<br>
>- List all information about employees in Department Number 30<br>
>- Find all department numbers with department names greater than 20<br>
>- Find all information about managers and clerks in Department 30<br>
>- List Employee name, Employee number, and department of all clerks<br>
>- Find all managers not in Department 30<br>
>- List information about employees in Department 10 who are not managers or clerks<br>
>- Find employees and jobs earning between 1200 and 1400<br>
>- List Name and Department Number of employees who are clerks, analysts, or salesmen<br>
>- List Name and Department Number of employees whose names begin with M
---

### SQL Problem & Solutions

1. List all distinct jobs in Employee
```sql
SELECT DISTINCT job
FROM employee;
```
output:
```sql
+-----------+
| JOB       |
+-----------+
| CLERK     |
| SALESMAN  |
| MANAGER   |
| ANALYST   |
| PRESIDENT |
+-----------+
5 rows in set (0.001 sec)
```

2. List all information about employees in department number 30
```sql
SELECT *
FROM employee
WHERE deptno = 30;
```
output:
```sql
+-------+--------+-----------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+-----------+------+------------+------+------+--------+
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250 |  300 |     30 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250 | 1400 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850 | NULL |     30 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500 |    0 |     30 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950 | NULL |     30 |
+-------+--------+-----------+------+------------+------+------+--------+
6 rows in set (0.002 sec)
```

3. Find all department numbers greater than 20
```sql
SELECT DISTINCT deptno
FROM employee
WHERE deptno > 20;
```
output:
```sql
+--------+------------+
| DEPTNO | DNAME      |
+--------+------------+
|     30 | SALES      |
|     40 | OPERATIONS |
+--------+------------+
2 rows in set (0.001 sec)
```

4. Find all information about managers as well as clerks in department 30
```sql
SELECT *
FROM employee
WHERE deptno = 30
AND job IN ('MANAGER', 'CLERK');
```
output:
```sql
+-------+-------+---------+------+------------+------+------+--------+
| EMPNO | ENAME | JOB     | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+-------+---------+------+------------+------+------+--------+
|  7698 | BLAKE | MANAGER | 7839 | 1981-05-01 | 2850 | NULL |     30 |
|  7900 | JAMES | CLERK   | 7698 | 1981-12-03 |  950 | NULL |     30 |
+-------+-------+---------+------+------------+------+------+--------+
2 rows in set (0.002 sec)
```

5. List employee name, employee number and department of all clerks
```sql
SELECT ename, empno, deptno
FROM employee
WHERE job = 'CLERK';
```
output:
```sql
+--------+-------+--------+
| ENAME  | EMPNO | DEPTNO |
+--------+-------+--------+
| SMITH  |  7369 |     20 |
| ADAMS  |  7876 |     20 |
| JAMES  |  7900 |     30 |
| MILLER |  7934 |     10 |
+--------+-------+--------+
4 rows in set (0.003 sec)
```

6. Find all managers not in department 30
```sql
SELECT *
FROM employee
WHERE job = 'MANAGER'
AND deptno <> 30;
```
output:
```sql
+-------+-------+---------+------+------------+------+------+--------+
| EMPNO | ENAME | JOB     | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+-------+---------+------+------------+------+------+--------+
|  7566 | JONES | MANAGER | 7839 | 1981-04-02 | 2975 | NULL |     20 |
|  7782 | CLARK | MANAGER | 7839 | 1981-06-09 | 2450 | NULL |     20 |
+-------+-------+---------+------+------------+------+------+--------+
2 rows in set (0.001 sec)
```

7. List information about employees in department 10 who are not managers or clerks
```sql
SELECT *
FROM employee
WHERE deptno = 10
AND job NOT IN ('MANAGER', 'CLERK');
```
output:
```sql
Empty set (0.001 sec)
```

8. Find employees and jobs earning between 1200 and 1400
```sql
SELECT ename, job, sal
FROM employee
WHERE sal BETWEEN 1200 AND 1400;
```
output:
```sql
+--------+----------+------+
| ENAME  | JOB      | SAL  |
+--------+----------+------+
| WARD   | SALESMAN | 1250 |
| MARTIN | SALESMAN | 1250 |
| MILLER | CLERK    | 1300 |
+--------+----------+------+
3 rows in set (0.001 sec)
```

9. List name and department number of employees who are clerks, analysts, or salesmen
```sql
SELECT ename, deptno
FROM employee
WHERE job IN ('CLERK', 'ANALYST', 'SALESMAN');
```
output:
```sql
+--------+--------+
| ENAME  | DEPTNO |
+--------+--------+
| SMITH  |     20 |
| ALLEN  |     30 |
| WARD   |     30 |
| MARTIN |     30 |
| SCOTT  |     40 |
| TURNER |     30 |
| ADAMS  |     20 |
| JAMES  |     30 |
| FORD   |     20 |
| MILLER |     10 |
+--------+--------+
10 rows in set (0.001 sec)
```

10. List name and department number of employees whose names begin with 'M'
```sql
SELECT ename, deptno
FROM employee
WHERE ename LIKE 'M%';
```
output:
```sql
+--------+--------+
| ENAME  | DEPTNO |
+--------+--------+
| MARTIN |     30 |
| MILLER |     10 |
+--------+--------+
2 rows in set (0.002 sec)
```


