/*
 * �� ���̺� �� ���̵� strawberry, ���̸��� ������,
 * ���̰� 30��, ����� vip, ������ ������, �������� 100���� 
 * ���ο� ���� ������ �����Ͻÿ�.
 * �׷� ���� �� ���̺��� ��� ������ �˻��Ͽ� ���� �߰��� ������ Ȯ���Ͻÿ�.
 */

INSERT INTO �� 
VALUES ('strawberry', '������', 30, 'vip', '������', 100); 
COMMIT;

INSERT INTO �� (�����̵�, ���̸�, ���)
VALUES ('strawberry', '������', 'vip');
COMMIT;

SELECT * FROM ��;

DELETE FROM ��;
COMMIT;

-- �� ���̺� Ʃ�� ����
INSERT INTO �� VALUES ('apple', '����ȭ', 20, 'gold', '�л�', 1000); 
INSERT INTO �� VALUES ('banana', '�輱��', 25, 'vip', '��ȣ��', 2500); 
INSERT INTO �� VALUES ('carrot', '���', 28, 'gold', '����', 4500); 
INSERT INTO �� VALUES ('orange', '����', 22, 'silver', '�л�', 0); 
INSERT INTO �� VALUES ('melon', '������', 35, 'gold', 'ȸ���', 5000); 
INSERT INTO �� VALUES ('peach', '������', null, 'silver', '�ǻ�', 300); 
INSERT INTO �� VALUES ('pear', 'ä����', 31, 'silver', 'ȸ���', 500); 
commit;

-- ��ǰ ���̺� Ʃ�� ����
insert into ��ǰ values ('p01','�׳ɸ���', 5000, 4500, '���ѽ�ǰ');
insert into ��ǰ values ('p02','�ſ��̸�', 2500, 5500, '�α�Ǫ��');
insert into ��ǰ values ('p03','��������', 3600, 2600, '�Ѻ�����');
insert into ��ǰ values ('p04','�������ݸ�', 1250, 2500, '�Ѻ�����');
insert into ��ǰ values ('p05','��ū���', 2200, 1200, '���ѽ�ǰ');
insert into ��ǰ values ('p06','����쵿', 1000, 1550, '�α�Ǫ��');
insert into ��ǰ values ('p07','���޺�Ŷ', 1650, 1500, '�Ѻ�����');
commit;

select * from ��ǰ;

-- �ֹ� ���̺� Ʃ�� ����
insert into �ֹ� values ('o01', 'apple', 'p03', 10, '����� ������', '19/01/01');
insert into �ֹ� values ('o02', 'melon', 'p01', 5, '��õ�� ��籸', '19/01/01');
insert into �ֹ� values ('o03', 'banana', 'p06', 45, '��⵵ ��õ��', '19/01/11');
insert into �ֹ� values ('o04', 'carrot', 'p02', 8, '�λ�� ������', '19/02/01');
insert into �ֹ� values ('o05', 'melon', 'p06', 36, '��⵵ ���ν�', '19/02/20');
insert into �ֹ� values ('o06', 'banana', 'p01', 19, '��û�ϵ� ������', '19/03/02');
insert into �ֹ� values ('o07', 'apple', 'p03', 22, '����� ��������', '19/03/15');
insert into �ֹ� values ('o08', 'pear', 'p02', 50, '������ ��õ��', '19/04/10');
insert into �ֹ� values ('o09', 'banana', 'p04', 15, '���󳲵� ������', '19/04/11');
insert into �ֹ� values ('o10', 'carrot', 'p03', 20, '��⵵ �Ⱦ��', '19/05/22');
commit;

select * from �ֹ�;

/*
    ��ǰ ���̺��� ��ǰ��ȣ�� p03�� ��ǰ�� ��ǰ���� ��ū���̷� �����Ͻÿ�.
*/
UPDATE ��ǰ
SET ��ǰ�� = '��ū����'
WHERE ��ǰ��ȣ = 'p03';

SELECT * FROM ��ǰ;

/*
    ��ǰ ���̺� �ִ� ��� ��ǰ�� �ܰ��� 10% �λ��Ͻÿ�.
    �׷� ���� ��ǰ ���̺��� ��� ������ �˻��Ͽ� �λ� ������ Ȯ���Ͻÿ�.
*/
update ��ǰ
set �ܰ� = �ܰ� * 1.1;

SELECT * FROM ��ǰ;

/*
    �ֹ� ���̺��� ����ȭ ���� �ֹ��� ��ǰ�� �ֹ����� 5���� �����Ͻÿ�.
    �׷� ���� �ֹ� ���̺��� ��� ������ �˻��Ͽ� ���� ������ Ȯ���Ͻÿ�.
*/

UPDATE �ֹ� 
SET ���� = 5
WHERE �ֹ��� IN (   SELECT �����̵�
					FROM ��
					WHERE ���̸�='����ȭ'		
				);
COMMIT;

			
SELECT * FROM �ֹ�;
			
SELECT �����̵�
FROM ��
WHERE ���̸�='����ȭ'
;

/*
 * �ֹ� ���̺��� �ֹ����ڰ� 2019�� 5�� 22���� �ֹ������� �����Ͻÿ�.
 * �׷� ���� �ֹ� ���̺��� ��� ������ �˻��Ͽ� ���� ���θ� Ȯ���Ͻÿ�.
 */

DELETE FROM �ֹ� 
WHERE �ֹ����� = '2019-05-22';

SELECT * FROM �ֹ�;



/*
    �ֹ� ���̺��� ����ȭ ���� �ֹ��� ������ �ֹ� ���̺��� �����Ͻÿ�.
    �׷� ���� �ֹ� ���̺��� ��� ������ �˻��Ͽ� ���� ������ Ȯ���Ͻÿ�.
*/

DELETE FROM �ֹ�
WHERE �ֹ��� IN (SELECT �����̵�
				FROM ��
				WHERE ���̸�='����ȭ');

SELECT * FROM �ֹ�;		


DELETE FROM �ֹ�;





