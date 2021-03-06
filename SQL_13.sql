-- 뷰 ★★★

-- 1. 뷰의 개념
-- 물리적인 테이블을 근거한 논리적인 가상 테이블
-- 가상이란 단어는 실질적으로 데이터를 저장하고 있지 않기 때문에 붙인 것이고,
-- 테이블이란 단어는 실질적으로 데이터를 저장하고 있지 않더라도 사용자는
-- 마치 테이블을 사용하는 것과 동일하게 뷰를 사용할 수 있기 때문에 가상 테이블이라 불린다.
-- 기본 테이블에서 파생된 객체로서 기본 테이블에 대한 하나의 쿼리문이다.
-- 사용자에게 주어진 뷰를 통해서 기본 테이블을 제한적으로 사용하게 된다.
-- 1.1. 뷰의 기본 테이블
CREATE TABLE DEPT_COPY AS SELECT * FROM DEPT;
CREATE TABLE EMP_COPY AS SELECT * FROM EMP;
SELECT * FROM EMP_COPY;
SELECT * FROM DEPT_COPY;
SELECT EMPNO, ENAME, DEPTNO
FROM EMP_COPY
WHERE DEPTNO=30;
-- 1.2 뷰 정의하기
CREATE VIEW EMP_VIEW30 
AS SELECT EMPNO, ENAME, DEPTNO
FROM EMP_COPY
WHERE DEPTNO=30;
SELECT * FROM EMP_VIEW30;


-- 2. 뷰의 구조
-- USER_VIEWS를 통해 뷰에 저장된 TEXT 파일을 볼 수 있다.
SELECT * FROM USER_VIEWS;
SELECT * FROM EMP_VIEW30;
-- VIEW 테이블 데이터 추가 : 연결된 기본테이블도 적용한다
INSERT INTO EMP_VIEW30 VALUES (1111, 'AAAA', 30);
SELECT * FROM EMP_VIEW30;
SELECT * FROM EMP_COPY;


-- 3. 뷰를 사용하는 이유


-- 4. 뷰의 종류 : 단순 뷰 / 복합 뷰
-- 4.2 단순 뷰의 컬럼에 별칭 부여
CREATE OR REPLACE VIEW EMP_VIEW(사원번호, 사원명, 급여, 부서번호)
AS SELECT EMPNO, ENAME, SAL, DEPTNO 
FROM EMP_COPY;
SELECT * FROM EMP_VIEW WHERE 부서번호=30;
SELECT * FROM EMP_VIEW;
-- 4.6 복합 뷰 만들기
CREATE VIEW EMP_VIEW_DEPT
AS SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, D.LOC 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO DESC;
SELECT * FROM EMP_VIEW_DEPT;
SELECT * FROM USER_VIEWS;


-- 5. 뷰 삭제와 옵션
-- DROP VIEW 뷰이름;
-- 5.1 OR REPLACE
-- CCREATE OR REPLACE VIEW 를 사용하면 존재하지 않는 뷰이면 새로운 뷰생성
-- 기존에 존재하는 뷰이면 그 내용을 변경
CREATE OR REPLACE VIEW EMP_VIEW30
AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO
FROM EMP_COPY
WHERE DEPTNO=30;
SELECT * FROM EMP_VIEW30;
-- 5.3  WITH CHECK OPTION / WITH READ ONLY (P35)


-- 6. 인라인 뷰
-- ROWNUM 컬럼은 데이터가 입력된 순서 (몇번째 입력된 데이터 인지)를 알려주는 '가상컬럼'
SELECT ROWID, ROWNUM, EMPNO, ENAME, HIREDATE FROM EMP WHERE ROWNUM <= 5;
SELECT ROWNUM, EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE;
-- 6.1 뷰와 ROWNUM으로 TOP-N 구하기
-- 날짜로 정렬한 내용을 뷰로 만든 이유 : 정렬한 상태로 뷰를 만들면서 ROWNUM 이 재설정된다. ★★★
CREATE OR REPLACE VIEW VIEW_HIRE
AS SELECT EMPNO, ENAME, HIREDATE
FROM EMP ORDER BY HIREDATE;
SELECT ROWNUM, EMPNO, ENAME, HIREDATE FROM VIEW_HIRE;
SELECT ROWNUM AS "RANK", EMPNO, ENAME, HIREDATE 
FROM VIEW_HIRE 
WHERE ROWNUM <= 5;
-- 인라인뷰로 TOP-N 구하기 (FROM 안에 들어가는 부분이 제일 중요!! ★★)
SELECT ROWNUM AS "RANK", EMPNO, ENAME, HIREDATE
FROM (SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE)
WHERE ROWNUM<=5;


-- 문제
-- 1번 문제
CREATE VIEW EMP_VIEW20 
AS SELECT EMPNO, ENAME, DEPTNO, MGR 
FROM EMP_COPY 
WHERE DEPTNO=20;
SELECT * FROM EMP_VIEW20;
-- 2번 문제
-- 그룹함수 사용시 별칭 필수
CREATE VIEW SAL_VIEW
AS SELECT dname, MAX(sal) AS "MAX_SAL", MIN(sal) AS "MIN_SAL" 
FROM emp inner join dept 
On emp.deptno = dept.deptno
GROUP by dept.dname;
SELECT * FROM sal_view;
-- 3번 문제
DELETE FROM EMP_COPY WHERE ENAME='AAAA';
SELECT ROWNUM AS "RANKING", EMPNO, ENAME, SAL
FROM (SELECT EMPNO, ENAME, SAL FROM EMP_COPY ORDER BY SAL DESC)
WHERE ROWNUM<=3;
SELECT * FROM USER_VIEWS;

