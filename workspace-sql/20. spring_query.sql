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
DROP TABLE t_board2 CASCADE CONSTRAINTS;
CREATE TABLE t_board2(
	articleNO number(10) PRIMARY KEY,
	groupno number(10),
	parentNO number(10) DEFAULT 0,
	title varchar2(500) NOT NULL,
	content varchar2(4000),
	imageFileName varchar2(100),
	writeDate DATE DEFAULT sysdate NOT null,
	id varchar2(20) NOT NULL,
	CONSTRAINT fk2_id FOREIGN KEY (id) references t_member(id)
);

INSERT INTO ADMIN.T_BOARD2
(ARTICLENO, PARENTNO, title, CONTENT, IMAGEFILENAME, WRITEDATE, ID)
VALUES(1, 0, '장마철', '장마철 입니다.', null, sysdate , 'LEE');

INSERT INTO ADMIN.T_BOARD2
(ARTICLENO, PARENTNO, title, CONTENT, IMAGEFILENAME, WRITEDATE, ID)
VALUES(2, 0, 'TO Do List', '오늘의 할일입니다.', null, sysdate , 'BOB');

INSERT INTO ADMIN.T_BOARD2
(ARTICLENO, PARENTNO, title, CONTENT, IMAGEFILENAME, WRITEDATE, ID)
VALUES(3, 2, '답변입니다.', '첫번째는 무엇인가요?', null, sysdate , 'LEE');

INSERT INTO ADMIN.T_BOARD2
(ARTICLENO, PARENTNO, title, CONTENT, IMAGEFILENAME, WRITEDATE, ID)
VALUES(4, 0, '신사임당입니다', 'TEST입니다.', null, sysdate , 'SHIN');

INSERT INTO ADMIN.T_BOARD2
(ARTICLENO, PARENTNO, title, CONTENT, IMAGEFILENAME, WRITEDATE, ID)
VALUES(5, 3, '답변입니다.', '알고리즘 공부입니다.', null, sysdate , 'BOB');

INSERT INTO ADMIN.T_BOARD2
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
	imageFileName varchar2(2000),
	regDate DATE DEFAULT sysdate,
	articleNO number(10),
	CONSTRAINT FK_articleNO FOREIGN KEY(articleNO) REFERENCES T_board2(articleNO)
	ON DELETE CASCADE
);

INSERT INTO ADMIN.T_IMAGEFILE
(IMAGEFILENO, IMAGEFILENAME, REGDATE, ARTICLENO)
VALUES(0, '', sysdate, 0);

SELECT nvl(Max(imageFileNO),0) FROM t_imageFile;

INSERT INTO ADMIN.TB_SHOPPING_MEMBER
(MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_GENDER, HP1, HP2, HP3, SMSSTS_YN, EMAIL1, EMAIL2, EMAILSTS_YN, ZIPCODE, ROADADDRESS, JIBUNADDRESS, NAMUJIADDRESS, MEMBER_BIRTH_Y, MEMBER_BIRTH_M, MEMBER_BIRTH_D, MEMBER_BIRTH_GN, JOINDATE, DEL_YN)
VALUES('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', sysdate, 'N'
);

DELETE from t_board WHERE articleNO = 7;
ROLLBACK;

DELETE FROM T_IMAGEFILE WHERE articleNO = 7 AND IMAGEFILENO = 16;

DELETE FROM t_imageFile WHERE articleNo = 24 AND IMAGEFILENO = 19

COMMIT;

-- 글 그룹 조회하기
SELECT DISTINCT groupNO FROM T_BOARD2 tb ORDER BY GROUPNO DESC;

-- 각각의 행번호를 동시에 조회하기

SELECT rowNum AS recnum,  groupNO
from(
SELECT DISTINCT groupNO FROM T_BOARD2 tb ORDER BY GROUPNO DESC
);

-- rowNum 필드값을 이용해서 1에서 10까지의 레코드만 조회하기

SELECT recNum, groupNO
FROM (
	SELECT rowNum AS recnum,  groupNO
from(
SELECT DISTINCT groupNO FROM T_BOARD2 tb ORDER BY GROUPNO DESC
)
)
WHERE recNum BETWEEN 1 AND 10
;

SELECT * FROM T_BOARD2
WHERE GROUPNO IN(
	SELECT GROUPNO 
	FROM (
		SELECT recNum, groupNO
		FROM (
			SELECT rowNum AS recnum,  groupNO
				from(
					SELECT DISTINCT groupNO FROM T_BOARD2 tb ORDER BY GROUPNO DESC
					)
			)
		WHERE recNum BETWEEN 1 AND 10	
		)
)
;

SELECT groupNO,LEVEL AS lvl, articleno,parentno,title,id,writedate
FROM (
		SELECT * FROM T_BOARD2
			WHERE GROUPNO IN(
				SELECT GROUPNO 
				FROM (
					SELECT recNum, groupNO
					FROM (
						SELECT rowNum AS recnum,  groupNO
							from(
								SELECT DISTINCT groupNO FROM T_BOARD2 tb ORDER BY GROUPNO DESC
								)
						)
					WHERE recNum BETWEEN 1 AND 10	
					)
			)		
	)
	START WITH parentNO = 0		
	CONNECT BY PRIOR ARTICLENO = PARENTNO  
	ORDER siblings BY ARTICLENO DESC;


SELECT GROUPNO ,LVL ,articleNO,parentNO,title,id,writedate
from(
	SELECT groupNO,LEVEL AS lvl, articleno,parentno,title,id,writedate
	FROM (
			SELECT * FROM T_BOARD2
				WHERE GROUPNO IN(
					SELECT GROUPNO 
					FROM (
						SELECT recNum, groupNO
						FROM (
							SELECT rowNum AS recnum,  groupNO
								from(
									SELECT DISTINCT groupNO FROM T_BOARD2 tb ORDER BY GROUPNO DESC
									)
							)
						WHERE recNum BETWEEN 1 AND 10	
						)
				)		
		)
		START WITH parentNO = 0		
		CONNECT BY PRIOR ARTICLENO = PARENTNO  
		ORDER siblings BY ARTICLENO DESC
)
;	

SELECT * FROM (
	SELECT GROUPNO ,LVL ,articleNO,parentNO,title,id,writedate
	from(
		SELECT groupNO,LEVEL AS lvl, articleno,parentno,lpad(' ', 4*(LEVEL-1))|| TITLE title,id,writedate
		FROM (
				SELECT * FROM T_BOARD2
					WHERE GROUPNO IN(
						SELECT GROUPNO 
						FROM (
							SELECT recNum, groupNO
							FROM (
								SELECT rowNum AS recnum,  groupNO
									from(
										SELECT DISTINCT groupNO FROM T_BOARD2 tb ORDER BY GROUPNO DESC
										)
								)
							WHERE recNum BETWEEN 1 AND 10	
							)
					)		
			)
			START WITH parentNO = 0		
			CONNECT BY PRIOR ARTICLENO = PARENTNO  
			ORDER siblings BY ARTICLENO DESC
	)
)
;
SELECT count(DISTINCT GROUPNO) FROM T_BOARD2 tb ;

ALTER TABLE T_BOARD2 ADD viewcounts number(10) DEFAULT 0;
ALTER TABLE T_BOARD2 DROP COLUMN viewcounts;
ALTER TABLE T_BOARD2 ALTER COLUMN viewcounts DEFAULT 0;

-- 조회수 업데이트
UPDATE T_BOARD2 SET viewcounts = viewcounts + 1 WHERE ARTICLENO = 2;

DROP TABLE member_shop CASCADE CONSTRAINTS;
CREATE TABLE member_shop (
	userid NUMBER(10) PRIMARY KEY,
	name varchar2(100) NOT NULL,
	pass varchar2(100) NOT NULL,
	birthday DATE NOT NULL,
	gender char(10) NOT NULL,
	phone varchar2(100) NOT NULL,
	addr varchar2(1000),
	is_out char(10) DEFAULT 'n'  NOT NULL,
	reg_date timestamp DEFAULT systimestamp NOT NULL,
	login_date timestamp DEFAULT systimestamp NOT null
);


SELECT nvl(Max(userid),0) +1 FROM member_shop ;


INSERT INTO ADMIN.MEMBER_SHOP
(USERID, NAME, PASS, BIRTHDAY, GENDER, PHONE, ADDR)
VALUES(2, 'test', '1234', '2011.03.27', 'M', '01062429703', '경기도');




