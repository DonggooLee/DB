-- 시퀀스
-- 1. 시퀀스 개념
-- 시퀀스는 테이블 내의 유일한 숫자를 자동으로 생성하는 자동 번호 발생 기이므로 시퀀스를 기본 키로 사용하게 되면 사용자의 부담을 줄일 수 있다
CREATE SEQUENCE EMP_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 100000;


-- 2. 시퀀스 데이터 딕셔너리 살펴보기
-- 데이터 딕셔너리 USER_SEQUENCES로 현재 사용 중인 시퀀스 객체의 정보를 출력
SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, INCREMENT_BY, CYCLE_FLAG
FROM USER_SEQUENCES;


-- 3. CURRVAL, NEXTVAL
CREATE TABLE EMP01(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR2(10),
HIREDATE DATE
);
INSERT INTO EMP01 VALUES (EMP_SEQ.NEXTVAL,'김씨',SYSDATE);
SELECT * FROM EMP01;


-- 4. 시퀀스 제거
-- DROP SEQUENCE 시퀀스명;


-- 5. 시퀀스 수정
-- ALTER SEQUNECE 시퀀스명 START WITH를 제외한 내용 변경


-- 문제
CREATE TABLE DEPT_EXAMPLE(
DEPTNO NUMBER(4) PRIMARY KEY,
DNAME VARCHAR2(15),
LOC VARCHAR2(15)
);

CREATE SEQUENCE DEPT_EXAMPLE_SEQ
INCREMENT BY 10
START WITH 10;

INSERT INTO DEPT_EXAMPLE VALUES (DEPT_EXAMPLE_SEQ.NEXTVAL, '경리부', '서울');
INSERT INTO DEPT_EXAMPLE VALUES (DEPT_EXAMPLE_SEQ.NEXTVAL, '인사부', '인천');
INSERT INTO DEPT_EXAMPLE VALUES (DEPT_EXAMPLE_SEQ.NEXTVAL, '영업부', '용인');
INSERT INTO DEPT_EXAMPLE VALUES (DEPT_EXAMPLE_SEQ.NEXTVAL, '전산부', '수원');

SELECT * FROM DEPT_EXAMPLE;




