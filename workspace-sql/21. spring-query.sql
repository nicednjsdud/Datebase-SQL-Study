-- store 프로젝트 멤버 테이블
DROP TABLE tb_shopping_member CASCADE CONSTRAINTS;
CREATE TABLE tb_shopping_member (
	member_id varchar2(20) PRIMARY KEY,
	member_pw varchar2(30),
	member_name varchar2(50),
	member_gender varchar2(10),
	hp1	varchar2(20),
	hp2 varchar2(20),
	hp3 varchar2(20),
	smssts_yn	varchar2(20),
	email1 varchar2(20),
	email2 varchar2(20),
	emailsts_yn varchar2(20),
	zipcode varchar2(20),
	roadaddress varchar2(500),
	jibunaddress varchar2(500),
	namujiaddress varchar2(500),
	member_birth_y varchar2(20),
	member_birth_m varchar2(20),
	member_birth_d varchar2(20),
	MEMBER_birth_gn varchar2(20),
	joindate DATE DEFAULT sysdate,
	del_yn varchar2(20) DEFAULT 'N'
);

INSERT INTO ADMIN.TB_SHOPPING_MEMBER
(MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_GENDER, HP1, HP2, HP3, SMSSTS_YN, EMAIL1, EMAIL2, EMAILSTS_YN, ZIPCODE, ROADADDRESS, JIBUNADDRESS, NAMUJIADDRESS, MEMBER_BIRTH_Y, MEMBER_BIRTH_M, MEMBER_BIRTH_D, MEMBER_BIRTH_GN, JOINDATE, DEL_YN)
VALUES('bob', '0824', '정원영', '101', '010', '3456', '7890', 'Y', 'bob', 'gmail.com,non', 'N', '2201718', '경기도 화성시 기산동', '서경초등학교','1층', '1997', '3', '27', '2','2022-07-18', 'N'
);

SELECT decode(count(*),1,'true',0,'false')
FROM TB_SHOPPING_MEMBER tsm WHERE MEMBER_ID ='bob'
