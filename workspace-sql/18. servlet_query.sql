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