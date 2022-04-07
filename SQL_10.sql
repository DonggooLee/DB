-- DML (Data Manipulation Language) �ڡڡڡڡ�
-- ���̺� ������ �˻�, ����, ����, �����ϴ� �� ����Ѵ�.
-- Rollback�� �����ϴ�. �ڡڡ�

CREATE TABLE DEPT01 AS SELECT * FROM DEPT WHERE 1=0;
DESC DEPT01;
SELECT * FROM DEPT01;

-- 1. INSERT : ������ �߰�
INSERT INTO DEPT01 (DEPTNO, DNAME, LOC) VALUES (10, '������', '�λ�');
SELECT * FROM DEPT01;
-- 1.1 NULL �� ���� : �������� ���� �÷��� �ڵ����� NULL �� ����
INSERT INTO DEPT01 (DEPTNO, DNAME) VALUES (30, '������');
INSERT INTO DEPT01 (DEPTNO) VALUES (50);
SELECT * FROM DEPT01;


-- 2. ���� ������ ������ �����ϱ�
CREATE TABLE DEPT02 AS SELECT * FROM DEPT WHERE 1=0;
DESC DEPT02;
INSERT INTO DEPT02 SELECT * FROM DEPT;
SELECT * FROM DEPT02;
INSERT INTO SAM01 SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE DEPTNO=10;
SELECT * FROM SAM01;


-- 3. UPDATE : ������ ���� (����X => ��絥���Ͱ� �� ����ȴ� �ڡڡ�
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
-- 3.1 ���� �÷� �� ����
UPDATE EMP01 SET deptno=10, job='����' WHERE ename='�ѿ���';
UPDATE EMP01 SET hiredate=sysdate, sal=600, comm=200 WHERE ename='����ȣ';
-- 3.2 ���� ������ �̿��� ������ ����
-- 20�� �μ��� �������� 40�� �μ��� ���������� �����ϱ� ���ؼ� ���� �������� ����Ѵ�.�ڡڡ�
UPDATE DEPT02 
SET LOC = (SELECT LOC FROM DEPT WHERE DEPTNO=40) 
WHERE DEPTNO=20;
SELECT * FROM DEPT02;


-- 4. DELETE : ������ ������ ������ ��� ������(��)�� �����ȴ�. �ڡڡ�
-- DELETE : �����ʹ� ���������� ���̺��� �뷮�� �پ���� �ʴ´�. ���ϴ� �����͸� ���� �� �ְ� Rollback ����
-- TRUNCATE : �Ϲ� ������ �� �ε��� � ��� �����ǰ�, ���̺��� �뷮�� �پ���. ���ϴ� �����͸� �����ؼ� ���� �� ������ Rollback �Ұ���
-- DROP : ���̺� ��ü�� ����. ���� �� �ǵ��� �� ����. Rollback �Ұ���

DELETE FROM SAM01 WHERE JOB IS NULL;
SELECT * FROM SAM01;
-- 4.1 ���������� �̿��� ������ ����
DELETE FROM EMP01 WHERE deptno = (SELECT deptno FROM dept WHERE dname='������');
SELECT * FROM EMP01;


-- 5. MERGE (�պ�)


-- ���� (1~3)
CREATE TABLE SAM01 (
EMPNO     NUMBER(4),
ENAME     VARCHAR2(10),
JOB         VARCHAR2(9),
SAL         NUMBER(7,2)
);
INSERT INTO SAM01 VALUES (1000, '���', '����', 1000);
INSERT INTO SAM01 VALUES (1010, '�ٳ���', '��ȣ��', 1500);
INSERT INTO SAM01 VALUES (1020, '������', '�ǻ�', 2000);
INSERT INTO SAM01 VALUES (1030, '����', '', 2500);
INSERT INTO SAM01 VALUES (1040, '����', NULL, 25000);
DESC SAM01;
SELECT * FROM SAM01;

-- ���� (4~6)
UPDATE EMP01 SET deptno=30 WHERE deptno=10; 
SELECT * FROM EMP01;
UPDATE EMP01 SET sal=sal*1.1 WHERE sal>=400;
SELECT * FROM EMP01;
UPDATE SAM01 SET sal=sal-5000 WHERE sal>=10000;
SELECT * FROM SAM01;

-- ���� (7~8)
CREATE TABLE SAM02 AS SELECT ename, sal, hiredate, deptno FROM EMP;
UPDATE SAM02 SET sal=(sal+100) 
WHERE deptno = (SELECT deptno FROM dept WHERE LOC='��õ'); �ڡڡ�
SELECT * FROM SAM02;

COMMIT;

