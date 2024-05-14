DROP DATABASE IF EXISTS assignment_01;
create database assignment_01;
use assignment_01;

-- 1. tạo bảng department
drop table if exists department;
create table department(
	department_id int primary key auto_increment,
    department_name varchar(100)
);

-- 2. tạo bảng postion
drop table if exists position;
create table position (
	position_id int auto_increment,
    position_name ENUM("Dev", "Test", "Scrum Master", "PM")
);

-- 3. tạo bảng account
drop table if exists account;
create table account (
	account_id int primary key auto_increment,
    email varchar(100),
    username varchar(50),
    full_name varchar(100),
    department_id int,
    position_id int,
    create_date date
);

-- 4. tạo bảng group
drop table if exists `group`;
create table `group` (
	group_id int primary key auto_increment,
    group_name varchar(100),
    creator_id varchar(100),
    create_date date
);

-- 5. tạo bảng group account
drop table if exists group_account;
create table group_account (
	group_id int,
    account_id int,
    join_date date,
    primary key (group_id, account_id)
);

-- 6. tạo bảng type question
drop table if exists type_question;
create table type_question (
	type_id int primary key auto_increment,
    type_name enum("Essay", "Multiple-Choice")
);

-- 7. tạo bảng category question
drop table if exists category_question;
create table category_question(
	category_id int auto_increment,
    category_name varchar(100)
);

-- 8. tạo bảng question
drop table if exists question;
create table question(
	question_id int primary key  auto_increment,
    content varchar(100),
    category_id int,
    type_id int,
    creator_id int,
    create_date date
);

-- 9. tạo bảng answer
drop table if exists answer;
create table answer (
	answer_id int primary key  auto_increment,
    content varchar(100),
    question_id int,
    is_correct boolean -- true false || bit -- 0 1
);

-- 10. tạo bảng exam 
drop table if exists exam ;
create table exam (
	exam_id int primary key  auto_increment,
    code varchar(50),
	title varchar(100),
	category_id int,
    duration time,
    creator_id int,
    create_date date
);

-- 11. tạo bảng exam question
drop table if exists exam_question;
create table exam_question(
	exam_id int,
    question_id int,
    primary key(exam_id, question_id)
);
