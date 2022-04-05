-- DESC : ���̺��� ������ Ȯ���ϱ� ���� ��ɾ�
-- �÷��̸�, ������ ��, ���̿� NULL ��� ����
DESC emp;

-- emp �� �����ϰ� �ִ� ���̺� ��ü(*)�� ���� / TAB�� TABLE�� ����
SELECT * FROM emp;

-- emp �� �����ϰ� �ִ� �����ȣ, ����̸��� ���
SELECT empno, ename FROM emp;

-- �޿��� ���� ���� ���
SELECT ename, sal, sal*12 FROM emp;

-- Ŀ�̼� ���� NULL�� ����ְ� �̸� �����ϰ� �Ǹ� ������� NULL ���� ����
SELECT ename, sal, job, comm, sal*12, sal*12+comm FROM emp;

-- NULL�� 0�Ǵ� �ٸ� ������ ��ȯ�ϱ� ���� nvl�Լ��� �����Ѵ�.
SELECT ename, sal, job, nvl(comm,0), sal*12, sal*12+nvl(comm,0) FROM emp;

-- ���� �÷��� ����� �ٷ� �ڿ� AS(alias) ��� Ű���带 �� �� ��Ī�� ����Ͽ� ���ϴ� �÷������� ���
SELECT ename as "�̸�", sal as "����" FROM emp;

-- ���� ���� �÷��� ������ �� ����ϴ� Concatenation �����ڷ� || �����ٸ� ���
SELECT ename || ' is a ' || job FROM emp;

-- DISTINCT �� ���� �ߺ��� ���� ����1
SELECT deptno FROM emp;
SELECT DISTINCT deptno FROM emp;

-- SQL �⺻ ����
-- 1. ����� �̸�, �޿�, �Ի����ڸ��� ����Ͻÿ�.
SELECT ENAME, SAL, HIREDATE FROM EMP;
-- 2. �Ʒ� �׸��� ���� �÷� �̸��� ��µǵ��� �ϱ� ���� ��Ī�� �����Ͻÿ�.
SELECT DEPTNO AS "�μ���ȣ", DNAME AS "�μ���" FROM DEPT;
-- 3. �Ʒ� �׸��� ���� ������ �ߺ����� �ʰ� �� ���� �����ǵ��� �Ͻÿ�.
SELECT DISTINCT JOB FROM EMP;