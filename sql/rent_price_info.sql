--	3.租赁价格信息表
use car_rental_sys_db;

create table rent_price_info
(
	id char(32) PRIMARY KEY,
	model_info_id char(32) NOT NULL,
	deposit float NOT NULL,
	price_per_day float NOT NULL,
	price_per_km float,
	price_over_anhour float,
	price_over_km float,
	rent_status boolean,
	record_creator char(32) NOT NULL,
	record_create_time Date NOT NULL,
	FOREIGN KEY(record_creator) 
		REFERENCES stuff_info(id)
		ON DELETE CASCADE,
	FOREIGN KEY(model_info_id)
		REFERENCES model_info(id)
		ON DELETE CASCADE
);