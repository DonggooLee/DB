-- DESC : 테이블의 구조를 확인하기 위한 명령어
-- 컬럼이름, 데이터 형, 길이와 NULL 허용 유무
DESC emp;

-- emp 가 소유하고 있는 테이블 전체(*)를 살핌 / TAB은 TABLE의 약자
SELECT * FROM emp;

-- emp 가 소유하고 있는 사원번호, 사원이름만 출력
SELECT empno, ename FROM emp;

-- 급여를 통한 연봉 계산
SELECT ename, sal, sal*12 FROM emp;

-- 커미션 값에 NULL이 들어있고 이를 연산하게 되면 결과에도 NULL 값이 들어간다
SELECT ename, sal, job, comm, sal*12, sal*12+comm FROM emp;

-- NULL을 0또는 다른 값으로 변환하기 위해 nvl함수를 제공한다.
SELECT ename, sal, job, nvl(comm,0), sal*12, sal*12+nvl(comm,0) FROM emp;

-- 원래 컬럼을 기술한 바로 뒤에 AS(alias) 라는 키워드를 쓴 후 별칭을 기술하여 원하는 컬럼명으로 출력
SELECT ename as "이름", sal as "월급" FROM emp;

-- 여러 개의 컬럼을 연결할 때 사용하는 Concatenation 연산자로 || 수직바를 사용
SELECT ename || ' is a ' || job FROM emp;

-- DISTINCT 를 통해 중복된 값을 제거1
SELECT deptno FROM emp;
SELECT DISTINCT deptno FROM emp;

-- SQL 기본 문제
-- 1. 사원의 이름, 급여, 입사일자만을 출력하시오.
SELECT ENAME, SAL, HIREDATE FROM EMP;
-- 2. 아래 그림과 같이 컬럼 이름이 출력되도록 하기 위해 별칭을 지정하시오.
SELECT DEPTNO AS "부서번호", DNAME AS "부서명" FROM DEPT;
-- 3. 아래 그림과 같이 직급이 중복되지 않고 한 번씩 나열되도록 하시오.
SELECT DISTINCT JOB FROM EMP;