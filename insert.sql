--회원가입, 게시글 등록, 입금....

--기존의 dept테이블을 복사하여 dept_temp 테이블 생성
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;

--현재 테이블 조회
SELECT *
FROM DEPT_TEMP;

--데이터 추가하기(방법1) : 필드명 O
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
VALUES(50, 'DATABASE', 'SEOUL');
--데이터 추가하기(방법2) : 필드명 X - 순서 준수
INSERT INTO DEPT_TEMP VALUES(60, 'DATABASE', 'SEOUL');

--DELETE FROM DEPT_TEMP WHERE DEPTNO = 50;
--DELETE FROM DEPT_TEMP WHERE DEPTNO = 60;

--NULL 삽입
--명시적으로 NULL 삽입
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES(70, 'DATABASE', NULL);
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES(80, 'MOBILE', '');
--묵시적으로 NULL 삽입 : 필드 지정 X
INSERT INTO DEPT_TEMP(DEPTNO, LOC) VALUES(90, 'INCHEON');

--EMP테이블 복사 EMP_TEMP 테이블 생성
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP;
DROP TABLE EMP_TEMP;

--EMP 테이블 복사 -> EMP_TEMP: 구조만 가져오기
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1;
SELECT * FROM EMP_TEMP;
DESC EMP_TEMP;
INSERT INTO emp_temp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
VALUES(9999, '홍길동', 'PRESIDENT', NULL, '2020/11/09', 4000, NULL, 10);
INSERT INTO emp_temp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
VALUES(8888, '성춘향', 'MANAGER', NULL, '2020/11/08', 3000, NULL, 10);
SELECT * FROM emp_temp;

--최종반영
COMMIT;
--cf. ROLLBACK(다시 되돌리기)
--트랜잭션 : COMMIT & ROLLBACK
INSERT INTO emp_temp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
VALUES(7777, '유승호', 'MANAGER', NULL, TO_DATE('07/01/2010', 'DD/MM/YYYY'), 4000, NULL, 20);
INSERT INTO emp_temp(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
VALUES(6666, '이순신', 'MANAGER', NULL, SYSDATE, 4000, NULL, 20);

--EMP 테이블에서 SALGRADE 테이블 참조 급여 등급이 1등급인 사원만을
--EMP_TEMP 테이블에 추가
--서브쿼리로 작성하기 (데이터가 추가되는 테이블의 열 개수 = 서브쿼리의 열 개수 일치)
--INSERT INTO emp_temp VALUES (SELECT * FROM EMP WHERE SALGRADE = 1);

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE =1;

COMMIT;
SELECT * FROM EMP_TEMP;