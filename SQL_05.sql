-- 1.DUAL 테이블
-- DUMMY라는 단 하나의 컬럼으로 구성되어 있다. 이 컬럼의 최대 길이는 1이다
-- DUAL 테이블은 DUMMY라는 단 하나의 컬럼에 X라는 단 하나의 로우만을 저장하고 있으나 이 값은 아무런 의미가 없다.
-- 쿼리문의 수행 결과가 하나의 로우로 출력되도록 하기 위해서 단 하나의 로우를 구성하고 있을 뿐이다.
DESC DUAL;
SELECT * FROM DUAL;

-- 2. 숫자함수
-- 2.1 ABS > 절대값을 구하는 함수 / 방향은 없고 크기만 존재
SELECT -10, ABS(-10) FROM dual;
-- 2.1 FLOOR > 소수점 아래를 버리는 함수
SELECT 34.5678, FLOOR(34.5678) FROM dual;
-- 2.2 ROUND > 소수점을 반올림 하는 함수
SELECT 34.5678, ROUND(34.5678) FROM dual;
-- 특정 자릿수에서 반올림 할 수 있도록 자릿수를 지정할 수 있다
SELECT 34.5678, ROUND(34.5678, 2) FROM dual;
-- 자릿수에 음수를 지정시 소수점이 아니라 일단위, 십단위, 백단위 순으로 거슬로 올라가며 반올림
SELECT 34000.5678, ROUND(34000.5678, -4) FROM dual;
-- 2.3 TRUNC > 특정 자리수 이하를 버린 결과를 구해주는 함수
SELECT TRUNC(34.5678,2), TRUNC(34.5678, -1), TRUNC(34.5678) FROM dual;
-- 2.4 MOD > 나누기 연산을 한 뒤에 몫이 아닌 나머지를 결과로 되돌려 받는 함수
SELECT MOD(27,2), MOD(27,5), MOD(27,7) FROM dual;

-- 3. 문자함수
-- 3.1 UPPER, LOWER
SELECT 'welcome to oracle', UPPER('welcome to oracle') FROM DUAL;
SELECT 'WELCOME TO ORACLE', LOWER('WELCOME TO ORACLE') FROM DUAL;
-- 3.2 INITCAP, LENGTH
-- 입력한 문자열의 이니셜만 대문자로 변경하는 함수
SELECT 'welcome to oracle', INITCAP('welcome to oracle') FROM DUAL;
-- 데이터의 길이를 알려주는 함수
SELECT LENGTH('오라클'), LENGTH('Oracle') FROM DUAL;
-- 3.3 SUBSTR > SUBSTR(대상, 시작 위치, 추출할 개수)
-- 대상 문자열이나 컬럼의 자료에서 시작위치부터 선택 개수만큼의 문자를 추출 한다.
SELECT SUBSTR('Welcome to Oracle', 4, 3) FROM DUAL;
SELECT SUBSTR('Welcome to Oracle', -4, 3) FROM DUAL;
SELECT SUBSTR(hiredate, 1, 2) as "년도", SUBSTR(hiredate, 4, 2) as "달" FROM emp;
-- 3.4 INSTR > INSTR(대상, 찾을 글자, 시작 위치, 몇 번째 발견)
-- 대상 문자열이나 컬럼에서 특정 문자가 나타나는 위치를 알려준다.
SELECT INSTR('WELCOME TO ORACLE', 'O', 6, 2) FROM dual;
-- 시작위치, 몇번째발견 설정 하지 않으면 모두 1로 간주
SELECT INSTR('WELCOME TO ORACLE', 'O') FROM dual;
-- 3.5 LPAD, RPAD
-- LPAD(Left Padding) > 컬럼이나 대상 문자열을 명시된 자릿수에서 오른쪽에 나타내고,
-- 남은 왼쪽 자리를 특정 기호로 채웁니다
SELECT LPAD('Oracle', 20, '#') FROM dual;
-- RPAD(Right Padding) > 컬럼이나 대상 문자열을 명시된 자릿수에서 왼쪽에 나타내고, 
-- 남은 오른쪽 자리를 특정 기호로 채웁니다.
SELECT RPAD('Oracle', 20, '#') FROM dual;
-- 3.6 LTRIM, RTRIM
-- LTRIM > 문자열의 왼쪽(앞)의 공백 문자들을 삭제한다.
SELECT LTRIM(' Oracle ') FROM dual;
-- RTRIM > LTRIM의 반대로 문자열의 오른쪽(뒤)의 공백 문자들을 삭제한다.
SELECT RTRIM(' Oracle ') FROM dual;
-- 3.7 TRIM
-- 칼럼이나 대상 문자열에서 특정 문자가 첫 번째 글자이거나 마지막 글자이면
-- 잘라내고 남은 문자열만 반환합니다. (앞뒤의 'a'문자를 잘라낸다)
SELECT TRIM('a' FROM 'aaaaOracleaaaa') FROM dual;
SELECT TRIM(' Oracle ') FROM dual;

-- 4. 날짜함수
-- 4.1 SYSDATE > 시스템에 저장된 현재 날짜를 반환
SELECT SYSDATE FROM dual;
-- 날짜 연산
SELECT SYSDATE-1 as "어제", SYSDATE as "오늘", SYSDATE+1 as "내일" FROM dual;
-- 4.2 ROUND > ROUND(date, format);
-- 포멧 모델을 지정하면 숫자 이외에 날짜에 대해서도 반올림을 할 수 있다.
-- month 는 16일을 기준으로 적으면 이번달 크면 다음달 1일을 구한다!
SELECT hiredate, ROUND(hiredate, 'MONTH') FROM emp;
-- 4.3 TRUNK > TRUNC(date, format);
-- ROUND 함수와 마찬가지로 포맷 형식을 주어 다양한 기준으로 날짜를 잘라낼수 있다.
SELECT hiredate, TRUNC(hiredate, 'MONTH') FROM emp;
-- 4.4 MONTHS_BETWEEN > MONTHS_BETWEEN(date1, date2);
-- 날짜와 날짜 사이의 개월 수를 구하는 함수
SELECT ename, sysdate, hiredate, MONTHS_BETWEEN(sysdate, hiredate) FROM emp;
-- TRUNK 함수에서 자리수를 특정하지 않았기 때문에 소수점 이하는 전부 버린다
SELECT ename, sysdate, hiredate, TRUNC(MONTHS_BETWEEN(sysdate, hiredate)) FROM emp;
-- 4.5 ADD_MONTHS > ADD_MONTHS(date, number)
-- 입사 날짜에서 6개월을 추가
SELECT ename, hiredate, ADD_MONTHS(hiredate, 6) FROM emp;
-- 4.6 LAST_DAY > LAST_DAY(date)
-- 해당 날짜가 속한 달의 마지막 날짜를 반환하는 함수
SELECT hiredate, LAST_DAY(hiredate) FROM emp;

-- 5. 형 변환 함수
-- 숫자, 문자, 날짜의 데이터 형을 다른 데이터형으로 변환해야 하는 경우
-- TO_NUMBER, TO_CHAR, TO_DATE
-- 5.1 TO_CHAR (날짜->문자) > TO_CHAR(date, ‘format’)
-- DATE 형태의 데이터를 지정한 양식에 의해 VARCHAR2 형의 문자로 변환한다
SELECT sysdate, TO_CHAR(sysdate, 'YYYY-MM-DD') FROM dual;
SELECT hiredate, TO_CHAR(hiredate, 'YY/MON/DD DY') FROM emp;
SELECT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') FROM dual;
-- 5.1 TO_CHAR (숫자->문자)
SELECT TO_CHAR(1230000) FROM dual;
SELECT ename, sal, TO_CHAR(sal, 'L999,999') FROM emp;
SELECT TO_CHAR(123456, '000000000'), TO_CHAR(123456, '999,999,999') FROM dual;
-- 5.2 TO_DATE (문자->날짜) > TO_DATE(‘문자’, ‘format’)
SELECT ename, hiredate FROM emp WHERE hiredate = TO_DATE('20040108','YYYYMMDD');
SELECT TRUNC(sysdate - TO_DATE('2020/01/01', 'YYYY/MM/DD')) FROM dual;
-- 5.3 TO_NUMBER (문자->숫자)
SELECT TO_NUMBER('20,000','99,999') - TO_NUMBER('10,000','99,999') FROM DUAL;

-- 6. DECODE
-- 프로그램 언어에서 가장 많이 사용되는 switch case 문과 같은 기능을 갖는다.
-- 여러 가지 경우에 대해서 선택할 수 있다.
-- DECODE(표현식, 조건1, 결과1,
--               조건2, 결과2,
--               조건3, 결과3,
--               기본결과n
-- )
SELECT ename, deptno, DECODE(deptno, 
10, 'ACCOUNTING', 
20, 'RESEARCH',
30, 'SALES',
40, 'OPERATIONS')
as dname FROM emp;

-- 7. CASE
-- 프로그램 언어의 if else if else 와 유사한 구조를 갖는다.
-- 여러 가지 경우에 대해서 선택할 수 있다.
-- DECODE 함수와 차이점이 있다면 DECODE 함수는 조건이 일치(= 비교 연산자)
-- 하는 경우에 대해서만 적용되는 반면, CASE 함수는 다양한 비교 연산자를 
-- 이용하여 조건을 제시할 수 있으므로 범위를 지정할 수 있다.
-- CASE 표현식 WHEN 조건1 THEN 결과1
-- WHEN 조건1 THEN 결과1
-- WHEN 조건1 THEN 결과1
-- ELSE 결과n
-- END
SELECT ename, deptno, CASE
WHEN deptno=10 THEN 'ACCOUNTING'
WHEN deptno=20 THEN 'RESEARCH'
WHEN deptno=30 THEN 'SALES'
WHEN deptno=40 THEN 'OPERATIONS'
END 
as dname FROM emp;

-- 8. NVL
-- NULL을 0 또는 다른 값으로 변환하기 위해서 사용하는 함수.
SELECT ename, sal, comm, sal*12+comm, NVL(comm,0), sal*12+NVL(comm,0) FROM emp ORDER BY job;

-- SQL 주요 함수 문제
-- 1. 10월에 입사한 사원을 출력. (SUBSTR 함수 사용)
SELECT * FROM emp WHERE SUBSTR(hiredate, 4, 2)=10;
-- 2. 2003년도에 입사한 사원을 알아내기 위한 쿼리문 작성. (SUBSTR 함수 사용)
SELECT * FROM emp WHERE SUBSTR(hiredate, 1, 2)=3;
-- 3. 이름이 "기"로 끝나는 사원을 검색. (SUBSTR 함수 사용)
SELECT * FROM emp WHERE SUBSTR(ename, -1)='기';
-- 4. 직급에 따라 급여를 인상하도록 한다. 직급이 '부장'인 사원은 5%, '과장'인 사원은 10%
--    '대리'인 사원은 15%, '사원'인 사원은 20%, 이 외의 직급은 급여 그대로 출력 (DECODE 함수 사용)
SELECT empno, ename, job, sal, DECODE(job, 
'부장', sal+sal*0.05, 
'과장', sal+sal*0.1,
'대리', sal+sal*0.15,
'사원', sal+sal*0.2,
sal
)
as upsal FROM emp;
-- 5. 입사일을 연도는 4자리(YYYY), 월은 숫자(MON)로 표시
SELECT hiredate, TO_CHAR(hiredate, 'YYYY/MON/DD') as "CDATE" FROM emp;





