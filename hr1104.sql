-- HR 계정 보유 모든 테이블 보기
select * from tab;
--employees 테이블 전체 내용 조회
SELECT * FROM employees;
--employees 테이블에 대한 설명 (DESC : describe)
DESC employees;
--employees테이블의 first_name, last_name, job_id 만 조회
SELECT first_name, last_name, job_id from employees;
SELECT * FROM employees WHERE JOB_ID='AD_VP';
SELECT * FROM employees WHERE JOB_ID='IT_PROG';

SELECT * FROM employees WHERE (COMMISSION_PCT != null);


SELECT
    *
FROM tab;
DESC employees;
--사원번호 176의 last_name, 부서번호
SELECT last_name, department_id FROM employees WHERE employee_id = 176;
--연봉 12000이상 직원의 last_name, 연봉
SELECT last_name, salary*12+commission_pct AS 연봉 FROM employees WHERE (salary*12+commission_pct) >=12000;
SELECT last_name, salary AS 연봉 FROM employees WHERE salary >=12000;

--SELECT last_name, salary*12+commission_pct AS 연봉 FROM employees WHERE '연봉' >=12000;
--연봉 5000~12000 이외 의 last_name, 연봉 조회
SELECT last_name, salary*12+commission_pct FROM employees WHERE (salary*12+commission_pct) <5000 AND (salary*12+commission_pct)>12000;
SELECT last_name, salary FROM employees WHERE salary < 5000 OR salary>12000;

DESC employees;
--20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서 번호를 알파벳 순으로 조회
SELECT last_name, department_id FROM employees WHERE department_id IN(20, 50) ORDER BY last_name;
--커미션을 버는 모든 사원들의 LAST_NAME, 연봉, 커미션 조회. 단, 연봉의 역순 및 커미션의 역순으로 출력
SELECT last_name, salary, commission_pct FROM employees WHERE commission_pct <>0 ORDER BY salary DESC, commission_pct DESC;
--연봉이 2500, 3500, 7000이 아니며 직업이 SA_REP이거나 ST_CLERK인 사람들 조회
SELECT * FROM employees WHERE salary NOT IN(2500, 3500, 7000) AND job_id IN('SA_REP', 'ST_CLERK');
SELECT * FROM employees WHERE salary NOT IN(2500, 3500, 7000) AND job_id IN('sa_rep', 'st_clerk');
SELECT * FROM employees;
select distinct job_id from employees;
--2008/02/02 ~ 2008/05/01 사이에 고용된 사원의 LAST_NAME, 사원번호, 고용일자 조회.
--단, 고용일자의 내림차순 정렬
DESC employees;
SELECT last_name, employee_id, hire_date FROM employees WHERE hire_date >= '08/02/02' AND hire_date < '08/05/01' ORDER BY hire_date DESC;
--2004년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회
--단, 입사일 기준 오름차순 정렬
SELECT last_name, hire_date FROM employees WHERE hire_date >= '04/01/01' ORDER BY hire_date;
SELECT last_name, hire_date FROM employees WHERE hire_date >= '2004-01-01' ORDER BY hire_date;
SELECT last_name, hire_date FROM employees WHERE hire_date >= '2004.01.01' AND hire_date <= '04-12-31' ORDER BY hire_date;

--연봉 5000~12000 범위, 20 or 50번 부서에 근무하는 사람들의 연봉 조회, 오름차순으로
select * from employees;
SELECT last_name, salary 
FROM employees 
WHERE (salary BETWEEN 5000 AND 12000) AND (department_id IN(20, 50)) 
ORDER BY salary;

--2004년도 고용된 모든 사람들의 last_name, 및 고용일 조회, 입사일 기준 오름차순 정리
desc employees;
SELECT last_name, hire_date 
FROM employees 
WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-31'
ORDER BY hire_date;

--연봉 5000~12000 범위 이외, last_name, salary 조회
SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000
ORDER BY salary;

--LIKE 연습
--2004년도 고용된 모든 사람들의 last_name, 및 고용일 조회, 입사일 기준 오름차순 정리
SELECT last_name, hire_date 
FROM employees 
WHERE hire_date LIKE '2004%' OR hire_date LIKE '04%' 
ORDER BY hire_date;
--LAST_NAME 에 u가 포함되는 사원들의 사번 및 last_name 조회
DESC employees;
SELECT employee_id, last_name
FROM employees
WHERE last_name LIKE '%u%';
--last_name에 네번째 글자가 a인 사람들의 last_name 조회
SELECT last_name
FROM employees
WHERE last_name LIKE '___a%';
-- last_name에 a 혹은 e글자가 있는 사원들의 last_name을 조회하여 last_name의 오름차순 정렬
SELECT last_name
FROM employees
WHERE (last_name LIKE '%a%') OR (last_name LIKE '%e%')
ORDER BY last_name;

--IS NULL 연습
--매니저가 없는 사람들의 LAST_NAME, JOB_ID 조회
DESC employees;
SELECT last_name, job_id
FROM employees
WHERE manager_id IS NULL;
--ST_CLERK인 JOB_ID를 가진 사원이 없는 부서 ID 조회, 부서 번호가 NULL인 값 제외

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES
WHERE (DEPARTMENT_ID IS NOT NULL) AND (JOB_ID NOT IN('ST_CLERK'))
ORDER BY DEPARTMENT_ID;

SELECT DISTINCT DEPARTMENT_ID, JOB_ID FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;

--COMMISSSION_PCT가 NULL이 아닌 사원 중
--COMMISSION = SALALY*COMMISSION_PCT를 구하여
--EMPLOYEE_ID, FIRST_NAME, JOB_ID와 같이 조회
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

--다중행 함수
----회사 내 최대 연봉 및 최대 연봉 차이
SELECT (MAX(salary) - MIN(salary)) FROM employees;

SELECT COUNT(DISTINCT manager_id) AS 매니저 FROM employees;

--join 실습
-- 자신의 담당 매니저의 고용일보다 빠른 입사자를 찾아 Hire_date, last_name, manager_id를 출력
select e1.hire_date, e1.last_name, e2.manager_id
from employees e1, employees e2
where e1.employee_id = e2.manager_id
group by e1.hire_date, e1.last_name, e2.manager_id;

select e1.hire_date, e1.last_name, e2.manager_id
from employees e1, employees e2
where e1.employee_id = e2.manager_id 
        and to_char(date(e1.hire_date, 'YYYMMDD')) < to_char(date(e2.hire_date, 'YYYMMDD'));

select e1.hire_date, e1.last_name, e1.hire_date as 입사일,
            e1.manager_id, e2.hire_date as 매니저_입사일
from employees e1, employees e2
where e1.manager_id = e2.employee_id and e1.hire_date < e2.hire_date;

--도시 이름이 T로 시작하는 지역에 사는 사원 사번, last_name, 부서 번호 조회
--(employees 의 department_id와 departments 의 department_id 연결 후
--departments의 location_id와 locations의 location_id 조인) 2행
select e.employee_id, e.last_name, d.department_id, 
from 
    employees e inner join departments d on e.department_id = d.department_id
    right outer join locations l on d.location_id = l.location_id;

--도시 이름이 T로 시작하는 지역에 사는 사원들의 사번, LAST_NAME, DEPARTMENT_ID 조회
--조인 : EMPLOYEES(DEPARTMENT_ID) + DEPARTMENTS(DEPARTMENT_ID) --e.department_id = d.department_id
--조인 : DEPARTMENTS(LOCATION_ID) + LOCATIONS(LOCATION_ID) --d.location_id = l.location_id
SELECT employee_id, last_name, e.department_id
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id AND city like 'T%';

--위치 id = 1700 사원의 employee_id, last_name, salary
--join : employees(department_id) + departments(department_id) -> 18행
SELECT employee_id, last_name, d.department_id, salary
FROM employees e, departments d
WHERE e.department_id = d.department_id AND d.location_id =1700

--department_name, location_id, 각 부서별 사원수, 각 부서별 평균연봉
--join : employees + departments => 11행
SELECT d.department_name, d.location_id, count(EMPLOYEE_ID), ROUND(avg(salary))
FROM employees e, departments d
WHERE e.department_id = d.department_id
GROUP BY d.department_name, d.location_id;
--확인 필요

SELECT department_name, location_id, count(employee_id), round(avg(salary))
FROM employees e, departments d
WHERE e.department_id = d.department_id
GROUP BY d.department_name, d.location_id;


--EXECUTIVE 부서에서 근무하는 모든 사원들의 DEPARTMENT_ID, LAST_NAME, JOB_ID
--JOIN : EMPLOYEES + DEPARTMENTS
SELECT last_name, d.department_id, job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id AND department_name = 'Executive';

--기존 직업을 여전히 가지고 있는 사원들의 사번 및 job_id 조회
--join : employees + job_history
SELECT E.EMPLOYEE_ID, E.JOB_ID
FROM EMPLOYEES E, JOB_HISTORY J
WHERE E.EMPLOYEE_ID = J.EMPLOYEE_ID AND E.JOB_ID = J.JOB_ID;

--각 사원별 소속 부서에서 자신보다 늦게 고용되었지만 보다 많은 연봉을 받는 사원의 LAST_NAME 조회
--JOIN : EMPLOYEES + EMPLOYEES (SELF_JOIN)

SELECT E1.DEPARTMENT_ID, E1.FIRST_NAME || ' ' || E1.LAST_NAME AS NAME
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.EMPLOYEE_ID = E2.EMPLOYEE_ID AND 
             E1.HIRE_DATE < E2.HIRE_DATE AND E1.SALARY < E2.SALARY;
