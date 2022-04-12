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

insert into book values (1, '축구의역사', '굿스포츠', 7000);
insert into book values (2, '축구아는여자', '나무수', 13000);
insert into book values (3, '축구의이해', '대한미디어', 22000);
insert into book values (4, '골프바이블', '대한미디어', 35000);
insert into book values (5, '피겨교본', '굿스포츠', 6000);
insert into book values (6, '역도단계별기술', '굿스포츠', 6000);
insert into book values (7, '야구의추억', '이상미디어', 20000);
insert into book values (8, '야구를부탁해', '이상미디어', 13000);
insert into book values (9, '올림픽이야기', '삼성당', 7500);
insert into book values (10, '올림픽챔피언', '피어슨', 13000);

insert into customer values (1, '박지성', '영국 맨체스터', '010-0000-0000');
insert into customer values (2, '김연아', '대한민국 서울', '010-1111-1111');
insert into customer values (3, '장미란', '대한민국 강원도', '010-2222-2222');
insert into customer values (4, '추신수', '미국 텍사스', '010-4444-4444');
insert into customer values (5, '박세리', '대한민국 대전', '010-5555-5555');

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

-- 1. bookid가 1인 책의 이름을 출력하시오.
SELECT * FROM BOOK WHERE BOOKID=1;
-- 2. 가격이 20000원 이상인 책의 이름을 모두 출력하시오.
SELECT BOOKNAME FROM BOOK WHERE PRICE>=20000;
-- 3. 출판사 중복을 제거하여 출력하시오.
SELECT DISTINCT PUBLISHER FROM BOOK;
-- 4. 총 판매된 책의 가격을 구하시오.
SELECT SUM(SALEPRICE) AS "총판매액" FROM ORDERS;
-- 5. 박지성의 총 구매액을 구하시오.
SELECT SUM(SALEPRICE) FROM ORDERS WHERE CUSTOMERID = (SELECT CUSTOMERID FROM CUSTOMER WHERE NAME='박지성');
SELECT SUM(SALEPRICE) FROM CUSTOMER, ORDERS WHERE 1 = 1 AND CUSTOMER.CUSTOMERID = ORDERS.CUSTOMERID AND CUSTOMER.NAME = '박지성';
-- 6. 박지성의 구매한 도서 수를 구하시오.
SELECT COUNT(*) AS "구매한 책의 수" FROM ORDERS WHERE CUSTOMERID = (SELECT CUSTOMERID FROM CUSTOMER WHERE NAME='박지성');
SELECT COUNT(*) AS "구매한 책의 수" FROM CUSTOMER, ORDERS WHERE CUSTOMER.CUSTOMERID = ORDERS.CUSTOMERID AND CUSTOMER.NAME = '박지성';
-- 7. 2014년 7월 4일부터 7월 7일 사이에 주문 받은 (제외한) 주문 정보를 출력
SELECT * FROM ORDERS WHERE ORDERDATE BETWEEN '2014-07-04' AND '2014-07-07';
SELECT * FROM ORDERS WHERE ORDERDATE NOT BETWEEN '2014-07-04' AND '2014-07-07';
-- 8. 주문한 적이 없는 고객의 이름을 출력하시오.
SELECT NAME FROM CUSTOMER WHERE NAME NOT IN (SELECT CUSTOMER.NAME FROM CUSTOMER, ORDERS WHERE CUSTOMER.CUSTOMERID = ORDERS.CUSTOMERID);
-- 9. 박지성이 구매한 도서의 출판사 수(중복없이 검색하세요.)를 출력하세요.
SELECT COUNT(DISTINCT PUBLISHER) FROM BOOK, CUSTOMER, ORDERS WHERE CUSTOMER.CUSTOMERID = ORDERS.CUSTOMERID AND BOOK.BOOKID = ORDERS.BOOKID AND CUSTOMER.NAME = '박지성';
-- 10. 고객의 이름과 고객별 총 구매액을 함께 출력하시오.
SELECT NAME,SUM(SALEPRICE) FROM ORDERS INNER JOIN CUSTOMER ON CUSTOMER.CUSTOMERID = ORDERS.CUSTOMERID GROUP BY NAME;

