-- ����� �� ���� ������ ���� ����� ��������� ������� �׸��� �� ������� ǥ���Ͻÿ�.

SELECT MAX(BIRTH_DE), MIN(BIRTH_DE), COUNT(*)  
FROM EZEN.TB_EMP ;

-- ��� �� �μ��ڵ� �� ���� ���� ����, ���� ���� ����, ���� ���� �����Ͻÿ�

SELECT A.DEPT_CD ,(SELECT B.DEPT_NM FROM TB_DEPT B WHERE B.DEPT_CD = A.DEPT_CD) AS DEPT_NM ,MAX(A.BIRTH_DE) AS "���� ���� �������", MIN(A.BIRTH_DE) AS "���� ���� �������", COUNT(*) AS ������
FROM TB_EMP A
GROUP BY A.DEPT_CD 
ORDER BY A.DEPT_CD ;