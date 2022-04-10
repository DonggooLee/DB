-- ��������
-- 1. ���Ἲ ���� ���� : NOT NULL / UNIQUE / PK(�ĺ���) / FK / CHECK
-- ���̺� �������� �ڷᰡ �ԷµǴ� ���� �����ϱ� ���ؼ� ���̺��� ������ �� �� �÷��� ���ؼ� �����ϴ� �������� ��Ģ
SELECT * FROM DEPT;

-- 2. ���� ���� Ȯ��
-- DESC : NOT NULL �������Ǹ� Ȯ���� �� �ְ� DEPTNO �÷��� �⺻ Ű ���������� ������ ���� �� �� ����
DESC DEPT; 
-- USER_CONSTRAINTS : DD View �� �������ǿ� ���� ���� ���
DESC USER_CONSTRAINTS;
-- CONSTRAINT_NAME : ���� ���Ǹ�
-- CONSTRAINT_TYPE : P(�⺻Ű), R(�ܷ�Ű), U(����ũ), C(üũ,����) // R : Reference
-- < �������� Ȯ�� 2���� > �ڡڡ�
-- 2.1 � ���̺� � ���� ������ �����Ǿ� �ִ��� ������ ���� ���� �̸��� �� �� �ִ�. ��
-- BUT � �÷��� ���������� ���ǵǾ����� �÷� ���� ������ X 
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE FROM  USER_CONSTRAINTS;
-- 2.2 ���������� ������ �÷��� �˷��� �ڡ�
SELECT * FROM USER_CONS_COLUMNS;


-- 3. NOT NULL
DROP TABLE EMP03;
CREATE TABLE EMP03 AS SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE 1=0;
SELECT * FROM EMP03;
INSERT INTO EMP03 VALUES(NULL, NULL, '������', 30);
-- NULL ���� ����Ǵ� ������ ���̺� ������ �ƹ��� ���� ���ǵ� ���� �ʾұ� ����
DESC EMP03;

CREATE TABLE EMP04(
	EMPNO   NUMBER(4) NOT NULL,
	ENAME   VARCHAR2(10) NOT NULL,
	JOB     VARCHAR2(9),
	DEPTNO NUMBER(2)
);
INSERT INTO EMP04 VALUES(NULL, NULL, '������', 30);
-- ���� ������ �־��� ������ ������ ���� X
DESC EMP04;


-- 4. UNIQUE : Ư�� �÷��� ���� �ڷᰡ �ߺ����� �ʰ� �ϴ� ���� ����
CREATE TABLE EMP05(
	EMPNO   NUMBER(4) UNIQUE,
	ENAME   VARCHAR2(10) NOT NULL,
	JOB     VARCHAR2(9),
	DEPTNO NUMBER(2)
);
DESC EMP05;
SELECT * FROM EMP05;
INSERT INTO EMP05 VALUES(7499, '�达', '������', 30);
INSERT INTO EMP05 VALUES(7499, '�ھ�', '�λ��', 40);


-- 5. PRIMARY KEY :  UNIQUE + NOT NULL ������ ��� ���� �ִ� ��������
-- DB INDEX : �÷����ٰ� �ε����� �ɾ��� �� �ִ�. �����˻�. �ε��� ����.

CREATE TABLE EMP06(
	EMPNO   NUMBER(4) PRIMARY KEY,
	ENAME   VARCHAR2(10) NOT NULL,
	JOB     VARCHAR2(9),
	DEPTNO NUMBER(2)
);
INSERT INTO EMP06 VALUES(7499, '�达', '������', 30);
INSERT INTO EMP06 VALUES(7499, '�ھ�', '�λ��', 40);    -- UNIQUE ����
INSERT INTO EMP06 VALUES(NULL, '�̾�', '������', 20);    -- NOT NULL ����
DESC EMP06;
SELECT * FROM EMP06;


-- 6. FOREIGN KEY : �ڽ����̺�� �Ͽ��� �ܷ�Ű�� �̿��Ͽ� �θ����̺��� ���� �� �� �ְ��Ѵ�.
SELECT * FROM DEPT;
-- deptno ���� �θ�Ű�� �����Ǿ� ���� ���� ���̱� ������ �߰����� �ʴ´�.
INSERT INTO EMP (empno, ename, deptno) VALUES (8000,'�达',50);
-- ���̺� �̸��� DEPT, EMP�� ������ �ִ� �������� �˻�
-- R_CONSTRAINT_NAME : FK�� ��� � PK�� �����ߴ����� ���� ���� ��� �ڡڡ�
SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE, R_CONSTRAINT_NAME FROM  USER_CONSTRAINTS WHERE TABLE_NAME IN('DEPT','EMP');
CREATE TABLE EMP07(
	EMPNO   NUMBER(4) PRIMARY KEY,
	ENAME   VARCHAR2(10) NOT NULL,
	JOB     VARCHAR2(9),
	DEPTNO NUMBER(2) REFERENCES DEPT(DEPTNO)
);
SELECT * FROM EMP07;
-- �θ� ���̺�(DEPT)�� �������� �ʴ� DEPTNO�� ���� ����� �߰��� �Ұ����ϴ�
INSERT INTO EMP07 VALUES(1200, '�达', '���', 50);


-- 7.CHECK (P34)
--  CHECK ���� ������ �ԷµǴ� ���� üũ�Ͽ� ������ �� �̿��� ���� ������ ���� �޽����� �Բ� ����� ������� ���ϰ� �ϴ� ���̴�.


-- 8. DEFAULT (P36)
-- ����Ʈ�� �ƹ��� ���� �Է����� �ʾ��� �� ����Ʈ ������ ���� �Էµȴ�.


-- 9. ������������
-- �� �÷� ���� ���� ����
-- CREATE TABLE�� ���̺��� �����ϸ鼭 �÷��� �����ϰ� �Ǵµ� �ϳ��� �÷�
-- ���ǰ� �� �������Ǳ� ���� �÷� �� ������ Ÿ���� �����ϰ� �� �ڿ� ���̾
-- ���� ������ �����ϴ� ����̴�.

-- �� ���̺� ���� ���� ���� (P36)
-- �÷��� ��� �����ϰ� ���� ���̺� ���Ǹ� ������ ���� ���� ���� ������ �÷�
-- �鿡 ���� ���� ������ �Ѳ����� �����ϴ� ���Դϴ�

-- 9.1 ALTER �� ���� ���� �߰��ϱ�
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
-- 9.2 MODIDY �� ���� ���� �߰��ϱ� (NOT NULL ��!!!)
-- NULL �� ����ϴ� ���� -> NULL�� ������� �ʴ� ���·� �����ϱ�
ALTER TABLE EMP10
MODIFY ENAME CONSTRAINT EMP01_ENAME_NN NOT NULL;


-- 10. �������� �����ϱ�
ALTER TABLE EMP12
DROP CONSTRAINT EMP12_EMPNO_PK;

-- 11. �������� ��Ȱ��ȭ
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
INSERT INTO EMP01 VALUES (7499,'�达','������',10);
INSERT INTO EMP01 VALUES (7369,'�ھ�','�λ��',20);
SELECT * FROM EMP01;

-- �ڽ����̺��� �θ����̺� DEPTNO �� �����ϱ� ������
DELETE FROM DEPT01 WHERE DEPTNO=10;
-- EMP01 ���̺� �ܷ�Ű�� ��Ȱ��ȭ
ALTER TABLE EMP01 DISABLE CONSTRAINT EMP01_DEPTNO_FK;
-- �������� Ȯ��
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, table_name, r_constraint_name, status
FROM  USER_CONSTRAINTS
WHERE table_name in ('dept01','emp01');
-- �ڽ����̺� ��Ȱ��ȭ �߱� ������ ���� ����
DELETE FROM DEPT01 WHERE DEPTNO=10;
-- �ڽ��� ������ �ִ� �ܷ�Ű���� �θ����̺� ���� ������ ����
ALTER TABLE EMP01 ENABLE CONSTRAINT EMP01_DEPTNO_FK;
-- �ٽ� �־��ְ� Ȱ��ȭ �ؾ� �Ѵ�!
INSERT INTO DEPT01 VALUES (10,'�渮��','����');
ALTER TABLE EMP01 ENABLE CONSTRAINT EMP01_DEPTNO_FK;
SELECT * FROM EMP01;
SELECT * FROM DEPT01;


-- 12. CASCADE �ڡڡڡڡ�
-- CASCADE �ɼ��� �θ� ���̺�� �ڽ� ���̺� ���� ���� ������ �Ǿ� ����
-- �� �θ� ���̺��� ���� ������ ��Ȱ��ȭ�ϸ� �̸� �����ϰ� �ִ� �ڽ� ���̺��� ���� ���Ǳ��� ���� ��Ȱ��ȭ���� �ִ� �ɼ�
-- �� �θ� ���̺��� ���� ������ �����ϸ� �̸� �����ϰ� �ִ� �ڽ� ���̺��� ���� ���ǵ� ���� �����ȴ�
-- �ܷ�Ű > �⺻Ű ������� ���� // �⺻Ű ���� �����ÿ��� �ܷ�Ű������ ���� �̸� �����ϱ� ���� �Լ�
