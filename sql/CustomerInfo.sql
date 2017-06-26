--	5.基本信息表
use car_rental_sys_db;

create table customer_info
(
	id char(32) PRIMARY KEY,
	customer_no char(10) UNIQUE,
	customer_password char(10),
	customer_name char(10),
	customer_sex char(2),
	customer_age smallint,
	customer_id char(18) NOT NULL,
	customer_tel char(15),
	customer_workplace char(30),
	customer_post char(6),
	customer_email char(15),
	customer_status boolean,
	customer_address char(20),
	record_creator char(32) NOT NULL,
	record_create_time Date NOT NULL,
	FOREIGN KEY(record_creator) 
		REFERENCES stuff_info(id)
		ON DELETE CASCADE
);