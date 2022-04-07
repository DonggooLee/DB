-- 1. 단일행 서브쿼리
-- 하나의 SELECT 문장의 절 안에 포함된 또 하나의 SELECT 문장
-- 비교 연산자의 오른쪽에 기술해야 하고 반드시 괄호로 감싸야 한다.
-- 메인 쿼리가 실행되기 전에 한번만 실행된다.

-- 2. 서브쿼리에서 그룹 함수의 사용
-- 평균 급여를 구하는 쿼리문을 서브 쿼리로 사용하여 평균 급여보다 더 많은 급여를 받는 사원
SELECT ename, sal FROM emp WHERE sal > (SELECT AVG(sal) FROM emp);

-- 3. 다중 행 서브 쿼리
-- 서브 쿼리에서 반환되는 결과가 하나 이상의 행일 때 사용 반드시 다중 행 연산자(Multiple Row Operator)와 함께 사용

-- IN 연산자 : 메인 쿼리의 비교 조건(‘=’ 연산자로 비교할 경우)이 서브 쿼리의 결과 중에서 하나라도 일치하면 참
-- ex)급여를 400이상 받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원들의 정보를 출력하는 예제.
SELECT ename, sal , deptno FROM emp WHERE deptno IN (SELECT DISTINCT deptno FROM emp WHERE sal>=400);

-- ALL 연산자 : 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 모든 값이 일치하면 참.
-- ex)30번 소속 사원들 중에서 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사람의 정보를 출력하는 예제.
-- 찾아진 값에 대해 AND연산을 해서 모두 참이면 참이 되는 셈이 되기 때문에 ALL은 ‘모든 비교값 보다 크냐’고 묻는 것이 되므로 ★최대값보다 크면 참.★
SELECT ename, sal FROM emp WHERE sal > ALL (SELECT sal  FROM emp WHERE deptno=30);

-- ANY 연산자 : ANY 조건은 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 하나 이상만 일치하면 참.
-- ex)30번 소속 사원들 중에서 급여를 가장 적게 받는 사원보다 더 많은 급여를 받는 사람의 정보를 출력하는 예제.
-- 찾아진 값에 대해서 하나라도 크면 참이 된다. 그러므로 찾아진 값 중에서 가장 작은 값 즉, ★최소값 보다 크면 참.★
SELECT ename, sal FROM emp WHERE sal > ANY (SELECT sal  FROM emp WHERE deptno=30);

-- 문제
-- ‘김사랑’과 같은 부서에서 근무하는 사원의 이름과 부서 번호를 출력하는 예제
SELECT ename, deptno FROM emp where deptno = (SELECT deptno FROM emp where ename='김사랑');
-- 1. ‘김사랑’과 동일한 직급을 가진 사원을 출력하시오.
SELECT  *  FROM emp where job = (SELECT job FROM emp where ename='김사랑');
-- 2. ‘김사랑’의 급여와 동일하거나 더 많이 받는 사원명과 급여를 출력하시오.
SELECT ename, sal FROM emp where sal >= (SELECT sal FROM emp where ename='김사랑');
-- 3. ‘용인’에서 근무하는 사원의 이름, 급여를 출력하시오.
SELECT ename, sal FROM emp where deptno = (SELECT deptno FROM dept where deptno=30);
SELECT ename, sal FROM emp where deptno = (SELECT deptno FROM dept where loc='용인');
-- 4. 직속 상관이 ‘장동건’인 직원의 이름과 급여를 출력하시오.
SELECT ename, sal FROM emp where mgr  = (SELECT empno FROM emp WHERE ename='장동건');
-- 5. 부서별로 가장 급여를 많이 받는 사원의 정보를 출력하시오. (IN 연산자 사용)
SELECT * FROM EMP WHERE SAL IN ( SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);
-- 6. 직급이 ‘과장’인 사람이 속한 부서의 부서 번호와 부서명, 지역을 출력하시오. (IN 연산자 사용)
SELECT * FROM dept WHERE deptno IN (SELECT deptno FROM emp WHERE job='과장');
-- 7. 가장 많은 급여를 받는 ‘과장’ 보다 더 많은 급여를 받는 직원들의 이름, 급여, 직급을 출력하시오. (ALL 연산자 사용)
SELECT ename, sal, job FROM emp WHERE sal > ALL (SELECT sal FROM emp WHERE job='과장');
SELECT ename, sal, job FROM emp WHERE sal > ( SELECT MAX(sal) FROM emp WHERE job='과장'); -- 단일행 서브쿼리
-- 8. 가장 적은 급여를 받는 ‘과장’ 보다 더 많은 급여를 받는 직원들의 이름, 급여, 직급을 출력하시오. (ANY 연산자 사용)
SELECT ename, sal, job FROM emp WHERE sal > ANY (SELECT sal FROM emp WHERE job='과장');
SELECT ename, sal, job FROM emp WHERE sal > ( SELECT MIN(sal) FROM emp WHERE job='과장'); -- 단일행 서브쿼리
