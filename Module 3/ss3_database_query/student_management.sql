create database if not exists student_query;
drop 
  database if exists student_query;
use quan_ly_sinh_vien;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select 
  * 
from 
  Student 
where 
  StudentName like 'H%';
  
  -- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select 
  * 
from 
  Class 
where 
  month(StartDate) = 12;
  
  -- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select 
  * 
from 
  Subject 
where 
  Credit between 3 
  and 5;
 
 -- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set 
  sql_safe_updates = 0;
update 
  Student 
set 
  ClassId = 2 
where 
  StudentName = 'Hung';
  
  -- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select 
  s.StudentName, 
  sb.SubName, 
  m.Mark 
from 
  Mark as m 
  join Student as s on m.StudentId = s.StudentId 
  join Subject as sb on sb.SubId = m.SubId 
order by 
  Mark desc, 
  StudentName;
