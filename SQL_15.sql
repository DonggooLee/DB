-- �ε���
-- �ε��� ����
-- SQL ��ɹ��� ó�� �ӵ��� ����Ű�� ���ؼ� �÷��� ���ؼ� �����ϴ� ����Ŭ ��ü
-- USER_IND_COLUMNS ������ ��ųʸ� ��
SELECT INDEX_NAME, TABLE_NAME, COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME IN('EMP', 'DEPT');
DROP TABLE emp01;
CREATE TABLE emp01 AS SELECT * FROM emp;

-- ������ �ڰ����� (������)
INSERT INTO EMP01 SELECT * FROM EMP01;
SELECT * FROM EMP01;

-- �˻��� ������ ����
INSERT INTO EMP01(EMPNO, ENAME) VALUES(1111,'ȫ�浿');
SET TIMING ON
SELECT DISTINCT EMPNO, ENAME FROM EMP01 WHERE ENAME = 'ȫ�浿';

-- �ε��� ����
CREATE INDEX IDX_EMP01_ENAME ON EMP01(ENAME); -- Ư�� �÷��� �ε��� �ο� �Ѵ�
SELECT DISTINCT EMPNO, ENAME FROM EMP01 WHERE ENAME = 'ȫ�浿';

-- �ε��� ����
-- DROP INDEX �ε�����;



