-- 제약조건
-- 1. 무결성 제약 조건 : NOT NULL / UNIQUE / PK(식별자) / FK / CHECK
-- 테이블에 부적절한 자료가 입력되는 것을 방지하기 위해서 테이블을 생성할 때 각 컬럼에 대해서 정의하는 여러가지 규칙
SELECT * FROM DEPT;

-- 2. 제약 조건 확인
-- DESC : NOT NULL 제약조건만 확인할 수 있고 DEPTNO 컬럼에 기본 키 제약조건이 지정된 것은 알 수 없음
DESC DEPT; 
-- USER_CONSTRAINTS : DD View 로 제약조건에 관한 정보 출력
DESC USER_CONSTRAINTS;
-- CONSTRAINT_NAME : 제약 조건명
-- CONSTRAINT_TYPE : P(기본키), R(외래키), U(유니크), C(체크,낫널) // R : Reference
-- < 제약조건 확인 2가지 > ★★★
-- 2.1 어떤 테이블에 어떤 제약 조건이 설정되어 있는지 종류와 제약 조건 이름을 알 수 있다. ★
-- BUT 어떤 컬럼에 제약조건이 정의되었는지 컬럼 명이 보이지 X 
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE FROM  USER_CONSTRAINTS;
-- 2.2 제약조건이 지정된 컬럼명도 알려줌 ★★
SELECT * FROM USER_CONS_COLUMNS;


-- 3. NOT NULL
DROP TABLE EMP03;
CREATE TABLE EMP03 AS SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE 1=0;
SELECT * FROM EMP03;
INSERT INTO EMP03 VALUES(NULL, NULL, '영업부', 30);
-- NULL 값이 저장되는 이유는 테이블 생성시 아무런 제약 조건도 주지 않았기 때문
DESC EMP03;

CREATE TABLE EMP04(
	EMPNO   NUMBER(4) NOT NULL,
	ENAME   VARCHAR2(10) NOT NULL,
	JOB     VARCHAR2(9),
	DEPTNO NUMBER(2)
);
INSERT INTO EMP04 VALUES(NULL, NULL, '영업부', 30);
-- 제약 조건을 주었기 때문에 저장이 되지 X
DESC EMP04;


-- 4. UNIQUE : 특정 컬럼에 대해 자료가 중복되지 않게 하는 제약 조건
CREATE TABLE EMP05(
	EMPNO   NUMBER(4) UNIQUE,
	ENAME   VARCHAR2(10) NOT NULL,
	JOB     VARCHAR2(9),
	DEPTNO NUMBER(2)
);
DESC EMP05;
SELECT * FROM EMP05;
INSERT INTO EMP05 VALUES(7499, '김씨', '영업부', 30);
INSERT INTO EMP05 VALUES(7499, '박씨', '인사부', 40);


-- 5. PRIMARY KEY :  UNIQUE + NOT NULL 조건을 모두 갖고 있는 제약조건
-- DB INDEX : 컬럼에다가 인덱스를 걸어줄 수 있다. 빠른검색. 인덱스 생성.

CREATE TABLE EMP06(
	EMPNO   NUMBER(4) PRIMARY KEY,
	ENAME   VARCHAR2(10) NOT NULL,
	JOB     VARCHAR2(9),
	DEPTNO NUMBER(2)
);
INSERT INTO EMP06 VALUES(7499, '김씨', '영업부', 30);
INSERT INTO EMP06 VALUES(7499, '박씨', '인사부', 40);    -- UNIQUE 에러
INSERT INTO EMP06 VALUES(NULL, '이씨', '영업부', 20);    -- NOT NULL 에러
DESC EMP06;
SELECT * FROM EMP06;


-- 6. FOREIGN KEY : 자식테이블로 하여금 외래키를 이용하여 부모테이블을 참조 할 수 있게한다.
SELECT * FROM DEPT;
-- deptno 값이 부모키에 설정되어 있지 않은 값이기 때문에 추가되지 않는다.
INSERT INTO EMP (empno, ename, deptno) VALUES (8000,'김씨',50);
-- 테이블 이름이 DEPT, EMP이 가지고 있는 제약조건 검색
-- R_CONSTRAINT_NAME : FK인 경우 어떤 PK를 참조했는지에 대한 정보 출력 ★★★
SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE, R_CONSTRAINT_NAME FROM  USER_CONSTRAINTS WHERE TABLE_NAME IN('DEPT','EMP');
CREATE TABLE EMP07(
	EMPNO   NUMBER(4) PRIMARY KEY,
	ENAME   VARCHAR2(10) NOT NULL,
	JOB     VARCHAR2(9),
	DEPTNO NUMBER(2) REFERENCES DEPT(DEPTNO)
);
SELECT * FROM EMP07;
-- 부모 테이블(DEPT)에 존재하지 않는 DEPTNO를 갖는 사원은 추가가 불가능하다
INSERT INTO EMP07 VALUES(1200, '김씨', '사원', 50);


-- 7.CHECK (P34)
--  CHECK 제약 조건은 입력되는 값을 체크하여 설정된 값 이외의 값이 들어오면 오류 메시지와 함께 명령이 수행되지 못하게 하는 것이다.


-- 8. DEFAULT (P36)
-- 디폴트는 아무런 값을 입력하지 않았을 때 디폴트 제약의 값이 입력된다.


-- 9. 제약조건지정
-- ■ 컬럼 레벨 제약 조건
-- CREATE TABLE로 테이블을 생성하면서 컬럼을 정의하게 되는데 하나의 컬럼
-- 정의가 다 마무리되기 전에 컬럼 명 다음에 타입을 지정하고 그 뒤에 연이어서
-- 제약 조건을 지정하는 방식이다.

-- ■ 테이블 레벨 제약 조건 (P36)
-- 컬럼을 모두 정의하고 나서 테이블 정의를 마무리 짓기 전에 따로 생성된 컬럼
-- 들에 대한 제약 조건을 한꺼번에 지정하는 것입니다

-- 9.1 ALTER 로 제약 조건 추가하기
CREATE TABLE EMP13( 
EMPNO NUMBER(4), 
ENAME VARCHAR2(10), 
JOB VARCHAR2(9),
DEPTNO NUMBER(4)
);
ALTER TABLE EMP13
ADD CONSTRAINT EMP13_EMPNO_PK PRIMARY KEY(EMPNO);
ALTER TABLE EMP13
ADD CONSTRAINT EMP13_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO);
-- 9.2 MODIDY 로 제약 조건 추가하기 (NOT NULL 만!!!)
-- NULL 을 허용하는 상태 -> NULL을 허용하지 않는 상태로 이해하기
ALTER TABLE EMP10
MODIFY ENAME CONSTRAINT EMP01_ENAME_NN NOT NULL;


-- 10. 제약조건 제거하기
ALTER TABLE EMP12
DROP CONSTRAINT EMP12_EMPNO_PK;

-- 11. 제약조건 비활성화
CREATE TABLE DEPT01 (
DEPTNO NUMBER(2) CONSTRAINT DEPT01_DEPTNO_PK PRIMARY KEY,
DNAME VARCHAR2(14),
LOC VARCHAR2(13)
);
INSERT INTO DEPT01 (DEPTNO, DNAME, LOC) SELECT  DEPTNO, DNAME, LOC FROM DEPT;
SELECT * FROM DEPT01;
CREATE TABLE EMP01 (
EMPNO NUMBER(4) CONSTRAINT EMP01_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR(10) CONSTRAINT EMP01_ENAME_NN NOT NULL,
JOB VARCHAR(9),
DEPTNO NUMBER(4) CONSTRAINT EMP01_DEPTNO_FK REFERENCES DEPT01(DEPTNO)
);
INSERT INTO EMP01 VALUES (7499,'김씨','영업부',10);
INSERT INTO EMP01 VALUES (7369,'박씨','인사부',20);
SELECT * FROM EMP01;

-- 자식테이블에서 부모테이블 DEPTNO 를 참조하기 때문에
DELETE FROM DEPT01 WHERE DEPTNO=10;
-- EMP01 테이블에 외래키를 비활성화
ALTER TABLE EMP01 DISABLE CONSTRAINT EMP01_DEPTNO_FK;
-- 제약조건 확인
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, table_name, r_constraint_name, status
FROM  USER_CONSTRAINTS
WHERE table_name in ('dept01','emp01');
-- 자식테이블 비활성화 했기 때문에 삭제 가능
DELETE FROM DEPT01 WHERE DEPTNO=10;
-- 자식이 가지고 있는 외래키값이 부모테이블에 없기 때문에 오류
ALTER TABLE EMP01 ENABLE CONSTRAINT EMP01_DEPTNO_FK;
-- 다시 넣어주고 활성화 해야 한다!
INSERT INTO DEPT01 VALUES (10,'경리부','서울');
ALTER TABLE EMP01 ENABLE CONSTRAINT EMP01_DEPTNO_FK;
SELECT * FROM EMP01;
SELECT * FROM DEPT01;


-- 12. CASCADE ★★★★★
-- CASCADE 옵션은 부모 테이블과 자식 테이블 간의 참조 설정이 되어 있을
-- 때 부모 테이블의 제약 조건을 비활성화하면 이를 참조하고 있는 자식 테이블의 제약 조건까지 같이 비활성화시켜 주는 옵션
-- 로 부모 테이블의 제약 조건을 삭제하면 이를 참조하고 있는 자식 테이블의 제약 조건도 같이 삭제된다
-- 외래키 > 기본키 순서대로 해제 // 기본키 먼저 해제시에는 외래키때문에 문제 이를 보완하기 위한 함수
