-- DML (Data Manipulation Language) ★★★★★
-- 테이블에 데이터 검색, 삽입, 수정, 삭제하는 데 사용한다.
-- Rollback이 가능하다. ★★★

CREATE TABLE DEPT01 AS SELECT * FROM DEPT WHERE 1=0;
DESC DEPT01;
SELECT * FROM DEPT01;

-- 1. INSERT : 데이터 추가
INSERT INTO DEPT01 (DEPTNO, DNAME, LOC) VALUES (10, '영업부', '부산');
SELECT * FROM DEPT01;
-- 1.1 NULL 값 삽입 : 삽입하지 않은 컬럼은 자동으로 NULL 값 삽입
INSERT INTO DEPT01 (DEPTNO, DNAME) VALUES (30, '영업부');
INSERT INTO DEPT01 (DEPTNO) VALUES (50);
SELECT * FROM DEPT01;


-- 2. 서브 쿼리로 데이터 삽입하기
CREATE TABLE DEPT02 AS SELECT * FROM DEPT WHERE 1=0;
DESC DEPT02;
INSERT INTO DEPT02 SELECT * FROM DEPT;
SELECT * FROM DEPT02;
INSERT INTO SAM01 SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE DEPTNO=10;
SELECT * FROM SAM01;


-- 3. UPDATE : 데이터 수정 (조건X => 모든데이터가 다 변경된다 ★★★
CREATE TABLE EMP01 AS SELECT * FROM EMP;
UPDATE EMP01 SET DEPTNO=30;
SELECT * FROM EMP01;
UPDATE EMP01 SET SAL=SAL*1.1;
SELECT * FROM EMP01;
UPDATE EMP01 SET HIREDATE=SYSDATE;
SELECT * FROM EMP01;
DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP;
SELECT * FROM EMP01;
-- 3.1 다중 컬럼 값 변경
UPDATE EMP01 SET deptno=10, job='과장' WHERE ename='한예슬';
UPDATE EMP01 SET hiredate=sysdate, sal=600, comm=200 WHERE ename='오지호';
-- 3.2 서브 쿼리를 이용한 데이터 수정
-- 20번 부서의 지역명을 40번 부서의 지역명으로 변경하기 위해서 서브 쿼리문을 사용한다.★★★
UPDATE DEPT02 
SET LOC = (SELECT LOC FROM DEPT WHERE DEPTNO=40) 
WHERE DEPTNO=20;
SELECT * FROM DEPT02;


-- 4. DELETE : 조건을 정하지 않으면 모든 데이터(행)이 삭제된다. ★★★
-- DELETE : 데이터는 지워지지만 테이블의 용량은 줄어들지 않는다. 원하는 데이터만 지울 수 있고 Rollback 가능
-- TRUNCATE : 일반 데이터 및 인덱스 등도 모두 삭제되고, 테이블의 용량도 줄어든다. 원하는 데이터를 선택해서 지울 수 없으며 Rollback 불가능
-- DROP : 테이블 전체를 삭제. 삭제 후 되돌릴 수 없다. Rollback 불가능

DELETE FROM SAM01 WHERE JOB IS NULL;
SELECT * FROM SAM01;
-- 4.1 서브쿼리를 이용한 데이터 삭제
DELETE FROM EMP01 WHERE deptno = (SELECT deptno FROM dept WHERE dname='영업부');
SELECT * FROM EMP01;


-- 5. MERGE (합병)


-- 문제 (1~3)
CREATE TABLE SAM01 (
EMPNO     NUMBER(4),
ENAME     VARCHAR2(10),
JOB         VARCHAR2(9),
SAL         NUMBER(7,2)
);
INSERT INTO SAM01 VALUES (1000, '사과', '경찰', 1000);
INSERT INTO SAM01 VALUES (1010, '바나나', '간호사', 1500);
INSERT INTO SAM01 VALUES (1020, '오렌지', '의사', 2000);
INSERT INTO SAM01 VALUES (1030, '베리', '', 2500);
INSERT INTO SAM01 VALUES (1040, '망고', NULL, 25000);
DESC SAM01;
SELECT * FROM SAM01;

-- 문제 (4~6)
UPDATE EMP01 SET deptno=30 WHERE deptno=10; 
SELECT * FROM EMP01;
UPDATE EMP01 SET sal=sal*1.1 WHERE sal>=400;
SELECT * FROM EMP01;
UPDATE SAM01 SET sal=sal-5000 WHERE sal>=10000;
SELECT * FROM SAM01;

-- 문제 (7~8)
CREATE TABLE SAM02 AS SELECT ename, sal, hiredate, deptno FROM EMP;
UPDATE SAM02 SET sal=(sal+100) 
WHERE deptno = (SELECT deptno FROM dept WHERE LOC='인천'); ★★★
SELECT * FROM SAM02;

COMMIT;

