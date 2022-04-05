-- 1. WHERE
-- 급여가 300 이하인 사원의 사원번호, 사원 이름, 급여를 출력하는 SQL문을 작성.
SELECT empno, ename, sal FROM emp WHERE sal<=300;

-- 2. 비교연산자
-- 2.1 문자 데이터 조회
-- SQL에서 문자열이나 날짜는 반드시 단일 따옴표(‘) 안에 표시
-- 테이블 내에 저장된 데이터 값은 대소문자를 구분
SELECT empno, ename, sal FROM emp WHERE ename = '김사랑';

-- 2.2 날짜 데이터 조회
SELECT * FROM emp WHERE hiredate >= '03/09/01';

-- 3. 논리연산자
-- 3.1 AND 연산자
-- 10번 부서 소속인 사원들 중에서 직급이 사원인 사람을 검색하여 사원명, 부서번호, 직급을 출력
SELECT ename, deptno, job FROM emp WHERE deptno=10 and job='사원';

-- 3.2 OR 연산자
-- 10번 부서 소속인 사원이거나 직급이 사원인 사람을 검색하여 사원명, 부서번호, 직급을 출력
SELECT ename, deptno, job FROM emp WHERE deptno=10 or job='사원';

-- 3.3 NOT 연산자
-- 10번 부서에 소속된 사원만 제외하고 나머지 사원의 정보를 출력
SELECT * FROM emp WHERE NOT deptno = 10;
SELECT * FROM emp WHERE deptno != 10;

-- 3.4 논리 연산자의 다양한 활용
-- 급여가 300 이상 500 이하 
SELECT * FROM emp WHERE sal>=300 and sal<=500;

-- 4. BETWEEN AND 연산자
-- 월급이 200에서 300사이인 데이터 출력
SELECT * FROM emp WHERE sal>=200 and sal<=300;
SELECT * FROM emp WHERE sal BETWEEN 200 and 300;
-- 월급이 200미만이거나 300초과인 데이터 출력
SELECT * FROM emp WHERE sal<200 or sal>300;
SELECT * FROM emp WHERE sal NOT BETWEEN 200 and 300;

-- 5. IN 연산자 > 컬럼명 IN(A, B, C)
-- 비교 연산자인 OR 연산자를 사용하기 편하게 만들어 놓은 연산자
-- 급여가 300이거나 500이거나 1000인 데이터를 출력
SELECT * FROM emp WHERE sal=300 or sal=500 or sal=1000;
SELECT * FROM emp WHERE sal IN(300, 500, 1000);
-- 급여가 300, 500, 1000이 모두 아닌 데이터 출력
SELECT * FROM emp WHERE sal!=300 and sal!=500 and sal!=1000;
SELECT * FROM emp WHERE sal not in(300, 500, 1000);

-- 6. LIKE 연산자 > 컬럼명 LIKE pattern(와일드카드)
-- 7. 와일드카드 ( % / _ )
-- 검색하고자 하는 값을 정확히 알지 못하는 경우에도 검색이 가능하도록 해주는 연산자
SELECT * FROM emp WHERE ename LIKE '김%';
-- 이름 중 ‘기’을 포함하고 있는 사원 테이블의 데이터를 출력
SELECT * FROM emp WHERE ename LIKE '%기%';
-- 이름이 3글자이고 그 중 두번째 이름에 ‘동’인 사원의 정보를 출력
SELECT * FROM emp WHERE ename LIKE '_동_';

-- 8. NULL 관련 연산자
-- NULL을 가진 데이터와 비교 연산을 하게 되면 위 화면처럼 결과를 찾을수 없다. 
-- NULL은 = 연산자로 검색이 불가하다.
SELECT * FROM emp WHERE comm=NULL;
SELECT * FROM emp WHERE comm IS NULL;
SELECT * FROM emp WHERE comm IS NOT NULL;

-- 9. ORDER BY
-- 오름차순(Ascending)
-- 작은 값이 위에 출력되고 아래로 갈수록 큰 값이 출력
-- 내림차순(Descending)
-- 큰 값이 위에 출력되고 아래로 갈수록 작은 값이 출력

-- 급여를 적게 받는 사원순으로 출력한 예제이다.
SELECT * FROM emp ORDER BY sal ASC;
-- 급여를 많이 받는 사원순으로 출력한 예제이다.
SELECT * FROM emp ORDER BY sal DESC;
-- 사원의 이름을 철자 순 오름차순 정렬 한 예제.
SELECT * FROM emp ORDER BY ename ASC;
-- 최근 입사한 사람부터 출력하는 예제.
SELECT * FROM emp ORDER BY hiredate DESC;
-- 급여를 많이 받는 사람을 기준으로 정렬한 뒤 혹시 급여가 같을 경우 이름의 철자가 빠른 사람부터 출력
SELECT * FROM emp ORDER BY sal DESC, ename ASC;

-- 데이터 추출하기 문제
-- 1. 급여가 300 이하인 사원의 사원 번호, 사원명, 급여를 출력하시오.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL <=300;
-- 2. 이름이 “오지호”인 사원의 사원 번호, 사원명, 급여를 출력하시오.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE ENAME='오지호';
-- 3. 급여가 250이거나, 300이거나, 500인 사원들의 사원 번호, 사원명, 급여를 출력하시오. 
--   (비교 연산자와 or 논리 연산자를 작성해보고, in 연산자로 한 번더 작성하시오.)
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL=250 OR SAL=300 OR SAL=500;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL IN(250, 300, 500);
-- 4. 급여가 250도, 300도, 500도 아닌 사원들을 검색하시오
--   (비교 연산자와 and 논리 연산자를 사용하여 작성해보고, in 연산자로 한 번더 작성하시오.)
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL!=250 AND SAL!=300 AND SAL!=500;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL NOT IN(250, 300, 500);
-- 5. 사원들 중에서 이름이 “김＂으로 시작하는 사람과 이름 중에 “기＂를 포함하는 사원의 사원번호와 사원명을 출력
--   (LIKE 연산자와 와일드카드를 이용)
SELECT EMPNO, ENAME FROM EMP WHERE ENAME LIKE '김%' OR ENAME LIKE '%기%';
-- 6. 상급자가 없는 사원(사장)을 검색하기 위한 SQL문을 작성하시오. (NULL 이용)
SELECT * FROM EMP WHERE MGR IS NULL;
-- 7. 사원 테이블의 자료를 입사일을 기준으로 정렬하여 최근에 입사한 직원을 가장 먼저 출력
--   (사원번호, 사원명, 직급, 입사일만 출력)
SELECT EMPNO, ENAME, JOB, to_char(HIREDATE, 'YYYY/MM/DD') FROM EMP ORDER BY HIREDATE DESC;
-- 8. 부서 번호가 빠른 사원부터 출력하되, 같은 부서 내의 사원을 출력할 경우 입사한지 가장 오래된 사원부터 출력
SELECT DEPTNO, EMPNO, ENAME, JOB, to_char(HIREDATE, 'YYYY/MM/DD') FROM EMP ORDER BY DEPTNO ASC, HIREDATE ASC;
