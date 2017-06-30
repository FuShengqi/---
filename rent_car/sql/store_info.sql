--	4.门店信息表
use car_rental_sys_db;

create table store_info
(
	id char(32) PRIMARY KEY,
	store_no char(10) NOT NULL UNIQUE,
	store_address char(20) NOT NULL,
	store_tel char(20) NOT NULL,
	store_openhours char(10) NOT NULL,
	store_status boolean,
	record_creator char(32) NOT NULL,
	record_create_time Date NOT NULL,
	FOREIGN KEY(record_creator) 
		REFERENCES stuff_info(id)
		ON DELETE CASCADE
);