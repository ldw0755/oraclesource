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