-- 1. �׷��Լ�
SELECT sum(sal) FROM emp;
-- NULL ���� �־ �̸� �����ϰ� ����Ѵ�. �ڡڡڡڡ�
SELECT sum(comm) FROM emp;
-- �׷��Լ��� �ܼ��÷��� ���� ����� �� ���� �ڡڡڡڡ�
-- �ƽ���� �Լ��� ����� 1�� ���;� ������ ename�� 14���� ���� �ֱ� ������ ������ �߻��Ѵ�.
SELECT ename, max(sal) FROM emp;
-- comm�� NULL���� ������ ���� ��ȯ
SELECT count(*), count(comm) FROM emp;
-- ������� ���� ���� ���
SELECT count(job) FROM emp;
-- ������� ���� ���� ��� (�ߺ����� ����)
SELECT count(distinct job) FROM emp;
    
-- 2. GROUP BY
-- ���� : SELECT �÷���, �׷� �Լ� FROM ���̺�� WHERE ����(������) GROUP BY �÷���;
SELECT deptno FROM emp GROUP BY deptno;
-- ���� ������ �ٸ��� ������ ������ �߻�
SELECT deptno, AVG(sal) FROM emp;
-- deptno�� �׷��� ���� �� �׷��� ����� ���Ҷ�
SELECT deptno, AVG(sal) FROM emp GROUP BY deptno;
-- �Ҽ� �μ��� �ִ� �� �ּ� �޿��� �޴� ����
SELECT deptno, MAX(sal), MIN(sal) FROM emp GROUP BY deptno;
-- �μ����� ������� Ŀ�̼��� �޴� ������� ���� ����ϴ� ����
SELECT deptno, COUNT(*), COUNT(comm) FROM emp GROUP BY deptno;

-- 3. HAVING
-- �μ����� �׷�(GROUP BY)���� ��, �׷������� �μ��� ��� �޿��� 500�̻���(HAVING) �μ���ȣ�� ��ձ޿��� ����ϴ� ����
SELECT deptno, AVG(sal) FROM emp GROUP BY deptno HAVING AVG(sal)>=500;
-- �μ��� �޿��� �ִ밪�� �ּҰ��� ���ϵ� ��ձ޿��� 500������ �μ��� ���
SELECT deptno, MAX(sal), MIN(sal) FROM emp GROUP BY deptno HAVING AVG(sal)<=500;


-- ����
-- 1. ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��� �޿��� ��� (��տ� ���ؼ��� ������ �ݿø�)
SELECT MAX(sal) as "Maximum", MIN(sal) as "Minimum", SUM(sal) as "Sum", ROUND(AVG(sal)) as "Average" FROM emp;
-- 2. �� ���޺��� �޿� �ְ��, ������, �Ѿ� �� ��� �޿��� ���
SELECT job, MAX(sal) as "Maximum", MIN(sal) as "Minimum", SUM(sal) as "Sum", ROUND(AVG(sal)) as "Average" FROM emp GROUP BY job;
-- 3. �׷��Լ��� �̿��Ͽ� ���޺� ������� ���
SELECT job, COUNT(job) as "������" FROM emp GROUP BY job;
-- 4. �׷��Լ��� �̿��Ͽ� ����ڸ� ������ �ִ� ������ ���� ����Ͻÿ�
-- mgr�� ī��Ʈ �ϸ� NULL ���� �����ϰ� ����� �ϱ� ������ ���� ������ �ʿ����
SELECT COUNT(mgr) FROM emp;
SELECT COUNT(mgr) FROM emp WHERE mgr IS NOT NULL;
-- 5. �޿� �ְ��, �޿� �������� ������ ���
SELECT MAX(sal) - MIN(sal) as "����" FROM emp;
-- 6. ���޺� ����� �����޿��� ����Ͻÿ�. �����޿��� 500�̸��� �׷��� ���ܽ�Ű��,
-- ����� �޿��� ���� ������������ �����Ͽ� ���
SELECT job, MIN(sal) as "�����޿�" FROM emp GROUP BY job HAVING MIN(sal)>=500;
-- 7. �� �μ��� ���� �μ���ȣ, �����, �μ����� ��� ����� ��ձ޿��� ���
-- (��ձ޿��� �Ҽ��� ��° �ڸ��� �ݿø�, �μ���ȣ�� ������������ ����)
SELECT deptno, COUNT(deptno) as "Number Of People", ROUND(AVG(sal),2) as "Sal" FROM emp GROUP BY deptno ORDER BY deptno ASC;
-- 8. �� �μ��� ���� �μ��̸�, ������, �����, �μ� ���� ��� ����� ��ձ޿��� ���
-- (DEPT ���̺��� �����Ͽ� �μ��̸�, �������� DECODE �Լ��� ���� ���.)
-- (��ձ޿��� ������ �Ҽ��� ��°�ڸ��� �ݿø��Ͻÿ�)
SELECT DECODE(deptno, 
10, '�渮��', 
20, '�λ��',
30, '������') as "Dname",
DECODE(deptno, 
10, '����', 
20, '��õ',
30, '����') as "Location",
COUNT(deptno) as "Number Of People", ROUND(AVG(sal),2) as "Sal" FROM emp GROUP BY deptno;
