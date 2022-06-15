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






