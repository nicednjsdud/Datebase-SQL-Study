-- �μ����� �������� ������ �����ȣ, �����, �μ��ڵ�, �μ����� ����Ͻÿ�.

SELECT A.EMP_NO , A.EMP_NM , A.DEPT_CD , B.DEPT_NM 
FROM TB_EMP A JOIN TB_DEPT B ON A.DEPT_CD  = B.DEPT_CD
WHERE B.DEPT_NM = '������'; 

/*
 *  (�ּ�)���������� ���� = ���εǴ� ���̺� �� -1
 * 			1	   	 =	2 - 1
 * 			2	  	 =	3 - 1
 * 			3		 =	4 - 1 
 */

SELECT A.EMP_NO ,A.EMP_NM ,A.DEPT_CD ,B.DEPT_NM 
FROM TB_EMP A, TB_DEPT B
WHERE A.DEPT_CD = B.DEPT_CD AND B.DEPT_NM ='������';

-- INNER JOIN 
-- �ּҰ� ������ ������ �����ȣ, �����, �ּ�, �μ��ڵ�, �μ����� ����Ͻÿ�.

SELECT A.EMP_NO ,A.EMP_NM ,ADDR ,A.DEPT_CD ,B.DEPT_NM 
FROM TB_EMP A ,TB_DEPT B
WHERE A.DEPT_CD =B.DEPT_CD  AND A.ADDR LIKE '%����%';

SELECT A.EMP_NO ,A.EMP_NM ,A.ADDR ,A.DEPT_CD ,B.DEPT_NM 
FROM TB_EMP A JOIN TB_DEPT B ON A.DEPT_CD =B.DEPT_CD  
WHERE A.ADDR LIKE '%����%';

-- USING ��
-- �����̺��� ���������� ������ �ִ� �÷��� ������
SELECT A.EMP_NO ,A.EMP_NM ,ADDR ,DEPT_CD ,B.DEPT_NM 
FROM TB_EMP A JOIN TB_DEPT B USING (DEPT_CD)
WHERE A.ADDR LIKE '%����%';

-- �μ����� �������� ������ �����ȣ, �����, �μ��ڵ�, �μ���, �����ڰ��� �ڵ带 ����Ͻÿ�.

SELECT A.EMP_NO ,A.EMP_NM ,B.DEPT_CD ,B.DEPT_NM ,C.CERTI_CD 
FROM TB_EMP A, TB_DEPT B, TB_EMP_CERTI C
WHERE A.DEPT_CD = B.DEPT_CD AND A.EMP_NO = C.EMP_NO 
AND B.DEPT_NM ='������';

SELECT A.EMP_NO ,A.EMP_NM ,B.DEPT_CD ,B.DEPT_NM ,C.CERTI_CD 
FROM TB_EMP A JOIN TB_DEPT B ON A.DEPT_CD = B.DEPT_CD JOIN TB_EMP_CERTI C ON A.EMP_NO = C.EMP_NO 
WHERE  B.DEPT_NM ='������';

-- �ƿ��� ���� (ȯ�� ����)

INSERT INTO TB_DEPT VALUES ('100014','4�����������','999999');
INSERT INTO TB_DEPT VALUES ('100015','����Ʈ�ڷγ���','999999');
COMMIT;

-- ���� ���Ἲ ���� ����(FK) ��� DROP 
ALTER TABLE EZEN.TB_EMP DROP CONSTRAINT FK_TB_EMP;

INSERT INTO EZEN.TB_EMP T (T.EMP_NO,T.EMP_NM,T.BIRTH_DE,T.SEX_CD,
T.ADDR,T.TEL_NO,T.DIRECT_MANAGER_EMP_NO , T.FINAL_EDU_SE_CD, T.SAL_TRANS_BANK_CD, 
T.SAL_TRANS_ACCNT_NO, T.DEPT_CD,T.LUNAR_YN)
VALUES ('1000000041','�̼���','19811201','1','��⵵ ���ν� ������ ���� 1�� 43',
'010-5555-4444',NULL,'006','003','114-554-223289','000000','N');
  
INSERT INTO EZEN.TB_EMP T (T.EMP_NO,T.EMP_NM,T.BIRTH_DE,T.SEX_CD,
T.ADDR,T.TEL_NO,T.DIRECT_MANAGER_EMP_NO , T.FINAL_EDU_SE_CD, T.SAL_TRANS_BANK_CD, 
T.SAL_TRANS_ACCNT_NO, T.DEPT_CD,T.LUNAR_YN)
VALUES ('1000000042','�����','19820402','1','��⵵ ����� ������ ���� 1�� 43',
'010-5557-4445',NULL,'004','001','110-554-223244','000000','Y');

INSERT INTO EZEN.TB_EMP T (T.EMP_NO,T.EMP_NM,T.BIRTH_DE,T.SEX_CD,
T.ADDR,T.TEL_NO,T.DIRECT_MANAGER_EMP_NO , T.FINAL_EDU_SE_CD, T.SAL_TRANS_BANK_CD, 
T.SAL_TRANS_ACCNT_NO, T.DEPT_CD,T.LUNAR_YN)
VALUES ('1000000043','������','19850611','1','��⵵ ����� ������ ���� 1�� 433',
'010-4421-4314',NULL,'004','001','314-554-223289','000000','N');

INSERT INTO EZEN.TB_EMP T (T.EMP_NO,T.EMP_NM,T.BIRTH_DE,T.SEX_CD,
T.ADDR,T.TEL_NO,T.DIRECT_MANAGER_EMP_NO , T.FINAL_EDU_SE_CD, T.SAL_TRANS_BANK_CD, 
T.SAL_TRANS_ACCNT_NO, T.DEPT_CD,T.LUNAR_YN)
VALUES ('1000000044','�Ż��Ӵ�','19711201','2','��⵵ ���ν� ���۱� ���� 1�� 43',
'010-5154-4343',NULL,'004','003','114-514-243289','000000','N');

INSERT INTO EZEN.TB_EMP T (T.EMP_NO,T.EMP_NM,T.BIRTH_DE,T.SEX_CD,
T.ADDR,T.TEL_NO,T.DIRECT_MANAGER_EMP_NO , T.FINAL_EDU_SE_CD, T.SAL_TRANS_BANK_CD, 
T.SAL_TRANS_ACCNT_NO, T.DEPT_CD,T.LUNAR_YN)
VALUES ('1000000045','������','19970327','1','��⵵ ȭ���� ������ ���� 1�� 43',
'010-6242-9703',NULL,'004','001','143-124-223289','000000','N');

COMMIT;

-- LEFT OUTER ����
-- ���� �μ� �Ҽӿܾ� ���� ���� �����鵵 ����
-- TB_EMP(LEFT)�� �� ������ TB_DEPT�� ��Ī�Ǵ� �͸� ������ ��.
SELECT A.EMP_NO , A.EMP_NM , A.DEPT_CD ,B.DEPT_NM 
FROM TB_EMP A, TB_DEPT B
WHERE A.DEPT_CD IN('100000','000000','100001')
AND A.DEPT_CD = B.DEPT_CD(+);

-- RIGHT OUTER ����
-- ���� �ƹ��� ����� ������ ���� ���� �μ��� ��� ����Ͻÿ�.
-- TB_DEPT(RIGHT)�� ��� ������ TB_EMP�� ��Ī�Ǵ� ���ո� ��¸� ��µ�
SELECT A.EMP_NO ,A.EMP_NM ,B.DEPT_CD ,B.DEPT_NM 
FROM TB_EMP A,TB_DEPT B
WHERE B.DEPT_CD IN ('100014','100015','100001')
AND A.DEPT_CD(+) = B.DEPT_CD; 

-- ANSI ���� ��� (RIGHT OUTER JOIN)

SELECT A.EMP_NO , A.EMP_NM ,B.DEPT_CD ,B.DEPT_NM 
FROM TB_EMP A
RIGHT OUTER JOIN TB_DEPT B 
ON (A.DEPT_CD=B.DEPT_CD)
WHERE B.DEPT_CD IN ('100014','100015','100001');

-- FULL OUTER ����
SELECT A.EMP_NO ,A.EMP_NM ,B.DEPT_CD ,B.DEPT_NM 
FROM TB_EMP A
FULL OUTER JOIN TB_DEPT B ON (A.DEPT_CD=B.DEPT_CD)
WHERE 1 = 1
AND ( A.EMP_NO IS NULL OR B.DEPT_CD IS NULL)
ORDER BY B.DEPT_CD DESC,A.EMP_NO DESC;



-- ANSI ���� ��� (LEFT OUTER JOIN)

SELECT A.EMP_NO , A.EMP_NM , A.DEPT_CD ,B.DEPT_NM 
FROM TB_EMP A
LEFT OUTER JOIN TB_DEPT B 
ON (A.DEPT_CD=B.DEPT_CD)
WHERE A.DEPT_CD IN('100000','100001');

-- ������ ���� �� ���� ���� �缳��

DELETE FROM TB_DEPT td WHERE DEPT_CD IN ('100014','100015');
DELETE FROM TB_EMP WHERE EMP_NO IN('1000000041','1000000042','1000000043','1000000044','1000000045');
COMMIT;
SELECT * FROM TB_DEPT;

INSERT INTO TB_DEPT VALUES('100001','�����','999999');
COMMIT;

ALTER TABLE EZEN.TB_EMP  ADD CONSTRAINT FK_TB_EMP FOREIGN KEY (DEPT_CD) REFERENCES EZEN.TB_DEPT (DEPT_CD);




























