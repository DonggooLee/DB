-- �� �ڡڡ�

-- 1. ���� ����
-- �������� ���̺��� �ٰ��� ������ ���� ���̺�
-- �����̶� �ܾ�� ���������� �����͸� �����ϰ� ���� �ʱ� ������ ���� ���̰�,
-- ���̺��̶� �ܾ�� ���������� �����͸� �����ϰ� ���� �ʴ��� ����ڴ�
-- ��ġ ���̺��� ����ϴ� �Ͱ� �����ϰ� �並 ����� �� �ֱ� ������ ���� ���̺��̶� �Ҹ���.
-- �⺻ ���̺��� �Ļ��� ��ü�μ� �⺻ ���̺� ���� �ϳ��� �������̴�.
-- ����ڿ��� �־��� �並 ���ؼ� �⺻ ���̺��� ���������� ����ϰ� �ȴ�.
-- 1.1. ���� �⺻ ���̺�
CREATE TABLE DEPT_COPY AS SELECT * FROM DEPT;
CREATE TABLE EMP_COPY AS SELECT * FROM EMP;
SELECT * FROM EMP_COPY;
SELECT * FROM DEPT_COPY;
SELECT EMPNO, ENAME, DEPTNO
FROM EMP_COPY
WHERE DEPTNO=30;
-- 1.2 �� �����ϱ�
CREATE VIEW EMP_VIEW30 
AS SELECT EMPNO, ENAME, DEPTNO
FROM EMP_COPY
WHERE DEPTNO=30;
SELECT * FROM EMP_VIEW30;


-- 2. ���� ����
-- USER_VIEWS�� ���� �信 ����� TEXT ������ �� �� �ִ�.
SELECT * FROM USER_VIEWS;
SELECT * FROM EMP_VIEW30;
-- VIEW ���̺� ������ �߰� : ����� �⺻���̺� �����Ѵ�
INSERT INTO EMP_VIEW30 VALUES (1111, 'AAAA', 30);
SELECT * FROM EMP_VIEW30;
SELECT * FROM EMP_COPY;


-- 3. �並 ����ϴ� ����


-- 4. ���� ���� : �ܼ� �� / ���� ��
-- 4.2 �ܼ� ���� �÷��� ��Ī �ο�
CREATE OR REPLACE VIEW EMP_VIEW(�����ȣ, �����, �޿�, �μ���ȣ)
AS SELECT EMPNO, ENAME, SAL, DEPTNO 
FROM EMP_COPY;
SELECT * FROM EMP_VIEW WHERE �μ���ȣ=30;
SELECT * FROM EMP_VIEW;
-- 4.6 ���� �� �����
CREATE VIEW EMP_VIEW_DEPT
AS SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, D.LOC 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO DESC;
SELECT * FROM EMP_VIEW_DEPT;
SELECT * FROM USER_VIEWS;


-- 5. �� ������ �ɼ�
-- DROP VIEW ���̸�;
-- 5.1 OR REPLACE
-- CCREATE OR REPLACE VIEW �� ����ϸ� �������� �ʴ� ���̸� ���ο� �����
-- ������ �����ϴ� ���̸� �� ������ ����
CREATE OR REPLACE VIEW EMP_VIEW30
AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO
FROM EMP_COPY
WHERE DEPTNO=30;
SELECT * FROM EMP_VIEW30;
-- 5.3  WITH CHECK OPTION / WITH READ ONLY (P35)


-- 6. �ζ��� ��
-- ROWNUM �÷��� �����Ͱ� �Էµ� ���� (���° �Էµ� ������ ����)�� �˷��ִ� '�����÷�'
SELECT ROWID, ROWNUM, EMPNO, ENAME, HIREDATE FROM EMP WHERE ROWNUM <= 5;
SELECT ROWNUM, EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE;
-- 6.1 ��� ROWNUM���� TOP-N ���ϱ�
-- ��¥�� ������ ������ ��� ���� ���� : ������ ���·� �並 ����鼭 ROWNUM �� �缳���ȴ�. �ڡڡ�
CREATE OR REPLACE VIEW VIEW_HIRE
AS SELECT EMPNO, ENAME, HIREDATE
FROM EMP ORDER BY HIREDATE;
SELECT ROWNUM, EMPNO, ENAME, HIREDATE FROM VIEW_HIRE;
SELECT ROWNUM AS "RANK", EMPNO, ENAME, HIREDATE 
FROM VIEW_HIRE 
WHERE ROWNUM <= 5;
-- �ζ��κ�� TOP-N ���ϱ� (FROM �ȿ� ���� �κ��� ���� �߿�!! �ڡ�)
SELECT ROWNUM AS "RANK", EMPNO, ENAME, HIREDATE
FROM (SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE)
WHERE ROWNUM<=5;


-- ����
-- 1�� ����
CREATE VIEW EMP_VIEW20 
AS SELECT EMPNO, ENAME, DEPTNO, MGR 
FROM EMP_COPY 
WHERE DEPTNO=20;
SELECT * FROM EMP_VIEW20;
-- 2�� ����
-- �׷��Լ� ���� ��Ī �ʼ�
CREATE VIEW SAL_VIEW
AS SELECT dname, MAX(sal) AS "MAX_SAL", MIN(sal) AS "MIN_SAL" 
FROM emp inner join dept 
On emp.deptno = dept.deptno
GROUP by dept.dname;
SELECT * FROM sal_view;
-- 3�� ����
DELETE FROM EMP_COPY WHERE ENAME='AAAA';
SELECT ROWNUM AS "RANKING", EMPNO, ENAME, SAL
FROM (SELECT EMPNO, ENAME, SAL FROM EMP_COPY ORDER BY SAL DESC)
WHERE ROWNUM<=3;
SELECT * FROM USER_VIEWS;

