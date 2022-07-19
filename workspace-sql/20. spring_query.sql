-- 계좌 테이블 생성
DROP TABLE custom_account CASCADE CONSTRAINTS;
CREATE TABLE custom_account (
	accountNo varchar(20) PRIMARY KEY,	-- 계좌 번호
	custName varchar(50),				-- 예금자
	balance number(20,4)				-- 계좌 잔고
);
INSERT INTO ADMIN.CUSTOM_ACCOUNT (ACCOUNTNO, CUSTNAME, BALANCE) VALUES('2022-07-060219', '정원영', 10000000);
INSERT INTO ADMIN.CUSTOM_ACCOUNT (ACCOUNTNO, CUSTNAME, BALANCE) VALUES('2022-07-060223', 'BOB', 40000000);
COMMIT;

SELECT * FROM CUSTOM_ACCOUNT ;

SELECT * FROM t_member WHERE id = 'LEE' AND pwd = '0824';

-- 게시판 테이블 생성
DROP TABLE t_board CASCADE CONSTRAINTS;
CREATE TABLE t_board(
	articleNO number(10) PRIMARY KEY,
	parentNO number(10) DEFAULT 0,
	title varchar2(500) NOT NULL,
	content varchar2(4000),
	imageFileName varchar2(100),
	writeDate DATE DEFAULT sysdate NOT null,
	id varchar2(20) NOT NULL,
	CONSTRAINT fk_id FOREIGN KEY (id) references t_member(id)
);

INSERT INTO ADMIN.T_BOARD
(ARTICLENO, PARENTNO, title, CONTENT, IMAGEFILENAME, WRITEDATE, ID)
VALUES(1, 0, '장마철', '장마철 입니다.', null, sysdate , 'LEE');

INSERT INTO ADMIN.T_BOARD
(ARTICLENO, PARENTNO, title, CONTENT, IMAGEFILENAME, WRITEDATE, ID)
VALUES(2, 0, 'TO Do List', '오늘의 할일입니다.', null, sysdate , 'BOB');

INSERT INTO ADMIN.T_BOARD
(ARTICLENO, PARENTNO, title, CONTENT, IMAGEFILENAME, WRITEDATE, ID)
VALUES(3, 2, '답변입니다.', '첫번째는 무엇인가요?', null, sysdate , 'LEE');

INSERT INTO ADMIN.T_BOARD
(ARTICLENO, PARENTNO, title, CONTENT, IMAGEFILENAME, WRITEDATE, ID)
VALUES(4, 0, '신사임당입니다', 'TEST입니다.', null, sysdate , 'SHIN');

INSERT INTO ADMIN.T_BOARD
(ARTICLENO, PARENTNO, title, CONTENT, IMAGEFILENAME, WRITEDATE, ID)
VALUES(5, 3, '답변입니다.', '알고리즘 공부입니다.', null, sysdate , 'BOB');

INSERT INTO ADMIN.T_BOARD
(ARTICLENO, PARENTNO, title, CONTENT, IMAGEFILENAME, WRITEDATE, ID)
VALUES(6, 2, '답변입니다.', '잘보고 있습니다..', null, sysdate , 'HONG');

COMMIT;


SELECT * FROM T_BOARD tb ;

-- 글목록 조회
SELECT LEVEL, ARTICLENO ,PARENTNO ,lpad(' ',4*(LEVEL-1)) || TITLE title, CONTENT ,WRITEDATE ,ID 
FROM T_BOARD 
START WITH parentNO = 0		-- 계층형 구조에서 최상위 로우(row)를 식별하는 조건 (즉 부모 글부터 시작)
CONNECT BY PRIOR ARTICLENO =PARENTNO  --계층 구조가 어떻게 식으로 연결되는지 기술함
ORDER siblings BY ARTICLENO DESC ;

SELECT nvl(Max(articleNO),0) +1
FROM t_board ;

INSERT INTO T_BOARD (ArticleNO,TITLE,CONTENT,IMAGEFILENAME,id)
VALUES ('7','금요일','내일 초복입니다',NULL,'LEE');

ROLLBACK;

-- 다중 파일 업로드
DROP TABLE T_ImageFile CASCADE CONSTRAINTS;
CREATE TABLE T_ImageFile(
	imageFileNO number(10) PRIMARY KEY,
	imageFileName varchar2(50),
	regDate DATE DEFAULT sysdate,
	articleNO number(10),
	CONSTRAINT FK_articleNO FOREIGN KEY(articleNO) REFERENCES T_board(articleNO)
	ON DELETE CASCADE
);

INSERT INTO ADMIN.T_IMAGEFILE
(IMAGEFILENO, IMAGEFILENAME, REGDATE, ARTICLENO)
VALUES(0, '', sysdate, 0);

SELECT nvl(Max(imageFileNO),0) FROM t_imageFile;






