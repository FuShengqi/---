--	6.驾驶证信息表
use car_rental_sys_db;

create table license_info
(
	id char(32) PRIMARY KEY,
	license_no char(10) NOT NULL UNIQUE,
	licence_type char(10) NOT NULL,
	licence_ages smallint,
	licence_start_date date NOT NULL,
	licence_invalid_date date NOT NULL,
	licence_status boolean,
	record_creator char(32) NOT NULL,
	record_create_time Date NOT NULL,
	FOREIGN KEY(record_creator) 
		REFERENCES stuff_info(id)
		ON DELETE CASCADE
);