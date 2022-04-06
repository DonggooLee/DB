SELECT * FROM emp, dept;
SELECT * FROM emp, dept WHERE emp.deptno=dept.deptno;

-- ANSI Join
-- Inner Join
-- 형식 : SELECT * FROM table1 Inner Join table2 ON table1.column1 = table2.column2;
-- FROM절에 조인할 테이블을 명시하고 ON 절을 이용하여 조인 조건을 명시한다.
-- ON 절에 조인 조건을 명시하고, 다른 조건은 WHERE절에 지정한다.
SELECT * FROM emp inner join dept On emp.deptno = dept.deptno WHERE ename='김사랑';
SELECT * FROM emp inner join dept Using(deptno) WHERE ename='김사랑';

create table dept01(
deptno number(2),
dname VARCHAR2(14));
INSERT INTO dept01 VALUES (10,'ACCOUNTING');
INSERT INTO dept01 VALUES (20,'RESEARCH');

create table dept02(
deptno number(2),
dname VARCHAR2(14));
INSERT INTO dept02 VALUES (10,'ACCOUNTING');
INSERT INTO dept02 VALUES (30,'SALES');

-- Outer Join
-- Left Outer Join, Right Outer Join, Full Outer Join 세 가지 타입
-- Outer Join은 어느 한쪽 테이블에는 해당하는 데이터가 존재하는데 다른 쪽 테이블에는 데이터가 존재하지 않을 경우 
-- 그 데이터가 출력되지 않는 문제점을 해결하기 위해 사용하는 조인 기법이다. (Outer 문구 생략 가능)
-- dept01 기준
SELECT * FROM dept01 left outer join dept02 On dept01.deptno = dept02.deptno;
-- dept02 기준
SELECT * FROM dept01 right outer join dept02 Using(deptno);
-- left, right을 합한 형태
SELECT * FROM dept01 full outer join dept02 Using(deptno);

-- 문제
-- 1, 경리부에서 근무하는 사원의 이름과 입사일을 출력하시오.
SELECT emp.ename, emp.hiredate FROM dept inner join emp ON dept.deptno = emp.deptno WHERE dept.deptno=10;
SELECT emp.ename, emp.hiredate FROM dept inner join emp  
-- 2. 인천에서 근무하는 사원의 이름과 급여를 출력하시오.	
SELECT emp.ename, emp.sal FROM dept inner join emp ON dept.deptno = emp.deptno WHERE dept.deptno=20;
SELECT emp.ename, emp.sal FROM dept inner join emp ON dept.deptno = emp.deptno WHERE dept.loc='인천';

