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
  credit = (
    select 
      max(credit) 
    from 
      `subject`
  );
  
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select 
  s.*, 
  m.mark 
from 
  `subject` as s 
  join mark as m on s.sub_id = m.sub_id 
where 
  m.mark = (
    select 
      max(mark) 
    from 
      mark
  );
  
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select 
  st.*, 
  avg(m.mark) 
from 
  student as st 
  join mark as m on st.student_id = m.student_id 
group by 
  m.student_id
order by m.mark desc;