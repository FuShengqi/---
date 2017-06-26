--	8.续租订单信息表
use car_rental_sys_db;

create table renewal_order_info
(
	id char(32) PRIMARY KEY,
	order_id char(32) NOT NULL,
	order_no char(8) NOT NULL UNIQUE,
	renewal_start_date date,
	renewal_end_date date,
	renewal_deposit float,
	renewal_status boolean,
	record_creator char(32) NOT NULL,
	record_create_time Date NOT NULL,
	FOREIGN KEY(record_creator) 
		REFERENCES stuff_info(id)
		ON DELETE CASCADE,
	FOREIGN KEY(order_id)
		REFERENCES order_info(id)
);