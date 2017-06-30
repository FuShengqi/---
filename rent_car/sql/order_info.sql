--	7.订单信息表
use car_rental_sys_db;

create table order_info
(
	id char(32) PRIMARY KEY,
	order_no char(16) NOT NULL,
	car_id char(32) NOT NULL,
	license_id char(32) NOT NULL,
	customer_id char(32) NOT NULL,
	customer_no char(6) ,
	order_start_date date,
	return_date_in_plan date,
	return_date_in_actual date,
	order_start_miles float,
	order_end_miles float,
	basic_consume float,
	timeout_consume float,
	kmout_consume float,
	discount_amount float,
	rent_deposit float,
	violate_deposit float,
	damage_deposit float,
	violate_deductions float,
	damage_deductions float,
	total_consume float,
	order_status char(8),
	record_creator char(32) NOT NULL,
	record_create_time Date NOT NULL,
	FOREIGN KEY(record_creator) 
		REFERENCES stuff_info(id)
		ON DELETE CASCADE,
	FOREIGN KEY(car_id)
		REFERENCES car_info(id),
	FOREIGN KEY(license_id)
		REFERENCES license_info(id),
	FOREIGN KEY(customer_id)
		REFERENCES customer_info(id)
);
