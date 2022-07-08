-- 회원 테이블생성
/*
 *  1	ID	id	varchar2	10
	2	비밀번호	pwd	varchar2	10
	3	이름	name	varchar2	50
	4	이메일	email	varchar2	50
	5	가입일자	joinDate	date	
 * 
 */
DROP TABLE T_MEMBER CASCADE CONSTRAINT;
CREATE TABLE T_MEMBER (
	ID VARCHAR2(10) PRIMARY KEY,
	PWD VARCHAR2(10) NOT NULL,
	NAME VARCHAR2(50),
	EMAIL VARCHAR2(50) NOT NULL,
	JOINDATE DATE DEFAULT SYSDATE
);

-- 회원 정보 추가
INSERT INTO T_MEMBER VALUES ('LEE','0824','이순신','LEE@gamil.com',sysdate);
INSERT INTO T_MEMBER VALUES ('HONG','0824','홍길동','HONG@gamil.com',sysdate);
INSERT INTO T_MEMBER VALUES ('SHIN','0824','신사임당','SHIN@gamil.com',sysdate);
INSERT INTO T_member (ID,PWD,NAME,EMAIL) VALUES ('TEST','0824','테스트','TEST@gmail.com');
COMMIT;

SELECT * FROM T_MEMBER;
DELETE FROM T_MEMBER WHERE ID ='ezen';

SELECT DECODE(COUNT(*),1,'TRUE','FALSE') AS RESULT
FROM T_MEMBER 
WHERE ID='LEE1' AND PWD = '0824'
;


-- 테이블 및 시퀀스 생성

DROP TABLE MEMBER CASCADE CONSTRAINTS;
CREATE TABLE MEMBER (
	ID VARCHAR2(10) NOT NULL,
	PASS VARCHAR2(10) NOT NULL,
	NAME VARCHAR2(30) NOT NULL,
	REGIDATE DATE DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY(ID)
);


INSERT INTO "MEMBER" (ID,PASS,NAME) VALUES ('EZEN','0824','이젠');
INSERT INTO "MEMBER" (ID,PASS,NAME) VALUES ('bob','1234','정원영');
SELECT * FROM MEMBER WHERE ID = 'EZEN' AND PASS ='0824';
COMMIT;
DROP TABLE board CASCADE CONSTRAINTS;
CREATE TABLE board (
		num NUMBER PRIMARY KEY ,
		title varchar2(200) NOT NULL,
		content varchar2(2000) NOT NULL,
		id varchar2(10) NOT NULL,
		postdate DATE DEFAULT sysdate NOT NULL,
		visitcount number(6)
);
-- 외래키로 테이블 사이의 관계 설정
-- board 테이블의 id 컬럼이 member 테이블의 id컬럼을 참조하도록 해주는 외래키 생성
ALTER TABLE board ADD CONSTRAINT board_member_fk FOREIGN KEY (id) REFERENCES member(id);
COMMIT;

-- 일련번호형 시퀀스(Sequence) 객체 생성
-- : 순차적으로 증가하는 순번을 반환하는 데이터베이스 객체임.
DROP SEQUENCE seq_board_num;
CREATE SEQUENCE seq_board_num
	INCREMENT BY 1				-- 1씩 증가
	START WITH 1				-- 시작값 1
	MINVALUE 1					-- 최소값 1
	nomaxvalue					-- 최대값은 무한대
	nocycle						-- 순환하지 않음
	nocache						-- 캐시 안함
	;

INSERT INTO board VALUES (seq_board_num.nextval, '오늘은 6월 2째주','월요일같은 화요일입니다.'
		,'EZEN',sysdate,0);
INSERT INTO board VALUES (seq_board_num.nextval, '2022년 절반이 감','어느덧 올해도 절반이 지나갑니다.'
		,'EZEN',sysdate,0);
INSERT INTO board VALUES (seq_board_num.nextval, '신논현역 분당성 개통','공사가 다 무리되어서 인도가 넓어졌으나 건물 공사가 한쪽에서..'
		,'EZEN',sysdate,0);
INSERT INTO board VALUES (seq_board_num.nextval, 'BoB님의 게시물입니다.','자바 spring 등 여러가지 공부를 하고있습니다.'
		,'EZEN',sysdate,0);
COMMIT;

SELECT * FROM BOARD ORDER BY NUM DESC;

SELECT * FROM board WHERE title LIKE '%오늘%';

SELECT * FROM board WHERE CONTENT LIKE '%월%';

SELECT count(*) FROM board WHERE title LIKE '%오늘%';

SELECT count(*) FROM board WHERE CONTENT LIKE '%월%';


SELECT b.*,m.NAME FROM "MEMBER" m INNER JOIN BOARD b ON m.ID = b.ID 
WHERE num = 3
;

-- 조회수 증가
UPDATE BOARD SET VISITCOUNT = VISITCOUNT +1 WHERE num = 1;
COMMIT;

-- 게시물 수정
UPDATE BOARD SET TITLE = '내일도 알고리즘 문제를 풀겠습니다.', CONTENT = 'DP문제를 마스터 하겠습니다' WHERE NUM = 8;
COMMIT;

-- 게시물 삭제
DELETE FROM board WHERE num = 6;
COMMIT;

SELECT DECODE(COUNT(*),1,'true','false') AS result FROM T_MEMBER WHERE id= 'LEE';


DROP TABLE mvcboard	CASCADE CONSTRAINTS;
CREATE TABLE mvcboard (
	idx	NUMBER PRIMARY KEY,
	name varchar2(50) NOT NULL,
	title varchar2(200) NOT NULL,
	content varchar2(2000) NOT NULL,
	postdate DATE DEFAULT sysdate NOT NULL,
	ofile varchar2(200),
	sfile varchar2(30),
	download NUMBER DEFAULT 0 NOT NULL,
	pass varchar2(50) NOT NULL,
	visitcount NUMBER DEFAULT 0 NOT null
);

INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob의 개발일기', '자바와 스프링을 공부하고있습니다.', '0824' );
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob의 개발일기2', '자바와 스프링을 공부하고있습니다.2', '0824' );
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob의 개발일기3', '자바와 스프링을 공부하고있습니다.3', '0824' );
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob의 개발일기4', '자바와 스프링을 공부하고있습니다.4', '0824' );
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob의 개발일기5', '자바와 스프링을 공부하고있습니다.5', '0824' );
COMMIT;
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob의 개발일기6', '자바와 스프링을 공부하고있습니다.6', '0824' );
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob의 개발일기7', '자바와 스프링을 공부하고있습니다.7', '0824' );
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob의 개발일기8', '자바와 스프링을 공부하고있습니다.8', '0824' );
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob의 개발일기9', '자바와 스프링을 공부하고있습니다.9', '0824' );
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob의 개발일기10', '자바와 스프링을 공부하고있습니다.10', '0824' );

SELECT id,pass,rownum FROM "MEMBER";

SELECT * FROM MVCBOARD ORDER BY IDX DESC ;

-- 페이징 처리 쿼리문

SELECT TB.*, ROWNUM rnum
FROM (SELECT * FROM MVCBOARD ORDER BY IDX DESC ) TB
;

SELECT *
FROM (
	SELECT TB.*, ROWNUM rnum
	FROM (SELECT * FROM MVCBOARD ORDER BY IDX DESC ) TB
)
WHERE rnum BETWEEN 1 AND 10;

SELECT count(*) FROM mvcboard WHERE 

DROP TABLE myfile CASCADE CONSTRAINTS;
CREATE TABLE myfile(
	idx NUMBER PRIMARY KEY NOT null,
	name varchar2(50) NOT NULL,
	title varchar2(200) NOT NULL,
	cate varchar2(30),
	ofile varchar2(100) NOT NULL,
	sfile varchar2(30) NOT NULL,
	postdate DATE DEFAULT sysdate NOT null
);


INSERT INTO EZEN.MYFILE
(IDX, NAME, TITLE, CATE, OFILE, SFILE)
VALUES(seq_board_num.nextval, '정원영', 'test', '사진', 'test.jpg', '20220621.jpg');


SELECT * FROM MVCBOARD WHERE IDX = '38';

UPDATE MVCBOARD SET VISITCOUNT = VISITCOUNT +1 WHERE idx= '35';

UPDATE MVCBOARD SET DOWNLOAD = DOWNLOAD  +1 WHERE idx= '38';







