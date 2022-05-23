-- ����� �� ���� ������ ���� ����� ��������� ������� �׸��� �� ������� ǥ���Ͻÿ�.

SELECT MAX(BIRTH_DE), MIN(BIRTH_DE), COUNT(*)  
FROM EZEN.TB_EMP ;

-- ��� �� �μ��ڵ� �� ���� ���� ����, ���� ���� ����, ���� ���� �����Ͻÿ�

SELECT A.DEPT_CD ,(SELECT B.DEPT_NM FROM TB_DEPT B WHERE B.DEPT_CD = A.DEPT_CD) AS DEPT_NM ,MAX(A.BIRTH_DE) AS "���� ���� �������", MIN(A.BIRTH_DE) AS "���� ���� �������", COUNT(*) AS ������
FROM TB_EMP A
GROUP BY A.DEPT_CD 
ORDER BY A.DEPT_CD ;

-- ��� �� �μ��ڵ� �� ���� ���� ����, ���� ���� ����, ���� ���� �����Ͻÿ�
-- �� �μ��� �������� 3���� �ʰ��ϴ� �μ�
-- (DEPT_CD, DEPT_NM, ���� ���� �������,���� ���� �������)

SELECT A.DEPT_CD ,(SELECT B.DEPT_NM FROM TB_DEPT B WHERE B.DEPT_CD = A.DEPT_CD) AS DEPT_NM ,MAX(A.BIRTH_DE) AS "���� ���� �������", MIN(A.BIRTH_DE) AS "���� ���� �������", COUNT(*) AS ������
FROM TB_EMP A
GROUP BY A.DEPT_CD 
HAVING (COUNT(*)>3)
ORDER BY A.DEPT_CD ;

-- 2019�⵵�� �޿� ���� �߿��� ���� ���� ��� �޿����� 470���� �̻��� ��������
-- ������ȣ, ������, �ִ�޿��׼�, �ּұ޿��׼� , ��� �޿� �׼��� ����Ͻÿ�.

SELECT A.EMP_NO AS "������ȣ",
	   (SELECT B.EMP_NM  FROM TB_EMP B WHERE A.EMP_NO=B.EMP_NO) AS "������",
	   MAX(A.PAY_AMT) AS "�ִ�޿��׼�",
	   MIN(A.PAY_AMT) AS "�ּұ޿��׼�",
	    AVG(A.PAY_AMT) AS "��ձ޿��׼�" 
FROM TB_SAL_HIS A
WHERE A.PAY_DE BETWEEN '20190101' AND '20191231'
GROUP BY A.EMP_NO  
HAVING  round(AVG(A.PAY_AMT),2) >= 4700000
ORDER BY A.EMP_NO ;

-- 2019�⵵�� �޿� ���� �� �޿��� �հ�(����)�� 5500������ �ʰ��ϴ� ������ 
-- ������ȣ, ������, �հ�ݿ����� ����Ͻÿ�.

SELECT A.EMP_NO AS "������ȣ",
		(SELECT E.EMP_NM  FROM TB_EMP E WHERE A.EMP_NO = E.EMP_NO) AS "������",
		SUM(A.PAY_AMT) AS "�հ�޿���"
FROM TB_SAL_HIS A
WHERE A.PAY_DE  BETWEEN '20190101' AND '20191231'
HAVING SUM(A.PAY_AMT) > 55000000
GROUP BY A.EMP_NO 
ORDER BY SUM(A.PAY_AMT)  DESC;

-- CASE WHEN
SELECT 
		SUM(CASE WHEN A.BIRTH_DE LIKE '195%' THEN 1 ELSE 0 END) AS "1950����",
		SUM(CASE WHEN A.BIRTH_DE LIKE '196%' THEN 1 ELSE 0 END) AS "1960����",
		SUM(CASE WHEN A.BIRTH_DE LIKE '197%' THEN 1 ELSE 0 END) AS "1970����",
		SUM(CASE WHEN A.BIRTH_DE LIKE '198%' THEN 1 ELSE 0 END) AS "1980����",
		SUM(CASE WHEN A.BIRTH_DE LIKE '199%' THEN 1 ELSE 0 END) AS "1990����",
		COUNT(*) AS CNT
FROM TB_EMP A
;

-- �μ��� �������� �� �ʳ�� �������� ���� ī��Ʈ�� ǥ���Ͻÿ�.
-- �μ���ȣ, �μ���, 1950����,,,,, CNT

SELECT A.DEPT_CD AS "�μ���ȣ", (SELECT B.DEPT_NM  FROM TB_DEPT B WHERE A.DEPT_CD=B.DEPT_CD) AS �μ���,
		SUM(CASE WHEN A.BIRTH_DE LIKE '195%' THEN 1 ELSE 0 END) AS "1950����",
		SUM(CASE WHEN A.BIRTH_DE LIKE '196%' THEN 1 ELSE 0 END) AS "1960����",
		SUM(CASE WHEN A.BIRTH_DE LIKE '197%' THEN 1 ELSE 0 END) AS "1970����",
		SUM(CASE WHEN A.BIRTH_DE LIKE '198%' THEN 1 ELSE 0 END) AS "1980����",
		SUM(CASE WHEN A.BIRTH_DE LIKE '199%' THEN 1 ELSE 0 END) AS "1990����",
		COUNT(*) AS CNT
FROM TB_EMP A 
GROUP BY A.DEPT_CD 
ORDER BY A.DEPT_CD ;

-- �ڰ������� �������� �����Ͻÿ�.

SELECT a.CERTI_CD ,a.CERTI_NM ,a.ISSUE_INSTI_NM 
FROM TB_CERTI a
ORDER BY a.CERTI_NM DESC 
;

SELECT a.CERTI_CD ,a.CERTI_NM AS name ,a.ISSUE_INSTI_NM 
FROM TB_CERTI a
ORDER BY name 
;

-- select ���� �������� �ʴ� �÷����� ���� ����
SELECT a.CERTI_CD , a.ISSUE_INSTI_NM 
FROM tb_certi a
ORDER BY a.CERTI_NM DESC ;





























