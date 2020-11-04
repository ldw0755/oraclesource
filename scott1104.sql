-- SCOTT 계정 보유 모든 테이블 보기
select * from tab;

--SELECT : 조회

--emp 테이블의 구조
DESC emp;

--emp 테이블 모든 내용 조회
SELECT * FROM emp;

--emp 테이블 특정 필드 조회
SELECT ename, job, sal FROM emp;

--중복 레코드 제거 후 조회  : DISTINCT
SELECT DISTINCT deptno FROM emp;

--alais(별칭) : AS
SELECT empno AS 사원번호 FROM emp;

--필드의 연산 가능
SELECT ename AS 사원이름, sal AS 월급, sal*12+comm AS 연봉, comm FROM emp;

SELECT ename as "사원 이름", job as 직책 from emp;

-- ORDER BY : 정렬하여 조회(오름차순 : ASC - default)
-- 하나의 열로 기준 잡아 조회
SELECT ename, sal FROM emp ORDER BY sal;
-- 내림차순 조회(DESC : 디센딩)
SELECT ename, sal FROM emp ORDER BY sal DESC;

--전체 데이터 조회(사원번호 오름차순)
SELECT * FROM emp ORDER BY empno;

--부서 번호 오름차순, 부서 번호 동일(급여의 내림차순)
SELECT * FROM emp ORDER BY deptno, sal DESC;

SELECT empno as EMPLOYEE_NO, ename AS EMPLOYEE_NAME, job, mgr AS MANAGER, hiredate,
            sal AS SALARY, comm AS COMMISSION, deptno as DEPARTMENT_NO 
FROM emp
ORDER BY deptno DESC, ename;

-- WHERE : 조회 기준 주기

--부서 번호 30번인 사원 조회
SELECT *FROM emp WHERE deptno = 30;
--사원번호 7782
SELECT * FROM emp WHERE empno = 7782;
--부서 번호 : 30, 사원직책이 salesman / VARCHAR(TYPE) : 홋따옴표(single quotation)
SELECT * FROM emp WHERE deptno = 30 AND job = 'SALESMAN';
--사원번호 7499, 부서번호 30
SELECT * FROM emp WHERE empno = 7499 AND deptno = 30;
--부서번호 30 or 사원직책 clerk 정보 조회
SELECT * FROM emp WHERE deptno =30 OR job = 'clerk';
--부서번호 20 or 사원직책 salesman
SELECT * FROM emp WHERE deptno =20 OR job = 'salesman';

--연산자를 이용한 조회

-- 산술연산자 : sal*12 = 36000인 데이터 조회
SELECT * FROM emp WHERE sal*12 = 36000;

--관계 연산자 : >, < >=, <=
SELECT * FROM emp WHERE sal > 3000;
SELECT * FROM emp WHERE sal >= 3000;

SELECT * FROM emp WHERE ename >= 'F';

--논리 연산자 : AND, OR
--급여 2500이상 직업 ANALYST
SELECT * FROM emp WHERE sal >=2500 AND job='ANALYST';

--직무가 MANAGER, SALESMAN, CLERK
SELECT * FROM emp WHERE job = 'MANAGER' OR job = 'SALESMAN' OR job = 'CLERK';
SELECT * FROM emp WHERE job IN('MANAGER', 'SALESMAN', 'CLERK');

--등가연산자 : =, !=

--SAL이 3000이 아닌 사원 정보
SELECT * FROM emp WHERE sal != 3000;
SELECT * FROM emp WHERE sal <> 3000; 
SELECT * FROM emp WHERE sal ^= 3000; 

-- IN 연산자
SELECT * FROM emp WHERE job = 'MANAGER' OR job = 'SALESMAN' OR job = 'CLERK';
SELECT * FROM emp WHERE job IN('MANAGER', 'SALESMAN', 'CLERK'); --() 중 하나에 해당하는 경우

SELECT * FROM emp WHERE job != 'MANAGER' AND job != 'SALESMAN' AND job != 'CLERK';
SELECT * FROM emp WHERE job NOT IN('MANAGER', 'SALESMAN', 'CLERK'); --() 모두에 해당하지 않는 경우

--IN 을 사용하여 부서번호가 10번, 20번인 사원 정보 조회
SELECT * FROM emp WHERE deptno IN(10, 20);

