-- 1
ALTER TABLE TB_EMP ADD HEAD_WORK_YN CHAR(1);

-- 2

SELECT A.EMP_NO , (SELECT B.EMP_NM  FROM TB_EMP B WHERE B.EMP_NO=A.EMP_NO) , AVG(A.PAY_AMT)
FROM EZEN.TB_SAL_HIS A
WHERE A.PAY_DE BETWEEN '20190101' AND '20191231'
GROUP BY A.EMP_NO 
HAVING AVG(A.PAY_AMT) >= 4500000
ORDER BY A.EMP_NO ;

-- 3

SELECT A.EMP_NO AS "사원번호",A.EMP_NM AS "사원명",A.ADDR AS "주소"
	,A.DEPT_CD AS "부서코드",C.DEPT_CD AS 부서명, B.CERTI_CD AS "자격증 코드"
FROM TB_EMP A JOIN TB_EMP_CERTI B ON A.EMP_NO =B.EMP_NO JOIN TB_DEPT C ON C.DEPT_CD =A.DEPT_CD 
WHERE A.ADDR LIKE '%수원%';

-- 4

SELECT A.EMP_NO AS "사원번호", A.EMP_NM AS "사원명", A.DEPT_CD AS "부서코드",
	B.DEPT_NM AS "부서명", C.CERTI_SN AS "보유자격증 코드", D.CERTI_NM AS "자격증명"
FROM TB_EMP A JOIN TB_DEPT B ON A.DEPT_CD  =B.DEPT_CD 
	JOIN TB_EMP_CERTI C ON A.EMP_NO =C.EMP_NO JOIN TB_CERTI D ON D.CERTI_CD = C.CERTI_CD 
WHERE B.DEPT_NM = '지원팀';

-- 5

SELECT A.CERTI_CD AS "CODE", A.CERTI_NM ,A.ISSUE_INSTI_NM AS "ISSUE"
FROM TB_CERTI A
ORDER BY ISSUE DESC, CODE ASC;

-- 7

SELECT A.EMP_NO , A.EMP_NM ,B.UPPER_DEPT_CD 
FROM TB_EMP A
LEFT OUTER JOIN TB_DEPT B ON A.DEPT_CD =B.DEPT_CD 
WHERE B.UPPER_DEPT_CD  IS NULL;

-- 8

SELECT A.SAL_HIS_NO AS "급여내역번호", A.PAY_DE AS "지급일자",
		A.PAY_AMT AS "지급금액", A.EMP_NO AS "사원번호"
FROM TB_SAL_HIS A
WHERE A.PAY_AMT / 3000 >= 5;

-- 9
SELECT A.DEPT_CD , ROUND(AVG(B.PAY_AMT),2) AS "평균값"
FROM TB_EMP A JOIN TB_SAL_HIS B ON A.EMP_NO =B.EMP_NO 
GROUP BY A.DEPT_CD 
ORDER BY ROUND(AVG(B.PAY_AMT),2)  DESC;

-- 10
SELECT A.DEPT_CD  ,COUNT(*)
FROM TB_EMP A
GROUP BY A.DEPT_CD 
HAVING (COUNT(*)>=3)
ORDER BY A.DEPT_CD ;










