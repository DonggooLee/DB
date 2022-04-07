-- Ʈ����� �ڡڡ�
-- ������ ó���� �� ����.
-- ����Ŭ���� �߻��ϴ� ���� ���� SQL ��ɹ����� �ϳ��� ������ �۾� ������ ó���ϴ� ����
-- �ϳ��� Ʈ������� All-or-Nothing ������� ó�� �ڡ�
-- �����ͺ��̽����� �۾��� ������ Ʈ������̶� ������ ������ ������ �������� �ϰ����� �����ϸ鼭 ���������� �����͸� ������Ű�� ���ؼ��̴�.
-- Ʈ������� ���� ��ɾ� : COMMIT / SAVEPOINT / ROLLBACK
-- COMMIT : �۾����� ���������� ó���ϰڴٰ� Ȯ��
-- ROLLBACK : ��������� ���
-- SAVEPOINT : ������ Ʈ������� �۰� ������ �� �ִ�.
-- ���� : SAVEPOINT ��Ī; // ROLLBACK TO ��Ī;

SELECT * FROM DEPT03;

DELETE FROM DEPT03 WHERE DEPTNO=40;
COMMIT;

DELETE FROM DEPT03 WHERE DEPTNO=30;
SAVEPOINT C1;

DELETE FROM DEPT03 WHERE DEPTNO=20;
SAVEPOINT C2;

DELETE FROM DEPT03 WHERE DEPTNO=10;
SAVEPOINT C3;

ROLLBACK TO C1;
ROLLBACK;
