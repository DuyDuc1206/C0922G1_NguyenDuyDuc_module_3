create database if not exists demo;
drop database if exists demo;
use demo;

create table users (
	id int(3) auto_increment primary key,
    `name` varchar(120) ,
    email varchar(220) ,
    country varchar(120) 
);
    
insert into users(`name`,email,country) 
values
	('Minh','duy@gmail.com','viet nam'),
	('Nhan','abc@gmail.com','Japan');

select * from users;

delimiter //
drop procedure if exists get_all_user;
create procedure get_all_user()
begin
select * from users;
end //
delimiter ;

call get_all_user();

delimiter //
drop procedure if exists edit_user;
create procedure edit_user(in new_name varchar(45) , new_email varchar(45), new_country varchar(45) , new_id int)
begin
update users set name = new_name,email= new_email, country = new_country where id = new_id;
end //
delimiter ;

call edit_user('Nhan','email','viet nm',4);

delimiter //
drop procedure if exists delete_user;
create procedure delete_user(in id_delete int)
begin
delete from users where id = id_delete;
end //
delimiter ;

call delete_user(2);