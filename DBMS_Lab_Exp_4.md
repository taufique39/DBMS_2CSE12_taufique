# DBMS LAB ASSIGNMENT 04
---

> **Date:** 11-Feb-2026
---

## Objectives

To retriev & manipulate data from database tables : Employee and Department<br>
SELECT command is used to display employee details<br>
WHERE clause is used to apply conditions.<br>
LIKE and LENGHT functuon are used for pattern matching and character count.<br>
OEDER BY is used to sort data in ascendng or descending order.

---

### SQL Problem & Solutions

1. Employees who joined before 30-Jun-1980 or after 31-Dec-1981
```sql
SELECT * FROM EMPLOYEE
WHERE HIREDATE < '1980-06-30'
OR HIREDATE > '1981-12-31';
```
output:
```sql
+-------+--------+---------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB     | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+---------+------+------------+------+------+--------+
|  7788 | SCOTT  | ANALYST | 7566 | 1982-12-09 | 3000 | NULL |     40 |
|  7876 | ADAMS  | CLERK   | 7788 | 1983-01-12 | 1100 | NULL |     20 |
+-------+--------+---------+------+------------+------+------+--------+
3 rows in set (0.001 sec)
```

2. Names of employees whose second alphabet is ‘A’
```sql
SELECT ENAME FROM EMPLOYEE
WHERE ENAME LIKE '_A%';
```
output:
```sql
+--------+
| ENAME  |
+--------+
| WARD   |
| MARTIN |
| JAMES  |
+--------+
3 rows in set (0.001 sec)
```

3. Names of employees whose name is exactly five characters
```sql
SELECT ENAME FROM EMPLOYEE
WHERE ENAME LIKE '_____';
```
output:
```sql
+-------+
| ENAME |
+-------+
| SMITH |
| ALLEN |
| JONES |
| BLAKE |
| CLARK |
| SCOTT |
| ADAMS |
| JAMES |
+-------+
8 rows in set (0.001 sec)
```

4. Names of employees whose second last alphabet is E
```sql
SELECT ENAME FROM EMPLOYEE
WHERE ENAME LIKE '%E_';
```
output:
```sql
+------- +
| ENAME  |
+--------+
| ALLEN  |
| JONES  |
| turner |
| JAMES  |
| MILLER |
+--------+
5 rows in set (0.001 sec)
```

5. Employees not working as salesman, clerk, or analyst
```sql
SELECT ENAME FROM EMPLOYEE
WHERE JOB NOT IN ('SALESMAN', 'CLERK', 'ANALYST');
```
output:
```sql
+-------+
| ENAME |
+-------+
| JONES |
| BLAKE |
| CLARK |
| KING  |
+-------+
4 rows in set (0.001 sec)
```

6. Employee name with annual salary (sal × 12), highest first
```sql
SELECT ENAME, SAL*12 AS ANNUAL_SALARY
FROM EMPLOYEE
ORDER BY ANNUAL_SALARY DESC;
```
output:
```sql
+--------+---------------+
| ENAME  | ANNUAL_SALARY |
+--------+---------------+
| KING   |         60000 |
| SCOTT  |         36000 |
| FORD   |         36000 |
| JONES  |         35700 |
| BLAKE  |         34200 |
| CLARK  |         29400 |
| ALLEN  |         19200 |
| TURNER |         18000 |
| MILLER |         15600 |
| WARD   |         15000 |
| MARTIN |         15000 |
| ADAMS  |         13200 |
| JAMES  |         11400 |
| SMITH  |          9600 |
+--------+---------------+
14 rows in set (0.001 sec)
```

7. Name, sal, hra, pf, da, totalsal HRA = 15% of sal DA = 10% of sal PF = 5% of sal Total salary = (sal + hra + da) − pf
```sql
SELECT ENAME, SAL,
SAL*0.15 AS HRA,
SAL*0.10 AS DA,
SAL*0.05 AS PF,
(SAL + (SAL*0.15) + (SAL*0.10) - (SAL*0.05)) AS TOTALSAL
FROM EMPLOYEE
ORDER BY TOTALSAL;
```
output:
```sql
+--------+------+---------+---------+---------+----------+
| ENAME  | SAL  | HRA     |  DA     |  FA     | TOTALSAL |
+--------+------+---------+---------+---------+----------+
| SMITH  |  800 | 120.00  | 80.00   | 40.00   |   960.00 |
| ALLEN  | 1600 | 240.00  | 160.00  | 80.00   |  1920.00 |
| WARD   | 1250 | 187.50  | 62.50   | 125.00  |  1500.00 |
| JONES  | 2975 | 446.25  | 297.50  | 148.75  |  3570.00 |
| MARTIN | 1250 | 187.50  | 125.00  | 62.50   |  1500.00 |
| BLAKE  | 2850 | 427.50  | 285.00  | 142.50  |  3420.00 |
| CLARK  | 2450 | 367.50  | 245.00  | 122.50  |  2940.00 |
| SCOTT  | 3000 | 450.00  | 300.00  | 150.00  |  3600.00 |
| KING   | 5000 | 750.00  | 500.00  | 250.00  |  6000.00 |
| TURNER | 1500 | 225.00  | 150.00  | 75.00   |  1800.00 |
| ADAMS  | 1100 | 165.00  | 110.00  | 55.00   |  1320.00 |
| JAMES  |  950 | 142.50  | 95.00   | 47.50   |  1140.00 |
| FORD   | 3000 | 450.00  | 300.00  | 150.00  |  3600.00 |
| MILLER | 1300 | 195.00  | 130.00  | 65.00   |  1560.00 |
+--------+------+---------+---------+---------+----------+
14 rows in set (0.001 sec)
```

8. Update salary by 10% for employees not eligible for commission
```sql
UPDATE EMPLOYEE
SET SAL = SAL*1.10
WHERE COMM IS NULL;
```
output:
```sql
+--------+---------+------+
| ENAME  | SAL     | COMM |
+--------+---------+------+
| SMITH  |  880.00 | NULL |
| JONES  | 3272.50 | NULL |
| BLAKE  | 3135.00 | NULL |
| CLARK  | 2695.00 | NULL |
| SCOTT  | 3300.00 | NULL |
| KING   | 5500.00 | NULL |
| ADAMS  | 1210.00 | NULL |
| JAMES  | 1045.00 | NULL |
| FORD   | 3300.00 | NULL |
| MILLER | 1430.00 | NULL |
+--------+---------+------+
10 rows in set (0.001 sec)
```

9. Employees whose salary is more than 3000 after 20% increment
```sql
SELECT ENAME, SAL
FROM EMPLOYEE
WHERE SAL*1.20 > 3000;
```
output:
```sql
+-------+---------+
| ENAME |   SAL   | 
+-------+---------+
| JONES | 3272.50 |  
| BLAKE | 3135.00 |
| CLARK | 2695.00 |   
| SCOTT | 3300.00 |  
| KING  | 5500.00 |  
| FORD  | 3300.00 | 
+-------+---------+
5 rows in set (0.001 sec)
```

10. Employees whose salary contains at least 3 digits
```sql
SELECT * FROM EMPLOYEE
WHERE LENGTH(SAL) >= 3;
```
output:
```sql
+--------+------+
| ENAME  | SAL  |
+--------+------+
| SMITH  |  800 |
| ALLEN  | 1600 |
| WARD   | 1250 |
| JONES  | 2975 |
| MARTIN | 1250 |
| BLAKE  | 2850 |
| CLARK  | 2450 |
| SCOTT  | 3000 |
| KING   | 5000 |
| TURNER | 1500 |
| ADAMS  | 1100 |
| JAMES  |  950 |
| FORD   | 3000 |
| MILLER | 1300 |
+--------+------+
14 rows in set (0.001 sec)
```
