--
CREATE TABLE book (
	bookId NUMBER (2)	NOT NULL	PRIMARY KEY,
	bookname varchar2(40),
	publisher varchar2(40),
	price number(8)
);

INSERT INTO book VALUES (1, '�౸�� ����','�½�����', 7000);
INSERT INTO book VALUES (2, '�౸�ƴ� ����','������', 13000);
COMMIT;


select * from Book;































