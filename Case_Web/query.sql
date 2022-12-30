create database if not exists query;
drop database if exists query;
use furama_resort;

select * from customer_type;
select * from customer;
select f.*, rt.*,ft.* from facility as f 
left join facility_type as ft on ft.facility_type_id = f.facility_type_id
left join rent_type as rt on rt.rent_type_id = f.rent_type_id;
select * from facility_type;
select * from rent_type;
select * from facility;
select c.*,ct.customer_type_name from customer as c left join customer_type as ct on ct.customer_type_id = c.customer_type_id ;
select * from customer where customer_id = 1;
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
    
select c.*, ct.customer_type_name from customer as c 
join customer_type as ct on c.customer_type_id = ct.customer_type_id 
where customer_name like "% Duc" and address like "% Da Nang" and email = 'thihao07@gmail.com';