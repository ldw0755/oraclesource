--������ �޿����� ���� �޿��� �޴� ����� ���

--STEP1) ������ �޿� �˾Ƴ���
SELECT SAL FROM EMP WHERE ENAME = 'JONES';

--STEP 2)���� �޿� ��� ����ϱ�
SELECT * FROM EMP WHERE SAL>2975;

--STEP1 + STEP2 : �������� : ������ �ȿ� �ٸ� �������� ����
--������ �������� : �������� ��� -> 1��(���⼭�� SAL) / >, <, <=, >=, ���� ����(!=, <>, ^=)
SELECT * FROM EMP WHERE SAL> (SELECT SAL FROM EMP WHERE ENAME = 'JONES');

--��� �̸��� ALLEN�� ����� �߰����纸�� ���� �޴� ��� ���
SELECT *
FROM EMP
WHERE COMM > (SELECT COMM FROM EMP WHERE ENAME = 'ALLEN');

--��� �̸��� WARD�� ������� �Ի����� ���� ��� ���
SELECT *
FROM EMP
WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'WARD');

--20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ��� ���
SELECT *
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP) AND DEPTNO = 20;

--20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ��� ���
--�߰� : �μ���, ���� ��ġ ���
SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL > (SELECT AVG(SAL) FROM EMP) AND E.DEPTNO = 20;

--������ �������� : ������ �������� ������ ��� X
--���� �� ���� ���ǿ� 2�� �̻��� ���� ���ϵǾ����ϴ�.
--SELECT * FROM emp where sal >= ( select max(sal) from emp group by deptno);
 select max(sal) from emp group by deptno;

--IN
SELECT * FROM emp where sal in ( select max(sal) from emp group by deptno);

--ANY(SOME) : ANY - �񱳿����ڶ� ���� ���(IN�� ������ ���� : ��ȣ�� : IN > ANY)
SELECT * FROM emp where sal = ANY ( select max(sal) from emp group by deptno);

--30�� �μ� ������� �ִ�޿����� ���� �޿��� �޴� ��� ���
SELECT * FROM EMP WHERE SAL < (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30); --������
SELECT * FROM EMP WHERE SAL < ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);   --������ => SAL ���� ���ĵ� �����
--ORDER BY ��� ���ϰ� ���� ����� => ���� ȿ������ ������
--�� �� ������ ����� ������
SELECT DISTINCT SAL FROM EMP WHERE DEPTNO=30