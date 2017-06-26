--	5.职工信息表
use car_rental_sys_db;

create table stuff_info
(
	id char(32) PRIMARY KEY,
	stuff_no char(10) UNIQUE,
	stuff_password char(10),
	stuff_name char(10),
	stuff_sex char(2),
	stuff_age smallint,
	stuff_id char(18) NOT NULL,
	stuff_tel char(15) NOT NULL UNIQUE,
	stuff_workplace char(30),
	stuff_post char(6),
	stuff_email char(15) NOT NULL UNIQUE,
	stuff_status boolean,
	stuff_address char(20),
	record_creator char(32) NOT NULL,
	record_create_time Date NOT NULL
);