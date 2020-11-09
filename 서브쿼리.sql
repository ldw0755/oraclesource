--존스의 급여보다 높은 급여를 받는 사원들 출력

--STEP1) 존스의 급여 알아내기
SELECT SAL FROM EMP WHERE ENAME = 'JONES';

--STEP 2)높은 급여 사원 출력하기
SELECT * FROM EMP WHERE SAL>2975;

--STEP1 + STEP2 : 서브쿼리 : 퀘리문 안에 다른 쿼리문을 포함
--단일행 서브쿼리 : 서브쿼리 결과 -> 1개(여기서는 SAL) / >, <, <=, >=, 같지 않음(!=, <>, ^=)
SELECT * FROM EMP WHERE SAL> (SELECT SAL FROM EMP WHERE ENAME = 'JONES');

--사원 이름이 ALLEN인 사원의 추가수당보다 많이 받는 사원 출력
SELECT *
FROM EMP
WHERE COMM > (SELECT COMM FROM EMP WHERE ENAME = 'ALLEN');

--사원 이름이 WARD인 사원보다 입사일이 빠른 사원 출력
SELECT *
FROM EMP
WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'WARD');

--20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원 출력
SELECT *
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP) AND DEPTNO = 20;

--20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원 출력
--추가 : 부서명, 지역 위치 출력
SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL > (SELECT AVG(SAL) FROM EMP) AND E.DEPTNO = 20;

--다중행 서브쿼리 : 단일행 서브쿼리 연산자 사용 X
--단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
--SELECT * FROM emp where sal >= ( select max(sal) from emp group by deptno);
 select max(sal) from emp group by deptno;

--IN
SELECT * FROM emp where sal in ( select max(sal) from emp group by deptno);

--ANY(SOME) : ANY - 비교연산자랑 같이 사용(IN과 수행결과 같음 : 선호도 : IN > ANY)
SELECT * FROM emp where sal = ANY ( select max(sal) from emp group by deptno);

--30번 부서 사원들의 최대급여보다 적은 급여를 받는 사원 출력
SELECT * FROM EMP WHERE SAL < (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30); --단일행
SELECT * FROM EMP WHERE SAL < ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);   --다중행 => SAL 기준 정렬된 결과물
--ORDER BY 사용 안하고 같은 결과물 => 보다 효율적인 쿼리문
--위 두 쿼리문 결과는 동일함
SELECT DISTINCT SAL FROM EMP WHERE DEPTNO=30