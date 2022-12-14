CREATE DATABASE ss1_student_database;

-- TAO BANG
CREATE TABLE class(
  Id int primary key, 
  `Name` varchar(30)
);
CREATE TABLE teacher(
  Id int primary key, 
  `Name` varchar(30), 
  age int, 
  country varchar(20)
);

-- THEM DATA
INSERT INTO class(Id, `Name`) 
VALUES 
  (1, "DUC"), 
  (2, "DUNG");
INSERT INTO class(Id) 
VALUES 
  (3);
INSERT INTO class 
VALUES 
  (1, "DUYEN");
-- LAY DATA
SELECT 
  * 
FROM 
  class;
SELECT 
  Id 
FROM 
  class;
SELECT 
  `Name` 
FROM 
  class;
  
-- XOA DATA theo row
SET 
  SQL_SAFE_UPDATES = 0;
DELETE FROM 
  class;
SET 
  SQL_SAFE_UPDATES = 1;
DELETE FROM 
  class 
WHERE 
  id = 1;
DELETE FROM 
  class 
WHERE 
  `Name` = "DUNG";
  
-- Truncate là xóa hết dữ liệu có hoặc không có TABLE cũng được, Truncate xóa không cần SET SAFE
TRUNCATE class;
-- THAY DOI
UPDATE 
  class 
SET 
  Id = 4 
WHERE 
  `Name` = "DUC";
UPDATE 
  class 
SET 
  `Name` = "CUONG" 
WHERE 
  Id = 3;
  
-- THêm cột 
ALTER TABLE 
  class 
ADD 
  COLUMN(`Point` int);
ALTER TABLE 
  class 
ADD 
  COLUMN(
    Gender varchar(10)
  );
  
-- Drop là xóa hết Bảng phải có TABLE 
DROP 
  TABLE class;
-- Xóa theo cột 
ALTER TABLE 
  class 
DROP 
  COLUMN Gender;
-- Xóa database
DROP 
  DATABASE module3_day1;
CREATE TABLE student AS 
SELECT 
  Id, 
  `Name` 
FROM 
  class;