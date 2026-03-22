-- Q1 Employees who joined before 30-Jun-1980 or after 31-Dec-1981
SELECT * FROM EMPLOYEE
WHERE HIREDATE < '1980-06-30'
OR HIREDATE > '1981-12-31';

-- Q2 Names of employees whose second alphabet is ‘A’
SELECT ENAME FROM EMPLOYEE
WHERE ENAME LIKE '_A%';

-- Q3 Names of employees whose name is exactly five characters
SELECT ENAME FROM EMPLOYEE
WHERE ENAME LIKE '_____';

-- Q4 Names of employees whose second last alphabet is E
SELECT ENAME FROM EMPLOYEE
WHERE ENAME LIKE '%E_';

-- Q5 Employees not working as salesman, clerk, or analyst
SELECT ENAME FROM EMPLOYEE
WHERE JOB NOT IN ('SALESMAN', 'CLERK', 'ANALYST');

-- Q6 Employee name with annual salary (sal × 12), highest first
SELECT ENAME, SAL*12 AS ANNUAL_SALARY
FROM EMPLOYEE
ORDER BY ANNUAL_SALARY DESC;

-- Q7 Name, sal, hra, pf, da, totalsal HRA = 15% of sal DA = 10% of sal PF = 5% of sal Total salary = (sal + hra + da) − pf
SELECT ENAME, SAL,
SAL*0.15 AS HRA,
SAL*0.10 AS DA,
SAL*0.05 AS PF,
(SAL + (SAL*0.15) + (SAL*0.10) - (SAL*0.05)) AS TOTALSAL
FROM EMPLOYEE
ORDER BY TOTALSAL;

-- Q8 Update salary by 10% for employees not eligible for commission
UPDATE EMPLOYEE
SET SAL = SAL*1.10
WHERE COMM IS NULL;

-- Q9 Employees whose salary is more than 3000 after 20% increment
SELECT ENAME, SAL
FROM EMPLOYEE
WHERE SAL*1.20 > 3000;

-- Q10 Employees whose salary contains at least 3 digits
SELECT * FROM EMPLOYEE
WHERE LENGTH(SAL) >= 3;

