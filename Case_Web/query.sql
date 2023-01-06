create database if not exists query;
drop database if exists query;
use furama_resort;

select * from customer_type;
select * from customer;
select c.*,ct.customer_type_name from customer as c left join customer_type as ct on ct.customer_type_id = c.customer_type_id ;
select * from customer where customer_id = 1;

select c.*, ct.customer_type_name from customer as c 
join customer_type as ct on c.customer_type_id = ct.customer_type_id 
where customer_name like "% Duc" and address like "% Da Nang" and email = 'thihao07@gmail.com';

delete from customer where customer_id =2;
update customer set 
customer_name = 'a',
date_of_birth ='2020-12-12',
gender = 0, 
id_card = '1212121212',
phone_number = '1231231231',
address = 'dasd',
email='asda',
customer_type_id ='2' 
where customer_id = 2;

insert into `customer` values
	('15', 'Nguyễn Thị Hào', '1970-11-07', 'woman' , '643431213', '0945423362', '23 Nguyễn Hoàng, Đà Nẵng', 'thihao07@gmail.com', '5');
    
-- Facility
select f.*, rt.*,ft.* from facility as f 
left join facility_type as ft on ft.facility_type_id = f.facility_type_id
left join rent_type as rt on rt.rent_type_id = f.rent_type_id;
select * from facility_type;
select * from rent_type;
select * from facility;

delete from facility where id = 1;

set sql_safe_updates = 0;
update facility set facility_name = 'VILLA NEW',
area = 50000,
cost = 3000000,
max_people = 20, 
standard_room = 'Vip Pro',
description_other_convenience = 'Co Nhac',
pool_area = 100, 
number_of_floor=5,
facility_free = 'xe oto',
rent_type_id = 2,
facility_type_id = 2
where facility_id = 3;

insert into `facility`(facility_name,area,cost,max_people,standard_room,description_other_convenience,pool_area,number_of_floor,facility_free,rent_type_id,facility_type_id)
 values
	('1', 'Villa Beach Front', '25000', '1000000', '10', 'vip', 'Có hồ bơi', 500, '4', null, '3', '1');


select e.*,p.*,ed.*,d.* from employee as e 
join position as p on p.position_id = e.position_id
join education_degree as ed on ed.education_degree_id = e.education_degree_id
join division as d on d.division_id = e.division_id;


delimiter //
drop procedure if exists get_all_employee;
create procedure get_all_employee()
begin
select e.*,p.*,ed.*,d.*,u.* from employee as e 
join position as p on p.position_id = e.position_id
join education_degree as ed on ed.education_degree_id = e.education_degree_id
join division as d on d.division_id = e.division_id
join `user` as u on u.username = e.username;
end //
delimiter ;

call get_all_employee();

delimiter //
drop procedure if exists delete_employee;
create procedure delete_employee(in new_id int)
begin
delete from employee where employee_id = new_id;
end //
delimiter ;
call delete_employee(2);

