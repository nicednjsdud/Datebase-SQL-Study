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


-- ���� ����
-- �� �μ��� 2�� �̻� �ִ� �μ��߿��� �� �μ��� ���ϱ��� ���̰� ���� ���� ����� ����Ͻÿ�.
-- emp_no, emp_name, dept_cd, dept_nm, birth_de

SELECT A.EMP_NO , A.EMP_NM , B.DEPT_CD ,B.DEPT_NM ,A.BIRTH_DE 
FROM TB_EMP A , TB_DEPT B 
WHERE (A.DEPT_CD,A.BIRTH_DE) IN 
(
SELECT K.DEPT_CD , MIN(K.BIRTH_DE) AS MIN_BIRTH_DE
FROM EZEN.TB_EMP K
GROUP BY K.DEPT_CD 
HAVING COUNT(*) > 1
)
AND A.DEPT_CD =B.DEPT_CD 
ORDER BY A.EMP_NO 
;
-- ��������
SELECT K.DEPT_CD , MIN(K.BIRTH_DE) AS MIN_BIRTH_DE
FROM EZEN.TB_EMP K
GROUP BY K.DEPT_CD 
HAVING COUNT(*) > 1;

-- ������ �� �ּҰ� ������ ������ �Ҽӵ� �μ��ڵ�� �μ����� ����Ͻÿ�.
-- EXISTS�� ��������

SELECT A.DEPT_CD , A.DEPT_NM 
FROM TB_DEPT A 
WHERE EXISTS 
(
SELECT  1
FROM TB_EMP K
WHERE K.DEPT_CD = A.DEPT_CD 
AND K.ADDR LIKE '%����%'
)
;

-- �ѱ������ͺ��̽���������� �߱��� �ڰ����� ������ �ִ� �����
-- �����ȣ, �����, �ڰ��� �ڵ�, �ڰ������� ����Ͻÿ�.
-- ��Į�� �������� 
SELECT A.EMP_NO , ( SELECT M.EMP_NM  FROM TB_EMP M WHERE M.EMP_NO=A.EMP_NO) AS EMP_NM 
						, A.CERTI_CD , ( SELECT L.CERTI_NM  FROM TB_CERTI L WHERE A.CERTI_CD =L.CERTI_CD) 
FROM TB_EMP_CERTI A
WHERE A.CERTI_CD  IN 
(
SELECT K.CERTI_CD 
FROM TB_CERTI K
WHERE K.ISSUE_INSTI_NM = '�ѱ������ͺ��̽������'
)
ORDER BY EMP_NO  ;
;
SELECT K.CERTI_CD 
FROM TB_CERTI K
WHERE K.ISSUE_INSTI_NM = '�ѱ������ͺ��̽������'
;

-- �ѱ������ͺ��̽���������� �߱��� �ڰ����� ������ �ִ� �����
-- �����ȣ, �����, �ڰ��� �ڵ�, �ڰ������� ����Ͻÿ�.
-- �ζ��� �� ���


FROM(
	SELECT K.CERTI_CD 
	FROM TB_CERTI K
	WHERE K.ISSUE_INSTI_NM = '�ѱ������ͺ��̽� �����'
) A
,TB_EMP_CERTI B
WHERE A.CERTI

CREATE VIEW V_TB_SAL_HIS_MAX_BY_EMP_NO AS 
SELECT A.EMP_NO , A.EMP_NM , B.DEPT_CD ,B.DEPT_NM ,MAX(C.PAY_AMT) AS MAX_PAY_AMT 
FROM TB_EMP A, TB_DEPT B, TB_SAL_HIS C
WHERE A.EMP_NO = C.EMP_NO  AND A.DEPT_CD = B.DEPT_CD 
GROUP BY A.EMP_NO , A.EMP_NM , B.DEPT_CD , B.DEPT_NM 
;
SELECT *
FROM V_TB_SAL_HIS_MAX_BY_EMP_NO 
;

DROP VIEW V_TB_SAL_HIS_MAX_BY_EMP_NO ;

SELECT * FROM T_MEMBER ORDER BY JOINDATE DESC;























