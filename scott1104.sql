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

--�����ڸ� �̿��� ��ȸ

-- ��������� : sal*12 = 36000�� ������ ��ȸ
SELECT * FROM emp WHERE sal*12 = 36000;

--���� ������ : >, < >=, <=
SELECT * FROM emp WHERE sal > 3000;
SELECT * FROM emp WHERE sal >= 3000;

SELECT * FROM emp WHERE ename >= 'F';

--�� ������ : AND, OR
--�޿� 2500�̻� ���� ANALYST
SELECT * FROM emp WHERE sal >=2500 AND job='ANALYST';

--������ MANAGER, SALESMAN, CLERK
SELECT * FROM emp WHERE job = 'MANAGER' OR job = 'SALESMAN' OR job = 'CLERK';
SELECT * FROM emp WHERE job IN('MANAGER', 'SALESMAN', 'CLERK');

--������� : =, !=

--SAL�� 3000�� �ƴ� ��� ����
SELECT * FROM emp WHERE sal != 3000;
SELECT * FROM emp WHERE sal <> 3000; 
SELECT * FROM emp WHERE sal ^= 3000; 

-- IN ������
SELECT * FROM emp WHERE job = 'MANAGER' OR job = 'SALESMAN' OR job = 'CLERK';
SELECT * FROM emp WHERE job IN('MANAGER', 'SALESMAN', 'CLERK'); --() �� �ϳ��� �ش��ϴ� ���

SELECT * FROM emp WHERE job != 'MANAGER' AND job != 'SALESMAN' AND job != 'CLERK';
SELECT * FROM emp WHERE job NOT IN('MANAGER', 'SALESMAN', 'CLERK'); --() ��ο� �ش����� �ʴ� ���

--IN �� ����Ͽ� �μ���ȣ�� 10��, 20���� ��� ���� ��ȸ
SELECT * FROM emp WHERE deptno IN(10, 20);

--BETWEEN A AND B : A~B�� ���� ǥ��

--1) �޿� 2000�̻� 3000 ������ ��� ����
SELECT * FROM emp WHERE sal >=2000 AND sal <=3000;
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 3000 ORDER BY sal;

--1) �޿� 2000�̻� 3000 ���ϰ� �ƴ� ��� ����
SELECT * FROM emp WHERE sal NOT BETWEEN 2000 AND 3000 ORDER BY sal;

--LIKE : ���ڿ� �˻� (ex. s�� �����ϴ� ~~, H�� ������..., ����� T�� ������)

--1) ��� �̸��� S�� �����ϴ� ��� ������� ��ȸ�ϱ�
SELECT * FROM emp WHERE ename LIKE 'S%';

--2) ��� �̸��� �ι�° ���ڰ� L�� ����� ��ȸ
SELECT * FROM emp WHERE ename LIKE '_L%';

--3) ��� �̸��� AM�� ���ԵǾ� �ִ� ����� ��ȸ
SELECT * FROM emp WHERE ename LIKE '%AM%';

--4) ��� �̸��� AM�� ���ԵǾ� ���� �ʴ� ����� ��ȸ
SELECT * FROM emp WHERE ename NOT LIKE '%AM%';

--IS NULL
--SELECT * FROM EMP WHERE COMM = NULL; (x)
SELECT * FROM emp WHERE comm IS NULL;

--MGR(�Ŵ��� ID)�� NULL�� ������� ��ȸ
SELECT * FROM emp WHERE mgr IS NULL;
--MGR(�Ŵ��� ID)�� NULL�� �ƴ� ������� ��ȸ
SELECT * FROM emp WHERE mgr IS NOT NULL;

desc 

SELECT TO_DATE('2020-11-05', 'YYYY/MM/DD') AS TOTATE1,
              TO_DATE('20201105', 'YYYY-MM-DD') AS TOTATE2 FROM DUAL;
    
--1981�� 6�� 1�� ���Ŀ� �Ի��� ��� ���� ��ȸ
desc emp;
select *
from emp
where hiredate > to_date('1981-06-01', 'YYYY-MM-DD');

--to_date, to_number : ���� �� ���� �ּ�ȭ
SELECT TO_DATE('2019-12-20') - TO_DATE('2019-10-20') FROM dual;

--NULL ó�� �Լ� : null�϶� ������ ���� ���� / NVL, NVL2
--NVL(A, a) : A�� null�϶� a ����
--NVL(A, a, b) : A�� null�� �ƴ� �� a ���� / null�� �� b ����
SELECT empno, ename, sal, comm, sal+comm FROM emp;
SELECT empno, ename, sal, comm, sal+comm, nvl(comm, 0), sal+nvl(comm, 0)
FROM emp;
SELECT empno, ename, sal, comm, nvl2(comm, 'O', 'X'), 
                nvl2(comm, SAL*12+COMM, SAL*12) AS ANNSAL
FROM emp;

--DECODE�Լ��� CASE��
----job�� manager, salesman, analyst ��� ���� �ٸ� ���� ����
SELECT empno, ename, JOB, sal, DECODE(JOB,
                                                                    'manager', sal*1.1,
                                                                    'salesman', sal*1.05,
                                                                    'analyst', sal,
                                                                    sal*1.03) AS UPSAL 
FROM emp;

SELECT empno, ename, JOB, sal, CASE JOB
                                                     WHEN 'manager' THEN sal*1.1,
                                                     WHEN'salesman' THEN sal*1.05,
                                                     WHEN 'analyst' THEN sal,
                                                     ELSE sal*1.03
                                                END AS UPSAL 
FROM emp;

SELECT empno, ename, job, sal CASE
                                                        WHEN comm IS NULL THEN '�ش���� ����'
                                                        WHEN comm = 0 THEN '���� ����'
                                                        WHEN comm > 0 THEN '���� : ' ||COMM
                                                    END AS COMM_TEXT FROM EMP;





