--
CREATE TABLE book (
	bookId NUMBER (2)	NOT NULL	PRIMARY KEY,
	bookname varchar2(40),
	publisher varchar2(40),
	price number(8)
);

INSERT INTO book VALUES (1, '축구의 역사','굿스포츠', 7000);
INSERT INTO book VALUES (2, '축구아는 여자','나무수', 13000);
COMMIT;


select * from Book;































