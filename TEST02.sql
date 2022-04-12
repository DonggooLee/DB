CREATE TABLE book (
bookid number primary key,
bookname varchar2(50),
publisher varchar2(50),
price number
);

CREATE TABLE customer (
customerid number primary key,
name varchar2(20),
address varchar2(50),
phone varchar2(20)
);

CREATE TABLE orders (
orderid number primary key,
customerid number REFERENCES customer(customerid),
bookid number REFERENCES book(bookid),
saleprice number,
orderdate date
);

insert into book values (1, '�౸�ǿ���', '�½�����', 7000);
insert into book values (2, '�౸�ƴ¿���', '������', 13000);
insert into book values (3, '�౸������', '���ѹ̵��', 22000);
insert into book values (4, '�������̺�', '���ѹ̵��', 35000);
insert into book values (5, '�ǰܱ���', '�½�����', 6000);
insert into book values (6, '�����ܰ躰���', '�½�����', 6000);
insert into book values (7, '�߱����߾�', '�̻�̵��', 20000);
insert into book values (8, '�߱�����Ź��', '�̻�̵��', 13000);
insert into book values (9, '�ø����̾߱�', '�Ｚ��', 7500);
insert into book values (10, '�ø���è�Ǿ�', '�Ǿ', 13000);

insert into customer values (1, '������', '���� ��ü����', '010-0000-0000');
insert into customer values (2, '�迬��', '���ѹα� ����', '010-1111-1111');
insert into customer values (3, '��̶�', '���ѹα� ������', '010-2222-2222');
insert into customer values (4, '�߽ż�', '�̱� �ػ罺', '010-4444-4444');
insert into customer values (5, '�ڼ���', '���ѹα� ����', '010-5555-5555');

insert into orders values (1, 1, 1, 6000, '2014-07-01');
insert into orders values (2, 1, 3, 21000, '2014-07-03');
insert into orders values (3, 2, 5, 8000, '2014-07-03');
insert into orders values (4, 3, 6, 6000, '2014-07-04');
insert into orders values (5, 4, 7, 20000, '2014-07-07');
insert into orders values (6, 1, 2, 12000, '2014-07-07');
insert into orders values (7, 4, 8, 13000, '2014-07-07');
insert into orders values (8, 3, 10, 12000, '2014-07-08');
insert into orders values (9, 2, 10, 7000, '2014-07-09');
insert into orders values (10, 3, 8, 13000, '2014-07-10');

COMMIT;

SELECT * FROM ORDERS;
SELECT * FROM CUSTOMER;
SELECT * FROM BOOK;

-- 1. bookid�� 1�� å�� �̸��� ����Ͻÿ�.
SELECT * FROM BOOK WHERE BOOKID=1;
-- 2. ������ 20000�� �̻��� å�� �̸��� ��� ����Ͻÿ�.
SELECT BOOKNAME FROM BOOK WHERE PRICE>=20000;
-- 3. ���ǻ� �ߺ��� �����Ͽ� ����Ͻÿ�.
SELECT DISTINCT PUBLISHER FROM BOOK;
-- 4. �� �Ǹŵ� å�� ������ ���Ͻÿ�.
SELECT SUM(SALEPRICE) AS "���Ǹž�" FROM ORDERS;
-- 5. �������� �� ���ž��� ���Ͻÿ�.
SELECT SUM(SALEPRICE) FROM ORDERS WHERE CUSTOMERID = (SELECT CUSTOMERID FROM CUSTOMER WHERE NAME='������');
SELECT SUM(SALEPRICE) FROM CUSTOMER, ORDERS WHERE 1 = 1 AND CUSTOMER.CUSTOMERID = ORDERS.CUSTOMERID AND CUSTOMER.NAME = '������';
-- 6. �������� ������ ���� ���� ���Ͻÿ�.
SELECT COUNT(*) AS "������ å�� ��" FROM ORDERS WHERE CUSTOMERID = (SELECT CUSTOMERID FROM CUSTOMER WHERE NAME='������');
SELECT COUNT(*) AS "������ å�� ��" FROM CUSTOMER, ORDERS WHERE CUSTOMER.CUSTOMERID = ORDERS.CUSTOMERID AND CUSTOMER.NAME = '������';
-- 7. 2014�� 7�� 4�Ϻ��� 7�� 7�� ���̿� �ֹ� ���� (������) �ֹ� ������ ���
SELECT * FROM ORDERS WHERE ORDERDATE BETWEEN '2014-07-04' AND '2014-07-07';
SELECT * FROM ORDERS WHERE ORDERDATE NOT BETWEEN '2014-07-04' AND '2014-07-07';
-- 8. �ֹ��� ���� ���� ���� �̸��� ����Ͻÿ�.
SELECT NAME FROM CUSTOMER WHERE NAME NOT IN (SELECT CUSTOMER.NAME FROM CUSTOMER, ORDERS WHERE CUSTOMER.CUSTOMERID = ORDERS.CUSTOMERID);
-- 9. �������� ������ ������ ���ǻ� ��(�ߺ����� �˻��ϼ���.)�� ����ϼ���.
SELECT COUNT(DISTINCT PUBLISHER) FROM BOOK, CUSTOMER, ORDERS WHERE CUSTOMER.CUSTOMERID = ORDERS.CUSTOMERID AND BOOK.BOOKID = ORDERS.BOOKID AND CUSTOMER.NAME = '������';
-- 10. ���� �̸��� ���� �� ���ž��� �Բ� ����Ͻÿ�.
SELECT NAME,SUM(SALEPRICE) FROM ORDERS INNER JOIN CUSTOMER ON CUSTOMER.CUSTOMERID = ORDERS.CUSTOMERID GROUP BY NAME;

