--  ��������

select max(list_price)
from products;

-- ���������� �̿��ؼ� list_price �� �ִ밪�� ���� ���

select product_id, product_name,list_price
from products
where list_price = (select max(list_price)from products);

-- ��Į�� �������� 
/*
    �� ��ǰ�� ������ ���ϸ鼭 �ش� ��ǰ�� ��ġ�ϰ� �ִ� ��ǰ ī�װ��� ���
    ���ݵ� ���� ���Ͻÿ�.
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

-- �ζ��� �� ���� ����

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
