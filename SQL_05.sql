-- 1.DUAL ���̺�
-- DUMMY��� �� �ϳ��� �÷����� �����Ǿ� �ִ�. �� �÷��� �ִ� ���̴� 1�̴�
-- DUAL ���̺��� DUMMY��� �� �ϳ��� �÷��� X��� �� �ϳ��� �ο츸�� �����ϰ� ������ �� ���� �ƹ��� �ǹ̰� ����.
-- �������� ���� ����� �ϳ��� �ο�� ��µǵ��� �ϱ� ���ؼ� �� �ϳ��� �ο츦 �����ϰ� ���� ���̴�.
DESC DUAL;
SELECT * FROM DUAL;

-- 2. �����Լ�
-- 2.1 ABS > ���밪�� ���ϴ� �Լ� / ������ ���� ũ�⸸ ����
SELECT -10, ABS(-10) FROM dual;
-- 2.1 FLOOR > �Ҽ��� �Ʒ��� ������ �Լ�
SELECT 34.5678, FLOOR(34.5678) FROM dual;
-- 2.2 ROUND > �Ҽ����� �ݿø� �ϴ� �Լ�
SELECT 34.5678, ROUND(34.5678) FROM dual;
-- Ư�� �ڸ������� �ݿø� �� �� �ֵ��� �ڸ����� ������ �� �ִ�
SELECT 34.5678, ROUND(34.5678, 2) FROM dual;
-- �ڸ����� ������ ������ �Ҽ����� �ƴ϶� �ϴ���, �ʴ���, ����� ������ �Ž��� �ö󰡸� �ݿø�
SELECT 34000.5678, ROUND(34000.5678, -4) FROM dual;
-- 2.3 TRUNC > Ư�� �ڸ��� ���ϸ� ���� ����� �����ִ� �Լ�
SELECT TRUNC(34.5678,2), TRUNC(34.5678, -1), TRUNC(34.5678) FROM dual;
-- 2.4 MOD > ������ ������ �� �ڿ� ���� �ƴ� �������� ����� �ǵ��� �޴� �Լ�
SELECT MOD(27,2), MOD(27,5), MOD(27,7) FROM dual;

-- 3. �����Լ�
-- 3.1 UPPER, LOWER
SELECT 'welcome to oracle', UPPER('welcome to oracle') FROM DUAL;
SELECT 'WELCOME TO ORACLE', LOWER('WELCOME TO ORACLE') FROM DUAL;
-- 3.2 INITCAP, LENGTH
-- �Է��� ���ڿ��� �̴ϼȸ� �빮�ڷ� �����ϴ� �Լ�
SELECT 'welcome to oracle', INITCAP('welcome to oracle') FROM DUAL;
-- �������� ���̸� �˷��ִ� �Լ�
SELECT LENGTH('����Ŭ'), LENGTH('Oracle') FROM DUAL;
-- 3.3 SUBSTR > SUBSTR(���, ���� ��ġ, ������ ����)
-- ��� ���ڿ��̳� �÷��� �ڷῡ�� ������ġ���� ���� ������ŭ�� ���ڸ� ���� �Ѵ�.
SELECT SUBSTR('Welcome to Oracle', 4, 3) FROM DUAL;
SELECT SUBSTR('Welcome to Oracle', -4, 3) FROM DUAL;
SELECT SUBSTR(hiredate, 1, 2) as "�⵵", SUBSTR(hiredate, 4, 2) as "��" FROM emp;
-- 3.4 INSTR > INSTR(���, ã�� ����, ���� ��ġ, �� ��° �߰�)
-- ��� ���ڿ��̳� �÷����� Ư�� ���ڰ� ��Ÿ���� ��ġ�� �˷��ش�.
SELECT INSTR('WELCOME TO ORACLE', 'O', 6, 2) FROM dual;
-- ������ġ, ���°�߰� ���� ���� ������ ��� 1�� ����
SELECT INSTR('WELCOME TO ORACLE', 'O') FROM dual;
-- 3.5 LPAD, RPAD
-- LPAD(Left Padding) > �÷��̳� ��� ���ڿ��� ��õ� �ڸ������� �����ʿ� ��Ÿ����,
-- ���� ���� �ڸ��� Ư�� ��ȣ�� ä��ϴ�
SELECT LPAD('Oracle', 20, '#') FROM dual;
-- RPAD(Right Padding) > �÷��̳� ��� ���ڿ��� ��õ� �ڸ������� ���ʿ� ��Ÿ����, 
-- ���� ������ �ڸ��� Ư�� ��ȣ�� ä��ϴ�.
SELECT RPAD('Oracle', 20, '#') FROM dual;
-- 3.6 LTRIM, RTRIM
-- LTRIM > ���ڿ��� ����(��)�� ���� ���ڵ��� �����Ѵ�.
SELECT LTRIM(' Oracle ') FROM dual;
-- RTRIM > LTRIM�� �ݴ�� ���ڿ��� ������(��)�� ���� ���ڵ��� �����Ѵ�.
SELECT RTRIM(' Oracle ') FROM dual;
-- 3.7 TRIM
-- Į���̳� ��� ���ڿ����� Ư�� ���ڰ� ù ��° �����̰ų� ������ �����̸�
-- �߶󳻰� ���� ���ڿ��� ��ȯ�մϴ�. (�յ��� 'a'���ڸ� �߶󳽴�)
SELECT TRIM('a' FROM 'aaaaOracleaaaa') FROM dual;
SELECT TRIM(' Oracle ') FROM dual;

-- 4. ��¥�Լ�
-- 4.1 SYSDATE > �ý��ۿ� ����� ���� ��¥�� ��ȯ
SELECT SYSDATE FROM dual;
-- ��¥ ����
SELECT SYSDATE-1 as "����", SYSDATE as "����", SYSDATE+1 as "����" FROM dual;
-- 4.2 ROUND > ROUND(date, format);
-- ���� ���� �����ϸ� ���� �̿ܿ� ��¥�� ���ؼ��� �ݿø��� �� �� �ִ�.
-- month �� 16���� �������� ������ �̹��� ũ�� ������ 1���� ���Ѵ�!
SELECT hiredate, ROUND(hiredate, 'MONTH') FROM emp;
-- 4.3 TRUNK > TRUNC(date, format);
-- ROUND �Լ��� ���������� ���� ������ �־� �پ��� �������� ��¥�� �߶󳾼� �ִ�.
SELECT hiredate, TRUNC(hiredate, 'MONTH') FROM emp;
-- 4.4 MONTHS_BETWEEN > MONTHS_BETWEEN(date1, date2);
-- ��¥�� ��¥ ������ ���� ���� ���ϴ� �Լ�
SELECT ename, sysdate, hiredate, MONTHS_BETWEEN(sysdate, hiredate) FROM emp;
-- TRUNK �Լ����� �ڸ����� Ư������ �ʾұ� ������ �Ҽ��� ���ϴ� ���� ������
SELECT ename, sysdate, hiredate, TRUNC(MONTHS_BETWEEN(sysdate, hiredate)) FROM emp;
-- 4.5 ADD_MONTHS > ADD_MONTHS(date, number)
-- �Ի� ��¥���� 6������ �߰�
SELECT ename, hiredate, ADD_MONTHS(hiredate, 6) FROM emp;
-- 4.6 LAST_DAY > LAST_DAY(date)
-- �ش� ��¥�� ���� ���� ������ ��¥�� ��ȯ�ϴ� �Լ�
SELECT hiredate, LAST_DAY(hiredate) FROM emp;

-- 5. �� ��ȯ �Լ�
-- ����, ����, ��¥�� ������ ���� �ٸ� ������������ ��ȯ�ؾ� �ϴ� ���
-- TO_NUMBER, TO_CHAR, TO_DATE
-- 5.1 TO_CHAR (��¥->����) > TO_CHAR(date, ��format��)
-- DATE ������ �����͸� ������ ��Ŀ� ���� VARCHAR2 ���� ���ڷ� ��ȯ�Ѵ�
SELECT sysdate, TO_CHAR(sysdate, 'YYYY-MM-DD') FROM dual;
SELECT hiredate, TO_CHAR(hiredate, 'YY/MON/DD DY') FROM emp;
SELECT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') FROM dual;
-- 5.1 TO_CHAR (����->����)
SELECT TO_CHAR(1230000) FROM dual;
SELECT ename, sal, TO_CHAR(sal, 'L999,999') FROM emp;
SELECT TO_CHAR(123456, '000000000'), TO_CHAR(123456, '999,999,999') FROM dual;
-- 5.2 TO_DATE (����->��¥) > TO_DATE(�����ڡ�, ��format��)
SELECT ename, hiredate FROM emp WHERE hiredate = TO_DATE('20040108','YYYYMMDD');
SELECT TRUNC(sysdate - TO_DATE('2020/01/01', 'YYYY/MM/DD')) FROM dual;
-- 5.3 TO_NUMBER (����->����)
SELECT TO_NUMBER('20,000','99,999') - TO_NUMBER('10,000','99,999') FROM DUAL;

-- 6. DECODE
-- ���α׷� ���� ���� ���� ���Ǵ� switch case ���� ���� ����� ���´�.
-- ���� ���� ��쿡 ���ؼ� ������ �� �ִ�.
-- DECODE(ǥ����, ����1, ���1,
--               ����2, ���2,
--               ����3, ���3,
--               �⺻���n
-- )
SELECT ename, deptno, DECODE(deptno, 
10, 'ACCOUNTING', 
20, 'RESEARCH',
30, 'SALES',
40, 'OPERATIONS')
as dname FROM emp;

-- 7. CASE
-- ���α׷� ����� if else if else �� ������ ������ ���´�.
-- ���� ���� ��쿡 ���ؼ� ������ �� �ִ�.
-- DECODE �Լ��� �������� �ִٸ� DECODE �Լ��� ������ ��ġ(= �� ������)
-- �ϴ� ��쿡 ���ؼ��� ����Ǵ� �ݸ�, CASE �Լ��� �پ��� �� �����ڸ� 
-- �̿��Ͽ� ������ ������ �� �����Ƿ� ������ ������ �� �ִ�.
-- CASE ǥ���� WHEN ����1 THEN ���1
-- WHEN ����1 THEN ���1
-- WHEN ����1 THEN ���1
-- ELSE ���n
-- END
SELECT ename, deptno, CASE
WHEN deptno=10 THEN 'ACCOUNTING'
WHEN deptno=20 THEN 'RESEARCH'
WHEN deptno=30 THEN 'SALES'
WHEN deptno=40 THEN 'OPERATIONS'
END 
as dname FROM emp;

-- 8. NVL
-- NULL�� 0 �Ǵ� �ٸ� ������ ��ȯ�ϱ� ���ؼ� ����ϴ� �Լ�.
SELECT ename, sal, comm, sal*12+comm, NVL(comm,0), sal*12+NVL(comm,0) FROM emp ORDER BY job;

-- SQL �ֿ� �Լ� ����
-- 1. 10���� �Ի��� ����� ���. (SUBSTR �Լ� ���)
SELECT * FROM emp WHERE SUBSTR(hiredate, 4, 2)=10;
-- 2. 2003�⵵�� �Ի��� ����� �˾Ƴ��� ���� ������ �ۼ�. (SUBSTR �Լ� ���)
SELECT * FROM emp WHERE SUBSTR(hiredate, 1, 2)=3;
-- 3. �̸��� "��"�� ������ ����� �˻�. (SUBSTR �Լ� ���)
SELECT * FROM emp WHERE SUBSTR(ename, -1)='��';
-- 4. ���޿� ���� �޿��� �λ��ϵ��� �Ѵ�. ������ '����'�� ����� 5%, '����'�� ����� 10%
--    '�븮'�� ����� 15%, '���'�� ����� 20%, �� ���� ������ �޿� �״�� ��� (DECODE �Լ� ���)
SELECT empno, ename, job, sal, DECODE(job, 
'����', sal+sal*0.05, 
'����', sal+sal*0.1,
'�븮', sal+sal*0.15,
'���', sal+sal*0.2,
sal
)
as upsal FROM emp;
-- 5. �Ի����� ������ 4�ڸ�(YYYY), ���� ����(MON)�� ǥ��
SELECT hiredate, TO_CHAR(hiredate, 'YYYY/MON/DD') as "CDATE" FROM emp;





