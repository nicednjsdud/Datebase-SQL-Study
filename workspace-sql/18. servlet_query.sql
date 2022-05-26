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