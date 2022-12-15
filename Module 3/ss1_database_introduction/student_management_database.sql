create database ss1_student_database;
use class;
drop 
  database class;
use module3_day1;
-- TAO BANG
create table class(
  id int primary key, 
  `Name` varchar(30)
);
create table teacher(
  id int primary key, 
  `Name` varchar(30), 
  age int, 
  country varchar(20)
);
-- THEM DATA
insert into class(id, `Name`) 
values 
  (1, "DUC"), 
  (2, "DUNG");
insert into class(id) 
values 
  (3);
insert into class 
values  
  (1, "DUYEN");
-- LAY DATA
select
  * 
from
  class;
select
  id 
from
  class;
select
  `Name` 
from
  class;
  
-- XOA DATA theo row
set 
sql_safe_updates = 0;

-- DELETE xóa phải có SET SAFE, Riêng xóa theo Id primary key thì không cần
delete from
  class;
set
  sql_safe_updates = 1;
delete from
  class 
where 
  id = 1;
delete from
  class 
where 
  `Name` = "DUNG";
  
-- Truncate là xóa hết dữ liệu có hoặc không có TABLE cũng được, Truncate xóa không cần SET SAFE
truncate class;

-- THAY DOI
update
  class 
set
  id = 4 
where 
  `Name` = "DUC";
update
  class 
set
  `Name` = "CUONG" 
where
  id = 3;
  
-- THêm cột 
alter table
  class 
add 
  column(`Point` int);
alter table 
  class 
add
  column(
    gender varchar(10)
  );
  
-- Drop là xóa hết Bảng phải có TABLE 
drop
  table class;
  
-- Xóa theo cột 
alter table
  class 
drop 
  column gender;
  
-- Xóa database
drop
  database module3_day1;
create table student as
select
  id, 
  `Name` 
from
  class;