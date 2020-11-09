CREATE TABLE TEST(
    ID NUMBER(4),
    NAME VARCHAR2(3));
    
DESC TEST;

--�ѱ��� ���� 1���� 2 BYTE
INSERT INTO TEST VALUES(1000, 'ȫ�浿');
--����� ���� 1���� 2 BYTE
INSERT INTO TEST VALUES(1000, 'abc');

SELECT * FROM TEST;

--���� ���� �ٸ� ����Ʈ ó�� ���� : NCHAR, NVARCHAR2

--NCHAR, NVARCHAR2 ���� : ������ ���� �׻� ������ �ִ°�?
--NCHAR : 1�� ���� �Է� BUT �׻� 4�ڸ� ����
--�޸� ȿ���� : VARCHAR2�� ����
CREATE TABLE TEST2(
    ID NCHAR(4),
    NAME NVARCHAR2(3));

INSERT INTO TEST2 VALUES ('Ȳ������', 'ȫ�浿');

CREATE TABLE TEST3 (
    ID NVARCHAR2(4),
    NAME NVARCHAR2(4),
    REG_DATE DATE);
    
INSERT INTO TEST3 VALUES ('Ȳ������', 'ȫ�浿', SYSDATE);
INSERT INTO TEST3 VALUES ('Ȳ������', 'ȫ�浿', '2020-11-09');

SELECT * FROM TEST3;

--���̺� �����ϱ�

--
DESC EMP;

CREATE TABLE EMP_DDL(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2), --��ü �ڸ��� : 7�ڸ� / �Ҽ��� �Ʒ� 2�ڸ� ���� ���� = �ڿ��� �ڸ� 5�ڸ�
    COMM NUMBER(7,2), -- 12345.78
    DEPTNO NUMBER(2));

--ALTER : ���̺� ����(����)

--COLUMN �߰�
ALTER TABLE EMP_DDL ADD HP VARCHAR2(20);

--���� COLUMN�� ����
ALTER TABLE EMP_DDL RENAME COLUMN HP TO TEL; --����� �����

DESC EMP_DDL;

--���� TYPE ����
ALTER TABLE EMP_DDL MODIFY EMPNO NUMBER(5);

--���� �÷� ����
ALTER TABLE EMP_DDL DROP COLUMN TEL;

--���̺� �̸� ����
RENAME EMP_DDL TO EMP_RENAME;

DESC EMP_RENAME;

--�ǽ�1 : MEMBER ���̺� �ۼ�
CREATE TABLE MEMBER(
    ID CHAR(8),
    NAME NVARCHAR2(10),
    ADDR NVARCHAR2(50),
    NATION NCHAR(4),
    EMAIL VARCHAR2(50), --���� ����� ��
    AGE NUMBER(7,2));

drop table member;
DESC MEMBER;
DESC member;

--�ǽ�2 : member ���̺� ����
--1) bigo �� �߰�
ALTER TABLE MEMBER ADD BIGO NVARCHAR2(20);
--2) bigo ũ�� ����
ALTER TABLE MEMBER MODIFY BIGO NVARCHAR2(30);
DESC MEMBER;
--3) bigo �̸� ����
ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK;
--4) member ���̺� ����
drop table member;

