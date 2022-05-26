--

SELECT LEVEL LVL, LPAD(' ',4*(LEVEL-1)) || EMP_NO || '(' || EMP_NM || ')' AS "�����ο�",
		A.DEPT_CD ,B.DEPT_NM, CONNECT_BY_ISLEAF 
FROM TB_EMP A, TB_DEPT B
WHERE A.DEPT_CD = B.DEPT_CD 
START WITH A.DIRECT_MANAGER_EMP_NO IS NULL -- ������ �����ȣ�� ���� ���� ���� ������ ��
CONNECT BY PRIOR A.EMP_NO = A.DIRECT_MANAGER_EMP_NO ;

-- L�е�
SELECT 30,LPAD(30,5),LPAD(30,5,'0'),LPAD(30,5,'A')
FROM DUAL;

-- ���� ����
-- EMP_NO�� "1000000005"�� ���� ���� ������ ��ȸ�ϴ� SQL���� �ۼ��Ͻÿ�.


SELECT A.EMP_NO , A.EMP_NM , A.DEPT_CD 
FROM TB_EMP A
WHERE A.DEPT_CD = (SELECT A.DEPT_CD  FROM TB_EMP A WHERE A.EMP_NO = '1000000005'); 

-- TB_EMP, TB_SAL_HIS
-- 2020�� 5�� ���� ��� �̻��� �޿��� �ް� �ִ� �������� ����Ʈ�� ����Ͻÿ�.

SELECT B.EMP_NO ,B.EMP_NM , A.PAY_DE ,A.PAY_AMT 
FROM TB_SAL_HIS A JOIN TB_EMP B ON A.EMP_NO =B.EMP_NO 
WHERE A.PAY_DE ='20200525' AND A.PAY_AMT 
>= (SELECT AVG(D.PAY_AMT) FROM TB_SAL_HIS D WHERE D.PAY_DE = '20200525'); 

--  ��������
SELECT AVG(A.PAY_AMT)
FROM TB_SAL_HIS A 
WHERE A.PAY_DE LIKE '20200525';

-- �ѱ������ͺ��̽���������� �߱��� �ڰ��� ������ �ִ� 
-- ��� ��ȣ �� ���� �ڰ��� ������ ����Ͻÿ�.

SELECT A.EMP_NO , COUNT(*)
FROM TB_EMP_CERTI A
WHERE A.CERTI_CD IN 
(SELECT C.CERTI_CD 
FROM TB_CERTI C 
WHERE C.ISSUE_INSTI_NM = '�ѱ������ͺ��̽������')
GROUP BY A.EMP_NO 
ORDER BY A.EMP_NO DESC;

-- ��������
SELECT C.CERTI_CD 
FROM TB_CERTI C 
WHERE C.ISSUE_INSTI_NM = '�ѱ������ͺ��̽������';
















