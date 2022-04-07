-- 1. ������ ��������
-- �ϳ��� SELECT ������ �� �ȿ� ���Ե� �� �ϳ��� SELECT ����
-- �� �������� �����ʿ� ����ؾ� �ϰ� �ݵ�� ��ȣ�� ���ξ� �Ѵ�.
-- ���� ������ ����Ǳ� ���� �ѹ��� ����ȴ�.

-- 2. ������������ �׷� �Լ��� ���
-- ��� �޿��� ���ϴ� �������� ���� ������ ����Ͽ� ��� �޿����� �� ���� �޿��� �޴� ���
SELECT ename, sal FROM emp WHERE sal > (SELECT AVG(sal) FROM emp);

-- 3. ���� �� ���� ����
-- ���� �������� ��ȯ�Ǵ� ����� �ϳ� �̻��� ���� �� ��� �ݵ�� ���� �� ������(Multiple Row Operator)�� �Բ� ���

-- IN ������ : ���� ������ �� ����(��=�� �����ڷ� ���� ���)�� ���� ������ ��� �߿��� �ϳ��� ��ġ�ϸ� ��
-- ex)�޿��� 400�̻� �޴� ����� �Ҽӵ� �μ��� ������ �μ����� �ٹ��ϴ� ������� ������ ����ϴ� ����.
SELECT ename, sal , deptno FROM emp WHERE deptno IN (SELECT DISTINCT deptno FROM emp WHERE sal>=400);

-- ALL ������ : ���� ������ �� ������ ���� ������ �˻� ����� ��� ���� ��ġ�ϸ� ��.
-- ex)30�� �Ҽ� ����� �߿��� �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� ����� ������ ����ϴ� ����.
-- ã���� ���� ���� AND������ �ؼ� ��� ���̸� ���� �Ǵ� ���� �Ǳ� ������ ALL�� ����� �񱳰� ���� ũ�ġ��� ���� ���� �ǹǷ� ���ִ밪���� ũ�� ��.��
SELECT ename, sal FROM emp WHERE sal > ALL (SELECT sal  FROM emp WHERE deptno=30);

-- ANY ������ : ANY ������ ���� ������ �� ������ ���� ������ �˻� ����� �ϳ� �̻� ��ġ�ϸ� ��.
-- ex)30�� �Ҽ� ����� �߿��� �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� ����� ������ ����ϴ� ����.
-- ã���� ���� ���ؼ� �ϳ��� ũ�� ���� �ȴ�. �׷��Ƿ� ã���� �� �߿��� ���� ���� �� ��, ���ּҰ� ���� ũ�� ��.��
SELECT ename, sal FROM emp WHERE sal > ANY (SELECT sal  FROM emp WHERE deptno=30);

-- ����
-- ���������� ���� �μ����� �ٹ��ϴ� ����� �̸��� �μ� ��ȣ�� ����ϴ� ����
SELECT ename, deptno FROM emp where deptno = (SELECT deptno FROM emp where ename='����');
-- 1. ���������� ������ ������ ���� ����� ����Ͻÿ�.
SELECT  *  FROM emp where job = (SELECT job FROM emp where ename='����');
-- 2. ���������� �޿��� �����ϰų� �� ���� �޴� ������ �޿��� ����Ͻÿ�.
SELECT ename, sal FROM emp where sal >= (SELECT sal FROM emp where ename='����');
-- 3. �����Ρ����� �ٹ��ϴ� ����� �̸�, �޿��� ����Ͻÿ�.
SELECT ename, sal FROM emp where deptno = (SELECT deptno FROM dept where deptno=30);
SELECT ename, sal FROM emp where deptno = (SELECT deptno FROM dept where loc='����');
-- 4. ���� ����� ���嵿�ǡ��� ������ �̸��� �޿��� ����Ͻÿ�.
SELECT ename, sal FROM emp where mgr  = (SELECT empno FROM emp WHERE ename='�嵿��');
-- 5. �μ����� ���� �޿��� ���� �޴� ����� ������ ����Ͻÿ�. (IN ������ ���)
SELECT * FROM EMP WHERE SAL IN ( SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);
-- 6. ������ �����塯�� ����� ���� �μ��� �μ� ��ȣ�� �μ���, ������ ����Ͻÿ�. (IN ������ ���)
SELECT * FROM dept WHERE deptno IN (SELECT deptno FROM emp WHERE job='����');
-- 7. ���� ���� �޿��� �޴� �����塯 ���� �� ���� �޿��� �޴� �������� �̸�, �޿�, ������ ����Ͻÿ�. (ALL ������ ���)
SELECT ename, sal, job FROM emp WHERE sal > ALL (SELECT sal FROM emp WHERE job='����');
SELECT ename, sal, job FROM emp WHERE sal > ( SELECT MAX(sal) FROM emp WHERE job='����'); -- ������ ��������
-- 8. ���� ���� �޿��� �޴� �����塯 ���� �� ���� �޿��� �޴� �������� �̸�, �޿�, ������ ����Ͻÿ�. (ANY ������ ���)
SELECT ename, sal, job FROM emp WHERE sal > ANY (SELECT sal FROM emp WHERE job='����');
SELECT ename, sal, job FROM emp WHERE sal > ( SELECT MIN(sal) FROM emp WHERE job='����'); -- ������ ��������
