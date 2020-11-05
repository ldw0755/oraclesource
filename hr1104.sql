-- HR ���� ���� ��� ���̺� ����
select * from tab;
--employees ���̺� ��ü ���� ��ȸ
SELECT * FROM employees;
--employees ���̺� ���� ���� (DESC : describe)
DESC employees;
--employees���̺��� first_name, last_name, job_id �� ��ȸ
SELECT first_name, last_name, job_id from employees;
SELECT * FROM employees WHERE JOB_ID='AD_VP';
SELECT * FROM employees WHERE JOB_ID='IT_PROG';

SELECT * FROM employees WHERE (COMMISSION_PCT != null);


SELECT
    *
FROM tab;
DESC employees;
--�����ȣ 176�� last_name, �μ���ȣ
SELECT last_name, department_id FROM employees WHERE employee_id = 176;
--���� 12000�̻� ������ last_name, ����
SELECT last_name, salary*12+commission_pct AS ���� FROM employees WHERE (salary*12+commission_pct) >=12000;
SELECT last_name, salary AS ���� FROM employees WHERE salary >=12000;

--SELECT last_name, salary*12+commission_pct AS ���� FROM employees WHERE '����' >=12000;
--���� 5000~12000 �̿� �� last_name, ���� ��ȸ
SELECT last_name, salary*12+commission_pct FROM employees WHERE (salary*12+commission_pct) <5000 AND (salary*12+commission_pct)>12000;
SELECT last_name, salary FROM employees WHERE salary < 5000 OR salary>12000;

DESC employees;
--20�� �� 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ� ��ȣ�� ���ĺ� ������ ��ȸ
SELECT last_name, department_id FROM employees WHERE department_id IN(20, 50) ORDER BY last_name;
--Ŀ�̼��� ���� ��� ������� LAST_NAME, ����, Ŀ�̼� ��ȸ. ��, ������ ���� �� Ŀ�̼��� �������� ���
SELECT last_name, salary, commission_pct FROM employees WHERE commission_pct <>0 ORDER BY salary DESC, commission_pct DESC;
--������ 2500, 3500, 7000�� �ƴϸ� ������ SA_REP�̰ų� ST_CLERK�� ����� ��ȸ
SELECT * FROM employees WHERE salary NOT IN(2500, 3500, 7000) AND job_id IN('SA_REP', 'ST_CLERK');
SELECT * FROM employees WHERE salary NOT IN(2500, 3500, 7000) AND job_id IN('sa_rep', 'st_clerk');
SELECT * FROM employees;
select distinct job_id from employees;
--2008/02/02 ~ 2008/05/01 ���̿� ���� ����� LAST_NAME, �����ȣ, ������� ��ȸ.
--��, ��������� �������� ����
DESC employees;
SELECT last_name, employee_id, hire_date FROM employees WHERE hire_date >= '08/02/02' AND hire_date < '08/05/01' ORDER BY hire_date DESC;
--2004�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ
--��, �Ի��� ���� �������� ����
SELECT last_name, hire_date FROM employees WHERE hire_date >= '04/01/01' ORDER BY hire_date;
SELECT last_name, hire_date FROM employees WHERE hire_date >= '2004-01-01' ORDER BY hire_date;
SELECT last_name, hire_date FROM employees WHERE hire_date >= '2004.01.01' AND hire_date <= '04-12-31' ORDER BY hire_date;

--���� 5000~12000 ����, 20 or 50�� �μ��� �ٹ��ϴ� ������� ���� ��ȸ, ������������
select * from employees;
SELECT last_name, salary 
FROM employees 
WHERE (salary BETWEEN 5000 AND 12000) AND (department_id IN(20, 50)) 
ORDER BY salary;

--2004�⵵ ���� ��� ������� last_name, �� ����� ��ȸ, �Ի��� ���� �������� ����
desc employees;
SELECT last_name, hire_date 
FROM employees 
WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-31'
ORDER BY hire_date;

--���� 5000~12000 ���� �̿�, last_name, salary ��ȸ
SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000
ORDER BY salary;

--LIKE ����
--2004�⵵ ���� ��� ������� last_name, �� ����� ��ȸ, �Ի��� ���� �������� ����
SELECT last_name, hire_date 
FROM employees 
WHERE hire_date LIKE '2004%' OR hire_date LIKE '04%' 
ORDER BY hire_date;
--LAST_NAME �� u�� ���ԵǴ� ������� ��� �� last_name ��ȸ
DESC employees;
SELECT employee_id, last_name
FROM employees
WHERE last_name LIKE '%u%';
--last_name�� �׹�° ���ڰ� a�� ������� last_name ��ȸ
SELECT last_name
FROM employees
WHERE last_name LIKE '___a%';
-- last_name�� a Ȥ�� e���ڰ� �ִ� ������� last_name�� ��ȸ�Ͽ� last_name�� �������� ����
SELECT last_name
FROM employees
WHERE (last_name LIKE '%a%') OR (last_name LIKE '%e%')
ORDER BY last_name;

--IS NULL ����
--�Ŵ����� ���� ������� LAST_NAME, JOB_ID ��ȸ
DESC employees;
SELECT last_name, job_id
FROM employees
WHERE manager_id IS NULL;
--ST_CLERK�� JOB_ID�� ���� ����� ���� �μ� ID ��ȸ, �μ� ��ȣ�� NULL�� �� ����

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES
WHERE (DEPARTMENT_ID IS NOT NULL) AND (JOB_ID NOT IN('ST_CLERK'))
ORDER BY DEPARTMENT_ID;

SELECT DISTINCT DEPARTMENT_ID, JOB_ID FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;

--COMMISSSION_PCT�� NULL�� �ƴ� ��� ��
--COMMISSION = SALALY*COMMISSION_PCT�� ���Ͽ�
--EMPLOYEE_ID, FIRST_NAME, JOB_ID�� ���� ��ȸ
SELECT employee_id, first_name, job_id, (salary*commission_pct) AS commission
FROM employees
WHERE commission_pct IS NOT NULL;






