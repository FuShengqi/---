--	2.车辆基本信息表
use car_rental_sys_db;

create table car_info
(
	id char(32) PRIMARY KEY,
	model_info_id char(32) NOT NULL,
	car_no char(8) NOT NULL UNIQUE,
	car_color char(4) NOT NULL,
	car_buy_date date,
	car_engine_no char(8) NOT NULL,
	car_frame_no char(8) NOT NULL,
	car_status boolean,
	car_store_id char(32) NOT NULL,
	record_creator char(32) NOT NULL,
	record_create_time Date NOT NULL,
	FOREIGN KEY(record_creator) 
		REFERENCES stuff_info(id)
		ON DELETE CASCADE,
	FOREIGN KEY(model_info_id)
		REFERENCES model_info(id)
		ON DELETE CASCADE,
	FOREIGN KEY(car_store_id)
		REFERENCES store_info(id)
);