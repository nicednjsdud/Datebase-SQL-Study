-- ���տ� �Ϻκи� ���
-- PAY_DE(��������) ������ �����ϴ� ���տ��� 10�Ǹ� ���� ���,
-- �� 10���� ��� ����� PAY-AMT�� �������� ������.

SELECT A.SAL_HIS_NO , A.PAY_DE , A.PAY_AMT , A.EMP_NO 
FROM EZEN.TB_SAL_HIS A
WHERE A.PAY_DE >= '20200501' AND A.PAY_DE <= '20200531' 
ORDER BY A.PAY_AMT DESC ;		-- ��������

-- PAY_DE ������ �����ϴ� ���տ��� PAY_AMT �������� �������� ������ ���� �� ���� 10�Ǹ� ���
SELECT A.SAL_HIS_NO , A.PAY_DE , A.PAY_AMT , A.EMP_NO 
FROM (
		SELECT A.SAL_HIS_NO , A.PAY_DE , A.PAY_AMT , A.EMP_NO 
		FROM EZEN.TB_SAL_HIS A
		WHERE A.PAY_DE >= '20200501' AND A.PAY_DE <='20200531'
		ORDER BY A.PAY_AMT DESC
	 ) A
WHERE ROWNUM <=10;

-- ������ ������ �Լ�

SELECT LOWER('Oracle Server, SQL Develper') AS "LOWER('�ҹ��ڷ� ��ȯ')",
	   UPPER('Oracle Server, SQL Develper') AS "UPPER('�빮�ڷ� ��ȯ')",
	   ASCII('A') AS "ASCII('�ƽ�Ű�ڵ尪 ���')",
	   CONCAT('SQL','Develper') AS "CONCAT('���ڿ� ����')",
	   SUBSTR('SQL Develper',1,3) AS "SUBSTR('���ڿ� �߶󳻱�')" ,
	   LENGTH('SQL') AS "LENGTH('���ڿ��� ���� ���')",
	   LTRIM(' SQL') AS "LTRIM('���� ������ ����')",
	   RTRIM('SQL ') AS "RTRIM('������ ������ ����')"
FROM DUAL;

-- ������ ������ �Լ�

SELECT ABS(-15) AS "ABS('���밪�� ��ȯ')",
	   SIGN(10) AS "SIGN('����� ��� 1 ������ ��� -1, 0�� ��� 0 ��ȯ')",
	   MOD(8,3) AS "MOD('������ ��ȯ')",
	   CEIL(38.678) AS "CEIL('������ �ø�')",
	   FLOOR(38.678) AS "FLOOR('������ ����')",
	   ROUND(38.678,2) AS "ROUND('�Ҽ��� 2��° �ڸ����� �ݿø�')",
	   TRUNC(38.678) AS "TRUNC('0�� �ڸ����� ������ �ڸ�')",
	   TRUNC(38.678,1) AS "TRUNC('1�� �ڸ����� ������ �ڸ�')"
FROM DUAL;

-- ��¥�� ������ ��ȯ�Լ�

SELECT SYSDATE AS "SYSDATE",	-- ���� ����Ͻú��� ���
	   EXTRACT(YEAR FROM SYSDATE) AS "EXTRACT(YEAR FROM SYSDATE)", --�����
	   EXTRACT(MONTH FROM SYSDATE) AS "EXTRACT(MONTH FROM SYSDATE)", -- �����
	   EXTRACT(DAY FROM SYSDATE) AS "EXTRACT(DAY FROM SYSDATE)",	-- �� ���	   
	   TO_CHAR(SYSDATE, 'YYYY') AS "TO_CHAR(SYSDATE, 'YYYY')",		-- ����� (���ڿ�)
	   TO_CHAR(SYSDATE, 'MM') AS "TO_CHAR(SYSDATE, 'MM')",			-- �� ���(���ڿ�)
	   TO_CHAR(SYSDATE, 'DD') AS "TO_CHAR(SYSDATE, 'DD)",			-- �� ���(���ڿ�)
	   TO_CHAR(SYSDATE, 'HH24') AS "TO_CHAR(SYSDATE, 'HH24')",		-- �� ���(���ڿ�)	  
	   TO_CHAR(SYSDATE, 'MI') AS "TO_CHAR(SYSDATE, 'MI')",			-- �� ���(���ڿ�)
	   TO_CHAR(SYSDATE, 'SS') AS "TO_CHAR(SYSDATE, 'S')",			-- �� ���(���ڿ�)
	   TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) AS "TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))",
	   TO_NUMBER(TO_CHAR(SYSDATE,'MM')) AS "TO_NUMBER(TO_CHAR(SYSDATE,'MM'))",
	   TO_NUMBER(TO_CHAR(SYSDATE,'DD')) AS "TO_NUMBER(TO_CHAR(SYSDATE,'DD'))",
	   TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) AS "TO_NUMBER(TO_CHAR(SYSDATE,'HH24'))",
	   TO_NUMBER(TO_CHAR(SYSDATE, 'MI')) AS "TO_NUMBER(TO_CHAR(SYSDATE, ''MI'))",
	   TO_NUMBER(TO_CHAR(SYSDATE, 'SS')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'SS'))"
FROM DUAL;

-- ��¥�� ������ ����

SELECT SYSDATE AS "SYSDATE",			-- ����ð�
	   SYSDATE -1 AS "SYSDATE-1",		-- 1���� �� �ð�
	   SYSDATE -7 AS "SYSDATE-7",		-- 7���� �� �ð�
	   SYSDATE - (1/24) "SYSDATE - (1/24)",--1�ð� ��
	   SYSDATE - (1/24/60) "SYSDATE - (1/24/60)",	--1����
	   SYSDATE - (1/24/60/60) "SYSDATE -(1/24/60/60)", --1����
	   SYSDATE - (1/24/60/60)*10 "SYSDATE -(1/24/60/60)*10" --10����
FROM DUAL;

-- ������ ��ȯ�� ����
/*
 *  1) �Ͻ��� �� ��ȯ : DBMS�� �ڵ����� ������ ������ ��ȯ�ϴ� ���
 *  2) ����� �� ��ȯ : ������ ��ȯ �� �Լ��� ������ ������ ��ȯ�ϵ��� ������ִ� ���
 */

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS "TO_CHAR(SYSDATE, 'YYYY/MM/DD')",
	   TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') "TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS')",
	   TO_CHAR(10.25, '$999,999,999.99') AS "TO_CHAR(SYSDATE, '$999,999,999.99')",
	   TO_CHAR(12500, 'L999,999,999.99') AS "TO_CHAR(12500, 'L999,999,999.99')",
	   TO_NUMBER('100')+TO_NUMBER('100') AS "TO_NUMBER('100')+TO_NUMBER('100')" 
FROM DUAL ;

/*
 *  CASE WHEN ����
 * 		THEN �� Ȥ�� SQL��
 * 		ELSE �� Ȥ�� SQL��
 * 	END
 * 
 *  : ������ ������ THEN�� �����ϰ� �׷��� ������ ELSE���� �����Ѵ�.
 */


SELECT CASE WHEN SAL_CD = '100001' THEN '�⺻��'
			WHEN SAL_CD = '100002' THEN '�󿩱�'
			WHEN SAL_CD = '100003' THEN 'Ư���󿩱�'
			WHEN SAL_CD = '100004' THEN '�߱ټ���'
			WHEN SAL_CD = '100005' THEN '�ָ�����'
			WHEN SAL_CD = '100006' THEN '���ĽĴ�'
			WHEN SAL_CD = '100007' THEN '��������Ʈ'
			ELSE '��ȿ���� ����'
END SAL_NM 
FROM EZEN.TB_SAL;

/*
 *	DECODE(ǥ���� Ȥ�� �����÷�, �񱳰�1, �����1, �񱳰�2, �����2, ����Ʈ �� )
 *	
 *  : ǥ���� Ȥ�� �����÷��� ���Ͽ� �񱳰�1�� ������ �����1 ����ϰ�,
 *    ǥ���� Ȥ�� �����÷��� ���Ͽ� �񱳰�2�� ������ �����2 ����ϰ�, �׷���������
 *    ����Ʈ ���� ����� ����Ѵ�.
 */
SELECT DECODE(EZEN.TB_SAL.SAL_CD, '100001', '�⺻��2','100002','�󿩱�', '��Ÿ')
FROM EZEN.TB_SAL;

-- �ΰ��� �Լ� ���
SELECT NVL(DIRECT_MANAGER_EMP_NO, '�ֻ�����')	-- ���ӻ�������ȣ�� NULL�̸� "�ֻ�����"�� ���
FROM EZEN.TB_EMP
WHERE DIRECT_MANAGER_EMP_NO IS NULL;


-- �ֻ����μ�
SELECT NVL(A.UPPER_DEPT_CD, '�ֻ����μ�') AS �����μ�
FROM EZEN.TB_DEPT A
WHERE A.UPPER_DEPT_CD IS NULL;

-- MAX�Լ��� ���� �������� ��쿡�� �Ѱ��� ROW�� ����.
SELECT NVL(MAX(EMP_NM),'�������') AS EMP_NM
FROM EZEN.TB_EMP A
WHERE A.EMP_NM = '������';







