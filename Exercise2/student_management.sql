create database if not exists student_management_system;
drop database if exists student_management_system;
use student_management_system;

create table class (
	class_id int auto_increment primary key,
	class_name varchar(45)
);
create table student (
	student_id int auto_increment primary key,
	student_name varchar(45),
	gender varchar(45),
	email varchar(45),
	point float,
    class_id int,
    foreign key(class_id) references class(class_id) on delete cascade
);

insert into class values 
	(1,'C0922G1'),
    (2,'C0822G1');
    
insert into student values 
	(1,'duy duc','Nam','duy@gmail.com',10,1),
	(2,'hoang duy','Nu','honag@gmail.com',8,2);
    
    select * from class;
    select * from student;