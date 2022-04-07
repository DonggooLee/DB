-- 트랜잭션 ★★★
-- 데이터 처리의 한 단위.
-- 오라클에서 발생하는 여러 개의 SQL 명령문들을 하나의 논리적인 작업 단위로 처리하는 과정
-- 하나의 트랜잭션은 All-or-Nothing 방식으로 처리 ★★
-- 데이터베이스에서 작업의 단위로 트랜잭션이란 개념을 도입한 이유는 데이터의 일관성을 유지하면서 안정적으로 데이터를 복구시키기 위해서이다.
-- 트랜잭션을 위한 명령어 : COMMIT / SAVEPOINT / ROLLBACK
-- COMMIT : 작업들을 정상적으로 처리하겠다고 확정
-- ROLLBACK : 변경사항을 취소
-- SAVEPOINT : 현재의 트랜잭션을 작게 분할할 수 있다.
-- 형식 : SAVEPOINT 명칭; // ROLLBACK TO 명칭;

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
