CREATE TABLE DEPT_TCL AS SELECT * FROM DEPT;

INSERT INTO DEPT_TCL VALUES(50, 'DATABASE', 'SEOUL');

select * from dept_tcl;
commit;
rollback;

--하나의 트랜잭션 생성
insert into dept_tcl values(60, 'NETWORK', 'BUSAN');
UPDATE dept_tcl SET loc = 'SEOUL' WHERE DEPTNO=40;
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';
SELECT*FROM DEPT_TCL;

COMMIT;



