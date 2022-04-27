
SELECT A.ORDER_ID , B.ITEM_ID , B.PRODUCT_ID ,B.QUANTITY ,B.UNIT_PRICE 
, A.STATUS , A.ORDER_DATE , A.SALESMAN_ID 
FROM orders A,
	 ORDER_ITEMS B
WHERE A.ORDER_ID = B.ORDER_ID ;

CREATE TABLE SALES AS 
SELECT A.ORDER_ID 
	 , B.ITEM_ID 
	 , B.PRODUCT_ID 
	 , B.QUANTITY 
	 , B.UNIT_PRICE 
	 , A.STATUS 
	 , A.ORDER_DATE 
	 , A.SALESMAN_ID 
FROM orders A,
	 ORDER_ITEMS B
WHERE A.ORDER_ID = B.ORDER_ID ;



DELETE 
FROM sales s
WHERE order_id =1
AND Item_id = 1;
COMMIT;

DELETE 
FROM SALES s 
WHERE ORDER_ID =1;
COMMIT;

DELETE 
FROM SALES s;
COMMIT;

SELECT *
FROM SALES s ;

-- INLINE VIEW

SELECT A.*
from(
	SELECT NAME , CREDIT_LIMIT 
	FROM CUSTOMERS c 
)A;

SELECT NAME , CREDIT_LIMIT 
FROM CUSTOMERS c ;

select A.*
from(
    SELECT A.*
    from(
        SELECT NAME , CREDIT_LIMIT 
        FROM CUSTOMERS c 
    )A
    
)A;

/*
    연도별 각 고객의 매출 금액을 구하시오.
    고객이름, 연도 , 총금액
*/
select c.name as customer, to_char(A.Order_date,'yyyy') as year, sum(b.quantity*b.unit_price) as sales_amount
from orders A, order_items B, customers C
where 1=1 and A.status = 'Shipped' and A.order_id = B.order_id and A.customer_id = C.customer_id
group by c.name, to_char(A.Order_date,'yyyy')
order by c.name
;

-- 뷰 생성 => 뷰를 만들면 select문을 반복적으로 typing할 필요없이 해당 뷰를 select하면 됨.

create or replace view customer_sales as 
select c.name as customer, to_char(A.Order_date,'yyyy') as year, sum(b.quantity*b.unit_price) as sales_amount
from orders A, order_items B, customers C
where 1=1 and A.status = 'Shipped' and A.order_id = B.order_id and A.customer_id = C.customer_id
group by c.name, to_char(A.Order_date,'yyyy')
order by c.name
;

select *
from customer_sales;

-- 고객 별 2017년도 매출을 오름차순 구하시오
-- 고객이름 총매출

select customer as 고객이름 , sales_amount as 총매출
from customer_sales
where year = 2017
order by sales_amount desc;

-- 고객별 전체 매출 합계를 구하시오.
select customer as 고객이름 , sum(sales_amount) as 총매출
from customer_sales
group by customer
order by 총매출 desc
;




































