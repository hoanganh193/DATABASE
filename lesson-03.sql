-- Mệnh đề SELECT
select current_date;
select pi();
select 1+1;
select "khoa";
select current_date as "today", now() as "now";
select current_date "today", now() "now";

-- Mệnh đề FROM
select department_name, department_id
FROM department;
-- *: tất cả
select *
FROM question;

-- Mệnh đề WHERE
select *
from department
where department_id > 5;

-- AND, OR
select *
from department
where department_id >= 3 and department_id <= 8;

-- BETWEEN ... AND...
select *
from department
where department_id between 3 and  8;

-- IN 
select *
from department
where department_id in (2, 4, 6, 8);

-- LIKE
-- _: đại diện cho 1 kí tự 
-- %: đại diện cho 0 hoặc nhiều kí tự
select *
from department
where department_name LIKE "%ng%"; -- phòng ban có chữ ng

-- IS NULL / IS NOT NULL
select *
from department
where department_name is not null;

-- mệnh đề LIMIT: giới hạn số lượng trả về
select *
from department
limit 5;
--
select *
from department
limit 1, 3; -- lấy ra 3 phần tử từ vị trí số 1 trong mảng [0, 1, 2....]

--
-- Mệnh đề ORDER BY : sắp xếp
-- ASC, DESC : tăng dần, giảm dần
-- Mặc định: ASC
select *
from exam
order by duration desc, created_date desc;

-- Hàm tổng hợp 
-- COUNT(*): đếm số dòng
select count(*)
from exam;
select count(*) as exam_count
from exam;
-- COUNT(id): đếm số dòng mà id IS NOT NULL
INSERT INTO exam (exam_id, code, title, category_id, duration, creator_id)
VALUES 			 ('11', 'VTIQ011', 'Đề thi MySQL', '2', null, '9');
select count(duration) as exam_count
from exam;

-- SUM, MIN, MAX, AVG
select
	sum(duration),
    min(duration),
    max(duration),
    avg(duration) -- trung bình
from exam;

-- Mệnh đề GROUP BY 
select * from exam;
select duration,  count(exam_id) as exam_count
from exam
group by duration; -- số lương đề thi phân theo thời gian thi
select duration, created_date,  count(exam_id) as exam_count
from exam
group by duration, created_date
order by duration, created_date;

-- -- Mệnh đề HAVING
select duration, created_date,  count(exam_id) as exam_count
from exam
group by duration, created_date
having count(exam_id) > 1
order by duration, created_date;

-- Cập nhật dữ liệu
update department
set department_name = "Phòng chờ"
where department_id=1;