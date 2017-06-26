--	9.续租订单信息表
use car_rental_sys_db;

create table violate_info
(
	id char(32) PRIMARY KEY,
	car_id char(32) NOT NULL,
	violate_date date NOT NULL,
	violate_event char(20),
	violate_fee float,
	violate_status boolean,
	record_creator char(32) NOT NULL,
	record_create_time Date NOT NULL,
	FOREIGN KEY(record_creator) 
		REFERENCES stuff_info(id)
		ON DELETE CASCADE,
	FOREIGN KEY(car_id)
		REFERENCES car_info(id)
);