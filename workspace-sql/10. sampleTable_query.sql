
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
    ������ �� ���� ���� �ݾ��� ���Ͻÿ�.
    ���̸�, ���� , �ѱݾ�
*/
select c.name as customer, to_char(A.Order_date,'yyyy') as year, sum(b.quantity*b.unit_price) as sales_amount
from orders A, order_items B, customers C
where 1=1 and A.status = 'Shipped' and A.order_id = B.order_id and A.customer_id = C.customer_id
group by c.name, to_char(A.Order_date,'yyyy')
order by c.name
;

-- �� ���� => �並 ����� select���� �ݺ������� typing�� �ʿ���� �ش� �並 select�ϸ� ��.

create or replace view customer_sales as 
select c.name as customer, to_char(A.Order_date,'yyyy') as year, sum(b.quantity*b.unit_price) as sales_amount
from orders A, order_items B, customers C
where 1=1 and A.status = 'Shipped' and A.order_id = B.order_id and A.customer_id = C.customer_id
group by c.name, to_char(A.Order_date,'yyyy')
order by c.name
;

select *
from customer_sales;

-- �� �� 2017�⵵ ������ �������� ���Ͻÿ�
-- ���̸� �Ѹ���

select customer as ���̸� , sales_amount as �Ѹ���
from customer_sales
where year = 2017
order by sales_amount desc;

-- ���� ��ü ���� �հ踦 ���Ͻÿ�.
select customer as ���̸� , sum(sales_amount) as �Ѹ���
from customer_sales
group by customer
order by �Ѹ��� desc
;




































