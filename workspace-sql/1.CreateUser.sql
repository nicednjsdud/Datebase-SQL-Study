-- ����Ŭ �� ���� ������� ����� ���� ������ ���� ����
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;	

CREATE USER ezen IDENTIFIED BY 0824;			-- "ezen" ����� ������ ����
ALTER USER ezen account unlock;
GRANT CONNECT, RESOURCE, DBA TO ezen;			-- "ezen" ����� �������� ���� ��


-- ���̺� �����̽� 
CREATE tablespace ezen_data
datafile 'C:\app\ezen\product\18.0.0\oradata\XE\ezen_data.dbf' SIZE 2G
autoextend ON NEXT 512M maxsize unlimited
logging
ONLINE 
permanent
extent management LOCAL autoallocate
blocksize 8k
segment SPACE management auto
flashback ON;

CREATE TEMPORARY tablespace ezen_temp
tempfile 'C:\app\ezen\product\18.0.0\oradata\XE\ezen_temp.dbf' SIZE 500M
autoextend ON NEXT 100M maxsize unlimited
;

-- ������ ���̺� �����̽��� ezen ����� ������ default ���̺� �����̽��� ����
ALTER USER ezen DEFAULT tablespace ezen_data;
ALTER USER ezen TEMPORARY tablespace ezen_temp;





























