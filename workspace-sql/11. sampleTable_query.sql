--  서브쿼리

select max(list_price)
from products;

-- 서브쿼리를 이용해서 list_price 가 최대값인 행을 출력

select product_id, product_name,list_price
from products
where list_price = (select max(list_price)from products);

-- 스칼라 서브쿼리 
/*
    각 제품의 가격을 구하면서 해당 제품이 위치하고 있는 제품 카테고리의 평균
    가격도 같이 구하시오.
    PRODUCT_NAME        list_price                   avg_list_price  
*/

select a.product_name, a.list_price, round(
                                        (select avg(k.list_price)
                                        from products K
                                        where k.category_id = a.category_id
                                    ),2) as AVG_List_Price
from products A
order by a.product_name
;

-- 인라인 뷰 서브 쿼리

SELECT ORDER_ID , sum(QUANTITY * UNIT_PRICE) AS ORDER_VALUE
FROM ORDER_ITEMS oi
GROUP BY ORDER_ID
ORDER BY ORDER_VALUE DESC;

SELECT ORDER_ID , order_value
FROM
(
SELECT ORDER_ID , sum(QUANTITY * UNIT_PRICE) AS ORDER_VALUE
FROM ORDER_ITEMS oi
GROUP BY ORDER_ID
ORDER BY ORDER_VALUE DESC
)
WHERE rownum <= 10
;
