-- 1. 그룹함수
SELECT sum(sal) FROM emp;
-- NULL 값이 있어도 이를 제외하고 계산한다. ★★★★★
SELECT sum(comm) FROM emp;
-- 그룹함수와 단순컬럼은 같이 사용할 수 없다 ★★★★★
-- 맥스라는 함수는 결과가 1개 나와야 하지만 ename은 14개의 행이 있기 때문에 문제가 발생한다.
SELECT ename, max(sal) FROM emp;
-- comm은 NULL값을 제외한 값을 반환
SELECT count(*), count(comm) FROM emp;
-- 사원들의 직업 개수 출력
SELECT count(job) FROM emp;
-- 사원들의 직업 개수 출력 (중복제거 포함)
SELECT count(distinct job) FROM emp;
    
-- 2. GROUP BY
-- 형식 : SELECT 컬럼명, 그룹 함수 FROM 테이블명 WHERE 조건(연산자) GROUP BY 컬럼명;
SELECT deptno FROM emp GROUP BY deptno;
-- 행의 개수가 다르기 때문에 문제가 발생
SELECT deptno, AVG(sal) FROM emp;
-- deptno로 그룹을 짓고 그 그룹의 평균을 구할때
SELECT deptno, AVG(sal) FROM emp GROUP BY deptno;
-- 소속 부서별 최대 와 최소 급여를 받는 예제
SELECT deptno, MAX(sal), MIN(sal) FROM emp GROUP BY deptno;
-- 부서별로 사원수와 커미션을 받는 사원들의 수를 계산하는 예제
SELECT deptno, COUNT(*), COUNT(comm) FROM emp GROUP BY deptno;

-- 3. HAVING
-- 부서별로 그룹(GROUP BY)지은 후, 그룹지어진 부서별 평균 급여가 500이상인(HAVING) 부서번호와 평균급여를 출력하는 문제
SELECT deptno, AVG(sal) FROM emp GROUP BY deptno HAVING AVG(sal)>=500;
-- 부서별 급여의 최대값과 최소값을 구하되 평균급여가 500이하인 부서만 출력
SELECT deptno, MAX(sal), MIN(sal) FROM emp GROUP BY deptno HAVING AVG(sal)<=500;


-- 문제
-- 1. 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력 (평균에 대해서는 정수로 반올림)
SELECT MAX(sal) as "Maximum", MIN(sal) as "Minimum", SUM(sal) as "Sum", ROUND(AVG(sal)) as "Average" FROM emp;
-- 2. 각 직급별로 급여 최고액, 최저액, 총액 및 평균 급여를 출력
SELECT job, MAX(sal) as "Maximum", MIN(sal) as "Minimum", SUM(sal) as "Sum", ROUND(AVG(sal)) as "Average" FROM emp GROUP BY job;
-- 3. 그룹함수를 이용하여 직급별 사원수를 출력
SELECT job, COUNT(job) as "직원수" FROM emp GROUP BY job;
-- 4. 그룹함수를 이용하여 상급자를 가지고 있는 직원의 수를 출력하시오
-- mgr을 카운트 하면 NULL 값은 제외하고 계산을 하기 때문에 따른 조건이 필요없다
SELECT COUNT(mgr) FROM emp;
SELECT COUNT(mgr) FROM emp WHERE mgr IS NOT NULL;
-- 5. 급여 최고액, 급여 최저액의 차액을 출력
SELECT MAX(sal) - MIN(sal) as "차액" FROM emp;
-- 6. 직급별 사원의 최저급여를 출력하시오. 최저급여가 500미만인 그룹은 제외시키고,
-- 결과를 급여에 대한 내림차순으로 정렬하여 출력
SELECT job, MIN(sal) as "최저급여" FROM emp GROUP BY job HAVING MIN(sal)>=500;
-- 7. 각 부서에 대해 부서번호, 사원수, 부서내의 모든 사원의 평균급여를 출력
-- (평균급여는 소수점 둘째 자리로 반올림, 부서번호별 오름차순으로 정렬)
SELECT deptno, COUNT(deptno) as "Number Of People", ROUND(AVG(sal),2) as "Sal" FROM emp GROUP BY deptno ORDER BY deptno ASC;
-- 8. 각 부서에 대해 부서이름, 지역명, 사원수, 부서 내의 모든 사원의 평균급여를 출력
-- (DEPT 테이블을 참고하여 부서이름, 지역명을 DECODE 함수를 통해 출력.)
-- (평균급여는 정수로 소수점 둘째자리로 반올림하시오)
SELECT DECODE(deptno, 
10, '경리부', 
20, '인사부',
30, '영업부') as "Dname",
DECODE(deptno, 
10, '서울', 
20, '인천',
30, '용인') as "Location",
COUNT(deptno) as "Number Of People", ROUND(AVG(sal),2) as "Sal" FROM emp GROUP BY deptno;
