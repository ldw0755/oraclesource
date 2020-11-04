-- SCOTT ���� ���� ��� ���̺� ����
select * from tab;

--SELECT : ��ȸ

--emp ���̺��� ����
DESC emp;

--emp ���̺� ��� ���� ��ȸ
SELECT * FROM emp;

--emp ���̺� Ư�� �ʵ� ��ȸ
SELECT ename, job, sal FROM emp;

--�ߺ� ���ڵ� ���� �� ��ȸ  : DISTINCT
SELECT DISTINCT deptno FROM emp;

--alais(��Ī) : AS
SELECT empno AS �����ȣ FROM emp;

--�ʵ��� ���� ����
SELECT ename AS ����̸�, sal AS ����, sal*12+comm AS ����, comm FROM emp;

SELECT ename as "��� �̸�", job as ��å from emp;

-- ORDER BY : �����Ͽ� ��ȸ(�������� : ASC - default)
-- �ϳ��� ���� ���� ��� ��ȸ
SELECT ename, sal FROM emp ORDER BY sal;
-- �������� ��ȸ(DESC : �𼾵�)
SELECT ename, sal FROM emp ORDER BY sal DESC;

--��ü ������ ��ȸ(�����ȣ ��������)
SELECT * FROM emp ORDER BY empno;

--�μ� ��ȣ ��������, �μ� ��ȣ ����(�޿��� ��������)
SELECT * FROM emp ORDER BY deptno, sal DESC;

SELECT empno as EMPLOYEE_NO, ename AS EMPLOYEE_NAME, job, mgr AS MANAGER, hiredate,
            sal AS SALARY, comm AS COMMISSION, deptno as DEPARTMENT_NO 
FROM emp
ORDER BY deptno DESC, ename;

-- WHERE : ��ȸ ���� �ֱ�

--�μ� ��ȣ 30���� ��� ��ȸ
SELECT *FROM emp WHERE deptno = 30;
--�����ȣ 7782
SELECT * FROM emp WHERE empno = 7782;
--�μ� ��ȣ : 30, �����å�� salesman / VARCHAR(TYPE) : Ȫ����ǥ(single quotation)
SELECT * FROM emp WHERE deptno = 30 AND job = 'SALESMAN';
--�����ȣ 7499, �μ���ȣ 30
SELECT * FROM emp WHERE empno = 7499 AND deptno = 30;
--�μ���ȣ 30 or �����å clerk ���� ��ȸ
SELECT * FROM emp WHERE deptno =30 OR job = 'clerk';
--�μ���ȣ 20 or �����å salesman
SELECT * FROM emp WHERE deptno =20 OR job = 'salesman';