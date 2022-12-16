create database if not exists student_query;
drop 
  database if exists student_query;
use quan_ly_sinh_vien;

select 
  * 
from 
  Student 
where 
  StudentName like 'H%';
  
select 
  * 
from 
  Class 
where 
  month(StartDate) = 12;
  
select 
  * 
from 
  Subject 
where 
  Credit between 3 
  and 5;
  
set 
  sql_safe_updates = 0;
update 
  Student 
set 
  ClassId = 2 
where 
  StudentName = 'Hung';
  
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
