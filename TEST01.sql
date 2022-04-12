-- 1. ȸ�� ������ ����
CREATE SEQUENCE user_seq
START WITH 1
INCREMENT BY 1;

-- 2. ȸ�� ���̺� ����
CREATE TABLE userTable (
userNo number primary key,
userId varchar2(20) not null unique,
userPw varchar2(20) not null,
userTel varchar2(20) unique,
userMembership varchar2(10),
userEmail varchar2(20) unique,
userPoint number default 1000,
joinDate date default sysdate
);

insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id01', '1111', '010-1111-1111', 'gold', 'id01@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id02', '1111', '010-1111-2222', 'silver', 'id02@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id03', '1111', '010-1111-3333', 'bronze', 'id03@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id04', '1111', '010-1111-4444', 'gold', 'id04@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id05', '1111', '010-1111-5555', 'silver', 'id05@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id06', '1111', '010-1111-6666', 'bronze', 'id06@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id07', '1111', '010-1111-7777', 'gold', 'id07@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id08', '1111', '010-1111-8888', 'silver', 'id08@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id09', '1111', '010-1111-9999', 'bronze', 'id09@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id10', '1111', '010-1111-0000', 'gold', 'id10@aa.com');

commit;

SELECT * FROM USERTABLE;
-- 1) userNo �� 5 �̻��� ȸ���� �˻��Ͻÿ�.
SELECT * FROM USERTABLE WHERE USERNO>=5;
-- 2) userNo �� 3 ~ 7 ������ ȸ���� �˻��Ͻÿ�.
SELECT * FROM USERTABLE WHERE USERNO BETWEEN 3 AND 7; 
-- 3) userTel ������ 4�ڸ��� '5555' �� ȸ���� �˻��Ͻÿ�.
SELECT * FROM USERTABLE WHERE 5555 = SUBSTR(USERTEL,-4,4);
SELECT * FROM usertable WHERE userTel like '%5555';
-- 4) userMembership �� 'gold' �� ȸ���� userPoint ����� ����Ͻÿ�. 
SELECT AVG(USERPOINT) AS "���" FROM USERTABLE WHERE USERMEMBERSHIP='gold';
-- 5) userId �� 'id03' �� ȸ���� joinDate �� '2019/10/28/'�� �����Ͻÿ�.
UPDATE usertable SET joindate=to_date('2019-10-28','yyyy-mm-dd') where userid='id03';
-- 6) userMembership �� 'gold' �� ȸ������ userPoint �� ��� 3�� ������Ű�ÿ�.
UPDATE usertable SET userpoint=userPoint*3 where usermembership='gold';
-- 7) userId �� 'id08' �� ȸ���� userPw �� '2222'�� �����Ͻÿ�.
UPDATE usertable SET userpw=2222 where userid='id08';
-- 8) userMembership �� 'bronze' �� ȸ���� �߿��� userPoint �� 1000 �̻��� ȸ������ userMembership �� 'silver'�� �����Ͻÿ�.
UPDATE usertable SET usermembership='silver' where userpoint>=1000 and usermembership='bronze';
-- 9) userNo �� 5 �� ȸ���� �����Ͻÿ�.
DELETE FROM usertable WHERE userno=5;

