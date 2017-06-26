--	1.车辆基本信息表
use car_rental_sys_db;

create table model_info
(
	id char(32) PRIMARY KEY,
	model_type char(10) NOT NULL,
	model_name char(10),
	model_retailer char(8),
	mode_seat_num smallint NOT NULL,
	model_fuel_tank smallint NOT NULL,
	model_status boolean,
	record_creator char(32) NOT NULL,
	record_create_time Date NOT NULL,
	FOREIGN KEY(record_creator) 
		REFERENCES customer_info(id)
		ON DELETE CASCADE
);