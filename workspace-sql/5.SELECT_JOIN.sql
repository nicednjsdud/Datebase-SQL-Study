
-- 주문 테이블에서 주문 제품별 수량의 합계를 검색하시오.
-- 동일 제품을 주문한 투풀을 모아 그룹으로 만들고, 그룹별로 수량의 합계를 계산
SELECT ORDERNAME, SUM(COUNT) AS 총주문수량
FROM ORDERSERVICE
GROUP BY ORDERNAME;

/*
 * 제품 테이블에서 제조업체별로 제조한 제품의 개수와 제품 중 가장 비싼 단가를 검색하되,
 * 제품의 개수는 제품수라는 이름으로 출력하고, 가장 비싼 단가는 최고가라는 이름으로 출력하시오.
 */

SELECT FACTORY, COUNT(*) AS 제품수 , MAX(PRICE) AS 최고가
FROM ITEM 
GROUP BY FACTORY;

/*
	제품 테이블에서 제품을 3개이상 제조한 제조업체별로 제품의 개수와,
	제품 중 가장 비싼 단가를 검색하시오.
*/

SELECT 제조업체, count(*) AS 제품수, max(단가) AS 최고가
FROM 제품
GROUP BY 제조업체 HAVING count(*) >= 3;


/*
 *  고객 테이블에서 적립금 평균이 1,000원 이상인 등급에 대해 등급별 고객수와 적립금 평균을 검색하시오.
 */

SELECT 등급, count(*) AS 고객수 , avg(적립금) AS "적립금 평균"
FROM 고객
GROUP BY 등급 HAVING avg(적립금) >=1000;

/*
 *  주문 테이블에서 각 주문고객이 주문한 제품의 총 주문수량을 주문 제품별로 검색하시오.
 */

SELECT 주문제품, 주문고객, sum(수량) AS 총주문수량
FROM 주문
GROUP BY 주문제품, 주문고객;

-- banana 고객이 주문한 제품의 이름을 검색하시오.

SELECT 제품.제품명 
FROM 제품, 주문
WHERE 주문.주문고객 = 'banana' AND 제품.제품번호 = 주문.주문제품; 

-- 나이가 30세 이상인 고객이 주문한 제품의 주문제품과 주문일자를 검색하시오.

SELECT 고객.나이 , 주문.주문제품 ,주문.주문일자 
FROM 고객,주문
WHERE 고객.나이 >=30 AND 고객.고객아이디 = 주문.주문고객 ;

/*
 *  테이블의 이름을 대신하는 단순한 별명을 제시하여 질의문 작성함
 */

SELECT c.고객아이디 , o.주문제품 ,o.주문일자 
FROM 고객 c,주문 o 
WHERE c.나이 >=30 AND c.고객아이디 = o.주문고객 ;

-- 고명석 고객이 주문한 제품의 제품명을 검색하시오.
SELECT c.고객이름 , i.제품명 
FROM 고객 c,제품 i,주문 o
WHERE c.고객이름 = '고명석' AND c.고객아이디 = o.주문고객 AND o.주문제품 =i.제품번호 ; 















