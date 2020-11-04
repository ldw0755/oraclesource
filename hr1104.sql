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