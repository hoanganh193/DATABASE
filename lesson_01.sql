-- xoa csdl ( neu ton tai)
DROP DATABASE IF EXISTS lesson_01;

-- tao csdl
CREATE DATABASE lesson_01;

--
SHOW DATABASES;

-- CHON CSDL MUON THAO TAC
USE lesson_01;

-- kiểu dữ liệu
--   số nguyên: TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT
--   số thực: FLOAT, DOUBLE
--   chuỗi: VARCHAR(50), CHAR(50)
--   thời gian: DATE (yyyy-MM-dd), TIME, DATETIME
--   logic: BOOLEAN, BIT				// TRUE FALSE, 0 1
-- 	 enum:   ENUM("loading","success","error")                       // giới hạn lựa chọn

-- xóa bảng(nếu tồn tại)
DROP TABLE IF EXISTS department;
-- tạo bảng
CREATE TABLE department(
	id INT,
    name VARCHAR(50),
    created_date DATE
);
-- thêm dữ liệu vào bảng
INSERT INTO department  (id, name, created_date)
VALUES					(1, "Bảo vệ", "2020-04-19"),
						(2, "Kinh doanh", "2023-02-13"),
						(3, "Giám đốc", "2014-10-02")
;
-- hiển thị dữ liệu
TABLE department;
-- HOẶC
SELECT * FROM department;

-- ràng buộc dữ liệu
-- khóa chính (PRIMARY KEY)
-- 1. Một bảng có tối đa 1 khóa chính
-- 2. Giá trị là duy nhất 
-- 3. Phải NOT NULL
-- Tự động tăng: AUTO_INCREMENT

-- Facebook
-- user_id		group_id		joined_date
-- 1			10				2023
-- 1			20				2020
-- 2			10				1000
-- 1			10 XXXX
CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT, -- tự động tăng
    name VARCHAR(50)
);
--
INSERT INTO product (id, name)
VALUES (1, "Chuột máy tính");
--
INSERT INTO product (id, name)
VALUES (2, "Bàn phím máy tính");
--
INSERT INTO product ( name)
VALUES ( "Tủ lạnh");

-- NOT NULL: Không đc để trống
DROP TABLE IF EXISTS question;
CREATE TABLE question(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    content VARCHAR(100) NOT NULL
);
--
INSERT INTO question (content)
VALUES (NULL); -- > lỗi 
--
INSERT INTO question (content)
VALUES ("");

-- UNIQUE KEY: khóa duy nhất
DROP TABLE IF EXISTS customer;
CREATE TABLE customer(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    email VARCHAR(100) UNIQUE not null
);
--
INSERT INTO customer (email)
value (null);

-- DEFAULT: MẶC ĐỊNH
DROP TABLE IF EXISTS customer;
CREATE TABLE customer(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    email VARCHAR(100) UNIQUE not null
);
--
INSERT INTO customer (email)
value (null);

select now();

-- DEFAULT: MẶC ĐỊNH
DROP TABLE IF EXISTS customer;
CREATE TABLE customer(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    email VARCHAR(100)  default "hoanganh@gmail.com",
    created_date date default (current_date)
);
--
INSERT INTO customer (id)
value (100);

-- CHECK: kiểm tra
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    age int check (age >= 18)
);
--
INSERT INTO `user` (age)
value (20);

-- FOREIGN KEY: khóa ngoại 

DROP TABLE IF EXISTS department;
CREATE TABLE department(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    name varchar(50)
);
--
DROP TABLE IF EXISTS account;
CREATE TABLE account(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    full_name varchar(50),
    department_id int,
     foreign key (department_id) references department(id)
				on update cascade on delete cascade
     
);
--
insert into department(id, name) values (100, "bảo vệ");
insert into account (full_name, department_id) values (" nguyễn văn khoa", 100);
