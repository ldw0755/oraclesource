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

select last_name, salary, decode(trunc(salary/2000,0),
                                                    0, 0.00,
                                                    1, 0.09,
                                                    2, 0.20,
                                                    3, 0.30,
                                                    4, 0.40,
                                                    5, 0.42,
                                                    6, 0.44,
                                                    0.45) as taxt_rate
from employees where department_id = 80;

--������ �Լ�
----ȸ�� �� �ִ� ���� �� �ִ� ���� ����
SELECT (MAX(salary) - MIN(salary)) FROM employees;

SELECT COUNT(DISTINCT manager_id) AS �Ŵ��� FROM employees;

--join �ǽ�
-- �ڽ��� ��� �Ŵ����� ����Ϻ��� ���� �Ի��ڸ� ã�� Hire_date, last_name, manager_id�� ���
select e1.hire_date, e1.last_name, e2.manager_id
from employees e1, employees e2
where e1.employee_id = e2.manager_id
group by e1.hire_date, e1.last_name, e2.manager_id;

select e1.hire_date, e1.last_name, e2.manager_id
from employees e1, employees e2
where e1.employee_id = e2.manager_id 
        and to_char(date(e1.hire_date, 'YYYMMDD')) < to_char(date(e2.hire_date, 'YYYMMDD'));

select e1.hire_date, e1.last_name, e1.hire_date as �Ի���,
            e1.manager_id, e2.hire_date as �Ŵ���_�Ի���
from employees e1, employees e2
where e1.manager_id = e2.employee_id and e1.hire_date < e2.hire_date;

--���� �̸��� T�� �����ϴ� ������ ��� ��� ���, last_name, �μ� ��ȣ ��ȸ
--(employees �� department_id�� departments �� department_id ���� ��
--departments�� location_id�� locations�� location_id ����) 2��
select e.employee_id, e.last_name, d.department_id, 
from 
    employees e inner join departments d on e.department_id = d.department_id
    right outer join locations l on d.location_id = l.location_id;

--���� �̸��� T�� �����ϴ� ������ ��� ������� ���, LAST_NAME, DEPARTMENT_ID ��ȸ
--���� : EMPLOYEES(DEPARTMENT_ID) + DEPARTMENTS(DEPARTMENT_ID) --e.department_id = d.department_id
--���� : DEPARTMENTS(LOCATION_ID) + LOCATIONS(LOCATION_ID) --d.location_id = l.location_id
SELECT employee_id, last_name, e.department_id
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id AND city like 'T%';

--��ġ id = 1700 ����� employee_id, last_name, salary
--join : employees(department_id) + departments(department_id) -> 18��
SELECT employee_id, last_name, d.department_id, salary
FROM employees e, departments d
WHERE e.department_id = d.department_id AND d.location_id =1700

--department_name, location_id, �� �μ��� �����, �� �μ��� ��տ���
--join : employees + departments => 11��
SELECT d.department_name, d.location_id, count(EMPLOYEE_ID), ROUND(avg(salary))
FROM employees e, departments d
WHERE e.department_id = d.department_id
GROUP BY d.department_name, d.location_id;
--Ȯ�� �ʿ�

SELECT department_name, location_id, count(employee_id), round(avg(salary))
FROM employees e, departments d
WHERE e.department_id = d.department_id
GROUP BY d.department_name, d.location_id;


--EXECUTIVE �μ����� �ٹ��ϴ� ��� ������� DEPARTMENT_ID, LAST_NAME, JOB_ID
--JOIN : EMPLOYEES + DEPARTMENTS
SELECT last_name, d.department_id, job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id AND department_name = 'Executive';

--���� ������ ������ ������ �ִ� ������� ��� �� job_id ��ȸ
--join : employees + job_history
SELECT E.EMPLOYEE_ID, E.JOB_ID
FROM EMPLOYEES E, JOB_HISTORY J
WHERE E.EMPLOYEE_ID = J.EMPLOYEE_ID AND E.JOB_ID = J.JOB_ID;

--�� ����� �Ҽ� �μ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴� ����� LAST_NAME ��ȸ
--JOIN : EMPLOYEES + EMPLOYEES (SELF_JOIN)

SELECT E1.DEPARTMENT_ID, E1.FIRST_NAME || ' ' || E1.LAST_NAME AS NAME
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.EMPLOYEE_ID = E2.EMPLOYEE_ID AND 
             E1.HIRE_DATE < E2.HIRE_DATE AND E1.SALARY < E2.SALARY;
