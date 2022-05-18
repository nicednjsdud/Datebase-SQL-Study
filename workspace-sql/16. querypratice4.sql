-- 사원들 중 가장 생일이 늦은 사원과 빠른사원의 생년월일 그리고 총 사원수를 표시하시오.

SELECT MAX(BIRTH_DE), MIN(BIRTH_DE), COUNT(*)  
FROM EZEN.TB_EMP ;

-- 사원 중 부서코드 별 가장 늦은 생일, 가장 빠른 생일, 직원 수를 출혁하시오

SELECT A.DEPT_CD ,(SELECT B.DEPT_NM FROM TB_DEPT B WHERE B.DEPT_CD = A.DEPT_CD) AS DEPT_NM ,MAX(A.BIRTH_DE) AS "가장 늦은 생년월일", MIN(A.BIRTH_DE) AS "가장 빠른 생년월일", COUNT(*) AS 직원수
FROM TB_EMP A
GROUP BY A.DEPT_CD 
ORDER BY A.DEPT_CD ;