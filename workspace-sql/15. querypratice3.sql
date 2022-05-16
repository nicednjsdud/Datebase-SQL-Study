-- 집합에 일부분만 출력
-- PAY_DE(지급일자) 조건을 만족하는 집합에서 10건만 먼저 출력,
-- 그 10건의 출력 결과를 PAY-AMT로 내림차순 정렬함.

SELECT A.SAL_HIS_NO , A.PAY_DE , A.PAY_AMT , A.EMP_NO 
FROM EZEN.TB_SAL_HIS A
WHERE A.PAY_DE >= '20200501' AND A.PAY_DE <= '20200531' 
ORDER BY A.PAY_AMT DESC ;		-- 서브쿼리

-- PAY_DE 조건을 만족하는 집합에서 PAY_AMT 기준으로 내림차순 정렬한 집합 중 상위 10건만 출력
SELECT A.SAL_HIS_NO , A.PAY_DE , A.PAY_AMT , A.EMP_NO 
FROM (
		SELECT A.SAL_HIS_NO , A.PAY_DE , A.PAY_AMT , A.EMP_NO 
		FROM EZEN.TB_SAL_HIS A
		WHERE A.PAY_DE >= '20200501' AND A.PAY_DE <='20200531'
		ORDER BY A.PAY_AMT DESC
	 ) A
WHERE ROWNUM <=10;

-- 단일행 문자형 함수

SELECT LOWER('Oracle Server, SQL Develper') AS "LOWER('소문자로 변환')",
	   UPPER('Oracle Server, SQL Develper') AS "UPPER('대문자로 변환')",
	   ASCII('A') AS "ASCII('아스키코드값 출력')",
	   CONCAT('SQL','Develper') AS "CONCAT('문자열 결합')",
	   SUBSTR('SQL Develper',1,3) AS "SUBSTR('문자열 잘라내기')" ,
	   LENGTH('SQL') AS "LENGTH('문자열의 길이 출력')",
	   LTRIM(' SQL') AS "LTRIM('왼쪽 공백을 제거')",
	   RTRIM('SQL ') AS "RTRIM('오른쪽 공백을 제거')"
FROM DUAL;

-- 단일행 숫자형 함수

SELECT ABS(-15) AS "ABS('절대값을 반환')",
	   SIGN(10) AS "SIGN('양수일 경우 1 음수일 경우 -1, 0일 경우 0 반환')",
	   MOD(8,3) AS "MOD('나머지 반환')",
	   CEIL(38.678) AS "CEIL('무조건 올림')",
	   FLOOR(38.678) AS "FLOOR('무조건 버림')",
	   ROUND(38.678,2) AS "ROUND('소수점 2번째 자리까지 반올림')",
	   TRUNC(38.678) AS "TRUNC('0의 자리에서 무조건 자름')",
	   TRUNC(38.678,1) AS "TRUNC('1의 자리에서 무조건 자름')"
FROM DUAL;

-- 날짜형 데이터 변환함수

SELECT SYSDATE AS "SYSDATE",	-- 현재 년월일시분초 출력
	   EXTRACT(YEAR FROM SYSDATE) AS "EXTRACT(YEAR FROM SYSDATE)", --년출력
	   EXTRACT(MONTH FROM SYSDATE) AS "EXTRACT(MONTH FROM SYSDATE)", -- 달출력
	   EXTRACT(DAY FROM SYSDATE) AS "EXTRACT(DAY FROM SYSDATE)",	-- 일 출력	   
	   TO_CHAR(SYSDATE, 'YYYY') AS "TO_CHAR(SYSDATE, 'YYYY')",		-- 년출력 (문자열)
	   TO_CHAR(SYSDATE, 'MM') AS "TO_CHAR(SYSDATE, 'MM')",			-- 월 출력(문자열)
	   TO_CHAR(SYSDATE, 'DD') AS "TO_CHAR(SYSDATE, 'DD)",			-- 일 출력(문자열)
	   TO_CHAR(SYSDATE, 'HH24') AS "TO_CHAR(SYSDATE, 'HH24')",		-- 시 출력(문자열)	  
	   TO_CHAR(SYSDATE, 'MI') AS "TO_CHAR(SYSDATE, 'MI')",			-- 분 출력(문자열)
	   TO_CHAR(SYSDATE, 'SS') AS "TO_CHAR(SYSDATE, 'S')",			-- 초 출력(문자열)
	   TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) AS "TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))",
	   TO_NUMBER(TO_CHAR(SYSDATE,'MM')) AS "TO_NUMBER(TO_CHAR(SYSDATE,'MM'))",
	   TO_NUMBER(TO_CHAR(SYSDATE,'DD')) AS "TO_NUMBER(TO_CHAR(SYSDATE,'DD'))",
	   TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) AS "TO_NUMBER(TO_CHAR(SYSDATE,'HH24'))",
	   TO_NUMBER(TO_CHAR(SYSDATE, 'MI')) AS "TO_NUMBER(TO_CHAR(SYSDATE, ''MI'))",
	   TO_NUMBER(TO_CHAR(SYSDATE, 'SS')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'SS'))"
FROM DUAL;

-- 날짜형 데이터 연산

SELECT SYSDATE AS "SYSDATE",			-- 현재시간
	   SYSDATE -1 AS "SYSDATE-1",		-- 1일을 뺀 시간
	   SYSDATE -7 AS "SYSDATE-7",		-- 7일을 뺀 시간
	   SYSDATE - (1/24) "SYSDATE - (1/24)",--1시간 전
	   SYSDATE - (1/24/60) "SYSDATE - (1/24/60)",	--1분전
	   SYSDATE - (1/24/60/60) "SYSDATE -(1/24/60/60)", --1초전
	   SYSDATE - (1/24/60/60)*10 "SYSDATE -(1/24/60/60)*10" --10초전
FROM DUAL;

-- 데이터 변환의 종류
/*
 *  1) 암시적 형 변환 : DBMS가 자동으로 데이터 유형을 변환하는 경우
 *  2) 명시적 형 변환 : 데이터 변환 형 함수로 데이터 유형을 변환하도록 명시해주는 경우
 */

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS "TO_CHAR(SYSDATE, 'YYYY/MM/DD')",
	   TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') "TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS')",
	   TO_CHAR(10.25, '$999,999,999.99') AS "TO_CHAR(SYSDATE, '$999,999,999.99')",
	   TO_CHAR(12500, 'L999,999,999.99') AS "TO_CHAR(12500, 'L999,999,999.99')",
	   TO_NUMBER('100')+TO_NUMBER('100') AS "TO_NUMBER('100')+TO_NUMBER('100')" 
FROM DUAL ;

/*
 *  CASE WHEN 조건
 * 		THEN 값 혹은 SQL문
 * 		ELSE 값 혹은 SQL문
 * 	END
 * 
 *  : 조건이 맞으면 THEN절 수행하고 그렇지 않으면 ELSE절을 수행한다.
 */


SELECT CASE WHEN SAL_CD = '100001' THEN '기본급'
			WHEN SAL_CD = '100002' THEN '상여급'
			WHEN SAL_CD = '100003' THEN '특별상여급'
			WHEN SAL_CD = '100004' THEN '야근수당'
			WHEN SAL_CD = '100005' THEN '주말수당'
			WHEN SAL_CD = '100006' THEN '점식식대'
			WHEN SAL_CD = '100007' THEN '복지포인트'
			ELSE '유효하지 않음'
END SAL_NM 
FROM EZEN.TB_SAL;

/*
 *	DECODE(표현식 혹은 기준컬럼, 비교값1, 결과값1, 비교값2, 결과값2, 디폴트 값 )
 *	
 *  : 표현식 혹은 기준컬럼과 비교하여 비교값1과 같으면 결과값1 출력하고,
 *    표현식 혹은 기준컬럼과 비교하여 비교값2와 같으면 결과값2 출력하고, 그렇지않으면
 *    디폴트 값을 결과로 출력한다.
 */
SELECT DECODE(EZEN.TB_SAL.SAL_CD, '100001', '기본급2','100002','상여급', '기타')
FROM EZEN.TB_SAL;

-- 널관련 함수 사용
SELECT NVL(DIRECT_MANAGER_EMP_NO, '최상위자')	-- 직속상관사원번호가 NULL이면 "최상위자"로 출력
FROM EZEN.TB_EMP
WHERE DIRECT_MANAGER_EMP_NO IS NULL;


-- 최상위부서
SELECT NVL(A.UPPER_DEPT_CD, '최상위부서') AS 상위부서
FROM EZEN.TB_DEPT A
WHERE A.UPPER_DEPT_CD IS NULL;

-- MAX함수를 쓰면 공집합인 경우에도 한개의 ROW가 나옴.
SELECT NVL(MAX(EMP_NM),'존재안함') AS EMP_NM
FROM EZEN.TB_EMP A
WHERE A.EMP_NM = '류현진';







