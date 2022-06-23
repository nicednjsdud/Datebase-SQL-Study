-- ȸ�� ���̺����
/*
 *  1	ID	id	varchar2	10
	2	��й�ȣ	pwd	varchar2	10
	3	�̸�	name	varchar2	50
	4	�̸���	email	varchar2	50
	5	��������	joinDate	date	
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

-- ȸ�� ���� �߰�
INSERT INTO T_MEMBER VALUES ('LEE','0824','�̼���','LEE@gamil.com',sysdate);
INSERT INTO T_MEMBER VALUES ('HONG','0824','ȫ�浿','HONG@gamil.com',sysdate);
INSERT INTO T_MEMBER VALUES ('SHIN','0824','�Ż��Ӵ�','SHIN@gamil.com',sysdate);
INSERT INTO T_member (ID,PWD,NAME,EMAIL) VALUES ('TEST','0824','�׽�Ʈ','TEST@gmail.com');
COMMIT;

SELECT * FROM T_MEMBER;
DELETE FROM T_MEMBER WHERE ID ='ezen';

SELECT DECODE(COUNT(*),1,'TRUE','FALSE') AS RESULT
FROM T_MEMBER 
WHERE ID='LEE1' AND PWD = '0824'
;


-- ���̺� �� ������ ����

DROP TABLE MEMBER CASCADE CONSTRAINTS;
CREATE TABLE MEMBER (
	ID VARCHAR2(10) NOT NULL,
	PASS VARCHAR2(10) NOT NULL,
	NAME VARCHAR2(30) NOT NULL,
	REGIDATE DATE DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY(ID)
);


INSERT INTO "MEMBER" (ID,PASS,NAME) VALUES ('EZEN','0824','����');
INSERT INTO "MEMBER" (ID,PASS,NAME) VALUES ('bob','1234','������');
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
-- �ܷ�Ű�� ���̺� ������ ���� ����
-- board ���̺��� id �÷��� member ���̺��� id�÷��� �����ϵ��� ���ִ� �ܷ�Ű ����
ALTER TABLE board ADD CONSTRAINT board_member_fk FOREIGN KEY (id) REFERENCES member(id);
COMMIT;

-- �Ϸù�ȣ�� ������(Sequence) ��ü ����
-- : ���������� �����ϴ� ������ ��ȯ�ϴ� �����ͺ��̽� ��ü��.
DROP SEQUENCE seq_board_num;
CREATE SEQUENCE seq_board_num
	INCREMENT BY 1				-- 1�� ����
	START WITH 1				-- ���۰� 1
	MINVALUE 1					-- �ּҰ� 1
	nomaxvalue					-- �ִ밪�� ���Ѵ�
	nocycle						-- ��ȯ���� ����
	nocache						-- ĳ�� ����
	;

INSERT INTO board VALUES (seq_board_num.nextval, '������ 6�� 2°��','�����ϰ��� ȭ�����Դϴ�.'
		,'EZEN',sysdate,0);
INSERT INTO board VALUES (seq_board_num.nextval, '2022�� ������ ��','����� ���ص� ������ �������ϴ�.'
		,'EZEN',sysdate,0);
INSERT INTO board VALUES (seq_board_num.nextval, '�ų����� �д缺 ����','���簡 �� �����Ǿ �ε��� �о������� �ǹ� ���簡 ���ʿ���..'
		,'EZEN',sysdate,0);
INSERT INTO board VALUES (seq_board_num.nextval, 'BoB���� �Խù��Դϴ�.','�ڹ� spring �� �������� ���θ� �ϰ��ֽ��ϴ�.'
		,'EZEN',sysdate,0);
COMMIT;

SELECT * FROM BOARD ORDER BY NUM DESC;

SELECT * FROM board WHERE title LIKE '%����%';

SELECT * FROM board WHERE CONTENT LIKE '%��%';

SELECT count(*) FROM board WHERE title LIKE '%����%';

SELECT count(*) FROM board WHERE CONTENT LIKE '%��%';


SELECT b.*,m.NAME FROM "MEMBER" m INNER JOIN BOARD b ON m.ID = b.ID 
WHERE num = 3
;

-- ��ȸ�� ����
UPDATE BOARD SET VISITCOUNT = VISITCOUNT +1 WHERE num = 1;
COMMIT;

-- �Խù� ����
UPDATE BOARD SET TITLE = '���ϵ� �˰��� ������ Ǯ�ڽ��ϴ�.', CONTENT = 'DP������ ������ �ϰڽ��ϴ�' WHERE NUM = 8;
COMMIT;

-- �Խù� ����
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
VALUES(seq_board_num.nextval, 'bob', 'bob�� �����ϱ�', '�ڹٿ� �������� �����ϰ��ֽ��ϴ�.', '0824' );
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob�� �����ϱ�2', '�ڹٿ� �������� �����ϰ��ֽ��ϴ�.2', '0824' );
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob�� �����ϱ�3', '�ڹٿ� �������� �����ϰ��ֽ��ϴ�.3', '0824' );
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob�� �����ϱ�4', '�ڹٿ� �������� �����ϰ��ֽ��ϴ�.4', '0824' );
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob�� �����ϱ�5', '�ڹٿ� �������� �����ϰ��ֽ��ϴ�.5', '0824' );
COMMIT;
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob�� �����ϱ�6', '�ڹٿ� �������� �����ϰ��ֽ��ϴ�.6', '0824' );
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob�� �����ϱ�7', '�ڹٿ� �������� �����ϰ��ֽ��ϴ�.7', '0824' );
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob�� �����ϱ�8', '�ڹٿ� �������� �����ϰ��ֽ��ϴ�.8', '0824' );
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob�� �����ϱ�9', '�ڹٿ� �������� �����ϰ��ֽ��ϴ�.9', '0824' );
INSERT INTO EZEN.MVCBOARD
(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(seq_board_num.nextval, 'bob', 'bob�� �����ϱ�10', '�ڹٿ� �������� �����ϰ��ֽ��ϴ�.10', '0824' );

SELECT id,pass,rownum FROM "MEMBER";

SELECT * FROM MVCBOARD ORDER BY IDX DESC ;

-- ����¡ ó�� ������

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
VALUES(seq_board_num.nextval, '������', 'test', '����', 'test.jpg', '20220621.jpg');


SELECT * FROM MVCBOARD WHERE IDX = '38';

UPDATE MVCBOARD SET VISITCOUNT = VISITCOUNT +1 WHERE idx= '35';

UPDATE MVCBOARD SET DOWNLOAD = DOWNLOAD  +1 WHERE idx= '38';







