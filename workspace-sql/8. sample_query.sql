-- ���� ���̺����� ���� ���̵�, ������, �ſ�ī�� �ѵ����� �������ÿ�

SELECT c.CUSTOMER_ID ,
	   c.NAME ,
	   c.CREDIT_LIMIT 
FROM CUSTOMERS c ;

-- �������̺����� �������̵�, ������, �ּ�, ������Ʈ, �ſ�ī�� �ѵ��ݾ��� �����ͺ���

SELECT c.CUSTOMER_ID ,c.NAME ,c.ADDRESS ,c.WEBSITE ,c.CREDIT_LIMIT 
FROM CUSTOMERS c ;

SELECT *
FROM CUSTOMERS;

-- ����Ŭ���� �����ϴ� dual ���̺��� ��ȸ�Ͻÿ�.
-- dual ���̺��� �̿��Ͽ� select ������ �پ��� ����ó���� �� ������

SELECT (10+5)/2 AS val
FROM dual;

SELECT c.NAME , c.ADDRESS ,c.CREDIT_LIMIT 
FROM CUSTOMERS c 
ORDER BY c.NAME DESC ;

SELECT  c.FIRST_NAME , c.LAST_NAME 
FROM CONTACTS c 
ORDER BY c.FIRST_NAME , c.LAST_NAME DESC; 

SELECT FIRST_NAME 
FROM CONTACTS c 
ORDER BY FIRST_NAME; 

SELECT DISTINCT FIRST_NAME 
FROM CONTACTS c 
ORDER BY FIRST_NAME; 

SELECT DISTINCT PRODUCT_ID ,QUANTITY 
FROM ORDER_ITEMS oi 
ORDER BY PRODUCT_ID ;

SELECT p.PRODUCT_NAME ,p.DESCRIPTION,p.LIST_PRICE ,p.CATEGORY_ID  
FROM PRODUCTS p 
WHERE PRODUCT_NAME = 'Kingston';

-- PRODUCT_NAME�� 'Asus'�� �����ϴ� ��(��)�� (PRODUCT_NAME,LIST_PRICE)����Ͻÿ�.

SELECT p.PRODUCT_NAME ,p.LIST_PRICE 
FROM PRODUCTS p 
WHERE p.PRODUCT_NAME like 'Asus%'
ORDER BY p.LIST_PRICE  ;































