-- 1. WHERE
-- �޿��� 300 ������ ����� �����ȣ, ��� �̸�, �޿��� ����ϴ� SQL���� �ۼ�.
SELECT empno, ename, sal FROM emp WHERE sal<=300;

-- 2. �񱳿�����
-- 2.1 ���� ������ ��ȸ
-- SQL���� ���ڿ��̳� ��¥�� �ݵ�� ���� ����ǥ(��) �ȿ� ǥ��
-- ���̺� ���� ����� ������ ���� ��ҹ��ڸ� ����
SELECT empno, ename, sal FROM emp WHERE ename = '����';

-- 2.2 ��¥ ������ ��ȸ
SELECT * FROM emp WHERE hiredate >= '03/09/01';

-- 3. ��������
-- 3.1 AND ������
-- 10�� �μ� �Ҽ��� ����� �߿��� ������ ����� ����� �˻��Ͽ� �����, �μ���ȣ, ������ ���
SELECT ename, deptno, job FROM emp WHERE deptno=10 and job='���';

-- 3.2 OR ������
-- 10�� �μ� �Ҽ��� ����̰ų� ������ ����� ����� �˻��Ͽ� �����, �μ���ȣ, ������ ���
SELECT ename, deptno, job FROM emp WHERE deptno=10 or job='���';

-- 3.3 NOT ������
-- 10�� �μ��� �Ҽӵ� ����� �����ϰ� ������ ����� ������ ���
SELECT * FROM emp WHERE NOT deptno = 10;
SELECT * FROM emp WHERE deptno != 10;

-- 3.4 �� �������� �پ��� Ȱ��
-- �޿��� 300 �̻� 500 ���� 
SELECT * FROM emp WHERE sal>=300 and sal<=500;

-- 4. BETWEEN AND ������
-- ������ 200���� 300������ ������ ���
SELECT * FROM emp WHERE sal>=200 and sal<=300;
SELECT * FROM emp WHERE sal BETWEEN 200 and 300;
-- ������ 200�̸��̰ų� 300�ʰ��� ������ ���
SELECT * FROM emp WHERE sal<200 or sal>300;
SELECT * FROM emp WHERE sal NOT BETWEEN 200 and 300;

-- 5. IN ������ > �÷��� IN(A, B, C)
-- �� �������� OR �����ڸ� ����ϱ� ���ϰ� ����� ���� ������
-- �޿��� 300�̰ų� 500�̰ų� 1000�� �����͸� ���
SELECT * FROM emp WHERE sal=300 or sal=500 or sal=1000;
SELECT * FROM emp WHERE sal IN(300, 500, 1000);
-- �޿��� 300, 500, 1000�� ��� �ƴ� ������ ���
SELECT * FROM emp WHERE sal!=300 and sal!=500 and sal!=1000;
SELECT * FROM emp WHERE sal not in(300, 500, 1000);

-- 6. LIKE ������ > �÷��� LIKE pattern(���ϵ�ī��)
-- 7. ���ϵ�ī�� ( % / _ )
-- �˻��ϰ��� �ϴ� ���� ��Ȯ�� ���� ���ϴ� ��쿡�� �˻��� �����ϵ��� ���ִ� ������
SELECT * FROM emp WHERE ename LIKE '��%';
-- �̸� �� ���⡯�� �����ϰ� �ִ� ��� ���̺��� �����͸� ���
SELECT * FROM emp WHERE ename LIKE '%��%';
-- �̸��� 3�����̰� �� �� �ι�° �̸��� �������� ����� ������ ���
SELECT * FROM emp WHERE ename LIKE '_��_';

-- 8. NULL ���� ������
-- NULL�� ���� �����Ϳ� �� ������ �ϰ� �Ǹ� �� ȭ��ó�� ����� ã���� ����. 
-- NULL�� = �����ڷ� �˻��� �Ұ��ϴ�.
SELECT * FROM emp WHERE comm=NULL;
SELECT * FROM emp WHERE comm IS NULL;
SELECT * FROM emp WHERE comm IS NOT NULL;

-- 9. ORDER BY
-- ��������(Ascending)
-- ���� ���� ���� ��µǰ� �Ʒ��� ������ ū ���� ���
-- ��������(Descending)
-- ū ���� ���� ��µǰ� �Ʒ��� ������ ���� ���� ���

-- �޿��� ���� �޴� ��������� ����� �����̴�.
SELECT * FROM emp ORDER BY sal ASC;
-- �޿��� ���� �޴� ��������� ����� �����̴�.
SELECT * FROM emp ORDER BY sal DESC;
-- ����� �̸��� ö�� �� �������� ���� �� ����.
SELECT * FROM emp ORDER BY ename ASC;
-- �ֱ� �Ի��� ������� ����ϴ� ����.
SELECT * FROM emp ORDER BY hiredate DESC;
-- �޿��� ���� �޴� ����� �������� ������ �� Ȥ�� �޿��� ���� ��� �̸��� ö�ڰ� ���� ������� ���
SELECT * FROM emp ORDER BY sal DESC, ename ASC;

-- ������ �����ϱ� ����
-- 1. �޿��� 300 ������ ����� ��� ��ȣ, �����, �޿��� ����Ͻÿ�.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL <=300;
-- 2. �̸��� ������ȣ���� ����� ��� ��ȣ, �����, �޿��� ����Ͻÿ�.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE ENAME='����ȣ';
-- 3. �޿��� 250�̰ų�, 300�̰ų�, 500�� ������� ��� ��ȣ, �����, �޿��� ����Ͻÿ�. 
--   (�� �����ڿ� or �� �����ڸ� �ۼ��غ���, in �����ڷ� �� ���� �ۼ��Ͻÿ�.)
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL=250 OR SAL=300 OR SAL=500;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL IN(250, 300, 500);
-- 4. �޿��� 250��, 300��, 500�� �ƴ� ������� �˻��Ͻÿ�
--   (�� �����ڿ� and �� �����ڸ� ����Ͽ� �ۼ��غ���, in �����ڷ� �� ���� �ۼ��Ͻÿ�.)
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL!=250 AND SAL!=300 AND SAL!=500;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL NOT IN(250, 300, 500);
-- 5. ����� �߿��� �̸��� ���裢���� �����ϴ� ����� �̸� �߿� ���⣢�� �����ϴ� ����� �����ȣ�� ������� ���
--   (LIKE �����ڿ� ���ϵ�ī�带 �̿�)
SELECT EMPNO, ENAME FROM EMP WHERE ENAME LIKE '��%' OR ENAME LIKE '%��%';
-- 6. ����ڰ� ���� ���(����)�� �˻��ϱ� ���� SQL���� �ۼ��Ͻÿ�. (NULL �̿�)
SELECT * FROM EMP WHERE MGR IS NULL;
-- 7. ��� ���̺��� �ڷḦ �Ի����� �������� �����Ͽ� �ֱٿ� �Ի��� ������ ���� ���� ���
--   (�����ȣ, �����, ����, �Ի��ϸ� ���)
SELECT EMPNO, ENAME, JOB, to_char(HIREDATE, 'YYYY/MM/DD') FROM EMP ORDER BY HIREDATE DESC;
-- 8. �μ� ��ȣ�� ���� ������� ����ϵ�, ���� �μ� ���� ����� ����� ��� �Ի����� ���� ������ ������� ���
SELECT DEPTNO, EMPNO, ENAME, JOB, to_char(HIREDATE, 'YYYY/MM/DD') FROM EMP ORDER BY DEPTNO ASC, HIREDATE ASC;
