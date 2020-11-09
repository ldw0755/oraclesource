--SUM : 합계(
SELECT SUM(sal), SUM(DISTINCT sal), SUM(all sal) FROM emp;

--COUNT : 개수
SELECT COUNT(*) FROM emp;

--부서 번호가 30번인 직원 숫자
SELECT COUNT(*) FROM emp WHERE deptno = 30;
SELECT COUNT(sal), COUNT(DISTINCT sal), COUNT(all sal) FROM emp;

--MAX(최댓값), MIN(최솟값)
SELECT MAX(sal), MIN(sal) FROM emp;

----부서 번호가 20인 사원 중 최근 입사일
SELECT MAX(hiredate)  FROM emp WHERE DEPTNO= 20;

--AVERAGE : 평균
SELECT AVG(sal) FROM emp;
----부서번호 30번의 평균 임금
SELECT AVG(sal) FROM emp WHERE deptno=30;

SELECT AVG(sal), AVG(DISTINCT sal), AVG(all sal) FROM emp;

--특정 필드를 기준으로 GROUP화
SELECT AVG(sal) FROM emp WHERE deptno=10;
SELECT AVG(sal) FROM emp WHERE deptno=20;
SELECT AVG(sal) FROM emp WHERE deptno=30;

-- GROUP BY : 결과값을 원하는 열로 묶어 출력
SELECT deptno, AVG(sal) FROM emp GROUP BY deptno ORDER BY deptno;

--부서번호 별 추가수당 평균
SELECT deptno, AVG(comm) FROM emp GROUP BY deptno;

--부서별, 직책별, 급여 평균
SELECT deptno, AVG(sal), JOB FROM emp GROUP BY deptno, JOB ORDER BY deptno, JOB;
----기준이 등장하는 순서 유의

--GROUP BY 절에 포함안되는 열을 SELECT에 포함하면 안됨
SELECT ename, deptno, AVG(sal)
FROM emp
GROUP BY deptno, ename;

--부서별 직원 수 구하고 부서번호의 오름차순 출력
SELECT deptno, COUNT(*)
FROM emp
GROUP BY deptno
ORDER BY deptno;
--부서별 급여의 평균 연봉 출력, 평균 연봉은 정수만 나오도록
--부서번호별 오름차순 정렬
SELECT DEPTNO, ROUND(AVG(SAL), 0)
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--동일한 직업을 가진 사원수를 조회
SELECT JOB, COUNT(JOB) FROM emp GROUP BY(JOB);

--emp 테이블, 부서별 직책의 평균 급여 500이상 사원의
--부서 번호, 직책, 부서별 직책의 평균 급여 출력
select deptno, job, avg(sal)
from emp
group by deptno, job having avg(sal) >=500;

--조건 걸때 : 구문 실행 순서에 유의
select deptno, job, avg(sal)
from emp
where sal <=3000
group by deptno, job having(sal) >=2000
order by deptno, job;
--group by 절 포함 시 : 조건 수행 순서 - where -> having

--JOIN 개념이 필요한 이유
----나올 수 있는 모든 조합 : 카테시안 곱
select * from emp, dept order by empno; -- (X)
select count(*) from emp, dept order by empno; -- 56행 = 4*14행
select * from dept; -- 4행
select * from emp; --14행

----1) 내부 조인(등가조인)
SELECT * 
FROM emp , dept 
WHERE emp.deptno = dept.deptno --조인 기준
ORDER BY empno;
SELECT * 
FROM emp e, dept d
WHERE e.deptno = d.deptno --조인 기준
ORDER BY empno;
----14행 = emp 기준

----내부조인 : 기본 형태
SELECT * 
FROM emp INNER JOIN dept
ON emp.deptno = dept.deptno --조인 기준
ORDER BY empno;
SELECT * 
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno --조인 기준
ORDER BY empno;

--두 테이블에 같은 이름의 필드가 존재하는 경우
SELECT empno, ename, job, e.deptno, dname -- 겹치는 필드 : deptno -> 위치 명시 : e.deptno or d.deptno
FROM emp e, dept d
-- select에서 e. or d. 명령이 가능한 이유 : 코드 읽는 순서 : from(like 변수 선언) -> select(like. 선언 변수 사용)
WHERE e.deptno = d.deptno --조인 기준
ORDER BY empno;

--emp, dept 테이블 조인, empno, ename, sal, deptno, dname, loc 출력
--단, 급여 3000이상
select empno, ename, sal, d.deptno, dname, loc
from emp e, dept d
where e.deptno = d.deptno and sal >=3000;

SELECT E.empno, E.ename, E.sal, D.deptno, D.dname, D.loc
FROM emp E, dept D
WHERE E.deptno = D.deptno AND sal >=3000;

--emp 테이블 별칭 e
--dept 테이블 별칭 d
--급여 2500 이하, 사원번호 9999이하

select *
from emp E inner join dept D
on e.deptno = d.deptno
where sal <= 2500 and empno <=9999
;


--emp 테이블 별칭 e
--salgrade 테이블 별칭 s
--각 사원 정보 + 사원 등급

select
from emp E, salgrade S
where e.sal bewteen s.losal and s.hisal;

----2) 셀프조인(자체조인) : 조인 테이블이 자기 자신 테이블일 때
select * from emp;
--mgr = empno

select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1, emp e2
where e1.mgr = e2.empno;
--mgr = null인 경우 출력 X => 조건을 만족하는 데이터만 추출

----3) 외부 조인(OUTER JOIN) : 조건을 만족하지 않는 데이터도 추출
----두 종류 구문 모두 기억
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 LEFT OUTER JOIN emp e2 ON e1.mgr = e2.empno; --표준 방식

select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1, emp e2
where e1.mgr = e2.empno(+); --LEFT OUTER JOIN

select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1, emp e2
where e1.mgr(+) = e2.empno; --RIGHT OUTER JOIN

select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 RIGHT OUTER JOIN emp e2 ON e1.mgr = e2.empno;

--실습1
-- 급여 2000 초과인 사원 - 부서정보, 사원정보
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL > 2000
ORDER BY DEPTNO;

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
where E.DEPTNO = D.DEPTNO and SAL > 2000
ORDER BY DEPTNO;

--실습2
-- 부서별 평균 급여, 최대급여, 최소급여, 사원수
SELECT E.DEPTNO, D.DNAME, FLOOR(AVG(E.SAL)) AS AVG_SAL, MAX(E.SAL), MIN(E.SAL), COUNT(E.EMPNO)
FROM EMP E, DEPT D
GROUP BY DEPTNO, SAL, DNAME, EMPNO
HAVING E.DEPTNO = D.DEPTNO
ORDER BY DEPTNO;

SELECT E.DEPTNO, D.DNAME
FROM dept d, emp e where E.DEPTNO = D.DEPTNO
group by dname
ORDER BY DEPTNO;

select e.deptno, d.dname, floor(avg(e.sal)) as AVG_SAL, max(e.sal), min(e.sal), count(dname)
from dept d, emp e
where e.deptno = d.deptno
group by e.deptno, d.dname
order by e.deptno;
--GROUP BY DEPTNO;
--실습3
--모든 부서 정보, 사원 정보
--부서 번호, 사원 이름순

SELECT 












