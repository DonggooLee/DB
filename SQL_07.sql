SELECT * FROM emp, dept;
SELECT * FROM emp, dept WHERE emp.deptno=dept.deptno;

-- ANSI Join
-- Inner Join
-- ���� : SELECT * FROM table1 Inner Join table2 ON table1.column1 = table2.column2;
-- FROM���� ������ ���̺��� ����ϰ� ON ���� �̿��Ͽ� ���� ������ ����Ѵ�.
-- ON ���� ���� ������ ����ϰ�, �ٸ� ������ WHERE���� �����Ѵ�.
SELECT * FROM emp inner join dept On emp.deptno = dept.deptno WHERE ename='����';
SELECT * FROM emp inner join dept Using(deptno) WHERE ename='����';

create table dept01(
deptno number(2),
dname VARCHAR2(14));
INSERT INTO dept01 VALUES (10,'ACCOUNTING');
INSERT INTO dept01 VALUES (20,'RESEARCH');

create table dept02(
deptno number(2),
dname VARCHAR2(14));
INSERT INTO dept02 VALUES (10,'ACCOUNTING');
INSERT INTO dept02 VALUES (30,'SALES');

-- Outer Join
-- Left Outer Join, Right Outer Join, Full Outer Join �� ���� Ÿ��
-- Outer Join�� ��� ���� ���̺��� �ش��ϴ� �����Ͱ� �����ϴµ� �ٸ� �� ���̺��� �����Ͱ� �������� ���� ��� 
-- �� �����Ͱ� ��µ��� �ʴ� �������� �ذ��ϱ� ���� ����ϴ� ���� ����̴�. (Outer ���� ���� ����)
-- dept01 ����
SELECT * FROM dept01 left outer join dept02 On dept01.deptno = dept02.deptno;
-- dept02 ����
SELECT * FROM dept01 right outer join dept02 Using(deptno);
-- left, right�� ���� ����
SELECT * FROM dept01 full outer join dept02 Using(deptno);

-- ����
-- 1, �渮�ο��� �ٹ��ϴ� ����� �̸��� �Ի����� ����Ͻÿ�.
SELECT emp.ename, emp.hiredate FROM dept inner join emp ON dept.deptno = emp.deptno WHERE dept.deptno=10;
SELECT emp.ename, emp.hiredate FROM dept inner join emp  
-- 2. ��õ���� �ٹ��ϴ� ����� �̸��� �޿��� ����Ͻÿ�.	
SELECT emp.ename, emp.sal FROM dept inner join emp ON dept.deptno = emp.deptno WHERE dept.deptno=20;
SELECT emp.ename, emp.sal FROM dept inner join emp ON dept.deptno = emp.deptno WHERE dept.loc='��õ';

