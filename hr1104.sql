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