create database if not exists common_function_in_sql;
drop 
  database if exists common_function_in_sql;
use quan_ly_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select 
  * 
from 
  `subject` 
where 
  Credit = (
    select 
      max(Credit) 
    from 
      `subject`
  );
  
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select 
  s.*, 
  m.Mark 
from 
  `subject` as s 
  join mark as m on s.SubId = m.SubId 
where 
  m.Mark = (
    select 
      max(Mark) 
    from 
      mark
  );
  
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select 
  st.*, 
  avg(m.Mark) 
from 
  student as st 
  join mark as m on st.StudentId = m.StudentId 
group by 
  m.studentId;