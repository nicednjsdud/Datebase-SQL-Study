-- employee
CREATE TABLE EMPLOYEE(
		employee_id			char(10) PRIMARY KEY,
		employee_name 		varchar(150) NOT NULL,
		employee_de 		char(8) NOT NULL,
		addr				varchar(1000) NOT NULL,
		employee_phone 		varchar(50) NOT NULL,
		employee_lunar_yn	char(1)		NOT NULL,
		final_edu_se_cd		char(3)		NOT NULL,
		sal_trans_bank_cd 	char(3)		NOT NULL,
		sal_trans_accnt_no	char(10)	NOT NULL,
		direct_manager_emp_no char(10),				--fk
		dept_cd				char(6),				--fk
		CONSTRAINT fk_employee_depart
        FOREIGN KEY( dept_cd )
        REFERENCES depart( dept_cd )
        ON DELETE CASCADE       
);

-- DEPART
CREATE TABLE depart(
		dept_cd			char(6) 		PRIMARY KEY,
		dept_number		varchar(150)	NOT NULL,
		upper_dept_no	char(6)						--fk		
);

-- employee_certificate
CREATE TABLE employee_certificate(
		employee_id		char(10), 					--fk
		certificate_sn	char(3)		PRIMARY KEY,	
		certificate_cd	char(6), 					--fk
		acqu_de			char(8)		NOT NULL
		,
		CONSTRAINT fk_employee_certificate_employee
		FOREIGN key(employee_id)
		REFERENCES employee(employee_id)
		ON DELETE CASCADE,
		CONSTRAINT fk_employee_certificate_certificate
		FOREIGN key(certificate_cd)
		REFERENCES certificate(certificate_cd)
		ON DELETE cascade
);

-- certificate
CREATE TABLE certificate(
		certificate_cd 	char(6)		PRIMARY KEY,
		certigicate_nm	varchar(150) NOT NULL,
		issue_insti_nm	varchar(150) NOT null	
);

-- salary_history
CREATE TABLE salary_history(
		salary_his_id	char(14)	PRIMARY KEY,
		pay_de			char(8)		NOT NULL,
		pay_amt			number(15)	NOT NULL,
		employee_id		char(10),					--fk		
		CONSTRAINT fk_salary_history_employee
		FOREIGN key(employee_id)
		REFERENCES employee(employee_id)
		ON DELETE CASCADE	
);

-- salary_history_detail
CREATE TABLE salary_history_detail(
		salary_his_id		char(14),					--fk
		salary_detail_id	char(3)	PRIMARY KEY,
		salary_id			char(6),					--fk
		pay_detail_amt		number(15)	NOT NULL,
		CONSTRAINT fk_salary_history_deatail_salary_history
		FOREIGN key(salary_his_id)
		REFERENCES salary_history(salary_his_id)
		ON DELETE CASCADE,
		FOREIGN key(salary_id)
		REFERENCES salary(salary_id)
		ON DELETE cascade
);

-- salary
CREATE TABLE salary(
		salary_id			char(6) PRIMARY KEY,
		salary_nm		varchar(150) NOT null	
);






















